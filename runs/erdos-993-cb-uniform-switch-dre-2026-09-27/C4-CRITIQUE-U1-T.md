# Critique

**Critic:** `C-U1-T` (cross-orientation, T = prove), r31 Cycle 4 Stage 4. **Assigned return:** `cycles/cycle-4/stage3/returns/U1/RETURN.md`
(route `C4-U-01`, mechanism `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE`, orientation U). Date 2026-09-29.

**Boot acknowledgment.** I am operating within VerityOS under the dispatch's RESTRICTED BOOT clause. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then my dispatch
`control/dispatch/c4-stage4/DISPATCH-C-U1-T.md` (SHA-256 recomputed `92e86fbdda3d860a494a966b42aa7e72c3ecbb3a8014fb52ab11b84d01c2eb01`,
matching the value given at invocation). I read no other VerityOS file outside the run root. Subsystem used: `experiments/` (this run
root only).

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule** `control/c4-critic-capsules/U1-PACKET-MANIFEST.json`: inner seal recomputed (canonical JSON without `seal_sha256`,
  `sort_keys`, separators `(",", ":")`, no trailing newline) = `eec166f08acbb52f3d628b2bc08322fa4004506e7b3508c350d7f9fe26ca6799`,
  equal to the stored seal. All 16 member files match their listed SHA-256 and byte counts.
- **Stage 4 dispatch manifest** `control/C4-STAGE4-DISPATCH-MANIFEST.json`: seal recomputed
  `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` (matches). All 15 members match.
- **Stage 3 packet manifest** `control/C4-STAGE3-PACKET-MANIFEST.json`: seal recomputed
  `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` (matches).
- **Stage 2 packet manifest**: seal recomputed `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`. This equals the protocol's
  value (6084 files).
- **Return identity:** the return's SHA-256 is `7699954403899c8ee0a6053d6f8e866d5629e5b87f22e2c5e398c869dd48210e`. That matches the capsule and the
  admission record. The route ID `C4-U-01`, the mechanism token, the orientation and the owned nodes (N1 dual under ruling 30, and N2)
  match `control/C4-ALLOCATION.md`.
- **Every 64-hex literal in the return (13 distinct) was recomputed and matched.** The seven artifact and log literals are:
  - `build-attempt4.log` `8198e6f1…`
  - `axioms-u1-final.log` `97185461…`
  - `AxiomCheckU1.lean` `835c5413…`
  - the edited `Statements.lean` `75388bec…`
  - `verify_cb8N_sum_eq_cb8R.py` `a61dbe66…`
  - the replayed stdout `19d6e824…`
  - the canonical-result digest `11b0c848…`

  The run-record literals are the dispatch `ac3f7ad9…`, the frozen `.lean` `0fc723d7…`, the frozen `.md` `6aa6dfe5…` and the Stage 2
  seal. The two output literals were reproduced by my copy-out-first replay (below). All 12 `sources/c4-base/SOURCE-DIGESTS.json`
  entries also re-verify.
- **Admission defect for U1** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): adjudicated. The only occurrence is at return line 316:
  "these are **not** `formally_verified` and I do not call them that". That is a negation, not a label, so there is nothing to strike
  under the token rule. The neighbouring phrase "machine-verified sorry-free" (lines 77, 145, 199, 313) is narrowed to "compiled
  sorry-free scratch (ungraded)" under `## Certification audit`.

## Independent re-derivation

**(a) Lean rebuild, copy-out-first.** I assembled `scratchpad/c4-crit-U1-T/LeanProject` as follows:
- the shell and `LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1}.lean` were copied from `sources/c4-base` (not from the seat), and I
  checked the digests against the base record;
- U1's edited `Statements.lean` (`75388bec…`) and `AxiomCheckU1.lean` were dropped in;
- `.lake/packages` was bound by manual symlink to the pinned shared project (Mathlib `905b9581…`, matching `sources/mathlib-binding/PIN.json`);
- the controller-built base cache (CF-C4-S3-1) was copied in. I did not use the seat's cache and did not use `--no-cache`.

Results:
- `lake build LeanProof` exits 0 with 8661 jobs, and exactly 18 "declaration uses `sorry`" warnings in `Statements.lean`, as the return
  states.
- `lake env lean LeanProof/AxiomCheckU1.lean` produced a log **byte-identical** to the seat's `axioms-u1-final.log` (`97185461…`):
  - `cbOpenChokeCount_le`, `cb8N_eq_e1S_natCast` and `cb8N_sum_eq_cb8R` depend on `[propext, Classical.choice, Quot.sound]`;
  - `cb8E1Arc_spec_topRank` still carries `sorryAx`.

**(b) Frozen-text check (gate ruling 23).** I ran `diff control/C4-FROZEN-STATEMENTS.lean` against U1's `Statements.lean`. The only
differences are:
- one added `import LeanProof.C3LA1`, with a comment;
- the proof bodies of `cbOpenChokeCount_le`, `cb8N_sum_eq_cb8R` and `cb8E1Arc_spec_topRank`;
- one inserted helper theorem, `cb8N_eq_e1S_natCast`.

Every frozen statement line, from the signature to `:= by`, is byte-identical. Neither proof body contains `sorry`, `admit`,
`native_decide`, an enumeration or a hypothesis that encodes its conclusion:
- `cbOpenChokeCount_le` is `card_filter_le` plus `card_range`;
- `cb8N_sum_eq_cb8R` splits on `k < 0` (`polyCoeffZ_of_neg`) versus `k = n`, applies the pointwise bridge and then C3-LA1's
  `e1S_sum_eq_coeff` and `cb8R_natCast_eq_coeff`.

Packaging note for Stage 7: the added import and the helper sit between frozen declarations. The statement bytes are preserved, but a
Stage 7 award file must reproduce this import (or relocate the helper) on its face.

**(c) Index and cast conventions (attack brief).** The bridge `cb8N a b α (n : ℤ) = e1S a b n α` uses matching argument orders:
`cb8N (a b α) (k : ℤ)` and `e1S (a b j α)`. It is stated only at natural `k`; the `k < 0` half is handled separately and correctly.

The **`j ≥ 1` guard enters only in the next layer.** `cb8Rho`, `cb8E1G` and `cb8H` evaluate `cb8N` at the integer index `j − 1`. Only for
`j ≥ 1` does that index equal the natural `j − 1` and `e1T_eq_e1S_pred`. The return's claim that these objects "transport
*definitionally*" to `e1G`/`e1H` is therefore **false as worded**: the transport is a theorem with hypothesis `1 ≤ j`. I prove it below
(`critU1T_cb8Rho_natCast`, `critU1T_cb8E1G_natCast`, `critU1T_cb8H_natCast`, each with `hj : 1 ≤ j`).

My literal instrument confirms that the guard is load-bearing. At `m = 1`, `p = 1`, `q = 1` (so `j = 0`), 8 row sums fail. That row is
outside the class, since on the class `j = p* − q ≥ p* − m ≥ 1`.

**(d) Numeric replay and own instrument.**
- **U1's generator**, copied out to `scratchpad/c4-crit-U1-T/replay/` and run with `python3 -B`, reproduces:
  - 1215 checks with 0 failures;
  - mutant 64/96;
  - canonical digest `11b0c848…`;
  - stdout file digest `19d6e824…`.
- **My own instrument** `e1_literal_check.py` (`9740cb86…`; output `d29f98e0…`, canonical `2506733d…`) is written from the contracts and
  the base definitions. It shares no code with the seat's script.
  - The companion identity is checked by a **Pascal recurrence** for `[X^k](1+X)^a(1+2X)^b`, a code path disjoint from both the
    binomial type-sum and the seat's convolution. Over `a, b ∈ [0,12]`, `k ∈ [−4, a+b+4]` it gives 3549 checks with 0 failures.
  - It also executes `cb8E1Val`/`cb8E1Arc` under Lean conventions (`toNat`, guards, truncated ℕ, `x/0 = 0`) on the **literal**
    `cbGraph 1`, built from `cbEdge`. The graph has 33,573 independent sets, which matches `I(CB(8,1))(1) = 3·6817 + 2·3^8`.
  - `F = leafSet` is imposed there, not derived, because C2-LA3 holds only at `m ≥ 107`.
  - For every rank `p` with an `r`-free layer, clause (1) had 0 negative values. Clause (4) had 0 column failures over all
    `q ≥ 1`, `r`-free targets (766 in total). Clause (5) had 0 zero-column failures. Clause (3) had 0 row failures except the
    `j = 0` row above.
  - **Scope:** this is exhaustive at `m = 1` only. At `m = 1` a source with `q ≥ 1` has no closed choke, so the closed-leg ternary
    slots are not exercised with `q ≥ 1`. This is bounded evidence of the mechanism's arithmetic, never of the class statement. No
    difference index `i_{p+1} − i_p` is asserted at any row: no aggregate or (WID) claim is made.

## Attacks and findings

1. **U1's compiled claims hold.** `cbOpenChokeCount_le` and `cb8N_sum_eq_cb8R` compile sorry-free on the Cycle 4 base (plus the C3-LA1
   import) with the three standard axioms. Their statements are the frozen text. **Clauses (2) and (5)** of N2 are closed by the
   hypothesis-free, sorry-free base lemmas `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem` and `cb8E1Arc_zero_of_no_open_choke`. I
   printed the axioms of each: standard only. **No compiled clause assumes what an open one proves;** none of these lemmas mentions
   N1 or clauses (1), (3), (4).

2. **Clause (1) reduction: correct in outline, but mis-described.**
   - The transport is not definitional; it needs `1 ≤ j` (see (c)).
   - The ternary denominator `(j − α)·N` can have a negative first factor. It is harmless only because `cb8N`'s own guard
     `(α : ℤ) ≤ j` then makes `N = 0`. The return does not say this.
   - The hypotheses `α ≤ a` (from B1's `w ≤ 8q`), `1 ≤ j ≤ a + b + 1`, `F = leafSet` (C2-LA3) and `q ≤ m < p*` do enter exactly
     where the return says they do.

   **Closed by me; see the critic-derived advance below.**

3. **Clause (3) reduction: incomplete as written (a genuine gap, repaired below).** The return says "the row sum equals `w` iff
   `cb8N = cb8E1G + cb8H`". That misses three things:
   - (i) **`N ≠ 0` is required.** It needs all three guards: `α ≤ a` (B1 conjunct 4), `α ≤ j` (from `ℓ = j − α ≥ 0`, B1 conjunct 3)
     and `j − α ≤ b` (B1 conjunct 5, `ℓ + 8q ≤ 8m + 1`). Then `N = C(a,α)·C(b,ℓ)·2^ℓ > 0`.
   - (ii) **The `ℓ = 0` sources, where `j = α`.** The ternary sum is empty, the factor `ℓ/(ℓ·N)` does not cancel, and the needed
     identity is `G = N` (saturation), not `G + H = N`. It follows from C3-LA1's `e1_saturation` (`j ≤ a` holds since `j = α ≤ a`)
     through the bridge. These sources occur on the class whenever `p* + 1 − q ≤ 8q`.
   - (iii) **The degenerate sources `w = 0` or `q = 0`.** `q = 0` forces `w = 0` only through B1's `w ≤ 8q`.

   The identity `cb8E1G + cb8H = cb8N` itself is `unfold; sum_range_succ; ring` in the `cb8` vocabulary; no bridge is needed.

4. **Clause (4) sketch: correct shape, one missing case.** My hand check of the reduction is below. The target is `A` (`r`-free, `q ≥ 1`,
   `A ∈ I_{p*}`) with `α := w_A − 1`. Insertions split as follows:
   - **Boolean:** `8q − w_A = a − α` of them (B2), each with value `G(α+1)/N(α+1)` (B3 gives `w_B = w_A + 1`, `q_B = q_A`).
   - **Ternary:** `2(b − ℓ')` of them (B2), with `ℓ' = j − 1 − α` (B1 on `A`), each with value `w_A·H(α)/((j−α)·N(α))`.
   - **Choke insertions:** value 0.

   Multiplying C3-LA1's `e1_column_inflow_clone` by `w_A = α + 1` gives exactly `ρ_q·w_A`. Its hypothesis `0 < e1T a b j α` comes
   from B1 on `A` (`α + 1 ≤ j`, `j − 1 − α ≤ b`, `α ≤ a`).

   **Missing from the return:** the target case `w_A = 0` with `q ≥ 1`, where the clone formula at "α = −1" is meaningless. There the
   Boolean insertion values are `G(0)/N(0) = 0` by `e1_g_zero`, the ternary values carry the factor `w_B = 0`, and the column is
   `0 = ρ·0`. My `m = 1` instrument exercises this case with 0 failures.

5. **N1 (B1–B3), informal only.** I rechecked the adjacency case analysis and agree with it:
   - an open choke excludes every `b_ij`;
   - a closed leg holds at most one of `b_ij` and `c_ij`;
   - the root arm holds at most one of `s` and `v`;
   - `v` is never active when `r ∉ B`;
   - a witness is always `r` or a choke, so a non-choke, non-root insertion cannot re-activate another leaf.

   The count identities in B2 (`Boolean + w = 8q`; `ternary + 2ℓ' + 16q = 16m + 2`) are consistent with this. However:
   - none of B1, B2 or B3's second conjunct is compiled;
   - "the reduction [of B3] is exact and short" (line 123) is a **forecast without an artifact** and is struck as a certification;
   - B1 and B2 are informal arguments, not proofs on the face.

6. **Critic-derived advance: N2 clauses (1) and (3) compiled, modulo the frozen B1 only.** The file is
   `scratchpad/c4-crit-U1-T/LeanProject/LeanProof/CritU1T.lean` (`2118f35a…`, 288 lines, no `sorry`/`admit`/`native_decide` in any
   proof). It builds with `lake build LeanProof.CritU1T` (exit 0, log `build-crit-U1T.log`). Contents:
   - bridges `critU1T_cb8Rho_natCast`, `critU1T_cb8N_pred_eq_e1T`, `critU1T_cb8E1G_natCast`, `critU1T_cb8H_natCast` (each `1 ≤ j`);
   - `critU1T_branches_nonneg`;
   - `critU1T_rowsum_eq_sum_val`: for any `p` and `F`, the `cb8E1Arc` row sum at an `r`-free source equals the sum of `cb8E1Val` over
     its vertices, via `sum_image` over `B.erase` and `sum_subset`;
   - `critU1T_cb8_rows`;
   - **`critU1T_N2_clause1`** and **`critU1T_N2_clause3`**. Their statements are N2's clause (1) and clause (3) text verbatim under
     N2's own `let p/F/f` binders, at `m ≥ 107`, `m % 3 = 2`.

   `#print axioms` gives standard axioms only for every bridge and for `critU1T_rowsum_eq_sum_val`. The two clause theorems also show
   `sorryAx`. To isolate its source, I made a diagnostic copy (`LeanProjectDiag/`) in which **only** the frozen
   `cb8_rFree_deletionClasses` is re-declared as a named `axiom` with the identical statement. In that copy both clause theorems depend
   on exactly `[propext, Classical.choice, E993Transport.cb8_rFree_deletionClasses, Quot.sound]` (`build-diag.log`).

   So the **only** open input of clauses (1) and (3) is the frozen N1 statement B1. Clause (1) uses B1's fourth conjunct; clause (3)
   uses all five. The remaining inputs are:
   - U1's `cbOpenChokeCount_le` and `cb8N_eq_e1S_natCast`;
   - C2-LA3's `cb8_favorableLeaves_eq_leafSet_topRank`;
   - C3-LA1's `e1G_nonneg`, `e1H_nonneg`, `e1T_sum_pos`, `e1_saturation`, `e1Rho_eq_coeff_ratio` and `e1T_eq_e1S_pred`.

   All have standard axioms (`axioms-crit-inputs.log`). This is compiled scratch with no grade. It is the allocation's intended
   consumption of N1 "as the frozen statements (compiled or not)".

## Mechanism-equivalence and fence check

- **Mechanism.** The route's work is formal engineering of the frozen N1/N2 text, as allocated. It revives no refuted mechanism: no
  compression lemma, no per-choke `m`-independent certificate, no CHAR, no forest real-rootedness. It does not re-prove a registered
  identity as progress: the companion `cb8N_sum_eq_cb8R` is a frozen node (ruling 24(10)).
- **Fences.**
  - **One rank per tree:** N2 and my clauses sit at `p*` only. `critU1T_rowsum_eq_sum_val` is a generic `Finset` identity and asserts
    no (HALL).
  - **The class only:** clauses at `m ≥ 107`, `m ≡ 2 (mod 3)`. `F = leafSet` enters only through C2-LA3.
  - **No aggregate status transfer; no θ* law; no census value as proof.** The `m = 1` literal check is bounded and imposes `F`.
  - **Newton/Darroch:** none invoked. C3-LA1's `e1G_nonneg`/`e1H_nonneg` rest on the likelihood-ratio minors (C1-LA3 entry 15), not on
    Darroch.
  - **ℕ-subtraction:** every guarded site is identified.
    - `8q − 1` is safe on the active branch (`q ≥ 1`).
    - `w − 1` is safe on the active branch (`w ≥ 1`).
    - `m − q` and `p* − q` are safe by `cbOpenChokeCount_le` (ruling 24(4)).
    - `(j − α).toNat` equals `ℓ` under the guards.

## Certification audit

- "`cbOpenChokeCount_le` … machine-verified sorry-free" and "`cb8N_sum_eq_cb8R` … machine-verified sorry-free": **backed** by my
  rebuild and a byte-identical axiom log. **Narrowed to** "compiled sorry-free scratch in U1's project copy (ungraded; SOLUTION-CONTRACT
  §4)".
- "18 (not 20) `declaration uses 'sorry'` warnings": **backed** (my replay gives 18).
- "clauses (2) and (5) … align byte-for-byte … discharged": **backed**. It compiles inside the frozen statement.
- "transport *definitionally* to `e1G_nonneg`/`e1H_nonneg`" (line 164): **struck**. The transport needs `1 ≤ j` (see (c)).
- "row sum equals `w` iff `cb8N = cb8E1G + cb8H`" (line 172): **struck as stated**. It omits `N ≠ 0`, the `ℓ = 0` saturation case and
  the degenerate sources. My clause-(3) theorem supersedes it.
- "a complete, checkable reduction of every open clause" (line 181): **narrowed**. Clause (4) lacked the `w_A = 0` case, and clause (3)
  had the gaps above.
- "B3 … reduction … is exact and short" (line 123): **struck**. It is a forecast with no artifact.
- "1215/1215 exact-integer matches … mutation control 64/96": **backed** by replay. It is bounded evidence for a statement that is now
  compiled, so it is evidence of nothing further.
- "`FROZEN_NODES_CLOSED: none`": **correct**. N1 needs B1, B2 and B3; N2 needs clause (4) and the N1 inputs.
- The route verdict `compiled` is **retained** for the two declarations.
- Gate ruling 29 (a row number without a textual difference index): **not triggered**. The return reports no network row, and its
  `## Instrument sides` section states this.
- Process: three build PIDs, each tracked and killed by its literal PID; `sample`/`lsof` were run on a single PID only; no process
  listing. Two host interruptions are disclosed. The final scratch, logs and `RETURN.md` agree (my replay).
- Read boundary: partial reads of the brief's file list are disclosed. I found no read outside the grant.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- `COND4_formal`: no
- `E1_formal`: no
- `TERMINAL_integration`: no
- `cut_candidate`: no
- `FROZEN_NODES_CLOSED`: none

**What stands:**
- `cbOpenChokeCount_le` and `cb8N_sum_eq_cb8R` compile sorry-free as the frozen text (scratch, ungraded).
- Clauses (2) and (5) of N2 are discharged inside the frozen statement.

**What is narrowed or struck:**
- "definitional" transport;
- the clause-(3) "iff";
- the "complete reduction";
- the B3 forecast;
- "machine-verified" (narrowed to compiled scratch).

**Critic-derived advance (attributed to C-U1-T):** N2 clauses (1) and (3) compile on the Cycle 4 base with their only open input the
frozen N1 statement `cb8_rFree_deletionClasses`. This was isolated by the named-axiom diagnostic. N2 is therefore open in exactly
clause (4) plus N1.

I do not assert `proved_informal` for any whole node.

## Remaining obligation

What a successor inherits, exactly:

1. **N1 (B1) `cb8_rFree_deletionClasses`**, all five conjuncts, compiled on the base. It is now the single open input of N2 clauses (1)
   and (3).
2. **N1 (B2) `cb8_rFree_insertionClasses`** and **N1 (B3) `cb8_nonChokeInsert_weight`**, second conjunct. The first conjunct is
   `cbOpenChokeCount_insert_of_not_choke`.
3. **N2 clause (4).** For `A ∈ I_{p*}` with `r ∉ A` and `q ≥ 1`:
   - reindex `Σ_{B ∈ I_{p*+1}} cb8E1Arc B A` as a sum over insertable `z` (the mirror of `critU1T_rowsum_eq_sum_val`, via `insert`);
   - split `z` by B2's classes, using B3 for `(q_B, w_B)`;
   - **case `w_A = 0`:** every value vanishes (`e1_g_zero`; factor `w_B = 0`);
   - **case `w_A ≥ 1`:** set `α = w_A − 1` and apply C3-LA1's `e1_column_inflow_clone` times `w_A`, with `0 < e1T a b j α` from B1 on
     `A` and the bridges `critU1T_cb8E1G_natCast`/`critU1T_cb8H_natCast`/`cb8N_eq_e1S_natCast`;
   - finally identify `cb8Rho a b (p* − q)` with `e1Rho` through `critU1T_cb8Rho_natCast`.
4. **Assembly.** Replace the three `sorry`s in `cb8E1Arc_spec_topRank` by `critU1T_N2_clause1`, `critU1T_N2_clause3` and the clause-(4)
   proof. The Stage 7 face must carry the `import LeanProof.C3LA1` (or relocate the bridges) and reproduce the frozen statement
   bytes.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U1-T/`. No background
job was started, so none remains to kill.

- `LeanProject/` is the copy-out-first rebuild: base files from `sources/c4-base`, U1's `Statements.lean` `75388bec…` and
  `AxiomCheckU1.lean` `835c5413…`, packages symlinked, controller cache copied. It contains:
  - `LeanProof/CritU1T.lean` `2118f35a4499332b912c151a378889fd4e862b8be8e90a23a01c23de60a3d24c` (the critic-derived advance);
  - `LeanProof/CritU1TAx2.lean` `3101eea86f62732a68bc42af9420623539eeaa72fc81279c135049a42a71ac45` (input axioms).
- `LeanProjectDiag/` is the named-axiom diagnostic. Its `Statements.lean` is `efc5b32cd9e723b1aadb4953e687351d42c687e2c60e52cd44a266cda84c57a1`,
  with B1 as an `axiom` and nothing else changed. It is diagnostic only and not a claim.
- Logs:
  - `build-crit-replay.log` `fa448e244d3c03b70a9499e28c467d6642ab7413029e26d4ca1d4165d411d461`
  - `axioms-crit-replay.log` `971854618981b9a280b3cbedcde9bc33f515edde7c2f48cc8292c4acb68fefcc` (= the seat's)
  - `build-crit-U1T.log` `249f0c2aea18f7d450b24bd91ec50c492f20d60ee5c7d0d9c55eb35e757d0883`
  - `crit-lean-axioms.log` `2aee9bd72857b5980da7917cae32734f18241c095091e8b0ff49849a570e1f78`
  - `axioms-crit-inputs.log` `01d9d57cce813843b2bb90739f9a6899d42266bb76e008f2f8ec4f1caeba2e90`
  - `build-diag.log` `74b6547808a4ec87cce76f7ce6b50ccc00d1b439e13db3017f91cd9f2b67b07a`
- `e1_literal_check.py` `9740cb865863a5554529d03fd674f35ed9c6eb94d07c08be8dfa2e2f7d676da8`. Import list: `hashlib`, `json`,
  `fractions`, `math` (standard library). Output `e1_literal_check.out.json` `d29f98e0fe415d0196b3dda0b9357a89d309cb52b7da64b7c94e97eb1daee670`;
  canonical-result digest `2506733d845f1310b365bbee9601ff2310570258fdf8069015299a4bc3880db0`. Replay:
  `cd <run root>/scratchpad/c4-crit-U1-T && python3 -B e1_literal_check.py`.
- `replay/verify_cb8N_sum_eq_cb8R.py` (the seat's, `a61dbe66…`) and `replay/cb8N_sum_eq_cb8R.out.json`
  `19d6e82484bf309d90da77e458dcd3c9f15ef469faf77ac81edf0ce5f83cbacc`.
- Lean replay: `cd <run root>/scratchpad/c4-crit-U1-T/LeanProject && lake build LeanProof.CritU1T`.

**Read-boundary disclosures:**
- I hashed `control/dispatch/c4-stage3/DISPATCH-U1.md` to verify the return's digest literal. It is a Stage 3 packet member, not a
  capsule member, and was hashed only, not read for content.
- I read `control/C4-WORKER-COMMON-BRIEF.md` and `control/C4-FROZEN-STATEMENTS.lean` (Stage 2 members named by the common brief and
  the protocol), `sources/c4-base/*`, `sources/mathlib-binding/PIN.json`, and a key-presence `grep` of the single file
  `sources/authority/CLAIM-IDENTITY.json` (3 cited keys present; no `critU1T`/E1-spec alias).
- I ran one `grep -rn` inside the Mathlib package's `Mathlib/Data/Finset/` directory for the API name `erase_injOn`. Mathlib sources
  are readable for API meaning.
- No other return, critique, adjudication, experiment root, or network resource was touched.
