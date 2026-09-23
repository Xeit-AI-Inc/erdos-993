---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la3-formalizer-sonnet-20260922
critic_id: c6-la3-fable-informal-20260922
attestation_id: c6-la3-informal-pass-20260922
claim_sha256: 17143eae26d2cc0ffdff60d5bd308496caa00121b6d8d4450a818d8b3b457a07
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** Operating within VerityOS. Booted by reading exactly
`verity.md` (root constitution), `identity/startup-protocol.md` (default
operating sequence) and `skills/proof-integrity-audit/skill.md` — the three
reads `C6-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md` §0 authorizes. No other
VerityOS subsystem (`memory/`, `decisions/`, `operations/`, `writing/`,
`logs/`, `knowledge/`, `conversations/`, `inbox/`) was opened. Everything else
read is inside this run root and inside the brief's §1 read boundary: the Lean
run `runs/lean-2026-09-22-c6-matching-all-index-coefficientwise/`, the sealed
capsule `control/c6-stage7-capsules/C6-LA3-PACKET-MANIFEST.json` and its nine
members, the controller's formalizer brief
`control/C6-STAGE7-FORMALIZER-BRIEF-LA3.md`, `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md` and `SOLUTION-CONTRACT-ADDENDUM-1.md`. No network, no
package install, no `lake`/`elan` invocation of any kind, no `find`/`grep`
rooted above those paths, nothing written outside
`scratchpad/c6-s7-informal-LA3/`. Child delegation forbidden and not used.

**Model disclosure.** Independent informal proof-integrity reviewer, chartered
Claude Opus 5, effort high. This seat cannot self-inspect its own runtime model
or effort setting; the model and effort are stated on dispatch-record
authority, as the brief's own header requires.

**Role.** Independent auditor, not artifact producer. Nothing in the Lean run
was edited, and no defect was repaired by this seat.

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`
(`THEOREM-CONTRACT.yaml`, SHA-256
`61492702ab332d4d86dd25fde9079169bc47a342587a878d7601ef6f23bc5850`, matching
the brief's expected digest). Collapsing its whitespace to single spaces
(`" ".join(s.split())`, 2,322 characters) and hashing gives

```text
17143eae26d2cc0ffdff60d5bd308496caa00121b6d8d4450a818d8b3b457a07
```

recomputed by this seat and equal to the digest the brief names.

Its mathematical content, stated as the compiled terminal declaration
(`LeanProject/LeanProof/Main.lean`, SHA-256
`6e23d5e7aec5959d699a765d6023e4d89e057a11dd4332c127a0efebff08b30a`, entry 46,
the file's only `theorem`):

```lean
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    ∀ j ≤ m, CoeffNonneg (Nj K m j) :=
  fun _ hjm => Nj_nonneg_general hKd hregion hjm
```

fully qualified `ErdosR25.E1CoeffWise.Nj_nonneg_all_index`. The compiled
statement is byte-identical to the contract's `lean_binding.expected_statement`
(present verbatim in `Main.lean`; its recomputed SHA-256
`96b34976948db682ff3e8dec69af2964c801d38237cf9e7a0ae4683789952600` equals the
contract's `expected_statement_sha256`), and identical in arrangement to the
controller's §2 transcription and to the synthesis Dispatch 3 display, with the
single mandated substitution `Nonneg → CoeffNonneg` of repair (1).

`INFORMAL-PROOF.md` (SHA-256
`9e243c0816708f847a5ece0adce665ddeb1c1a299d13262cbedbd288e6a3ac0b`, matching
the brief) is audited as the proof of that claim.

**Capsule and provenance gate, recomputed independently.** The nine members of
`C6-LA3-PACKET-MANIFEST.json` all match their declared byte counts and digests.
The seal is the SHA-256 of the compact key-sorted JSON of the manifest minus
`seal_sha256` (`sort_keys=True`, `separators=(",",":")`, no trailing newline);
this seat recomputed it against ten candidate conventions and exactly one
matches the declared `08460b50b0472f25017ce350537368c4b8fca429fb41384ffb640ea08f5e2cab`.
The four digest-bound originating Lean sources under `SOURCE/` match the
contract's `source_materials` digests, and every one of the 23 artifact
digests in `FORMALIZER-REPORT.md`'s hash table was recomputed and matches.

## Claim Ledger

Forty-six registered declarations; the header digest on every `VERITYOS ENTRY`
marker was recomputed and agrees with the entry body in all 46 cases. Nine
definitions, thirty-six lemmas, one terminal theorem; nothing is registered
after the terminal theorem; no entry references `Nj_nonneg_all_index` in code
except entry 46 itself (entry 45 names it only inside a `/-- … -/` doc
comment), so the registration order carries no cycle. The contract's
dependency graph is closed (no dangling edge endpoint), acyclic by topological
sort, and its `lean_name`s are exactly the registered names.

### Definitions (entries 1–9)

| # | object | reading verified against `Main.lean` | subtraction / cast |
|---|---|---|---|
| 1 | `PStatement m K n` | `descFactorial n (2n−K−1) ≥ 2^(2n−K−1) · descFactorial (m+n−K−1) (2n−K−1)` — imported, byte-identical | ℕ-subtraction, truncation neutralised downstream by `hs`/`hq` (below) |
| 2 | `Afac K i` | `∏_{l ∈ range i} (X + C((K:ℤ)+1−(l:ℤ)))` = `A_i(t) = ∏_{l<i}(t+K+1−l)` | the `K+1−l` is **ℤ**-subtraction: no truncation, may legitimately be negative when `i > K+1` |
| 3 | `Bfac j i` | `∏_{l ∈ Ico (i+1) (j+1)} (X + C(l:ℤ))` = `B_i(t) = ∏_{i<l≤j}(t+l)`; empty (= 1) when `i ≥ j` | none |
| 4 | `IsHard K i` | `K + 1 < 2i` | none |
| 5 | `partner K i` | `K + 1 − i` | **ℕ-subtraction**; truncates iff `i > K+1`. Every use site first establishes `i ≤ m ≤ K+1`, so no use truncates. Checked below. |
| 6 | `Wcoef m i` | `2^i · Nat.choose m i` | none; `= 0` for `i > m` |
| 7 | `NjTerm K m j i` | `(((K:ℤ)+1−2(i:ℤ)) · (Wcoef m i : ℤ)) • (Afac K i * Bfac j i)` | `K+1−2i` is **ℤ**-subtraction: the negative coefficients at hard indices are genuine, not truncated to 0 |
| 8 | `Nj K m j` | `∑_{i ∈ range (j+1)} NjTerm K m j i` | none |
| 9 | `CoeffNonneg p` | `∀ n, 0 ≤ p.coeff n` — the seat's `Nonneg`, renamed per repair (1) | none |

The contract's informal statement renders these as
`Nj K m j = Σ_{i≤j} (K+1−2i)·2^i·C(m,i)·A_i(t)·B_i(t)` with
`A_i(t) = Π_{l<i}(t+K+1−l)` and `B_i(t) = Π_{i<l≤j}(t+l)`. That is the
compiled object exactly, index range for index range, with the two
subtractions in ℤ. **No ℕ-truncation occurs anywhere in the statement of the
claim.**

### Imported sixth award (entries 1, 10–21) — byte-identity verified

Every one of the thirteen entries of
`SOURCE/originating-award-ScalarCoreImport.lean` (itself the sealed Cycle 5
award run's `Main.lean`, SHA-256 `55d57358…`, the digest the brief names) was
compared body-for-body against its counterpart in this project. **Twelve are
byte-identical** (entries 1, 10–20, i.e. `PStatement`,
`discriminant_factorization`, `discriminant_in_K_matches_in_d`,
`discriminant_nonpos_iff`, `S_quadratic_nonneg_of_discriminant_nonpos`,
`S_holds_of_discriminant_nonpos`, `S_holds_on_region`, `P_base_s1`,
`P_base_s2`, `P_induction_step_critic`, `P_holds_critic`,
`P_holds_critic_general`). The thirteenth, entry 21
`matchingDual_scalarCore_award`, differs in **exactly one token** — the head
keyword `theorem → lemma` — as disclosed deviation (1). `lemma` is a Lean 4
macro synonym for `theorem`: no type, proof term or elaboration changes. The
byte-identity claim on the award's face is therefore true as stated, with that
one disclosed keyword exception which the report and `INFORMAL-PROOF.md` §11
both name.

The imported chain's own mathematics was recomputed rather than trusted:

- `discriminant_factorization`: `9d² + 12(m+1)d − 12(m+1)² = 3(3d−2(m+1))(d+2(m+1))` — verified as an integer identity over `|m|,|d| ≤ 40`, zero failures.
- `discriminant_in_K_matches_in_d`: `9(2m−d)² − 12((2m−d)+1+4(2m−d)m−4m²)` equals the `(m,d)` form — verified over the same range, zero failures.
- `discriminant_nonpos_iff`: on `m,d ≥ 0` the factor `d+2(m+1) > 0`, so the product `3(3d−2(m+1))(d+2(m+1)) ≤ 0 ⟺ 3d ≤ 2m+2`. Both directions checked; the positivity of the second factor is the load-bearing step and holds for every `m,d ≥ 0`.
- `S_quadratic_nonneg_of_discriminant_nonpos`: the sum-of-squares certificate `12(3n²−3Kn+C) = (6n−3K)² − Δ` with `Δ = 9K² − 12C` — verified as an identity over `|K|,|m|,|n| ≤ 30`, zero failures. `Δ ≤ 0` therefore forces the quadratic `≥ 0`.
- `S_holds_of_discriminant_nonpos`: `(n+1)(K+1−n) − 4(m+n−K)(m−n) = 3n² − 3Kn + (K+1+4Km−4m²)` — verified as an identity over the same range, zero failures. So `(S)` **is** the quadratic, not merely implied by it, and the chain is an equivalence, not a lossy bound.
- `P_holds_critic` / `P_holds_critic_general`: `(P)` at every hard index `n ≤ m` on the region. Verified directly as an exact-integer statement for every in-region `(m,d)` with `m ≤ 40` and every hard `n ≤ m` — **zero failures**. The `m ≤ K+1` hypothesis really is redundant given `K ≤ 2m` and the region (see `region_le` below).
- ℕ-subtraction audit of the induction step (entry 18): `hs : 2(n+1)−K−1 = (2n−K−1)+2` needs `K+1 ≤ 2n`, supplied by `hhard`; `hq : m+(n+1)−K−1 = (m+n−K−1)+1` needs `K+1 ≤ m+n`, which follows from `hhard` and `n+1 ≤ m` (`m+n ≥ 2n+1 > K+2`); `hns : n−s = K+1−n` needs `n ≤ K+1`, supplied by `hnK : n ≤ K` (from `hKm`, `hnm`); `hqs : q−s = m−n` and `hq1 : q+1 = m+n−K` likewise. Every one of the three ℕ→ℤ casts (`h1`, `h2`, `h3`) is guarded by an explicit `Nat.cast_sub` side condition that the context discharges. **No truncation is exploited and none is hidden.**

Entry 21 (`matchingDual_scalarCore_award`) is registered for the record; it is
**not** a dependency of the terminal theorem (the contract's dependency graph
routes `def-nj-nonneg-general` through `def-p-holds-critic-general`, not
through the conjunction). The `descProd` toolkit the Cycle 5 fences exclude
occurs **zero times in code** in this project — its three textual occurrences
are all inside imported doc comments that state the exclusion; no declaration
named `descProd` exists here.

### Seat U1 apparatus (entries 22–42)

All twenty-nine seat declarations of `SOURCE/originating-seat-U1-Main.lean`
were compared line-for-line with their registered counterparts. Every one
matches under exactly the disclosed mechanical transforms and nothing else:
`Nonneg → CoeffNonneg` and `Nonneg.xxx → CoeffNonneg_xxx` (repair (1),
deviation (3)); `noncomputable def X` split across two lines (deviation (2),
applying to `Afac`, `Bfac`, `NjTerm`, `Nj`); `theorem → lemma` (deviation
(1)). The seat's source confirms the renaming account in `INFORMAL-PROOF.md`
§2 literally: the file declares `def Nonneg` and seven `theorem Nonneg.add /
.zero / .sum / .mul / .one / .prod / .smul`, while `NonnegLinFac`,
`NonnegBfacFn`, `NonnegAfacFn`, `NonnegEasyTerm`, `NonnegPairedBlock` are flat
identifiers that were **not** dot-namespace members and are correctly left
unrenamed.

The mathematics, step by step, each recomputed:

**`Afac_split` / `Bfac_split`.** `Finset.prod_Ico_consecutive` at
`0 ≤ i' ≤ i` and `i'+1 ≤ i+1 ≤ j+1`. Both hypotheses are supplied at every
call site.

**`extra_eq` — the combinatorial heart.** The claim is the polynomial identity
`∏_{l ∈ Ico i' i} (X + C((K:ℤ)+1−l)) = ∏_{l ∈ Ico (i'+1) (i+1)} (X + C l)` for
`i + i' = K+1`, `i' ≤ i`. The proof first rewrites the integer constant
`(K:ℤ)+1−(l:ℤ)` as the cast `((K+1−l : ℕ) : ℤ)`. **This cast is the one place
a ℕ-subtraction is introduced deliberately, and it is guarded**: `hl2 : l ≤
K+1` is derived by `omega` from `l < i` and `i ≤ K+1` (the latter from
`hsum`). With the guard, `Nat.cast_sub` applies and the two expressions agree.
The reindexing is then `Finset.prod_Ico_reflect` at `n := K+1` with
`e1 : K+2−i = i'+1` and `e2 : K+2−i' = i+1`, both forced by `i+i' = K+1`.
Independently checked: under `l ↦ K+1−l`, as `l` runs `i'..i−1` the image runs
`i'+1..i`, which is exactly the right-hand index set. The Mathlib side
condition `i ≤ K+2` holds since `i ≤ K+1`.

**`reflection_identity_poly`.** `A_i B_i = A_{i'} B_{i'}` **as polynomials**
(not pointwise in `t`) for `i+i' = K+1`, `i' ≤ i ≤ j`. This is `Afac_split` ·
`Bfac_split` · `extra_eq` · `ring`. Independently recomputed as an exact
polynomial identity over every `K ≤ 25`, `j ≤ 15` and every admissible pair
`(i, i')` — **zero failures**.

**`region_le` — the region fact, derived not assumed.** `K + d = 2m` and
`3d ≤ 2m+2` give `m ≤ K+1`. Verified: `3K ≥ 4m−2 ≥ 3m−3` for every `m ≥ 0`.
Exhaustively confirmed for `m ≤ 399` and every in-region `d` — zero
counterexamples. This is the only channel through which `hKd` and `hregion`
reach the pairing argument, and it is proved once and reused.

**`partner_spec` — the pairing bijection.** For hard `i ≤ m`: `partner K i < i`
(⟺ `K+1 < 2i`, the hardness hypothesis); `partner K i ≤ m` (since
`partner < i ≤ m`); `¬IsHard K (partner K i)` (⟺ `2i ≥ K+1`, weaker than
hardness); `i + partner K i = K+1` (needs `i ≤ K+1`, supplied by
`i ≤ m ≤ K+1` from `region_le`). Since `i ≤ K+1` at every use, the
ℕ-subtraction in `partner` never truncates. All four conclusions verified
exhaustively for every `K ≤ 119`, every `m ≤ K+1` and every hard `i ≤ m` —
**zero counterexamples**.

**Why the general-`j` lift is immediate.** `partner_spec`'s *first* conclusion
is `partner K i < i`. For a hard `i ≤ j` this already gives
`partner K i < i ≤ j`, so the partner lies in `Finset.range (j+1)` for
**every** `j`, with no `j`-specific hypothesis whatsoever. This is the exact
point at which the seat's Stage 3 return believed a further, possibly
unavailable lemma was needed, and both critics independently showed the seat's
own `partner_spec` already supplies it. The audit confirms it: the only place
the seat's `j = m` assembly used `h ≤ m` where `h ≤ j` also holds is the
`hij` argument of `NonnegPairedBlock`, and the general proof passes `hhj`
there in place of `hhm`. Nothing else changes.

**`partner_injOn`.** `partner K` is injective on `[0, K+1]` because
`K+1−i₁ = K+1−i₂` with `i₁, i₂ ≤ K+1` forces `i₁ = i₂` (no truncation in
range). Every hard index used is `≤ m ≤ K+1`.

**`term_sign`.** `W_i ≤ W_{i'}` on a hard/easy pair. The ℕ-subtraction
rewrites are `hs : 2i−K−1 = i−i'` (needs `i' ≤ i`, from `hlt`) and
`hq : m+i−K−1 = m−i'` (needs `i' ≤ m`, from `i' < i ≤ m` — this is where the
otherwise unused `him : i ≤ m` enters). With those, `(P)` reads
`descFac(i, i−i') ≥ 2^{i−i'}·descFac(m−i', i−i')`. Multiplying by
`descFac(m,i')·i'!` and using `Nat.factorial_mul_descFactorial`
(`i'!·descFac(i,i−i') = i!`) and `Nat.descFactorial_mul_descFactorial`
(`descFac(m−i',i−i')·descFac(m,i') = descFac(m,i)`) and
`Nat.descFactorial_eq_factorial_mul_choose` twice yields
`i!·i'!·C(m,i') ≥ 2^{i−i'}·i!·i'!·C(m,i)`; cancelling the strictly positive
`i!·i'!` gives `2^{i−i'}·C(m,i) ≤ C(m,i')`, and `2^i = 2^{i'}·2^{i−i'}`
(valid since `i' ≤ i`) converts this to `Wcoef m i ≤ Wcoef m i'`. **Every
equality in this chain is an identity, not a bound**, and each was recomputed.
The conclusion itself was verified exhaustively: every in-region `(m,d)` with
`m ≤ 60` and every hard `i ≤ m` satisfies `Wcoef m i ≤ Wcoef m (K+1−i)` —
**zero failures**. Off the region the same inequality fails **28,857 times**
on the same grid (smallest: `m = 1, d = 2, K = 0, i = 1, i' = 0`, `W_i = 2 >
1 = W_{i'}`), which exhibits the region hypothesis as genuinely load-bearing
for this lemma and not merely a convenience.

**Closure lemmas `CoeffNonneg_add/_zero/_sum/_mul/_one/_prod/_smul`.** Each is
the direct coefficient computation (`coeff_add`, `finsetSum_coeff`,
`coeff_mul` as a nonneg sum of products, `coeff_one`, `coeff_smul`) plus
`Finset.prod_induction` for `_prod`. `CoeffNonneg_mul` is sound because the
convolution `∑_{a+b=n} p_a q_b` is a sum of products of nonnegatives — this
requires both factors coefficientwise nonneg and is applied only so.

**`NonnegLinFac` / `NonnegBfacFn` / `NonnegAfacFn`.** `X + C x` for `x : ℕ`
has coefficients `x, 1, 0, 0, …`, all `≥ 0`. `Bfac j i` is a product of such
factors unconditionally. `Afac K i` is such a product **only under
`i ≤ K+1`**, which is exactly `NonnegAfacFn`'s hypothesis `hKi`; the proof
guards the cast `(K:ℤ)+1−l = ((K+1−l : ℕ):ℤ)` with `hl2 : l ≤ K+1` derived
from `l < i ≤ K+1`. Without `i ≤ K+1` the lemma is false (a factor would have
a negative constant term), and the hypothesis is never dropped at any call
site.

**`NonnegEasyTerm`.** For easy `i` (`2i ≤ K+1`) with `i ≤ K+1`, the scalar
`(K:ℤ)+1−2i ≥ 0` and `Wcoef ≥ 0`, so the smul of a `CoeffNonneg` product is
`CoeffNonneg`.

**`NonnegPairedBlock` — the term-sign lemma made polynomial.** With
`i+i' = K+1` and `K = i+i'−1` (in ℤ, via a guarded `exact_mod_cast`):
`(K:ℤ)+1−2i = −(i−i')` and `(K:ℤ)+1−2i' = i−i'`. Using the reflection identity
to replace `A_i B_i` by `A_{i'} B_{i'}`, the pair collapses to
`((i−i')·(W_{i'} − W_i)) • (A_{i'} B_{i'})`. This seat recomputed the collapse
symbolically and confirms it: `−(i−i')W_i + (i−i')W_{i'} = (i−i')(W_{i'}−W_i)`.
The scalar is `≥ 0` by `hlt` and `term_sign`; the polynomial is `CoeffNonneg`
by `NonnegAfacFn hi'K` and `NonnegBfacFn`. `hij : i ≤ j` enters only through
the reflection identity; `hi'K : i' ≤ K+1` only through `NonnegAfacFn`.

**`Nj_nonneg` (entry 42, the seat's `j = m` assembly).** `Finset.range (m+1)`
is split into hard `H` and easy `E` by
`Finset.sum_filter_add_sum_filter_not`; `EH := image (partner K) H ⊆ E` (each
partner is easy and `< h ≤ m`); `E` splits as `(E \ EH) ⊎ EH` by
`Finset.sum_sdiff`; `Finset.sum_image` with `partner_injOn` reindexes the `EH`
sum back onto `H`; `Finset.sum_add_distrib` and `abel` regroup. The result is a
sum of `NonnegEasyTerm` pieces and `NonnegPairedBlock` pieces only. **The
partition is genuinely disjoint**: `partner K h < h` is strict, so no index is
its own partner, and `H` (hard) and `EH ⊆ E` (easy) are disjoint by
definition — no term is double counted and none is dropped.

### Critic-attributed lift (entries 43–46)

Compared against `SOURCE/originating-critic-U1-F-CriticF.lean` (PRIMARY, four
declarations) declaration by declaration:

- **entry 43 `partner_mem_range`** — identical under the rename. It states
  `partner K i < j+1` for hard `i ≤ j`, from `partner_spec` plus `omega`. It
  is registered and correct, and is *not itself invoked* by
  `Nj_nonneg_general`, which re-derives the same `omega` step inline from
  `partner_spec`. The contract's dependency graph records this accurately
  (`def-partner-mem-range` has no outgoing edge to `def-nj-nonneg-general`),
  and `INFORMAL-PROOF.md` describes it as the step the return believed missing
  — which is what it is. No misstatement.
- **entry 44 `Nj_nonneg_general`** — identical under the rename. The proof is
  the seat's `Nj_nonneg` verbatim with `Finset.range (m+1) ↦ Finset.range
  (j+1)` and `h ≤ m` replaced by `h ≤ j ≤ m` (via `le_trans`) at the two
  points where `h ≤ j` now also holds. This seat diffed the two assemblies
  line by line and confirms: no new lemma, no extra hypothesis, no changed
  proof term anywhere else.
- **entry 45 `Nj_nonneg_is_instance`** — the one disclosed reordering. The
  source proves it as `Nj_nonneg_all_index hKd hregion m le_rfl`; the project
  proves it as `Nj_nonneg_general hKd hregion (le_refl m)`. Since
  `Nj_nonneg_all_index := fun _ hjm => Nj_nonneg_general hKd hregion hjm`, the
  first β-reduces to the second and `le_rfl` is notation for `le_refl _`; the
  two proof terms denote the same value. The reordering removes entry 45's
  dependence on the terminal declaration — required because the registrar
  permits nothing after the single terminal `theorem` — and introduces no
  cycle (verified: no entry references `Nj_nonneg_all_index` in code except
  entry 46).
- **entry 46 `Nj_nonneg_all_index`** — statement and proof term byte-identical
  to `CriticF.lean`'s, differing only by the `lemma → theorem` promotion that
  makes it the project's single terminal declaration.

`SOURCE/originating-critic-U1-T-CriticGeneralJ.lean` was read and reaches the
same general-`j` statement in the separate namespace
`ErdosR25.E1CoeffWiseCriticT`, plus the sharpened variant
`Nj_nonneg_general_of_P` (everything except `P_holds_critic_general` goes
through from `m ≤ K+1` alone, with `partner_spec` inlined). It is not
registered here, consistent with the record.

### Where each hypothesis enters, and whether it is load-bearing

| hypothesis | enters at | load-bearing? |
|---|---|---|
| `hKd : K + d = 2m` | `region_le` (→ `m ≤ K+1`), and `hd0`/`hreg'` feeding `P_holds_critic_general` | **Yes.** Dropping it while keeping the region admits e.g. `K = 0, d = 0, m = 1, j = 1`, where `N_1 = −t−1`. Many further counterexamples found. |
| `hregion : 3d ≤ 2m+2` | `region_le`, and `hreg'` feeding `P_holds_critic_general` | **Yes, and exactly sharp.** 273 off-region `(m,K,d)` cells at `m ≤ 20` carry a failing `j`; smallest is `(m,d) = (1,2)`. |
| `hjm : j ≤ m` | `le_trans hhj hjm` supplying `h ≤ m` to `partner_spec` and to `P_holds_critic_general` | **Load-bearing for the proof, not for the truth of the conclusion on the grid tested** — see the critic pass. It is never dropped and the claim is stated with it, so this is a harmless conservatism, not an overclaim. |

## Reproduced Mathematical Evidence

Every numeric claim below was produced by this seat's own exact-integer code,
written from scratch under `scratchpad/c6-s7-informal-LA3/`, importing no prior
evaluator (in particular **not**
`EVIDENCE/verify_nj_coefficientwise_nonneg.py`, which was read only to check
its import list and output-field discipline). Python standard library only;
explicit import lists at the top of each file; deterministic; no wall-clock,
PID or host field in any output.

| file | SHA-256 |
|---|---|
| `audit_eval.py` | `1eba163446b6ec1718efd1e37a624ae96c4954312917a64966f0326f48a3461e` |
| `audit_eval.out.json` | `77a4f767b55d33f9b07a609c96f85afa953db0a6df3a7aff43400f18835d282d` |
| `critic_pass.py` | `080cd659262f2963e1cceaa415911f35edc7b16384ace3452c3b843ca272e6b3` |
| `critic_pass.out.json` | `99c1b2699d5a04accdabe80bd225963a0c378d3a701967039e662f0380643e77` |
| `ring_identities.py` | `6148d93c2ee37c7977e179c7584cd93eaad17725da7e03d9b64a1108604fa58e` |
| `ring_identities.out.json` | `795b5c19c3d5cd77e56c6d003c9c712f51e66e6d195c6392a268cfcc966ce1c4` |

`audit_eval.py` builds `N_j` by **two structurally independent paths** and
requires them to agree: (1) coefficient-list convolution of the linear factors;
(2) evaluation of `N_j(t)` as a plain integer product-sum at
`t = 0, 1, …, deg` followed by exact rational Lagrange interpolation
(`fractions.Fraction`), asserting integrality of the recovered vector. The two
paths agree on **5,818 cells** (every in-region cell with `m ≤ 14`, plus
`m ∈ {20,25,30,35,40,45}`) with zero disagreements.

1. **In-region sweep.** Every `(m, K, j)` with `K + d = 2m`, `3d ≤ 2m+2`,
   `1 ≤ m ≤ 45`, `0 ≤ j ≤ m`: **23,055 cells**, reproducing the cell count the
   brief's condition (iv) names exactly, with **zero coefficientwise
   failures**. The `m = 0` boundary the Lean statement also admits was checked
   separately: `Nj 0 0 0 = 1`, `CoeffNonneg`.
2. **Off-region witness.** `(m,d) = (1,2)`, `K = 0`, `j = m = 1`:
   `N_1 = −t − 1`, coefficients `[−1, −1]` low-to-high, confirmed on both
   paths. It is genuinely off-region (`3·2 = 6 > 4`). This reproduces the
   sharpness witness the award records as evidence.
3. **Off-region sweep — sharpness in the strong sense.** Every off-region cell
   with `1 ≤ m ≤ 30` at the strongest index `j = m`: **610 cells, every single
   one carries a negative coefficient.** This independently corroborates the
   synthesis's phrasing ("at every off-region cell tested `N_m` has a negative
   coefficient; smallest witness `(m,d) = (1,2)`").
4. **Leading coefficient.** `[t^m] N_m = 3^{m−1}(2m − 3d + 3)` for every
   `1 ≤ m ≤ 30` and every `d ≤ 2m` — zero mismatches. On the region this is
   `≥ 3^{m−1} > 0`; at `3d = 2m+3` it is exactly `0`; beyond, negative. This is
   the registry's stated leading coefficient `m!·3^{m−1}(2m−3d+3)` divided by
   `m!`, and it is the reason the region is exactly the region.
5. **Boundary family.** At `3d = 2m+3` (so `m ≡ 0 mod 3`),
   `[t^{m−1}] N_m = −4m·3^{m−3}` for `m = 3, 6, …, 30` — zero mismatches. The
   values `−12, −648, −26244, −944784, −31886460, −1033121304, −32543321076,
   −1004193907488` reproduce, term for term, the eight-value sequence the
   Stage 4 critique C-U1-F records as its third independent confirmation of
   `Q_{m,d} = m!·N_m`. **This seat therefore independently corroborates the
   `j = m` alias to `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` at two
   distinct coefficient families**, which is what makes the two-registry-key
   statement on the award's face correct.
6. **`region_le`** — no counterexample for `m ≤ 399` and every in-region `d`.
7. **`partner_spec`** (all four conclusions) — no counterexample for
   `K ≤ 119`, `m ≤ K+1`, every hard `i ≤ m`.
8. **`term_sign`** — no counterexample on-region for `m ≤ 60`; **28,857**
   counterexamples off-region on the same grid, exhibiting the region as
   load-bearing for this lemma specifically.
9. **`PStatement`** (the imported award's `(P)`) — no counterexample for every
   in-region `(m,d)` with `m ≤ 40` and every hard `n ≤ m`.
10. **Reflection identity** as a *polynomial* identity — no counterexample for
    `K ≤ 25`, `j ≤ 15`, every admissible `(i, i')`.
11. **Ring identities** of the imported chain (discriminant factorisation,
    the `K`-to-`d` match, the sum-of-squares certificate, and `(S)` = the
    quadratic form) — zero failures over `|m|,|d| ≤ 40` and `|K|,|m|,|n| ≤ 30`.

The producer's own generator `EVIDENCE/verify_nj_coefficientwise_nonneg.py`
reports `in_region_total_cells: 23055`, `in_region_failure_count: 0`,
off-region witness `[-1, -1]`, `all_checks_passed: true`. **This seat's
independent recomputation agrees with it on every reported figure.** Its import
list (`json`, `hashlib`, `math.comb`) is explicit at the top and its JSON
output carries no wall-clock, PID or host field, satisfying condition (iv).

**Axioms (condition (v)).** `EVIDENCE/axiom-check-all-declarations.txt`
contains a `#print axioms` line for **every one of the 46 registered
declarations** — no declaration is missing, and no printed name is absent from
the registry. Every axiom set is a subset of `{propext, Classical.choice,
Quot.sound}`: 2 declarations (`IsHard`, `partner`) depend on none, 2
(`PStatement`, `Wcoef`) on `propext`, 8 on `[propext, Quot.sound]`, and 34 on
all three, including the terminal theorem. Zero `sorryAx` anywhere. `Main.lean`
contains zero occurrences of `sorry`, `admit`, `native_decide`, and zero
`axiom` declarations. The mandated axiom sentence is present and reads "within
the three standard axioms".

## Independent Critic Pass

Run as a separate pass over this auditor's own ledger, after the ledger was
closed, with its own script (`critic_pass.py`, output `critic_pass.out.json`,
exit 0 / all predicates clean). It attacked the following:

1. **Is any hypothesis decorative?** `hKd` and `hregion` are both load-bearing
   with explicit counterexamples on dropping (above). `hjm : j ≤ m` is the
   interesting case: because `Wcoef m i = 2^i·C(m,i)` vanishes for `i > m`, the
   sum over `range (j+1)` gains nothing but additional positive `B_i` factors
   when `j > m`. Testing **840 cells** with `m ≤ 20` and `m < j ≤ m+5` on the
   region found **no failure** — so the conclusion appears to hold for `j > m`
   too, and `hjm` is load-bearing for the *proof* (it is what lets
   `partner_spec` and `P_holds_critic_general` see `h ≤ m`) but not, on this
   grid, for the *truth* of the conclusion. **This is a conservatism, never an
   overclaim**: the theorem asserts less than may be true, and the claim under
   audit is stated with `hjm` exactly as the synthesis requires. No action.
2. **Is the conclusion vacuous anywhere?** No: no in-region cell with
   `1 ≤ m ≤ 15` has `N_j` identically zero, so `CoeffNonneg` is a substantive
   assertion at every cell, not a triviality about a zero polynomial.
3. **Circularity in the registration order.** No entry references
   `Nj_nonneg_all_index` in code except entry 46 itself; entry 45's only
   mention is doc-comment prose. The contract's dependency graph is acyclic by
   topological sort with no dangling endpoint. Clean.
4. **Excluded dependencies actually excluded.** Zero occurrences of
   `Erdos993G1`, zero code occurrences of `descProd`, zero `SimpleGraph`,
   `indepCount`, `Δ_k` or `firstDescent` **as Lean code**. The three textual
   hits (`SimpleGraph`, `indepCount`, `Δ_k`, one each) are all on the *same
   single line* — line 391, inside the imported sixth award's
   `matchingDual_scalarCore_award` doc comment, which is prose *stating* the
   fence, reproduced byte-identically. `delta` and `firstDescent`: zero hits of
   any kind. This confirms `INFORMAL-PROOF.md` §6's `grep` accounting exactly.
5. **Is `r` smuggled in as a Lean identifier?** No binder anywhere in
   `Main.lean` is named `r`. Repair (2) is therefore discharged the way the
   adjudicator asked: as a statement about *use* in the contract's
   `informal_statement` and `INFORMAL-PROOF.md` §3, not as a Lean declaration.
   The substitution argument itself is sound: `CoeffNonneg` is
   substitution-free, so it yields `0 ≤ (Nj K m j).eval t` for every integer
   `t ≥ 0`, hence at `t = r − K` for every `r ≥ K`; and on the region
   `m ≤ K+1`, so `r ≥ K` already implies `r ≥ m−1`. `INFORMAL-PROOF.md` §3 is
   explicit that the evaluation corollary itself is *not* formalized here and
   belongs to clause (b) — correctly fenced.
6. **Does the audited proof over-claim independence of the two critic
   proofs?** Reading both critic sources, C-U1-T's `Nj_nonneg_general` and
   C-U1-F's are textually close (both are the same minimal edit of the seat's
   assembly — which is exactly what both critiques argue the situation is).
   `INFORMAL-PROOF.md` claims only that each was "independent, separately
   kernel-verified", which is a provenance claim about separately-seated,
   separately-compiled work, and is true. It does not assert methodological
   dissimilarity. C-U1-T additionally carries `Nj_nonneg_general_of_P`, which
   *is* a genuinely different statement. The joint attribution the synthesis
   mandates is correctly carried. **Precision note recorded, not a defect.**
7. **`INFORMAL-PROOF.md` §7 / §1, the "dropped constant" literal.** §7 says
   the dropped positive constant is `(j+1)!` at index `j` "(equivalently `m!`
   at `j = m`, per the alias above)". Taken literally `(j+1)!` at `j = m` is
   `(m+1)!`, not `m!`; the two figures come from two different relations
   (`ε_{j+1}·D_{j+1} = (j+1)!·N_j` versus the cleared `Q_{m,d} = m!·N_m`), so
   "equivalently" is loose. **The wording is reproduced verbatim from Stage 4
   critique C-U1-F finding F5, which the adjudicator admitted**, so the
   formalizer transmitted it faithfully rather than introducing it. It is
   immaterial to the audited claim: no factorial occurs in any Lean object
   (`Wcoef m i = 2^i·C(m,i)` carries no dropped factor in the formal
   development), the constant is positive and independent of `i` and `t` on
   either reading — which is all the sign argument uses — and the load-bearing
   alias `Q_{m,d} = m!·N_m` is the one this seat independently confirmed at
   two coefficient families. **Precision note recorded, not a defect in the
   proof of the intended claim.**
8. **`INFORMAL-PROOF.md` §9 / contract `constructivity.rationale`, the axiom
   enumeration.** Both list the `[propext, Quot.sound]`-only group as
   `PStatement`, `Wcoef`, `discriminant_factorization`,
   `discriminant_in_K_matches_in_d`, `P_base_s1`, `region_le`,
   `partner_spec`, `partner_injOn`, `partner_mem_range`, then say "every other
   declaration … on the full `[propext, Classical.choice, Quot.sound]`". The
   sweep file shows **`CoeffNonneg` also sits in the `[propext, Quot.sound]`
   group** (8 declarations there, 34 on the full three, not 35). The
   enumeration therefore over-attributes one definition's axiom dependence.
   The direction is conservative — it claims *more* axiom use than the kernel
   reports, never less — and condition (v) is untouched: every declaration is
   axiom-printed, every axiom set is a subset of the three, and the mandated
   sentence reads "within the three standard axioms". **Precision note
   recorded, not a defect.**
9. **`EVIDENCE/nj-coefficientwise-nonneg-check.out.json` is not parseable as
   JSON**: the generator appends a trailing human-readable
   `SHA-256 of the above JSON: …` line after the JSON payload. The digest line
   is deterministic (no wall-clock/PID/host), the JSON body is intact and its
   figures are correct, and every figure in it was independently reproduced
   here. **File-naming blemish, recorded; not a defect in the mathematics or a
   breach of condition (iv).**
10. **Was the intended theorem quietly changed to obtain compilation?** No.
    The compiled terminal statement is byte-identical to the contract's
    `expected_statement` and arrangement-identical to the synthesis Dispatch 3
    and adjudication "Contract-ready group 2" displays, modulo only the
    mandated `Nonneg → CoeffNonneg` rename. Both mandated repairs are applied;
    exactly one terminal declaration is bound; no hypothesis was added,
    strengthened or silently relaxed.

No item of the critic pass produced a defect. Three precision notes (items 6,
7, 8) and one file-hygiene note (item 9) are recorded above; none of them is a
step in the proof of the intended claim, none weakens the award, and none
over-states the mathematics.

## Scope and Fence Check

Checked sentence by sentence against the formalizer brief §2 (itself the
synthesis `## Lean awards` "Dispatch 3" text) and §3. Each mandated element is
present both in the contract's `informal_statement` and in
`INFORMAL-PROOF.md`:

- **Uniform in `d`, `m` AND `j`.** Present. The theorem quantifies over all
  `m, K, d : ℕ` and all `j ≤ m`; no numeral is fixed.
- **No horizon, no census.** Present. Nothing in the corpus is a finite check;
  the exact-integer sweeps are evidence only, and are named as such.
- **`ν`, `τ`, `x(F) < r` nowhere.** Verified: none occurs in `Main.lean`.
- **No G1 graph object.** Verified: zero `Erdos993G1` identifiers, zero
  `SimpleGraph`/`indepCount`/`Δ_k` **as code** (the three prose hits are one
  imported doc-comment line), zero `delta`, zero `firstDescent`. No declaration
  is typed over a graph. Consequently no `SOLUTION-CONTRACT.md` §3 fixed point
  (C1, C2, C3, `P_8`, the second band) is exhibited or could be contradicted,
  as `INFORMAL-PROOF.md` §6 states.
- **Clause (a) ONLY.** Present on both faces, in those words.
- **Clause (b) formalised NOWHERE** — `μ_j^g(t) ≥ 0`, denominator positivity,
  clamp persistence — and specifically the evaluation corollary
  `CoeffNonneg p → 0 ≤ p.eval t` is *not* formalized here. Verified: no such
  declaration exists in `Main.lean`. Present on both faces.
- **The registered claim as a whole stays `proved_informal`**, and "the
  coefficientwise positivity lemma is formal" **must never be shortened** to
  "the all-index dual positivity claim is formal". Present verbatim on both
  faces.
- **The `j = m` instance IS the sufficiency half of
  `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`** (`Q_{m,d} = m!·N_m`) —
  **two registry keys, not one**. Present on both faces, and independently
  corroborated here at two coefficient families.
- **The CONVERSE half of that `iff` is NOT formalised.** Present on both faces.
  Verified: nothing in the corpus proves `CoeffNonneg (Nj K m m) → 3d ≤ 2m+2`.
- **Bears NOT AT ALL on `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`, which stays
  OPEN.** Present on both faces.
- **The region `3d ≤ 2m+2` is exactly sharp, off-region witness
  `(m,d) = (1,2)`: `N_1 = −t−1` — evidence, NOT on the theorem's face.**
  Correctly placed: the terminal declaration states only the `3d ≤ 2m+2 →`
  direction; sharpness lives in `INFORMAL-PROOF.md` §6/§8, in `EVIDENCE/`, and
  in this audit. Independently reproduced (610/610 off-region cells).
- **No `sorry`, `admit`, `native_decide`; axioms within the three standard
  ones.** Verified.
- **Condition (i), attribution, on the award's face.** Seat U1 for the
  apparatus and the `j = m` assembly; the general-`j` lift critic-attributed
  jointly to C-U1-T and C-U1-F; the imported sixth award's induction step
  C-U1-F (primary, toolkit-free) / C-U1-T (induction-principle scaffold) of
  Cycle 5, already on that award's own face and reproduced unchanged
  (byte-identity verified). All present in `INFORMAL-PROOF.md` §10 and in the
  contract's scope text. This seat cross-checked each attribution against the
  four digest-bound sources: every declaration attributed to U1 is in the
  seat's file, every declaration attributed to the critics is in
  `CriticF.lean`, and the sixth award's material is byte-identical to
  `ScalarCoreImport.lean`.
- **Condition (ii), scope exclusions in `INFORMAL-PROOF.md` and the contract's
  `informal_statement`.** Present in both, as itemised above.
- **Condition (iii), the two mandatory repairs.** (1) `Nonneg → CoeffNonneg`
  and the seven dot-namespace lemmas renamed — applied, with the flattening to
  `CoeffNonneg_*` disclosed and justified (the registrar's leaf-matching regex
  cannot accept a dotted head); the Mathlib root-`Nonneg` collision is
  genuinely removed. (2) The `t = r − K` substitution stated in the contract's
  `informal_statement` and in `INFORMAL-PROOF.md` §3, with `m ≤ K+1` from
  `region_le` so `t ≥ 0` implies `r ≥ m−1` — present and mathematically
  correct. Exactly one terminal declaration is bound.
- **Condition (iv), digested exact-integer generator under `EVIDENCE/`.**
  Present, explicit import list, no wall-clock/PID/host field, 23,055 cells,
  zero failures, off-region witness included — all figures independently
  reproduced here.
- **Condition (v), `#print axioms` on every named declaration.** Present for
  all 46; no anonymous `example` is offered as evidence.

**Nothing fenced is asserted.** The claim asserts no graph, forest, G1 tuple,
tier, FOREST, TREE, TRANSFER or Erdős #993 statement; no matching schema; no
certificate-existence claim; no horizon or census result; no sharpness on the
theorem's face; and no clause (b) content.

## Verdict

**passed**

`INFORMAL-PROOF.md` is a correct and complete proof of the contract's
`theorem.informal_statement`, at statement-level granularity. Every definition
matches the compiled Lean source literally; every hypothesis is accounted for
and enters where the proof says it enters; every ℕ-subtraction and every
ℕ→ℤ cast is guarded by a side condition the context discharges, and none is
exploited; every equality used in the term-sign and reflection chains is an
identity, recomputed here and confirmed; the imported sixth award is
byte-identical in twelve of thirteen entries with the thirteenth differing only
by the disclosed `theorem → lemma` keyword; nothing marked NOT a dependency is
a dependency; and the terminal declaration's hypotheses match the claim
one-for-one. The independent exact-integer recomputation — by two structurally
different construction paths — reproduces every numeric figure the record
states, including the 23,055-cell count, the zero failure count, the off-region
witness `N_1 = −t−1`, the leading-coefficient formula and the eight-value
boundary-family sequence. All fences of the formalizer brief §2 and all five
conditions of its §3 are satisfied, on the faces required.

Three precision notes and one file-hygiene note are recorded in the critic
pass (items 6, 7, 8 and 9). None is a defective step: item 7 is a loose
"equivalently" transmitted verbatim from the admitted Stage 4 critique about a
constant that appears in no Lean object and in no inference of the claim; item
8 over-attributes one definition's axiom dependence in a conservative
direction while every mandated axiom condition holds exactly; item 6 is a
provenance claim that is true as written; item 9 concerns a trailing digest
line appended to a `.json` evidence file whose payload and figures are correct
and independently reproduced. None of the four weakens the award, overstates
the mathematics, or crosses a fence, and this seat repaired nothing.

*Model disclosure: independent informal proof-integrity reviewer
`c6-la3-fable-informal-20260922`, chartered Claude Opus 5, effort high; this
seat cannot self-inspect its runtime model or effort setting and states both on
dispatch-record authority.*
