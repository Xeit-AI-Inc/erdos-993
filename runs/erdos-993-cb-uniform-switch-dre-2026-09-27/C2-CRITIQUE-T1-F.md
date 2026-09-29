# Critique

Critic `C-T1-F` (orientation F, falsify), Cycle 2 Stage 4 of r31. Assigned return: seat `T1`, route
`C2-T-01 FAVORABILITY-ARM-LEAF-INTEGER-ROUTE` (orientation T), `cycles/cycle-2/stage3/returns/T1/RETURN.md`.
Written 2026-09-28 (~02:05 EDT, by the clock).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Boot acknowledgment: VerityOS was booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I opened no other VerityOS file outside this run root. The
read-boundary disclosures are listed at the end of `## Identity and seal audit`.

## Identity and seal audit

- **Dispatch:** `control/dispatch/c2-stage4/DISPATCH-C-T1-F.md` has SHA-256 `99c9959e8a00ec106ead916b9f72b5e309c1e94e939f75712ade6b067100e09f`,
  which matches the digest given at invocation.
- **Capsule seal (reported):** I recomputed `control/c2-critic-capsules/T1-PACKET-MANIFEST.json` over its canonical JSON
  without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline) and got
  **`c58827b23fb7200f5c93c8b62aceecf7c0304c961705206b0dedbbbb53ac5ef2`**, equal to the recorded value. The 14 listed members
  all match on byte count and SHA-256.
- **Stage 4 dispatch manifest:** the recomputed seal `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` equals the recorded value.
- **Stage 3 packet manifest:** the recomputed seal `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` equals the
  recorded value. It lists the T1 return at `6c810668d2619b01…`, which agrees with the capsule entry and with the file.
- **Stage 2 packet manifest:** the recomputed seal `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` equals the
  recorded value and the protocol's value.
- **Digests the return lists:** `control/CLAIM-IDENTITY.run-local.json` (`34b2bdca…bd5b`) and `OBLIGATIONS.csv` (`605ac177…ab7f`)
  both equal their Stage 2 manifest entries. I checked these against the manifest only and did not open either file, because
  neither is a capsule member. The five `sources/c1-results/` files the return cites (C1-LA3 `INFORMAL-PROOF.md`,
  `THEOREM-CONTRACT.yaml`, SR-4, SR-3, `CYCLE-CLOSE.md`) all rehash to the 12-hex prefixes the return quotes and to their
  Stage 2 entries. The frozen C1-LA3 `Main.lean` (`c0605e12b91375ed…`) equals its Stage 2 entry. Entry 17
  (`twoBinom_coeff_strictAnti_of_gap`, source digest `b39cd787…589c`) appears in that award's `FORMALIZATION-STATE.json`.
- **The return's result digest:** replayed copy-out-first (details under re-derivation). The replay reproduced
  `RESULT_DIGEST_SHA256 = b23dba2f673a03343875b8161586d72e4777305c23145ccf239a4181e328eff5`, and its stdout is byte-identical
  to the seat's own `t1_main_run.log` (both hash to `3ee21be0…85c3`).
- **Route identity:** the return carries the route ID `C2-T-01` and the mechanism token `FAVORABILITY-ARM-LEAF-INTEGER-ROUTE`
  verbatim. Its model disclosure is two-part (Sonnet 5 high; runtime `claude-sonnet-5`).
- **Read-boundary disclosures (mine):**
  1. The harness injected the project `CLAUDE.md`, the user auto-memory index and the user e-mail into my context before
     my first tool call. I did not open them with a tool, did not use them, and wrote no conversation log.
  2. I ran `head -40` on `control/C2-CRITIC-ATTACK-BRIEFS.md` before I had located my section. The display ran past the T1
     section into the T2 and T3 sections. I used nothing from them.
  3. At the end of the session I ran a process listing (`ps … | grep python3|lean|lake`) to confirm that I had no background
     job. The output showed command lines of sibling critics' jobs (seats F2, T2, U1, F1 and a Lean build). I used none of
     it and touched none of those processes. I had started no background job.
  4. To bind Lean I listed the shared Mathlib project directory
     `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` and its `.lake/packages`, and I listed
     `~/.elan/bin`. Both are allowed roots in `PATH-CHECK-T1.json`, and I read no file there.
  5. I made non-recursive `ls` listings of `sources/`, `sources/c1-results/runs/`, the C1-LA3 run directory and
     `sources/r30/records/`. All of these are inside the `sources/` grant.

  I did not read any sibling return, sibling critique, adjudication, other experiment root or the network. I installed
  nothing.

## Independent re-derivation

**Object and conventions.** I checked these against the text of record, not the return:

- **Selector.** r30 `SEMANTIC-CONTRACT.md` §1.1 defines `IsFavorableAt G v p := Δ_p(G − v) < 0` with
  `Δ_k(G − D) = i_{k+1}(G − D) − i_k(G − D)` on the original carrier. The favorability key's statement (read in
  `sources/authority/CLAIM-IDENTITY.json`) uses the same convention: `Δ_k(T − w) := i_{k+1}(T − w) − i_k(T − w)`, and
  part (i) is `Δ_{p*}(T − v) < 0`. The return's index (`p*` against `p*+1`) and sign are therefore correct. It is not a
  descent at `p* − 1`.
- **Closed form.** I re-derived the closed form by hand, splitting on whether `r` is in the set:
  - `r ∉ B`: the pendant `s` contributes `(1+x)`, and each choke contributes `G`.
  - `r ∈ B`: `s` and every `u_i` are excluded, and each of the `8m` legs `b–c` contributes `(1+2x)`.

  This gives `I(T − v) = (1+x)G^m + x(1+2x)^{8m}` with `G = (1+2x)^8 + x(1+x)^8`, which is the contract's `G`. It is not
  the swapped form flagged in CF-C2-G. The binomial expansion of `G^m` gives
  `Σ_{j=0}^{m} C(m,j) V_j + R` with `V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` and `R = x(1+2x)^{8m}`, as stated.

**(G) read in the frozen `Main.lean` (entry 17).** The statement is
`(a b t : ℕ) (ht : 1 ≤ t) (hta : t ≤ a + b) (hgap : 3 * a + 4 * b + 2 ≤ 6 * t)`, concluding
`((1+X)^a (1+2X)^b).coeff (t+1) < ((1+X)^a (1+2X)^b).coeff t`.

- `a` is the exponent of `(1+X)` and `b` the exponent of `(1+2X)`.
- The gap hypothesis is non-strict and the conclusion is strict.
- There is no side condition on `a` or `b`, so `a = 0` (the block `R`) and `b = 0` (the block `j = m`) are both admissible.

**Exact `(a, b, t)` per block.** I derived these by hand:

- **`V_j`**: `[x^k]V_j = [X^{k−j}](1+X)^{8j+1}(1+2X)^{8(m−j)}`, so `a = 8j+1`, `b = 8(m−j)`, `t = p* − j`. The step `t+1`
  is exactly the index `p*+1`.
  - Gap: `6t − (3a+4b+2) = 6p* − 32m + 2j − 5 = 2j + 3`, using `6p* = 32m + 8`.
  - Side conditions: `t ≥ p* − m = (13m+4)/3 ≥ 1`, and `t ≤ p* ≤ 8m+1 = a+b` because `16m+4 ≤ 24m+3` for `m ≥ 1`.
  - All three hold for every `j ∈ [0, m]`, including `j = 0` (margin 3) and `j = m` (`b = 0`, `t = (13m+4)/3`).
- **`R`**: `[x^k]R = [X^{k−1}](1+2X)^{8m}`, so `a = 0`, `b = 8m`, `t = p* − 1`.
  - Gap: `6(p*−1) − (32m+2) = 0`. This is exactly at the boundary, which (G)'s `≤` allows.
  - Side conditions: `1 ≤ p* − 1 ≤ 8m`.
  - As an independent check, the explicit ratio is `R_{p*+1}/R_{p*} = 2(8m − p* + 1)/p* = (16m − 2)/(16m + 4) < 1`.
    My instrument confirms `hi·(16m+4) = lo·(16m−2)` at every row.
- **Summation.** Every `C(m,j) > 0` for `0 ≤ j ≤ m`. Every block difference is strictly negative, and so is `R`'s. No block
  can be zero-and-flat, because (G) needs `r(t) > 0`, and `twoBinomCoeff_pos` supplies it from `t ≤ a+b`. So
  `Δ_{p*}(T − v) < 0`.

  The brief's worry about "positivity at both indices" does not arise. A negative sum only needs nonnegative weights with
  one positive, and here every weight is positive.

**My instrument** (`scratchpad/c2-crit-T1-F/instr/crit_t1f.py`, standard library only). It does not use the return's scripts.

- It builds the literal `CB(8,m)` from the contract's definition and checks `IsTree` (edge count plus connectivity).
- It checks that `v` is a leaf.
- It computes the full independence polynomial of the original carrier with `v` forbidden, by a rooted literal-tree DP.
  This is not the closed form.
- It compares that polynomial, coefficient by coefficient, with the closed form `(1+x)G^m + x(1+2x)^{8m}`, and compares
  the closed form with the block sum at `p*` and `p*+1`.
- It checks (G)'s three hypotheses and its strict conclusion directly for every `j ∈ [0,m]` and for `R`, and asserts
  `margin(j) = 2j+3`.
- It computes `x` from the literal `I(T)` through rank `α` (with `i_{α+1} = 0`) and checks eligibility.

It ran at the control rows `107, 110, 113`, the ruling-9 fresh rows `116, 119`, and the larger row `137`. Digest of the
row list: `ec3d5834e6f277fe56aaf497ac3ff7fd92f018f828ad9619cfdd229b6668dd3d`; output `run_rows.json` is `8f25b096…788f`.

| `m` | `p*` | IsTree | literal = closed form (all coeffs) | closed = block sum | (G) hyp + strict conclusion, every `j` and `R` | min margin / `R` margin | sign `Δ_{p*}(T−v)` (literal) | digits | `x` (literal) | `α` | eligible |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 107 | 572 | yes | yes | yes | yes | 3 / 0 | −1 | 408 | 570 | 964 | yes |
| 110 | 588 | yes | yes | yes | yes | 3 / 0 | −1 | 419 | 586 | 991 | yes |
| 113 | 604 | yes | yes | yes | yes | 3 / 0 | −1 | 431 | 602 | 1018 | yes |
| **116** | 620 | yes | yes | yes | yes | 3 / 0 | −1 | 442 | 618 | 1045 | yes |
| **119** | 636 | yes | yes | yes | yes | 3 / 0 | −1 | 454 | 634 | 1072 | yes |
| 137 | 732 | yes | yes | yes | yes | 3 / 0 | −1 | 522 | 730 | 1234 | yes |

- The fixed point `CB(8,107)/572` with `n = 1822`, `α = 964`, `x = 570` is reproduced.
- The return's 110/113 values are reproduced from my literal-tree counts: `i_{p*}`, `i_{p*+1}` and `Δ_{p*}` are equal
  integer by integer to the return's instrument-A values, and the leading digits and 421/432-digit lengths match.
- For `m ≡ 2 (mod 3)`, `2 ≤ m ≤ 104` (below the class), every block and `R` also pass. The literal DP was run for
  `m ≤ 35` there. This backs the return's parenthetical "every `m ≥ 1` with the residue hypothesis" (not needed).

**Replay of the seat's generator.** I copied it out to `scratchpad/c2-crit-T1-F/replay/` and ran it with `python3 -B`,
exit 0. The digest reproduced, the output is byte-identical to the seat's log, and its imports are standard library only.
I weigh this replay below my own instrument; see the next section for what its two instruments do and do not establish.

## Attacks and findings

1. **Mathematics: no defect found.** I attacked the index, sign, `(a, b, t)` assignment, side conditions at `j = 0`,
   `j = m` and `R`, the non-strict boundary `margin_R = 0`, ℕ-subtraction, weight positivity and the residue class.
   Every step holds.
   - The only use of the residue is `3p* = 16m + 4`, which makes `p*` exact.
   - ℕ-subtractions `m − j`, `p* − j`, `p* − 1`: true values (`j ≤ m < p*`, `p* ≥ 572` on the class).
   - No asymptotic step is used and no `M_0` is needed.
   - Newton and Darroch are not used anywhere.
   - (G) is formally verified and needs neither. Its log-concavity comes from the minor-condition factor induction (C1-LA3
     entries 6 and 9), not from real-rootedness.

   The return's "zero exceptional blocks" is **correct**.
2. **The fresh-row discipline (gate rulings 2 and 9) was not met by the return.**
   - Ruling 9 makes `m = 116, 119` the fresh rows and `107, 110, 113` control rows. The return tested only 110 and 113
     and calls them "fresh".
   - The allocation's T1 text does say "Test at `m = 110, 113` first", so the seat followed the allocation. The conflict
     between the allocation and ruling 9 is a controller-side inconsistency, not a seat defect.
   - The fresh-row test is now done by this critic (table above), before I state any universal verdict. Both rows pass.
   - This is not material to a proof that is pure algebra, but the return's word "fresh" is struck.
3. **"Two fully independent instruments" is overstated.**
   - At 110 and 113, instrument A (block sum) and instrument B (convolution of `(1+x)G^m + x(1+2x)^{8m}`) both start from
     the closed form. Neither counts independent sets on the literal tree at those rows.
   - The generic literal-tree DP (Part A) was run only at `m ≤ 4`. The `IsTree` check at 110 and 113 checks the graph, not
     the counts.
   - So the return's evidence ties the sign to the literal tree only through a 16-instance small-`m` check of the closed
     form (itself a `proved_informal` node, which I re-derived by hand).
   - Repaired by this critique: the literal-tree DP equals the closed form in every coefficient at 107–137, including the
     fresh rows.
4. **"Exactly one external input" is inexact.**
   - The universal argument also rests on the closed form `I(T − v) = (1+x)G^m + x(1+2x)^{8m}` and its block expansion.
     This is a `proved_informal` node of the r30 favorability key, re-derived informally by the seat, not machine-checked
     against the tree. It is elementary and correct, but it is an input.
   - Corrected wording: "(G) (formally verified) plus the closed-form node and its binomial expansion (elementary,
     `proved_informal`)". This does not lower the grade (see the certification audit), but the literal is narrowed.
5. **Arithmetic slip in a non-load-bearing remark.** Step 4 says the target "shifts the margin by a constant `+11`
   relative to the parent-descent identity". This compares the return's margin `2j+3` (which includes the `−2`) with
   C1-LA3's gap `2j−8` (which does not). In one convention the shift is **+13**: `2j+5` against `2j−8`, or equivalently
   `2j+3` against `2j−10`. The `+11` is struck. Nothing depends on it.
6. **Generator literals.** `"min_margin_over_j_0_to_m": 3` and `"ascending_blocks_found_this_m": 0` are hard-coded
   literals in the output JSON. They are not computed values. They are backed, because the preceding loop asserts
   `margin == 2j+3` for every `j` (so the minimum is 3 at `j = 0` and nothing ascends), and the assertion would abort the
   run otherwise. I recommend computed values for future generators.
7. **Citation numbering.** The return cites (G) as "INFORMAL-PROOF entry 10 / Main.lean entry 17", and (BD)/(E1i)
   variously as "entry 11/12/13–14". These are INFORMAL-PROOF DAG numbers. In `Main.lean` the same objects are entries
   18–21. There is no error, but a Lean carry must use the `Main.lean` entry numbers and digests (gate ruling 12).
8. **Out-of-seat observation (context only).** The allocation's U1 text swaps `G`. This is already recorded by the
   controller as CF-C2-G. T1 used the contract's `G` throughout, and so did my instrument and Lean file.
9. **Critic-derived advance (attributed to me, C-T1-F): Lean at the closed-form level, sorry-free, in scratch, with no
   grade.**
   - The return names a Lean instantiation as the natural next target (its remaining obligation 4) but did not attempt it.
     I did.
   - `scratchpad/c2-crit-T1-F/LeanProject/LeanProof/Main.lean` carries C1-LA3's frozen `Main.lean` lines 1–389
     (entries 1–17) **byte-identically**: `cmp` against the frozen file passes, and that file's digest equals its Stage 2
     entry.
   - It adds two declarations:
     - `critT1F_block_eq`: the `j`-th term of `(1+X)·add_pow` equals `C(C(m,j)) · X^j · (1+X)^{8j+1}(1+2X)^{8(m−j)}`,
       by `mul_pow`/`pow_mul`, `C_eq_natCast`, `generalize` and `ring`.
     - `theorem critT1F_armLeaf_closedForm_descent (m : ℕ) (_hm : 107 ≤ m) (hmod : m % 3 = 2)`, stating
       `((1+X)·((1+2X)^8 + X(1+X)^8)^m + X(1+2X)^{8m}).coeff (p*+1) < … .coeff p*` with `p* = (16m+4)/3`.
   - The proof uses `add_pow`, `finsetSum_coeff`, `Finset.sum_lt_sum_of_nonempty`, `coeff_X_pow_mul'`, `coeff_X_mul`, and
     (G) for every block at `(8j+1, 8(m−j), p*−j)` and for `R` at `(0, 8m, p*−1)`, with side goals closed by `omega`.
   - Build: pinned toolchain v4.32.2, Mathlib `905b9581…`, `.lake/packages` bound by manual symlink, `cd` into the
     project, `lake env lean`. Exit 0 with no errors or warnings.
   - `#print axioms` gives `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit`, `native_decide` or
     `decide` in the new text (grep is empty).
   - The class lower bound `107 ≤ m` is **unused**. `omega` closes every side goal from `m % 3 = 2` alone, which formally
     confirms "no `M_0`".
   - Scope limits:
     - This is the closed-form polynomial statement, not `v ∈ favorableLeaves (cbGraph m) p*`.
     - The missing link is U3's node: the `k`-th coefficient of the closed form equals the number of independent `k`-sets
       of `cbGraph m` avoiding the arm leaf, plus the identification of the arm-leaf vertex in C1-LA2's labels.
     - It is a compiled scratch declaration. By SOLUTION-CONTRACT §4 it has no grade until a governed award closes.
10. **Critic side result (scope, attributed to me): the mechanism works for general `d`.** For general `d ≥ 6` and
    `ε := (2dm+4) mod 3`, the same assignment gives `margin(j) = 3 − 2ε + (d−6)j` and `margin_R = −2ε`. I derived this by
    hand and checked it at 13,230 `(d, m, j)` triples, `d = 6..12`, `m = 1..60` (`general_d.py`, 0 failures). So:
    - For `ε = 0` (`dm ≡ 1 mod 3`): (G) handles every block and `R`.
    - For `ε = 1`: (G) handles every block, and `R` is handled by its explicit strict ratio, which is also Darroch- and
      Newton-free.
    - For `ε = 2`: `V_0` (and at `d = 6` every `V_j`) falls outside (G).

    Hence the favorability key's part (i) has a Darroch/Newton-free proof by (G) whenever `dm ≢ 2 (mod 3)`, `d ≥ 6`.
    This is STATED only: it is outside r31's fence and needs a second read. It is recorded here to inform the claim-identity
    decision below, not as a claim at another rank or class.
11. **Falsification outcome.** No counterexample, no failing block, no sign or index error. `cut_candidate: none`. T1's
    object is a favorability lemma, not a network statement.

## Mechanism-equivalence and fence check

- **Fence 1 (one rank, the class only).** The statement is at `p*` on `m ≥ 107`, `m ≡ 2 (mod 3)`, `d = 8`. My general-`d`
  side result is labelled STATED and out of fence, and no status moves to any aggregate.
- **Fence 2 (fidelity).** The return builds no network, so active-tag weight, (D) ∪ (S) and (WID) are not applicable. The
  selector entry for `v` is derived from the original tree: `Δ_{p*}` of the literal `T − v`, in my instrument. `x` is
  computed through `α` by me, and eligibility holds at every tested row. That is context only; T1 does not use eligibility.
- **Fence 3 (Darroch/Newton).** Neither is used, on any polynomial. No real-rootedness of `I`, `G` or `G^m` is invoked.
  `E993-TREE-REAL-ROOTED` stays REFUTED and is not revived.
- **Fence 6 (refuted mechanisms).** The mechanism is coefficient descent of two-binomial blocks by recurrence plus
  log-concavity. It is none of the refuted mechanisms: it is not the all-families compression, not CHAR at `m = 1`, not
  an `m`-independent per-choke certificate, and not forest real-rootedness.
- **Fence 7 (census discipline).** The universal claim rests on algebra plus a formally verified tool, not on sweeps.
  The seat's 2334-pair margin check and my rows are corroboration only.
- **Mechanism equivalence and alias.**
  - The candidate `E993-R31-CB-8-ARM-LEAF-FAVORABLE-AT-RANK-16M-PLUS-4-OVER-3-VIA-TWO-BINOMIAL-DESCENT-DARROCH-AND-NEWTON-FREE`
    is **mathematically an instance** of the registered
    `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, part (i). That
    key covers `d = 8`, every `m ≥ 1`, and the same `Δ_{p*}(T − v) < 0` with the same sign and index.
  - The tokens `VIA-TWO-BINOMIAL-DESCENT` and `DARROCH-AND-NEWTON-FREE` name a proof, not a predicate of the statement.
    The return's argument that "Darroch-and-Newton-free is part of the statement" does not survive: a key name must be a
    predicate of its mathematical statement.
  - Lexically there is no collision; I confirm the return's search terms are absent from the capsule-visible key text I
    read. Mathematically it is an **alias (sub-scope instance)**.
  - Recommendation for the synthesis: record T1's proof as a **scope/proof note on the existing favorability key** ("part
    (i) at `d = 8`, `m ≡ 2 (mod 3)` has a Darroch/Newton-free proof by C1-LA3's (G); zero exceptional blocks"), not as a
    new `E993-R31-` key.
  - If a new key is still wanted (for example as the statement of a funded Lean award), it should be named for the
    formal object, such as the closed-form coefficient inequality at `(16M+4)/3` on the class. It should carry no
    mechanism tokens and should cite the registered key as its mathematical parent.
- **Attribution.**
  - Proof mechanism (block-by-block (G) with margin `2j+3` and `margin_R = 0`): r31 C2 seat T1.
  - (G): C1-LA3 (Lemma A / closing step C-U3-T; formalizer as registered).
  - Closed forms and the favorability key: r30.
  - The Lean closed-form theorem, the fresh-row test at 116/119 and the general-`d` margin formula: this critic, C-T1-F.

## Certification audit

| Literal in the return | Backed? | Ruling |
|---|---|---|
| "`margin(j) = 2j+3`", "`margin_R = 0`" (exact ℤ identities) | Yes: hand re-derivation, my instrument, and `omega` inside my Lean proof | stands |
| "zero exceptional blocks" | Yes | stands |
| "no explicit `M_0` is needed" | Yes: Lean closes with `107 ≤ m` unused | stands |
| "Darroch/Newton-free end to end" | Yes: (G)'s kernel-checked proof uses minor-condition LC, and the route uses neither | stands |
| "`proved_informal`" for T1's object | Yes, as the grade of the argument: complete, elementary, one formal tool plus a `proved_informal` closed-form node | stands, with the input list corrected (finding 4) |
| "rests on exactly one external input" | No: it omits the closed-form node | **struck**, replaced by finding 4's wording |
| "tested first at the fresh rows `m = 110, 113`" | Rows tested, but they are control rows under ruling 9 | **"fresh" struck**; fresh rows 116 and 119 done by this critic |
| "two fully independent computational instruments" | Both instruments share the closed form, with no literal count at those rows | **"fully independent" struck**; the literal-tree agreement is now supplied by this critic at 107–137 |
| "shifts the margin by a constant `+11`" | Arithmetic error | **struck** (it is +13) |
| "16 checks, 0 mismatches"; "2334 `(m,j)` pairs"; "227 coefficient-pair checks" | Yes: replayed, and the counts are arithmetic (`108+111+114+2001`; `112+115`) | stand, at `bounded_computation` as corroboration |
| `RESULT_DIGEST_SHA256 b23dba2f…eff5` | Yes: reproduced on replay | stands |
| "421/432 digits", "419/431-digit `Δ`" | Yes: equal to my literal-tree values | stands |
| "`FAV_darroch_free: advanced`" | Yes, for the arm-leaf half at informal grade | stands |
| "T1's own object is closed … a successor should not re-attempt it" | Informally yes. Formally, no: the `cbGraph` link and the award remain | narrowed (see remaining obligation) |
| Proposed new key and its "No alias" verdict | Mathematically an instance of the registered favorability key (i) | **"No alias" struck**; proof note recommended instead |

## Verdict

The mathematics of T1 is complete and correct at `proved_informal`. For every `m ≥ 107`, `m ≡ 2 (mod 3)`, the arm leaf `v`
of `CB(8,m)` is favorable at `p* = (16m+4)/3`:

- Every block `V_j` has (G) margin `2j+3`, and `R` has margin `0`.
- Every weight `C(m,j)` is positive.
- Neither Darroch nor Newton is used, and there are no exceptional blocks and no `M_0`.

I re-derived it by hand, checked it with a literal-tree instrument at the control rows, the ruling-9 fresh rows 116/119
and row 137, and compiled it sorry-free in Lean at the closed-form level on standard axioms (critic-derived, no grade).

The verdict is narrowed on claim identity and on certification literals, not on the mathematics:

- The candidate key is a mathematical instance of the registered favorability key's part (i). It should enter the
  registry as a proof note on that key, not as a new predicate.
- The literals "exactly one external input", "fresh" (110/113), "fully independent instruments" and "+11" are struck.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: advanced
cut_candidate: none

The headline, (HALL) at full scope formally verified or a confirmed eligible deficient cut, is untouched by this route and
by this critique. This route removes Darroch/Newton from the arm-leaf half of the favorability input only. The
private-leaf half is a separate seat's object, which I did not read. The composition key's classical dependency is
therefore narrowed, not discharged.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Informal.** None for T1's object on the class: `Δ_{p*}(CB(8,m) − v) < 0` is proved Darroch/Newton-free. The only
   informal input besides (G) is the closed form `I(T − v) = (1+x)G^m + x(1+2x)^{8m}` with its binomial expansion.
2. **Formal, exact next node.** The closed-form inequality is now compiled in critic scratch as
   `critT1F_armLeaf_closedForm_descent`, which is ungraded until a governed award re-builds it. Two nodes separate it from
   the favorability hypothesis consumed by the terminal:
   - (a) the link `∀ k, indepSetCount (cbGraph m) {v_arm} k = ((1+X)·G^m + X·(1+2X)^{8m}).coeff k`, with `G` the
     contract's `(1+2X)^8 + X(1+X)^8`. This is U3's closed-form node for `cbGraph m − v`.
   - (b) the identification of the arm leaf in C1-LA2's labels as a `C4LA1.IsGraphLeaf`, so that (a) plus the theorem give
     `C4LA1.IsFavorableAt (cbGraph m) v_arm p*`.

   A governed award should carry C1-LA3 entries 1–17 byte-identically, keyed by `Main.lean` entry numbers and digests
   (gate ruling 12), and may take my two declarations as its informal specification.
3. **Registry.** Do not register a new `E993-R31-` key with mechanism tokens. Record a proof/scope note on
   `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` part (i). It needs
   an isolated second read before registration. The general-`d` extension (`dm ≢ 2 mod 3`, `d ≥ 6`) is STATED only.
4. **Composition grade.** The Tier 1 composition keeps its current grade. The arm-leaf half of favorability no longer
   needs Darroch/Newton, and the private-leaf half is still open.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T1-F/`.
I started no background job. Every computation ran in the foreground and none was left running (the process check is
disclosure 3). Nothing needed to be killed.

| Path | SHA-256 | Role |
|---|---|---|
| `instr/crit_t1f.py` | `8dfcb4f946506d6fbb994a64872930586d1e9aad0f38371197eb416a087c6b9b` | critic instrument (literal tree DP, closed form, block sum, (G) per block, `x`, eligibility) |
| `instr/run_rows.json` | `8f25b096f68f2b656b75ceaaf62aaa3463895e14015c8a89a81877936b9d788f` | rows 107, 110, 113, 116, 119, 137 (canonical digest `ec3d5834…dd3d`) |
| `instr/run_107.json` | `b2d0ab8c412f300aaf714afcb154f1dbb6b022af9f53c767573ff42bad68452d` | fixed-point row alone |
| `instr/general_d.py` | `352aacba9fffb102012a3cd197021f372f51a5c355c1ff3eb5c3680e551fd52c` | general-`d` margin check (13,230 triples, 0 failures; `general_d.log`) |
| `LeanProject/LeanProof/Main.lean` | `9c87a3bb229c1ea29548325f37ded672b1842582783489c641261b1e2a4731c5` | carried C1-LA3 lines 1–389 (byte-identical), then the critic's two declarations and `#print axioms` |
| `LeanProject/LeanProof/New.lean` | `02feba3a5e14259c0328311f29753dde1b00c8f6feddc238242a3adeab49156f` | the critic's new text alone |
| `LeanProject/LeanProof/Carried.lean` | `a064563c8265d84acd9a75c0e753b0b79f16e4e81b39c920251b730c84127973` | the carried prefix alone |
| `lean_compile.log` | `99845d8eca2c1173e14afe5b7f5fa9bff0b8c003e6a0b4da3e35de7a7539699f` | `lake env lean` output: axioms line, exit 0 |
| `replay/t1_main.py` | `29f137e84efc3764e5d8d6958c50c0c29c79b8e225342043e98625639326f3c3` | copy-out of the seat's generator |
| `replay/REPLAY-OUTPUT.log` | `3ee21be0b7c6436ce1e4a96c6f5d7fffce077ede072edd6d377e9e115c9385c3` | replay stdout, byte-identical to the seat's `t1_main_run.log` |

Lean project files `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` and `LeanProof.lean` were copied from C1-LA3's
frozen `LeanProject/`. `.lake/packages` is a symlink to the shared pinned project's packages. I did not run `lake update`,
`lake clean` or any install.
