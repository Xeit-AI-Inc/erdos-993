---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c2-la2-formalizer-opus-20260928
critic_id: c2-la2-opus-informal-20260928
attestation_id: c2-la2-informal-pass-20260928
claim_sha256: 97a1be1bbddc7715a26fdbd775c3f5bb080b83317d006a92880eac7953c1c4b4
---

# Informal Proof Integrity Audit

Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`; award C2-LA2; Lean run
`lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent`. Reviewer `c2-la2-opus-informal-20260928`
(kind `independent-mathematical-proof-integrity-reviewer`). I am not the artifact producer and I edited no contract, Lean source,
informal proof or receipt.

**Model disclosure (two-part).** Chartered: Claude Opus 5.5, effort high, on dispatch-record authority. Runtime-reported model id,
verbatim: `claude-opus-5-5`. No child agents.

**VerityOS boot.** I am operating within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, as the brief §0 authorizes. I loaded the constitution, the startup protocol and that one
skill. I did not load memory, logs, decisions, operations or conversations, and I wrote no conversation log: the brief restricts
my writes to `scratchpad/c2-s7-informal-LA2/`, and the controller owns logging. The harness put the project `CLAUDE.md`, the
user auto-memory index and the user's e-mail address into my context. I did not act on any of them beyond the boot.

**Gate checks (all recomputed by me).**

| Object | Result |
|---|---|
| Brief `control/C2-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md` | `fbe2f783…84972e7` MATCH (checked before reading) |
| Capsule seal (compact key-sorted JSON minus `seal_sha256`) | `34db3011…9a62e` MATCH; all 1009 members MATCH on SHA-256 and bytes, 0 missing |
| `THEOREM-CONTRACT.yaml` | `26f71a55…40126b` MATCH |
| `INFORMAL-PROOF.md` | `d3e61258…bdec61` MATCH |
| `Main.lean` | `e75c66b2…faae` MATCH; bound by the run's kernel receipt (`source_sha256_before` = `_after`; verdict `verified`; theorem `E993Transport.cb8_leafDeletion_closedForms_descent_topRank`) |
| `claim_sha256` = SHA-256 of `" ".join(informal_statement.split())` | `97a1be1b…c1c4b4` MATCH |
| Frozen `SOURCE-DIGESTS.json` for `sources/`, `sources/c1-results/`, `sources/c2-stage7-sources/` | 1384, 462 and 687 digest rows checked; 0 mismatches or missing files |
| C1-LA3 origin `Main.lean` | `c0605e12…3011` = origin kernel receipt `source_sha256_before` = `_after`; verdict `verified` |

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`. For every `m : ℕ` with `107 ≤ m` and `m % 3 = 2`, set
`p* = (16m+4)/3` (ℕ floor division), `G = (1+2X)^8 + X(1+X)^8` and `G_c = (1+2X)^7(1+X) + X(1+X)^7` over `ℤ[X]`. Then:

- (arm leaf) `[X^{p*+1}] P_v < [X^{p*}] P_v`, where `P_v = (1+X)G^m + X(1+2X)^{8m}`;
- (private leaf) `[X^{p*+1}] P_c < [X^{p*}] P_c`, where `P_c = (1+2X)G_c G^{m−1} + X(1+X)^2(1+2X)^{8m−1}`.

It is a statement about closed-form polynomials only. The terminal is
`E993Transport.cb8_leafDeletion_closedForms_descent_topRank`. Its binders are `(m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2)`, one for
one with the claim's quantifier and two hypotheses.

The source text from `theorem` up to but excluding ` :=` is byte-equal to the contract's `lean_binding.expected_statement`
(`d6407ad2…56d5`, recomputed). It is also byte-equal to the synthesis `### C2-LA2` frozen block once two changes are applied: the
2-space Markdown indentation is removed, and `E993Transport.` is dropped from the name inside `namespace E993Transport`. Those are
the only two changes the formalizer recorded (`check-statement-output.txt`).

Once whitespace is collapsed, the contract's `conclusion.statement` is equal to the source conclusion. The polynomials are the
closed forms of record (SEMANTIC-CONTRACT §1 at `d = 8`), and the index is the forward difference of record,
`Δ_p = i_{p+1} − i_p` at `p = p*` (synthesis R-1).

## Claim Ledger

Notation: `(G)` = carried C1-LA3 entry 17 `twoBinom_coeff_strictAnti_of_gap`: for `a b t : ℕ` with `1 ≤ t`, `t ≤ a+b` and
`3a+4b+2 ≤ 6t`, `[X^{t+1}]((1+X)^a(1+2X)^b) < [X^t](…)`. `slack := 6t − (3a+4b+2)`. "Lean" names the declaration I read against
the informal node.

| ID | Claim (informal node) | Hypotheses and where they enter | ℕ-subtraction / cast audit | Evidence | Verdict |
|---|---|---|---|---|---|
| A1 | `m % 3 = 2` ⇒ `3 ∣ 16m+4`, so `3p* = 16m+4` and `6p* = 32m+8` | `hmod` | ℕ floor division is exact on the class | E1: every class `m` from 2 to 30000 | verified |
| A2 | `m ≥ 2`, `m − 1 = n ≥ 1`, `8m − 1 = 8n + 7` | `hmod` (forces `m ≠ 0, 1`) | both subtractions are true values; Lean rewrites with `omega` after `m = n+1` | E1; Lean entry 27, lines 1–2 of the proof | verified |
| A3 | `p* − m = (13m+4)/3 ≥ 10`, so for `j ≤ m`: `p* − j ≥ 1` and `p* + 1 − j = (p* − j) + 1`; the same for `k + 1 ≤ m` and `p* − 1` | A1, A2 | every rewrite `S + 1 − j = S − j + 1` is exact because `j ≤ m < p*` | E1 (`p* − m ≥ 10` on the whole grid) | verified |
| A4 | `j ≤ m` and `k ≤ n` inside the sums | membership in `Finset.range` | `m − j` and `n − k` are true values | Lean (`Nat.lt_succ_iff`, `Finset.mem_range`) | verified |
| A5 | `coeff (X^j·Q) d = if j ≤ d then coeff Q (d−j) else 0`; `coeff (X·Q)(q+1) = coeff Q q` | `j ≤ d` from A3 in every use | the `if` branch is discharged by `omega` with `j ≤ m < p*` | Mathlib `coeff_X_pow_mul'` and `coeff_X_mul` (`Algebra/Polynomial/Coeff.lean` lines 248 and 257, read) | verified |
| A6 | The weights are `C((choose : ℕ) : ℤ)`; arm weights `> 0`, private weights `≥ 0`; `C` of a natural cast is the natural cast | `j ≤ m` for `Nat.choose_pos` | ℕ→ℤ casts only, with no ℤ subtraction in any statement | Mathlib `C_eq_natCast` (`Basic.lean` line 468), `coeff_C_mul` (`Coeff.lean` line 154) | verified |
| A7 | Side goals are linear ℕ arithmetic over the variables `m, n, j, k, q` | none | no enumeration; `grep -w decide` finds nothing | `check-carry-output.txt` (no `sorry`, `admit`, `native_decide`, `axiom` or `decide`) | verified |
| N-A1 | `(1+X)G^m = Σ_{j≤m} C(m,j)·X^j(1+X)^{8j+1}(1+2X)^{8(m−j)}` | none (every `m`) | `m − j` is exact under A4 | E3: polynomial identity for `m = 0..14`. `add_pow` gives `x^j y^{n−j} C(n,j)` with `x = X(1+X)^8` after `add_comm` (`Data/Nat/Choose/Sum.lean` line 76, read) | verified |
| N-A2 | For `j ≤ m`, `V_j = (1+X)^{8j+1}(1+2X)^{8(m−j)}` descends from `p* − j` to `p* − j + 1`: (G) with `a = 8j+1`, `b = 8(m−j)`, `t = p* − j`, slack `2j + 3`, `t ≤ a + b = 8m + 1` | `hmod` (A1); `j ≤ m` | `8(m−j)` and `p* − j` are exact | E4: every `j ≤ m`, class `m ≤ 152`, with hypotheses, slack and descent recomputed. Recomputed: `3a+4b+2 = 32m − 8j + 5` and `6t = 32m + 8 − 6j` | verified |
| N-A3 | `R = X(1+2X)^{8m}` descends from `p*` to `p* + 1`: (G) with `a = 0`, `b = 8m`, `t = p* − 1`, slack exactly 0 | `hmod` (A1 is load-bearing here) | `p* − 1 ≥ 1`, exact | E4 (slack `= 0` for every class row). Sharpness: at `t = p* − 2` the hypothesis fails (slack −6) and the descent itself fails, on every class row `m ≤ 152` | verified |
| N-A4 | Arm leaf `Δ_{p*}(P_v) = Σ_j C(m,j)·Δ(V_j at p*−j) + Δ(R at p*−1) < 0`. Every summand is negative over the non-empty range `0..m`, and the remainder is negative | N-A1..N-A3; `C(m,j) > 0` | shift by `X^j` with `j ≤ m < p*` (A5) | E5: the decomposition equals the direct `Δ` exactly for class `m ≤ 152`. Direct `Δ_v < 0` for class `m ≤ 200` and at `m = 305, 500, 1001` | verified |
| N-P1 | `(1+2X)G_c = (1+X)(1+2X)^8 + X(1+X)^7(1+2X)`; `(1+2X)G_c G^n = Σ_{k≤n} C(n,k)(E0_k + E1_k)`, with `E0_k = X^k(1+X)^{8k+1}(1+2X)^{8(n−k)+8}` and `E1_k = X^{k+1}(1+X)^{8k+7}(1+2X)^{8(n−k)+1}` | none (every `n`) | `n − k` is exact under A4 | E3: the factor identity, and the expansion for `n = 0..14` | verified |
| N-P2 | `E0_0 + tail = (1+X)(1+2X)^{8n+8} + X(1+X)^2(1+2X)^{8n+7} = (1+X)^3(1+2X)^{8n+7} + X(1+X)(1+2X)^{8n+7}`, since `1+3X+X² = (1+X)² + X` | none | none | E3: `n = 0..20`, plus the quadratic identity. By hand: `(1+2X) + X(1+X) = 1+3X+X²` | verified |
| N-P3 | For `k ≤ n`, `E0`-block `(1+X)^{8k+1}(1+2X)^{8(m−k)}` descends at `p* − k`: slack `2k+3`. It is used only for `k ≥ 1`; `k = 0` is absorbed by N-P2 | `hmod`; `k ≤ n` | `8(n−k)+8 = 8(m−k)` exact | E4, with `b = 8(m−k)` checked | verified |
| N-P4 | For `k ≤ n`, `E1`-block `(1+X)^{8k+7}(1+2X)^{8(n−k)+1}` descends at `t = p* − k − 1`: `a + b = 8m`, slack `2k+7` | `hmod`; `k ≤ n` | `p* − (k+1)` exact because `k + 1 ≤ m < p*` | E4. Recomputed: `3a+4b+2 = 32m − 8k − 5` and `6t = 32m + 2 − 6k` | verified |
| N-P5 | Block `A = (1+X)^3(1+2X)^{8m−1}` at `t = p*` (`6t − (3a+4b) = 3`, slack 1, `t ≤ 8m + 2`) and block `B = X(1+X)(1+2X)^{8m−1}` shifted to `t = p* − 1` (`6t − (3a+4b) = 3`, slack 1, `t ≤ 8m`). Both descend strictly, so their sum does | `hmod` | `q = p* − 1` exact (`p* ≥ 2`) | E4 (both blocks and both slacks). The un-regrouped tail `X(1+X)^2(1+2X)^{8m−1}` is not covered by (G) at `p* − 1` (slack < 0 on every row), which shows why the regrouping is needed | verified |
| N-P6 | `P_c = Σ_{i<n} C(n,i+1)E0_{i+1} + Σ_{k≤n} C(n,k)E1_k + (E0_0 + tail)` (`sum_range_succ'`). The first two `Δ`s are `≤ 0` (weights `≥ 0` times strictly negative block differences), and the regrouped pair is `< 0`, so `Δ_{p*}(P_c) < 0` | N-P1..N-P5; A2 rewrite of `m − 1` and `8m − 1` | `E0 0` specializes `n − 0` and `C(n,0) = 1`; ℕ-exact | E5: the three-part decomposition equals the direct `Δ` exactly, with `s0 ≤ 0`, `s1 ≤ 0` and regrouped `< 0` on class `m ≤ 152`. Direct `Δ_c < 0` for class `m ≤ 200` and at `305, 500, 1001` | verified |
| T | Terminal = N-A4 ∧ N-P6; `hm` unused (fence 1) | `hmod` only; `hm` does not enter | none | Lean entry 28 is the pair; the build warning confirms `hm` is unreferenced | verified |
| (G) | Carried companion, kernel-checked (C1-LA3), with no grade of its own | `1 ≤ t`, `t ≤ a + b`, `3a+4b+2 ≤ 6t` | none | E2: 28,447 instances on `a, b ≤ 40`, 0 failures; coefficients cross-checked by product and by closed sum | verified (as a check; its grade is not asserted) |
| C | Carried entries 1–17 are byte-identical to C1-LA3, keyed by (C1-LA3, entry, digest) and bound to the origin receipt. C1-LA3 entries 18–21 are not carried | — | — | `check-carry-output.txt` | verified |

## Reproduced Mathematical Evidence

All code is mine: standard library only, with the import list declared in each file header, no imports from any prior evaluator,
and no wall-clock fields in any output. Files are under
`scratchpad/c2-s7-informal-LA2/`:

| File | SHA-256 | Content |
|---|---|---|
| `evaluator.py` (imports `sys`, `math.comb`) | `9878936fc2c6268da294e96da62ad3386c6547684896f399eef033b9bf8adf28` | E1–E6 |
| `evaluator-output.txt` (`python3 -B evaluator.py 200 152`, foreground) | `cfa3b175bee9b044185c5ed196dfe3cf4ac96626c6877bb8b369aa3c8fd05e32` | `TOTAL FAILS: 0` |
| `spot_large.py` (imports `sys`) | `4db0acf669b2fa56ef27104cb316a6ae1803766723f1eceed201bf61634cc41f` | direct products at `m = 107, 305, 500, 1001` |
| `spot-large-output.txt` | `a5ef4e443473b0eebc5ecf1aceeb41c8db87f982d7f1db1ed293b0ad25ee5687` | all four rows `Δ < 0` for both leaves |
| `check_carry.py` (imports `hashlib`, `json`, `os`, `re`) | `b3173f8237098e153f6c7745793bfa94371a19cc6a97b1080f730a8471e77f13` | frozen digests, carries, receipts, token scan |
| `check-carry-output.txt` | `f7682763ef15e8ece7efa08b85415aefb89995ac0af14af1fdee25ffdcd4742a` | — |
| `check_statement.py` (imports `hashlib`, `json`, `re`) | `e1e724ad7a93a0cccd3eda67c67989c067b5714a7584d23ad26c99aa038f5181` | `claim_sha256`, the three statement texts |
| `check-statement-output.txt` | `b4dba4f231dcd302e2581e0eba8e4241d7bde309f41161a8238ef95172742364` | — |

- **E1 (A1–A4).** For every class `m` from 2 to 30000: `3p* = 16m+4`, `6p* = 32m+8`, `8m−1 = 8(m−1)+7`, `3(p*−m) = 13m+4`,
  `p* − m ≥ 10`, `p* ≤ 8m+2`. 0 failures.
- **E2 ((G) on a grid).** For `a, b ≤ 40` and every `t` with `1 ≤ t ≤ a+b` and `3a+4b+2 ≤ 6t`: 28,447 instances, 0 failures.
  Coefficients were computed from the explicit product and checked against the closed sum `Σ C(a,i)C(b,n−i)2^{n−i}`.
- **E2b (behaviour just outside (G)'s hypothesis).** With `s = 3a+4b+2−6t`: at `s = 1, 2, 3` the descent still holds (0 failures in
  260, 293 and 280 instances), so (G) is conservative by up to 3 units. The first failure is at `s = 4`: `(a, b, t) = (0, 2, 1)` gives
  `[X^2](1+2X)^2 = 4 = [X^1]`, so strictness fails. There are 13/273 failures at `s = 4`, and every instance fails at `s = 5..8`.
  The record never claims (G)'s hypothesis is sharp. It claims margin 0 for the arm remainder, and that is exhibited below.
- **Sharpness of the remainder step (N-A3, margin 0).** On every class row `m ≤ 152`, the remainder hypothesis holds with slack
  exactly 0 at `t = p* − 1`. One index lower (`t = p* − 2`, slack −6), both the hypothesis and the descent fail:
  `[X^{p*−1}](1+2X)^{8m} ≥ [X^{p*−2}](1+2X)^{8m}`. So the remainder's own descent begins exactly at the index the proof uses.
- **E3 (identities).** N-A1 for `m = 0..14`, N-P1 for `n = 0..14`, the `(1+2X)G_c` factor identity, and N-P2 for `n = 0..20` hold
  as exact polynomial identities. The N-P2 identity is also a one-line hand factorization (ledger row N-P2).
- **E4 (every block, every weight index).** For class `m = 2..152` and every `j ≤ m` or `k ≤ m−1`, I recomputed the (G) hypotheses
  (`t ≥ 1`, `t ≤ a+b`, the exact slack formula `2j+3`, `0`, `2k+3`, `2k+7`, and `1, 1` for `A, B`) and the actual strict descent of
  every block. That is 11,832 block checks, 0 failures.
- **E5 (terminal and decompositions).** From the direct products, `Δ_{p*}(P_v) < 0` and `Δ_{p*}(P_c) < 0` for every class
  `m = 2..200` (67 rows), including 107 and 110. For `m ≤ 152`, the block decompositions of N-A4 and N-P6 reproduce the direct
  `Δ` exactly, with sign pattern `s0 ≤ 0`, `s1 ≤ 0` and regrouped `< 0`. At `m = 2`: `Δ_v = −6,225,088` and `Δ_c = −5,685,498`.
  At `m = 107, 305, 500, 1001` (direct products): `Δ/i_{p*}` ≈ `−0.01294, −0.00910, −0.00827, −0.00763` (arm) and
  `−0.01293, −0.00911, −0.00828, −0.00763` (private). The relative margin shrinks slowly with `m` but stays negative, as the
  uniform proof requires. These rows are checks, not proof.
- **E6 (off-class probe, informative).** For `m ≤ 60` with `m % 3 ∈ {0, 1}` and floor `p`, both inequalities still hold. The proof
  route, however, does not reach them. The remainder slack is −2 (residue 0) or −4 (residue 1), and the regrouped `A`/`B` slacks
  are −1/−1 or −3/−3, so (G) does not apply. `hmod` is therefore load-bearing for the proof, as A1 records, but it is not shown to
  be necessary for the conclusion. The statement is restricted to the class, which the fence requires. Nothing is widened.

## Independent Critic Pass

I ran a separate adversarial pass over the ledger above, without changing it:

1. **Could any ℕ subtraction truncate?** The truncating operations are `(16m+4)/3`, `m − 1`, `8m − 1`, `m − j`, `n − k`, `p* − j`,
   `p* − (k+1)`, `p* − 1`, `S + 1 − j` and `n − 0`. Each is exact on the class by A1–A4: `p* − m ≥ 10` covers every index shift,
   and `m ≥ 2` covers `m − 1`. E1 recomputes this on 10,000 class values, and the argument is uniform (linear in `m`). No
   truncation is possible.
2. **Is every "identity" an identity?** N-A1, N-P1, N-P2 and the `(1+2X)G_c` factorization were recomputed as exact polynomial
   identities (E3) and checked by hand. The `add_pow` orientation was checked against the Mathlib source: the `X(1+X)^8` summand
   carries exponent `j`, which matches `X^j` in the blocks. `sum_range_succ'` gives `Σ_{k<n+1} f k = Σ_{k<n} f(k+1) + f 0`
   (`Algebra/BigOperators/Group/Finset/Basic.lean` line 533, read), which matches N-P6's split.
3. **Strict versus non-strict.** The arm sum needs every summand strict and the range non-empty: `C(m,j) > 0` for `j ≤ m`, and
   `0 ∈ range(m+1)`. The additive form of `prod_lt_prod_of_nonempty'` (`Algebra/Order/BigOperators/Group/Finset.lean` line 462)
   needs exactly this. The private sum uses only `≤` on the two weighted sums, with strictness from the regrouped pair. That is
   sound even if a weight vanished (none does, since `C(n,k) > 0` for `k ≤ n`).
4. **Margin conventions.** `INFORMAL-PROOF.md` measures slack as `6t − (3a+4b+2)` in N-A2, N-A3, N-P3 and N-P4 (`2j+3`, 0, `2k+3`,
   `2k+7`), and as `6t − (3a+4b)` in N-P5 (value 3; slack 1 in the other convention). Each use is labelled on its face and both
   are arithmetically correct (E4). The synthesis and the C-F2-U critique use the second convention (`2k+5` for `E0`, "gaps 3
   and 3"), consistently. This is presentational and not a defect.
5. **Hidden dependencies.** The proof does not use `hm`. Newton, Darroch, `M_0`, finite certificates, real-rootedness, the `Π`
   identities of C-T2-F/C-T2-U and C-F2-T's tail ratio identity are all marked as not dependencies, and none appears in
   `Main.lean`. A token scan found no such lemma. The only mentions are C1-LA3's own docstrings, which say "no Newton, no
   Darroch".
   - C1-LA3 entries 18–21 (`cb8_gap_*`, `cb8_E1_*`, `cb8_block_descent_topRank`) are not present.
   - The file has exactly one `theorem`. Its only `def` is the carried entry 1 `polyCoeffZ`, which is proof-internal.
   - The contract's dependency graph draws an edge `def-poly-coeff-z → conclusion` although `polyCoeffZ` does not occur in the
     statement. The contract's own text says "proof-internal only", and it is a genuine proof dependency of (G). This
     over-listing is harmless and is not a fence breach.
6. **Carries.**
   - Entries 1–17 match between origin and run: each `Main.lean` region is byte-identical, each marker digest equal, each
     snippet byte-identical, and each snippet SHA equal to its marker.
   - The run's `FORMALIZATION-STATE.json` entries 1–17 equal the origin's on (index, kind, name, path, bytes, digest).
   - The prefix through `ENTRY 17 END` is identical, and the region `ENTRY 1 BEGIN … ENTRY 17 END` is `2a1e8df4…3df0`
     (15,336 bytes), agreeing with the formalizer's record.
   - The origin `Main.lean` `c0605e12…3011` is bound by the origin receipt (verdict `verified`).
7. **Index of record.** The statement compares coefficient `p*+1` against `p*`, which is `Δ_{p*} = i_{p*+1} − i_{p*} < 0`. This is
   the index of R-1 and SEMANTIC-CONTRACT §1 (`Δ_p(T − v) < 0`), not the rejected `Δ_{p*−1}`.
8. **Does the proof rely on anything not proved?** Only (G). (G) is a kernel-checked carried companion and I re-checked it
   numerically (E2). Mathlib's `add_pow`, `coeff_*` and `Finset` lemmas were read in the pinned source for meaning. The
   closed-form identification with `I(CB(8,m) − v)` and `I(CB(8,m) − c)` is not part of the claim and is excluded on its face.

The critic pass found no defect. The ledger stands unchanged.

## Scope and Fence Check

- **Closed-form level only.** The terminal speaks of `ℤ[X]` coefficients. It does not mention `cbGraph`, `IsFavorableAt` or
  `favorableLeaves` (source scan), and it does not assert the closed-form identification (excluded on both faces).
- **Synthesis exclusions.** The synthesis `### C2-LA2` excludes `IsFavorableAt (cbGraph m) w p*`, (H) and any Tier 2 progress. All
  three are listed as excluded on the contract's face and on `INFORMAL-PROOF.md`. The claim asserts none of them, and each face
  states "Not Tier 2 progress: a dependency removal (`FAV_darroch_free`)".
- **Brief §2 fences** are all on both faces:
  - no status transfer to the favorability key's graph statement until C2-LA3 or U-C closes;
  - one rank `p*`;
  - `d = 8`;
  - the class, with `107 ≤ m` present and unused.
  - The further exclusions ((HALL), conjunct 4, other residues, `m < 107`, aggregate, TREE, FOREST, TRANSFER, Erdős #993) are
    listed too and are not asserted.
- **Companions.** The claim asserts no grade for (G) or entries 1–16 ("no grade of their own").
- **Attribution.** Both the contract's scope text and `INFORMAL-PROOF.md` carry exactly the synthesis list, plus the formalizer
  `c2-la2-formalizer-opus-20260928` (Claude Opus 5.5):
  - T1 (seat, arm leaf);
  - C-T1-F, C-T1-U (arm-leaf Lean);
  - C-F2-U (both leaves, regrouping, Lean);
  - C-F2-T, C-T2-F, C-T2-U (independent private-leaf proofs);
  - r30 (closed forms, pairing, favorability key);
  - C1-LA3 (G).
- **DRAFT sources.** C-F2-U `CritFav.lean` (`1cf34606…65d0`) and C-T1-U `Crit.lean` (`9e400946…15f1`) are named as re-authored,
  never carried. The Lean docstrings name the origin on each new declaration.
- **Statement freeze.** The statement is neither widened nor weakened. The only changes are the two recorded plumbing changes
  (namespace-relative name, dedent), checked byte for byte.

Read-boundary disclosures:

- **What I read.** I read only the brief's §1 grant: the run files listed there, capsule members (the synthesis sections, the F
  adjudication's `## Lean readiness` and targeted lines, a targeted `grep` of the C-F2-U critique, and SEMANTIC-CONTRACT §1), the
  frozen C1-LA3 run, and Mathlib sources in the shared project (targeted `grep` only).
- **Directory listings.** I listed the Lean run root and the C1-LA3 origin root (`ls`), both inside the grant.
- **Harness output cache.** One capsule-manifest display exceeded the inline limit, and the harness saved it to its own
  tool-output cache outside the run root. I did not open that copy.
- **Background job.** The harness moved my first evaluator run to the background when it exceeded the default timeout. I killed it
  by its literal PID (59974), reduced the grid, and re-ran everything in the foreground.
- **Not used.** No network, no installs, no `lake`, `lean` or `elan`, and no writes outside `scratchpad/c2-s7-informal-LA2/`.

## Verdict

passed

Every node of `INFORMAL-PROOF.md` (A1–A7, N-A1..N-A4, N-P1..N-P6 and the terminal) is a correct statement-level step for exactly
the contract's claim. Every ℕ subtraction and division is exact on the class, and every identity was recomputed. Every (G)
application meets (G)'s three hypotheses with the stated slack, and the carried tool is byte-identical and receipt-bound. The
terminal's hypotheses match the claim one for one, and nothing fenced is asserted. The remaining observations (mixed
slack-convention labels; the harmless `polyCoeffZ` edge in the contract's graph) are not defects.

Model disclosure: chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id `claude-opus-5-5`.
