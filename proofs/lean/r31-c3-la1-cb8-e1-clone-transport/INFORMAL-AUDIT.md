---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c3-la1-formalizer-opus-20260928
critic_id: c3-la1-opus-informal-20260928
attestation_id: c3-la1-informal-pass-20260928
claim_sha256: 909f2986d1f0fd5c8ab2c597e43d5c942b4c5413d02004a49b44f959f734f036
---

# Informal Proof Integrity Audit

**Boot.** I worked inside VerityOS. Before any audit work I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`. I loaded the `experiments/` subsystem (this run root) and `skills/`. The harness also
injected `CLAUDE.md` and the user auto-memory index as session context. I did not read either by tool.

**Model disclosure (two parts).** The chartered model, on dispatch-record authority, is Claude Opus 5.5 at effort high. The model id
my runtime reports, verbatim, is `claude-opus-5-5`. I used no child agent.

**Seat and object.** Reviewer `c3-la1-opus-informal-20260928` (kind `independent-mathematical-proof-integrity-reviewer`) for the
canonical run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, award C3-LA1, Lean run
`lean-2026-09-28-c3-la1-cb8-e1-clone-transport`. I did not produce the artifact. I edited nothing in the run and repaired nothing.

**Input gate (tool-computed in this session).**
- The auditor brief `control/C3-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` is `896369e3…58781c`, as dispatched.
- `THEOREM-CONTRACT.yaml` is `35b5dd52…fb26c`, as expected.
- `INFORMAL-PROOF.md` is `09021349…98d4`, as expected.
- `LeanProject/LeanProof/Main.lean` is `1388fa52…eb15`, as expected. It equals the kernel receipt's source hash before and after, and
  the receipt verdict is `verified`.
- `CAPSULE-VERIFICATION.json` is `c5fdc44a…4d02` and `FORMALIZER-REPORT.md` is `d5c35e29…b6c0`.
- The capsule seal, recomputed as compact key-sorted JSON of the manifest minus `seal_sha256`, is `c24b760a…6b39f`. It matches.
  All 1,057 members match their digests (0 mismatches).
- All 218 `sources/c1-results/` files of the two origin runs match that directory's `SOURCE-DIGESTS.json`. All 597 entries of
  `sources/c3-stage7-sources/SOURCE-DIGESTS.json` match. All 42 contract `source_materials` match.
- I recomputed `claim_sha256` as `" ".join(s.split())` over the contract's `informal_statement`. It is `909f2986…f734f036`, equal to
  the brief's value. `lean_binding.expected_statement` hashes to `dbfb8411…cd935`, equal to the contract field.

**Read boundary (disclosure).**

What I read:
- the Lean run's contract, `INFORMAL-PROOF.md`, `FORMALIZER-REPORT.md`, `CAPSULE-VERIFICATION.json` (keys and fields),
  `EVIDENCE/THEOREM-CONTRACT.md` (head), `EVIDENCE/axioms*.txt`, the kernel receipt, and `Main.lean`;
- the synthesis `## Lean awards` and `## Exact established results` (plus its heading list);
- the T adjudication `## Lean readiness` (plus its heading list);
- the formalizer brief;
- the origin C1-LA3/C1-LA1 `Main.lean` entry blocks (by script), their kernel receipts and their `FORMALIZATION-STATE.json`;
- three Mathlib lemma statements, found by `grep` inside the Mathlib package directory.

The originating return: I took it to be T2's (`C3-T-02`), because the T-A draft is "in T2's vocabulary". I read only its heading list
and `grep` hits for TP-h in its two critiques (T2/F, T2/U).

What I did not open: the T1 return and its critiques, the F adjudication, any U or F-route file, SR-C3-1, `second-reads/`,
`DRAFTS/`, the fidelity inputs, and any other run.

Files I hashed without reading their contents:
- every capsule member (the seal check);
- the c1-results run files, the c3-stage7-sources files and the contract's `SOURCE/` copies (the digest checks);
- `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`.

Directory listings I ran, all inside the grant: `sources/`, `sources/c1-results/runs/`, and the first 30 names of
`sources/c3-stage7-sources/`.

The foreground evaluator exceeded the tool's 600 s limit. The harness moved it to the background and wrote its own task-output file
under `/private/tmp/claude-501/…/tasks/`, which I did not author. I polled the literal PID 31471 to completion. All my own outputs are
in this directory. I created no conversation log, because the brief permits one output path.

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`, which is the terminal
`E993Transport.cb8_E1_cloneTransport_topRank`. Take `m : ℕ` with `107 ≤ m` and `m % 3 = 2`, and write `p* = (16m+4)/3` (exact). Then:
1. `e1Rho 7 (8m−7) (p*−1) = cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)` over ℚ.
2. For every `1 ≤ q ≤ m`, with `a = 8q−1`, `b = 8(m−q)+1` and `j = p*−q`:
   - (2a) `e1Rho a b j = r(j)/r(j−1)`, the ℤ-coefficients of `(1+X)^a(1+2X)^b` cast to ℚ;
   - (2b) `e1Rho a b j < 1`;
   - (2c) the six companion conjuncts at `(a,b,j)`: nonnegativity of `G_α, H_α` for `α ≤ a`; in-balance for `α < a`; top; `G_0 = 0`;
     saturation when `j ≤ a`; and the guarded column identity at every `α ≤ a` with `T_α > 0`.

Lean conventions apply: ℕ truncated subtraction, floor division, and `x/0 = 0`. The five definitions are the synthesis's frozen text.

## Claim Ledger

Verdict key: **V** = verified with reproduced evidence (derivation checked line by line, plus exact computation). **V-c** = verified
by carried kernel-checked content that I bound to its origin receipt, with the informal use checked. **I** = imprecise but true under
a charitable reading (non-blocking). No row is false, unsupported, a citation mismatch, or blocked.

| # | Claim (INFORMAL-PROOF.md) | Hypotheses and where they enter | ℕ-subtraction / cast check | Evidence | Verdict |
|---|---|---|---|---|---|
| D1 | `e1S` = `[α≤j]·C(a,α)·C(b,j−α)·2^(j−α)` | none | `j−α` sits only under the guard `α≤j`, so it is a true value | Byte-equal to the frozen synthesis text (tool); evaluator implements it literally | V |
| D2 | `e1T` = `[α+1≤j]·C(a,α)·C(b,j−1−α)·2^(j−1−α)` | none | `j−1−α` sits only under the guard `α+1≤j`, so it is a true value | Byte-equal to frozen text | V |
| D3 | `e1Rho = ΣS/ΣT` over `range (a+1)` | none | `x/0 = 0` is never used on the domain (L2) | Byte-equal to frozen text | V |
| D4 | `e1G = ρ·Tc(α) − Sc(α)` (strict prefix, `range α`) | none | ℚ only | Byte-equal to frozen text | V |
| D5 | `e1H = S_α − G_α` | none | ℚ only | Byte-equal to frozen text | V |
| D6 | carried `cb8R1` (C1-LA1 entry 11) and `polyCoeffZ` (C1-LA3 entry 1) | none | inside `cb8R1`, `8m−7` needs `m≥1` and `k−i` has `i ≤ min(7,k)`, both true values (not listed in the proof's audit; see C-3) | Byte-identical to origin, bound to origin state and `verified` receipt | V-c |
| N1 | `8·1−1 = 7`; `8(m−1)+1 = 8m−7` | `1≤m` (from `hm`) | true values | Arithmetic; `omega` in Lean | V |
| N2 | `(16m+4)/3` is exact `= p* ≥ 572`; `(16m+1)/3 = p*−1` exact | `hmod` for exactness | exact on the class for every `m ≡ 2 (mod 3)` from 107 to 4,999 | `p*(107) = 572`; the floor identity `(16m+4)/3 − 1 = (16m+1)/3` holds for every `m ≤ 5000` (so it needs no hypothesis, as the controller fact says) | V |
| N3 | `p*−1`, `(16m+1)/3−1 = p*−2`, `p*−q−1` are true; `q ≤ m < p*−1` | `hm` | true values | `m < p*−1` for every class `m` from 107 to 4,999 | V |
| N4 | `8q−1` and `m−q` are true; `j = p*−q ≥ p*−m ≥ 2`; `j ≤ a+b+1 = 8m+1` | `1≤q≤m` | true values | `a+b+1 = 8m+1` for every `m < 300` and every `q`; observed `min j = 465` at `m = 107` (`p*−m = (13m+4)/3 = 465`) | V (the bound "≥ 2" is weak but true) |
| N5 | Companion ℕ terms `a−α`, `j−1−α`, `b−(j−1−α)`, `j−α` are true values where used | `α<a`; `0<T_α` gives `α+1≤j` and `ℓ≤b` | `a−α` is used only when `α<a`; the rest only under `0<T_α`; `b−ℓ` only when `ℓ<b` | Derivation plus the literal-Lean evaluator (truncation modelled) | V |
| N6 | Casts: ℕ→ℚ for clone counts, `cb8R1` and weights; ℤ→ℚ for coefficients; no `x/0` junk in a used branch | as used | denominators are `ΣT > 0`, `r(j−1) > 0`, `(a−α)T_α > 0` and `2(b−ℓ)T_α > 0` after absorption | Derivation; column checks under the literal `x/0 = 0` semantics pass | V |
| L1a | Step 1: `[X^k](1+2X)^b = C(b,k)2^k` | none | — | Binomial theorem; Mathlib `coeff_one_add_X_pow` read for meaning | V |
| L1b | Step 1: `ΣS = r(j)` for every `j` (extra terms vanish: `C(a,i) = 0` for `i > a`, and the guard for `α > j`) | none | — | Recomputed on 2,160 generic `(a,b,j)`, with `j` up to `a+b+3`: 0 failures | V |
| L1c | Step 1: `T_α = e1S a b (j−1) α` for `1 ≤ j`, hence `ΣT = r(j−1)` | `1 ≤ j` | guard equivalence `α+1 ≤ j ⇔ α ≤ j−1` for `j ≥ 1` | 16,836 cases: 0 failures | V |
| L1d | Step 1 / (2a): `ρ = r(j)/r(j−1)` for `1 ≤ j` | `1 ≤ j` | Lean index `(16m+4)/3 − q − 1` is a true value | At every `q` on 15 class rows, against coefficients computed independently (linear-factor products, then exact `×(1+X)^8 / (1+2X)^8` steps with zero remainder asserted): 0 failures | V |
| L2 | Step 2: `ΣT > 0` for `1 ≤ j ≤ a+b+1` (carried entry 14 at index `j−1 ≤ a+b`) | domain | — | Entry 14 bound to receipt; 1,728 generic cases and every class `q`: 0 failures | V-c |
| L3 | Step 3: `ρ < 1` from carried entry 20 over the positive entry-14 denominator, through (2a); never assumed | `hm`, `hmod`, `1≤q≤m` (entry 20's hypotheses) | — | Entry 20 bound to receipt; `ρ < 1` at every `q` on all 15 class rows | V-c |
| L4 | Step 4: `cb8R1 m k = [X^k](1+X)^7(1+2X)^(8m−7)`; conjunct 1 follows from L1d at `k = (16m+1)/3` and `k−1` | `1 ≤ m` | L4 uses `p*−1−1 = (16m+1)/3 − 1` | `cb8R1 = coefficient` for `m ∈ {1,2,5,14,107}` at every `k ≤ 8m`; conjunct 1 exact (ℚ) on all 15 class rows | V |
| L5a | Step 5: in-balance `G_{α+1} + H_α = ρT_α` for every `α` (telescoping) | none | ℚ | Line-by-line algebra; integer form `ΣT·(G_{α+1}+H_α) = ΣS·T_α` holds at every class `α` | V |
| L5b | Step 5: top `H_a = ρT_a`, using `ρΣT = ΣS` | `ΣT ≠ 0` (L2) | — | Algebra checked; exact at every class `q` | V |
| L5c | Rows `G_α + H_α = S_α` (definitional) | none | — | Definitional | V |
| L6a | Step 6: `G_0 = 0` | none | — | `range 0` is empty | V |
| L6b | Step 6: `j ≤ a ⇒ Tc(j) = ΣT`, `Sc(j+1) = ΣS`, hence `G_j = S_j`, `H_j = 0` | `ΣT ≠ 0`, `j ≤ a` | — | 936 generic prefix checks: 0 failures; saturation exercised 44–206 times per class row, with 0 failures | V |
| L7a | Step 7: `(α+1)S_{α+1} = (a−α)T_α` (from `C(a,α+1)(α+1) = C(a,α)(a−α)`) | `α+1 ≤ j` | truncated `a−α`: both sides 0 once `α ≥ a` | Mathlib `Nat.choose_succ_right_eq` read for meaning; 13,404 ℕ cases, including `α ≥ a` and `ℓ ≥ b`: 0 failures | V |
| L7b | Step 7: `(j−α)S_α = 2(b−ℓ)T_α` | `α+1 ≤ j` | truncated `b−ℓ`: both sides 0 once `ℓ ≥ b` | same run: 0 failures | V |
| L8a | Step 8: `T_α > 0 ⇒ α+1 ≤ j` and `ℓ ≤ b`; with `α < a`, the Boolean term equals `G_{α+1}/T_α` | `T_α > 0` | weight `a−α > 0` | Derivation; also checked: `α < a, T_α > 0 ⇒ S_{α+1} > 0` (5,148 cases) | V |
| L8b | Step 8: with `ℓ < b`, the ternary term equals `H_α/T_α` | `T_α > 0`, `ℓ < b` | weight `2(b−ℓ) > 0` | Derivation | V |
| L8c | Step 8, degenerate `ℓ = b`: for `i < α`, `S_i = T_i = 0`, so `Sc(α) = Tc(α) = 0`, `G_α = 0`, `S_α = 0`, `H_α = 0` | `T_α > 0`, `ℓ = b` | `j−i ≥ b+2` | 936 generic degenerate columns: 0 failures; 67–314 degenerate columns per class row, all correct | V |
| L8d | Step 8, sum: `(1[α<a]G_{α+1} + H_α)/T_α = ρ`, by in-balance or top; at `α = a`, `ℓ = b` this forces `j = a+b+1` and `ρ = 0` | `ΣT ≠ 0`, `T_α > 0` | — | Literal-Lean column (ℚ) at every `α` with `T_α > 0` on 11 class rows; numerator form on 4 more; generic grid; `α = a, ℓ = b ⇒ ρ = 0` on `a, b < 8` | V |
| L9a | Step 9: `S_α = C(a,α)f(j−α)`, `T_α = C(a,α)f(j−1−α)`, with `f` zero-extended at integer index | none | the guard equals nonnegativity of the ℤ index | 17,916 cases: 0 failures | V |
| L9b | Carried entry 15: `c(i−1)c(k+1) ≤ c(i)c(k)` for `i ≤ k` at every integer index | none | ℤ indices, negative included | Bound to receipt; recomputed on 12,933 cases with `i, k ∈ [−4, a+b+4]`: 0 failures | V-c |
| L9c | LR-g: `S_xT_y ≤ S_yT_x` for `x < y` (entry 15 at `a = 0`, with `i = j−y`, `k = j−1−x`) | `x < y` | index substitution checked | 39,975 cases, zero entries included: 0 failures | V |
| L9d | LR-h: `S_{z+1}T_x ≤ T_zS_{x+1}` for `x+1 ≤ z` (entry 15 at `b = 0`; common `f`-factors ≥ 0 by entry 13) | `x+1 ≤ z` | — | 39,975 cases: 0 failures | V |
| L9e | `ΣT·G_α = Σ_{y∈[α,a]} Σ_{x<α} (S_yT_x − T_yS_x) ≥ 0`, hence `G_α ≥ 0` | `α ≤ a`, `ΣT > 0` | — | The identity (both forms) holds in 12,948 cases; `G ≥ 0` at every class `α` | V |
| L9f | `ΣT·H_α = T_{[α,a]}Sc(α+1) − S_{[α+1,a]}Tc(α)`; chain step 1 (LR-h with `z = α+k ≥ x+1`); chain step 2 (add `T_a`, `S_0 ≥ 0`), hence `H_α ≥ 0` | `α ≤ a`, `ΣT > 0` | `a−α`, `a+1−α` are true values since `α ≤ a` | Identity, chain 1 and chain 2 each hold in 12,948 cases; `H ≥ 0` at every class `α` | V |
| L9g | Zero-extension boundary needs no case split | — | — | Follows from L9b holding at every integer index | V |
| C0 | Companion: for `1 ≤ j ≤ a+b+1`, steps 2, 5, 6, 8, 9 give the six conjuncts | `1 ≤ j ≤ a+b+1` | — | 2,744 generic triples (`a, b ≤ 13`), literal Lean semantics: 0 failures (a superset of the synthesis's 2,197) | V |
| T0 | Terminal assembly: conjunct 1 from L4; for `1 ≤ q ≤ m`, `j ≥ 1`, (2a) from L1d, (2b) from L3 via (2a), (2c) from C0 after substitution | `hm`, `hmod` | — | Matches the Lean terminal proof term; every conjunct holds at every `q` and `α` on 15 class rows | V |
| H0 | "Hypotheses load-bearing through entry 20, the domain `1 ≤ j ≤ a+b+1`, and the floor identity" | — | — | They are consumed by entry 20, which is a genuine use. The domain and the floor identity need neither hypothesis (see C-1) | I |

## Reproduced Mathematical Evidence

I wrote every script in this seat under `scratchpad/c3-s7-informal-LA1/`. Each uses the standard library only, with an explicit
import list in its header, and none imports a prior evaluator. No hashed output holds a wall-clock field.

| file | SHA-256 | what it checks |
|---|---|---|
| `check_capsule.py` | `8865eeff5ff2816240f8e557b2916cdce41f66e80bf62646a6ce8c565bf09c5e` | capsule seal and all 1,057 member digests |
| `check_carries.py` | `1e1eab8ff3a6e971fbcbd0e3a30c1b4f4263960a0982c474304828c611a80a3e` | carry byte-identity, marker digests, receipt binding, token scan |
| `check_frozen.py` | `f9adf7b1877835945aab753ddefdb79769e68c391f1f4f8299888f5cc29caee0` | frozen definitions, terminal and companion transcription; `expected_statement` |
| `check_attribution.py` | `0d06d8d3cbd86c961f4dcb1fbed85c879dfe8085eb93e96ab4d434ecf3681241` | attribution bullets and fences on the face |
| `evaluator.py` | `7511f83821d63b96693063fe1dd9f7e3836f85c745bb5668412fc5226ad05b9f` | the terminal on class rows, the generic companion, controls, entry 15, hypothesis roles |
| `evaluator-output.json` | `3c008b33be85094fe1c38e8db73e76e7972b20e66082d02575d5cbc7525039ec` | output of `evaluator.py` |
| `evaluator_steps.py` | `6613d4fd1c9ab10e7b835b18f5f68dc81e988bf6ab76911a21efeeaa817d3c1b` | step-level identities of steps 1, 2, 6, 8, 9 |
| `evaluator-steps-output.json` | `0daf435cca9b14cb9355cc60486065f18aedc1b5849e2c8dc101b265080ca1db` | output of `evaluator_steps.py` |

**Results.**
- **Carries (R1).** Twenty carried entries are byte-identical to their origin `Main.lean` entry blocks, with kind and digest
  unchanged. The new file's entries 1, 8–25 come from C1-LA3 entries 1–18 and 20, and entry 2 comes from C1-LA1 entry 11.
  - Each digest equals the origin `FORMALIZATION-STATE.json` entry.
  - Each origin `Main.lean` (`c0605e12…3011`, `f0578ed7…9b78e`) equals its `verified` kernel receipt's source hash.
  - C1-LA3 entry 19 (`cb8_gap_block_descent`) and entry 21 (the origin terminal) are not carried.
  - Every marker digest in the new file equals the SHA-256 of its block.
  - No new declaration name collides with an origin name.
- **Hygiene (R2, R7).** The new source contains no `sorry`, `admit`, `native_decide`, `decide`, `axiom` or `set_option`. It has exactly
  one `theorem`, and the reserved name `cb8_topRank_eligible_and_weightedHall` is absent.
- **Axioms (R4).** `EVIDENCE/axioms.txt` lists the terminal as `[propext, Classical.choice, Quot.sound]`.
  `EVIDENCE/axioms-all-declarations.txt` covers 53 declarations: 47 use those three axioms, 6 use `[propext, Quot.sound]`, and
  `sorryAx` appears 0 times. The kernel receipt (`92e47b55…9ed4`) is `verified`, and all eleven of its checks passed. I audited the
  mathematics, not the kernel.
- **Transcription.** The five definitions and the terminal are byte-equal to the synthesis's frozen text. The companion
  `e1_cloneTransport` is byte-equal except for the one recorded plumbing change `theorem → lemma`. `expected_statement` equals the
  source text from `theorem` up to ` :=` and equals the frozen terminal. The terminal's hypotheses are exactly `hm : 107 ≤ m` and
  `hmod : m % 3 = 2`, one-for-one with the claim.
- **Class rows, full literal-Lean check.** The rows are `m ∈ {107, 110, 113, 116, 125, 128, 131, 134, 140, 143, 200}`. Every `q`
  and every `α ≤ a` was checked, including the column sum in exact ℚ with `x/0 = 0`.
  - Conjunct 1, (2a), (2b), `ΣT > 0` and the domain all hold.
  - All six (2c) conjuncts hold.
  - Result: 0 failures, over 793,584 `α`-checks in total (46,224 at `m = 107`).
- **Class rows, integer check.** The rows are `m ∈ {251, 302, 404, 506}` (`p*` up to 2,700). The (2c) conjuncts were checked in
  integer form (`ΣT·G`, `ΣT·H`), with the column numerator identity in place of the ℚ column. Result: 0 failures, over 2,299,680
  `α`-checks.
- **Coverage.**
  - Every row exercises saturation (44 cases at 107, 206 at 506).
  - Every row exercises the degenerate `ℓ = b` column (67 at 107, 314 at 506) and the `α = a` column (63 at 107, 300 at 506).
  - The `α = a`, `ℓ = b` corner cannot occur on the class, because `j ≤ p*−1 < 8m+1`. It was checked generically instead.
- **Generic companion.** 2,744 triples with `a, b ≤ 13` and `1 ≤ j ≤ a+b+1`: 0 failures. These exercise 1,470 degenerate `ℓ = b`
  columns.
- **Hypothesis controls.**
  - `j = 0` (outside `1 ≤ j`): all 36 triples with `a, b ≤ 5` fail. For example, `(0,0,0)` fails top and saturation. So `1 ≤ j` is
    load-bearing, as the record says.
  - `j ≥ a+b+2`: every `S` and `T` vanishes, and all 147 triples hold trivially. The upper bound is a hypothesis of the proof route
    (it gives `ΣT > 0`); the record never calls it sharp.
  - The absorption identities also hold, trivially, outside their guard `α+1 ≤ j` (both sides are 0). The proof says it uses "only
    `α + 1 ≤ j`", which is a sufficiency claim, and that is correct.

## Independent Critic Pass

This pass re-reads the unchanged ledger adversarially and targets the steps most likely to hide a defect.

1. **Zero-extension boundary in step 9.** This is where the synthesis expected a block. LR-g and LR-h are derived from entry 15 at
   ℤ indices. I checked by hand:
   - the index substitutions (`i = j−y ≤ k = j−1−x ⇔ x < y`; `i = x+1 ≤ k = z`);
   - the shared `f`-factors in LR-h (`f(j−1−z)·f(j−1−x)` on both sides);
   - that entry 15's formal statement quantifies over all `i j : ℤ` with `i ≤ j`.

   Exact checks include negative indices and indices past `a+b`. No gap.
2. **The `H_α` decomposition.** I re-derived `ΣT·H_α = ΣT·Sc(α+1) − ΣS·Tc(α)` from `H = S − G` and `ρΣT = ΣS`, then the split.
   The cross term `Tc(α)·Sc(α+1)` cancels exactly. The chain's two inequalities need nonnegative factors, and those come from
   `e1S_nonneg` and `e1T_nonneg`. It holds.
3. **Degenerate column.** The ternary branch is skipped exactly when `ℓ ≥ b`, and `T_α > 0` forces `ℓ ≤ b`. So the skipped case is
   exactly `ℓ = b`, where `H_α = 0` is proved, not assumed. The Boolean branch at `α = a` is replaced by the top identity. The proof
   never divides by `S_α` or `S_{α+1}` directly: after absorption, the denominators are `(a−α)T_α` and `2(b−ℓ)T_α`. No `x/0`
   junk value enters.
4. **ρ < 1 never assumed.** In the Lean source, `cb8Rho_lt_one` is derived from entry 20 and entry 14. The terminal applies it only
   after rewriting through `e1Rho_eq_coeff_ratio`. No hypothesis restates it.
5. **Vacuity.** Every quantified conjunct has witnesses on the class. `T_α > 0` columns, `j ≤ a` saturation cases and `ℓ = b`
   degenerate columns all occur at `m = 107`.
6. **Dependencies.** Nothing marked "not carried" or "not needed" is used. The Lean closure does not contain C1-LA3 entries 19 and 21,
   the pair-sum zero-case completion or the product form for `H`. No Newton inequality or Darroch theorem appears: nonnegativity
   rests on entry 15's two-by-two minors.

The pass left the ledger's verdicts unchanged. It raised three non-blocking observations:

- **C-1 (imprecision; row H0).** The informal proof and the contract say the hypotheses are load-bearing "through the domain" as well
  as through entry 20. The domain facts need neither hypothesis: `j = ⌊(16m+4)/3⌋ − q ≥ ⌊(13m+4)/3⌋ ≥ 1` and `j ≤ 8m+1` hold for every
  `m` and `1 ≤ q ≤ m`. The floor identity needs neither either, which the proof itself records as a controller fact.
  - Numerically, the whole terminal body holds on every row `m ≡ 2 (mod 3)`, `2 ≤ m ≤ 104`, that I tested (`2, 5, 8, 11, 20, 50,
    104`).
  - `ρ_q < 1` holds at every `q` for every `m ≡ 2 (mod 3)` below 107.
  - `ρ_q < 1` also holds at the floor rank for `m ∈ {108, 109, 111, 112, 150, 151}`.

  On the rows tested, neither hypothesis is sharp for this statement. They enter formally as the hypotheses of carried entry 20. The fence "NOT
  `m < 107`, NOT `m ≢ 2 (mod 3)`" is a scope restriction, not a claim that the statement fails there. No step is affected.
- **C-2 (contract graph, over-inclusion).** `def-poly-coeff-z` is described as "proof-internal only (does not occur in the terminal
  statement)" but is listed as a dependency of `conclusion`. This is a conservative over-inclusion in the declared graph, not a hidden
  dependency. I flag it for the fidelity reviewer and do not treat it as a proof defect.
- **C-3 (audit completeness, cosmetic).** The ℕ-subtraction audit covers every subtraction in the terminal's own text. It does not
  list the two inside the carried `cb8R1` (`8m−7` and `k−i`). Both are true values (`m ≥ 1`; `i ≤ min(7,k) ≤ k`), and the definition
  is carried and receipt-bound.

## Scope and Fence Check

- **Clone level only.** The claim and the proof mention only `e1S/e1T/e1Rho/e1G/e1H`, coefficients of `(1+X)^a(1+2X)^b`, and
  `cb8R1`. None of the following is asserted: `cbGraph m`, the E1 flow on the literal network, the graph lift, conjunct 4, (HALL) at
  any scope, `S(T_m, p*) ≤ 0`, favorability, (L-S)_top, (ELIG-top)(a), a θ\* law, or any optimality of the template. Pass.
- **One rank.** The claim uses one rank `p*`, `d = 8`, and the class `107 ≤ m`, `m % 3 = 2` only. There is no new identity or key,
  and the registration is a scope-note clause G-1 with ledger row R31-C3-LA1. No grade is asserted for any companion. Pass.
- **No Newton or Darroch.** Pass (critic item 6).
- **Fences and excluded conclusions on the face.** Both appear on the face of `INFORMAL-PROOF.md` and in the contract's scope text
  (`informal_statement`), matching the synthesis section and brief §2. Pass.
- **Attribution.** The fourteen bullets of the synthesis's "Attribution" list appear verbatim, in order, in `INFORMAL-PROOF.md`,
  plus the formalizer bullet `c3-la1-formalizer-opus-20260928` (Claude Opus 5.5). All fourteen items and the formalizer also appear
  in the contract's scope text (ASCII-transliterated there: `rho_1`, `rho_q`). Pass.
- **Recorded repairs.** Four repairs are recorded on the face: guarded objects replace T1's `N`; T2's "of record" label is narrowed;
  entry 21 is not carried; U2's duplicate is deduplicated. Each is consistent with the source (the carry check confirms entry 21 is
  absent, and there is one `cb8Rho_lt_one`). Pass.
- **Brief §3 conditions audited.**
  - R1 passes (carry check).
  - R2 passes (token scan; `m, q, j, a, b, α` stay variables; no enumeration).
  - R3 passes (contract fields, axioms list, `expected_statement`, source materials, canonical run id), with note C-2.
  - R4 passes (axioms files).
  - R5 passes, with notes C-1 and C-3.
  - R6 was not triggered.
  - R7 passes (one `theorem`, no reserved name).

## Verdict

passed

`INFORMAL-PROOF.md` proves the contract's `informal_statement` at statement-level granularity:
- every step of the synthesis DAG (steps 1–9 and the terminal assembly) is present and correct;
- every ℕ-subtraction and cast in the terminal's text is a true value where it is used;
- every carried input is byte-identical and bound to a `verified` origin receipt;
- every numeric claim reproduces under my own exact-integer evaluation.

The claim asserts nothing fenced, and the required attribution travels on the face. Observations C-1 to C-3 are non-blocking
imprecisions and do not affect any inference.
