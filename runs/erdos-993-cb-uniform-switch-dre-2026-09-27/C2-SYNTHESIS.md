# Cycle 2 Neutral Synthesis

Neutral Stage 6 synthesis, Cycle 2, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993: a parameter-uniform
switch-using Hall certificate on CB(8,m) at the top sector-deficient rank `p* = (16m+4)/3`, class `m ≥ 107`, `m ≡ 2 (mod 3)`).
Written 2026-09-28, 03:18–03:25 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `verity.md` and `identity/startup-protocol.md` (the VerityOS
constitution and startup protocol; absolute paths withheld under the protocol's path rule). Subsystems loaded: those two files only.
I did not follow the task-type map into memory, logs, skills, decisions, operations or conversations; the controller owns
conversation logging for this run, and I wrote no conversation log.

## Identity and seal audit

**Dispatch and capsule (verified before use).**

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c2-stage6/DISPATCH-SYNTHESIS.md` (file SHA-256) | `b724ace49e2e42c80b56e2d81a16404afd45a0aac684a0213df577b1c731b6ef` | MATCH |
| **Capsule seal** `control/C2-STAGE6-DISPATCH-MANIFEST.json` (canonical JSON without `seal_sha256`; sort_keys; `(",", ":")`; no trailing newline) | **`042af41d527366929b8ebf2e73b86a68d474394558ea9d978c5af621d68d20d6`** | MATCH |
| Capsule manifest file SHA-256 | `f714eaaf174378cc1a8776b8556de4efaf13dec5ac32bee71bd3e4259c71bcea` | recorded |
| All 12 listed members (SHA-256 and byte count): the two contracts, `C2-ALLOCATION.md`, `C2-STAGE1-GATE.md`, the Stage 5 packet manifest, `C2-STAGE6-CONTROLLER-FACTS.json`, `C2-SYNTHESIS-PROTOCOL.md`, `PATH-CHECK-c2-stage6-dispatch.json` (10 files scanned, 0 findings), the T/F/U adjudications (`849eaf08…`, `3fbab258…`, `013c1398…`), `sources/SOURCE-DIGESTS.json` (`1508f7dd…`) | each equals its entry | MATCH ×12 |
| Stage 5 packet seal `control/C2-STAGE5-PACKET-MANIFEST.json` (same canonical rule) | `f8a1a82797d25f5c646937f8fb65a8713a2800f1e07cc4c71e2907f35137bc3c` | MATCH |

The Stage 5 packet manifest lists raw returns and critiques; I read none of them (the capsule does not list them). The adjudicators'
own seal audits (Stage 2 `ee00f126…`, Stage 3 `1cffc789…`, Stage 4 `297f51b2…`; capsules T `af58a11b…`, F `a176bc09…`, U `06a397c6…`)
are concordant across the three adjudications; I cite them, I did not recompute them.

**Frozen sources read (all under `sources/`, each digest-checked against `sources/c1-results/SOURCE-DIGESTS.json` before use):**
`c1-results/cycles/cycle-1/CYCLE-CLOSE.md` (`25c406ab…`), `c1-results/cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md` (`9635e9fa…`), the
three C1 award runs' `FORMALIZATION-STATE.json` (LA1 `a43e3825…`, LA2 `97722ca7…`, LA3 `6d59d4c3…`) and `LeanProject/LeanProof/Main.lean`
(LA1 `f0578ed7…b78e`, LA2 `a906ec17…5f3f`, LA3 `c0605e12…3011`), read by targeted `grep` for the declarations cited below; C1-LA2's
`RECEIPTS/kernel-verification.json` (verdict `verified`). I grepped the frozen run-local registry snapshot
(`c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`) and `authority/CLAIM-IDENTITY.json` / `authority/R30-CLOSEOUT-RECEIPT.json`
only to confirm the exact spelling of the six keys cited under `## Registrations` (all present).

**Controller facts** `control/C2-STAGE6-CONTROLLER-FACTS.json` (CF6-2-1..6): read as facts, never as authority. CF6-2-1 (index) is
confirmed independently by the T and F adjudications and by my own instrument; CF6-2-2 (`G` erratum R31-E-d) is consistent with all
three adjudications; CF6-2-6 (carries only from frozen runs; critic scratch is DRAFT text) is applied in `## Lean awards`.

**Model disclosures on record.** Routes: Sonnet 5 high (runtime `claude-sonnet-5`); critics: Opus 5.5 medium (`claude-opus-5-5`);
adjudicators: Opus 5.5 high (`claude-opus-5-5`), each two-part, as reported by the three adjudications.

**My read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool
   call. I did not open or use them (the conversation-logging instruction there is superseded by the dispatch's single-file write rule).
2. My first shell call printed a zsh `=====` separator error (cosmetic, no effect).
3. The T adjudication's display exceeded the tool's inline limit; the harness saved the display to its own tool-output cache outside
   the run root, and I paged that copy with the file reader. The copy is the capsule member's content; no other file there was listed
   or opened.
4. Non-recursive `ls` of `sources/`, `sources/c1-results/`, its `runs/` and `second-reads/` directories (names only), and of
   `cycles/cycle-2/` (showing only the names `stage2`..`stage5`) before creating `stage6/`. No `find`, `rg`, `ls -R` or glob `cat` was
   run above the grant; every `grep` was of a single named file under `sources/`.
5. No network, no package installs, no Lean invocation, no child agents. No background job was started, so none was running at the
   final write.

## Reconciliation

Rulings are claim by claim, never by majority. Where two adjudicators speak to one object, the stronger evidence (replayed build or
exact identity) governs, and the conflict is surfaced.

**R-1. The favorability index (duty 6b(i)).** The definition of record is `Δ_p(G) = i_{p+1}(G) − i_p(G)`: the carried C1-LA2 entry 2
`C4LA1.vertexDeletionForwardDifference G v p := i_{p+1}(G − v) − i_p(G − v)` and entry 3 `IsFavorableAt := … < 0` (read by me in the
frozen `Main.lean`). SEMANTIC-CONTRACT §1 uses `Δ_p` without defining it (CF6-2-1): clarification only, object unchanged.
- **Struck as evidence at `p*`** (they test `Δ_{p*−1}`): T2's whole favorability claim (T adjudication, confirmed on T2's
  `main_verify.py`), F1's favorability table (`f1_instr.py` lines 459–460), F3's table (`delta_at`), and C-F3-U's favorability column
  (`crit_rows.py` line 108; the F adjudicator's own finding, extending CF2-F-1 to three instruments). `Δ_{p*−1} < 0` also holds at
  every tested row but is outside fence 1 and carries no weight: descent at `p*−1` does not give descent at `p*` without unimodality
  of a forest polynomial, which is unavailable.
- **Surviving at the index of record:** T1's arm-leaf proof (seat); the private-leaf proofs of C-T2-F, C-T2-U, C-F2-T and C-F2-U
  (four closing steps, two per orientation; CF2-F-2 recorded the count, and neither adjudicator could read the other orientation's pair);
  the compiled scratch of C-T1-F, C-T1-U and C-F2-U; the critic instruments of C-F1-T, C-F1-U, C-F2-T, C-F2-U and C-F3-T
  (code-inspected by the F adjudicator); the T adjudicator's `adj_fav.py` (107, 110, 116, 119), the F adjudicator's `adj_rows.py`
  (107–500), and my `syn_check.py` (107, 122; below).

**R-2. Darroch/Newton-free favorability (T and F agree; U holds the graph link).**
- T (E-1..E-4) and F (item 1, FAV-TOP) state the same theorem: for every class `m`, `i_{p*+1}(T−w) < i_{p*}(T−w)` for `w = v` and for
  every private leaf `c_ij`, hence `F_{p*}(CB(8,m)) = leafSet`, with inputs the r30 closed-form node for `I(T−v)`, `I(T−c)`
  (`proved_informal`) and the C1-LA3 kernel-checked companion (G) (entry 17). No `M_0`, no finite certificate, no Darroch, no Newton.
- **Surfaced divergence 1 (compiled status of the private leaf).** T says Group B has no compiled fragment in its capsule; F reports
  C-F2-U's `privateLeaf_favorable_topRank` compiled sorry-free and rebuilt by the F adjudicator (standard axioms). Not a conflict: a
  capsule-scope difference. **Ruling:** both leaf classes exist as compiled scratch at the closed-form level (arm leaf three times:
  C-T1-F, C-T1-U, C-F2-U; private leaf once: C-F2-U).
- **Surfaced divergence 2 (formal route for the private leaf).** T recommends C-T2-F's `Π` identity via (R); F's compiled route is
  C-F2-U's regrouping `E0_0 + tail = Π = (1+x)^3(1+2x)^{8m−1} + x(1+x)(1+2x)^{8m−1}`, two (G) blocks with `6t − (3a+4b) = 3` each. I
  checked both by hand and the `Π` forms by instrument. **Ruling:** C-F2-U's compiled regrouping is the award specification (it needs
  only (G)); the `Π` identities (C-T2-F, C-T2-U) and C-F2-T's tail ratio identity stand as independent informal proofs for the second
  read.
- **Surfaced divergence 3 (transitivity).** F lists automorphism transitivity (N2) as an open node; T recommends proving the
  `I(cbGraph m − c_ij)` link for every `(i, j)` directly. **Ruling:** the per-`(i, j)` route (no automorphism formalization).
- **Hypothesis `107 ≤ m`.** C-T1-U's statement has it; C-F2-U's has only `m % 3 = 2`; the F adjudicator recommends adding it. Agreed:
  frozen with `107 ≤ m` (unused; fence 1).
- The U orientation holds the arm-leaf graph link (`critU3T_cb_vertexDeletion_v_eq_coeff`, C-U3-T, replayed by the U adjudicator);
  the private-leaf link is open (U-C). No conflict.

**R-3. (ELIG-top)(a) and (E) (U decisive; F corroborates; T silent).**
- U: C-U1-T's `CriticU1T.cb8S5_pos` and `cb8_elig_top_a` (every class `m`, unconditional, kernel-checked scratch; `positivity` over 51
  explicit positive coefficients, no `decide`/`native_decide`), U1's nodes (1), (3), (4), C-U3-T's closed-form link, and the U
  adjudicator's composition `AdjU.cb8_topRank_conjuncts_1_2_3` and `AdjU.cb8_topRank_of_flow` (replayed builds P1, P2, P4).
- F: `N_5`'s primitive digest `893a21b6…51f7` equals SR-4's (three instruments); minimal all-positive shift `t = 33` (`m = 101`); class
  floor `t = 35`; the pool `j ≤ 5` is minimal from 107; `S_4 > 0` from `m ≥ 137` on a degree-40 certificate. U's sign table
  (`N(t) < 0` on `t = 1..32`, `> 0` from 33) agrees exactly with F's root `t* ≈ 32.1485`.
- **Surfaced finding (D1, F).** Eligibility at `p*` fails at every residue-2 `m ≤ 83` and holds at `86..104` (bounded, off-class;
  C-F1-T and the F adjudicator). C-F1-U's acceptance of F1's "`m ≥ 107` enters nowhere" is struck. Consistent with U: the S_5 pool
  certifies from `m = 101`; the pooled certificate is sufficient, not necessary, which is why eligibility at `86..98` (bounded) lies outside its range. The formal
  statement keeps `107 ≤ m`.
- Gate-line divergence: U says `ELIG_formal: advanced`; T and F say `not_advanced` for their own portfolios. Not a conflict: the
  advance lives in the U portfolio. **Cycle ruling: `ELIG_formal` advanced** (critic-attributed compiled proof plus adjudicator
  composition; the registered grade moves only when C2-LA1 closes).

**R-4. The T3 criterion flow against the U2 interface (duty 6b(ii)).**
- T3's repaired statement (C-T3-U `cb8E1Arc_spec_topRank`, per the T adjudication): a named `f : … → ℚ`, `0 ≤ f`, supported on
  literal deletion arcs from `r`-free sources; row sums `= activeWeight`; column sums `= cb8Rho(q)·activeWeight` on `r`-free targets
  with `q ≥ 1` open chokes; 0 on every other target. Hypothesis `hfav` or, weaker, `C ⊆ F`.
- U2 critics' consumable shape (per the U adjudication): `ℚ`-valued on literal pairs, `≥ 0`; supported on deletions; zero on sector
  rows; rows `≥ activeWeight` on non-sector sources; columns 0 on in-sector targets and `≤ activeWeight` elsewhere; `≤ ρ_1·γ` on
  `u_i`-switch images with `ρ_1` stated as `cb8R1 m K / cb8R1 m (K−1)`, `K = (16m+1)/3`, or with a bridge lemma.
- **They fit, clause by clause:** nonnegativity is identical; deletion support is identical; sector rows are zero because T3's
  support is on `r`-free sources and sector sources contain `r`; in-sector columns are zero because a deletion image of an `r`-free
  source is `r`-free; T3's row equality implies U2's row inequality on the `r`-free `q ≥ 1` class, and every other non-sector source
  has weight 0 (the active tags are `v` with witness `r`, and `c_ij` with witness `u_i`; so positive weight forces either `r, v ∈ B`
  or some `u_i ∈ B`, and the latter makes `B` `r`-free with `q ≥ 1`); T3's column equality implies U2's `≤ activeWeight` once
  `cb8Rho(q) ≤ 1`, which is condition (i) (C1-LA3 entry 20, `cb8_E1_conditionI_topRank`, strict, ℤ[X] form) plus positivity (entry
  14); the switch-image clause is T3's column at `q = 1` together with C-U2-F's compiled `critic_switch_image_activeWeight`
  (`w = γ_i`).
- **The smallest missing formal lemma of the fit** is the vocabulary bridge between two carried awards:
  `(((1 + X) ^ 7 * (1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff k : ℚ) = (cb8R1 m k : ℚ)` for all `k` (a Vandermonde-type coefficient
  identity). C1-LA3 states condition (i) as a ℤ[X] coefficient inequality; C1-LA1 (entry 11 `cb8R1`, a ℕ finite sum; entry 32
  `cb8_sectorTemplate_residual`) states `θ ≤ 1 − cb8R1 m K / cb8R1 m (K−1)`. No carried declaration links them (C1-LA1's `Main.lean`
  contains no `coeff`; `cb8R1_expand_top/sub` only expand `cb8R1`). My instrument confirms the identity and `ρ_1 = cb8R1 m K /
  cb8R1 m (K−1)` exactly at `m = 107, 122`, and `K = p* − 1`. The remaining adapter content is the zero-weight classification lemma
  above and `ρ_q ≤ 1` for `1 ≤ q ≤ m`.
- **Beyond the fit:** the smallest unproved formal lemma for *discharging* the E1 hypothesis is the in-balance double count on the
  clone product (T Group C node (b)); the smallest for *consuming* it in conjunct 4 is U-B's Out arc-sum bridge
  (`Σ_{A ∈ I_{p*}} g_sec B A = Σ_i cb8Out m (chokeState m B i)`, needing target distinctness across `(i, j, kind)`).
- T3's original skeleton (no `0 ≤ f`; a fresh `f` per target in its corollary) must never be consumed (T ruling, uncontested).

**R-5. Composition-side facts (F and U agree).** Lemma DF (C-F3-U; C-F3-T's arc table agrees clause for clause) is the target case
split U2 needs: the only doubly-fed class is the `u_i`-switch images with `γ ≥ 1`. The post-scaling in-sector load is exactly 1 and is
attained (C-F1-T), so the composition must use `ΣIn ≤ 1` non-strictly; C1-LA1's In clause and the U2 critics' `sector_in_le_one` are
both non-strict. Consistent. The E1 load `ρ_1·γ` on switch images (T E-5) is exactly what the Residual step consumes (U; C1-LA1 (v)).

**R-6. Grades of companions (duty 6b(iv)).** All three adjudications agree: (G), (R), (E1i), log-concavity and positivity are
kernel-checked C1-LA3 companions with no grade of their own. The six faces that wrote "(G) `formally_verified`" and C-T3-F's
"condition (i) `formally_verified`" are corrected. Condition (i) at `p*` stays `proved_informal` (`[r31 C1; SR-2]` note,
Darroch/Newton-free), with a kernel-checked companion. The T adjudicator's ruling for C-T3-U over C-T3-F on this point is affirmed.

**R-7. Gate lines reconciled at cycle level.** `ELIG_formal: advanced` (U). `FAV_darroch_free: advanced` (T seat T1 plus T and F
critics; U `not_advanced` for its own portfolio). `HALL_formal: advanced` as infrastructure only (U2 Parts A–D and critic lemmas; the
statement of conjunct 4 is not reached; T3's `advanced` was struck by the T adjudicator; no conflict). `cut_candidate: none` on every
return, critique and adjudication.

**R-8. My own spot-check (`scratchpad/c2-S/syn_check.py`, stdlib, exact).** Independent code: literal forest DP on `CB(8,m)` equals
the closed forms `I`, `I(T−v)`, `I(T−c_{0,0})` at `m = 2, 5, 8`; at `m = 107` and `122`: `α = 9m+1`, `x = p*−2` (570; 650),
eligibility, (ELIG-top)(a), favorability of `v` and `c` at the index of record, the arm margins `2j+3` (and 0 for `R`), the private
margins `2j+3` (`E0_j`, `j ≥ 1`) and `2j+7` (`E1_j`), `Δ_{p*}(Π) < 0` with both of C-T2-U's ratio closed form and C-T2-F's identity
exact, the arm block sum equal to the literal difference, the `cb8R1` bridge, `ρ_1 > ρ_2`, `ρ_1, ρ_m < 1`, and `m(1 − ρ_1 − θ) ≈ 0.4545`
(107), `0.4562` (122). All pass. Grade: `bounded_computation`; corroboration only.

## Exact established results

Every item first stated at Stage 3/4/5 is **STATED** and needs an isolated second read before registration. Compiled scratch has no
grade until its governed award closes. Imported results keep their grades and are cited, not re-proved.

| # | Statement (exact hypotheses) | Grade | Attribution |
|---|---|---|---|
| X-1 | **(ELIG-top)(a), closed form.** For every `m ≥ 107`, `m ≡ 2 (mod 3)`: `[x^{p*−1}]I < [x^{p*−2}]I` with `I = (1+2x)G^m + x(1+x)(1+2x)^{8m}`, `G = (1+2x)^8 + x(1+x)^8`. Darroch/Newton-free; the fixed degree-50 certificate is kernel-checked by `positivity`. | informal: `computer_assisted` (registered, unchanged); formal: compiled scratch, no grade | U1 (nodes 1, 3, 4); C-U1-T (node 2, factorial normalization); SR-4 (certificate method); C1-LA3 (BD) |
| X-2 | **(E) on the literal tree.** For every class `m`: `(cbGraph m).IsTree`, `crossingIndex (cbGraph m) + 2 ≤ p*`, `3p* < 2·indepNum + 1`; and the §2 terminal follows from conjunct 4 alone. | compiled scratch (U adjudicator P4), no grade | U1, C-U1-T, U3 (Node 0), C-U3-T (closed-form link), U adjudicator (cast bridge, composition), C1-LA2 |
| X-3 | **Closed forms as graph identities.** `I(cbGraph m) = (1+2X)G^m + X(1+X)(1+2X)^{8m}` and `I(cbGraph m − v) = (1+X)G^m + X(1+2X)^{8m}` over ℕ, for every `m`. | compiled scratch, no grade (the r30 node stays `proved_informal`) | C-U3-T; U3 |
| X-4 | **Arm-leaf favorability.** For every class `m`: `i_{p*+1}(CB(8,m) − v) < i_{p*}(CB(8,m) − v)`. Blocks `V_j` with (G) margin `2j+3`, remainder margin 0; no exceptional block; no `M_0`. | `proved_informal` STATED (second read owed); closed-form Lean compiled scratch | T1 (seat); C-T1-F, C-T1-U, C-F2-U (Lean) |
| X-5 | **Private-leaf favorability.** For every class `m` and every private leaf `c_ij`: `i_{p*+1}(T−c_ij) < i_{p*}(T−c_ij)`. `E0_j` (`j ≥ 1`, margin `2j+3`), `E1_j` (`j ≥ 0`, margin `2j+7`) by (G); `E0_0 + tail = Π` by two (G) blocks or by the `Π` identities; per-leaf closed form. | `proved_informal` STATED; closed-form Lean compiled scratch | C-F2-U (regrouping; Lean), C-F2-T (tail ratio identity), C-T2-F (`Π` via (R)), C-T2-U (`Π` ratio form); pairing r30 |
| X-6 | **`Π` lemma.** `Δ_{p*}((1+x)(1+3x+x²)(1+2x)^{8m−1}) < 0`, with `p*(p*+1)Δ(Π) = p*(p*−4)q(p*) − (p*²+6p*+2)q(p*−1)`, `q = r_{1,8m−1}`, and `Δ(Π) = −C(8m−1,p*−1)2^{p*−1}(25p*²−54p*+26)/((p*−2)p*(p*+1))`. | `proved_informal` STATED (a node of X-5) | C-T2-F; C-T2-U |
| X-7 | **FAV-TOP.** X-4 ∧ X-5 ⇒ `F_{p*}(CB(8,m)) = leafSet` on the class, Darroch/Newton-free. | `proved_informal` STATED (weakest input) | as X-4, X-5 |
| X-8 | **Explicit E1 flow at `(8, m, p*)`** given `C ⊆ F`: arc values `G_α/S_α` (active-tag deletion), `w·H_α/(β·S_α)` (closed-leg or arm deletion), 0 (choke deletion); nonnegative by (ii-1)/(ii-2); saturates every `r`-free `q ≥ 1` source; loads `r`-free `q ≥ 1` targets at `ρ_q·w_F`, switch images at `ρ_1·γ`, every other target at 0. | `proved_informal` STATED (conditional on `C ⊆ F`) | T3 (loads); C-T3-F, C-T3-U (arc values, identical); criterion key r30 |
| X-9 | **(ii-1), (ii-2)** for all `a, b ≥ 0`, every `j`, every `α ∈ [0, a]`. | `proved_informal` (CD-2 on record; new proof paragraphs STATED) | T3 (ii-1); C-T3-F, C-T3-U (ii-2); C-F3-T, C-F3-U (CD-2 re-derived); CD-2 r30 |
| X-10 | **Lemma DF** on `CB(d,m)` at every rank: sector-source arcs are exactly leg deletions (weight 1), deletions of `r`, `v` and the `s`-switch (weight 0), and one `u_i`-switch per choke with `β_i = 1` (`r`-free, one choke, weight `γ_i`); a weight-`γ` switch image has `d − γ` sector preimages; every (D) preimage of an in-sector target is a sector source; the only doubly-fed class is the switch images with `γ ≥ 1`. | `proved_informal` STATED | C-F3-U; C-F3-T (agreeing table) |
| X-11 | **R1.** For every class `m`: `11/(25m) ≤ 1 − ρ_1(m) − 288/(200m²+82m+5) ≤ 13/(25m)`. | `computer_assisted` STATED (two degree-10 certificates) | C-F1-U |
| X-12 | **Certificate facts.** `N_5`'s minimal all-positive Taylor shift is `t = 33`; shift 35 also works; `S_4 > 0` for every class `m ≥ 137` (degree-40, shift 45); `τ < 0` on `m ≡ 2 (mod 3)`, `m ≥ 2`. | `computer_assisted` (N-facts); `proved_informal` (τ, second proof of an SR-4 companion) | C-F2-T, C-F2-U; F2 (τ) |
| X-13 | **U2 infrastructure** (compiled scratch): rational flow ⇒ (HALL) ⇒ integral saturating flow (Part A); choke-state extraction; leg count `Σ(β+γ) = |B| − 2`; template `Out` at literal states; `sector_in_le_one` (two independent proofs); `sector_switch_iff` (`β_i = 1`); `w = 1` on sector sets; `w = γ_i` on switch images. | compiled scratch, no grade | U2; C-U2-T; C-U2-F |
| B-1 | Bounded rows: closed forms = literal DP; `x = p*−2` at 107–137, `p*−3` at 200, `p*−7` at 500; eligibility; `F_{p*} = leafSet` at the index of record; (WID) from independent sides with `S < 0`; C1-LA1 exact (`min ΣOut = max ΣIn = 1`); switch images at most `ρ_1 + θ` (`γ ≤ 6`), `ρ_1 + θ/2` (`γ = 7`); condition (i) strict at every `q`; literal sector-arc audits with 0 violations; E1 arc values on 46 + 47/76 literal rows; eligibility fails at residue-2 `m ≤ 83`, holds at 86..104. | `bounded_computation` | adjudicators T, F, U; critics; this synthesis (107, 122) |

**Scope notes the controller should add (per key touched).**
- ELIG key (`…-IS-ELIGIBLE`): the certificate now sits inside a kernel-checked scratch proof (X-1, X-2); registered grade unchanged
  until C2-LA1 closes; `N_5` minimal shift 33, class floor 35; pool `j ≤ 5` minimal from 107; eligibility at `p*` fails at every
  residue-2 `m ≤ 83` (bounded, off-class) — the class bound is load-bearing.
- Tier 1 key: (E) contract-ready as C2-LA1; (H)'s Darroch/Newton dependency removable on the second read of X-7.
- r30 favorability key: dependency-discharge note restricted to `d = 8` on the r31 class (X-7), after its second read; formal notes
  after C2-LA2/C2-LA3.
- Homogeneous criterion key: X-8 arc values and the (ii-2) proof (scope note beside CD-2); condition (i) at `p*` is `proved_informal`
  with a kernel-checked, ungraded companion (correcting T3's and C-T3-F's faces).
- SR-3 composition key: Lemma DF as its written proof paragraph; the non-strict in-sector tightness (load exactly 1, attained).
- R-1 key (optional): R1 as a `computer_assisted` margin note.

**Corrections to predecessor records.**
1. SEMANTIC-CONTRACT §1: state `Δ_p(G) = i_{p+1}(G) − i_p(G)` (clarification; CF6-2-1; the Cycle 3 gate).
2. `C2-ALLOCATION.md` U1 text swapped `G`'s factors (R31-E-d; found by F1; CF-C2-G); F3's `cb_lib` docstring still carries it (code
   correct).
3. `C2-ALLOCATION.md` T texts name 110/113 as test rows; gate ruling 9 names 116/119 (controller-side inconsistency; every critic and
   adjudicator ran 116/119).
4. "(G) `formally_verified`" (T1, T2, T3, C-T1-F, C-T1-U, C-T3-F) and "condition (i) `formally_verified`" (C-T3-F) → kernel-checked
   C1-LA3 companion, ungraded.
5. U3's remaining item 3: the damaged branch of `I(CB − {c_ij, b_ij})` has factor `G' = (1+2x)^7 + x(1+x)^7`, not `G_c`
   (`G − G_c = x·G'`).
6. The Stage 3 disclosure index for F1 and F2 (already corrected by the controller's addendum).

## Refuted or narrowed mechanisms

- **REFUTED (never carried, formalized or registered):** T2's ascent tool (G′) "`1 ≤ k ≤ a+b`, `6k ≤ 3a+4b` ⇒ `r(k) < r(k+1)`",
  by explicit instances (`(2,0,1)`: 2 vs 1; `(0,3,2)`: 12 vs 8; `(0,9,6)`: 5376 vs 4608; `(0,8,5)`: equality) and 499 failures in
  16,425 instances on `a, b ≤ 30` (both T2 critics and the T adjudicator agree). Add to the SOLUTION-CONTRACT §3.6 list as a refuted
  mechanism (a ledger row, not a key). Its corrected form `6(k+1) ≤ 3a+4b ⇒ r(k) < r(k+1)` is STATED and unneeded.
- **Rejected (fidelity):** every favorability claim at `Δ_{p*−1}` (T2, F1, F3, C-F3-U); T2's `computer_assisted` candidate key, its
  "`E0_1` universally proved", its domination lemma and the degree-11 certificates closing it (moot, outside fence 1); `S := supply −
  capacity` as a (WID) assertion (F1, F3); finitely-many-roots reasoning as universality (F2); "the paired block is the only non-(G)
  block" (F2; `E0_0` has gap 5); θ\* evaluated at its fitted rows as a "reproduction" (F3); vacuous exhaustive checks (F3); a single
  involution as transitivity (F3); F3's "never `r`, never `v`" (the images exist with weight 0).
- **Narrowed:** T3's "explicit" to loads only (arc values critic-supplied); T3's Lean hypothesis (no `0 ≤ f`) not consumable; U1's
  "(E)" to (ELIG-top)(a) on `cb8I` conditional on `hS5` (now superseded by X-1, X-2); U2 Part D to template `Out` at literal states;
  U2's "`m ≥ 107` enters via `cb8_sum_out`" struck; U2's "full `Main.lean` byte-identically" to entries 1–33; U3's leaf corollaries
  off the critical path; F1's "literal network, no cut" to template/quotient loads conditional on SR-3 and the criterion key; F1's
  switch-image literal to per-`γ` values; F2's third method to implementation independence; F2's τ to the residue class; F1's
  "`m ≥ 107` enters nowhere" struck.
- **Template failures (never cuts):** the pooling template `j ≤ 4` at `m = 107..134` (already on SR-4's face); the `N_5` shift-32
  certificate (constant term; `m = 98`, off-class); U1's monolithic/per-block `ring` design for node (2) (a tactic-design failure,
  superseded by the factorial normalization).
- **No refuted mechanism revived.** No real-rootedness of `I`, `G`, `G^m` or any forest polynomial; `E993-TREE-REAL-ROOTED` stays
  REFUTED; no `m`-independent per-choke certificate; the θ\* law is never a hypothesis. Newton and Darroch appear nowhere in retained
  content.
- **Cuts:** none. No computation in any portfolio evaluated `X ⊆ I_{p*+1}` against its neighbourhood capacity at an eligible row
  and found a deficit; no candidate exists.

## Headline verdicts

- **Tier 1** (for every `m ≥ 107`, `m ≡ 2 (mod 3)`: (E) and (H) at `p*`): **still open** as a formally verified statement;
  registered `computer_assisted` (unchanged at this stage). Not refuted (no cut). No cutoff `M_0` beyond the class endpoint 107 is
  needed anywhere; no omitted range exists. (E) holds in compiled scratch on `cbGraph m` for the whole class (X-2). (H) is
  `proved_informal` along SR-3's composition; its last Darroch/Newton dependency is removable on the second read of X-7. When C2-LA1
  closes and the Tier 1 assembly is re-read, the Tier 1 key's weakest input becomes `proved_informal` (the composition, the criterion
  key and favorability), so Tier 1 moves to `proved_informal` — which SOLUTION-CONTRACT §5 declares NOT decisive. **Smallest unproved
  lemma toward the formal terminal:** U-B's Out arc-sum bridge (R-4), with the E1 in-balance double count and the `c_ij` closed-form
  link as the other open formal nodes.
- **(L-S)_top:** template feasibility `formally_verified` (C1-LA1; unchanged). Its composition to the literal network stays
  `proved_informal` (SR-3), now with its target case split written (X-10, STATED) and a `1/m` Residual margin (X-11, STATED). Still
  open as a formally verified literal-network statement.
- **(ELIG-top)(a):** registered `computer_assisted`; complete, Darroch/Newton-free and kernel-checked in scratch for every class `m`
  (X-1); `formally_verified` on the close of C2-LA1.
- **Other lemmas:** X-4..X-10 proved (informal, STATED); X-6 new; X-11, X-12 `computer_assisted`; (G′) REFUTED; two certificate
  templates failed (not cuts).
- **(HALL) at full scope** (`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`): **OPEN**, unchanged; nothing here transfers status to it.
- **Primary aggregate** (`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`): **OPEN; unchanged by construction** — the r31 family
  theorem, even when formal, implies `S(T_m, p*) ≤ 0` on its own rows only (FLOW ⇒ SIGN) and transfers no status to any aggregate key.
  TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN.

## Lean awards

Carries are byte-identical from the frozen award runs under `sources/c1-results/runs/`, keyed by (origin award, entry, digest) and
verified against each origin's `FORMALIZATION-STATE.json` and kernel receipt (ruling 12; never r30 C1-LA2 entries 0014–0021; never a
seat's re-typed copy). All seat, critic and adjudicator scratch is DRAFT text to be re-authored under attribution (CF6-2-6), with the
origin named on each re-authored declaration. Pinned toolchain Lean v4.32.2, Mathlib `905b9581…`; axioms exactly `propext`,
`Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `decide` over an enumeration, or `native_decide`. Companions carry no certificate
of their own.

### C2-LA1 — (ELIG-top)(a) on the literal tree and conjuncts 1–3 of the terminal. **FUNDED.**

- **Terminal (frozen):**
  ```lean
  theorem E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
      (cbGraph m).IsTree ∧
      C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) <
        C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧
      C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
      3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
  ```
  The second conjunct is added to the U adjudicator's compiled `cb8_topRank_conjuncts_1_2_3` so that the award covers the ELIG key's
  full statement (descent at index `p*−2` on the tree, and eligibility). It follows in one step from the compiled nodes
  (`critU3T_cb_indepSetCount_eq_coeff`, the cast bridge `AdjU.cb8I_coeff_cast`, and `cb8_elig_top_a`): Lean engineering over proved
  mathematics.
- **Hypotheses:** exactly `107 ≤ m` (used: the certificate and the bridge) and `m % 3 = 2`.
- **Face companions (ungraded):** `cb8_elig_top_a : (cb8I m).coeff ((16*m+4)/3 − 1) < (cb8I m).coeff ((16*m+4)/3 − 2)`; the closed form
  `I(cbGraph m) = (1+2X)·G^m + X·(1+X)·(1+2X)^{8m}` over ℕ with the count-equals-coefficient lemma; `cb8_topRank_of_flow` (the
  SOLUTION-CONTRACT §2 terminal from conjunct 4 alone, via carried entry 78).
- **DAG (closed; every node compiled sorry-free in scratch and replayed by the U adjudicator):** vertex split at `r` (U3 Node 0) →
  component products and the closed form (C-U3-T) → count = coefficient → cast bridge (U adjudicator) → block identity and difference
  identity (U1 nodes 1, 4) → (BD) for `j ≥ 6` (carried C1-LA3 entry 21 within `5 ≤ j ≤ m`) → `S_5 > 0` by denominator-free factorial
  normalization of 254 binomials to a degree-50 `Poly(u)` with 51 positive coefficients, closed by `positivity` over `u : ℕ` (C-U1-T)
  → first-descent minimality via `Nat.find_le` on carried entry 22 (C-U3-T) → `indepNum = 9m+1` and the low window (carried entries 66,
  71).
- **Carried fragments (origin award, entry, digest):**
  - C1-LA3 `Main.lean` `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011` (state `6d59d4c3…`), entries 1–21; load-bearing:
    14 `twoBinomCoeff_pos` `768f4ab5…`, 16 `twoBinomCoeff_logConcave` `77460852…`, 17 `twoBinom_coeff_strictAnti_of_gap` `b39cd787…`,
    21 `cb8_block_descent_topRank` `1afd4f7d…`.
  - C1-LA2 `Main.lean` `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` (state `97722ca7…`, receipt verdict
    `verified`), entries 1–78 (itself carrying r30 C6-LA2 entries under ruling 12); load-bearing: 10 `C5LA1.indepSetCount` `e22635d8…`,
    22 `C5LA1.crossingIndex` `378868ab…`, 24 `cbGraph` `206cd488…`, 56 `cbGraph_isTree` `020d263c…`, 66 `cbGraph_indepNum_eq`
    `8ee97121…`, 71 `cb_lowWindow` `dc760df4…`, 78 `cb8_topRank_of_descent_and_flow` `df7623e2…`.
  - Both layers number entries from 1: carry them as two unmodified modules (the U adjudicator's P4 layout) or merge with re-keyed
    entry markers; the digests above must match after either choice.
- **New declarations (re-authored):** U1: `cb8G`, `cb8I`, `cb8P`, `cb8S5`, `cb8_term_eq`, `cb8_block_identity`, `cb8_term_coeff`,
  `cb8_coeff_diff`, `cb8_tail_blocks_nonneg`, `cb8_elig_top_a_conditional`; C-U1-T: the factorial-normalization lemmas, `cb8Poly_pos`,
  `cb8S5_pos`, `cb8_elig_top_a` (with the generator `gen_lean_s5.py` `53d4731b…` shipped and its assertion against `Poly(u)`
  `f75d2f19…`); U3: `indepSetCount_succ_split`; C-U3-T: the binary convolution, the `m`-ary product, the closed form,
  `cb_indepSetCount_eq_coeff`, `cb_conjunct2_of_coeff`; U adjudicator: `cb8I_eq_map`, `cb8I_coeff_cast`, `cb8_crossingIndex_add_two_le`,
  `cb8_topRank_of_flow`; new: the graph-level descent conjunct and the terminal.
- **Options to record on the face:** `exponentiation.threshold 2000`; `maxHeartbeats 0` ×21; `maxRecDepth 20000`; `maxHeartbeats
  4000000` ×5; `maxHeartbeats 1000000` ×2. If the governed workflow refuses `maxHeartbeats 0`, replace each with an explicit finite
  bound measured in the build (reported build time about 7 minutes wall; the `S_5` module about 395 s).
- **Fences:** one rank `p*`; the class only; (H) not claimed; conjunct 4 not claimed; no FLOW ⇒ SIGN; no aggregate or (HALL) status;
  not a new `E993-R31-` identity (it formalizes the registered ELIG key and the r30 closed-form node).
- **Attribution:** U1 (Sonnet 5, seat `C2-U-01`); C-U1-T (Opus 5.5, critic; node 2); U3 (`C2-U-03`; Node 0); C-U3-T (critic; closed-form
  link); the U adjudicator (composition, cast bridge); C-U1-F (independent symbolic derivation of `N_5`, not in the DAG); SR-4 (the
  certificate method of record); C1-LA2 and C1-LA3 (r31 C1 formalizers); r30 (closed forms, T1 of r30 Cycle 6; network definitions,
  named seats); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run as C1-LA3's
  face cites it (the fidelity reviewer copies C1-LA3's attribution line verbatim).
- **Excluded conclusions:** (H); conjunct 4; favorability; (HALL) at any scope; `S(T_m, p*) ≤ 0`; any rank other than `p*`; `m < 107`;
  `m ≢ 2 (mod 3)`; `d ≠ 8`.
- **Repairs carried into the award:** U1's "(E)" wording narrowed; U3's import edit (P4) replaced by a clean import; the extra
  descent conjunct added.
- **Isolated second read before registration:** SR-C2-4 (the factorial normalization and the ℕ closed-form encoding; the U
  adjudicator's precondition).
- **Registration on close:** the ELIG key to `formally_verified` at its exact scope (grade on its face; the fixed certificate is
  kernel-checked, as C1-LA1's degree-9 certificate was).

### C2-LA2 — Darroch/Newton-free favorability at the closed-form level, both leaf classes. **FUNDED.**

- **Terminal (frozen):**
  ```lean
  theorem E993Transport.cb8_leafDeletion_closedForms_descent_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
        ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) ∧
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
          X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
        ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
          X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3)
  ```
  The indices are the forward differences of record at `p*` (R-1); `G` is the contract's.
- **Hypotheses:** `107 ≤ m` (unused; fence 1) and `m % 3 = 2`.
- **DAG (closed; compiled in scratch):** block expansion with weights `C(m, j)` / `C(m−1, j)`; (G) on `V_j` and `R` (arm), on `E0_j`
  (`j ≥ 1`), `E1_j` (`j ≥ 0`) and the two regrouped `Π` blocks (private); positivity of weights. Specification: C-F2-U `CritFav.lean`
  (`1cf34606…65d0`; `armLeaf_block`, `armLeaf_favorable_topRank`, `privateLeaf_favorable_topRank`; rebuilt by the F adjudicator) and
  C-T1-U `Crit.lean` (`9e400946…`; rebuilt by the T adjudicator).
- **Carried fragments:** C1-LA3 `Main.lean` `c0605e12…3011`, entries 1–17 (or 1–21), load-bearing entry 17 `b39cd787…` with hypotheses
  `1 ≤ t`, `t ≤ a + b`, `3a + 4b + 2 ≤ 6t`.
- **Fences:** a statement about closed-form polynomials over `ℤ[X]`, not about `cbGraph`; no status transfer to the favorability key's
  graph statement until C2-LA3 or U-C closes; one rank; `d = 8`; the class.
- **Attribution:** T1 (seat, arm leaf); C-T1-F, C-T1-U (arm-leaf Lean); C-F2-U (both leaves, regrouping, Lean); C-F2-T, C-T2-F,
  C-T2-U (independent private-leaf proofs); r30 (closed forms, pairing, favorability key); C1-LA3 (G).
- **Excluded conclusions:** `IsFavorableAt (cbGraph m) w p*`; (H); any Tier 2 progress (this is a dependency removal, the gate object
  `FAV_darroch_free`, not a new result).
- **Isolated second read before registration (may run concurrently with Stage 7):** SR-C2-1.
- **Registration on close:** a formal scope note on the r30 favorability key (closed-form level, `d = 8`, the r31 class); no key.

### C2-LA3 — graph-level favorability. **FUNDED as a bounded attempt, sequenced after C2-LA1 and C2-LA2 close (dependent awards against kernel receipts).**

- **Terminal (frozen):**
  ```lean
  theorem E993Transport.cb8_favorableLeaves_eq_leafSet_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
      favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m)
  ```
- **Open nodes (each Lean engineering over proved mathematics):** (N1) for every private leaf `c_ij` (per `(i, j)` directly, no
  automorphism formalization): `C4LA1.vertexDeletionIndepSetCount (cbGraph m) c_ij k` equals the `k`-th coefficient of
  `(1+2X)·G_c·G^{m−1} + X(1+X)^2(1+2X)^{8m−1}` (the r30 closed-form node, `proved_informal`; literal-DP confirmed at small `m` by me and
  at class rows by the T and U adjudicators), by the vertex split and the product with one damaged branch; the analogue for `v` is
  compiled (C-U3-T); (N3) the leaf classification (carried C1-LA2 entries 60 `mem_leafSet_cbGraph_iff` `d94a4323…`, 72
  `cb_leafSet_eq_image` `faa4b7f4…`); (N4) the assembly through carried entry 74 `favorableLeaves_eq_leafSet_of_all` `dd382623…` and the
  ℕ-to-ℤ cast of `vertexDeletionForwardDifference` (entry 2).
- **Carried fragments:** C1-LA2 entries 1–78 (as above); C2-LA1 and C2-LA2 declarations from their frozen runs once closed.
- **Fences, attribution, exclusions:** as C2-LA2, plus C-U3-T and U3 for the link machinery; excluded: (H), conjunct 4, (HALL).
- **Smallest unproved lemma if blocked:** (N1). A blocked attempt registers nothing and records the exact blocked node.
- **Registration on close:** the r30 favorability key's scope note at `formally_verified` on the restricted scope (`d = 8`, the r31
  class, rank `p*`), stated on the note; the terminal's favorability input then enters formally. No new key.

### No award attempted

- **U-B (conjunct 4 on `cbGraph m`, conditional on the E1 flow and favorability).** DAG not closed: `g_sec` is undefined; the Out and
  In arc-sum bridges, the `8 − γ` preimage count, the zero-flow classes and the E1 hypothesis shape are open. **Smallest unproved
  lemma:** for a sector source `B` with `|B| = p*+1`, `Σ_{A ∈ I_{p*}} g_sec B A = Σ_i cb8Out m (chokeState m B i)` (target
  distinctness across `(i, j, kind)`). Routed to Cycle 3 (U1, T3).
- **Group C (the E1 flow `cb8E1Arc_spec_topRank` over `cbGraph m`).** Informal proof complete (X-8, X-9, STATED); no named node
  compiled apart from companion (E1i). **Smallest unproved formal lemma:** the in-balance double count on the clone product
  `K(1)^a × K(2)^b`; the interface adds the `cb8R1` coefficient bridge (R-4). Routed to Cycle 3 (T1, T2, U2).
- **DF + CD-2.** No compiled fragment. Smallest formal lemmas: DF's (S)-arc enumeration (`|N(u_i) ∩ B| = 1 + β_i`, `|N(b_ij) ∩ B| ≤ 1`
  for sector `B`) and CD-2's pairwise step. Absorbed into U-B / Group C routes.
- **R1.** Not funded: no consumer in Tier 1 (C1-LA1 (v) already gives `θ ≤ 1 − ρ_1` formally); an award would re-prove a registered
  conclusion in stronger form.
- **T2's (G′).** Never (refuted).

**Stage 7 plan.** Three governed panels (formalizer, informal auditor, fidelity reviewer; Opus 5.5 high): C2-LA1 and C2-LA2 in
parallel, then C2-LA3 against their kernel receipts. Each panel's fidelity reviewer checks the frozen statement against this section
before `close`.

## Progress and stop-gate ruling

- **Decisive event: none.** (a) Tier 1 is not `formally_verified` (conjunct 4 is open in Lean). (b) No eligible deficient cut exists
  or was proposed on any instrument.
- **Material progress: yes.**
  - `ELIG_formal` advanced: a complete, kernel-checked scratch proof of (ELIG-top)(a) for every class `m` and its composition to (E)
    on the literal `cbGraph m` (X-1, X-2), contract-ready as C2-LA1.
  - `FAV_darroch_free` advanced: Darroch/Newton-free favorability of every leaf at `p*` (X-4..X-7), with the closed-form core compiled
    for both leaf classes, contract-ready as C2-LA2.
  - `HALL_formal` advanced as infrastructure only (X-13); conjunct 4 is not reached.
  - New `proved_informal` content (STATED): X-6, X-8, X-10; new `computer_assisted` content: X-11, X-12; new adversarial findings: (G′)
    refuted, the index lapse in four instruments, eligibility failing at residue-2 `m ≤ 83`, the shift-33 minimality, the missing
    `cb8R1` bridge.
- **Plateau: no.** The plateau condition (no advance on any of `ELIG_formal`, `HALL_formal`, `FAV_darroch_free`, and no new
  registration above `bounded_computation`) fails on two gate objects. The armed stop gate (ruling 15) does not end the run.
- **Ceiling:** Cycle 2 of 6. The Claude Fable 5.1 checkpoint analysis follows the Cycle 3 close.

headline_resolved: no
material_progress: yes
plateau: no
continue: yes

## Next-cycle portfolio

Cycle 3 is weighted to conjunct 4, the only formal obstruction to decisive event (a) once C2-LA1..3 close. Fresh rows for any
instrument: `m = 125, 128`, with `m = 140` as the larger row; controls `107, 116, 119, 122` (values on record). Binding hygiene for every
instrument (from the F adjudication): the selector as `i_{p+1}(T−t) < i_p(T−t)`; (WID) asserted against `Σ_F[q_t(p) − q_t(p−1)]` from an
independent side, never as the definition of `S`; `x` scanned through `α`; the contract's `G`, never a docstring's.

**Orientation T (prove).**
1. **T1 — `E1-CLONE-QUOTIENT-IN-BALANCE`.** Object: T Group C nodes (a) the clone bijection `{B r-free, Q(B) = Q, x ∈ B, x active} ↔ P_q`
   at rank `|B| − q − 1` and (b) the two biregular double counts (`S_{α'+1}(α'+1) = T_{α'}(a−α')`, `S_{α'}·β = 2T_{α'}(b−β')`) and the
   in-balance `h_{α'} + g_{α'+1} = ρ_q·T_{α'}`, written at Lean granularity and compiled in scratch as stand-alone combinatorial
   theorems over the clone product. Could close: node (b), the smallest unproved formal lemma of the E1 flow, sorry-free.
2. **T2 — `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`.** Object: Group C nodes (c) (ii-1)/(ii-2) as `Finset.sum` inequalities and (d)
   `ρ_q ≤ 1` for `1 ≤ q ≤ m` from carried C1-LA3 entry 20 plus entry 14; the `cb8R1` coefficient bridge (R-4); the zero-weight
   classification of non-sector sources; and the adapter lemma "`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis". Could close: every
   interface node compiled, so U2's hypothesis and T3's specification meet in Lean.
3. **T3 — `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`.** Object: U-B's DAG at Lean granularity over C1-LA2's labels: the definition of
   `g_sec` on literal pairs, target distinctness across `(i, j, kind)` for the Out bridge, the In bridge with every zero-flow class
   (non-sector `u = r` two-for-one arcs, the `u = s` and `(1, 0)` switches), the `8 − γ` preimage count, and Lemma DF written as that
   DAG's proof paragraph. Could close: U-B's informal DAG closed at statement granularity with the Out bridge proved in scratch.

**Orientation F (falsify).**
1. **F1 — `FORMAL-STATEMENT-FIDELITY-ADVERSARY`.** Object: every frozen or proposed statement (C2-LA1..3 results as closed; T/U Cycle 3
   statements; the adapter shape): the index of record at `p*`, the contract's `G`, the ℕ-subtractions `m − 1`, `8m − 1`, `8m − 7`,
   `(16m+4)/3 − j`, the presence of `107 ≤ m`, no hypothesis encoding its conclusion (favorability, `ΣIn < 1`), and link targets that are
   literally `C5LA1.indepSetCount` / `vertexDeletionIndepSetCount` of `cbGraph m`. Could close: a signed fidelity audit of every
   Cycle 3 award statement before Stage 7 freezes it.
2. **F2 — `AT-RANK-COMPOSED-FLOW-ADVERSARY`.** Object: the actual composed rational flow (X-8's arc values plus C1-LA1's allocation after
   scaling) at the fresh rows on the literal network at rank `p*`; exact inflows on every target class (in-sector, one-choke switch
   images, one-choke non-images, `q ≥ 2`, weight 0) against literal active-tag capacities; the non-strict in-sector tightness; row sums
   per source; Hall sums over structured `X`. Could close: an end-to-end bounded confirmation of the composition (not the template),
   or an exact failure or cut.
3. **F3 — `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`.** Object: X-8's arc values at the edge cases (`α = 0`, `β = 0`, `q = m`, `w = 1`) on
   small literal `CB(8, m′)` and the clone quotient at the fresh rows; the `cb8R1` bridge and the zero-weight classification; node (N1)
   of C2-LA3 by brute force (`vertexDeletionIndepSetCount` of `CB(8,m) − c_ij` against the closed form at every `k` for small `m`, and
   literally at one class row) if C2-LA3 did not close. Could close: registration readiness of X-8 and a vetted adapter statement.

**Orientation U (formal / structural).**
1. **U1 — `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`** (U-B). Object: `g_sec`, the Out arc-sum bridge (first), the In bridge, the `8 − γ`
   count, the doubly-fed capacity sum with C1-LA1's Switch and Residual, the rational-to-integral step (U2 Part A), and conjunct 4 from
   two named hypotheses (the E1 flow in the adapter shape; favorability or `favorableLeaves = leafSet`). Could close: "conjunct 4 ⇐ E1 ∧
   favorability" sorry-free, hence the §2 terminal conditional on the E1 flow alone once C2-LA1..3 close.
2. **U2 — `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`** (Group C). Object: the E1 flow as a literal `ℚ` function on `cbGraph m` with
   T3's clauses (named `f`, `0 ≤ f`, support, rows, columns, zeros), consuming T1/T2 nodes as named hypotheses where not yet compiled.
   Could close: `cb8E1Arc_spec_topRank` modulo named nodes, or outright.
3. **U3 — `FORMAL-CB8-TERMINAL-INTEGRATION`.** Object, conditional on Stage 7: if C2-LA3 did not close, the `I(cbGraph m − c_ij)` closed
   form and graph-level favorability (U-C; could close `favorableLeaves (cbGraph m) p* = leafSet`); if it did, the merged project
   carrying C1-LA1..3 and C2-LA1..3 byte-identically, the terminal `cb8_topRank_eligible_and_weightedHall` stated with conjunct 4 reduced
   to the E1 hypothesis alone, and the zero-weight classification lemma. Could close: the terminal conditional on exactly one named
   hypothesis.

## Registrations

Every item below is for the controller at the Cycle 2 close (or on the named award's close). Items first stated at Stage 3/4/5 or by
me are STATED and need the named isolated second read (controller-funded and seated) before registration. No new `E993-R31-` key is
proposed; no new text uses a working label, "TOP-RANK" or the phrase ruled out by ruling 11 (existing key names are quoted verbatim).

| # | Registration / scope update | Grade on its face | Attribution on its face | Precondition |
|---|---|---|---|---|
| G-1 | `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`: grade `computer_assisted` → `formally_verified` (exact scope) | `formally_verified` | U1; C-U1-T; U3; C-U3-T; U adjudicator; SR-4; C1-LA2; C1-LA3 | C2-LA1 closes; SR-C2-4 concordant |
| G-2 | Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`: `computer_assisted` → `proved_informal` ((E) formal; (H) `proved_informal`, Darroch/Newton-free if SR-C2-1 concords); explicitly NOT decisive | `proved_informal` | as registered (SR-5) plus G-1 and G-3 attributions | G-1 done; SR-C2-5 concordant |
| G-3 | Scope note on `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`: at `d = 8`, `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `(16m+4)/3`, a Darroch/Newton-free proof (X-7); after C2-LA2 the closed-form inequalities `formally_verified`; after C2-LA3 the graph statement `formally_verified` on that restricted scope. The key's own grade at full scope is unchanged. | `proved_informal` (note); formal clauses on award close | T1; C-T1-F; C-T1-U; C-T2-F; C-T2-U; C-F2-T; C-F2-U; r30 | SR-C2-1 concordant; awards for the formal clauses |
| G-4 | Scope note on `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (beside CD-2): the explicit arc values at `(8, m, p*)` (X-8), (ii-1) and (ii-2) proofs (X-9); condition (i) at `p*` is `proved_informal` with a kernel-checked, ungraded companion | `proved_informal` | T3; C-T3-F; C-T3-U; r30 | SR-C2-2 concordant |
| G-5 | Scope note on `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`: Lemma DF (X-10) as the written target case split; the post-scaling in-sector load is exactly 1 and attained (the composition uses `ΣIn ≤ 1`) | `proved_informal` | C-F3-U; C-F3-T; C-F1-T | SR-C2-3 concordant |
| G-6 | Scope note on the ELIG key (independent of G-1): `N_5` minimal all-positive shift `t = 33`, class floor 35; pool `j ≤ 5` minimal from 107; `S_4 > 0` for class `m ≥ 137`; eligibility at `p*` fails at every residue-2 `m ≤ 83` and holds at `86..104` | `computer_assisted` (certificate facts); `bounded_computation` (rows) | C-F2-T; C-F2-U; C-F1-T; F adjudicator | none beyond the replays on record |
| G-7 | Optional scope note on `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`: R1 (X-11) | `computer_assisted` | C-F1-U | SR-C2-6 (optional; may be deferred) |
| G-8 | Ledger rows: C2-LA1, C2-LA2, C2-LA3 award records (no keys); the refuted mechanism (G′) added to the fence-6 list; the record corrections of `## Exact established results` (1–6); bounded records B-1 | as stated | as stated | award closes (for award rows) |

**Isolated second reads to fund (the controller seats them; each reads the sealed record only).**
- **SR-C2-1 — Darroch/Newton-free favorability (X-4..X-7).** The arm-leaf block proof; at least two of the four private-leaf closing
  steps from different orientations (C-F2-U's regrouping and C-T2-F's `Π` identity recommended); the per-leaf closed form; the block
  weights `C(m, j)`, `C(m−1, j)`; the index of record. Before or concurrent with C2-LA2.
- **SR-C2-2 — the explicit E1 flow (X-8, X-9)**, including the in-balance identity and both biregular double counts.
- **SR-C2-3 — Lemma DF (X-10).**
- **SR-C2-4 — C2-LA1's informal inputs:** the factorial normalization of the 254 binomials to `Poly(u)`, and the ℕ closed-form
  encoding of `I(cbGraph m)`.
- **SR-C2-5 — the Tier 1 assembly re-read** with the new inputs (after G-1), ruling Tier 1's grade and confirming non-decisiveness.
- **SR-C2-6 (optional) — R1 (X-11).**
- Alias checks: G-1..G-7 touch existing keys only (spelling confirmed in the frozen run-local snapshot and `authority/`); no new
  identity is proposed, so no lexical or mathematical alias check against the frozen master-494 is required beyond confirming that
  the award ledger rows use no key names.

## Continuation ruling

The continuation flag above is set to yes. No decisive event occurred; the cycle made material progress on two of the three gate
objects; it is not a plateau cycle, so the armed stop gate (ruling 15) does not end the run. Cycle 3 should run with the nine routes
above, after Stage 7 funds C2-LA1 and C2-LA2 in parallel and C2-LA3 against their receipts. The Cycle 3 gate should state the `Δ_p` definition of record, the
fresh rows, and the F-adjudication instrument hygiene. The Fable 5.1 checkpoint analysis follows the Cycle 3 close.

## Artifact inventory

Scratch root: `scratchpad/c2-S/` (under the run root). Python 3 standard library only (`math.comb`, `fractions`, `json`,
`hashlib`), exact integers, `python3 -B`, foreground.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c2-S/syn_check.py` | `38a91531dff69a855c309f64fa1bbe237cb45dfd3313a77d856b3216c3f0e918` | independent literal forest DP vs closed forms (`m = 2, 5, 8`); at `m = 107, 122`: `α`, `x`, eligibility, (ELIG-top)(a), favorability at both indices, (G) margins for every block, both `Π` forms, arm block sum, `cb8R1` bridge and `ρ_1` form, `ρ` ordering, Residual margin |
| `scratchpad/c2-S/syn_check_out.txt` | `eb4c1452257619146ef5e65e5c92404223a6b452b0fcd2f6a84422d538a50346` | output (payload digest `9d101af570ac3f832fd516beacfb6d3c3935bbaa65d562a6e747c8479135960f`; 43.7 s) |
| `cycles/cycle-2/stage6/SYNTHESIS.md` | (this file) | the deliverable |

Replay: from `scratchpad/c2-S/`, `python3 -B syn_check.py 107 122`. No Lean was run by this synthesis; every Lean fact above is cited
from the adjudicators' replays. Background jobs: none started, none running at the final write. This file was reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
