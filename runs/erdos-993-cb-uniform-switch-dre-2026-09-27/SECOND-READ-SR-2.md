# Second Read

Isolated second read **SR-2**, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 1. Object: E1 condition (i) at `p*`
for every `q`, Darroch- and Newton-free (synthesis S4, registration row R-3). Written 2026-09-28.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the brief requires. My first combined print failed on a zsh `=====`
separator after `verity.md` had printed (the tool display truncated its middle span), so I printed the startup protocol again on its
own. Subsystems loaded: the constitution and the startup protocol only. The controller owns conversation logging and durable
updates. This read writes only this file and scratch under `scratchpad/c1-sr-SR-2/`.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C1-SECOND-READ-PROTOCOL.md`: SHA-256 `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`.
  I recomputed it before any other action. **MATCH.**
- **Brief** `control/C1-SECOND-READ-BRIEF-SR-2.md`: SHA-256 `4dfb3633c0e20f5fe9ee717c22d3660fa9f5c5e114e3b386c560f140f61b7254`.
  I recomputed it before any other action. **MATCH.**
- **Capsule** `control/c1-second-read/SR-2-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-2`, 208 files. I recomputed the seal
  as the SHA-256 of the compact key-sorted JSON of the manifest without `seal_sha256`, with no trailing newline:
  **`df3a9219c8ad1a53914bd7087a0f85e04eaac9eb486c6cb897e3d48dc4c165f2`. MATCH** with the manifest's `seal_sha256` and with the
  dispatch. The manifest file's own SHA-256 is `fb5d6fdb…c5cd68a`. That is a different quantity, and I recorded it for completeness.
- **Members.** All **208/208** listed members match both byte count and SHA-256 (`seal_check.py`, 0 mismatches, 0 missing).
- **Frozen instruments.** All **117** capsule members under `sources/c1-stage7-sources/` (every member except the digest file
  itself) match `sources/c1-stage7-sources/SOURCE-DIGESTS.json` in bytes and SHA-256. I checked them before reading any of them.
- **Registries.** The frozen master `sources/authority/CLAIM-IDENTITY.json` and the run-local snapshot
  `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` are byte-identical (`cmp`), with 491 claims each.
  `control/CLAIM-DISTINCTIONS.json` is byte-identical to r30's frozen `sources/r30/records/control__CLAIM-DISTINCTIONS.json`.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use either. Following
     the brief, I wrote no conversation log.
  2. Two outputs were too large for the tool display: the brief, and a `sed` of the U3 return. The harness saved each to its own
     tool-results file outside the run root. I did not read either back. Instead I re-read the brief with `cat` and read the U3 return
     by heading.
  3. **Directory listing:** one `ls -la` of my own scratch directory. Its `..` line shows only the parent's metadata, not its entries.
  4. **Searches:** every `grep` and Python scan ran on capsule members only. I ran no `find`, `grep` or `rg` rooted above a capsule
     member.
  5. **What I did not do:** I read no other VerityOS file, no scratch, return, critique or adjudication outside the capsule, and no
     Mathlib source. I ran no `lake` or `lean`, used no network and installed nothing.
  6. **Jobs:** I started no background job and killed nothing. Every computation ran in the foreground as `python3 -B`, standard
     library only, with exact integers and `Fraction`s.
- **C1-LA3.** The Lean award may be running concurrently. Its receipt is not an input to this read, and I did not look for it.

## Statements read

- **Statement of record:** `cycles/cycle-1/stage6/SYNTHESIS.md`, which I read in full:
  - `## Exact established results`, S4;
  - `## Registrations`, R-3;
  - `## Headline verdicts`: the scope-note list and the E1(i) row;
  - `## Refuted or narrowed mechanisms`, the U3 strikes;
  - `### C1-LA3`, for the frozen Lean forms (G), (E1i) and (BD).
- **Origins:**
  - U3's return, §5 (the `q = 1` theorem; §5.5's fixed-`Q_0` "immediate" and §5.6 are struck and are not inputs here);
  - critique C-U3-T in full (Lemma A and the closing step);
  - critique C-U3-F, independent re-derivation and F-6(a) (the `q ≤ 63` certificates);
  - the U adjudication, U3 section and established results (the CF-U-2 ruling).
- **Controller facts, read as facts and never as authority:** `C1-STAGE5-CONTROLLER-FACTS-U.json` (CF-U-2) and
  `C1-STAGE6-CONTROLLER-FACTS.json` (CF6-4, CF6-5).
- **Contracts:** `SEMANTIC-CONTRACT.md` §2 (E1, `r_q`, the class, the threshold key citation) and `SOLUTION-CONTRACT.md` §§1–4.
- **Imported keys' texts:** the full records of `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (the
  criterion key) and `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (the threshold key),
  from both registries. This includes the scope notes `[r30 C4; SR-C4-6]`, `[r30 C5; SR-C5-4]`, `[r30 C6; SR-C6-1]` and
  `[r30 C6; SR-C6-4]`. I also read the scope-note blocks of `sources/r30/second-reads/SR-C6-1.md` and `SR-C6-4.md` for the house
  format.
- **Statements under read (one verdict each):**
  - **SR-2a:** the companion tool (G). For `r(k) = [y^k](1+y)^a(1+2y)^b`, `a, b ≥ 0`, if `1 ≤ t ≤ a+b` and `6t ≥ 3a+4b+2`, then
    `r(t+1) < r(t)`.
  - **SR-2b:** Lemma A. `r_q(p*−q) < r_q(p*−q−1)` for every `q ∈ [1, m]` and every class `m`, with no Darroch and no Newton.
  - **SR-2c:** the R-3 scope notes on the criterion and threshold keys. No new key.

## Independent re-derivation

### SR-2a: the companion tool (G), from the face

Let `f(y) = (1+y)^a(1+2y)^b` with integers `a, b ≥ 0`, `r(k) = [y^k]f`, and `r(k) = 0` for `k < 0` or `k > a+b`.

1. **Recurrence (R).** Since `f′/f = a/(1+y) + 2b/(1+2y)`, we have `(1+y)(1+2y)f′ = (a(1+2y) + 2b(1+y))f = ((a+2b) + (2a+2b)y)f`.
   - Write `(1+y)(1+2y) = 1 + 3y + 2y²`. Then `[y^k]` of the left side is `(k+1)r(k+1) + 3k·r(k) + 2(k−1)r(k−1)`.
   - `[y^k]` of the right side is `(a+2b)r(k) + (2a+2b)r(k−1)`.
   - Hence, for every `k ≥ 0`, **`(k+1)r(k+1) = (a+2b−3k)r(k) + 2(a+b−k+1)r(k−1)`**. At `k = 0` the `r(−1)` term vanishes.
   - The coefficient `a+2b−3k` can be negative, so (R) is an identity **in ℤ**. The coefficient `2(a+b−k+1)` is `≥ 2` for `k ≤ a+b`.
   - This agrees term for term with C-U3-T's (R) and the U adjudicator's hand derivation.
2. **Positivity on `[0, a+b]`.** `r(k) = Σ_α C(a,α)C(b,k−α)2^{k−α}` is exactly the criterion key's `Σ_α N_q(α,k)`.
   - For `0 ≤ k ≤ a+b`, the index `α = max(0, k−b)` satisfies `0 ≤ α ≤ a` and `0 ≤ k−α ≤ b`. That term is positive and every term is
     nonnegative, so `r(k) > 0`.
   - The support is exactly `[0, a+b]`, with no internal zeros.
3. **Log-concavity by induction on linear factors** (Newton-free). The empty product `(1)` is log-concave with contiguous support.
   Suppose `x ≥ 0` is log-concave with no internal zeros, and set `z_k = x_k + c·x_{k−1}` with `c ∈ {1, 2}`.
   - Direct expansion gives
     `z_k² − z_{k−1}z_{k+1} = (x_k² − x_{k−1}x_{k+1}) + c²(x_{k−1}² − x_{k−2}x_k) + c(x_k x_{k−1} − x_{k−2}x_{k+1})`.
   - The first two brackets are `≥ 0` by hypothesis.
   - The third bracket is `≥ 0` in two cases:
     - trivially, when `x_{k−2}x_{k+1} = 0`;
     - otherwise, `x_{k−2}, x_{k−1}, x_k, x_{k+1} > 0` by contiguity, and log-concavity gives the ratio chain
       `x_{k+1}/x_k ≤ x_k/x_{k−1} ≤ x_{k−1}/x_{k−2}`, so `x_{k+1}x_{k−2} ≤ x_k x_{k−1}`.
   - The support of `z` is again contiguous.
   - This is C-U3-T's (LC) step. I re-expanded it by hand, and my instrument checks the identity and the bracket's sign at every build
     step (below). It uses neither Newton's inequalities nor real-rootedness.
4. **Closing step.** Let `1 ≤ t ≤ a+b` and suppose, for contradiction, `r(t+1) ≥ r(t)`.
   - By (2), `r(t) > 0`. By (3), `r(t−1)·r(t+1) ≤ r(t)²`, so `r(t−1) ≤ r(t)²/r(t+1) ≤ r(t)`. This uses `r(t+1) ≥ r(t) > 0`.
   - (R) at `k = t`, with `2(a+b−t+1) > 0`, gives
     `(t+1)r(t) ≤ (t+1)r(t+1) = (a+2b−3t)r(t) + 2(a+b−t+1)r(t−1) ≤ (3a+4b−5t+2)r(t)`.
   - Dividing by `r(t) > 0` gives `t+1 ≤ 3a+4b−5t+2`, that is, **`6t ≤ 3a+4b+1`**.
   - Contrapositive: if `1 ≤ t ≤ a+b` and `6t ≥ 3a+4b+2`, then **`r(t+1) < r(t)`**. ∎
5. **Where each hypothesis enters.**
   - `t ≥ 1`: `r(t−1)` is a genuine coefficient. At `t = 0` the gap hypothesis `0 ≥ 3a+4b+2` is impossible anyway.
   - `t ≤ a+b`: gives `r(t) > 0` (so the divisions are valid) and `2(a+b−t+1) > 0`.
   - The gap: the final comparison.
   - **Boundary `t = a+b`:** `r(t+1) = 0 < 2^b = r(t)`. This is consistent with the proof, where `2(a+b−t+1) = 2`.
   - **Boundary `a = 0` or `b = 0`:** these are the one-factor cases `C(b,k)2^k` and `C(a,k)`. (R), (2) and (3) hold verbatim. C-U3-T's
     setup assumed `b ≥ 1`, but the statement as briefed (`a, b ≥ 0`) needs nothing more.
   - **`a = b = 0`:** vacuous, because `[1, 0]` is empty.
   - **ℕ-subtraction:** none occurs in (G). `a+b−k+1 ≥ 1` for `k ≤ a+b`. Only `a+2b−3k` needs ℤ, which is why (R) is stated in ℤ.
   - **Darroch and Newton:** neither is used anywhere in (1)–(4).
6. **Mean form of the gap.** From `f′(1)/f(1) = a/2 + 2b/3 =: μ`, the hypothesis `6t ≥ 3a+4b+2` is exactly `t ≥ μ + 1/3`. This is the
   "reach" C-U3-T records: `p−q−1 ≥ μ_q + 1/3`.

**Exhaustive exact check** (`sr2_instr.py` Part A; corroboration, not proof). It covers every `(a, b)` with `a, b ≥ 0`, `a+b ≤ 60`: 1,891
pairs, with `r` built factor by factor.
- **Definition:** the product agrees with the criterion key's sum `Σ_α C(a,α)C(b,k−α)2^{k−α}` at every `k ∈ [−1, a+b+1]`.
- **Derivative identity:** the polynomial identity `(1+y)(1+2y)f′ = ((a+2b)+(2a+2b)y)f` holds for every pair.
- **Recurrence and log-concavity:** (R) holds in ℤ at all 79,422 `(a,b,k)` with `0 ≤ k ≤ a+b+1`, and full LC holds at all 79,422.
- **Induction step:** the identity and a nonnegative bracket hold at all 1,976,095 `(step, k)` checks.
- **Positivity:** positive on `[0, a+b]` for every pair.
- **Mean:** the mean equals `a/2 + 2b/3` exactly for every pair.
- **(G) itself:** 31,995 instances `(a, b, t)` satisfy `1 ≤ t ≤ a+b` and `6t ≥ 3a+4b+2`, and `r(t+1) < r(t)` holds at all of them. Among
  them are 1,890 instances with `t = a+b`, 630 with `a = 0` and 930 with `b = 0`. Every pair except `a = b = 0` has a nonvacuous
  instance.
- **Contrapositive:** all 42,415 ascents-or-ties `r(t+1) ≥ r(t)` with `1 ≤ t ≤ a+b` satisfy `6t ≤ 3a+4b+1`.

**0 failures in every category.**

### SR-2b: Lemma A, E1 condition (i) at `p*`, every `q`

1. **The polynomial of record.**
   - The threshold key's statement defines `r_q(k) := [y^k](1+y)^{qd−1}(1+2y)^{d(m−q)+1}` (zero for `k < 0` or `k > dm`).
   - The criterion key defines `a_q := qd−1`, `b_q := d(m−q)+1` and `r_q(k) := Σ_α N_q(α,k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}`.
   - The two definitions agree, and `SEMANTIC-CONTRACT.md` §2 restates the same object.
   - At `d = 8`: `a_q = 8q−1` and `b_q = 8(m−q)+1`, with `a_q + b_q = 8m = dm`. So "zero above `dm`" is the natural degree bound.
2. **The index shift: CONFIRMED.**
   - The criterion key's condition (i) at `(d, m, p)` reads `r_q(j) ≤ r_q(j−1)` with `j := p−q` computed in the integers.
   - At `p = p*` it compares **`r_q(p*−q)` (the higher index) against `r_q(p*−q−1)`**.
   - With `t := p*−q−1` this is `r(t+1)` against `r(t)`, which is exactly (G)'s conclusion `r(t+1) < r(t)`.
   - The strict form is stronger than the key's non-strict (i), and it gives every `ρ_q = r_q(p*−q)/r_q(p*−q−1) < 1`.
   - C1-LA3's frozen (E1i) compares `.coeff ((16m+4)/3 − q)` < `.coeff ((16m+4)/3 − q − 1)`, which is the same pair.
3. **The gap, exactly.** With `a = 8q−1`, `b = 8(m−q)+1`, `t = p*−q−1` and `3p* = 16m+4`:
   - `6t = 2·(3p*) − 6q − 6 = 32m + 2 − 6q`;
   - `3a + 4b = 24q − 3 + 32m − 32q + 4 = 32m − 8q + 1`;
   - hence **`6t − (3a+4b) = 2q + 1`**, as the synthesis S4, C-U3-T and the U adjudicator state, and
     **`6t − (3a+4b+2) = 2q − 1`**.
   - The brief's line "check `6t − (3a+4b+2) = 2q+1`" is off by 2. The **correct value is `2q − 1`**, which is `≥ 1` for every
     `q ≥ 1`. So (G)'s hypothesis holds with slack `2q − 1` in units of `6t`, or `(2q−1)/6` in `t` above `μ_q + 1/3`. Equivalently,
     `t − μ_q = (2q+1)/6 ≥ 1/2`.
   - This corrects the brief's arithmetic only. The statement of record is unaffected.
4. **Side conditions.**
   - `1 ≤ q` gives `a ≥ 7`. `q ≤ m` gives `b ≥ 1`.
   - `t` ranges over `[(13m+1)/3, (16m−2)/3]`, taking `q = m` and `q = 1` respectively. For `m ≡ 2 (mod 3)`, `13m + 1 ≡ 0 (mod 3)`, so
     both endpoints are integers. `(13m+1)/3 ≥ 1` and `(16m−2)/3 ≤ 8m − 1 < 8m = a+b`, so `1 ≤ t ≤ a+b` (indeed `t+1 ≤ a+b`).
   - No truncated ℕ subtraction occurs. In the frozen Lean form, `(16m+4)/3 − q − 1` in ℕ equals the integer value because `q ≤ m`.
     `8q−1` needs `q ≥ 1`, and `8(m−q)` needs `q ≤ m`. All three are hypotheses of (E1i).
5. **Where the class enters.**
   - `m ≡ 2 (mod 3)` enters only through `3p* = 16m+4`, the integrality of `p*` and of the `t` endpoints.
   - `m ≥ 107` is not used by the argument. It is a scope fence (SOLUTION-CONTRACT §3.1), not a hypothesis the proof needs.
   - There is no `M_0`, no asymptotic step and no remainder.
6. **Conclusion.** (G) applies at every `q ∈ [1, m]`, so `r_q(p*−q) < r_q(p*−q−1)` for every `q ∈ [1, m]` and every `m ≥ 107`,
   `m ≡ 2 (mod 3)`, by (R), positivity, the elementary LC induction and the closing step alone. **Neither Darroch nor Newton is
   used.** In any case the only polynomial involved is `r_q`, which is a real-rooted input; nothing touches `I`, `G` or `G^m`.
7. **U3's `q = 1` theorem** (seat-attributed; U3, Claude Sonnet 5) is the case `q = 1`, gap 3, and is subsumed. I did not re-derive
   U3's degree-7 polynomial. Its re-derivations are by C-U3-T, C-U3-F and the U adjudicator, and it is not needed here.
8. **C-U3-F's `q ≤ 63` certificates.** They are `computer_assisted`, STATED, and corroboration only. I verified their files' digests
   and did not replay them. They are not evidence in this read.

**Class-row check** (`sr2_instr.py` Part B; corroboration, not proof). The coefficients `r_q(t−1)`, `r_q(t)` and `r_q(t+1)` come from the
criterion key's sum, updated exactly term to term.
- **Rows:** every `q` at all 68 rows `m ∈ {107, 110, …, 302} ∪ {500, 1001}` (14,998 `(m, q)` pairs), plus sampled `q` at
  `m = 2000` (40 values) and `m = 5000` (71 values), for 15,109 pairs in all.
- **Results, 0 failures in each:**
  - strict `r_q(p*−q) < r_q(p*−q−1)`;
  - the gap identities `2q+1` and `2q−1`;
  - (G)'s hypothesis;
  - `1 ≤ t`, `t+1 ≤ a+b = 8m`;
  - the ℕ-form of `t` equal to the integer form;
  - one-point LC at `t`.
- **Minimum relative margin:** at `q = 1` on every row, falling from `4.3729e−3` at `m = 107` to `4.682e−4` at `m = 1001`.
- **Mode position:** on every row, `q = 1` is the only `q` with `r_q(t−1) ≤ r_q(t)`. For every `q ≥ 2` the rank is strictly past
  the mode.
- **Second method** (Part C). At `m = 107, 110, 113` and every `q`, I generated `r_q` on `[0, t+1]` from `r(0) = 1` by (R) alone. Every
  division was exact, and the values agree with the direct sum at `t−1, t, t+1` (0 mismatches).
- **Fixed points reproduced, as priors only:**
  - `ρ_1(95) = 1354839571516225/1361543988640524`, `p*(95) = 508`, which equals the contract's §5 value;
  - `ρ_1(107) = 5150844596024699/5173467627355748`, which equals the U adjudication's prior.

### SR-2c: the scope notes (R-3)

1. **No new key.** This agrees with CF6-5 and C-U3-F's identity finding. Lemma A's conclusion is an instance of the threshold key's
   statement (a) at `d = 8`, `p = p* = ⌈μ_1⌉+2` (by `[r30 C6; SR-C6-1]`), strengthened to strict. What is new is a proof without
   the key's Darroch dependency, and that belongs in a scope note.
   - C-U3-T's candidate `…-BY-THREE-TERM-RECURRENCE-AND-ONE-POINT-LOG-CONCAVITY` names a method, not a predicate, and is not
     registrable.
   - U3's `…-PROVED-BY-…-WITHOUT-DARROCH-OR-NEWTON` is struck for the same reason.
2. **Alias check** (`alias_scan.py`, both registries, 491 claims each). A lexical scan for `three-term`, `recurrence`, `Darroch-free`,
   `without Darroch`, `log-concav`, `(1+y)^{qd`, `r_q`, `condition (i)`, `CONDITION-I` and `E1` turns up no registered key whose object
   is a Darroch-free E1(i) at `p*`. The hits are:
   - the two host keys;
   - the r30 row keys, which check (i) directly at their finite rows `m ≤ 107` and are consistent with this read;
   - unrelated log-concavity keys.

   Testing candidate phrases against every registered `alias_patterns` gives **one hit**: the phrase "coefficient descent" matches
   `coefficient[- ]descent`, a pattern of **`E993-BETA-TARGET` (REFUTED)**. That key is a statement about leaf-deleted polynomials
   (`b_v(p) ≤ Bgen_s(p−1)`), a different object, so there is no alias.
   - **The registration texts below avoid that phrase.** A registrar's pattern match on it would be a false positive.
   - The distinction rows in `control/CLAIM-DISTINCTIONS.json` that involve the two host keys (R30-C5-CONDITION-I-THRESHOLD-VS-E1,
     SR-C6-1-DR1 and the E1 rows) are untouched by a scope note.
3. **Grade.** Neither note upgrades either key.
   - The threshold key keeps its statement, `proved_informal`, and its "modulo Darroch 1964" qualifier as a whole. The note records a
     Darroch-free proof of one instance only.
   - The criterion key is an implication and keeps its statement, grade and fences. The note records that its hypothesis (i) is
     discharged Darroch-free at `(8, m, p*)` on the class. Its application still needs `F ⊇ C`, which on the class is supplied only by
     the favorability key, modulo Darroch/Newton.
   - The attached proof is `proved_informal` after this read. That is the R-3 grade, and it is a citation-level dependency
     reduction, not a key grade.
4. **Fences.**
   - One rank (`p*`), the class only (`d = 8`, `m ≥ 107`, `m ≡ 2 (mod 3)`). No widening past `p*` or the class.
   - Darroch and Newton hygiene is vacuous, since neither is used.
   - No status transfer: (HALL) and the primary aggregate stay OPEN.
   - It is a Tier 3 dependency reduction, not Tier 2 progress (SOLUTION-CONTRACT §1).
   - No census value is used as proof.
   - Attribution travels on the face:
     - C-U3-T: the lemma;
     - U3: `q = 1`;
     - C-U3-F: corroboration;
     - the U adjudicator: the replay and the ruling;
     - r30: the criterion, the threshold key and `r_q`;
     - Codex GPT-6: the network, weight and (HALL).

## Findings and repairs

1. **Brief arithmetic (repair to the check line, not to the statement).**
   - `6t − (3a+4b+2) = 2q − 1`, not `2q+1`.
   - The statement of record's `6t − (3a+4b) = 2q+1` (S4, C-U3-T, U adjudication, C1-LA3's `r31_gap`) is correct.
   - (G)'s hypothesis holds at every `q ≥ 1` with integer slack `2q − 1 ≥ 1`.
2. **The (R) node must be stated in ℤ.** The coefficient `a+2b−3k` is negative for `k > (a+2b)/3`, that is, in the region the
   closing step uses. For C1-LA3's first open node (R as a `Polynomial.coeff` identity): state it over ℤ, or cast before subtracting.
   A literal ℕ statement would truncate. The frozen (G) and (E1i) are already over ℤ with no ℕ subtraction beyond the guarded
   `(16m+4)/3 − q − 1`, `8q−1` and `8(m−q)`.
3. **(G) at `a, b ≥ 0`.** C-U3-T's setup assumed `b ≥ 1`. The proof needs no such assumption, and my grid covers `b = 0` (930
   instances). The statement as briefed stands.
4. **The closing step needs `r(t−1) ≤ r(t)` only under the contrary assumption.** The class rows show why: for `q ≥ 2` the rank `t`
   is strictly past the mode (`r(t−1) > r(t)`), and only `q = 1` sits at the mode.
   - My first instrument run composed the one-point check as "LC ∧ `r(t−1) ≤ r(t)`" unconditionally. It therefore flagged every
     `q ≥ 2`, 1,000 flags at `m = 1001` alone.
   - That was a defect in my check, not in the mathematics. I fixed the check to test LC alone and to count the pre-mode `q`
     separately, then re-ran it. The defective run's output is kept, labelled, in the inventory.
5. **No sharpness claim.** On the grid, no `(a, b, t)` has `6t = 3a+4b+1` together with `r(t+1) ≥ r(t)`. The `+2` might therefore be
   weakened to `+1` on the grid. This is recorded only, is not claimed, and nothing needs it.
6. **An observation outside the fence; not registered, not claimed.**
   - At `d = 8` and a general rank `p`, the closing-step slack is `6p − 32m − 9 + 2q`, smallest at `q = 1`.
   - On `m ≡ 2 (mod 3)` it is `≥ 1` for every `p ≥ p*`. Beyond degree, (i) holds trivially.
   - So the same argument reaches the threshold key's (a) at every rank `p ≥ p*` of `CB(8,m)` on this residue class. By
     SOLUTION-CONTRACT §3.1 (one rank per tree), this is **not** part of any registration below. It is a pointer for a future
     scope decision only.
7. **Attribution check.**
   - The synthesis S4 attribution (C-U3-T; U3 for `q = 1`; C-U3-F corroboration) travels correctly.
   - C1-LA3's "the mechanism: Codex GPT-6" line refers to the transport network and weight behind E1, not to Lemma A's argument, which
     is C-U3-T's.
   - The notes below say this explicitly.
8. **No defect found** in C-U3-T's Lemma A as written: its (R), its expansion of the induction step, its closing inequality
   `(t+1)r(t) ≤ (3a+4b−5t+2)r(t)`, and its gap and scope limit `p−q−1 ≥ μ_q + 1/3`.

## Registration text

SR-2a (G) is a companion tool. It gets no key and no grade of its own (SOLUTION-CONTRACT §4). Its statement and proof travel on the
face of the threshold-key note below. SR-2b (Lemma A) gets no new key (CF6-5, R-3): it is registered as the two scope notes. The
bounded support is a separate record.

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
TEXT: [r31 C1; SR-2] Darroch- and Newton-free proof of one instance of statement (a), in strict form. At d = 8, for every integer m >= 107 with m ≡ 2 (mod 3) and the single rank p = p* = (16m + 4)/3 (which equals ⌈μ_1⌉ + 2 there, by the [r30 C6; SR-C6-1] note): r_q(p* − q) < r_q(p* − q − 1) for every q ∈ [1, m], where r_q(k) = [y^k](1 + y)^{8q−1}(1 + 2y)^{8(m−q)+1} as in this key's statement; hence every ρ_q = r_q(p* − q)/r_q(p* − q − 1) is < 1. Proof (elementary; no import). For integers a, b >= 0 let r(k) := [y^k](1 + y)^a(1 + 2y)^b, with r(k) = 0 outside [0, a + b]. (1) Comparing coefficients of y^k in (1 + y)(1 + 2y)f′ = ((a + 2b) + (2a + 2b)y)f, f = (1 + y)^a(1 + 2y)^b, gives, in the integers, (k + 1)r(k + 1) = (a + 2b − 3k)r(k) + 2(a + b − k + 1)r(k − 1) for every k >= 0 (the coefficient a + 2b − 3k may be negative). (2) r(k) = Σ_α C(a, α)C(b, k − α)2^{k − α} > 0 for 0 <= k <= a + b (the term α = max(0, k − b) is positive). (3) r is log-concave with no internal zeros, by induction on linear factors: if x >= 0 is log-concave with no internal zeros and z_k = x_k + c·x_{k−1} with c > 0, then z_k² − z_{k−1}z_{k+1} = (x_k² − x_{k−1}x_{k+1}) + c²(x_{k−1}² − x_{k−2}x_k) + c(x_k x_{k−1} − x_{k−2}x_{k+1}), and the last bracket is >= 0 (trivially when x_{k−2}x_{k+1} = 0, otherwise by x_{k+1}/x_k <= x_k/x_{k−1} <= x_{k−1}/x_{k−2} on the contiguous support). (4) Closing step: if 1 <= t <= a + b and r(t + 1) >= r(t), then (2) and (3) give r(t − 1) <= r(t)²/r(t + 1) <= r(t), and (1) at k = t, with 2(a + b − t + 1) > 0, gives (t + 1)r(t) <= (t + 1)r(t + 1) <= (3a + 4b − 5t + 2)r(t), so 6t <= 3a + 4b + 1; contrapositively, 1 <= t <= a + b and 6t >= 3a + 4b + 2 imply r(t + 1) < r(t). Instance: a = 8q − 1, b = 8(m − q) + 1, t = p* − q − 1 and 3p* = 16m + 4 (the only place m ≡ 2 (mod 3) enters) give 6t − (3a + 4b) = 2q + 1, that is 6t − (3a + 4b + 2) = 2q − 1 >= 1; q >= 1 gives a >= 7, q <= m gives b >= 1, and (13m + 1)/3 <= t <= (16m − 2)/3 < 8m = a + b, so 1 <= t <= a + b; no truncated ℕ subtraction occurs, and there is no cutoff M_0 and no asymptotic step. Neither Darroch's theorem nor Newton's inequalities is used; the only polynomial involved is r_q, a product of linear factors, and no step touches a tree or forest independence polynomial. Reach: the closing step decides a rank only where p − q − 1 >= μ_q + 1/3, with μ_q = a/2 + 2b/3 the mean of r_q; at p* the slack is t − μ_q = (2q + 1)/6. Scope: this instance only. Nothing is asserted at any other rank, at m ≡ 0 or 1 (mod 3), at m < 107, or for d ≠ 8; everywhere else this key keeps its Darroch dependency. This is a dependency reduction of a carried input of the r31 target on CB(8, m), not progress on (L-S)_top or on the parent descent. E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN; TREE, FOREST, TRANSFER and Erdős #993 are untouched; no status transfers. Bounded support, not proof: record R31-C1-SR2-TWO-BINOMIAL-GRID-AND-CLASS-CHECKS. Attribution: C-U3-T (r31 Cycle 1, Claude Opus 5.5; the recurrence, the elementary log-concavity induction, the closing step, the gap 2q + 1 and the reach p − q − 1 >= μ_q + 1/3); U3 (r31 Cycle 1, Claude Sonnet 5; an independent proof of the case q = 1, subsumed); C-U3-F (r31 Cycle 1, Claude Opus 5.5; exact per-q certificates for q <= 63, computer_assisted, corroboration only); the r31 Cycle 1 U adjudicator (Claude Opus 5.5; the replay and the ruling); isolated second read SR-2 (r31 Cycle 1, Claude Opus 5.5; the proof on this face, the boundary cases and the exact checks); r_q, condition (i) and this key: r30, as registered on this key. This note changes neither this key's statement, grade (proved_informal) nor fences, and the key's qualifier "modulo Darroch 1964" stands for the key as a whole.
```

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r31 C1; SR-2] At d = 8, for every integer m >= 107 with m ≡ 2 (mod 3) and the single rank p = p* = (16m + 4)/3, condition (i) of this key's criterion holds strictly at every q ∈ [1, m]: r_q(p* − q) < r_q(p* − q − 1), with j = p* − q as in this key's statement. The proof is elementary and uses neither Darroch's theorem nor Newton's inequalities; it is written on the face of the [r31 C1; SR-2] note on E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD. Condition (ii) holds identically by this key's [r30 C4; SR-C4-6] note. So at these (d, m, p) the whole criterion holds, every ρ_q < 1, and this key's conclusion (the non-sector deletion-arc flow and (HALL-COND) for every non-sector family) is available for every leaf set F ⊇ C at this key's grade, proved_informal, with no Darroch dependency entering through condition (i), unlike the general-rank route of the [r30 C5; SR-C5-4] note. No eligibility is asserted, and F_{p*}(T) ⊇ C remains a separate obligation. On this class it is supplied only by E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3, at that key's grade (modulo Darroch and Newton on products of linear factors), so any application of this key through that input keeps that dependency. Nothing is asserted at any other rank, at m ≡ 0 or 1 (mod 3), at m < 107, or for d ≠ 8. Not (HALL) and not a restricted-scope (HALL) theorem: sector families are outside this key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN, and no status transfers. Attribution: C-U3-T (r31 Cycle 1, Claude Opus 5.5; the Darroch-free proof of condition (i) at p*); U3 (r31 Cycle 1, Claude Sonnet 5; the case q = 1, subsumed); C-U3-F (r31 Cycle 1, Claude Opus 5.5; per-q certificates for q <= 63, computer_assisted, corroboration only); the r31 Cycle 1 U adjudicator (Claude Opus 5.5; the replay and the ruling); isolated second read SR-2 (r31 Cycle 1, Claude Opus 5.5); the criterion and this key: r30, as registered on this key; the transport network, the active-tag weight and (HALL): Codex (GPT-6 Astra/Sol/Luna), the lower-region run. This note changes neither this key's statement, grade nor fences.
```

```text
RECORD: R31-C1-SR2-TWO-BINOMIAL-GRID-AND-CLASS-CHECKS
CLAIM: Exact (integer/Fraction) checks by SR-2. For every a, b >= 0 with a + b <= 60 (1,891 pairs), r(k) = [y^k](1 + y)^a(1 + 2y)^b built factor by factor: agreement with Σ_α C(a, α)C(b, k − α)2^{k − α} at every k ∈ [−1, a + b + 1]; the derivative identity (1 + y)(1 + 2y)f′ = ((a + 2b) + (2a + 2b)y)f; the recurrence (k + 1)r(k + 1) = (a + 2b − 3k)r(k) + 2(a + b − k + 1)r(k − 1) in ℤ at all 79,422 (a, b, k) with 0 <= k <= a + b + 1; full log-concavity at all 79,422; the factor-induction identity and a nonnegative bracket at all 1,976,095 checks; positivity on [0, a + b]; mean a/2 + 2b/3; r(t + 1) < r(t) at all 31,995 instances with 1 <= t <= a + b and 6t >= 3a + 4b + 2 (1,890 with t = a + b, 630 with a = 0, 930 with b = 0), and 6t <= 3a + 4b + 1 at all 42,415 ascents-or-ties. On CB(8, m) at p* = (16m + 4)/3: r_q(p* − q) < r_q(p* − q − 1), the gap 6t − (3a + 4b) = 2q + 1, 1 <= t <= a + b and one-point log-concavity at every q at the 68 rows m ∈ {107, 110, ..., 302} ∪ {500, 1001} (14,998 pairs) and at 111 sampled q at m = 2000, 5000; 0 failures; the minimum relative margin is at q = 1 on every row (4.3729e−3 at m = 107, 4.682e−4 at m = 1001). At m = 107, 110, 113 and every q, r_q generated from r(0) = 1 by the recurrence alone (every division exact) equals the direct sum at t − 1, t, t + 1. Fixed points reproduced: ρ_1(95) = 1354839571516225/1361543988640524, ρ_1(107) = 5150844596024699/5173467627355748.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-2 (r31 Cycle 1, Claude Opus 5.5), scratchpad/c1-sr-SR-2/sr2_instr.py (SHA-256 4b322eace9b52cada99665b5adcd939e63b5416c8dc3f07d3319961b2f79f7c6), output sr2_instr.out.json (SHA-256 76b0de026338f37b93ebcc78a5111e787e3507d4eae4326e818dd7646b0fdaf7); support only, never evidence in a proof.
```

## Verdicts

verdict[SR-2a]: confirmed
verdict[SR-2b]: confirmed
verdict[SR-2c]: confirmed_with_repairs

- **SR-2a.** Confirmed as stated (`a, b ≥ 0`). Proved from the face, Darroch- and Newton-free. The boundary cases `t = a+b`, `a = 0`
  and `b = 0` are handled. (R) is read in ℤ (finding 2). It has no key and no grade of its own.
- **SR-2b.** Confirmed. The polynomial and the index shift are exactly E1's condition (i) at `p*`. The gap is `6t − (3a+4b) = 2q+1`,
  equivalently `6t − (3a+4b+2) = 2q − 1 ≥ 1`. The brief's `2q+1` for the latter is its own arithmetic slip, and the statement of
  record is correct. `1 ≤ t ≤ a+b` holds for all `q ≤ m`. Grade `proved_informal`, Darroch- and Newton-free, at `p*` on the class. It
  is registered through the SR-2c notes, with no new key.
- **SR-2c.** Confirmed with repairs. The synthesis's one-line note texts are replaced by the self-contained texts above. The repairs:
  - no working labels ("Lemma A", "r31 C1 Lemma A") in registry text;
  - the proof on the face;
  - an explicit statement that neither key's grade, statement or fences change, and that the threshold key's Darroch qualifier stands
    for the key as a whole;
  - explicit fences against widening past `p*` or the class;
  - the favorability dependency for `F ⊇ C` named on the criterion-key note;
  - full attribution;
  - avoidance of the phrase that trips `E993-BETA-TARGET`'s alias pattern.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-2/`. All runs
used `python3 -B`, standard library only, in the foreground.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `ac07df8ad1cd71d1faf6212e0b120c90b3d9ebfac81c4adaab2f8ffc1a5d218e` | Capsule seal recomputation and 208 member digests |
| `alias_scan.py` | `c37c13941077966c199c03c353f966350c868b23121f6710e9b83d4277bb106a` | Lexical and alias-pattern scan of both registries |
| `alias_scan.out.json` | `0b52b2638cdcfeba384ada6c798036980f0d28016183a4e9346a46543cf56a37` | Scan output (one alias-pattern hit: `E993-BETA-TARGET`, a phrase test only) |
| `sr2_instr.py` | `4b322eace9b52cada99665b5adcd939e63b5416c8dc3f07d3319961b2f79f7c6` | Own instrument: Part A the (G) grid, Part B Lemma A on class rows, Part C fixed points and the recurrence cross-method (about 7 min) |
| `sr2_instr.out.json` | `76b0de026338f37b93ebcc78a5111e787e3507d4eae4326e818dd7646b0fdaf7` | Output of record (0 failures in every category) |
| `sr2_instr.run1-defective-LC1-check.out.json` | `75e5cbef9925d318e27b96766d8093f0ea35852e5bb3a3de15cf17502ee176c9` | First run, kept as a record. Its one-point check wrongly required `r(t−1) ≤ r(t)` unconditionally (finding 4). Not of record |

The stage-7 source digests were verified in-line (see the seal audit). The only file written outside the scratch root is this
`SECOND-READ.md`. No background job was started, and nothing was killed.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
