# Critique

Critic `C-T2-F`, Cycle 3 Stage 4, r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top
sector-deficient rank). Orientation F (falsify), against seat `T2`'s return: route `C3-T-02`, mechanism token
`E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`, orientation T.

**Model disclosure (two parts):**
chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. Boot files read in full, and no other VerityOS files: `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup protocol's task-type map into memory,
conversations, modules, skills, logs or decisions. The dispatch limits the boot to these two files, and the controller has booted for the run.

**Read-boundary disclosures.**
1. *Host injection.* Before my first action, the host placed the project `CLAUDE.md` and the user auto-memory index (`MEMORY.md`)
   into my context as system-reminders. I did not open either file and used nothing from them.
2. *Process listing.* Before the final write I ran `pgrep -fl "lean|lake"` once, to confirm that I had no background job of my own.
   Its output showed the command lines of sibling seats' running Lean builds (scratch directories of other critics). I did not read,
   touch or kill any of them, and I used nothing from them. I own no background job.
3. *Searches.* Every `grep`/`ls` I ran was rooted inside my grant: `sources/` (non-recursive `ls`; `grep` on named files), my own scratch,
   the inventoried `scratchpad/c3-T2/` directory (a non-recursive `ls` only), and the return file. None was rooted above the grant.
   There was no network access, no install, no `lake update` and no `lake clean`.

## Identity and seal audit

- **Dispatch file:** SHA-256 `0c7e7b50fd4afdfc0211e9833c9c6ce43aaa73654b4767d0472bbcf72bd80516`. **Match.**
- **Capsule seal** (`control/c3-critic-capsules/T2-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys,
  `(",", ":")`, no trailing newline): `0b1e257c07525f6695a05a1a367aa64992b815037986a7aa40351645360d8112`. **Match.** All 14 members
  match on both SHA-256 and byte count.
- **Stage 2 seal:** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`. **Match.**
- **Stage 3 seal:** `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`. **Match.** It lists `RETURN.md` at
  `3157db0a…5addbf`, which equals the capsule's digest.
- **Stage 4 dispatch seal:** `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`. **Match.** The file digest is
  `0c10bd42…6de6373`, as the capsule records.
- **Digests the return lists, recomputed on the copies in `scratchpad/c3-T2/`:**
  - `Main.lean` `c11f62aa…b5b9d0`: match.
  - `verify_t2.py` `04f84da5…28f8db`: match.
  - `verify_t2.out.json` `82c2623d…438eb0`: match.
- **Carries, gate ruling 19.** I extracted each of the 24 `VERITYOS ENTRY … BEGIN/END` blocks from `Main.lean`. Each block is
  **byte-identical** to its origin fragment under `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/…/Snippets/`
  (entries 1–21) or `…c1-la1-cb8-sector-template-feasible/…/Snippets/` (entries 11, 29, 30): 24/24 exact.
  - The digest in each marker equals the SHA-256 of its block.
  - All 24 fragments match `sources/c1-results/SOURCE-DIGESTS.json`.
  - Each origin fragment occurs verbatim in its origin `Main.lean` (21/21 and 33/33).
  - Those `Main.lean` digests (`c0605e12…`, `f0578ed7…`) are bound in the origins' `RECEIPTS/kernel-verification.json` (verdict `verified`).
  - The replay project's `lake-manifest.json` is byte-identical to C1-LA3's. It is pinned to Mathlib `905b9581…`, which equals `PIN.json`.
- **Procedural note (ruling 19).** Entry 21 (`cb8_block_descent_topRank`, the C1-LA3 origin terminal) is carried as `theorem`. The
  ruling's "single keyword edit `theorem` → `lemma` and a recorded reversibility check" was not made or recorded. The carry is
  byte-identical, so nothing mathematical is affected. The deviation is procedural only.
- **Disclosure-index discrepancy.** The controller's Stage 3 disclosure index summarises T2 as "…saw a sibling U3 build process
  (untouched)". The return's own face says "No other deviation" and nowhere mentions a sibling process. The return is the authority,
  but it omits an observation that the controller attributes to the seat.

## Independent re-derivation

**Instrument.** `scratchpad/c3-crit-T2-F/instr/crit_t2f.py` (SHA-256 `c1f21df2…badd99`; output `crit_t2f.out.json` `1dfa37ca…ebec146`).
It uses the standard library only, with exact integers and `Fraction`, and **no `math.comb`**.
- Coefficient rows are built by integer ratio recurrences.
- They are cross-checked against literal repeated polynomial multiplication by `(1+x)` and `(1+2x)`.
- No T2 code is imported.

The instrument checks the following, with results:

| Check | Scope | Result |
|---|---|---|
| **R-4 bridge:** `cb8R1 m k = [x^k](1+x)^7(1+2x)^{8m−7}` against the literal product | EVERY `k ∈ [0, 8m+2]` at `m ∈ {95,107,110,113,116,119,122,125,128,140}` (9,430 checks) | 0 failures |
| **Node (d):** `0 < r_q(p*−q) < r_q(p*−q−1)` | every `1 ≤ q ≤ m`: controls 107–122 and gate ruling 17's fresh rows 125, 128, 140 | 0 failures |
| `ρ_1(95)` | against `1354839571516225/1361543988640524` (the `SEMANTIC-CONTRACT.md` §5 record) | matches |
| `ρ_1(107)` | recomputed independently | `5150844596024699/5173467627355748`, equal to T2's value (see Certification audit for its "of record" label) |
| C1-LA1 index `K = (16m+1)/3 = p*−1` and `cb8R1 m K < cb8R1 m (K−1)` | every row above | holds |
| TP-g, TP-h and the return's TP-h reduction `S_{>α}T_{<α} ≤ S_{≤α}T_{≥α}` | every `α ∈ [0,a]` at every class instance `(a,b,j) = (8q−1, 8(m−q)+1, p*−q)`, `1 ≤ q ≤ m`, on all nine rows (1,080 instances, 526,032 α-checks) | 0 failures |
| The same three inequalities | grid `a,b ≤ 30`, `j ∈ [0, a+b+2]` (31,713 instances, 584,288 α-checks) | 0 failures |
| Discrimination: TP-h with `T_{≤α}` in place of `T_{<α}` | grid | fails 5,082 times, so the checker discriminates |
| The critic's shifted binomial log-concavity (below) | `a ≤ 60` (39,711 checks) | 0 failures |

- On every row, the largest `ρ_q` is at `q = 1`: 0.99563 at `m = 107`, rising to 0.99666 at `m = 140`.
- The table is corroboration only. The universal statements rest on the Lean proofs.

**Lean rebuild.** `Main.lean` was copied out first into `scratchpad/c3-crit-T2-F/replay/LeanProject/`, with Mathlib bound by manual
symlink. `cd` into the project, then `lake env lean LeanProof/Main.lean` gave exit 0, 0 errors and no `sorry`. The only warnings are
linter warnings: unused `hm`/`hmod` in `cb8Rho1_eq_cb8R1_ratio`, no-op `push_cast`, and deprecated `push_neg`.

**`#print axioms`** (run on my `Critic.lean`, which is the unchanged `Main.lean` with a block appended). Every one of `cb8R1_eq_coeffQ`,
`cb8Rho_le_one`, `cb8Rho_lt_one`, `cb8Rho1_eq_cb8R1_ratio`, `likelihood_ratio`, `cb8_typePath_ii1`, `rr_eq_coeff` and
`coeff_one_add_two_mul_X_pow` gives `[propext, Classical.choice, Quot.sound]`. None uses `sorryAx`, `native_decide` or `admit`.

**Replay of T2's generator.** `verify_t2.py` was copied out first into my scratch and run with `python3 -B`. Its output is
**byte-identical** to the original (`82c2623d…`).

**Statements read against the objects of record (SR-C4-6 §SR-C4-6a; the E1 criterion key's TEXT (a)).**
- `Sterm a b j α = C(a,α)·fB b (j−α)` and `Tterm = C(a,α)·fB b (j−1−α)`. Here `fB b t = [y^t](1+2y)^b`, which is 0 for `t < 0`. These
  are exactly `S_α = N(α,j)` and `T_α = N(α,j−1)`.
- `rz a b k = r(k)`, the true coefficient; `rr_eq_coeff` links the two.
- `cb8_typePath_ii1` is TP-g verbatim: `r(j−1)·S_{≤α} ≤ r(j)·T_{≤α}`, for `α ≤ a`.
- The Lean scope is `j ∈ ℕ`, where the record has every integer `j`. Negative `j` is degenerate (both sides 0), and E1 uses
  `j = p* − q ≥ p* − m > 0`. This narrowing is harmless.
- `cb8R1_eq_coeffQ` holds for **all** `m, k` with no restricted range. This answers the attack brief's first question: yes.

## Attacks and findings

1. **The attack brief: does `ρ_1 = cb8R1 m K / cb8R1 m (K−1)` use `K = p*−1` as C1-LA1 does?** The value does. The *literal indices*
   do not.
   - `cb8Rho1_eq_cb8R1_ratio` uses `(16m+4)/3 − 1` and `(16m+4)/3 − 2`.
   - C1-LA1's frozen switch-capacity statements (origin `Main.lean` lines 628 and 706) use
     `1 − cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`.
   - Its left side also uses `(1+X)^7(1+2X)^(8m−7)`, not entry 20's `(1+X)^(8·1−1)(1+2X)^(8(m−1)+1)`.
   - So the return's lemma composes literally with neither `cb8Rho_lt_one` at `q = 1` nor C1-LA1's residual.
   - The return's "exact phrasing … as C1-LA1 does" is therefore **narrowed to value-equal, syntactically unlinked**.
   - I closed the link in Lean (below).
2. **TP-h, "no shortcut through carried content".** This claim is **refuted by construction**. The return says TP-h "needs a second,
   structurally different likelihood-ratio lemma" and a β-substitution, and that no shortcut exists. A *shifted* pairing
   `(x, y) ↦ (x+1, y−1)` (for `x < α < y`) works directly:
   - Termwise, `S_y·T_x ≤ S_{x+1}·T_{y−1}`. The two `(1+2X)^b` factors `fB(j−y)`, `fB(j−1−x)` are *identical on both sides*.
   - What remains is `C(a,x)·C(a,y) ≤ C(a,x+1)·C(a,y−1)` for `x+1 ≤ y−1`, which is carried entry 15 at `b = 0`.
   - The return's observation that the *identity* pairing bounds the wrong direction is correct, but it does not rule out this route.
   - See the critic-derived advance under `## Mechanism-equivalence and fence check`.
3. **The reduction of TP-h is correct.** `r(j−1)S_{≤α} − r(j)T_{<α} = S_{≤α}T_{≥α} − S_{>α}T_{<α}`, using `r(j) = S_{≤α}+S_{>α}` and
   `r(j−1) = T_{<α}+T_{≥α}`. Both are checked in Lean inside my proof (`goal_eq`).
4. **Hypothesis attack.** No compiled statement carries a hypothesis that encodes its conclusion.
   - `cb8Rho_le_one`/`_lt_one` consume entry 20. Entry 20 *is* condition (i) in coefficient form, and the lemmas add only
     `div_lt_one` plus entry 14's positivity. That is what the allocation asks for (node (d) "from entry 20 plus entry 14"), and the
     return says so.
   - `hm`/`hmod` in `cb8Rho1_eq_cb8R1_ratio` are unused, which is harmless padding.
   - `m ≥ 107` and `m ≡ 2 (mod 3)` enter node (d) only through entry 20 and the `omega` index bound (`p*−q−1 ≤ 8m`). The endpoint
     `m = 107` is covered.
   - There is no ℕ-subtraction hazard: `8m−7` is used identically on both sides of the bridge. `(16m+4)/3 − q − 1` is ≥ 0 on the
     class, and entry 20 is stated in exactly that form.
5. **Newton/Darroch.** Neither is used anywhere. Entry 15 is a two-by-two-minor induction over linear factors, a statement about the
   `r_q` of products of linear factors. It is not applied to `I`, `G` or `G^m`, so there is nothing to strike.
6. **Refuted-mechanism check (ruling 20).** The two-binomial ascent tool (G′) is not used, by T2 or by me. Both likelihood-ratio
   steps are descent/minor facts.
7. **Fresh rows (ruling 17).** T2's sweeps used 107, 110 and 113 (control rows). Its node (d) text calls them "fresh/control rows",
   but ruling 17's fresh rows 125, 128 and 140 were never run. The universal claims are Lean-proved, so this is corroboration hygiene,
   not a gap in proof. I ran 125, 128 and 140 (0 failures).
8. **Fidelity-first items** (active-tag weight, (D) ∪ (S), `F_{p*}` derived, `x` through `α`, (WID) from independent sides, ruling 16's
   index, ruling 18's `G`). **Not applicable.** T2 builds no network, selector, `x` table or supply/capacity sum, and reports no number
   that depends on them. No fidelity failure is possible here, so nothing downstream is struck on fidelity grounds.
9. **Scope of what is still open (the return is correct).** The zero-weight classification and the adapter lemma (`cb8E1Arc_spec_topRank` ⇒ U2's
   E1 hypothesis) are statements over `cbGraph m`. T2 did not carry C1-LA2 and did not attempt them. The return says so accurately.
   These two items are the route's unmet "could close" object.

## Mechanism-equivalence and fence check

- **Mechanism.** T2's content is interface infrastructure: a coefficient bridge, a ratio form of condition (i), and the type-path
  inequalities (E1 condition (ii), CD-2). It is not a new transport mechanism and not an alias of any registered claim.
  - `cb8_typePath_ii1` formalizes half of CD-2, the scope note of `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`.
    It is a formalization at the key's own generality (`a, b ≥ 0`, `j ∈ ℕ`).
  - It is not a restatement presented as progress on (L-S)_top or (ELIG-top)(a), and the return does not present it that way.
  - Registry keys touched: that key (context), and the condition-(i) threshold key (cited). `(HALL)` and the primary aggregate are not touched.
  - T2 proposes no `E993-R31-` key, so there is nothing to alias-check.
  - Lexical alias check: the new declaration names in T2 and in my block (`critF_*`) do not match any `E993-*` key.
- **Fences (`SOLUTION-CONTRACT.md` §3):**
  - one rank per tree, `p*` only: respected;
  - no status transfer: respected;
  - census never proof: respected (numerics are labelled corroboration);
  - `θ*` law: not used;
  - r30 bounded record: not used as proof;
  - Darroch/Newton: not used;
  - sealed roots: not edited.
  - Attribution: CD-2's proof is SR-C4-6's, and the carried machinery is C1-LA3's/C1-LA1's. The return credits these.
- **Critic-derived advance (C-T2-F; scratch, compiled, no grade).** `scratchpad/c3-crit-T2-F/replay/LeanProject/LeanProof/Critic.lean`
  (SHA-256 `cbed43aaf3beee5d912d1df79bc04f10d46819759b5418c491863bbb7a7fba4f`) is T2's unchanged `Main.lean`, verified as a byte
  prefix, followed by a critic block. It compiles with `lake env lean` (exit 0, 0 errors, no `sorry`). `#print axioms` gives
  `[propext, Classical.choice, Quot.sound]` for each new declaration. **TP-h / (ii-2), the node the return leaves open, is now compiled:**

  ```lean
  theorem critF_cb8_typePath_ii2 (a b j α : ℕ) (hα : α ≤ a) :
      rz a b (j : ℤ) * ∑ α' ∈ Finset.range α, Tterm a b j α' ≤
        rz a b ((j : ℤ) - 1) * ∑ α' ∈ Finset.range (α + 1), Sterm a b j α'
  ```

  - It is TP-h verbatim: `r(j−1)·S_{≤α} ≥ r(j)·T_{<α}`. It is stated over T2's own `Sterm`/`Tterm`/`rz`, in `cb8_typePath_ii1`'s shape.
  - Proof route: `critF_choose_shift_LC` gives `C(a,x)C(a,y) ≤ C(a,x+1)C(a,y−1)` for `x+1 ≤ y−1`, from carried entry 15 at `b = 0`.
    Then `critF_shifted_pair` gives `S_y T_x ≤ S_{x+1} T_{y−1}`.
  - The double sum over `y ∈ [α+1, a]`, `x < α` is bounded by `(Σ_{x<α} S_{x+1})·(Σ_{y∈[α+1,a]} T_{y−1})`. That product is
    `≤ S_{≤α}·T_{≥α}`, since both factors are sub-sums of nonnegative terms.
  - The `j = 0` case is degenerate.
  - With T2's `cb8_typePath_ii1`, **node (c) is compiled in scratch in both halves.**
  - Also compiled, closing finding 1:
    - `critF_cb8Rho1_eq_c1la1_ratio (m) (1 ≤ m)` equates entry 20's literal `q = 1` ratio with `cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`.
    - `critF_cb8R1_residual_pos (m) (107 ≤ m) (m % 3 = 2)` gives `0 < 1 − cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`. This is
      `ρ_1 < 1` in C1-LA1's own literal vocabulary, the subtrahend of its switch-capacity statement.
  - The mathematics of TP-h was already `proved_informal` (SR-C4-6). What is new is the short shifted-pairing proof and its compilation.
    It needs no β-reindexing and no second lemma beyond entry 15.

## Certification audit

Struck or narrowed:
1. **"`ρ_1` at `m = 107` and `m = 95` matches the two fixed points of record (`SEMANTIC-CONTRACT.md` §5)" is narrowed.** §5 records
   `ρ_1` only at `m = 95`. At `m = 107` it records `θ*` and a margin, not `ρ_1`. In `verify_t2.py`, the `m107_rho1_expected` literal is
   hardcoded with no record source, so `m107_rho1_matches_record: true` is unbacked. The *value* is correct: I reproduced it
   independently. What is struck is the label "of record", which leaves **one** fixed point of record.
2. **"The strict form checked … at the three named fresh/control rows `m ∈ {107,110,113}` (gate ruling 17's control rows)" is
   narrowed** to control rows only. No fresh row of ruling 17 was run by T2.
3. **"Part D … 18,455 checks … both TP-h itself and my algebraic reduction" is narrowed.** Per the replayed code, the reduction was
   checked on the 18,125-instance grid only, not on the 330 class instances. The gate-line tally "18,455×2" overstates it.
4. **"Axiom check … run against a scratch copy … then discarded" is inaccurate.** `scratchpad/c3-T2/LeanProject/LeanProof/AxiomCheck.lean`
   (38,003 bytes) is still present, uninventoried, alongside `Test1–4.lean`. The axiom result itself is backed: I reproduced it.
5. **"No shortcut through already-carried content" for TP-h is struck** (Attacks and findings, item 2).
6. **"`ρ_1` literally as `cb8R1 m K / cb8R1 m (K−1)` … as C1-LA1 does" is narrowed** to value-equality (Attacks and findings, item 1).

Backed, and retained:
- "sorry-free";
- "zero errors";
- the three-axiom output;
- "byte-identical" carries (24/24, receipt-bound);
- the bridge "for every `m, k`";
- `cb8Rho_le_one`/`_lt_one` on the class;
- TP-g at `a, b ≥ 0`, `j ∈ ℕ`, `α ≤ a`;
- the two replay digests;
- the `ρ_1(95)` fixed point;
- `cut_candidate: none`.

"Exact" is backed for all numerics: integer and `Fraction` arithmetic only. Every "for all" claim rests on Lean, not on sweeps.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- The compiled content is correct, sorry-free and faithfully carried: the R-4 bridge, node (d) in both forms, and TP-g at full generality.
- The narrowings are to certification literals only: the "of record" label for `ρ_1(107)`, the fresh-row labelling, the Part D tally,
  "discarded", "no shortcut", and literal C1-LA1 index equality. No mathematical claim of the return is false.
- The route's allocated "could close" object is not reached. The zero-weight classification and the adapter lemma are unattempted.
  TP-h was open on the return and is now compiled by this critic.
- I judge TP-h's mathematics complete (`proved_informal` already by SR-C4-6). It is now also compiled in scratch, and compiled scratch has no grade.

COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none

`E1_formal: advanced` is at node level, in scratch. Group C nodes (c) (both halves, TP-h critic-derived), (d) and R-4 are compiled
sorry-free, and `ρ_1 < 1` is linked to C1-LA1's literal residual. The E1 flow on `cbGraph m` itself is not constructed. I did not check,
because of the read boundary, whether `critF_cb8_typePath_ii2` matches U2's named (ii-2) hypothesis verbatim.

## Remaining obligation

1. **Zero-weight classification** (a non-sector source of positive active-tag weight in `I_{p*+1}(cbGraph m)` is `r`-free with `q ≥ 1`).
   This needs the C1-LA2 `cbGraph` layer carried byte-identically. It is unattempted by T2 and by me.
2. **The adapter lemma** `cb8E1Arc_spec_topRank ⇒` U2's E1 hypothesis, over `cbGraph m`. It is unattempted. Its remaining content is item 1
   plus the switch-image clause.
3. **Literal matching of node (c)/(d) to U2's named hypotheses.** State U2's (ii-2) and `ρ_q` hypotheses and discharge them by name with
   `cb8_typePath_ii1`, `critF_cb8_typePath_ii2`, `cb8Rho_lt_one` and `critF_cb8R1_residual_pos`. Any index or shape mismatch of the kind
   in Attacks and findings, item 1 must be bridged by an explicit rewrite lemma, not by assertion.
4. **Governed award.** Nothing here has a grade until a Stage 7 award closes around it. Entry 21's ruling-19 keyword edit and its
   reversibility record must be made at that carry.

These obligations are exact. The return's own `## Remaining obligation` is accurate for items 1 and 2. Its item 1 (TP-h) is discharged
in scratch by this critique. Its prescription (β-reindexing, following SR-C4-6) is superseded by the shorter shifted-pairing proof.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T2-F/`:

| Path | SHA-256 | Role |
|---|---|---|
| `instr/crit_t2f.py` | `c1f21df2112fd934567ffff310a0023439862749e24476949a6d27f039badd99` | critic's independent instrument |
| `instr/crit_t2f.out.json` | `1dfa37cafc2a04754d8b673fe4a4b010796456618b275d52c7b91653eebec146` | its output (`python3 -B crit_t2f.py crit_t2f.out.json`) |
| `replay/LeanProject/LeanProof/Main.lean` | `c11f62aa26e237ecd3ab8fdbb7dc2c762a388c479d7a08b09e7577f1d4b5b9d0` | T2's file, copied out first, rebuilt |
| `replay/LeanProject/LeanProof/Critic.lean` | `cbed43aaf3beee5d912d1df79bc04f10d46819759b5418c491863bbb7a7fba4f` | `Main.lean` plus the critic block (TP-h, C1-LA1 link) plus `#print axioms` |
| `replay/lean_main.log` | `2ed18d8667da916bbee78c848e4b0398f320e5efec2a77229d3d4facf9674a2c` | rebuild log of `Main.lean` |
| `replay/lean_critic.log` | `1b24470e6174b5936699cf073f559898b380d28b3f2da914402f4ac8b2d28cf0` | build and axioms log of `Critic.lean` |
| `replay/verify_t2.py`, `replay/verify_t2.out.json` | `04f84da5…28f8db`, `82c2623d…438eb0` | T2 generator replay; output byte-identical to the original |

- `replay/LeanProject/` also holds the copied `Snippets/`, `SnippetsLA1/` and project files, with `.lake/packages` symlinked to the shared
  pinned Mathlib.
- Replay: `cd …/scratchpad/c3-crit-T2-F/replay/LeanProject && lake env lean LeanProof/Critic.lean`.
- Every job ran in the foreground, and no background job of mine exists.
