---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c5-la1-formalizer-sonnet-20260922
critic_id: c5-la1-fable-informal-20260922
attestation_id: c5-la1-informal-pass-20260922
claim_sha256: 0cb3241f12ca04ebbd4d350faebda1e27243a1afedfb8641b2026336cb7df37b
---

# Informal Proof Integrity Audit

## Boot acknowledgment

Operating within VerityOS. Booted this session by reading `verity.md`,
`identity/startup-protocol.md`, and `skills/proof-integrity-audit/skill.md` —
the three reads this brief's §0 authorizes. Per the startup protocol's
task-type map this is experiment work, so the loaded subsystem is
`experiments/` (this run's directory tree, within the §1 read boundary) plus
the one named skill document. No other VerityOS subsystem (`memory/`,
`decisions/`, `operations/`, `writing/`, `logs/`, `knowledge/`, `projects/`)
was opened. Conversation logging is the controller's; this seat writes only
its audit and its scratch.

**Model disclosure.** Chartered Claude Opus 5, effort `high`. The Agent
transport that dispatched this seat exposes no effort parameter and this seat
**cannot self-inspect its own runtime model or effort setting**; the line above
is stated on dispatch-record authority, as the brief requires.

**Seat discipline.** Independent informal proof-integrity reviewer, not the
producer. Nothing outside `scratchpad/c5-s7-informal-LA1/` was written: the
contract, the Lean source, `INFORMAL-PROOF.md`, every receipt and every
capsule member were opened read-only and are byte-unchanged. No proof was
repaired and no defect was softened. Child delegation forbidden and not used.
No network, no package install, no `lake`/`elan` invocation of any kind (this
audit needs no build). All computation ran in the foreground.

**Read boundary honoured.** Read: the Lean run's `THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`,
`FORMALIZER-REPORT.md`, `EVIDENCE/verify_matching_dual_scalar_core.py` and its
output JSON, `LeanProject/LeanProof/Main.lean`; the sealed capsule manifest and
its members (`SYNTHESIS.md` `## Lean awards` AWARD GROUP A; the U adjudication
`## Lean readiness` rank 1; the U1 return's two critiques C-U1-F and C-U1-T);
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `SOLUTION-CONTRACT-ADDENDUM-1.md`;
and, in the shared Mathlib at the pinned revision, `Mathlib/Data/Nat/Factorial/Basic.lean`
and `Mathlib/Data/Nat/Init.lean` for `Nat.descFactorial`,
`Nat.descFactorial_succ`, `Nat.descFactorial_one`, `Nat.succ_descFactorial_succ`
and `Nat.le_induction`. The run's `SOURCE/*.lean` copies were **not** opened:
§1 does not enumerate them, and byte-for-byte transcription fidelity is the
separate fidelity gate's object, not this seat's. Nothing else was opened.

**Digests confirmed on entry.** `THEOREM-CONTRACT.yaml`
`5a6ad44c2c59d95c378c3e60e3b4a37d539dbfb2c8c0df719d663efd1210663c`;
`INFORMAL-PROOF.md`
`f1e0d57ed35141aad5fa3b5d10a01b063b885964357eaa50be12b73b782320d9`;
`LeanProject/LeanProof/Main.lean`
`55d57358e046e0159a8e890bc1725b11fd4aba12e405453ad2eda41cc6c974e3` — all three
match the brief. The capsule manifest's internal
`seal_sha256` is `ce9736a9bb93a43fe9d55627f8c98893f54e7790bf5a68e0426168ca498943bb`,
which I recomputed myself from the compact key-sorted JSON of the manifest minus
`seal_sha256` and which equals the brief's seal; I independently re-hashed all
**9/9** member files and all matched byte count and digest. (The manifest
*file's own* SHA-256 is `5b681cad034f10f3d8fba12af62945afe7d7eefa24107596207ff938f1e7972b`;
the brief's "seal" is the internal field, not the file hash. Noted so the
distinction is not mistaken for a mismatch.)

**`claim_sha256` recomputed.** `" ".join(s.split())` applied to the contract's
`theorem.informal_statement` (1619 characters; whitespace collapse is a no-op on
this string, which I checked) hashes to
`0cb3241f12ca04ebbd4d350faebda1e27243a1afedfb8641b2026336cb7df37b`, **equal to
the value the brief states** and carried in this file's front matter. As a
second binding check I recomputed `lean_binding.expected_statement_sha256` =
`2da4ae2dc4bf632aca0a4ef6e31663cabcd31b764362d690b270cebd0f8723b5` (matches) and
confirmed `conclusion.statement` is byte-identical to `expected_statement`.

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`: the
**conjunction** of four propositions, under the mandatory scope fences and the
attribution, with `PStatement m K n := Nat.descFactorial n (2n−K−1) ≥
2^(2n−K−1) · Nat.descFactorial (m+n−K−1) (2n−K−1)`, `s = 2n−K−1`,
`q = m+n−K−1`, `p = K+1−n`, `d = 2m−K`, and "hard index" meaning `K+1 < 2n`
and `n ≤ m`:

1. **Factorisation.** For all integers `m, d`:
   `9d² + 12(m+1)d − 12(m+1)² = 3(3d − 2(m+1))(d + 2(m+1))`.
2. **Two-sided region characterisation.** For `m, d ≥ 0`: that discriminant is
   `≤ 0` **iff** `3d ≤ 2m+2`.
3. **Step (S).** For `m, d ≥ 0` with `3d ≤ 2m+2` and **every** integer `n`:
   `(n+1)((2m−d)+1−n) ≥ 4(m+n−(2m−d))(m−n)`.
4. **(P) at every hard index.** For all naturals `m, K` with `K ≤ 2m` and
   `3(2m−K) ≤ 2m+2` (the hypotheses stated over `ℤ` through casts), and every
   `n : ℕ` with `K+1 < 2n` and `n ≤ m`: `PStatement m K n` — i.e. both parities
   of `K`.

I audited `INFORMAL-PROOF.md` as the proof of that conjunction, at
statement-level granularity, recomputing every step with my own exact-integer
instrument rather than accepting prose agreement.

The claim as contracted matches the award statement of record
(`SYNTHESIS.md` `### AWARD GROUP A`) and the U adjudication's rank-1 entry, with
**one deliberate difference, in the claim's favour**: the synthesis and the
adjudication both list `m ≤ K+1` among the hypotheses ("Nothing else"), and the
contract's part 4 **drops** it. That is a strengthening, not a weakening — the
shipped theorem has strictly fewer hypotheses and the same conclusion — and it is
sound precisely because `m ≤ K+1` is redundant (ledger row L15, proved and swept
below). Recorded explicitly so the difference is registered rather than absorbed.
The other difference is nominal: the synthesis names `S_holds_of_discriminant_nonpos`
for part 3 while glossing it "on the region", and the contract uses
`S_holds_on_region`, which *is* that gloss made into a statement in the `(m,d,n)`
parametrisation; both lemmas are seat U1's and both are in the closed DAG.

## Claim Ledger

Granularity: one row per definition, lemma, identity, or inferential step.
Verdict vocabulary per `skills/proof-integrity-audit/skill.md`. "Verified" means
verified **with independently reproduced evidence** — my own derivation plus my
own exact-integer recomputation, never the producer's instrument.

### Definitions and index dictionary

| id | claim | verdict | evidence |
|---|---|---|---|
| L1 | `PStatement (m K n : ℕ) : Prop := Nat.descFactorial n (2*n−K−1) ≥ 2^(2*n−K−1) * Nat.descFactorial (m+n−K−1) (2*n−K−1)`, with `ℕ`-truncated subtraction in all three index positions. | verified | Read literally off `Main.lean` entry 1; `INFORMAL-PROOF.md` §1 quotes it character-for-character, including the truncated subtractions. Mathlib's `Nat.descFactorial` is `\|0 => 1 \| k+1 => (n−k) * descFactorial n k` (`Factorial/Basic.lean:330`), i.e. truncated. My instrument implements that recursion, not a binomial surrogate. |
| L2 | The dictionary `s = n−p = 2n−K−1`, `q = m−p = m+n−K−1`, `p = K+1−n`, `d = 2m−K`, and `PStatement` is the falling-factorial form of `C(n,s) ≥ 2^s·C(q,s)`. | verified | `n − p = n − (K+1−n) = 2n−K−1 = s` and `m − p = m+n−K−1 = q`; `descFactorial(x,s) = C(x,s)·s!`, so dividing both sides by `s! > 0` gives the binomial form. Checked on 65,600 in-region hard-index rows (`m ≤ 120`): the `descFactorial` form and the binomial form agree on **every** row, 0 disagreements. |

### Award part 1 — the discriminant factorisation

| id | claim | verdict | evidence |
|---|---|---|---|
| L3 | `9d² + 12(m+1)d − 12(m+1)² = 3(3d−2(m+1))(d+2(m+1))` for all integers `m,d`. | verified | **Symbolic**, not sampled: expanded both sides in my own multivariate-polynomial engine over `ℤ` (dict of exponent-tuple → coefficient) and the difference is the zero polynomial. By hand: RHS `= 3[3d² + 6(m+1)d − 2(m+1)d − 4(m+1)²] = 9d² + 12(m+1)d − 12(m+1)²`. Cross-checked numerically on the full grid `m,d ∈ [−7,7]`. Hypothesis-free, as the claim says. |

### Award part 2 — the two-sided region characterisation

| id | claim | verdict | evidence |
|---|---|---|---|
| L4 | For `m, d ≥ 0` the second factor `d + 2(m+1) > 0`. | verified | `d ≥ 0` and `m ≥ 0` give `d + 2(m+1) ≥ 2`. Swept `0 ≤ m,d ≤ 200`: strictly positive on every cell. **This is exactly where the two nonnegativity hypotheses enter**, and nowhere else. |
| L5 | `Δ ≤ 0 ⟹ 3d ≤ 2m+2` (forward). | verified | `Δ = 3(3d−2(m+1))(d+2(m+1))`; dividing by the positive factor of L4, `3d−2(m+1) ≤ 0`. |
| L6 | `3d ≤ 2m+2 ⟹ Δ ≤ 0` (reverse). | verified | `3d−2(m+1) ≤ 0` times the nonnegative `d+2(m+1)` is `≤ 0`. |
| L7 | The conjunction: `discriminant_nonpos_iff`, i.e. part 2, **both directions**. | verified | Swept `0 ≤ m,d ≤ 200` (40,401 cells): `Δ ≤ 0` and `3d ≤ 2m+2` have identical truth value on **every** cell, 0 mismatches. Sharpness of the hypotheses confirmed adversarially: dropping `m,d ≥ 0` and sweeping `−12 ≤ m,d ≤ 12` produces **284 counterexamples** to the `iff`, every one of them at a cell where `d + 2(m+1) ≤ 0`. So L4 is load-bearing and the hypotheses are not decorative. |

### The bridge from (S) to the discriminant

| id | claim | verdict | evidence |
|---|---|---|---|
| L8 | `(S)` rearranges to `Q(n) := 3n² − 3Kn + C ≥ 0` with `C = K+1+4Km−4m²`. | verified | Symbolically: `(n+1)(K+1−n) − 4(m+n−K)(m−n) − Q(n)` is the zero polynomial in my engine. By hand, LHS `= −n² + nK + K + 1`, RHS `= 4m² − 4n² − 4Km + 4Kn`, difference `= 3n² − 3Kn + (K+1+4Km−4m²)`. |
| L9 | The discriminant of `Q` in `n` is `Δ_K = 9K² − 12C`. | verified | `b² − 4ac` with `a = 3, b = −3K, c = C` gives `9K² − 12C`. Matches `S_quadratic_nonneg_of_discriminant_nonpos`'s hypothesis literally. |
| L10 | `discriminant_in_K_matches_in_d`: `9(2m−d)² − 12((2m−d)+1+4(2m−d)m−4m²) = 9d² + 12(m+1)d − 12(m+1)²`. | verified | Symbolic zero difference; also by hand (`9K² = 36m²−36md+9d²`, `12C = 48m²−48dm+24m−12d+12`, difference `= 9d²+12md+12d−12m²−24m−12 = 9d²+12(m+1)d−12(m+1)²`). The same identity instantiated at `d := 2m−K` is `P_holds_critic`'s `heq`; I verified that instantiation as its own symbolic identity too. |

### Award part 3 — step (S) on the region

| id | claim | verdict | evidence |
|---|---|---|---|
| L11 | The sum-of-squares certificate `12·Q(n) = (6n−3K)² − Δ_K`. | verified | Symbolic zero difference. `(6n−3K)² = 36n²−36Kn+9K²`, so `(6n−3K)² − (9K²−12C) = 36n²−36Kn+12C = 12Q(n)`. |
| L12 | `Δ_K ≤ 0 ⟹ Q(n) ≥ 0` for **every** integer `n`. | verified | From L11, `12Q(n) = (6n−3K)² − Δ_K ≥ 0 − Δ_K ≥ 0`, and `12 > 0`. The argument is valid over `ℝ`, so a fortiori at every integer — this is exactly why the claim can say "every integer `n`" with no horizon and no band. |
| L13 | `S_holds_of_discriminant_nonpos`: `(S)` in multiplicative form from `Δ_K ≤ 0`. | verified | L8 + L12. |
| L14 | `S_holds_on_region` (**part 3**): on `m,d ≥ 0`, `3d ≤ 2m+2`, `(S)` holds at every integer `n`, in the `(m,d,n)` parametrisation with `K = 2m−d`. | verified | Chain L7(reverse) → L10 → L13, exactly as §4 states. Recomputed: **1,402,081** rows — every in-region `(m,K)` with `m ≤ 120` and every integer `n ∈ [−60, 2m+60]` — zero failures. The window deliberately includes `n < 0` and `n > m` to test the "every integer `n`" quantifier rather than only the hard indices. Necessity of the region confirmed: the smallest off-region failure of `(S)` is `(m,K,n) = (1,0,0)` (`d = 2`, `Δ_K = 36 > 0`, LHS `1`, RHS `4`). |

### Redundancy of `m ≤ K+1`

| id | claim | verdict | evidence |
|---|---|---|---|
| L15 | Given `K ≤ 2m` and `3(2m−K) ≤ 2m+2`, `m ≤ K+1` follows. | verified | `3(2m−K) ≤ 2m+2 ⟺ 4m ≤ 3K+2`; with `m ≥ 0`, `3m ≤ 4m ≤ 3K+2 ≤ 3K+3`, so `m ≤ K+1`. Swept every in-region `(m,K)` with `m ≤ 2000` (1,336,668 pairs): `m ≤ K+1` holds on **all** of them, 0 counterexamples. I also tested whether `K ≤ 2m` is needed for the implication and found it is **not**: no `(m,K)` with `K > 2m` satisfies the region and violates `m ≤ K+1`. See critic-pass item C3. |

### Both base cases

| id | claim | verdict | evidence |
|---|---|---|---|
| L16 | `s = 1` base, `K = 2c`, `n = c+1`: indices are `s = 2(c+1)−2c−1 = 1` and `q = m+(c+1)−2c−1 = m−c`, neither truncating (given `c+1 ≤ m`). | verified | Direct computation; `p = K+1−n = c = n−1`, `q = m−p = m−c`, as §5 says. |
| L17 | The base unfolds to `n ≥ 2(m−n+1)`, i.e. `3n ≥ 2m+2`, which **at `n = c+1` is literally the region** `3(c+1) ≥ 2m+2`. | verified | `Nat.descFactorial_one : n.descFactorial 1 = n` (Mathlib `Basic.lean:345`), so the statement is `c+1 ≥ 2(m−c)`, i.e. `3c+1 ≥ 2m`. And `d = 2m−2c`, so `3d ≤ 2m+2 ⟺ 4m ≤ 6c+2 ⟺ 2m ≤ 3c+1 ⟺ 3(c+1) ≥ 2m+2`. The two are the *same inequality*, confirming §5's "literally the chartered hypothesis". |
| L18 | `P_base_s1` holds. | verified | 6,700 rows (`m ≤ 200`, every admissible `c`): zero failures; and the region translation `in_region(m,2c) ⟺ 3(c+1) ≥ 2m+2` agreed on every row. |
| L19 | `s = 2` base, `K = 2c+1`, `n = c+2`: `s = 2`, `q = m−c`; unfolds to `(c+2)(c+1) ≥ 4(m−c)(m−c−1)`. | verified | Direct computation; `p = K+1−n = c`. |
| L20 | The region at `K = 2c+1` rearranges over `ℕ`, with `m ≥ c+2` so nothing truncates, to `4m ≤ 6c+5`. | verified | `d = 2m−2c−1`; `3d ≤ 2m+2 ⟺ 6m−6c−3 ≤ 2m+2 ⟺ 4m ≤ 6c+5`. Confirmed on every row of L21. |
| L21 | `P_base_s2` holds. | verified | Substituting `m = c+2+e` (`e ≥ 0`): region `⟺ 2c ≥ 4e+3 ⟺ c ≥ 2e+2`; goal `(c+2)(c+1) ≥ 4(e+2)(e+1)`. At `c = 2e+2`, LHS `= 4e²+14e+12 ≥ 4e²+12e+8` = RHS, and LHS increases in `c`. Swept 6,567 rows (`m ≤ 200`): zero failures. |
| L22 | Remark: the `s = 2` base is **equivalent** to the region over the integers, not merely implied by it (correcting an earlier draft comment). | verified, and **not load-bearing** | Independently reproduced: over `2 ≤ m ≤ 200` and every admissible `c`, "base holds" and "region holds" have identical truth value, 0 disagreements; at `c = 2e+1` the base fails (`4e²+10e+4 < 4e²+12e+6`). The same is true at the `s=1` base (also swept, 0 disagreements). §5 attributes this to **C-U1-F's Finding 3**; I checked that critique and Finding 3 states precisely this, with the same `c = 2e+1` / `c = 2e+2` bracketing — the attribution is **correct**. (C-U1-T's F6 makes the same correction independently; the informal proof names only one of the two, which understates rather than overstates its support.) Only the direction region ⟹ base is used by the Lean proof, as §5 says. |

### The induction step (C-U1-F's, PRIMARY, toolkit-free)

| id | claim | verdict | evidence |
|---|---|---|---|
| L23 | `2(n+1)−K−1 = s+2` and `m+(n+1)−K−1 = q+1` in `ℕ`. | verified | The first needs `2n ≥ K+1`, supplied by `hhard : K+1 < 2n`. The second needs `m+n ≥ K+1`; from `hhard` and `hnm : n+1 ≤ m`, `m+n ≥ 2n+1 ≥ K+3`. Both swept below. |
| L24 | `n ≤ K`. | verified | `n+1 ≤ m ≤ K+1`. |
| L25 | **The index identity `n − s = K+1−n`** (the point the originating return once flagged as its own bug). | verified | `n − (2n−K−1) = K+1−n`, valid in `ℕ` because `n ≤ K+1` (L24), so neither side truncates. Swept on every admissible row. |
| L26 | `q − s = m−n` and `q+1 = m+n−K`. | verified | `(m+n−K−1) − (2n−K−1) = m−n`, needing `m ≥ n`; `q+1 = m+n−K` needing `m+n ≥ K+1`. Both swept. |
| L27 | The two peels: `descFactorial (n+1) (s+2) = (n+1)·((n−s)·descFactorial n s)` and likewise at `q`. | verified | Mathlib `Nat.succ_descFactorial_succ : (n+1).descFactorial (k+1) = (n+1) * n.descFactorial k` (`Basic.lean:347`) peels the **top** factor; `Nat.descFactorial_succ : n.descFactorial (k+1) = (n−k) * n.descFactorial k` (`Basic.lean:339`) peels the **bottom**. Composing gives exactly the stated form. §6's description of which lemma peels which end is **correct as stated**. Both identities recomputed as integer equalities on every admissible row. |
| L28 | `(S)` transports from `ℤ` to `ℕ` as `4((q+1)(q−s)) ≤ (n+1)(n−s)`, via `Nat.cast_sub` at `n ≤ K+1`, `K ≤ m+n`, `n ≤ m`. | verified | All three side conditions hold on every admissible row (swept, 0 violations); after rewriting by L25/L26 the `ℕ` inequality is literally `4(m+n−K)(m−n) ≤ (n+1)(K+1−n)`, which is `(S)` at `(K,m,n)` — supplied by L13 from the step's own discriminant hypothesis. |
| L29 | The calc chain closes by `Nat.mul_le_mul` with **no** nonnegativity side conditions. | verified | Line 1 `2^(s+2)·((q+1)·((q−s)·D_q)) = (4(q+1)(q−s))·(2^s·D_q)` and line 3 `((n+1)(n−s))·D_n = (n+1)·((n−s)·D_n)` are `ℕ`-semiring identities — recomputed as integer equalities on every row. Line 2 is monotonicity of `ℕ`-multiplication applied to L28 and the induction hypothesis. I tested the **inference** rather than the coincidence: on every row where `hS` and `hstep` hold, the product inequality and hence `PStatement m K (n+1)` follow; and `hS` was never false on an admissible row. This is precisely what makes the step toolkit-free — everything is in `ℕ`, so no sign hypotheses arise. |
| L30 | `P_induction_step_critic`: `(P)` at a hard index `n` implies `(P)` at `n+1`, given `(S)`. | verified | L23–L29. Swept 7,220 rows in round 1 and 11,638 rows in round 2 over the lemma's own hypothesis set (`Δ_K ≤ 0`, `m ≤ K+1`, `n+1 ≤ m`, `K+1 < 2n`): the conclusion holds on every one, every `ℕ`-subtraction identity holds on every one, and both peels hold on every one. |

### The induction principle (C-U1-T's scaffold) and part 4

| id | claim | verdict | evidence |
|---|---|---|---|
| L31 | `hΔ` is derivable from the region hypotheses. | verified | `discriminant_nonpos_iff` at `d := 2m−K` (reverse direction, L6) plus the ring identity of L10 instantiated at `d := 2m−K`, which I verified symbolically as its own identity. |
| L32 | `(K+3)/2` (`ℕ`-division) **is** the least hard index. | verified | Hard means `2n ≥ K+2`, i.e. `n ≥ ⌈(K+2)/2⌉`, and `⌊(K+3)/2⌋ = ⌈(K+2)/2⌉` for every `K`: at `K = 2c` both are `c+1`; at `K = 2c+1` both are `c+2`. So the induction starts at the first index the claim speaks about, and no hard index is skipped below the base. |
| L33 | The base of `Nat.le_induction` splits on parity and discharges by `P_base_s1`/`P_base_s2`, with all their side hypotheses available. | verified | `Nat.even_or_odd K` gives `K = c+c` or `K = 2c+1`; `(c+c+3)/2 = c+1` and `(2c+1+3)/2 = c+2`. The bases' hypotheses come from `hm0` (`(K+3)/2 ≤ m`), `hKm` (`m ≤ K+1`, giving `m ≤ 2c+1` resp. `m ≤ 2c+2`) and the region translations of L17/L20. Both parities land on the smallest hard index of their parity (`s = 1` resp. `s = 2`), which is why exactly two bases are needed and no third. |
| L34 | The `succ` case invokes L30 at `j → j+1` with `hhard : K+1 < 2j` available. | verified | From `(K+3)/2 ≤ j`: at `K = 2c`, `j ≥ c+1 ⟹ 2j ≥ K+2`; at `K = 2c+1`, `j ≥ c+2 ⟹ 2j ≥ K+3`. Both `> K+1`. The lemma's `hnm` is the *new* index bound `j+1 ≤ m`, correctly supplied by the `succ` goal's own hypothesis. |
| L35 | Coverage: every hard index `n ≤ m` is reached. | verified | Any hard `n` satisfies `n ≥ (K+3)/2` by the L32 computation run backwards, and `n ≤ m` by hypothesis, so `key n` applies. No hard index falls outside `[(K+3)/2, m]`. |
| L36 | `P_holds_critic`: `(P)` at every hard index given `m ≤ K+1` and the region. | verified | L31–L35. |
| L37 | `P_holds_critic_general` (**part 4**): the same with `m ≤ K+1` dropped. | verified | L36 + L15. |

### Terminal

| id | claim | verdict | evidence |
|---|---|---|---|
| L38 | The terminal conjunction is `⟨discriminant_factorization, discriminant_nonpos_iff, S_holds_on_region, P_holds_critic_general⟩`, and its four conjuncts are the four parts of the intended claim in the seat's own arrangement. | verified | Each component's type is read off `Main.lean` and matches the corresponding conjunct of `expected_statement` one-for-one; `conclusion.statement == expected_statement` and its declared SHA-256 both recomputed and matched. §8's remark that the controller display's missing parentheses around `2 * m − d` are immaterial is **correct**: `2*m − d + 1 − n` parses left-associatively as `((2*m − d) + 1) − n`, which is the seat's `((2*m − d) + 1 − n)`. |
| L39 | The `descProd` toolkit is **not** a dependency of the terminal theorem. | verified | The registrar markers in `Main.lean` enumerate exactly 13 declarations; none of `descProd`, `descProd_shift`, `descProd_bot`, `descFactorial_cast_eq_descProd`, `descProd_nonneg` is among them. Blanking every `/- … -/` block and re-scanning the remaining Lean code gives **0** occurrences of `descProd` (and 0 of `sorry`, `admit`, `native_decide`, `axiom `). The primary induction step is genuinely toolkit-free, as the award's mandatory fence requires. |
| L40 | Attribution as the synthesis requires. | verified | §9 assigns the definitions, the three discriminant lemmas, the two `(S)` lemmas plus `S_holds_on_region`, and both bases to **seat U1**; the induction step to **C-U1-F** (PRIMARY, toolkit-free) and the induction-principle scaffold plus the dropped hypothesis to **C-U1-T**. That matches AWARD GROUP A's DAG table and its "(v) the induction step and the induction principle are CRITIC-ATTRIBUTED" line, and matches the adjudication's rank-1 entry. The attribution does travel on the award's face: it is in the docstrings of entries 10, 11, 12 and in the terminal theorem's own docstring (entry 13). |

**Ledger totals: 40 rows, 40 verified, 0 false, 0 unsupported gaps, 0 citation
mismatches, 0 needing author decision, 0 blocked.** Three non-defect
observations are recorded under the critic pass.

## Reproduced Mathematical Evidence

All evidence below was produced by instruments I wrote from scratch in this
session, Python standard library only, exact integers throughout, **no float
anywhere**, and **no import of the producer's generator or any prior evaluator**.
Both scripts ran in the foreground and completed in about two seconds each.

- `scratchpad/c5-s7-informal-LA1/audit_instrument.py` → `instrument-output.json`
- `scratchpad/c5-s7-informal-LA1/audit_instrument2.py` → `instrument2-output.json`
- `scratchpad/c5-s7-informal-LA1/crosscheck-critic-claims.txt`
- `scratchpad/c5-s7-informal-LA1/crosscheck-descfactorial-vs-binomial.txt`
- `scratchpad/c5-s7-informal-LA1/crosscheck-fence-comment-nesting.txt`

Both scripts report `ALL_CHECKS_PASSED: true` with an empty failure list.

**(a) The ring identities — symbolic, not sampled.** I implemented a small
multivariate-polynomial engine over `ℤ` (exponent-tuple → coefficient) and
verified that the difference is the **zero polynomial** for all five identities:
the factorisation (L3), `discriminant_in_K_matches_in_d` (L10), the `(S)`
rearrangement (L8), the sum-of-squares certificate (L11), and `P_holds_critic`'s
`heq` instantiation. Each was then cross-checked numerically on the full
`[−7,7]⁴` grid in `(m,d,n,K)` — 83,521 points — to guard against a bug in my own
engine. Zero discrepancies.

**(b) The two-sided characterisation.** Swept `0 ≤ m,d ≤ 200`: `Δ ≤ 0` and
`3d ≤ 2m+2` agree on all 40,401 cells, **both directions**. Adversarial control:
with the hypotheses dropped and `−12 ≤ m,d ≤ 12` swept, **284** cells violate the
`iff`, all of them where `d + 2(m+1) ≤ 0` — locating the positivity of the second
factor as the exact load-bearing fact, as §3 claims.

**(c) Step (S).** On the region: 1,402,081 rows (`m ≤ 120`, every in-region `K`,
every integer `n ∈ [−60, 2m+60]`), zero failures — confirming the "every integer
`n`, uniformly, no horizon" quantifier and not merely the hard indices.
Off the region: the smallest failure is `(m,K,n) = (1,0,0)`, `d = 2`, LHS `1`,
RHS `4`, `Δ_K = 36 > 0`.

**(d) (P) at every hard index on the region.** Using the literal
`Nat.descFactorial` recursion with `ℕ`-truncated subtraction (not `math.comb`):

- Brief's mandated horizon, `m ≤ 60`: 1,301 in-region `(m,K)` pairs, **8,400**
  hard-index rows (4,410 at even `K`, 3,990 at odd `K`), **zero failures**.
- Extended horizon, `m ≤ 200`: **300,763** hard-index rows, zero failures.
- Non-vacuity guard: 6,700 even-`K` and 6,567 odd-`K` in-region pairs actually
  possess hard indices, so **both parities** are genuinely exercised and the
  claim is not vacuously true for either.

**(e) (P) OUTSIDE the region — the sharpness the record asserts.** Two results,
and the second is the stronger one:

1. *Smallest failure.* `(m, K, n) = (1, 0, 1)`, i.e. `d = 2`, `3d = 6 > 2m+2 = 4`,
   `s = 1`, `q = 1`: LHS `descFactorial(1,1) = 1`, RHS `2¹·descFactorial(1,1) = 2`,
   so `1 ≥ 2` is **false**. The hard-index and `K ≤ 2m` hypotheses both hold there,
   so the region hypothesis — and not some other hypothesis — is what excludes it.
   Over `m ≤ 80`, **152,834 of 154,197** off-region hard-index rows fail.
2. *The region is exactly the boundary.* For every `m ≤ 120` and every `K ≤ 2m`
   admitting at least one hard index, the predicate "(P) holds at **every** hard
   index" has the **identical truth value** to `3(2m−K) ≤ 2m+2` — **0 mismatches**
   in either direction. And at each of the 119 boundary pairs (`K` one below the
   least in-region `K`) there is at least one failing hard index. So the chartered
   region is not merely sufficient for (P): it is precisely the set where (P) holds
   at every hard index.

   *This is audit evidence about the necessity of a hypothesis, not a claim the
   award makes.* AWARD GROUP A's excluded conclusion (iv) forbids a sharpness
   claim, and the contract's fences repeat "no sharpness claim". The theorem
   asserts only the `⟸` direction, and correctly so. I record the finding to
   establish that the region hypothesis is load-bearing rather than decorative,
   and I flag explicitly that it must **not** be read onto the award's face.
   It is also a statement about `(P)`, a different object from the `N_j`
   coefficientwise nonnegativity to which C-U1-T's F8 ("sufficient, not
   necessary") applies; the two must not be conflated.

**(f) The induction step as an integer statement.** Over the step lemma's own
hypothesis set: 7,220 rows (round 1) and 11,638 rows (round 2, wider `K` range).
Verified on every row: the two index rewrites (L23), `n ≤ K`, the three
`ℕ`-subtraction identities `n−s = K+1−n`, `q−s = m−n`, `q+1 = m+n−K` (L25, L26),
the three `Nat.cast_sub` side conditions (L28), both `descFactorial` peels (L27),
the `ℕ` form of `(S)`, both semiring identities of the calc chain, the
monotonicity inference tested as a conditional, and the conclusion. Zero failures
of any kind.

**(g) `ℕ`-subtraction audit.** Independently of the step, I confirmed that at
every in-region hard index with `m ≤ 119`, **every** truncated subtraction in
sight is a true subtraction: `2n ≥ K+1`, `m+n ≥ K+1`, `n ≥ s`, and `m ≤ K+1` —
0 violations in the sweep. This reproduces C-U1-T's F9 independently.

**(h) Cross-checks of figures I could test inside the boundary.**

- C-U1-T's F1: the smallest in-region pair with more than one hard index is
  `(m,K) = (5,6)`, `d = 4`, hard set `{4,5}`; no `m ≤ 4` has two. At `n = 4`
  (`p=3, s=1, q=2`) LHS `= 4`, RHS `= 4`; at `n = 5` (`p=2, s=3, q=3`) LHS `= 60`,
  RHS `= 48`, i.e. `C(5,3) = 10 ≥ 2³C(3,3) = 8`. Reproduced exactly.
- C-U1-F's Finding 3 bracketing (`c = 2e+1` fails, `c = 2e+2` holds). Reproduced.
- The producer's generator declares four population counts at `m ≤ 40`; I
  recomputed all four from scratch without running or reading its logic as an
  oracle: 2,548 `PStatement`/`(S)` cases, 1,681 identity cases, 601 in-region
  cells, 2,050 region-`iff` cells. **All four match exactly.** I further confirmed
  that the generator's binomial form (`math.comb`) is equivalent to the Lean
  `descFactorial` form on the checked population (65,600 rows, 0 disagreements)
  and that its Python-integer indices never go negative there — so its check,
  though written in a different form from the theorem, is a faithful test of it.

## Independent Critic Pass

I ran a separate adversarial pass over my own ledger before closing, hunting for
the ways a "faithful transcription" document can pass a naive read and still be
defective. Nine attacks; none produced a defect; three produced observations
worth registering.

**A1 — Does the informal proof actually *prove*, or does it defer to "Lean says
so"?** Checked every section. Each step is given with its mathematical mechanism
(the ring identity, the sign split against a positive factor, the SOS
certificate, the two base unfoldings with their index dictionaries, the
peel-and-multiply step with the exact Mathlib lemmas named, the `Nat.le_induction`
scaffold with its parity split). No step substitutes kernel assent for a reason.
**No defect.** The two thinnest presentational spots are §2's "a short integer
argument (`omega`-checked at the point of use)" and §5's "plus `omega`" /
"closing with `nlinarith`": in both the document states the governing
inequalities and the conclusion but leaves a one-line elementary inference to the
tactic. I supplied both inferences myself (L15 and L18/L21) and verified them
exhaustively. At statement-level granularity for a transcription document whose
object is already kernel-checked, this is acceptable; recorded so the controller
can see exactly where I did the arithmetic the prose compresses.

**A2 — Is the claim vacuous, or vacuous for one parity?** No. 6,700 even-`K` and
6,567 odd-`K` in-region pairs carry hard indices; 300,763 hard-index rows are
exercised at `m ≤ 200`. Both parities are substantively covered, and the two
bases correspond to exactly the two parities. **No defect.**

**A3 — Is `m ≤ K+1` *really* redundant, or is the drop a silent weakening?** It
is genuinely redundant, and the drop **strengthens** the theorem. Proof at L15;
swept to `m ≤ 2000` with 0 counterexamples. **Observation O1:** §2 derives it as
"`4m ≤ 3K+2`; combined with `K ≤ 2m` this forces `K ≥ (4m−2)/3`, and a short
integer argument shows `m ≤ K+1`". The combination with `K ≤ 2m` is not needed —
`3m ≤ 4m ≤ 3K+2 ≤ 3K+3` does it from the region and `m ≥ 0` alone, and I verified
computationally that no `(m,K)` with `K > 2m` satisfies the region and violates
`m ≤ K+1`. This is an over-attribution of which hypothesis does the work, not an
error: the conclusion is true, and `omega` has both hypotheses in scope at the
call site. Non-defect.

**A4 — Do the `ℕ`-truncated subtractions hide a false statement behind a
truncation?** This is the classic failure mode for a `Nat.descFactorial`
statement, so I checked it two ways. First, my instrument implements truncated
subtraction and Mathlib's `descFactorial` recursion literally, so any truncation
would show up as a computed value, not as an assumption. Second, I verified
directly that on the whole claimed population no truncation occurs at all (item
(g)). Third, I checked the step's rewrites `hs`, `hq`, `hns`, `hqs`, `hq1`
individually on every admissible row rather than trusting `omega`. **No defect.**
I also note in the theorem's favour that part 4's region and `K ≤ 2m` hypotheses
are stated over `ℤ` through casts; had the region been written with `ℕ`
subtraction it would truncate to a triviality when `K > 2m`. The contract gets
this right.

**A5 — Does the proof prove `(S)` only where it is needed, while the claim says
"every integer `n`"?** No: the SOS argument is valid over `ℝ`, hence at every
integer, and I swept `n` well outside `[0,m]` in both directions to confirm.
**No defect.**

**A6 — Is the induction principle complete — could a hard index be skipped below
the base or between steps?** No. L32 shows `(K+3)/2` is exactly the least hard
index for both parities, L34 shows every `succ` step lands on a hard index, and
L35 shows every hard index `n ≤ m` lies in the induction's range. There is no
gap, and no index is covered twice with conflicting hypotheses. **No defect.**

**A7 — Does anything in the document assert a *stronger* result than what is
proved?** The one place it would be easy to over-claim is sharpness, since the
region genuinely is sharp for (P) (item (e)). The document does **not** claim it:
§10 restates "no sharpness claim" verbatim, §5's equivalence remark is confined
to the `s = 2` base and explicitly flagged as not used by the proof, and the
terminal theorem contains only the `⟸` direction. **No defect** — and, on the
contrary, a correct restraint.

**A8 — Are the fence counts in §10 accurate?** **Observation O2, the one literal
in the document that does not survive verification as written.** §10 says `grep`
"finds exactly one textual match of each (`SimpleGraph`, `Δ_k`, `indepCount`),
and `descProd` exactly two". Counting **lines** (`grep -c`, grep's default unit)
the numbers are 1, 1, 1, 2 — exactly as written, and this is the instrument
`FORMALIZER-REPORT.md` explicitly names. Counting **occurrences** (`grep -o`) they
are 1, 1, 1, **3**: `descProd` appears once on line 175 and twice on line 229. So
the phrase "textual match" is ambiguous between the two units and reads as an
undercount under the occurrence reading. This is a **non-mathematical
precision note about a hygiene count, not a defect in the proof**: I verified the
fence's substance directly and it is stronger than claimed — after blanking every
`/- … -/` block, **zero** occurrences of any of the four terms remain in Lean
code, and no toolkit declaration exists anywhere in the project (L39). I record
it rather than pass over it, and I do not treat it as grounds for a failed
verdict, because nothing mathematical, no hypothesis, no conclusion and no
attribution turns on it.

**A9 — Is the attribution correct, including the critique each correction is
credited to?** I challenged this specifically because §5 credits the `s = 2`
equivalence to C-U1-F's Finding 3 while the same correction is prominent in
C-U1-T's F6, which looked like a possible mis-citation. Reading C-U1-F's Finding
3 settles it: that finding states exactly this correction, with the same
`c = 2e+1` / `c = 2e+2` bracketing and the same "equivalent, exactly as at the
`s = 1` base" conclusion. The citation is **correct**. **Observation O3:** both
critics made the correction independently and §5 names only C-U1-F; that
understates the document's own support and is harmless. Step attribution
(C-U1-F PRIMARY), scaffold attribution (C-U1-T), and seat U1's eight nodes all
match AWARD GROUP A's DAG table and the adjudication. **No defect.**

**Prover/critic reconciliation.** My prover pass and this critic pass agree on
all 40 ledger rows with independently reproduced evidence, so every row closes
under the skill's rule 11. The three observations O1–O3 are prose-precision
matters with no mathematical consequence; none is escalated as a defect, and none
is softened from something worse.

## Scope and Fence Check

Checked against AWARD GROUP A's five excluded conclusions and the contract's
`SCOPE (mandatory fences)` sentence, term by term.

- **SCALAR core; does not raise `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`.**
  Confirmed. The claim's object is a scalar inequality between two
  `Nat.descFactorial` values; nothing in any of the 13 declarations mentions
  `N_j`, a polynomial in `t`, or coefficientwise nonnegativity. The registered
  positivity lemma's object is the coefficientwise-in-`t` nonnegativity of `N_j`,
  which is nowhere asserted, implied, or used. **Not raised.**
- **Not the large-rank theorem; not the Tier 3a schema.** Confirmed. No rank
  quantifier, no threshold function, no schema instantiation appears. `SOLUTION-CONTRACT.md`'s
  Tier 1/2/3 statements are all statements about forests, G1 tuples and first
  descents; this claim exhibits no graph at all, so it specializes to none of them.
- **No statement about any graph, forest, G1 tuple, tier, FOREST, TREE, TRANSFER
  or Erdős #993.** Confirmed. The entire project's mathematical vocabulary is
  `ℤ`, `ℕ`, `Nat.descFactorial`, and arithmetic. No `SEMANTIC-CONTRACT.md` object
  (`indepCount`, `coeff`, `delta`, `firstDescent`, `residual`, `ambientA`,
  `ambientH`, `ordinaryG1Guards`) is defined, imported by name, or applied.
- **No `SimpleGraph`, `Δ_k`, `indepCount` occurs.** Confirmed, and checked at
  code level rather than by string count: each term appears exactly once in the
  file, all three on line 299, all three inside the terminal theorem's
  `/-- … -/` docstring stating this very fence in prose. With all block comments
  blanked, **0** occurrences of any of the three remain. There is no
  `SimpleGraph`-typed variable, no `Δ_k` or `indepCount` application, and no
  import of a graph-theoretic Mathlib namespace beyond the blanket `import Mathlib`.
- **No sharpness claim.** Confirmed. The terminal theorem asserts no converse.
  My own finding that the region *is* sharp for (P) (evidence item (e)) is
  recorded in this audit as evidence of hypothesis necessity and is explicitly
  **not** attributed to the award; the fence stands.
- **No claim that a certificate exists for any particular graph.** Confirmed.
  No existential over graphs or certificates occurs anywhere in the claim.
- **`m` and `d` are numerals.** Confirmed: `m`, `d`, `K`, `n` are universally
  quantified variables of `ℤ`/`ℕ` in every conjunct, never fixed constants, and
  no conjunct carries a computation horizon. Parts 1–3 are uniform in `(m,d)`
  and part 4 in `(m,K)` and in the index — matching "uniform in (m, d) on the
  region and in the index, no horizon".
- **`descProd` toolkit not a dependency.** Confirmed at L39: 13 declarations,
  none of the five toolkit names, zero code-level occurrences. The PRIMARY step
  is toolkit-free as the award's mandatory fence requires, and the fallback is
  correctly not registered.
- **Attribution travels on the award's face.** Confirmed at L40.
- **Hypotheses match the Lean declaration one-for-one.** Confirmed conjunct by
  conjunct: part 1 hypothesis-free; part 2 `0 ≤ m`, `0 ≤ d`; part 3 `0 ≤ m`,
  `0 ≤ d`, `3d ≤ 2m+2`, `n` unrestricted; part 4 `(K:ℤ) ≤ 2m`,
  `3(2m−K) ≤ 2m+2` (over `ℤ`), `K+1 < 2n`, `n ≤ m`. `conclusion.statement` is
  byte-identical to `lean_binding.expected_statement`, whose SHA-256 I recomputed
  and matched, and both reproduce `Main.lean` entry 13's type exactly. The only
  difference from the synthesis's hypothesis list is the **dropped redundant**
  `m ≤ K+1`, which strengthens the claim and is justified at L15.
- **Hygiene observed by this seat.** No `sorry`, `admit`, `native_decide` or
  `axiom` declaration exists in the audited source (checked at code level after
  blanking comments). No file outside `scratchpad/c5-s7-informal-LA1/` was
  written. No `/tmp`, `mktemp` or `TMPDIR` path was used for anything. No
  `lake clean`, `lake update` or `elan` was run; no Lean build was invoked at
  all; nothing was detached to the background and no process was matched by a
  pattern contained in my own command line.

## Verdict

**passed**

`INFORMAL-PROOF.md` is a correct and sufficient proof of the contract's
`theorem.informal_statement` at statement-level granularity. All four conjuncts —
the discriminant factorisation, the two-sided region characterisation in **both**
directions, step (S) at every integer `n` on the region, and (P) at every hard
index for **both** parities of `K` — are established, and the terminal
conjunction assembles exactly those four. Every definition, identity, base case,
`ℕ`-subtraction, index rewrite, cast side condition, inference step, and the
induction principle's coverage were recomputed with my own exact-integer
instrument and none failed: 40 of 40 ledger rows verified with independently
reproduced evidence, 0 false, 0 unsupported gaps, 0 citation mismatches, 0
disputed, 0 blocked. The claim asserts nothing fenced: it is the SCALAR core, it
does not raise `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`, it makes no
sharpness claim, it exhibits no graph-theoretic object, its `descProd` fence
holds at code level, and its attribution is correct and on the award's face.

Three observations are registered and none is a defect: **O1**, §2 attributes the
redundancy of `m ≤ K+1` partly to `K ≤ 2m`, which is not needed (the conclusion
is true and proved); **O2**, §10's "`descProd` exactly two" is a `grep -c` line
count where the occurrence count is three, a non-mathematical hygiene-count
ambiguity whose underlying fence I verified to be stronger than claimed; **O3**,
§5 credits the `s = 2` equivalence to C-U1-F's Finding 3, which is correct, and
merely omits that C-U1-T's F6 makes the same correction independently. None of
the three touches a hypothesis, a conclusion, an attribution, or a fence, and no
defect was softened to reach this verdict.

I record separately, as evidence and **not** as an award claim, that the
chartered region is exactly sharp for (P): over `m ≤ 120`, "(P) at every hard
index" and `3(2m−K) ≤ 2m+2` have identical truth value with zero mismatches, the
smallest off-region failure being `(m,K,n) = (1,0,1)` where `1 ≥ 2` is false.
This establishes that the region hypothesis is load-bearing. The award correctly
declines to state it, per excluded conclusion (iv).

**`attestation_id`: `c5-la1-informal-pass-20260922`.** Producer
`c5-la1-formalizer-sonnet-20260922`; independent reviewer
`c5-la1-fable-informal-20260922`, kind
`independent-mathematical-proof-integrity-reviewer`. This audit attests the
**mathematics of the informal proof** only. It is not a kernel verification, not
a statement-fidelity attestation, and not a `close`; the byte-for-byte
transcription question against the originating seat and critic sources remains
the separate fidelity gate's, whose input this seat did not read or write.
