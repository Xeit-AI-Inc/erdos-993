# Critique

Critic `C-U3-T` (orientation T, prove) of Cycle 1 of r31, assigned to the U3 return (`C1-U-03`, `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE`, orientation U).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both in full. I loaded no other VerityOS subsystem.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Dispatch `control/dispatch/c1-stage4/DISPATCH-C-U3-T.md`: SHA-256 `029d60023f7700a89c65fd8137cff87c89fea5c47117777e140c183262446c3f`. I verified it before any other action and it matched.

## Identity and seal audit

- **Capsule seal (reported):** `control/c1-critic-capsules/U3-PACKET-MANIFEST.json`. I recomputed the inner seal as SHA-256 over the compact key-sorted JSON without `seal_sha256`, with no trailing newline. The result was `9ee2cd0dbc6e5a7ce1cf15588b935ed3b47f777d9bcca403f8d22cc6d7fe9802`, which matches. All 14 listed members match in both byte count and SHA-256.
- **Stage 2 seal:** `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` recomputed, matches.
- **Stage 3 seal:** `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` recomputed, matches.
- **Stage 4 dispatch seal:** `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` recomputed, matches.
- **Return:** `cycles/cycle-1/stage3/returns/U3/RETURN.md` has SHA-256 `5d7c62e4…c2f71d`, which matches the capsule.
- **Return-listed artifact digests.** The return cites script digests at `scratchpad/c1-U3-replay/`. That directory is outside my grant, and I did not read it. Instead I hashed the inventoried originals under `scratchpad/c1-U3/`:
  - All seven `.py` files byte-match the digests the return cites (`223188aa…`, `1cd7f293…`, `6c496a3a…`, `d119adaf…`, `9992b85b…`, `79c3c43e…`, `2413a985…`).
  - `LeanProject/Smoke/Basic.lean` matches `ff133398…d246`.
  - The seat's `lakefile.toml`, `lake-manifest.json` and `lean-toolchain` byte-match the pinned shared project's files. The shared Mathlib checkout is at `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`.
- **Route identity:** route ID `C1-U-03` and mechanism token `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE` both appear verbatim and agree with `control/C1-ALLOCATION.md`. The return's Stage 3 disclosure record reads "none beyond the scoped boot", and I found nothing in the return that contradicts it.
- **Replay digests.** I copied the seven scripts out to `scratchpad/c1-crit-U3-T/replay/` first and ran them there in the foreground. Every output digest the return cites reproduced exactly: `9abda58a…`, `989da573…` and `8e1c3196…`. The printed `Diff` coefficients and `x = 570` also reproduced. Log: `replay/replay-log.txt`.

## Independent re-derivation

I built my own instruments using only the standard library (`math`, `fractions`, `hashlib`) and exact integers or rationals. I did not use the return's scripts as evidence for any claim below.

1. **The q = 1 reduction and polynomial** (`own/crit_e1_all_q.py`).
   - I wrote a generic fixed-Q implementation of the finite Pascal-ratio reduction, symbolic in `n` with `m = 3n + 2`:
     - `t = p* − Q − 1 = 16n + 11 − Q`, `a = 8Q − 1`, `b = 24n + 17 − 8Q`, `s0 = 16n + 12 − 9Q`;
     - `G_{j+1}/G_j = N_j/D_j` with `N_j = 16n + 10 + 2Q − 2j` and `D_j = 16n + 13 − 9Q + j`.
   - At Q = 1 this reproduces the return's `N_j = 16n + 12 − 2j`, `D_j = 16n + 4 + j` and the target indices `t = 16n + 10`, `s0 = 16n + 3`.
   - The resulting polynomial `−Δr_1(t)·commonD/G_4` is **coefficient-for-coefficient equal** to the return's list (1040054400, …, 85899345920). Its true degree is 7: the degree-8 term cancels, as the return says.
   - I checked the polynomial against exact `math.comb` values of `−Δr_1(t)·commonD/G_4` at `n = 1..59, 101, 333`, and every value agreed.
   - Every coefficient is positive, and `commonD > 0` for `n ≥ 0`. So **`r_1(p*−1) < r_1(p*−2)` holds for every `m` in the class. The q = 1 theorem is independently confirmed.** This is a uniform proof, not a check up to 5000.
   - **Where `m ≡ 2 (mod 3)` enters:** only through `3p* = 16m + 4`, i.e. the integer parametrization `p* = 16n + 12`. The polynomial's positivity does not otherwise use the residue.
2. **E1(i) at every q, on the control row and both fresh rows** (`m = 107, 110, 113`, all `q ∈ [1, m]`; same script, section B).
   - The condition holds strictly for every q: 0 ties and 0 failures.
   - The minimum relative margin is at q = 1: `4.3729e−3`, `4.2538e−3` and `4.1411e−3` respectively.
3. **(ELIG-top)(a) on the literal tree** (`own/crit_elig_blocks.py`).
   - I built an explicit edge list of `CB(8,m)` and asserted it is a tree (`n − 1` edges and connected). A generic rooted independence-polynomial DP computed `I(T)`. This DP is not the closed form.
   - At `m = 107, 110, 113` it gives `n = 1822/1873/1924`, `α = deg I = 964/991/1018 = 9m + 1`, and `x = 570/586/602`. `x` was computed through `α` with `Δ_α = −i_α`.
   - Eligibility holds at all three rows (`x + 2 ≤ p*` and `3p* < 2α + 1`), with `x + 2 = p*` tight at every row.
   - The closed form of record equals the tree DP at `p*−3..p*`.
   - `i_{p*−1} < i_{p*−2}` at all three rows, with relative margins `1.67e−3`, `1.82e−3` and `1.97e−3`.
   - The per-block decomposition of `i_{p*−1} − i_{p*−2}` sums exactly to the tree value.
   - (These are census values, not proof.)

## Attacks and findings

**F1. §5.6 is false as stated.** The return says each block "is individually past its own peak (descending) exactly for `j ≥ 4`, and still ascending for `j ∈ {0,1,2,3}`".

- At the fresh rows the exact block signs of `B_j(p*−1−j) − B_j(p*−2−j)` for `j = 0..11` are `+++---------`: **block `j = 3` descends.** The tail term `x(1+x)(1+2x)^{8m}` ascends.
- The error is in the method. The return's criterion is the mean offset `(p*−2−j) − μ_j = (j−4)/3`, which is a Darroch-style mode-near-mean heuristic, applied without naming Darroch. A mean offset in `(−1, 1)` does not determine a sign. At `j = 2, 3` Darroch leaves the mode ambiguous between `{t, t+1}`.
- The accompanying "concentration observation" is also wrong-weighted. It compares ascending weight `O(m^3)` against `Θ(2^m)`, but the block masses are `C(m,j)·3·2^{8j}·3^{8(m−j)}`, not `C(m,j)`. The mass peaks near `j ≈ 0.0376m`, which is about 4 at `m = 107`.
- The ascending-to-descending contribution ratio is `0.2886`, `0.2493` and `0.2158` at `m = 107, 110, 113`, so the ascending blocks are not negligible.
- The critic-derived Lemma B below proves the correct sign pattern for every `m` in the class.

**F2. "Immediate for any fixed `q = Q₀`" (§5.5 and §12, item 1) is unbacked.**

- The reduction does carry over: it is `8Q₀ + 1` terms and exact. But the closing step, "every coefficient positive", fails.
- In my instrument, `P_Q(n)` has negative coefficients for Q = 3 (8 of them), Q = 4 (16) and Q = 5 (20). Q = 2 is all-positive.
- The sign is recovered by a different certificate: a Taylor shift at `n = 35` (i.e. `m = 107`) gives all coefficients of `P_Q(35 + u)` nonnegative with `P_Q(35) > 0` for Q = 1..5.
- So the "free corollary" needs a new certificate for each Q and a class cutoff. It is not verbatim. (Lemma A below makes the point moot.)

**F3. "q = 1 is the binding case … confirmed (both analytically and computationally)" (§5.5) is an observation, not a theorem.**

- The analytic part is the mean-gap `(2q+1)/6` growing in q, which is a statement about means, not about relative margins.
- The computation covers `m = 107` only. I extended it to 110 and 113, with the same argmin.
- Striking it costs nothing, because no step of the return depends on it. The return itself correctly refuses to read its q = 1 result as E1(i).

**F4. Scope outside the class.** The theorem and the candidate are stated "for every `m ≥ 2` with `m ≡ 2 (mod 3)`".

- By gate ruling 5 and fence §3.1 this is narrowed to `m ≥ 107`, `m ≡ 2 (mod 3)`.
- At `n = 0` the Pascal-ratio parametrization degenerates: `s0 + 8 > b_1`, and `N_6 = 0`, `N_7 < 0`. The polynomial still gives the right sign there, but the face should not carry that claim.

**F5. Fixed-point literal.** `verify_fixed_points.py` "reproduces" `n = 1822` and `α = 964` by evaluating the formulas `17m + 3` and `9m + 1`. It does not compute them from a tree. Only `x = 570` is computed, and it is computed from the closed form (a `proved_informal` node), not from the tree. My literal-tree DP now reproduces all three independently.

**F6. The Lean lemmas.**

- Rebuilt copy-out-first with the shared packages bound by manual symlink, `cd` into the project first, and no `lake update` or `clean`. The result was `Build completed successfully (8657 jobs)`.
- `#print axioms`: `doubledCoeff_succ_mul` → `[propext]`; `doubledCoeff_diff_sign` → `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit` or `native_decide`, and no hypothesis encodes a conclusion. The `s ≤ b` hypothesis is harmless.
- Neither lemma mentions `r_q`, `p*` or CB. `doubledCoeff_succ_mul` is `Nat.choose_succ_right_eq` scaled by `2^s`, a known identity (SOLUTION-CONTRACT §2: not progress by itself).
- `doubledCoeff_diff_sign` is not used by the §5.4 argument, which uses ratios, not differences. Its docstring cites "RETURN.md derivation steps D1–D4", which do not exist in the return.
- The return is honest that these lemmas are scratch with no grade.

**F7. Gate line `ELIG_top: advanced`.** This rests on §5.6 (struck by F1) and on row confirmations, which are census values. It is not supported.

**F8. Checked and found sound.**

- The convolution reindexing `f_1(t) = Σ C(7,k)G_k` and `f_1(t+1) = Σ C(7,k−1)G_k`.
- The difference coefficients `(−1,−6,−14,−14,0,14,14,6,1)`.
- The ratio `2(b−s)/(s+1)`.
- The direction: `Δ = G_4·(RHS_H − LHS_H) < 0`.
- ℕ-subtraction: every generator guards negative indices, and `Δ` is computed in ℤ.

### Critic-derived advances (attributed to critic C-U3-T; part of the attacks section)

Everything in this section is mine, not the return's. It is **STATED** at a review stage and needs an isolated second read before registration.

**Lemma A (critic-derived): E1(i) at `p*` for every q, with neither Darroch nor Newton.**

- *Setup.* Let `r(k) = [y^k](1+y)^a(1+2y)^b`, with `a ≥ 0` and `b ≥ 1`.
  - (R) From `(1+y)(1+2y)·f′ = ((a+2b) + (2a+2b)y)·f` comes the exact recurrence `(k+1) r(k+1) = (a+2b−3k) r(k) + 2(a+b−k+1) r(k−1)`.
  - (LC) `r` is positive on `[0, a+b]` and log-concave. Proof by induction on linear factors: if `x` is positive and log-concave, then `z_k = x_k + c·x_{k−1}` (with `c > 0`) satisfies `z_k² − z_{k−1}z_{k+1} = LC_k + c²·LC_{k−1} + c(x_k x_{k−1} − x_{k−2} x_{k+1}) ≥ 0`, and the last bracket is `≥ 0` by the ratio chain. This is elementary and does not use Newton's inequalities.
- *Closing step.* Suppose `r(t+1) ≥ r(t)`. Then LC gives `r(t) ≥ r(t−1)`, and (R) gives `(t+1) r(t) ≤ (t+1) r(t+1) ≤ (3a+4b−5t+2) r(t)`, so `6t ≤ 3a+4b+1`. Hence **`6t ≥ 3a+4b+2` ⇒ `r(t+1) < r(t)`**.
- *At the target.* With `a_q = 8q−1`, `b_q = 8(m−q)+1`, `t_q = p*−q−1` and `3p* = 16m+4`, we get `6t_q − (3a_q+4b_q) = 2q+1 ≥ 3`. So condition (i) holds strictly at every `q ∈ [1, m]`, for every `m` in the class. q = 1 has gap 3, and this subsumes the return's theorem.
- *Checks.*
  - The recurrence was verified exactly at `k ∈ {1, t−1, t, t+1}`.
  - One-point LC, the gap identity, positivity and strict descent were verified for all q at `m = 107, 110, 113`.
  - Full LC of `r_q` on `[0, 8m]` at `m = 107` for `q = 1, 2, 53, 107`.
  - The parameter-free integer closing step and the gap identity compile sorry-free in Lean (critic scratch, no grade): `E993R31CritU3T.descent_of_recurrence_logconcave` and `E993R31CritU3T.r31_gap`, each with axioms `[propext, Classical.choice, Quot.sound]`.
- *Scope limit.* The argument reaches the registered key's statement (a) only where `p−q−1 ≥ μ_q + 1/3`. It does **not** replace that key in general. At `p*` the slack is `(2q+1)/6 ≥ 1/2`.
- *Alias check.* The conclusion is a sub-instance (`d = 8`, the class, `p = p*`) of `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (a). The registered proof of record uses Newton (step 2) and Darroch (step 3); Lemma A uses neither. It is a dependency reduction, which SOLUTION-CONTRACT §2 names as a fundable intermediate ("Darroch-free exact forms preferred"). A lexical scan of all 491 keys for `THREE-TERM`, `RECURRENCE` and `LOG-CONCAV` found no key with this object.
- *Candidate:* `E993-R31-CB8-CLASS-E1-CONDITION-I-AT-TOP-RANK-EVERY-Q-BY-THREE-TERM-RECURRENCE-AND-ONE-POINT-LOG-CONCAVITY`.
- *Proposed grade:* `proved_informal` after a second read.

**Lemma B (critic-derived): exact block signs for (ELIG-top)(a).**

- Let `B_j` be the coefficient sequence of `(1+x)^{8j}(1+2x)^{8(m−j)+1}`, and set `t = p*−2−j`. For every `m ≥ 107` with `m ≡ 2 (mod 3)`, **`B_j(t+1) > B_j(t)` exactly for `j ∈ {0, 1, 2}`, and `B_j(t+1) < B_j(t)` for every `j ≥ 3`**. The tail `x(1+x)(1+2x)^{8m}` ascends.
- *Proof.*
  - (R) and (LC) give a gap of `6t − (3a+4b) = 2j − 8`.
    - For `j ≥ 5` the gap is at least 2, so the block descends by Lemma A's closing step.
    - For `j ≤ 1` the gap is at most −6, so the block ascends, by the mirror argument at `k = t+1`: `6t ≤ 3a+4b−6` ⇒ ascent.
    - For the tail, the same mirror argument gives a gap of −13.
  - `j = 2, 3, 4` are fixed-`a` blocks. Each gets the return's finite reduction together with a Taylor-shift certificate at `n = 35`. All coefficients of the shifted polynomial share one sign (`+`, `−`, `−` respectively) and the constant terms are nonzero. Each certificate was point-checked against `math.comb` at `n = 35..59, 100, 700`.
- *Consequence.* This corrects §5.6 and turns (ELIG-top)(a) into a domination of the `j ≤ 2` blocks plus the tail by the `j ≥ 3` blocks. I did not attempt that domination. It is T3's obligation.
- *Candidate:* `E993-R31-CB8-CLASS-TOP-RANK-PARENT-DESCENT-BLOCKS-ASCEND-EXACTLY-FOR-J-AT-MOST-2`.
- *Proposed grade:* `proved_informal` after a second read.

## Mechanism-equivalence and fence check

- **Darroch/Newton hygiene.**
  - The return's §5.2–5.4 uses neither, as it claims.
  - Its §5.6 uses an unnamed mode-near-mean heuristic on real-rooted blocks. The inputs are admissible, but the inference is invalid (F1).
  - My Lemmas A and B use neither theorem. The LC induction is elementary.
  - Nothing is applied to `I`, `G` or `G^m`.
- **One rank per tree; the class only.** The return's `m ≥ 2` scope is narrowed (F4). Nothing is claimed at other ranks.
- **Refuted mechanisms.** None is revived. `E993-TREE-REAL-ROOTED` stays REFUTED.
- **Status transfer.** No status transfers to any aggregate. (HALL), the primary aggregate and Erdős #993 stay OPEN.
- **Census discipline.** Sweeps are not used as proof, and the r30 bounded record is not proof. The return's "q = 1 binding" observation is demoted (F3).
- **Network fidelity.** The return makes no network claim, so the (WID) and `F_{p*}` duties do not apply. It says so on its face (§6). I made no network claim either.

## Certification audit

- **Stands** (backed by replay or re-derivation):
  - the exact Q = 1 reduction and ratio identities;
  - the polynomial coefficients and their positivity;
  - "strict for every `m` in the class" for q = 1;
  - the listed digests;
  - "sorry-free" and the verbatim `#print axioms` output for the two scratch lemmas;
  - E1(i) for every q at `m = 107, 110, 113` (census);
  - ELIG(a) at the listed rows (census);
  - `x = 570`.
- **Struck:**
  - "for every `m ≥ 2`" (narrowed to the class);
  - "n = 1822, α = 964 reproduced" (tautological formula values; F5);
  - "confirmed (both analytically …) to be the tightest case" (F3);
  - "immediate", "free corollary", "applies verbatim" for fixed `Q₀` (F2);
  - all of §5.6's sign claim ("exactly for `j ≥ 4`", "`j ∈ {0,1,2,3}` ascending") and the "`O(m³)` vs `Θ(2^m)`" comparison (F1);
  - the gate line `ELIG_top: advanced` (F7);
  - "degree-8 polynomial" (the degree is 7).
- **Proposed grade.** The return's q = 1 candidate gets `proved_informal` at the class scope after a second read, and it is now subsumed by Lemma A. It is correctly not `formally_verified`.
- **Route verdict `bounded_evidence`.** Acceptable in substance for a q = 1 result. By SOLUTION-CONTRACT §4 labels, the q = 1 statement is `proved_informal`, not merely bounded.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The retained content is the q = 1 Darroch-free theorem at the class scope `m ≥ 107`, `m ≡ 2 (mod 3)`, which I independently re-derived. I believe its mathematics is complete, at grade `proved_informal`. The narrowing strikes:

- the out-of-class scope;
- the claimed fixed-`Q₀` corollary;
- the "binding case" claim;
- §5.6's false block-sign threshold and its concentration comparison;
- the `ELIG_top: advanced` line.

I also believe the mathematics of the critic-derived Lemma A (E1(i) at every q at `p*`, with neither Darroch nor Newton) and Lemma B (the exact block signs) is complete. Both are `proved_informal` candidates pending an isolated second read. Neither resolves the headline, and neither touches (L-S)_top.

LS_top: not_advanced
ELIG_top: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Second read.** Lemma A (recurrence (R), the elementary LC induction, the closing step and the gap `2q+1`) and Lemma B (the gap `2j−8`, the mirror ascent argument, and the three Taylor-shift certificates for `j = 2, 3, 4`) each need an isolated second read.
2. **(ELIG-top)(a) domination.** Show `Σ_{j≥3} C(m,j)|ΔB_j| > Σ_{j≤2} C(m,j)ΔB_j + Δtail` for every `m` in the class. The observed ascending-to-descending ratio falls from `0.289` to `0.216` over `m = 107..113`; that is a prior, not evidence. This is T3's obligation. Lemma B is the correct input; the return's §5.6 is not.
3. **Formal route for E1(i) at `p*`.** Formalize (R) as a coefficient identity for `(1+X)^a(1+2X)^b` in Lean, together with LC by induction on linear factors, and compose them with the compiled closing step `descent_of_recurrence_logconcave` and `r31_gap`. This is the natural Darroch-free award for E1(i) at `p*`, and it replaces the fixed-q polynomial route.
4. **Record correction.** Record the corrections to the return's §5.5, §5.6, §6 fixed-point wording and gate line (F1–F5, F7).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U3-T/`.

**Replay copies**

| Path | SHA-256 |
|---|---|
| `replay/*.py` | Byte copies of the seven U3 scripts (SHA-256s as listed in the seal audit) |
| `replay/replay-log.txt` | `fdd40a962be7941ecaad1a243fb207cf4cea971a35cc1ae8781c5728a51e5c65` |

**Critic instruments**

| Script | Script SHA-256 | Output digest | Log | Log SHA-256 |
|---|---|---|---|---|
| `own/crit_e1_all_q.py` | `aa00708cecbca157c944c8fd3727285ee53f39aea79ef2d60790130a013f8eda` | `87d4f0cdd0cca9de4c2af2f73ed7bbf651047c79e2d9fb739c25101514f9ec36` | `own/crit_e1_all_q.log` | `4ea59f49836da73ab264359819dc8d24d8d30305dbf634541aa2f3c64f0afe48` |
| `own/crit_elig_blocks.py` | `68688cd02c5fa02808043c4922bc671317869c8fa4a0bea15da9c2598cd158ef` | `8727a1418035b15e1f6d7764a1825caf616ce4daaba4b3111dc6373cd4f817e0` | `own/crit_elig_blocks.log` | `45a8a4e78d6df03d34aefc46a891132891dbd5622c575a1077d78a10151bc980` |
| `own/crit_block_fixed_a.py` | `eb15db8f7c1c57502cadf4bed587cccaf4741efd5b4882561113f8b9e55a8a1f` | `aaa0acc1cc1008abea34308d49044dcb45dba9a307314b6c34240536513fc8ce` | `own/crit_block_fixed_a.log` | `292d4a0a4cdaebfce63a9ed0917b6a31a6f06916c9c5c6cb4f4a68ea7665d3f1` |
| `own/crit_checks_extra.py` | `40cbde69cb9910da73e66bac2fd09b995e89a6fd7024dfeacfb85dd95b305484` | `998b4aa472801c1f7f807a3ace7735fa6f9d94b8ff8d683ccbd52b3f2b12a53c` | `own/crit_checks_extra.log` | `06398cea78cca911b3bdcc40eb790df8e1f6ff6e7c91ee47ca40d707877a1ef1` |

`crit_checks_extra.py` was re-run after removing an unused import; its output digest was unchanged. `crit_checks_extra.log` is from the first run.

**Lean project**

| Path | SHA-256 |
|---|---|
| `LeanProject/` | Copy of the seat's project; `.lake/packages` symlinked to the shared pinned packages |
| `LeanProject/Smoke/Basic.lean` | `ff133398885903e086fdd8dfbb88fba89442a051838a79ab82d8d895dd27d246` (byte copy of the seat's file) |
| `LeanProject/Smoke/Critic.lean` | `435eb4a195ba836833bf6eb291782cc76b710900bcd62c1c469bc7c57cae23de` |
| `LeanProject/Smoke.lean` | `c10ea1f9511f5cc12b662db252548f3f4fde837f7c6c46d03a5f494e8ba0e694` |
| `own/lean-build.log` | `fd8f927ceb7365519e04d710628c6db345b72642ef6a46f782fc7ba8b60801fe` |
| `own/lean-build-critic.log` | `bd84a7c4cff8f5e189de619f9989878fbfdfb5433147880a2bf0864a8d52c695` |

**Background jobs:** none were started, so there were none to kill.

**Read-boundary disclosures:**

1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use them.
2. I hashed the pinned shared project's `lakefile.toml`, `lake-manifest.json` and `lean-toolchain`, and ran `git rev-parse HEAD` in the shared Mathlib package. Both were for binding verification only.
3. I ran a Python key scan of `sources/authority/CLAIM-IDENTITY.json`. It is inside `sources/`, so within the grant.
4. I ran non-recursive `ls` of `scratchpad/c1-U3/`, its `LeanProject/` and my own scratch directory, all within the grant.
5. I ran no search rooted above a granted directory.
6. I did not read `scratchpad/c1-U3-replay/`, any sibling return, any critique or any adjudication.
