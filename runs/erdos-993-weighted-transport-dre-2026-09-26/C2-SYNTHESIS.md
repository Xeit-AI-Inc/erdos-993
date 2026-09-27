# Cycle 2 Neutral Synthesis

Neutral Stage 6 synthesis, Cycle 2 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, correctly
weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly VerityOS's `verity.md` and `identity/startup-protocol.md`.
The tool display truncated the middle of `verity.md`, so I re-read that span once with a line-range read of the same file. I
loaded no other VerityOS subsystem: no memory, conversations, modules, skills, logs or decisions were opened or written.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage6/DISPATCH-SYNTHESIS.md`: SHA-256
  `f058bc1e5a3a11b691e9e54c4df9bcac50bf0da0d79afb7dedd3f5006b89e4a7`. I checked it with `shasum -a 256` before reading the
  file, and it matches the wrapper.
- **Dispatch capsule.** `control/C2-STAGE6-DISPATCH-MANIFEST.json` (stage `cycle-2-stage6-dispatch`, 12 files). I recomputed
  the inner seal as the SHA-256 of the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",",":")`, no trailing
  newline). It gives **`cc229405dccd5bfd985cdb2a998691930eb291128aee49faf4b8d4be38626a09`**, equal to the stored value.
  **12/12 members match on both SHA-256 and byte count:**

  | member | SHA-256 (prefix) | bytes |
  |---|---|---|
  | `SEMANTIC-CONTRACT.md` | `ee7ca2e2c3647555` | 17018 |
  | `SOLUTION-CONTRACT.md` | `3168e7a15baf7a7b` | 13035 |
  | `control/C2-ALLOCATION.md` | `0eb59050edcba5e6` | 12823 |
  | `control/C2-STAGE1-GATE.md` | `7d196f5361b52063` | 5052 |
  | `control/C2-STAGE5-PACKET-MANIFEST.json` | `08223c3082f6c2aa` | 8450 |
  | `control/C2-STAGE6-CONTROLLER-FACTS.json` | `ddc0754f3f1c9c31` | 12749 |
  | `control/C2-SYNTHESIS-PROTOCOL.md` | `e78d5d54f8c0af7d` | 5263 |
  | `control/PATH-CHECK-c2-stage6-dispatch.json` (0 findings) | `92a54806bd175f21` | 528 |
  | `control/SOURCE-DIGESTS.json` | `e82494df3e282ba9` | 232777 |
  | `cycles/cycle-2/stage5/adjudicators/F/ADJUDICATION.md` | `335e15e355065f9d` | 44552 |
  | `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md` | `eb0ccb003457d5dd` | 45722 |
  | `cycles/cycle-2/stage5/adjudicators/U/ADJUDICATION.md` | `b7b55430adb12399` | 46783 |

- **Stage 5 packet manifest.** Its canonical seal recomputes to
  **`3e11f843322588ab77f1ee38d3c2885dd9b94fcf5f94900803ae0dceb788975e`**, equal to the stored value. I did not hash or open
  the members it lists beyond those in my own capsule, because the critiques and dispatches it lists are outside my read
  boundary.
- **Nested seals, as reported on the adjudications' faces (not recomputed by me; the manifests are not capsule members).**
  - Stage 2 `2bf054d6…c37da`, Stage 3 `4254492f…0b2d` and Stage 4 `025bf11c…45ff`: all three adjudicators report the same
    three values, independently.
  - Adjudicator capsule seals: T `868df614…67eb`, F `fa1087f3…702b`, U `c9bd8d28…e374`.
- **Frozen sources.** I re-hashed all **981/981** files under `sources/` against `control/SOURCE-DIGESTS.json`, with 0
  mismatches. The 12 files under `sources/c1-stage7-sources/` are not in that record, and they carry their own digest file. This
  is the known non-finding CF-2.
- **Model identities (from the faces).** All three adjudicators report `claude-opus-5-5[1m]`, chartered Opus 5.5 high. The
  routes report `claude-sonnet-5`, and the critics `claude-opus-5-5[1m]` (CF6-3, CF6-P3). All are consistent with
  `C2-ALLOCATION.md`.
- **Protocol wording.** `C2-SYNTHESIS-PROTOCOL.md` is carried over from Cycle 1 in three places:
  - it says "write the Cycle 2 portfolio";
  - it says "`continue: yes` means Cycle 2 runs";
  - it says the stop gate is "not yet armed in Cycle 2".

  `SOLUTION-CONTRACT.md` §5, gate ruling 20 and CF6-P2 all say the gate is **ARMED from the Cycle 1 close**. I read the
  portfolio as the **Cycle 3** portfolio, and `continue` as "Cycle 3 runs". I rule the stop gate as armed. The outcome is the
  same under either reading (see `## Progress and stop-gate ruling`).
- **Read-boundary disclosures (this seat).**
  1. The harness put the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open
     either as a source, and nothing below relies on them. I wrote no conversation log, because the dispatch confines my
     writes to this file and to `scratchpad/c2-S/`.
  2. The T adjudication was too large for inline display. The harness saved a byte copy to a session tool-result file outside
     the run root, and I read that copy. It is the same digest-verified member.
  3. I placed temporary read copies of the F and U adjudications in `scratchpad/c2-S/` and deleted them before this write.
  4. Within `sources/`, which is granted, I ran non-recursive `ls` of `sources/` and `sources/c1-stage7-sources/`. I also
     parsed `sources/authority/CLAIM-IDENTITY.json` (the master registry: 434 identities) for the alias check and the (LB)
     statement.
  5. I ran one non-recursive `ls -la` of `cycles/cycle-2/` and `cycles/cycle-2/stage6/` to confirm that the output directory
     exists. It showed names only, and I read nothing under them.
  6. I ran no `find`, `grep`, `rg` or recursive listing. I used no network, installed nothing, ran no Lean and started no
     background job.
  7. I did not read any raw return or critique, `control/CLAIM-IDENTITY.run-local.json`, `control/controller-facts/`, `runs/`,
     `second-reads/`, `cycles/cycle-1/`, any other experiment root or any external source.
- **Controller facts** (`C2-STAGE6-CONTROLLER-FACTS.json`, CF6-0 to CF6-A2) are weighed as one more instrument, never as
  authority. Each numeric fact I could compare agrees with at least one adjudicator's own replay.

## Reconciliation

I reconcile the three adjudications claim by claim. Nothing is decided by majority vote, and I consulted no lower tier. Where two
faces disagree, I state the disagreement and the ground on which I resolve it.

**R1. The three orientations agree on every headline and flag.** T, F and U each return `still_open`, material progress yes,
orientation plateau no and `headline_resolved: no`. None of the three found a (CUT) candidate: on no eligible row of any
instrument is there a mixed-relation deficit.

**R2. The locus of the difficulty: agreement, with T sharpening F.** F (Lean readiness (c), and its next-route obligation) repeats
the intake's smallest lemma: "a switch-capacity statement for every `X ⊄ X_sec`, first at `CB(8,86)/460`". T narrows this
object in two steps:

- First, sector Hall under (D) ∪ (S) now holds for every `X ⊆ X_sec` at every eligible `p` of the three rows (T-E7,
  `computer_assisted`, STATED).
- Second, by the competition map (T-E3), the remaining obligation is exactly two pieces:
  - (O1): Hall on the non-sector world `R0 ∪ S ∪ V ∪ O`, whose core is (CF-HALL) on the choke forest `T' = T − {r, s, v}`;
  - (O2): the coupled allocation for families that meet `sec`, a positive-weight V source and a positive-weight S or O source
    together.

There is no conflict: T's statement is a refinement of F's. I adopt T's form as the record of the smallest unproved obligation
at these rows. It is conditional on the second reads of T-E1, T-E3 and T-E7.

**R3. The three orientations' next-cycle plans for the three `CB(8,·)` rows are partly incompatible, and I resolve it.** Three
plans target the same rows:

- F's `C3-F-01` computes the exact full mixed max-flow at `CB(8,86)/460` and beyond, using U2's equitable lift "if admitted"
  or `S_d ≀ S_m` orbits.
- U reports that both critics give identical per-layer source-orbit counts, for example `≈ 3.27·10^37` at 86/460. On the
  tested `d ≥ 2` rows, colour refinement equals the orbit partition (bounded; refuted only at `d = 1`).
- T plans an analytic class-level proof of (O1)/(O2).

**Ruling.** On U's evidence, F's plan as written cannot finish in one cycle: it needs either a materialized orbit quotient or a
coarser equitable quotient, and the tested `d ≥ 2` evidence disfavours the latter. The three plans are complementary, not
redundant, once each takes its own instrument class:

- T (primal, analytic): prove (O1) and (O2).
- U (primal, certificate): a product-form rational flow or an LP-dual potential, verified by summation.
- F (dual, adversarial): exact deficits of `Aut`-invariant class-union families, computed in closed form through branch-type
  generating functions and aimed at the families that T-E3 leaves possible (those meeting `sec`, V and S/O together).

This split is written into `## Next-cycle portfolio`.

**R4. `X_min` or `X_max` as the invariant deficient witness.** This is U-internal: U1 proposed `X_max`, and both critics
proposed `X_min`. U resolved it by proof and replay: `X_max` always contains every tag-free source (U-E4), so the witness is
`X_min`. No other orientation touched it. I adopt `X_min`, and it fixes the C2-LA1 statement below.

**R5. Whether the equitable lift is coarser than orbits on CB networks.** C-U2-T says no, and C-U2-F says yes at `d = 1`. U's
replay settled it: equitable partitions are much coarser at `d = 1` (CB(1,7)/10: 5 + 6 classes against 57 + 90 orbits), and
equal to the orbits on the tested `d ≥ 2` rows. I adopt U's narrowed reading. It is bounded, and untested at `d ≥ 6`. It bears
on R3.

**R6. U2's equitable lift and (LIFT).** U2 framed its Candidate 1 as "not (LIFT)". Both U critics and the U adjudicator correct
this: every orbit partition of a group that preserves the relation and the weights is equitable. So Candidate 1 **strictly
generalizes** (LIFT)'s lifting direction, and it contains (INV)'s quotient clause as its orbit special case (U-E3). T and F used
(LIFT) and (INV) only at their registered grades. F's value-exactness argument for quotient flow values (C-F1-T's argument,
verified by F) is the value form of (INV) together with (LIFT)'s converse, which is consistent with U. There is no
disagreement. The registration must carry the partial alias (see `## Registrations`).

**R7. Smallest eligible CB row and "first" claims.** All three faces agree:

- The smallest eligible CB row is **CB(1,7)/10** (`n = 24`).
- The eligibility window top is `⌊2α/3⌋`.
- The first sector-deficient eligible CB rows are `d = 8, m = 86` (`n = 1465`) and `d = 7, m = 109` (`n = 1638`), with none at
  `d ≤ 6, m < 400` (U).
- No eligible CB row with `n < 1465` has a deletion-deficient root-plus-arm sector (F).
- Every priority word ("first exact full-network flow", "switch arcs first load-bearing at CB(8,86)") is narrowed to the CB
  family or struck.

My arithmetic replay (`s_checks.py`) confirms that on each of the three windows the P8 criterion `3p < 2dm + 5` fires at the
first eligible rank only (460, 476 and 492).

**R8. Why switch-necessity is a pendant-pair (`t = 1`) phenomenon.** T (via C-T2-U) and F (C-F1-T's A-F1-5 and A-F1-6) reach
consistent conclusions by different means:

- T-E4 shows that a root-plus-arm sector deficit lives only on the weight-1 `(t+2)`-ary cube. That cube is deletion-deficient
  iff `(t+2)(p−1) < (t+1)(dm+1)`, and (LB) excludes this at eligible ranks for every `t ≥ 2`.
- F finds the `{u_i, c_i1}` sector threshold never above P8's, and the PPC weight-one sector margin at least +7 to `n ≤ 600`.

Both point the same way: every known switch-necessary sector is a pendant-pair (`t = 1`) sector with very many pairs. My replay
confirms two pieces of arithmetic:

- the corollary identity `(t+2)(n+4) − 4(t+1)(M+1) = (t+1)(t−2)M + tm + 2m + 3t + 10`, with `n = 3 + m + (t+1)M`, for
  `d, m < 30`, `t < 8`;
- that the `t = 1` threshold equals P8.

This is a consistent structural reading. It is not a theorem about all trees.

**R9. The selector.** Only F addressed it. The selector reduction (F-E8) shows that a selector-binding eligible row forces one
of two cases:

- `x(T − v) ≥ x(T) + 3`; or
- a strict descent of the tree `T − v` before `p` with `Δ_p(T − v) ≥ 0`.

When `Δ_p > 0`, the second case is a tree whose independence sequence is not unimodal. By the registered
`E993-INDEPENDENCE-UNIMODAL-IFF-NORECOVERY`, that would be a counterexample to Erdős #993 itself. The residual non-#993 cases are
therefore `x(T−v) ≥ x(T) + 3`, or a plateau `Δ_p(T−v) = 0` after a strict descent.

T and U both carry `F` explicitly and never assume `F` = all leaves. U notes that `F_p` is `Aut`-invariant regardless (and
C-T1-U F11 says the same). This agrees with F's recommendation that the selector stay explicit in every (HALL) statement. There
is no disagreement.

**R10. Non-falsifiable checks (ruling 17).** Three routes had non-falsifiable checks:

- T1: WID on five rows, computed from shared polynomials;
- T2: §7 never asserts `S`;
- U2: `S` set equal to `supply − capacity`.

In each case the strike is on evidential standing only. Every surviving number is re-backed from independent sides by critics,
adjudicators and the controller (CF6-4). No number was found wrong on fidelity grounds, with one exception: U2's RETURN
transcription of CB(2,5)/10 (275920/412400) is **struck**. The correct values are 259980 / 396460, from four instruments.

**R11. No revived refuted mechanism.** All three faces check the fence of `SOLUTION-CONTRACT.md` §3.2 and find it clean:

- Every deletion-only statement uses the active weight on a stated sector object, and names on its face why it is not
  `E993-R23-LITERAL-DELETE-ONLY-HALL`.
- The injection `B ↦ B − v` in T-E3 (R-i) is a weight-preserving map on a whole class. It is not
  `…PER-LEAF-DOWN-MAP-INJECTIVITY`, and it is not the C6-F4 own-support unit-capacity rule.

I concur.

## Exact established results

Every statement uses the literal active weight `w_F` (a tag `v ∈ F ∩ B` counts iff `(B ∖ {v}) ∩ W_v ≠ ∅`), the literal
relation (D) ∪ (S), and `F = F_p(T)` fixed at the original rank `p`, with `x` computed through rank `α`. Every numbered row has
`supply − capacity = S` asserted from independent sides by at least one instrument. "STATED" means the result was first stated at
a review stage (Stage 4 or 5) and needs an isolated second read before registration (ruling 18; CF6-P2).

**Theorems at `proved_informal`**

| # | Statement (exact scope) | Attribution | Standing |
|---|---|---|---|
| S1 | **Ternary-cover second eigenvalue (node n1).** For `N ≥ k ≥ 2`, the cover operator `BBᵀ` between ranks `k` and `k−1` of `{0,1,2}^N` has `λ₁ = 2k(N−k+1)` (simple, eigenvector `𝟙`) and `λ₂ = 2(k−1)(N−k+1)` on `𝟙^⊥` on both layers, with multiplicity exactly `N`. Quadratic form of record: `Σ_{g∈L_{k−1}}(Σ_{h⋗g} f h)² ≤ 2(k−1)(N−k+1)·Σ_{h∈L_k} f(h)²` whenever `Σ f = 0`. Abstract poset; no tree, weight or eligibility. | C-T1-F (F1) and C-T1-U (R4), critic-attributed jointly; T1 supplied the attaining flip-character family | STATED. Three instruments: an exact LDLᵀ, an annihilating polynomial, and the T adjudicator's PSD/nullity check on 24 operators. |
| S2 | **Flip-character eigenvectors.** `χ_J` with `|J| = r ≤ k−1` is an eigenvector of `BBᵀ` with eigenvalue `2(k−r)(N−k+1)`. | T1 | Retained by both critics and the T adjudicator. It is not an eigenbasis: T1's "completeness" is false as posed. |
| S3 | **CB competition map and reductions.** Scope: `CB(d,m)`, `F` = all leaves, every `p`. (R-i): if `X ∩ (S ∪ O)` has no positive-weight member, then `Hall(X ∩ sec) ⇒ Hall(X)`. (R-ii): if `X ∩ V` has no positive-weight member, then `Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X)`. The supporting facts: every positive-weight target of a sector source contains `v`; every target of an R0, S or O source is `v`-free; a V source has exactly one `v`-free target, `B − v`, of equal weight. | C-T1-F (F4(i)) and C-T1-U (R7), critic-attributed | STATED. The T adjudicator brute-forced the supporting facts on eight small `CB(d,m)` at every rank. |
| S4 | **`CBstar` sector deletion-deficit theorem.** Let `T = CBstar(d,m,t)` with `d, m, t ≥ 1`, `M = dm`, `Q = {r, v}`, `p ≥ 2` and `k = p−1`, and let `F ⊆ leaves` with `v ∈ F` and `P ⊆ F`. Then `max_{X ⊆ S^Q_{p+1}} (Σ_X w_F − Σ_{N_D(X)} w_F) = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`, where `N_D` is the deletion neighbourhood in all of `I_p`. **Corollary:** if `t ≥ 2` and `x(T) + 2 ≤ p`, no subfamily of the sector is deletion-deficient, so (HALL-COND) holds on every sector subfamily under (D) ∪ (S). The corollary's input is (LB), `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, VERIFIED `formally_verified`, used as `n ≤ 4x`. | C-T2-U, critic-attributed; inputs T2's T-A and T-D-R1 | STATED. The T adjudicator matched the formula against exact deletion-only max-flow deficits on 11 configurations. My replay checks the corollary identity. `F = {v}` is excluded, and it is deletion-deficient at some non-eligible ranks. |
| S5 | **Whole-sector balance L1**, for `F = a{v} ∪ bP` on `CBstar`, and **Proposition P1** (`t = 2`): (i) `x ≥ M+1`; (ii) the whole sector is non-deficient unless `F = {v}`. | C-T2-F, critic-attributed | STATED. S4 subsumes P1(ii); P1(i) is independent. |
| S6 | **T2's own lemmas, at narrowed scope.** T-A: the sector generating functions, under the hypotheses `F ⊇ {v} ∪ P` and uniform `t` on the `CBstar` sector. T-D-R1: q-ary cube normalized matching `k|X| ≤ q(M−k+1)|∂X|`, uniform `t` only (it is NM at `q = 2`). T-E: the choke-switch image weight, counted as arcs, not targets. T-C: unweighted single-star NM failure. | T2 | Retained by both critics and the T adjudicator. |
| S7 | **`G_k` family.** Let `G_k` be the explicit tree on `3k+5` vertices. Then `α(G_k) = 2k+3`; `I(G_k)` has the closed form `(1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`; `x(G_k) ≤ k+1` for every `k ≥ 2`; and `(G_k, k+3)` is eligible iff `k ≥ 3`. Also `α(T(m,k)) = 2m+k−1`, and `T(m,2) − ℓ_1 ≅ T(m,1)`. | F2 (seat); the isomorphism is critic-level | Retained by both critics and the F adjudicator. The literal "`x(G_k) = k+1` on 305 instances `k = 0..304`" is struck, since `x(G_0) = 2` and `x(G_1) = 3`. |
| S8 | **Lemma F:** `Δ_{k+3}(G_k − 3) < 0` and `Δ_{k+3}(G_k − 4) < 0` for every `k ≥ 1`. **Lemma U:** `A ∈ I_p` has an in-arc of (D) ∪ (S) iff `A` is not maximal, or some `u ∈ A` has two non-adjacent neighbours whose only neighbour in `A` is `u`. This re-derives the second-read-confirmed P10. **Corollary G:** for `k ≥ 3`, `p = k+3` and `F = F_p(G_k)`, the row is eligible, `{3,4} ⊆ F`, `A_k = {0,3,4,b_1..b_k}` is the unique target with no in-arc, `w_F(A_k) = 2`, and `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` exactly. | C-F2-U and C-F2-T (two independent proofs of each lemma); the composition is critic-attributed, with F2's S7 as input | STATED. The F adjudicator verified it at full scope. The alias check is done here (see Registrations). |
| S9 | **Selector reduction.** A selector-binding eligible row `(T, p, v)` forces either `x(T−v) ≥ x(T)+3`, or a strict descent of `T − v` before `p` with `Δ_p(T−v) ≥ 0`. With `> 0`, that is a non-unimodal tree (R9). | C-F2-U (F6) and C-F2-T (F-5) | STATED. Elementary. |
| S10 | **Invariant positive deficient family.** For any finite simple graph `G` and `p : ℕ`, with `F = favorableLeaves G p`: if `¬ WeightedHall G F p`, then `X_min` (the least maximizer of `φ = supply − cov`) is contained in `I_{p+1}`, is `Aut(G)`-invariant, has only positive-weight members, and is deficient. Corollary: WeightedHall holds iff it holds on every `Aut(G)`-invariant family. | U1 (parts (a) and (b): equivariance and supermodularity); C-U1-T and C-U1-F (the closing theorem, derived independently); the mathematics is the registered (INV) key | **Kernel-checked in scratch** (see S13). This is the invariant-family half of the registered (INV) key. |
| S11 | **Equitable-partition flow lift** (U2 Candidate 1, framing corrected). Take a finite bipartite relation with integer supplies and capacities constant on classes and two-sided local regularity. A saturating integral flow exists iff a saturating quotient flow exists. **Hall-form converse (class-union Hall):** for a union `X` of source classes, `N(X)` is exactly the union of the target classes joined to it. Hence (HALL-COND) for every `X` ⇔ Hall on class unions ⇔ quotient Hall. This strictly generalizes (LIFT)'s lifting direction, and it contains (INV)'s quotient clause as its orbit special case. | U2 (the lift); C-U2-T and C-U2-F (the Hall-form converse, jointly, independently) | STATED. Two critic re-proofs, and the U adjudicator verified it. |
| S12 | **`X_max` contains every tag-free source**, for any graph, any `p` and any tag set of degree-one vertices. So `X_max` is never the positive witness. | C-U1-F (F-1) and C-U1-T (finding 2) | STATED. It is structural, and it fixes the C2-LA1 statement. |

**Kernel-checked scratch (no grade until a governed award; R29-N-12)**

- **S13.** U1's `INV.lean` (`174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9`) has 30 proved declarations (23
  `lemma`, 7 `theorem`) and 9 `def`. C-U1-T's `CritINV.lean` (`e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb`)
  has 20 proved declarations and 2 `def`. C-U1-F's `CritAdvance.lean` (`f59126da…`) has 12 proved declarations and 1 `def`, and
  is an equivalent alternative.
  - All build sorry-free on the carried `Main.lean` (`86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`)
    against the pinned Mathlib `905b9581…` (toolchain `v4.32.2`).
  - Axioms are within `{propext, Classical.choice, Quot.sound}`, per three independent builds: U1's own compile, the critics'
    compiles, and the U adjudicator's replay.

**`computer_assisted`**

- **S14. Sector Hall under (D) ∪ (S) at `CB(8,86)`, `CB(8,89)` and `CB(8,92)`.** It holds for every `X ⊆ X_sec` at every
  eligible `p`.
  - At the first rank, it follows from the Lemma C(ii) composition with S1. The exact margins are 6863.256, 11209.544 and
    18328.277, from three instruments, with `x₀ = 1/460, 1/476, 1/492` and `c = 7/460, 1/68, 7/492`.
  - At every other rank, it follows from NM/P9, since `3p ≥ 2dm + 5` there.
  - Rows: `n` = 1465, 1516, 1567; `α` = 775, 802, 829; `x` = 458, 474, 490; windows [460,516], [476,534], [492,552]; `|F|` =
    689, 713, 737 (all leaves).
  - Attribution: the composition is critic-attributed to C-T1-F; the numerics are T1's. STATED; it needs the second reads of S1
    and of this composition. It is a finite result on three instances.

**`bounded_computation` records (never proof)**

| Row | `n / α / x` | `\|F\|` | Supply / capacity / `S` | Mixed | Deletion-only | Instruments |
|---|---|---|---|---|---|---|
| `PPC(7,2)/12` | 35 / 18 / 10 | 14 (all leaves) | 7,801,728 / 11,469,576 / −3,667,848 | saturates | saturates | 4 (C-F1-T ×2, C-F1-U, F adj.); controller layer weights agree |
| `CB(4,4)/14` | 39 / 21 / 12 | 17 | 33,933,216 / 59,268,576 / −25,335,360 | saturates | saturates | 2, plus CF6-F5 on the weights |
| `CB(1,7)/10` | 24 / 15 / 8 | 8 | 29,190 / 58,002 / −28,812 | saturates | saturates | 3, plus the Cycle 1 controller fact |
| `CB(2,5)/10` | 28 / 16 / 8 | 11 | 259,980 / 396,460 / −136,480 | saturates | saturates | C-U2-T, U adj., CF6-U1 |
| `G_3/6`, `G_4/7`, `G_5/8` | — | ⊇ {3,4} | `G_3` 253/527/−274; `G_4` 1542/2735/−1193; `G_5` 8875/14196/−5321; gap 2 on each | saturate | saturate | 4 / 3 / 3 |
| `T(4,2)/6`, `T(5,2)/7`, `T(6,2)/8` | — | 5 at `T(4,2)` | `T(4,2)` 202/454/−252; `T(6,2)` 6350/11155/−4805; gap 2 | saturate | saturate | 4 / 3 / 2 |
| `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` | as S14 | all leaves | exact integers of 330, 342 and 353 digits (U face; `scratchpad/c2-adj-U/adj_run_RESULT_D.json`); `S(CB(8,92),492)` equals the frozen `RESULTS.json` aggregate | not computed | not computed | three independent `S`-side instruments |

Further bounded records:

- The P8 screen: exactly three sector-deficient CB rows with `n ≤ 1600`.
- The first sector-deficient CB rows by `d`, as in R7.
- PPC eligibility: 298 pairs on F1's domain; 352 pairs (1,530 rows) over `n ≤ 300`.
- The PPC sector margin is at least +7 to `n ≤ 600` (C-F1-T only).
- 53 further bare-caterpillar rows to `n = 42` (C-F1-U only).
- The selector binds on no computed row:
  - 515 eligible rows to order 14;
  - 588 isomorphism-class rows, orders 11–37;
  - the rooted exploration to order 16.

  The shifts `x(T−v) − x(T)` are always in `{0, −1}`.
- Whole-class balances on the three `CB(8,·)` rows: O-class slack about 1.0–1.7% of `W'_p` (C-T1-U, replayed by T).
- `X''` shadow ratios 20.51 and 36.01 at `CB(8,108)/577` and `CB(7,144)/673`.
- C-T2-F's `CBstar` re-sweep: 204,265 rows.
- Colour refinement against orbits (R5).
- Corrected `Δ_x` digit counts: 326, 337, 349, 408, 479.

**Switch arcs have not been load-bearing on any computed tree row, in Cycle 1 or Cycle 2.** Every full-row flow computed so far
saturates with deletion arcs alone.

## Refuted or narrowed mechanisms

**Refuted or struck at route level (no registered key moves):**

- **T-B**, T2's whole-sector deficiency criterion "deficient iff `𝒲_k > 𝒲_{k−1}`", is **refuted** for `t ≥ 2`. The reasons
  are unreachable maximal states and out-of-sector deletion targets of weight `starweight(B)`. CF6-T3 reproduces the false
  positive at `CBstar(2,2,2)`, `p = 6`. At `t = 1` it is P8.
- **T2's §7 is struck as evidence.** It applied T-B, never computed `F_p`, and asserted no `S`. Its conclusion stands on S4 and
  S5 instead.
- **U1's plan to take `X_max` as the invariant positive witness is refuted** (S12; on `P_3 ⊔ K_{6,3,3,3}` at `p = 4`, 51 of
  `X_max`'s 71 members have weight 0).
- **U2's Candidate 2 headline is struck.** The claims "any equitable partition must resolve the full 54-type histogram" and
  "genuine minimal granularity" fail at `d = 1`, and are irrelevant to lifting, since the witnesses have zero supply. The
  narrowed witness (marginal totals are not equitable; configurations A and B on CB(5,2)) is `bounded_computation`.
- **T1's non-sector `proved_conditional` is struck to open.** NM and P9 speak of one constant-weight sector, and per-sector
  Hall does not compose.
- **T1's mixed-case paragraph is replaced by S3.** The inequality it displays is inclusion–exclusion. The gap is a set
  inequality `cap(N(X₁) ∪ N(X₂)) ≥ w(X₁) + w(X₂)`.
- **T1's "switch-capacity margins 6,863×–18,328× the raw deficit" is struck.** These numbers are the internal overlap ratio of
  the Lemma C(ii) composition.
- **The brief's selector implication is rejected as a proof route**, because it lacks descent persistence (S9). The claim was
  "`x(T−v) ≤ x(T)+1` with eligibility gives favorability".

**Narrowed:**

- T2's star-forest scope is narrowed to uniform `t` in `CBstar`.
- The (SW) template becomes a remark with no object on the `CBstar` sector.
- T-E is narrowed to choke switches. Every sector source also has `s`-switches and, for `t ≥ 2`, support switches.
- F1's CB claim is narrowed to the root-plus-arm sector.
- F1's heterogeneous family contributed zero heterogeneous eligible rows, with counts 10/3/1.
- F1's caterpillar extension adds `n = 20, 21, 24` only.
- F2's Part D count becomes 588 classes, orders 11–37.
- C-U2-T's "the equitable lift gains nothing over orbits" is narrowed to the tested `d ≥ 2` rows.
- The obligation (b) diagnosis becomes the small-set range `|X|/R_k < θ`, with θ = 6.643e−9 and 2.606e−15. Here `k² < λ₂`, so
  no spectral route exists.

**Certification literals struck** (evidential standing; no surviving number depends on them):

- T1: "six `(N,k)` pairs up to (6,4)", "every `J`", Jacobi "converged", and the `Δ_x` digit column. Also the non-contract
  grade words "`formally_verified`-grade", `proved_conditional` and `bounded_evidence`.
- F1: "23 WID rows" (backed count 13), the caterpillar-sweep digest (it hashes wall-clock time), "compared term-by-term:
  identical", and the fixed-point provenance.
- F2: the (WID) status misreport, and "no full process listing".
- U1: the declaration counts, "all proved", the mixed-numbering entry lists, and "per C1-LA4" (no such r30 award exists).
- U2: "brute-force cross-checked on four instances", "no eligible CB with `n ≤ 48`", `C(m+53,53)` as an orbit count, the
  "every module sits beside it" replay claim, and the hard-coded `|F| = dm + 1`.

**Fences hold.**

- Mechanism ≠ aggregate: nothing bounds `S(T,p)` beyond what (WID) already identifies.
- Finite ≠ universal: S14 and every table row are finite.
- No refuted key of §3.2 is revived (R11).
- No closed region is re-proved: the high tail, the order bands, and the `T_m`/spider/path-star theorems. T-D-R1 at `q = 2` is
  credited to NM.
- No census value enters a proof.
- There is no RTree wording.
- (LIFT) never supplies quotient feasibility, and `D, C ≥ 0` is never used.

## Headline verdicts

| Target | Verdict at exact grade | Scope note the controller should add |
|---|---|---|
| **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | **still open**. Not proved at any scope that contains a switch-necessary row, and not refuted: no (CUT) and no candidate. **Smallest unproved lemma** (instance level, the first place (HALL) can fail): at `CB(8,86)/460`, the non-sector obligation (O1), whose core is **(CF-HALL)**: (HALL-COND) for every `X ⊆ O ≅ I_{p+1}(T')`, where `T' = T − {r,s,v}` is `m` disjoint spiders (a choke with `d` pendant paths of length 2). Together with it, the coupled allocation (O2) for families meeting `sec`, a positive-weight V source and a positive-weight S/O source (R2). The same obligations stand at 476 and 492. *Structural level:* no parameter-uniform switch-capacity or self-covering statement covers any infinite family that contains a switch-necessary row. *General trees:* whether a deletion-deficient subfamily exists at orders 20–1464 of any shape is unknown. | Cycle 2, after second reads SR-C2-1/2/3. Sector subfamilies are Hall-complete under (D) ∪ (S) at the three switch-necessary `CB(8,·)` rows (`computer_assisted`) and on every `CBstar(d,m,t≥2)` sector at eligible ranks (`proved_informal`, under `F ⊇ {v} ∪ P`). The remaining obligation at the three rows is (O1)/(O2). Switch arcs have never been load-bearing on a computed row. After SR-C2-4: on `G_k`, `k ≥ 3`, (HALL-COND) at `X = I_{p+1}` has exactly 2 less room than the scalar target, so the mechanism is strictly stronger than the aggregate on infinitely many eligible rows. The selector stays explicit (S9). |
| **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | VERIFIED `formally_verified` (C1-LA1), unchanged and not re-awarded. Every Cycle 2 instrument's assertion holds from independent sides. | None. |
| `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` | VERIFIED `formally_verified` (C1-LA2), unchanged. | None. |
| (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` | VERIFIED `proved_informal`, unchanged as a key. Its invariant-family half is kernel-checked in scratch (S10, S13) and funded as C2-LA1. | On C2-LA1 closing: "the invariant-family half (`¬Hall ⇒` an `Aut`-invariant, positive, deficient `X_min`; Hall ⇔ Hall on invariant families) is `formally_verified` at key `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`. The quotient clause remains `proved_informal`. Its orbit case is also an instance of S11 (after SR-C2-5). The witness is `X_min`, not `X_max`." |
| (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` | VERIFIED `proved_informal`, unchanged. There is no Lean text anywhere in the run. | After SR-C2-3: "T-D-R1 (T2): the q-ary cube generalization `k\|X\| ≤ q(M−k+1)\|∂X\|` at uniform `t`; biregularity fails for heterogeneous `t_i`." |
| **Outcome-B lemmas (Cycle 2)** | *Proved (`proved_informal`, STATED):* S1 (spectral node), S3 (CB reductions), S4 (NMP-type: the exact `CBstar` sector deletion deficit and the `t ≥ 2` corollary), S5, S8 (Corollary G), S9, S11 (the equitable lift and class-union Hall; INV/LIFT-type), S12. *Proved by route and retained:* S2, S6, S7. *Refuted at route level:* T-B, the `X_max` witness, and Candidate 2's headline. None is a registered key yet. | See `## Registrations`. |
| **(CUT)** | **None.** No tuple `(T, p, X)` satisfies SEMANTIC-CONTRACT §1.2 on any instrument. Deficits appeared only at non-eligible validation ranks. | None. |
| **`CB(8, 92)` record** (`R30-CB-RECORD`) | Sector Hall at every eligible `p` is complete once S1 is proved. `p = 492` rests on S1 in place of the cited spectral node, at `computer_assisted`. Every `p ≥ 493` is `proved_informal` via NM/P9. The same holds at `CB(8,86)` and `CB(8,89)` (S14). New exact aggregates for 86/460 and 89/476. `\|F\| = dm + 1` (all leaves) from a derived selector. `Aut = S_d ≀ S_m`. Smallest eligible CB row: CB(1,7)/10. | Record update after SR-C2-2 (see Registrations). |
| **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN**, untouched, with no status transfer. A proof of (HALL) at full scope would imply it: C1-LA2's `formally_verified` theorem (WeightedHall ⇒ `aggregate ≤ 0`, through (WID)) composed with a (HALL) award in WeightedHall form, or in flow form through the formal HALL⇒FLOW/FLOW⇒SIGN companions. The certificate is that composition, registered as a scope note with its own certificate. A restricted-scope Hall theorem implies the aggregate only on its own scope. | "Cycle 2: unchanged; no (HALL) proof at any scope containing a switch-necessary row." |
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, TREE, FOREST, TRANSFER | Unchanged. Nothing in Cycle 2 bears on them (fence §3.1). | None. |
| **Erdős #993** | **Unchanged by construction.** A (HALL) refutation would never touch it. A (HALL) proof moves only the lower-region aggregate. S9 notes that one selector-binding sub-case would itself be a #993 counterexample, but no such row exists on any instrument. | None. |

**Fidelity corrections to predecessor records made or surfaced this cycle.**

1. **Lemma C at `CB(8,92)/492`.** The Cycle 1 record carried it at `computer_assisted` "with the spectral node (n1) cited". The
   node is now proved (S1, critic-attributed; STATED). The record should cite S1 after SR-C2-1, not the SR-SECTOR citation.
   This is an upgrade of standing, not an error.
2. **The spectral node's supporting claim.** "Completeness of the flip-character eigenbasis" is false as posed: the span is
   `Σ_{r<k} C(N,r)`, less than the layer dimension. A predecessor text that relies on that phrasing must be read through the
   isotypic decomposition `⊕_J V_J`.
3. **`Aut(CB(d,m)) = S_d ≀ S_m`**, of order `(d!)^m m!`. The notation `S_m ≀ S_d` in any Cycle 1/2 text is a notational slip.
   `CB(1,1) = P_6` has an extra reflection, which is harmless at `m ≥ 86`.
4. **Open fidelity question (not a correction).** The allocation's standing "on every computed eligible row, `F_p(T)` is the
   whole leaf set" covers the 195,683 rows at orders 11–19. F2 reports that SR-REACH did not rerun the whole-leaf check at
   orders 17–18, and SR-REACH is outside my boundary. The controller should confirm the provenance of that sentence for orders
   17–18 before the next cycle cites it.
5. The standing errata R30-E-a (smallest eligible order 11, not the SEMANTIC-CONTRACT's 13) and R30-E-b (the active test)
   remain in force. No Cycle 2 instrument violated either (CF6-1).

## Lean awards

Rule applied: award only stable declarations with closed dependency DAGs at their exact scope. A companion on the face registers
`proved_informal` (R29-N-12). A key that needs `formally_verified` gets its own group.

### C2-LA1 — FUNDED for Cycle 2 Stage 7 (contract-ready)

- **Key (new, separate; restricted scope):**
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`. On closing it registers VERIFIED
  `formally_verified` at exactly the statement below. It never closes the full (INV) key.
- **Terminal theorem (one `theorem`):** `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall`.

  ```lean
  theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
      (h : ¬ WeightedHall G (favorableLeaves G p) p) :
      ∃ X ⊆ indepFamily G (p + 1),
        (∀ γ : G ≃g G, famMap G γ X = X) ∧
        (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
        ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
            activeWeight G (favorableLeaves G p) A <
          ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
  ```

  Here `famMap G γ X := X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, _⟩`, which is a NEW `def` and part of the statement's
  vocabulary. I choose the cut form as terminal because it is the node the allocation named. It implies the iff.
- **Companions on the face** (`lemma`, no certificate of their own; each registers `proved_informal` only):
  - `weightedHall_iff_invariant`: WeightedHall for `F_p(G)` ⇔ Hall on every `Aut(G)`-invariant `X ⊆ I_{p+1}`;
  - `weightedHall_iff_phi_nonpos`;
  - `favorableLeaves_map_aut`, `activeWeight_map_aut` (with its leaf guard `hF`, which is load-bearing), `transportRel_map_aut`;
  - `phi_supermodular`, `canonMin_isMaximizer`, `canonMin_famMap`, `canonMin_pos`, `filter_eq_covered`.
- **Hypotheses.**
  - Finiteness only: `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`.
  - No `IsTree` (neither connectivity nor acyclicity), no eligibility, and no `p ≥ 1`.
  - `F` is the carried `favorableLeaves G p`, fixed at rank `p`.
  - `γ` ranges over graph automorphisms `G ≃g G`.
- **Fences on the face.**
  - Graph-generic.
  - It is not a Hall theorem, a flow or a cut, and it asserts nothing about whether deficient families exist.
  - It has no sign content, and says nothing about `S(T,p)`, the primary aggregate, (HALL) or Erdős #993.
  - There is no quotient step and no RTree wording.
  - The witness is `X_min`, not `X_max` (S12).
- **Excluded conclusions** (must not appear in the certificate, the key statement or the scope note):
  - (INV)'s quotient clause, "⇔ quotient Hall" (the (LIFT)/S11 direction), which stays `proved_informal`;
  - any statement that `X_max` is a positive witness;
  - any tree-specific or eligibility-specific strengthening;
  - any Hall, flow or cut conclusion;
  - any claim that the full (INV) key is `formally_verified`.
- **Attribution (on every face).**
  - Codex (GPT-6 Astra/Sol/Luna): the transport mechanism, the active-tag weight and relation, the lower-region run, and (LIFT).
  - r30 Cycle 1: the (INV) mathematics as registered. C1-LA1: the eight frozen `E993Transport` definitions.
  - The first-interior run (Codex): definition entries 1–18. r26/r24/r25: the definition layers.
  - r30 Cycle 2: U1 (Claude Sonnet 5) for parts (a) equivariance and (b) supermodularity/maximizer lattice; C-U1-T and C-U1-F
    (Claude Opus 5.5) for the closing theorem, derived independently; the U adjudicator for the replay and the `X_min` ruling.
- **Carried fragments (byte-identical transport only).** C1-LA1's `LeanProof/Main.lean`,
  `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` (45,610 B), carried whole. It contains:
  - the first-interior definition entries it carries (whose header lines the U adjudicator matched verbatim to the frozen
    first-interior `Main.lean`, `8d864da2…`);
  - the eight `E993Transport` definitions (`indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`,
    `transportRel`, `IsSaturatingFlow`, `WeightedHall`), which match the frozen `sources/c1-stage7-sources/U2-Main.lean`
    (`110c2751…`) verbatim;
  - entry 24 `isGraphLeaf_of_mem_favorableLeaves` (C1-LA1 numbering, per both critics).

  Stage 7 re-derives the exact entry list in **C1-LA1 numbering**, with name and fragment digest for each. U1's mixed-numbering
  lists are struck.
- **New declarations the formalizer must author** (their compiled scratch text may be the starting point; each becomes a NEW
  declaration in namespace `E993Transport`):
  - From U1's `INV.lean` (`174d84c3…`), the terminal theorem's cone:
    - part (a): `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut` and their supporting lemmas;
    - part (b): `phi`/`supply`/`cov`, `cov_submodular`, `supply_modular`, `phi_supermodular`, `isMaximizer_inter`,
      `canonMin_isMaximizer`, and the domain and maximizer definitions.
  - From **C-U1-T's `CritINV.lean`** (`e6cbd7e6…`), my choice because it is strictly more complete: `setEmb`, `famMap`,
    `mem_indepFamily_map`, `covered_famMap`, `activeWeight_map_of_invariant`, `supply/cov/phi_famMap`,
    `famMap_mem_domain/maximizers`, `canonMin_famMap`, `covered_mono`, `canonMin_pos`, `filter_eq_covered`,
    `weightedHall_iff_phi_nonpos`, `weightedHall_iff_invariant`, and the terminal theorem.
  - **Do not carry C-U1-F's `CritAdvance.lean` alongside it:** the names collide. It is the fallback if `CritINV.lean` fails
    fidelity.
  - Declarations outside the cone (for example `canonMax_*`) may be pruned.
- **Repairs and checks the adjudications require before the award.**
  1. The controller binds `Main.lean` `86b59c6c…` to the C1-LA1 kernel receipt under `runs/` (CF6-A1; ruling 14). No
     adjudicator could see that receipt.
  2. Diff the binder text against the registered (INV) statement and the Cycle 1 award-group-2 draft (outside every Stage 5
     grant).
  3. Confirm that the positivity conjunct is proved for `X_min`.
  4. Confirm that the classical-instance difference (`open Classical in` inside `WeightedHall`; `open scoped Classical` in the
     new files) is bridged instance-agnostically, as `filter_eq_covered` does.
  5. Check `famMap` for fidelity: it must be the image under `γ` of each member set, and nothing wider.
  6. Run `#print axioms` on the terminal theorem against the build log. The allowed axioms are `propext`, `Classical.choice`
     and `Quot.sound`. No `sorry`, `admit`, `native_decide`, `axiom`, or `decide` over an enumeration is allowed.
  7. Build discipline: manual symlink of `.lake/packages` to the pinned shared Mathlib; `cd` into the project before any
     `lake`/`lean`; no `lake update` and no `lake clean`; any kill by literal PID only.
- **DAG (closed; every node compiled):**
  - (a) equivariance of `I_j`, `F_p`, `w_F` and `N(·)`, so `φ` is `Aut`-invariant;
  - (b) `cov` is submodular and `supply` is modular, so `φ` is supermodular, maximizers are closed under `∪`/`∩`, and `X_min`
    is a maximizer;
  - (c) `γ·X_min` is a maximizer, so `X_min ⊆ γ·X_min`, and equal cardinality gives invariance;
  - (d) deleting a weight-0 member keeps `φ` from decreasing, which contradicts leastness, so every member is positive;
  - (e) `¬Hall ⇒ max φ > 0`, which gives deficiency.

### Groups not funded (`no award attempted`)

| Group | Reason | Smallest unproved node |
|---|---|---|
| **(HALL)** at SOLUTION-CONTRACT §2 (`lowerRegionTwoForOneWeightedHall`) | No informal proof at any scope that contains a switch-necessary row. A bounded result never qualifies. | (CF-HALL) and (O2) at `CB(8,86)/460` (see Headline verdicts). |
| Restricted-scope (HALL) on the three `CB(8,·)` rows | No informal proof; (O1)/(O2) are open. | (CF-HALL). |
| **U-B**, (INV)'s quotient clause | The mathematics is registered `proved_informal` (Cycle 1), so every open node is Lean engineering. But no compiled fragment exists. A from-scratch quotient formalization at Stage 7 would turn the award seat into a route, so it is routed to Cycle 3 U1. | `covered_orbitUnion`: `N(⋃X_Q)` = the union of the target orbits joined to `X_Q`. |
| **U-C**, (NM) `sectorPairProductNormalizedMatching` | The mathematics is registered `proved_informal`, but no Lean text exists anywhere in the run. Routed to Cycle 3 U1. | The upper-cover count `2(N−k+1)` on the induced-perfect-matching sector. |
| **U-D / U-E**, the equitable lift and class-union Hall (S11) | STATED; the second read is pending; no fragments. | Equitable-partition definitions; the fractional row and column identities. |
| **G-SPEC** (S1) | STATED; zero fragments; low leverage (three rows). | n1.4 at `r = 0`: the Boolean up-down second eigenvalue in quadratic form. Mathlib has no Johnson-scheme spectrum. |
| **G-CBSTAR** (S4) | STATED; zero fragments. The (LB) bridge from `C5LA1.crossingIndex` to `Erdos993G1.delta` is not on any face. | c.1 + c.2, a Lean `CBstar` graph with its sector bijection. Nodes c.3–c.6 should be formalized graph-generically, after T2's Cycle 3 lemma. |
| **F-G** (Corollary G, S8) | STATED; zero fragments. | N10 `exists_transportRel_iff` (Lemma U on the frozen definitions; F's draft), a `lemma` with no certificate. |

Stage 7 is funded for **C2-LA1 only**.

## Progress and stop-gate ruling

The stop gate is ruled as armed (`SOLUTION-CONTRACT.md` §5; gate ruling 20; CF6-P2). The protocol's "not yet armed" wording is
carried over from Cycle 1 (see the seal audit), and the ruling is the same under either reading.

- **Decisive event (a), (HALL) `formally_verified`:** absent. (HALL) is not `proved_informal` at full scope, or at any scope
  that contains a switch-necessary row. Stage 7 is not a (HALL) closure: C2-LA1 is a restricted-scope structural award.
- **Decisive event (b), a confirmed (CUT):** absent. No candidate exists on any instrument of any orientation. No second read
  for a cut is to be funded.
- **(HALL) status: still open.** The smallest unproved lemma is (CF-HALL) plus (O2) at `CB(8,86)/460` (instance level),
  conditional on SR-C2-1 and SR-C2-2. Structurally, it is a uniform switch-capacity or self-covering statement for families that
  contain a pendant-pair sector.
- **Material progress: yes.** On a clearly identified part of (HALL):
  - Sector Hall under the mixed relation is now complete at all three switch-necessary rows (S14; the Cycle 1 node (n1) is
    proved, S1).
  - The non-sector obligation is localized exactly (S3).
  - The first parameter-uniform statement of which sector shapes can be switch-necessary (S4).
  - An exact family on which the mechanism is strictly stronger than the scalar target (S8).
  - A generalization of (LIFT) (S11).
  - A contract-ready formal award (C2-LA1).

  New adversarial findings: `PPC(7,2)/12` and `CB(4,4)/14` saturate with deletion arcs alone; the P8 screen is a one-sector
  statement; the smallest eligible CB row is CB(1,7)/10; and the selector reduction (S9).
- **Plateau: no.** The plateau test (no material progress, no new lemma at `proved_informal` or better, no new adversarial
  finding) fails on all three counts, so this is not a plateau cycle. The count of consecutive plateau cycles stays at 0.
- **Caution carried into Cycle 3** (F's caution, adopted). Every computed row saturates with deletion arcs alone. A third cycle
  of the same searches, without a certificate or proof that reaches the switch-necessary rows, would be repeated-census evidence
  (fence §3.4; ruling 13). The Cycle 3 portfolio below therefore puts all three orientations on the rows where switch arcs must
  be load-bearing, each with a different instrument class. The general-tree gap is to be probed only structurally, not by
  census.
- **Ceiling and checkpoint.** Cycle 3 of at most six. The controller checkpoint falls after Cycle 3.

## Next-cycle portfolio

This is the **Cycle 3** portfolio: six routes, two per orientation. No target is closed. The object is unchanged: (HALL), OPEN.

**Shared route text.** Every route:
- uses the literal `w_F`, the literal (D) ∪ (S), `F_p` fixed and derived (never hard-coded), `x` through `α`, and the window top
  `⌊2α/3⌋`;
- asserts `supply − capacity = S` from independent sides;
- replays with `python3 -B`;
- adds no census of already-saturating rows;
- takes S1, S3, S4, S8, S11 and S14 at their STATED grades until their second reads close.

- **T1, `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`** (T route T-A).
  - *Object.* Prove (CF-HALL) and (O1) on the choke forest `T'` at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, then
    close (O2) with an explicit allocation.
  - *Method.* Use INV to restrict to `S_d ≀ S_m`-invariant families. Class the sources by the number `q` of included chokes;
    each class is a product of `q` choke-in blocks and `m−q` ternary blocks. Prove Hall per class with slack; the thinnest is
    `q = 1`, at ratio 0.9902. Use S4's self-covering idea: deleting a choke is a private exit. Then route the sector's
    switch share into the V-target slack left after the V sources are served inside their `T'` copy.
  - *Could close:* a restricted-scope (HALL) theorem at the three rows, as a SEPARATE key (`computer_assisted`). That would
    be the first full-network Hall with switch arcs load-bearing on a whole tree. Failing that, an explicit coupled family
    whose deficit sign becomes F1's sharp candidate.
- **T2, `C3-T-02 GENERAL-SECTOR-SELF-COVERING`** (T route T-B).
  - *Object.* Generalize S4's self-covering reduction to an arbitrary tree `T` and an independent `Q` with `T − N[Q]` a star
    forest.
  - *Method.* The `Q`-deletions are private exits; bound the weight lost when `q ∈ Q` is a witness; reduce any sector deficit
    to the weight-inert residual; characterize exactly when that residual is deletion-deficient, which needs a weighted LYM
    for non-uniform `q_i`. Include (O3) at `CB(8,108)/577` and `CB(7,144)/673`: small-set expansion `|X|/R_k < θ` by a
    Kruskal–Katona-type bound on the product of three-element V-posets, since no spectral route exists there.
  - *Could close:* a parameter-uniform (NMP) lemma at `proved_informal` identifying every switch-necessary sector shape on
    trees (expected: pendant-pair sectors only), plus sector Hall at the Lemma C-uncovered rows. It would also give a
    graph-generic statement that absorbs G-CBSTAR's c.3–c.6.
- **F1, `C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`** (reshapes F's C3-F-01 per R3).
  - *Object.* An adversarial search for a mixed-relation deficit at the three `CB(8,·)` rows, restricted to what S3 leaves
    possible: `Aut`-invariant families meeting `sec`, positive-weight V and positive-weight S/O together.
  - *Method.* Compute `Σ_X w_F` and `Σ_{N(X)} w_F` exactly, for class unions indexed by arm state × choke count × branch-type
    marginals, through branch-type generating functions. No orbit materialization and no coarser equitable quotient
    (disfavoured at `d ≥ 2`). Any deficit must be exhibited as an original class-union cut (`X`, `N(X)`, both sums; S11/INV
    value form) with two independent instruments. Separately, test the S4/R8 prediction that switch-necessity needs many
    pendant-pair sectors, by constructing the smallest non-CB trees with a `t = 1` sector satisfying
    `3(p−1) < 2(M+1)` at an eligible rank. This is by closed form, never by census.
  - *Could close:* a (CUT) candidate, which is decisive after the second read; or a proved lower bound on the class-union
    slack that feeds T1's (O2); or the smallest switch-necessary tree below order 1465.
- **F2, `C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE`** (F's C3-F-02, narrowed).
  - *Object.*
    - Prove the two `T(m,2)` premises for every `m ≥ 4`: `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0`. Use the block
      recurrence `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}` with a mode estimate and a finite check. The bound is tight for
      `m ≤ 18`.
    - Prove `S(G_k, k+3) ≤ −2`.
    - Then attack (HALL) itself on `G_k` and `T(m,2)`: either an explicit parameter-uniform flow (deletion arcs suffice on
      every computed row), or a cut on the family where Hall's room is provably smallest.
  - The selector is retired as a route object (S9). The `G_k` key's registration goes through SR-C2-4, not through this
    route.
  - *Could close:* the `T(m,2)` family key at `proved_informal`; the first parameter-uniform restricted-scope (HALL) theorem
    on an infinite family with unreachable capacity, as a SEPARATE key; or a cut.
- **U1, `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`** (U route U-R1).
  - *Object.* Seed from C1-LA1's `Main.lean` byte-identically, plus the C2-LA1 award text once it closes (otherwise U1's
    `INV.lean` + C-U1-T's `CritINV.lean`).
    - (i) Define the `Aut(G)`-orbit quotient and prove `covered_orbitUnion` and the class-union deficit identity. With
      `weightedHall_iff_invariant`, this gives WeightedHall ⇔ quotient Hall: the whole (INV) key, without flows.
    - (ii) NM: the sector encoding, the two cover-degree lemmas, and the double count.
    - (iii) N10 `exists_transportRel_iff` (Lemma U).
  - *Could close:* kernel-checked (INV) at its full registered statement, and (NM), both ready for Cycle 3 Stage 7 awards.
- **U2, `C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`** (U route U-R2).
  - *Object.* An exact certificate on the full mixed networks of the three `CB(8,·)` rows. Two forms: a closed-form rational
    saturating flow over branch-type generating functions, verified by summation (a rational saturating flow implies
    WeightedHall for every `X`); or an LP-dual potential proving that no deficient family exists.
  - *Method.* Validate first on the brute-forceable eligible rows (CB(1,7)/10, CB(2,5)/10, CB(3,5)/13–14, CB(4,4)/14). Then
    on a small non-eligible row where the root-plus-arm sector is deletion-deficient at the chosen rank, so that the
    certificate's switch share is exercised on a checkable network before it is used at `d = 8`.
  - *Could close:* the first exact saturation with switch arcs load-bearing on a whole tree (an exact certificate at
    `bounded_computation`, with a `proved_informal` verification lemma); or a candidate invariant cut for F1's
    two-instrument confirmation.

T1, U2 and F1 converge on the same three rows by design, with three instrument classes: analytic primal, certificate primal and
dual adversary. Their disagreement at Cycle 3 Stage 5 would itself be informative.

## Registrations

The run-local registry is frozen until the Cycle 2 second-reads packet seals (ruling 18). Every item below is registered only
after that seal. Items first stated at Stage 4 or 5, or composed by an adjudicator or by me, are **STATED** and need the named
isolated second read first.

**Alias check (my own).** I checked the proposed names against the master registry (`sources/authority/CLAIM-IDENTITY.json`, 434
identities) by pattern: `EQUITAB`, `EIGEN`, `SPECTR`, `CBSTAR`, `GK`, `UNREACH`, `ARC`, `INVARIANT`, `ORBIT`, `SELECTOR`,
`SECTOR`, `TERNARY`, `JOHNSON`, `LIFT`, `COVER`, `CHOKE`, `HALL`. **No lexical collision.**

The mathematical partial aliases are:
- `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` for the equitable lift (orbit special case);
- the run-local (INV) key for C2-LA1 (its invariant half) and for S11 (its quotient clause).

The run-local registry file itself is outside my boundary. I know its four r30 keys from the gate text. The controller must repeat
the check against `control/CLAIM-IDENTITY.run-local.json` and record the distinctions in `control/CLAIM-DISTINCTIONS.json`.

**Isolated second reads to fund (Cycle 2 second-reads packet):**

- **SR-C2-1:** S1, the ternary-cover second eigenvalue, from its critic faces (C-T1-F F1; C-T1-U R4).
- **SR-C2-2:** S14's Lemma C(ii) composition (Facts A, B and D, NM, the margins) and S3's reductions (R-i)/(R-ii) with the
  competition facts. Depends on SR-C2-1.
- **SR-C2-3:** S4, the `CBstar` theorem and `t ≥ 2` corollary, including the (LB) transfer and `n = 3 + m + (t+1)dm`. Its
  inputs are T2's T-A and T-D-R1, and S5.
- **SR-C2-4:** S8, Lemma F, Lemma U and Corollary G, with F2's S7 as inputs, and S9, the selector reduction.
- **SR-C2-5:** S11, the equitable-partition lift and the Hall-form class-union converse, with the corrected framing.

**Registrations and scope updates, in order:**

1. **C2-LA1 (on award close, after the Stage 7 fidelity review; not a second-read item):**
   `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`, VERIFIED **`formally_verified`**.
   - Attribution: U1 (Claude Sonnet 5); C-U1-T and C-U1-F (Claude Opus 5.5); the r30 Cycle 1 (INV) record; C1-LA1 for the
     definitions; the first-interior run (Codex), entries 1–18; Codex GPT-6 for the mechanism.
   - Companions `weightedHall_iff_invariant` and `weightedHall_iff_phi_nonpos` are recorded `proved_informal` on its face.
   - **Scope note on (INV)** as in `## Headline verdicts`.
2. **After SR-C2-1:** `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`, VERIFIED `proved_informal`. The statement is S1 in quadratic
   form. Attribution: C-T1-F and C-T1-U (critic-derived); T1 for the attaining flip characters. Fence: abstract poset; used in
   (HALL) only through Fact D at three rows.
3. **After SR-C2-2:** a **`R30-CB-RECORD` update** (a record, not a key).
   - S14 at `computer_assisted`, three instances.
   - S3's reductions at `proved_informal`.
   - The new exact aggregates for 86/460 and 89/476 (`bounded_computation`).
   - `Aut = S_d ≀ S_m`, the corrected digit counts, and the struck "margins" label.
   - The O-class balances (bounded).
   - The smallest eligible CB row, CB(1,7)/10.
   - The first sector-deficient CB rows by `d`.

   Attribution: T1 (numerics); C-T1-F (composition, F4(i)); C-T1-U (R7, class balances); the T and U adjudicators (replays);
   U2 (aggregates).

   **Scope note on (HALL)** as in `## Headline verdicts`, conditional on SR-C2-1/2/3.
4. **After SR-C2-3:** `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, VERIFIED `proved_informal`. The statement is S4 with the
   `t ≥ 2` corollary on its face, with the hypothesis `F ⊇ {v} ∪ P` stated and `F = {v}` excluded.
   - Attribution: C-T2-U (critic-derived); T2 for T-A and T-D-R1; r27 for (LB).
   - The claim-distinction must say it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`: it concerns one sector family under the
     active weight, with the deletion neighbourhood as a diagnostic.
   - **Scope note on (NM)** for T-D-R1 (T2), uniform `t`.
   - S5 (L1, P1; C-T2-F) is recorded in the key's evidence, not as a separate key.
5. **After SR-C2-4:** `E993-R30-GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`, VERIFIED
   `proved_informal`. The statement is S8's Corollary G for every `k ≥ 3`, with S7 as companion content.
   - Attribution: F2 (Claude Sonnet 5) for `α`, the closed form, `x(G_k) ≤ k+1` and exact eligibility; C-F2-U and C-F2-T for
     Lemma F, Lemma U and the composition.
   - Fences: a family scope note on (HALL), not (HALL); nothing about the sign of `S(G_k, k+3)`.
   - The selector reduction S9 is recorded as a scope-note sentence on (HALL), not as a key.
   - The `T(m,2)` analogue is recorded **conditional** (bounded premises), not registered as a key.
6. **After SR-C2-5:** `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`, VERIFIED `proved_informal`. The statement is S11: the lift iff
   together with the class-union Hall converse.
   - Attribution: U2 (Claude Sonnet 5) for the lift; C-U2-T and C-U2-F for the Hall-form converse and the corrected framing;
     Codex for (LIFT).
   - Its distinction must record that it **generalizes** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, and contains (INV)'s
     quotient clause as its orbit special case. This is a partial mathematical alias on that sub-case.
7. **Bounded records** (`bounded_computation`; records, not keys):
   - `PPC(7,2)/12` (C-F1-T, C-F1-U, F adj.);
   - `CB(4,4)/14` (C-F1-T, F adj.);
   - `CB(1,7)/10` (C-F1-T, C-F1-U, C-U2-F, F and U adj.);
   - `CB(2,5)/10` (C-U2-T, U adj.);
   - `G_3..G_5` and `T(4..6,2)` (F2, both F2 critics, F adj.);
   - the PPC eligibility and sector-margin screens;
   - the colour-refinement counts;
   - Candidate 2's narrowed witness.
8. **Refutation and strike records** (in `control/CLAIM-DISTINCTIONS.json` or the cycle record; no registered key changes
   status): T-B; the `X_max` witness (with S12 as its reason, STATED under SR-C2-5's packet or C2-LA1's fidelity review);
   Candidate 2's headline; and the certification strikes listed above.
9. **No status change:**
   - (HALL) stays OPEN (scope note only);
   - the primary aggregate stays OPEN (scope note: unchanged);
   - (WID) and C1-LA2 are unchanged;
   - the R23 aggregate, `E993-BETA-AGG`, TREE, FOREST, TRANSFER and Erdős #993 are unchanged.

## Continuation ruling

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

- `headline_resolved: no`: there is no governed formal award of (HALL) and no confirmed refutation.
- `continue: yes`: the run proceeds to Cycle 2 Stage 7 (C2-LA1), then the Cycle 2 second reads (SR-C2-1 to SR-C2-5), the
  cycle-close registrations, and Cycle 3 with the portfolio above.
- The armed stop gate finds no decisive event and no plateau, so there is nothing to invoke. The controller checkpoint falls
  after Cycle 3.

Seat facts:
- Background jobs: I started none, so none needed killing before this write.
- Reread before close: done. The headings match the protocol. Each flag line occurs exactly once. The disclosure line is
  present. No literal filesystem path outside the run root is quoted.

## Artifact inventory

- **Deliverable:**
  `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-2/stage6/SYNTHESIS.md`
  (this file only).
- **Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-S/`.
  Standard library only, exact integers, run with `python3 -B`.

  | file | SHA-256 | role |
  |---|---|---|
  | `verify.py` | `43a568cb87593904c0c39546441c968efa7c7334a7167bf28a42b170fc7e8fb6` | dispatch-capsule seal and 12-member digest check |
  | `s_checks.py` | `277ddf75bf53c3623c8178985fdfff26b5a93a019bb201b71ac2056457129808` | corollary identity (S4); `t = 1` threshold = P8; rank coverage of P8 on the three windows; row orders |
  | `s_checks.out` | `02e5749c0c5432613598bf4156a0dce6e8c03d481fcedfcd40954428be5a9ebd` | its output (all `True`; P8 fires only at 460, 476, 492) |

  The temporary read copies of the F and U adjudications were deleted before this write.
- **Replay:** `cd` into the scratch directory, then `python3 -B verify.py; python3 -B s_checks.py`. Each takes a few seconds.
- **Not produced:** no Lean, no network, no installs, no background jobs, and no writes outside this file and `scratchpad/c2-S/`.
