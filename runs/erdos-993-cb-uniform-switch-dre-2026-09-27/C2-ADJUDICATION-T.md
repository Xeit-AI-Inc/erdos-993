# Orientation Adjudication

Adjudicator of orientation T (prove), Cycle 2 Stage 5, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993: a
parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank). Portfolio: returns `T1` (`C2-T-01`),
`T2` (`C2-T-02`), `T3` (`C2-T-03`) and their six cross-orientation critiques (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`, `C-T3-F`,
`C-T3-U`). Written 2026-09-28, about 03:00 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Subsystems loaded: the constitution and the startup protocol only. I
did not follow the protocol's task-type map into memory, logs, skills, decisions or conversations. The controller owns
conversation logging for this run, so I wrote no conversation log.

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage5/DISPATCH-ADJ-T.md`: SHA-256
  `523f2fdbaaf55b924ba01319a95f8a746eae07d0ccc8b1cc3ea269a593e7d165`. **Match.**
- **Capsule seal** `control/c2-adjudicator-capsules/T-PACKET-MANIFEST.json`: I recomputed it over canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline). The result is
  **`af58a11b18cb184a6ea5be2f64004ee5f7d8585fdebae9986edb8c3926aba9d2`**, which matches. All 24 listed members match their byte
  counts and SHA-256, including the three returns (`6c810668…`, `88b5eaec…`, `3d042554…`) and the six critiques.
- **Packet manifests**, each recomputed the same way:
  - Stage 2 `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: matches.
  - Stage 3 `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: matches.
  - Stage 4 `297f51b20cda73b5e0289e322e7bc7b30aba7a03a9a9911de86e91b93a09b8ec`: matches.
- **Admission records.** Stage 3 admitted 9 of 9. T1 and T2 had format-only disclosure exceptions. Stage 4 admitted 18 of 18. The
  critic verdicts are C-T1-F `retained_narrowed`, C-T1-U `retained_narrowed`, C-T2-F **`rejected`**, C-T2-U `retained_narrowed`,
  C-T3-F `retained_narrowed` and C-T3-U `retained_narrowed`.
- **Controller facts** `control/C2-STAGE5-CONTROLLER-FACTS-T.json` (`55702c1c…`). I read these as facts, never as authority.
  - CF2-T-1: the index of record is `Δ_p = i_{p+1} − i_p`, and T2 used `Δ_{p*−1}`. I confirmed this myself (§Route T2).
  - CF2-T-2 and CF2-T-3 concern cross-orientation critiques outside my capsule. I did not read them, and nothing below rests on
    them.
- **Sources read, each digest-checked before use.** Four files, all OK:
  - C1-LA3 `Main.lean` (`c0605e12…`), C1-LA3 `VERIFICATION-REPORT.json` and `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md`,
    checked against `sources/c1-results/SOURCE-DIGESTS.json`;
  - `sources/r30/records/SEMANTIC-CONTRACT.md`, checked against `sources/SOURCE-DIGESTS.json`.

  I also read the favorability key's registry record in `sources/authority/CLAIM-IDENTITY.json` and used that file and the frozen
  master-494 for lexical alias checks. Both are under `sources/`.
- **Inventoried scratch, rehashed before use.** Every one matches its inventory:
  - the seat generators `t1_main.py` `29f137e8…`, `main_verify.py` `308fa575…` and `t3_twobinom.py` `845e1f4c…`;
  - the critic Lean files: C-T1-F `Main.lean` `9c87a3bb…`, C-T1-U `Crit.lean` `9e400946…`, C-T3-F `SkeletonRepaired.lean`
    `25093dd6…` and C-T3-U `CriticE1Explicit.lean` `958716ba…`;
  - the build logs C-T1-F `lean_compile.log` `99845d8e…`, C-T1-U `AXIOMS-OUTPUT.txt` `a94c92ac…` and C-T3-U
    `critic_explicit.log` `ba413405…`;
  - the critic instruments `crit_pi_formula.py` `5b35b143…`, `correct_index.py` `b3c05d80…`, `crit_literal.py` (C-T3-U)
    `9540aab5…` and `crit_t3f_arcs.py` `ceffdacb…`.
- **Model disclosures.** All three returns disclose two parts (Sonnet 5 high; runtime id `claude-sonnet-5`). All six critiques
  disclose two parts (opus/medium; runtime id `claude-opus-5-5`).
- **My read-boundary disclosures.**
  1. The harness put the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user e-mail into my context before
     my first tool call. I did not open them and did not use them.
  2. **A write outside my granted scratch.** I once copied T3's `RETURN.md` to the harness session scratch directory
     (`/private/tmp/claude-501/…/scratchpad/t3.md`) to page through it. I deleted it at once and read the return in place instead.
     The follow-up `ls` of that session directory showed the names of other files there (controller-session scripts, names only).
     I opened none of them and used nothing from them.
  3. **Lean rebuild.** I bound the pinned shared Mathlib by a manual symlink of `.lake/packages`, ran `cd` into my copied project
     before every `lake` call, and ran `which lake`. I did not run `lake update` or `lake clean`, and I installed nothing.
  4. **No other reads.** I read no other orientation's portfolio, no adjudication or synthesis, no other experiment root and
     nothing from the network. I ran no `find`, `rg`, `ls -R` or glob `cat` above my grant, and no process listing. My one
     background job (the Lean rebuild, literal PID 43196) finished on its own before this file was written (`kill -0` found no
     such process).

## Route-by-route decisions

### Route T1 — `C2-T-01 FAVORABILITY-ARM-LEAF-INTEGER-ROUTE` — ruling: RETAINED, NARROWED (seat-derived, `proved_informal`)

**Object.** `Δ_{p*}(CB(8,m) − v) = i_{p*+1}(T−v) − i_{p*}(T−v) < 0` for every `m ≥ 107`, `m ≡ 2 (mod 3)`. This is the index of
record (r30 SEMANTIC-CONTRACT §1.1 and the favorability key's own text, both re-read here).

**Proof (verified by me line by line).**
1. `I(T−v) = (1+x)G^m + x(1+2x)^{8m}`, where `G = (1+2x)^8 + x(1+x)^8` is the contract's G.
2. Expanding gives `Σ_{j=0}^m C(m,j)V_j + R`, with `V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` and `R = x(1+2x)^{8m}`.
3. (G) at `(8j+1, 8(m−j), p*−j)` has margin `6t − (3a+4b+2) = 2j+3`.
4. (G) at `(0, 8m, p*−1)` has margin 0, and (G)'s gap hypothesis is `≤`.
5. The side conditions `1 ≤ t ≤ a+b` hold.
6. Every weight is positive.

There are no exceptional blocks and no `M_0`: `107 ≤ m` is unused, and the class enters only through `3p* = 16m+4`.

**Paired critics.** Both critics retain the mathematics in full and narrow the same literals. They disagree on no claim. I adopt
their joint narrowing:
- "fresh rows 110/113" is struck, because gate ruling 9 makes those rows controls. Both critics ran 116, 119 and 137.
- "two fully independent instruments" is struck, because both instruments consume the closed form. Both critics supplied
  literal-tree DPs at 107–137.
- "exactly one external input" is struck, because the closed-form node for `I(T−v)` (`proved_informal`) is also an input.
- "+11" is struck: the value is +13 in a common convention, and nothing rests on it.
- "cited verbatim" is struck.
- "~0.1 s measured" is struck.
- "every `m ≥ 1`" is removed from the claim face (fence 1).
- The candidate key is struck (see Cross-route reconciliation).

**Replays.**
- My own instrument (`adj_fav.py`) reproduces the six items below on the literal tree at `m = 107, 110, 116, 119`: the closed
  forms, `Δ_{p*}(T−v) < 0` (408, 419, 442 and 454 digits), the margins `2j+3` and 0, the block sum equal to the literal
  coefficient difference, `x = p*−2`, and eligibility.
- I rebuilt C-T1-U's Lean project copy-out-first. `lake build` exits 0. `#print axioms` gives `[propext, Classical.choice,
  Quot.sound]` for all four declarations, identical to the shipped `AXIOMS-OUTPUT.txt`. `Crit.lean` has no `sorry`, `admit` or
  `native_decide`.
- C-T1-F's shipped log states the same axioms, and its carried prefix (lines 1–389) is byte-identical to the frozen C1-LA3
  `Main.lean`. C-T1-U's `Carried.lean` has the same code with the entry-marker comment lines omitted.

**Record correction.** (G) is a kernel-checked companion of award C1-LA3. The Cycle 1 close records "companions (G) and (E1i)
compiled, ungraded", and SOLUTION-CONTRACT §4 says a companion lemma carries no certificate of its own. So "(G)
`formally_verified`" on T1's face, and on both critics' faces, is corrected to "kernel-checked companion, no grade of its own".
The mathematics is unaffected, because the lemma is machine-checked. The grade of T1's result stays `proved_informal`.

Gate lines: `ELIG_formal: not_advanced`, `HALL_formal: not_advanced`, `FAV_darroch_free: advanced`, `cut_candidate: none`.

### Route T2 — `C2-T-02 FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE` — ruling: REJECTED as to its object; objective reached by critics

**Disagreement between the paired critics.** C-T2-F says `rejected` and C-T2-U says `retained_narrowed`. I resolve it claim by
claim and do not average.

| Claim on T2's face | C-T2-F | C-T2-U | My ruling (with my evidence) |
|---|---|---|---|
| Target "`Δ_{p*}(T−c) < 0`, i.e. `[x^{p*}] < [x^{p*−1}]`" | wrong index, struck | wrong index, struck | **Struck. Fidelity failure (index).** The quantity computed (`main_verify.py`: `coeff(p*) − coeff(p*−1)`) is `Δ_{p*−1}(T−c)`, favorability at rank `p*−1`, which is outside fence 1. My literal DP gives the record quantity at `m = 107` as `−11548817847…` (408 digits) and T2's quantity as `−69833073525…` (407 digits). These are different integers, and both critics report the same heads. Descent at `p*−1` does not imply descent at `p*`: that would need unimodality of a forest polynomial, which is not available. |
| Tool (G′): `1 ≤ k ≤ a+b`, `6k ≤ 3a+4b` ⇒ `r(k) < r(k+1)` | FALSE | FALSE | **REFUTED.** Counterexamples I replayed: `(2,0,1)` gives 2 vs 1; `(0,3,2)` gives 12 vs 8; `(0,9,6)` gives 5376 vs 4608; `(0,8,5)` gives 1792 vs 1792. On `a, b ≤ 30` there are 499 failures in 16,425 instances, the same count C-T2-U reports. The proof reverses the log-concavity inequality. (G′) must never be carried, formalized or registered. |
| "`E0_1` descent proved universally" | struck | struck | **Struck.** It rests on (G′). It is also moot, because it is at the wrong index. |
| `E1_j` and `E0_j` (`j ≥ 2`) descent at T2's index | struck as progress | "stands as a statement about `r(t+1) < r(t)` at T2's `t`" | **Both are right on different points.** The (G) instances are true arithmetic at T2's `t`. They carry no evidential weight for the target and are not retained as progress. The mechanism (block decomposition plus (G) per block) survives only through the critics' record-index proof below. |
| Identities (i), (ii) and `p*Θ = 6C − (p*+4)(C−D)` | exact, wrong object | exact, wrong object | **Exact algebra; wrong object; not registrable** (rank `p*−1`). |
| 52-row sweep, ratio table 7.4969–18.2429 | replayed; label struck | replayed; `bounded_computation` about `Δ_{p*−1}` | **`bounded_computation` about `Δ_{p*−1}` only.** Not registrable at `p*`. |
| Symmetry transfer under `S_8 ≀ S_m` | valid | valid | **Valid.** It transfers only what is proved. |
| Candidate key `…VIA-TWO-BINOMIAL-DESCENT-EXCEPT-ONE-CERTIFIED-BLOCK` | struck (method in name; alias) | struck | **Struck.** |
| Both critics' degree-11 certificates closing T2's backward lemma | `computer_assisted`, moot | `computer_assisted`, moot | **Moot and outside fence 1.** Not registered and not funded. |

**Verdict.** The return does not deliver its obligation at `p*`. Its only new tool is false. So its verdict is **rejected** as to
the route's object. Under protocol duty 3, nothing on its face is retained as evidence toward the target. The verdict label is
C-T2-F's; C-T2-U's "retained_narrowed" preserved only facts about the wrong index.

**The objective is nevertheless reached, critic-attributed.** Two critics derived the result independently, by different closing
steps (graded under Established results). The common skeleton is:

- `Δ_{p*}(T−c) = Σ_{j=1}^{m−1} C(m−1,j)Δ(E0_j) + Σ_{j=0}^{m−1} C(m−1,j)Δ(E1_j) + Δ(Π)`, with
  `Π = (1+x)(1+2x)^{8m−1}(1+3x+x²)` (r30's pairing).
- The (G) gap forms are `−2j−3` and `−2j−7`. The leftover gap `+2` is absorbed by `Π`.

The two closing steps for `Π` are:

- **C-T2-F:** `p*(p*+1)Δ(Π) = p*(p*−4)q(p*) − (p*²+6p*+2)q(p*−1)`, with `q = r_{1,8m−1}`.
  - This comes from recurrence (R) at `k = p*−1` (coefficients −2 and `p*/2`) and at `k = p*` (coefficients −5 and `(p*−2)/2`).
  - (G) at `(1, 8m−1, p*−1)` gives `q(p*) < q(p*−1)`; the gap is `32m+1 ≤ 32m+2`.
  - Hence `p*(p*+1)Δ(Π) < −(10p*+2)q(p*−1) < 0`.
  - I re-derived the elimination by hand, and it is correct.
- **C-T2-U:** `Δ(Π) = −C(8m−1, p*−1)·2^{p*−1}·(25p*² − 54p* + 26)/((p*−2)p*(p*+1))`, from four successive binomial ratios.

My instrument confirms:
- the two `Π` forms agree with each other and with direct coefficient extraction at `m = 2..800`;
- the closed form holds and is negative at all 1,001 class rows `m = 2..3002`;
- the gap table holds exhaustively in `j` at 107, 110, 116 and 119;
- `E0 + E1 + Δ(Π) = Δ_{p*}(T−c)` on the literal tree at those four rows.

Gate lines for the route: `ELIG_formal: not_advanced`, `HALL_formal: not_advanced`, `FAV_darroch_free: advanced`. The return
does not advance this gate itself; the critics do (critic-attributed). `cut_candidate: none`.

### Route T3 — `C2-T-03 MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK` — ruling: RETAINED, NARROWED (`proved_informal`, conditional)

**Retained.** The specialization of the homogeneous criterion key at `(8, m, p*)` holds with `C ⊆ F` (`hfav`). It gives:
- every `r`-free source with `q ≥ 1` saturated at `w_F`;
- every `r`-free target with `q ≥ 1` loaded at exactly `ρ_q·w_F ≤ w_F`;
- every other target loaded at 0;
- `u_i`-switch images loaded at exactly `ρ_1·γ`, where `γ` is the number of the image's present private leaves at its single
  open choke.

T3's own proof of (ii-1) is also retained; both critics checked it line by line.

**Narrowed**, with the critics concordant on each point:
- F1: no arc values were given, although the allocation asked for them explicitly. "Explicit" means loads only.
- F2: the Lean skeleton's `∃ f : … → ℚ` has no `0 ≤ f` conjunct, so it cannot feed the Hall summation or
  `exists_saturatingFlow_of_weightedHall`. Both critics elaborated the verbatim skeleton (one `sorry`, `sorryAx` in the axioms)
  and repaired the statement.
- C-T3-U F3: the corollary produces a fresh `f` per target, so it is unusable as a hypothesis. Uncontested.
- F6: Part C assumed `F = leafSet` and asserted no (WID). The seat's evidence is struck; the value is restored by both critics
  and by me (`S = −336` at CB(8,1)/7, with (WID) holding).
- F7: the ruling-9 fresh rows were not run. The critics ran them.
- The `(13m+1)/3` ℕ-guard slip: the correct bound is `(16m+1)/3`. Harmless.
- `HALL_formal: advanced` is struck to `not_advanced`.
- (ii-2) "not found from the crossing sum" is struck. Both critics wrote the ternary-count proof.

**The one point on which the critics disagree: the grade of condition (i).** C-T3-F marks "condition (i) `formally_verified`
(`cb8_E1_conditionI_topRank`)" as BACKED. C-T3-U strikes it. **I rule for C-T3-U.** `cb8_E1_conditionI_topRank` is entry 20 of
C1-LA3, and its docstring calls it "(E1i) … a Tier 3 dependency reduction". The frozen Cycle 1 close says "companions (G) and
(E1i) compiled, ungraded". The award's terminal is entry 21, `cb8_block_descent_topRank`. SOLUTION-CONTRACT §4 says a companion
carries no certificate of its own. So the registered grade of condition (i) at `p*` is `proved_informal` (the `[r31 C1; SR-2]`
note, Darroch/Newton-free), and it is kernel-checked as a companion. T3's own grade table must read that way.

**Arc values (critic-attributed; the two critics' formulas are identical).** For an `r`-free source `B` with `q` open chokes and
`w = w_F(B) ≥ 1`, put `j = p−q`, `α = w−1` and `β = j−α`. Then:
- a deletion of an active tag carries `G_α/S_α`;
- a deletion of a closed-leg or arm vertex carries `w·H_α/(β·S_α)`;
- a choke deletion carries 0;
- here `G_α = ρ_q·Tc_{α−1} − Sc_{α−1}` and `H_α = Sc_α − ρ_q·Tc_{α−1}`.

Nonnegativity is exactly (ii-1) and (ii-2). I derived the in-balance myself: `h_{α'} + g_{α'+1} = ρ_q·T_{α'}`, together with the
biregular identities `S_{α'+1}(α'+1) = T_{α'}(a−α')` and `S_{α'}·β = 2T_{α'}(b−β')`. My own literal instrument (`adj_t3_arcs.py`)
checked 46 `(d, m, p)` rows on CB(3,2), CB(2,3), CB(4,2) and CB(8,1), with 18 rows on the derived `F_p ⊇ C` and 28 on `leafSet`.
(WID) holds from independent sides at every row. The results are 0 negative arcs, 0 out failures, 0 in failures (`= ρ_q·w_F`),
0 nonzero loads off the `r`-free `q ≥ 1` class, and 0 failures on 6,084 switch images (`ρ_1·γ`). At the class level (the clone
quotient), at `m = 107` and 116, I found 0 negative type totals, `ρ_q < 1` strictly decreasing in `q`, and `ρ_1(107)` equal to
the fixed point of record.

**Unverifiable within my boundary.** CF2-T-3 asks me to compare the T3 critics' arc values with the interface the U2 critics
state. Those critiques are outside my capsule. The T3 critics' repaired statement is C-T3-U's `cb8E1Arc_spec_topRank`: named
`f`, `0 ≤ f`, support on literal deletion arcs from `r`-free sources, row sums `= activeWeight`, column sums `= cb8Rho·activeWeight`
on `r`-free `q ≥ 1` targets, and 0 elsewhere. The synthesis must diff it against the U2 critics' interface.

Gate lines: `ELIG_formal: not_advanced`, `HALL_formal: not_advanced`, `FAV_darroch_free: not_advanced`, `cut_candidate: none`.

## Cross-route reconciliation

1. **Index convention.** T1 and T3 use `Δ_p = i_{p+1} − i_p`. T2 alone shifted. Because of that one fault, the Cycle 2 T returns
   supplied only half of Darroch/Newton-free favorability. The critics supplied the other half. CF2-T-1's statement that F1, F3
   and T2 "used `Δ_{p*−1}`" is confirmed for T2 on my evidence. For F1 and F3 it is not checkable here.
2. **Favorability assembled.** T1 (arm leaf, seat-derived) plus the C-T2-F/C-T2-U private-leaf proof (critic-derived), with
   symmetry or a per-leaf closed form, gives `F_{p*}(CB(8,m)) = leafSet` on the class. This is Darroch/Newton-free, has no finite
   certificate and has no `M_0`. Its inputs are the closed-form nodes for `I(T−v)` and `I(T−c)` (`proved_informal`, both
   literal-DP checked at class rows here) and the C1-LA3 companions (G), (R) and positivity (kernel-checked, ungraded).
   - Consequence for T3: its conditional statement uses only `C ⊆ F`, so it now needs only the private-leaf half.
   - Consequence for the Tier 1 (H) chain (SR-3's composition key plus the criterion key plus C1-LA1 plus favorability): (H)
     would carry no Darroch/Newton dependency once the isolated second reads confirm the two favorability proofs.
3. **Claim identity.** No new `E993-R31-` key is warranted from this orientation.
   - T1's result and the private-leaf result are **restriction aliases** of parts (i) and (ii) of
     `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`. Its record states
     `Δ_k(T−w) := i_{k+1}(T−w) − i_k(T−w)`, every `m ≥ 1`, `d ≥ 6`. "Darroch-and-Newton-free" names a proof, not a predicate. The
     right record is a **dependency-discharge scope note** on that key, restricted to `d = 8` on the r31 class, after an isolated
     second read.
   - C-T2-U's optional paired-block key (`…PAIRED-BLOCK-1-PLUS-X-TIMES-1-PLUS-3X-PLUS-X2…`) is a new predicate and lexically clear
     (0 hits for `PAIRED-BLOCK` and `1-PLUS-3X` in the frozen authority and master-494). I recommend recording it as a named node
     of the scope note rather than as a key.
   - T3's arc values and (ii-2) are scope notes on the homogeneous criterion key, where CD-2 already lives. They are not new keys.
4. **Out-of-fence side results** are STATED only and never registered at this rank or class:
   - C-T1-F's general-`d` margin formula `3 − 2ε + (d−6)j`;
   - C-T2-U's corrected ascent `6(k+1) ≤ 3a+4b ⇒ r(k) < r(k+1)`;
   - C-T2-U's deficit-1 descent under strict log-concavity (strict LC is not in C1-LA3; entry 16 is non-strict).
5. **Allocation against gate ruling 9.** The allocation's T texts say "test at 110/113", while ruling 9 names 116/119. This is a
   controller-side inconsistency, not a seat defect. Every critic ran 116/119, and so did I.

## Established results

Grades are at this orientation's evidence grade. Every critic-derived or seat-derived statement below is STATED at Stage 3/4
and needs an isolated second read before registration.

| # | Statement (exact hypotheses) | Kind | Grade | Attribution |
|---|---|---|---|---|
| E-1 | For every `m` with `m ≡ 2 (mod 3)` (stated on the class `m ≥ 107`): `i_{p*+1}(CB(8,m) − v) < i_{p*}(CB(8,m) − v)`. Inputs: the `I(T−v)` closed-form node and (G). No `M_0`, no exceptional block, no Darroch/Newton. | exact theorem | `proved_informal` (second read owed) | seat T1; (G) C1-LA3 companion; closed forms r30 |
| E-2 | Same hypotheses: for every private leaf `c`, `i_{p*+1}(T−c) < i_{p*}(T−c)`. Inputs: the `I(T−c)` closed-form node, (G) on `E0_j` (`j ≥ 1`, gap `−2j−3`) and `E1_j` (gap `−2j−7`), the `Π` lemma (two independent proofs), and `S_8 ≀ S_m` transfer. | exact theorem | `proved_informal` (critic-attributed; second read owed) | C-T2-F and C-T2-U (independently); pairing r30; (G), (R), positivity C1-LA3 |
| E-3 | `Δ_{p*}(Π) < 0` with `Π = (1+x)(1+3x+x²)(1+2x)^{8m−1}`, in both closed forms above, for every `m ≡ 2 (mod 3)`, `m ≥ 2` | exact lemma (node of E-2) | `proved_informal` (critic-attributed) | C-T2-F (identity via (R), (G)); C-T2-U (ratio closed form) |
| E-4 | E-1 ∧ E-2 ⇒ `F_{p*}(CB(8,m)) = leafSet` on the class, Darroch/Newton-free | composition | `proved_informal` (weakest input) | T1 + C-T2-F/C-T2-U |
| E-5 | Given `C ⊆ F`, the criterion key's flow at `(8, m, p*)` has the explicit arc values of §Route T3. It is nonnegative, saturates every `r`-free source with `q ≥ 1`, loads `r`-free `q ≥ 1` targets at `ρ_q·w_F` and switch images at `ρ_1·γ`, and loads every other target at 0. | conditional theorem (hypothesis `C ⊆ F`) | `proved_informal` (loads: seat T3; arc values: critic-attributed; second read owed) | T3 (specialization, corollary); C-T3-F and C-T3-U (arc values); criterion key r30 |
| E-6 | Type-path inequalities (ii-1) and (ii-2) for all `a, b ≥ 0`, every integer `j`, every `α ∈ [0,a]` | exact lemma | `proved_informal` (already registered via CD-2). (ii-1) is now on T3's face and (ii-2) on both critics' faces. | T3 (ii-1); C-T3-F and C-T3-U (ii-2); CD-2 r30 |
| B-1 | Literal-tree equality of the closed forms `I(T)`, `I(T−v)`, `I(T−c)`; eligibility with `x = p*−2`; signs of E-1 and E-2 at `m = 107, 110, 116, 119` (mine); critics' rows 107–137 and up to 311 | bounded computation | `bounded_computation` | adjudicator; critics |
| B-2 | The E-5 arc values on 46 literal `(d, m, p)` rows (mine) and 47/76 rows (critics); class-level balance at 95–137 | bounded computation | `bounded_computation` | adjudicator; C-T3-F; C-T3-U |
| L-1 | `critT1F_armLeaf_closedForm_descent` (C-T1-F) and `crit_cb8_arm_leaf_closedForm_descent_topRank` (C-T1-U): E-1 as a `ℤ[X]` coefficient inequality of the closed form, sorry-free, axioms `[propext, Classical.choice, Quot.sound]`, carrying C1-LA3 entries 1–17. The C-T1-U project was rebuilt by me. | compiled scratch | no grade (SOLUTION-CONTRACT §4) | C-T1-F; C-T1-U |
| L-2 | T3's skeleton and the critics' repaired statements (`…_nonneg`, `cb8E1Arc_spec_topRank`): elaborate with exactly one `sorry` each (`sorryAx`) | compiled scratch with `sorry` | no grade | T3; C-T3-F; C-T3-U |

Imported at their grades and never upgraded by use:
- the r30 closed forms (`proved_informal` node);
- the criterion key (`proved_informal`);
- CD-2 (`proved_informal`);
- condition (i) at `p*` (`proved_informal`; the C1-LA3 companion (E1i) is kernel-checked and ungraded);
- (G), (R), log-concavity and positivity (C1-LA3 companions, kernel-checked, ungraded);
- C1-LA1, C1-LA2 and C1-LA3 (terminal (BD)): `formally_verified` at their exact scopes. They are cited, not re-proved.

## Rejected and narrowed mechanisms

- **REFUTED:** T2's ascent tool (G′), by explicit instances. It is never to be carried. The valid replacement
  (`6(k+1) ≤ 3a+4b`) is STATED, critic-attributed and unneeded.
- **Rejected (fidelity, index):** T2's favorability-at-`p*` claim, its "`E0_1` universally proved", its `computer_assisted`
  candidate key and its domination lemma, all at `Δ_{p*−1}`. The degree-11 certificates that close that lemma are moot and outside
  fence 1.
- **Narrowed:**
  - T3's "explicit" means loads only.
  - T3's Lean hypothesis is too weak without `0 ≤ f`.
  - T3's corollary is unusable as a hypothesis.
  - T3's Part C fails fidelity.
  - "Condition (i) `formally_verified`" is corrected to `proved_informal` with a kernel-checked companion.
- **Corrected everywhere:** "(G) `formally_verified`" (T1, T2, T3, C-T1-F, C-T1-U, C-T3-F) becomes "kernel-checked C1-LA3
  companion, ungraded".
- **Template failures:** none in this orientation. **Deficient cuts:** none. No cut search was owed, and none was proposed.
- **Darroch/Newton:** used nowhere in the retained content. No real-rootedness of `I`, `G`, `G^m` or any forest polynomial is
  invoked. `E993-TREE-REAL-ROOTED` stays REFUTED.

## Lean readiness

Every group is ruled on criteria (a) complete informal proof at statement granularity with a closed DAG, (b) sorry-free compiled
fragments covering named nodes, and (c) named open nodes. A bounded result never qualifies.

**Group A — arm-leaf favorability at the closed-form level. CONTRACT-READY.**
- Exact statement (terminal): `theorem cb8_armLeaf_closedForm_descent_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
  ((1+X)*((1+2*X)^8 + X*(1+X)^8)^m + X*(1+2*X)^(8*m) : ℤ[X]).coeff ((16*m+4)/3 + 1) < ….coeff ((16*m+4)/3)`.
- Hypotheses: exactly these; `hm` is unused but kept for the fence.
- Fences: this is a closed-form coefficient statement. It is not `IsFavorableAt (cbGraph m) v p*` until the link node below
  exists, and it transfers no status.
- Carried: C1-LA3 `Main.lean` entries 1–17 byte-identically. The source digests are in its `FORMALIZATION-STATE.json`: entry 17
  `b39cd787…589c`, entry 4 `d60b2141…`, entry 14 `768f4ab5…`, entry 16 `77460852…`.
- New declarations, as specified by C-T1-U `Crit.lean` (`9e400946…`): the block descent, the remainder descent, the ring term
  identity, the coefficient shift and the terminal. All are compiled sorry-free in scratch and rebuilt by me.
- Open node for full favorability: `∀ k, indepSetCount (cbGraph m − v_arm) k = [x^k]((1+x)G^m + x(1+2x)^{8m})`, plus the
  `IsGraphLeaf` identification of `v` in C1-LA2's labels.

**Group B — private-leaf favorability at the closed-form level. CONTRACT-READY as a statement; the second read should precede or
run concurrently.**
- Exact statement: for `m % 3 = 2`, `107 ≤ m`, the coefficient of
  `(1+2X)·((1+2X)^7(1+X) + X(1+X)^7)·((1+2X)^8 + X(1+X)^8)^(m−1) + X(1+X)^2(1+2X)^(8m−1)` at `(16m+4)/3 + 1` is below the one at
  `(16m+4)/3`.
- DAG, closed informally: the block expansion; (G) on `E0_j` (`1 ≤ j ≤ m−1`) and `E1_j` (`0 ≤ j ≤ m−1`); the `Π` lemma via (R)
  at `p*−1` and `p*`, plus (G) at `(1, 8m−1, p*−1)`, plus positivity, closed by `nlinarith`/`linear_combination`. C-T2-F's
  identity form is the better formal route, because it needs no binomial-ratio algebra.
- Carried: C1-LA3 entries 1–17.
- No compiled fragment exists in my capsule. CF2-T-2 reports cross-orientation Lean; it is unread by me.
- Smallest node not yet compiled: the `Π` lemma `p*(p*+1)Δ(Π) = p*(p*−4)q(p*) − (p*²+6p*+2)q(p*−1)` in `ℤ`.
- Open link node: `I(cbGraph m − c_ij)` equals the closed form. Proving it for every `(i, j)` directly avoids formalizing the
  automorphism transfer.

**Group C — explicit criterion flow (E1) over `cbGraph m`. NOT contract-ready as a terminal this cycle.**
- The statement is fixed: C-T3-U's `cb8E1Arc_spec_topRank` shape, with named `f`, `0 ≤ f`, arc support, row, column and zero
  clauses, and hypothesis `hfav` or, weaker, `C ⊆ F`.
- The informal proof is complete (E-5, E-6).
- No named node has a sorry-free compiled fragment, apart from companion (E1i) for `ρ_q < 1`.
- Open nodes:
  - (a) the clone bijection `{B r-free, Q(B) = Q, x ∈ B, x active} ↔ P_q` at rank `|B| − q − 1`;
  - (b) the two biregular double counts;
  - (c) (ii-1) and (ii-2) as `Finset.sum` inequalities;
  - (d) `cb8Rho < 1` from (E1i) plus `twoBinomCoeff_pos`;
  - (e) the zero clauses.
- (c) and (d) are contract-ready sub-awards now. (c) is a pure `ℤ` statement with a shared outer-versus-inner product lemma for
  a log-concave sequence with contiguous support.
- The smallest unproved *formal* lemma on the terminal's path is (b), the in-balance double count on the clone product.
- T3's skeleton (without `0 ≤ f`) must not be consumed by U2.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- Progress on the gate object `FAV_darroch_free` is real and complete at `proved_informal` (E-1 to E-4). It removes the only
  Darroch/Newton dependency of the Tier 1 (H) chain once second reads confirm it.
- The arm half is seat-derived. The private half is critic-attributed, because the seat's own route failed on the index.
- New `proved_informal` lemmas (E-3, and the (ii-2) and arc-value notes) and compiled sorry-free scratch (L-1) also count. So
  none of the stop gate's plateau conditions holds for this orientation.
- `ELIG_formal` and `HALL_formal` were not advanced by T. No decisive event arises: nothing at Tier 1 is formally verified, and
  no cut exists.

## Headline assessment

headline_resolved: no
status: still_open

- **Tier 1** (every class `m`: (E) and (H)) is **still_open at T's evidence grade.**
  - (H) is `proved_informal` along the SR-3 composition, modulo second reads. T's portfolio now supplies Darroch/Newton-free
    favorability (E-4) and the explicit E1 flow (E-5), but I have not re-verified the full composition myself.
  - (E) rests on the record's `computer_assisted` parent descent (the fixed `S_5` certificate), which T did not address.
  - No complete informal proof of the full Tier 1 statement has been verified by me, and no eligible deficient cut exists.
- **(L-S)_top**: `formally_verified` at template level (C1-LA1, an input). Its composition to the literal network is
  `proved_informal` (SR-3). T neither advanced nor weakened it; E-5 supplies the exact `ρ_1·γ` its Residual step consumes.
  still_open as a formally verified literal-network statement.
- **(ELIG-top)(a)**: untouched by T. The record's `computer_assisted` stands. still_open at T's grade as a certificate-free
  universal proof.

## Next-route allocation

**Exact remaining obligation for orientation T.** Informally, none on T's objects beyond the isolated second reads of E-1, E-2/E-3
and E-5/E-6. Formally, T owes two things:
- (1) `favorableLeaves (cbGraph m) p* = C5LA1.leafSet (cbGraph m)` in Lean, which is Group A plus Group B plus the `cbGraph` link
  nodes;
- (2) a proof of `cb8E1Arc_spec_topRank` (Group C).

Routes, each with what it could close in one cycle:
1. **`FORMAL-CB8-FAVORABILITY-CLOSED-FORM-BOTH-LEAF-CLASSES`.** Build Groups A and B as one award. Carry C1-LA3 1–17, and take
   C-T1-U's `Crit.lean` and C-T2-F's `Π` identity as the specification.
   - One cycle can close both closed-form terminals.
   - With the `cbGraph` closed-form links for `T−v` and `T−c_ij`, it can close `favorableLeaves (cbGraph m) p* = leafSet`
     outright. That discharges the `hfav` hypothesis of the terminal's reduction formally.
2. **`FORMAL-CB8-E1-TYPE-PATH-AND-CAPACITY`.** Formalize (ii-1), (ii-2) and `cb8Rho < 1` (Group C nodes (c) and (d)).
   - One cycle closes these nodes and leaves only the clone bijection and the double counts for the E1 terminal.
3. **`FORMAL-CB8-E1-CLONE-QUOTIENT-FLOW`.** Prove `cb8E1Arc_spec_topRank` over `cbGraph m`: the clone bijection plus the biregular
   double counts, given route 2's nodes.
   - One cycle is ambitious. The realistic close is the in-balance lemma on the clone product `K(1)^a × K(2)^b` as a stand-alone
     combinatorial theorem. That lemma is the smallest unproved formal lemma on the (HALL) terminal's T-side path.

Controller items, not routes:
- Order the isolated second reads of E-1, E-2/E-3 (both `Π` proofs) and E-5/E-6, to be registered as scope notes as ruled in
  Cross-route reconciliation.
- Reconcile the gate-ruling-9 row conflict.
- State the `Δ_p` convention in the Cycle 3 gate (R31-N-11).

## Artifact inventory

Adjudicator scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-adj-T/`.
Python 3 standard library only (`sys`, `json`, `hashlib`, `math.comb`, `fractions`), exact arithmetic, `python3 -B`.

| Path | SHA-256 | Role |
|---|---|---|
| `adj_fav.py` | `8989b622b974c0c63bbbce87634db9545ec92af54ad8de9aa297ef0451474235` | Literal CB(8,m) forest DP vs closed forms (small `(d,m)` and class rows 107/110/116/119); `x`, eligibility; E-1 margins; E-2 gap table; both `Π` forms (1,001 rows); T2's backward quantity; (G′) counterexamples and grid |
| `adj_fav_out.json` | `c98ef4ba8df10d85c0a54aa7f7b608de03987d8ac7548134cd10165ad112dcc7` | Output (canonical digest `9d585e4ca545ed47ae2b651c483a14c7c4308b054632f0535969feb84e1ca57f`) |
| `adj_fav_run.log` | `29c6928c4675e08ec3528c34af411a53ed4d2b0c2f7fb302a06c2561fda613e2` | Run log (17 s) |
| `adj_t3_arcs.py` | `32b40e862da9b4d9dc0428296d866743c84fe2e6fdb51639f3cec4d0ce74bfe6` | Literal check of E-5 arc values with derived `F_p` and (WID); class-level type totals at 107/116 |
| `adj_t3_arcs_out.json` | `66f1ac0f83a524e52c893bcaacadce237acd5b234fd49fa0282551ebddba0235` | Output (canonical digest `a1fab6439770ddd6b9ec067803092861ae9ae9cee8417edf2df6182f3a3900a3`) |
| `adj_t3_arcs_run.log` | `e4bd24f5ed81f7889525941c3ca7ee2cf777899c05087070741fcde94eff65fe` | Run log (4 s) |
| `lean-T1U/` | `Crit.lean` `9e400946…`, `Carried.lean` `9b613202…`, `Axioms.lean` `fa16c2bf…` | Copy-out of C-T1-U's project; `.lake/packages` symlinked to the pinned shared Mathlib (v4.32.2, `905b9581…`) |
| `lean-T1U/build.log` | `9c702cc9ba1bf24f626af18e75adf2ce1030ae5c229fb2e78f52ff11b540ef1b` | `lake build`: completed, exit 0 |
| `lean-T1U/axioms.log` | `d382c4390cac1891366691cb9038c4d447e8dd77621c016b1b0e229ad8c151c5` | `#print axioms`: standard three, exit 0 |

Replay: `cd` into the scratch directory, then run `python3 -B adj_fav.py 107 110 116 119` and `python3 -B adj_t3_arcs.py 107 116`.
For Lean, `cd lean-T1U && lake build && lake env lean LeanProof/Axioms.lean`. My one background job (PID 43196) exited before
this write. No process was killed, and none is running.
