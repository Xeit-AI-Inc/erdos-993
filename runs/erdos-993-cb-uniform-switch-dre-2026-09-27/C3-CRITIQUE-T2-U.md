# Critique

Critic `C-T2-U` (orientation U, formal / structural), Cycle 3 Stage 4, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`).
Assigned return: seat T2, route `C3-T-02`, mechanism `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER` (orientation T). Date 2026-09-28.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. The only VerityOS files I read were the two boot files the dispatch allows, in full:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other
subsystem.

**Dispatch.** `control/dispatch/c3-stage4/DISPATCH-C-T2-U.md`: SHA-256 recomputed as
`3a1b1f1dcb98c2e7f0b5ac37c094906ce36f6af931ef1f73d6cc098c55eb32ff`, which matches the digest given at launch.

**Read-boundary disclosures (every deviation).**
1. *Host injection.* Before my first action, the host put the project `CLAUDE.md` and the user auto-memory index (`MEMORY.md`)
   into my context as system-reminders. I did not open either file and did not use them. I followed the dispatch's boot rule
   and not `CLAUDE.md`'s boot or logging steps. I created no conversation log.
2. *Other seats' attack-brief sections.* I extracted my section of `control/C3-CRITIC-ATTACK-BRIEFS.md` with an `awk` that prints
   from the first line containing "T2". That also printed every later section (T3, F1–F3, U1–U3). I read them only while
   locating my own section, and nothing in this critique relies on them.
3. *Process listing.* Before the final write I ran `pgrep -fl lean` to check for my own leftover jobs. It also showed the command
   lines of sibling critics' builds (`c3-crit-U3-T`, `c3-crit-F1-T`, `c3-crit-F2-U`). I did not touch them, read their files or
   use them. I killed nothing, because my only background job had already exited.
4. *Searches inside the grant.* I listed `sources/` and some of its subdirectories without recursion. I ran one `grep -rl "TP-h" .`
   rooted at `sources/`. Beyond my capsule and the return's artifacts, I read these source files:
   `sources/r30/second-reads/SR-C4-6.md` (the CD-2 text of record), lines 600–720 of
   `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean` (C1-LA1's
   residual statement), the C1-LA3/C1-LA1 `Snippets/` and `DRAFTS/fragments/`, and `sources/c1-results/SOURCE-DIGESTS.json`.
   All of these are Stage 2 members. I did not read SR-C2-2, C-T3-F or C-T3-U. My TP-h proof below is my own.
5. I did not read any other return or critique, any adjudication or another experiment root. I used no network and installed
   nothing. I ran no `lake update` or `lake clean`. I ran `cd` into my own copied project before every `lake`/`lean` call.
   I wrote only under `scratchpad/c3-crit-T2-U/` and to this file.

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c3-critic-capsules/T2-PACKET-MANIFEST.json` inner seal | `0b1e257c07525f6695a05a1a367aa64992b815037986a7aa40351645360d8112` | same | **match** |
| Capsule members (14; bytes and SHA-256 each) | manifest | recomputed | **14/14 match** |
| Stage 2 manifest seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | same | **match** |
| Stage 3 manifest seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | same | **match**; lists `RETURN.md` at `3157db0a…addbf`, which matches the file |
| Stage 4 dispatch manifest seal | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | same | **match** |
| `PATH-CHECK-T2.json` | — | read | 13 files scanned, 0 findings |
| Return's `Main.lean` | `c11f62aa…b5b9d0` | same, in `scratchpad/c3-T2/` and in my copy | **match** |
| Return's `verify_t2.py` / `verify_t2.out.json` | `04f84da5…28f8db` / `82c2623d…438eb0` | same | **match**; my replay output is byte-identical |
| 24 carried fragments (C1-LA3 entries 1–21; C1-LA1 entries 11, 29, 30) | `sources/c1-results/SOURCE-DIGESTS.json` | each origin `Snippets/` and `DRAFTS/fragments/` file digest-verified, then searched for as a byte substring of `Main.lean` | **24/24 present verbatim** |

**Seal I cite:** `0b1e257c07525f6695a05a1a367aa64992b815037986a7aa40351645360d8112`.

**Carry residue.** I removed every origin fragment from `Main.lean`. Before the `R31-C3-T2 SCRATCH` marker, what remains is only
`import Mathlib`, one header comment and the `VERITYOS ENTRY … BEGIN/END` comment lines. Nothing was inserted into the carried
block. Entry 21 is an origin terminal and was carried as a `theorem`, byte for byte, without ruling 19's `theorem` → `lemma`
edit. That is stricter than the ruling requires and is harmless.

**Stage 3 index note.** The controller's disclosure summary for T2 says the seat "saw a sibling U3 build process (untouched)". The
return does not mention this (a case-insensitive search for "process" or "sibling" in `RETURN.md` finds nothing). Since the
return is the authority, the index entry is unsupported by the return. This is a record note only.

## Independent re-derivation

**Instruments.**
- **(I-1) Lean rebuild, copy-out-first.** I copied the project to `scratchpad/c3-crit-T2-U/replay/LeanProject` and bound
  `.lake/packages` by manual symlink to the pinned shared Mathlib (`905b9581…`, Lean v4.32.2). Then
  `lake env lean LeanProof/Main.lean` returned exit 0, zero errors and no `sorry` warnings. The output was linter warnings only:
  deprecated `push_neg`, `push_cast` doing nothing, and unused `hm`/`hmod` in `cb8Rho1_eq_cb8R1_ratio`.
- **(I-2) Axioms.** I ran `#print axioms` on all six of the return's declarations (`cb8R1_eq_coeffQ`, `cb8Rho_le_one`,
  `cb8Rho_lt_one`, `cb8Rho1_eq_cb8R1_ratio`, `likelihood_ratio`, `cb8_typePath_ii1`). Each depends on
  `[propext, Classical.choice, Quot.sound]` and nothing else. No `sorry`, `admit`, `native_decide` or `decide` appears in the
  new content.
- **(I-3) My own Python instrument** (`instr/crit_t2u.py`; standard library only, exact integers and `Fraction`). It builds every
  polynomial by repeated multiplication by `(1+X)` and `(1+2X)`. It never uses a binomial closed form for `r`. So it follows a
  different path from `cb8R1`'s sum, from the return's `N`/`r` and from its `coeff_conv`.
- **(I-4) Replay of the return's generator.** Running `verify_t2.py` in my scratch produced output byte-identical to the shipped
  `verify_t2.out.json`.

**Results of (I-3)** (`crit_t2u.out.json`, `32a3c1f3…`):
- **Bridge.** I compared `[X^k](1+X)^7(1+2X)^{8m−7}` against a literal transcription of the carried `cb8R1`, using ℕ-truncated
  `8m−7`. The comparison covers every `k` from 0 to `7 + (8m−7) + 2` (the whole support plus two beyond it), at
  `m = 0..6` (where the truncation matters) and at `m = 107, 110, 113, 125, 128, 140`. Result: **5,998 checks, 0 failures.** The
  return's Part A checked only `k < 60`, which is far below the index that matters (`k ≈ p* − 1 ≈ 570`). Its corroboration does
  not reach that index. Mine covers it, and the Lean lemma covers all `k` in any case.
- **`ρ_q < 1` at every `q ∈ [1, m]`.** Checked at `m = 95, 107, 110, 113, 116, 119, 122` and at ruling 17's fresh rows
  **`125, 128, 140`**. Result: **0 failures**, and at every row the maximum over `q` is attained at `q = 1`. The `ρ_1` fixed points
  of record match: `m = 107`: `5150844596024699/5173467627355748`; `m = 95`: `1354839571516225/1361543988640524`. Other values:
  `ρ_1(125) = 125082229581739/125552319952916`, `ρ_1(128) = 25247668247805897/25340326629755188`,
  `ρ_1(140) = 8658257094768325/8687303742996804`. At every row, `ρ_1` computed at the return's index `p* − 1` equals `ρ_1` computed
  at C1-LA1's literal index `K = (16m+1)/3`.
- **TP-g, TP-h and the return's reduction of TP-h.** Grid: `a, b ∈ [0, 25]`, every `j ∈ [−2, a+b+3]`, every `α ≤ a`; 20,956
  `(a, b, j)` triples. Result: **0 failures.** My termwise lemma `C(a,x)·C(a,z+1) ≤ C(a,x+1)·C(a,z)` for `x + 1 ≤ z`: 39,710
  checks, **0 failures**.
- **The literal E1 type-path totals at the class instances.** Instance: `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q`, every `q`, every
  `α`, with `g_α = ρ·T_{<α} − S_{<α}` and `h_α = S_{≤α} − ρ·T_{<α}`. Checked at `m = 107` (46,224 checks) and at the fresh rows
  `125` (63,000), `128` (66,048) and `140` (78,960). Result: **0 negative values.**
- **Mutation control** (`instr/mut.py`). Replacing `T_{<α}` by `T_{≤α}` in TP-h fails 12,600 of 31,200 times. The *unshifted*
  pairing `S_y T_x ≤ S_x T_y` (`x < y`) fails 44,268 times. So the checks can tell true statements from false ones, and the
  return is right that the naive pairing gives the wrong direction.

**Fidelity** (duty 2, as it applies to a polynomial-level route). This route has no network, selector, weight or `x`. There is
therefore no (WID) or `F_{p*}` for me to assert, and the return correctly declares that these do not apply. For the objects it
does touch, I read each Lean statement against its definition of record:
- `Sterm a b j α = C(a,α)·[y^{j−α}](1+2y)^b` is `N(α, j)`, and `Tterm` is `N(α, j−1)`. The coefficient is 0 at negative
  indices through `polyCoeffZ`, and 0 above `b` automatically.
- `rz a b k` is `[y^k](1+y)^a(1+2y)^b`, and is 0 for `k < 0`.
- TP-g in Lean is `r(j−1)·S_{≤α} ≤ r(j)·T_{≤α}` for `α ≤ a`. This is CD-2's first inequality exactly, for `j : ℕ`. CD-2 allows
  every integer `j`, but for `j < 0` everything vanishes, and on the class `j = p* − q ≥ 1`.
- In `cb8Rho_le_one` and `cb8Rho_lt_one`, the index `(16m+4)/3 − q − 1` never truncates, because `q ≤ m < p* − 1`. The
  positivity side condition `p* − q − 1 ≤ 8m` is discharged by `omega` from `107 ≤ m`, `1 ≤ q ≤ m`. These are exactly
  `ρ_q = r_q(p*−q)/r_q(p*−q−1)` with `a_q = 8q−1`, `b_q = 8(m−q)+1`, as in SEMANTIC-CONTRACT §2.

## Attacks and findings

**F-1 (attack brief, first question: the bridge's scope). Confirmed.** `cb8R1_eq_coeffQ (m k : ℕ)` has no hypotheses. It states
`(((1+X)^7·(1+2X)^(8m−7) : ℤ[X]).coeff k : ℚ) = (cb8R1 m k : ℚ)` for **every** `m` and every `k`, with no restricted range. The
ℕ-truncation of `8*m − 7` is the same expression on both sides, and my bridge check at `m ≤ 6` agrees. The proof splits the
product with `coeff_mul` into an antidiagonal sum, turns it into a range sum, uses `coeff_one_add_X_pow` and the new
`coeff_one_add_two_mul_X_pow` (proved through `add_pow`), and uses `sum_subset` to discard the `i > 7` terms.

**F-2 (attack brief: does `ρ_1` use `K = p* − 1` as C1-LA1 does?). Mathematically yes. Syntactically no, and no compiled link
existed. The claim must be narrowed.**
- C1-LA1's residual (entries 32–33, read in the frozen source) is
  `cb8Theta m ≤ 1 − (cb8R1 m ((16*m+1)/3) : ℚ) / (cb8R1 m ((16*m+1)/3 − 1) : ℚ)`.
- The return's `cb8Rho1_eq_cb8R1_ratio` instead uses `(16*m+4)/3 − 1` and `(16*m+4)/3 − 2`. These are equal as naturals for
  every `m`, but they are different terms, so Lean needs an explicit rewrite to connect them.
- The left side of `cb8Rho1_eq_cb8R1_ratio` is written with the exponents `7` and `8*m−7`. The exponents of entry 20
  (`cb8_E1_conditionI_topRank`) and of `cb8Rho_lt_one` at `q = 1` are `8*1−1` and `8*(m−1)+1`. The docstring says these
  rewrites "close the shape match", but the lemma does not perform them.
- Result: no declaration in the return states "`ρ_1 < 1` in the `cb8R1` form C1-LA1 consumes". The return's phrase "the exact
  phrasing of Cycle 2's synthesis R-4" is narrowed accordingly.
- The lemma's hypotheses `hm` and `hmod` are unused, as the linter reports. The lemma is a pure rewrite that holds for every `m`.
- **Critic-derived repair (compiled):** `critic_cb8R1_rho1_lt_one_LA1form` and `critic_cb8_residual_capacity_pos` (see
  Remaining obligation).

**F-3 (TP-g proof). Checked line by line; sound.**
- `likelihood_ratio` instantiates carried entry 15 at `a = 0` with `i = j − y` and `j' = j − 1 − x`. The requirement `i ≤ j'` is
  `x + 1 ≤ y`. Multiplying by `C(a,x)·C(a,y) ≥ 0` gives `S_x T_y ≤ S_y T_x`.
- In `cb8_typePath_ii1`, the split at `α`, the identity closed by `ring` (`goal_eq`) and the nested `sum_le_sum` over cross
  pairs `x ≤ α < y` are correct. The `j = 0` branch is correct: `T ≡ 0` and `r(−1) = 0`.
- Entry 15 is proved by induction on linear factors, a Darroch-free and Newton-free strong log-concavity. There is no hygiene
  issue.

**F-4 (TP-h, the step the return leaves open). Closed by the critic in Lean; see Remaining obligation.**
- The return says TP-h "needs a second, structurally different likelihood-ratio lemma" through a `β`-reindexing. That is true in
  substance but overstates the cost.
- A shift-by-one pairing avoids any reindexing: `S_{z+1}·T_x ≤ T_z·S_{x+1}` for `x + 1 ≤ z`. The `f`-factors on the two sides
  are literally the same, `f(j−1−z)·f(j−1−x)`. So only the strong log-concavity of `C(a,·)` enters, which is entry 15 at `b = 0`.
- The return's reduction `S_{>α}·T_{<α} ≤ S_{≤α}·T_{≥α}` is correct, and my proof goes through it:
  1. Pair `y = α+1+k` with `T_{α+k}`, and `x < α` with `S_{x+1}`.
  2. Bound the double sum termwise with the lemma above.
  3. Enlarge each factor to `T_{≥α}` and `S_{≤α}` using nonnegativity.
- The return's diagnosis of the naive (unshifted) pairing is confirmed by my mutation control.

**F-5 (input grades misdescribed). Struck.** Under `## Grades`, the return calls the carried entries "kernel-checked scratch inside
their own (still-open, not-yet-Stage-7-closed) runs C1-LA3/C1-LA1". The common brief and `C3-ALLOCATION.md` record C1-LA1 and
C1-LA3 as governed awards that are **formally verified**. The description understates the grade, so it causes no upward
contamination, but it is wrong and is struck. The inputs keep their recorded grades.

**F-6 (fresh rows, gate ruling 17). Procedural gap, cured by the critic.** The return's Part B sweeps `ρ_q < 1` only at
`m ∈ {107, 110, 113}`, which it calls "fresh/control rows". Ruling 17's fresh rows are `125, 128, 140`, and 107–122 are controls.
The universal statement rests on the carried, formally verified entry 20, so the omission is not load-bearing. I tested
`125, 128, 140`: 0 failures for `ρ_q < 1` and for the type-path totals.

**F-7 (scratch hygiene). Minor.**
- The return says the `#print axioms` copy was "appended, then discarded". In fact `LeanProof/AxiomCheck.lean` is still in
  `scratchpad/c3-T2/`, together with the un-inventoried `Test1.lean`–`Test4.lean`. None of them is imported. The shipped `Main.lean`
  is exactly as digested, so this affects accuracy of the description only.
- Integration risk: the new names `rr`, `rz`, `fB`, `Nterm`, `Sterm` and `Tterm` sit in the shared namespace `E993Transport`.
  A merged project must check them for collisions with U2/T1 vocabulary. I could not check this, because I may not read sibling
  returns.

**F-8 (route object not reached).** The zero-weight classification and the adapter "`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis"
were not attempted. The return says so plainly and gives a sound reason: they need the C1-LA2 `cbGraph` carry. It makes no claim
about them.

**Cut attack.** This route has no network, so no cut can come from it. Every exact check above passed. `cut_candidate: none`.

## Mechanism-equivalence and fence check

- **Registry and alias.**
  - No `E993-R31-` key is proposed, and none is needed.
  - TP-g (the return) and TP-h (the critic), taken together, are a Lean formalization of CD-2(a). CD-2(a) is the scope note
    `[r30 C4; SR-C4-6]` on `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, graded `proved_informal`.
    The formalization is generic in `a, b` and takes `j : ℕ`.
  - It is a formal node of an existing key, not an alias of a new claim. It does not discharge the E1 key, which also needs the
    clone bijection and the biregular double counts (T1's nodes (a) and (b)) and the graph-level wiring.
  - `cb8Rho_le_one` and `cb8Rho_lt_one` are ratio forms of entry 20: the condition-(i) key at `p*`, graded `formally_verified`
    through C1-LA3. This is a restatement, not new mathematics, and the return says so.
  - `cb8R1_eq_coeffQ` is a vocabulary bridge between two carried objects. It is not a registered identity re-proved.
- **Fence 1 (one rank; the class only).** The generic lemmas hold for all `a, b, j`. They are polynomial facts, not claims about
  the tree at another rank. Every class statement has `107 ≤ m`, `m % 3 = 2` and index `p* − q`. Nothing transfers to (HALL),
  to the aggregate keys or to #993.
- **Fence 3 (Darroch/Newton).** Neither is used. Entry 15 is an induction over linear factors applied to `(1+X)^a(1+2X)^b`,
  which is real-rooted. My lemma uses it only at `b = 0`, on `(1+X)^a`.
- **Fence 6 and ruling 20 (refuted mechanisms).** The refuted two-binomial *ascent* tool (G′) is not used by the return or by me.
  Entry 15 is a descent (two-by-two minor) fact.
- **Fence 7 (census discipline).** No sweep is offered as proof. Every universal statement here is a Lean theorem. The sweeps
  are corroboration only.
- **Fence 4 (template vs network).** The route stays at polynomial level and says it touches neither the sector template nor the
  literal network.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "compiles … zero errors, zero `sorry`" | my rebuild: exit 0, no errors, no `sorry` | **backed** |
| axioms `[propext, Classical.choice, Quot.sound]` for all six | my `#print axioms` | **backed** |
| "24 carried files matched" and "byte-identical" | 24/24 verbatim; residue shows no insertion | **backed** |
| digests of `Main.lean`, `verify_t2.py`, `out.json`; "replay output byte-identical" | recomputed; my replay is byte-identical | **backed** |
| "480/480 match" (Part A) | replayed | **backed as stated**; covers only `k < 60`, not the operative index (my check covers the full support) |
| `ρ_1` fixed points at 107 and 95 "exactly" | independent instrument | **backed** |
| "330 checks, 0 failures" (Part B) | replayed | **backed**; the rows are controls, not ruling 17's fresh rows (F-6) |
| "18,455 checks, 0 failures" (Parts C and D) | replayed; my own grid agrees | **backed** (bounded corroboration only) |
| "`ρ_1` literally as `cb8R1 m K / cb8R1 m (K−1)` … the exact phrasing" | index terms differ from C1-LA1's `(16m+1)/3`; no compiled `ρ_1 < 1` in `cb8R1` form | **narrowed** (F-2); repaired by the critic |
| carried inputs "still-open, not-yet-Stage-7-closed" | contradicts the recorded awards | **struck** (F-5) |
| "`#print axioms` … appended, then discarded" | `AxiomCheck.lean` retained in scratch | **inaccurate description**; not load-bearing (F-7) |
| "TP-h … not proved" and "smallest remaining node of (c)" | true at return time | **backed**; now closed in critic scratch (F-4) |
| route verdict `compiled`, gate lines all `not_advanced` | see Verdict | `compiled` is **backed**; I rule `E1_formal` differently below |

The return's `## Remaining obligation` is exact on TP-h: it names the target and the reduction, and correctly diagnoses the
wrong-direction pairing. It is also exact on the zero-weight classification and the adapter. It is incomplete in one place: it
does not name the `ρ_1`/`cb8R1` index-syntax link to C1-LA1 (F-2) as still open.

## Verdict

verdict: retained_narrowed
headline_resolved: no

COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none

**Reasons.**
- Every compiled declaration of the return is correct, faithful to CD-2 and SEMANTIC-CONTRACT §2, carried byte for byte, and
  free of `sorry` under standard axioms. The Lean rebuild and the generator replay both reproduce.
- The narrowing concerns only statements *about* the content: F-2 (the `ρ_1` "exact phrasing" and the missing link to C1-LA1's
  syntax), F-5 (misdescribed input grades, struck), F-6 (fresh rows) and F-7 (scratch description).
- `E1_formal: advanced` is my ruling, not the return's. Both halves of node (c) and node (d) of the E1 formal DAG are now compiled
  in scratch: TP-g by the return, TP-h and the `ℚ` type-path totals at the class instance by this critic. Only scratch compiles
  have been made; no governed award closes around them, so they carry no grade (SOLUTION-CONTRACT §4).
- Conjunct 4, the terminal and the headline are untouched.
- The mathematics of CD-2(a) is complete in Lean at scratch level. As informal mathematics it stays `proved_informal` at its
  registered grade, and the Lean form awaits a governed award.

## Remaining obligation

**Critic-derived advances** (attributed to critic `C-T2-U`, Claude Opus 5.5). All are compiled in
`scratchpad/c3-crit-T2-U/replay/LeanProject/LeanProof/CriticSection.lean.part`, appended unchanged after the return's `Main.lean`
as `CriticMain.lean`. Each builds with `lake env lean` at exit 0, has no `sorry`, and each `#print axioms` gives
`[propext, Classical.choice, Quot.sound]`.

1. **TP-h / (ii-2), formally.** Stated in the return's own vocabulary, so it is a drop-in companion to `cb8_typePath_ii1`:
   ```lean
   theorem critic_typePath_ii2 (a b j α : ℕ) (hα : α ≤ a) :
       rz a b (j : ℤ) * ∑ α' ∈ Finset.range α, Tterm a b j α' ≤
         rz a b ((j : ℤ) - 1) * ∑ α' ∈ Finset.range (α + 1), Sterm a b j α'
   ```
   Its auxiliary lemmas:
   - `critic_choose_strongLC`: carried entry 15 at `b = 0`.
   - `critic_likelihood_ratio_h`: for `x + 1 ≤ z`, `S_{z+1}·T_x ≤ T_z·S_{x+1}`.
   - `critic_fB_nonneg`, `critic_Sterm_nonneg`, `critic_Tterm_nonneg`.
2. **The E1 type-path totals are nonnegative in ℚ.**
   - `critic_typePath_totals_nonneg`: `h_α = S_{≤α} − ρ·T_{<α} ≥ 0` and `g_α = ρ·T_{<α} − S_{<α} ≥ 0` for `α ≤ a`, whenever
     `r(j−1) > 0`.
   - `critic_cb8_E1_typePath_totals_nonneg`: the class instance `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q`, `1 ≤ q ≤ m`,
     `107 ≤ m`, `m % 3 = 2`. The positivity of `r(j−1)` is discharged inside the proof from entry 14.
   - Together these close node (c) at the class.
3. **The link to C1-LA1's syntax.**
   - `critic_cb8R1_rho1_lt_one_LA1form`: `(cb8R1 m ((16*m+1)/3) : ℚ) / (cb8R1 m ((16*m+1)/3 − 1) : ℚ) < 1` on the class. Its
     index text is exactly that of C1-LA1's `cb8_sectorTemplate_residual`.
   - `critic_cb8_residual_capacity_pos`: `0 < 1 − ρ_1` in the same text.

**Still open for the successor.**
- (i) The zero-weight classification of non-sector sources on `cbGraph m`. This needs the C1-LA2 carry.
- (ii) The adapter "`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis", including the switch-image clause.
- (iii) T1's node (b): the biregular double counts and the in-balance `h_{α'} + g_{α'+1} = ρ_q·T_{α'}` on the clone product.
  Items 1–2 above supply the nonnegativity half of the E1 flow's arc values. Node (b) supplies the balance half.
- (iv) A governed award, which must freeze statements (i)–(ii) together with the critic lemmas.
- (v) An isolated second read of items 1–3. Critic-derived content is STATED, not registered.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T2-U/`.

| Artifact | SHA-256 | Role |
|---|---|---|
| `replay/LeanProject/LeanProof/Main.lean` | `c11f62aa26e237ecd3ab8fdbb7dc2c762a388c479d7a08b09e7577f1d4b5b9d0` | copy-out of the return's file (unchanged) |
| `replay/lean_replay.log` | `79166388d3f1f47930d71991bc47a867318af416afb2cb3f43ceb02aa918ca4c` | rebuild of `Main.lean`, exit 0 |
| `replay/LeanProject/LeanProof/CriticSection.lean.part` | `983599e5d473909151492c69bdbbddc8df274c5f49934918bdc4511ad323e732` | critic-derived Lean (181 lines) |
| `replay/LeanProject/LeanProof/CriticMain.lean` | `53eb800fa5a55e482e293152547440e4cce8fa1a6c9d74df1d7432b543bd0be0` | `Main.lean` followed by the critic section |
| `replay/critic_main.log` | `dc15c8594143b37f012342a3b6d4ed3a708c49d8af46c3ec0cbda41ffded8885` | build of `CriticMain.lean`, exit 0 |
| `replay/LeanProject/LeanProof/CriticAx.lean` | `11c4407bf90199f23d5c24996e1e2baa2fccbdc8f1823bded5fd4b6878f7ae0a` | `CriticMain.lean` plus `#print axioms` for 11 declarations |
| `replay/critic_ax.log` | `032b5d93acfd2db0a761cb79b5dd25e65f01e1771b4d5a1d899b9f3c1fc6bc9c` | axioms output, exit 0 |
| `replay/verify_t2.py`, `replay/verify_t2.out.json` | `04f84da5…28f8db`, `82c2623dc9b46bdf03e867d32d1312493da8c9c6fd9c264efe6c425b4a438eb0` | return's generator, replayed; output byte-identical |
| `instr/crit_t2u.py` | `b8769c0e361289ce7a86c88b1f5a1e1a8189f7e9ab3bbd1972272733293f7402` | critic's own instrument |
| `instr/crit_t2u.out.json` | `32a3c1f3cb8dd331553cb8c9cf9389b1bfcf47a4ad76bded2731ebaf5b26aa89` | its output |
| `instr/mut.py`, `instr/mut.out.txt` | `fdbd9226361f1d184950a45bf78663a7cd8e0eb9eecf187a3a02bde939597c8a`, `fc7d756cdeb5545d9e2a9e8a95d6e29041340ddccf0eb418d6054c957adaa623` | mutation control |

**Replay commands.**
- Lean: `cd …/scratchpad/c3-crit-T2-U/replay/LeanProject && lake env lean LeanProof/CriticAx.lean`. `.lake/packages` is
  symlinked to the pinned shared Mathlib.
- Instrument: `cd …/scratchpad/c3-crit-T2-U/instr && python3 -B crit_t2u.py && python3 -B mut.py`.

**Background jobs.** I started one background job, the first `lake env lean` rebuild, and it exited 0 before this write. No job of
mine is running.
