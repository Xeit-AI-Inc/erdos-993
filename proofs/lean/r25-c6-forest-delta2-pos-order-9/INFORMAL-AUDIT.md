---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la1-formalizer-sonnet-20260922
critic_id: c6-la1-fable-informal-20260922
attestation_id: c6-la1-informal-pass-20260922
claim_sha256: 5880da9d265a9cadd001f17f193d1c32c732964e7f96e2c9f2499e7f26a0b6c1
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted this session by
reading `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md` — the three reads §0 of
`control/C6-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` authorizes — then the brief itself.
No other VerityOS subsystem file was loaded (no `memory/`, `decisions/`, `operations/`,
`logs/`, `knowledge/`, `writing/`). Subsystems loaded: `identity/` (startup protocol),
`skills/` (proof-integrity-audit), `experiments/` (this run root, within the §1 read
boundary).

**Model disclosure.** Independent informal proof-integrity reviewer seat, chartered
Claude Opus 5, chartered effort `high`. This seat cannot self-inspect its own runtime
model or effort setting; both are stated here on dispatch-record authority, as the
brief's header requires. Child delegation forbidden and not used: no sub-agent was
spawned. This seat is not the artifact producer and edited nothing in the Lean run —
every file it wrote is under `scratchpad/c6-s7-informal-LA1/`.

**Read boundary observed.** Run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20`.
Read: the Lean run's `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`,
`CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`, `FORMALIZER-REPORT.md`,
the `EVIDENCE/` generator and its output, `EVIDENCE/axiom-check-all-declarations.txt`,
`RECEIPTS/kernel-verification.json`, `LeanProject/LeanProof/Main.lean`; the sealed
capsule `control/c6-stage7-capsules/C6-LA1-PACKET-MANIFEST.json` and its members
(the `SYNTHESIS.md` sections `Lean awards` and `Exact established results`, the
`ADJUDICATION.md` section `Lean readiness`, and the two U4 critiques at the passages
bearing on this dispatch —
all nine members were digest-verified, and `cycles/cycle-6/stage3/returns/U4/RETURN.md`
was digest-verified but not opened, its bearing here being carried by the critiques and
the adjudication); `SEMANTIC-CONTRACT.md`; the
frozen G1 source `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`. No network, no
package installs, no `lake`/`elan` invocation of any kind, no `/tmp`, no `find`/`grep`
rooted above these paths. `SOURCE/` is not on the §1 read list: its three files were
digest-checked only (a one-way hash reveals no content) and their *content* is
unread — see finding **O-4**.

**Integrity preconditions, recomputed by this seat.**

| object | expected | recomputed | result |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `06f3bc93…2590e918` | same | match |
| `INFORMAL-PROOF.md` | `2196aa7d…6610a926` | same | match |
| `LeanProject/LeanProof/Main.lean` | `de002193…28bc76faf0` | same | match |
| capsule seal | `a4b50c90…8ee4bb22` | same | match |
| capsule members (9 of 9) | per manifest | byte counts + digests | all match |
| `lean_binding.expected_statement_sha256` | `9344b2dc…b3dd6299` | same | match |
| `FORMALIZER-REPORT.md` hash table (19 artifacts) | per table | all recomputed | 0 mismatches |
| `claim_sha256` = SHA-256 of `" ".join(informal_statement.split())` | `5880da9d…7e26a0b6c1` | same (1564 chars, already whitespace-normal) | **match** |

The capsule seal reproduces under the declared algorithm
(`sha256(json.dumps(manifest − seal_sha256, sort_keys=True, separators=(",",":")))`).

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`, whose
whitespace-collapsed SHA-256 this seat recomputed as
`5880da9d265a9cadd001f17f193d1c32c732964e7f96e2c9f2499e7f26a0b6c1`, equal to the value
the brief names. Its mathematical core:

> For every finite forest `F` (`SimpleGraph X`, `[Finite X]`, `F.IsAcyclic`) with
> `Nat.card X ≥ 9`, `0 < Erdos993G1.delta F 2`, with the quantitative companion
> `(Nat.card X)^3 − 12(Nat.card X)^2 + 35(Nat.card X) − 30 ≤ 6·Erdos993G1.delta F 2`
> for `Nat.card X ≥ 5`.

The terminal declaration, taken from the compiled source (which the brief makes
authoritative over the controller's transcription), is

```lean
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2
```

registered at `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`
(`LeanProject/LeanProof/Main.lean`, ENTRY 27, kind `theorem`). It is the **only**
`theorem` in the project: the kind histogram over the 27 registered declarations is
`definition ×3, lemma ×23, theorem ×1`. The quantitative companion is registered as a
**lemma** at `Erdos993G1.ForestDelta2.forest_delta_two_lower` (ENTRY 26), exactly as
condition (iii) directs and notwithstanding that the synthesis and adjudication *display*
it with the `theorem` keyword — the compiled statement governs, and condition (iii) is
explicit.

The compiled form agrees with the synthesis's Dispatch 1 display and the adjudication's
Contract-ready group 1 display token-for-token modulo whitespace (`^ 3` for `^3`,
`12 * (…)` for `12*(…)`). No arrangement difference arose that would require restating
the terminal declaration in a different form.

**Hypothesis correspondence, one-for-one.** `[Finite X]` ↔ "finite"; `hF : F.IsAcyclic`
↔ "forest"; `hn : 9 ≤ Nat.card X` ↔ "`Nat.card X ≥ 9`"; conclusion
`0 < Erdos993G1.delta F 2` ↔ "`0 < Erdos993G1.delta F 2` (i.e. `i₃(F) > i₂(F)`)". The
implicit universe binder `{X : Type u}` carries no hypothesis. Nothing in the Lean
statement is absent from the claim, and nothing in the claim is absent from the Lean
statement.

**`delta` is the G1 delta, not a re-definition.** ENTRIES 1–3 of the run's `Main.lean`
are content-identical to the frozen G1 ENTRIES 1–3 and to the text `SEMANTIC-CONTRACT.md`
quotes verbatim: `indepCount F k = (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)`;
`coeff F k = if 0 ≤ k then indepCount F k.toNat else 0`;
`delta F k = coeff F (k+1) − coeff F k`. At `k = 2` both indices are non-negative, so
`delta F 2 = i₃(F) − i₂(F)` with no zero-extension branch and no `toNat` truncation.
This matches `SEMANTIC-CONTRACT.md`'s binding convention `Δ_k(F) = i_{k+1} − i_k`.

---

## Claim Ledger

Statement-level granularity. Status column: **V** = verified with reproduced evidence;
**T** = transcription verified byte-level against the frozen source; **A** = attested by
an in-boundary governing record (not independently re-derived here).

Write `n = Nat.card X`, `m = |E(F)|`, `c = |F.ConnectedComponent|`,
`S = Σ_v C(deg v, 2)`, `i_k = indepCount F k`, `Δ₂ = delta F 2`.

### L0 — definitions (frozen ENTRIES 1–3)

| # | claim | hypotheses / where they enter | status |
|---|---|---|---|
| L0.1 | `indepCount F k = i_k(F)`, an ℤ-valued count | none | T, V |
| L0.2 | `coeff` is the integer zero extension of `indepCount` | none; branch `0 ≤ k` untaken at `k ∈ {2,3}` | T, V |
| L0.3 | `delta F k = coeff F (k+1) − coeff F k`; at `k = 2`, `= i₃ − i₂` | none | T, V |

### L1 — transcribed frozen facts consumed by the new lemma

| # | frozen ENTRY | statement | where its hypotheses enter | status |
|---|---|---|---|---|
| L1.1 | 44 | `i₂ + m = C(n,2)` | `[Finite V]` only | T, V (C2) |
| L1.2 | 54 | `i₃ + m·((n−2 : ℕ) : ℤ) = C(n,3) + S` | `hF` — via ENTRY 51 → ENTRY 50, whose proof kills a triangle with `hF.cliqueFree (3 ≤ 3)` | T, V (C2) |
| L1.3 | 58 | `m + c = n` | `hF` — via `hF.isTree_connectedComponent` | T, V (C8) |
| L1.4 | 59 | `0 < c` whenever `0 < n` | `0 < n`, discharged from `hn` by `omega` | T, V (C8) |
| L1.5 | 66 | `0 ≤ C(d,2) − d + 1` termwise | none (integer, all `d : ℕ`) | T, V |
| L1.6 | 68 | `(Σ_v deg v) − n ≤ S` | `[Fintype V]` | T, V (C2/C8) |
| L1.7 | 70 | `2·C(n,2) = n(n−1)` | none | T, V |
| L1.8 | 71 | `6·C(n,3) = n(n−1)(n−2)` | none | T, V |
| L1.9 | Mathlib | `Σ_v deg v = 2m` (handshake) | `[Fintype V]` | A (Mathlib `sum_degrees_eq_twice_card_edges`) |

Acyclicity enters **exactly twice**, at L1.2 and L1.3, exactly as `INFORMAL-PROOF.md`
§4a states. I confirmed both entry points by reading the frozen proof bodies: ENTRY 50
(`triple_local_identity`) derives `¬(Adj a b ∧ Adj a c ∧ Adj b c)` from
`hF.cliqueFree`, and ENTRY 58 uses `hF.isTree_connectedComponent c` to get each
component's edge count. No third use of `hF` exists.

### L2 — the new lemma `forest_delta_two_lower`

Claim: `n³ − 12n² + 35n − 30 ≤ 6·Δ₂` for every forest with `5 ≤ n`.

| # | inference | justification | status |
|---|---|---|---|
| L2.1 | `6Δ₂ = n(n−1)(n−5) + 6S − 6m(n−3)` | L0.3 + L1.1 + L1.2 + L1.7 + L1.8, integer algebra | **V** (recomputed symbolically and on 15,205 censused forests) |
| L2.2 | `S ≥ 2m − n` | L1.6 + L1.9 | **V** |
| L2.3 | `m + 1 ≤ n`, i.e. `c ≥ 1` | L1.3 + L1.4 (`omega`, ℕ, no subtraction) | **V** |
| L2.4 | `((n − 2 : ℕ) : ℤ) = (n : ℤ) − 2` | `omega`, using `hn : 5 ≤ n` — **the adjudicator's formalizer caution, condition (iii)** | **V**, and load-bearing (below) |
| L2.5 | `(n − 5)·(n − m − 1) ≥ 0` | `mul_nonneg` on `hnz : 5 ≤ n` and `hmz : m+1 ≤ n`; equals `(n−5)(c−1) ≥ 0` | **V** |
| L2.6 | combining L2.1–L2.5 gives the cubic | one `nlinarith`; the linear certificate is exhibited below | **V** |

The certificate for L2.6, recomputed by hand and checked on the census:

```
6Δ₂ = n(n−1)(n−5) + 6S − 6m(n−3)                                  [L2.1]
    ≥ n(n−1)(n−5) + 6(2m − n) − 6m(n−3)      = n(n−1)(n−5) − 6n − 6m(n−5)   [+6·L2.2]
    ≥ n(n−1)(n−5) − 6n − 6(n−5)(n−1)         = n³ − 12n² + 35n − 30         [+6·L2.5]
```

Both relaxations are non-negative multiples of an available hypothesis, so the whole of
L2.6 is *linear* arithmetic once L2.5 is supplied as a product term — which is precisely
what the single `nlinarith [ … , mul_nonneg (sub_nonneg.mpr hnz) (sub_nonneg.mpr hmz)]`
call provides. The component count `c` is eliminated at L2.3 and never reappears: `c`
enters the proof **only** as `c ≥ 1 ⇔ m ≤ n − 1`.

### L3 — the terminal theorem `forest_delta_two_pos_ge_nine`

| # | inference | justification | status |
|---|---|---|---|
| L3.1 | `5 ≤ n` from `hn : 9 ≤ n` | `omega`, ℕ | **V** |
| L3.2 | `n³ − 12n² + 35n − 30 ≤ 6Δ₂` | L2 at `hn'` | **V** |
| L3.3 | `n³ − 12n² + 35n − 30 = (n−9)³ + 15(n−9)² + 62(n−9) + 42` | integer identity | **V** (C6, all integer `n ∈ [−50, 200]`) |
| L3.4 | hence `> 0` for `n ≥ 9` | every summand `≥ 0`, constant `42 > 0` | **V** (C5a) |
| L3.5 | `0 < 6Δ₂`, hence `0 < Δ₂` | `nlinarith` with `sq_nonneg ((n : ℤ) − 9)` | **V** |

### ℕ-subtraction and cast audit (every occurrence)

1. **`((Nat.card X − 2 : ℕ) : ℤ)` in L1.2** — the only truncating subtraction anywhere
   in the chain. Converted at L2.4 by `have hsub : ((Nat.card X − 2 : ℕ) : ℤ) =
   (Nat.card X : ℤ) − 2 := by omega` and rewritten into `htriple` *before* the closing
   `nlinarith`. This is exactly the adjudicator's caution. It is **mathematically**
   load-bearing, not merely tactically: the equation is false at `n ∈ {0,1}`
   (ℕ-truncation gives `0`, integer subtraction gives `−2`/`−1`), so the rewrite is
   licensed only because `hn : 5 ≤ n` is in context. Verified.
2. **`(n : ℤ) − 1`, `(n : ℤ) − 2`, `(n : ℤ) − 5`, `(n : ℤ) − 9`** — all integer
   subtraction on casts, never ℕ subtraction. No truncation possible.
3. **`m + 1 ≤ n` (L2.3)** — proved in ℕ by `omega` from `m + c = n` and `0 < c`, then
   cast up by `exact_mod_cast`. Addition only; no subtraction.
4. **`Fintype.card X = Nat.card X`** (`hnx`, via `Nat.card_eq_fintype_card.symm`) — the
   `[Finite X] → Fintype X` bridge (`letI := Fintype.ofFinite X`). `indepCount`, `delta`
   and `Nat.card F.edgeSet` are all defined through `Nat.card`, which is
   instance-independent, so the chosen (classical, noncomputable) `Fintype` instance
   cannot change the statement. The statement's instance burden remains `[Finite X]`
   alone, as the contract's `hyp-finite` asserts.
5. **`rw [show (2 : ℤ) = ((2 : ℕ) : ℤ) by rfl, delta_nat]`** — turns `delta F (2 : ℤ)`
   into `i₃ − i₂` through the frozen `delta_nat`. `rfl`-level cast; no truncation.
6. **`degreeDefect_nonneg` / `degreeChoose_sum_lower` / `scaledChooseTwo` /
   `scaledChooseThree`** — all stated in ℤ over `Nat.choose` casts. I checked the
   degenerate arguments: `2·C(0,2) = 0 = 0·(−1)` and `6·C(1,3) = 0 = 1·0·(−1)`, so the
   choose identities are genuine identities at every `n : ℕ`, including where the
   integer right-hand side is negative. Verified.

Every equality used in the chain is an identity, recomputed: L2.1 as symbolic algebra
*and* on every one of the 15,205 censused forests; L3.3 over a 251-point integer grid;
L1.7/L1.8 at their degenerate arguments.

---

## Reproduced Mathematical Evidence

All evidence was produced by evaluators this seat wrote from scratch under
`scratchpad/c6-s7-informal-LA1/`, Python standard library only
(`difflib`, `functools`, `hashlib`, `itertools`, `json`, `re`, `sys`; explicit import
lists at the top of each file), exact integers throughout — no floats, no division, no
wall-clock/PID/host field in any output. No prior evaluator was imported or read: the
formalizer's `EVIDENCE/verify_forest_delta2_cubic_bound.py` was read *after* my census
was written and run, and only to compare results. My generator is a different
construction (canonical child-tuple rooted trees, deduplicated to free trees by
**centroid AHU canonical form**; forests by an index-monotone multiset recursion over
the free-tree pool) from the pool-based lex-min-rerooting method that generator
describes.

Artifacts: `forest_census_LA1.py` → `census.out.json`; `transcription_diff.py` →
`transcription-diff.out.json`; `transcription_strict.py` → `transcription-strict.out.json`.

### Census scope

Every finite forest up to isomorphism of every order `n = 1..14`: **15,205 classes**.
Generator validated independently against three OEIS sequences:

- rooted trees `n = 1..14` = 1, 1, 2, 4, 9, 20, 48, 115, 286, 719, 1842, 4766, 12486, 32973 — **A000081, exact match**;
- free trees `n = 1..14` = 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159 — **A000055, exact match**;
- forest classes `n = 1..14` = 1, 2, 3, 6, 10, 20, 37, 76, 153, 329, 710, 1601, 3658, 8599 — **A005195, exact match**.

### C2 — the closed-form identity (L2.1)

`6·Δ₂(F) = n(n−1)(n−5) − 6(n−c)(n−3) + 6S` holds on **all 15,205** censused forests,
zero counterexamples. This independently confirms the ENTRY 44 / 54 / 58 / 70 / 71
composition the informal proof's §4a display asserts, against an independently computed
independence polynomial (`A(t) = Π Ind(child)`, `B(t) = z·Π A(child)`) rather than
against the frozen lemmas.

### C3 — the cubic bound, and the sharpness of `5 ≤ n`

`n³ − 12n² + 35n − 30 ≤ 6·Δ₂(F)` holds on **every** censused forest of order
`5 ≤ n ≤ 14`, zero counterexamples. Below the hypothesis it **fails**, so `hn` is
load-bearing and not decoration:

| `n` | `min Δ₂` | `6·min Δ₂` | cubic | bound holds? |
|---|---|---|---|---|
| 1 | 0 | 0 | −6 | yes (vacuously slack) |
| 2 | −1 | −6 | 0 | **no** |
| 3 | −2 | −12 | −6 | **no** |
| 4 | −4 | −24 | −18 | **no** |
| 5 | −5 | −30 | −30 | yes, tight |

The failure at `n = 4` is witnessed by `2K₂` (`c = 2`, `m = 2`, `S = 0`, `i₂ = 4`,
`i₃ = 0`, `Δ₂ = −4`) against the bound value `cubic(4)/6 = −3`. This reproduces
C-U4-T's critique (`CRITIQUE.md` line 314: "*invalid* at `n = 4` — bound −3 against true
−4"), which `INFORMAL-PROOF.md` §4a paraphrases as "`B(4) = −3` against the true minimum
`−4`". Accurate.

### C4 — sharpness of the cubic at every order 5..14

`6·min Δ₂(n) == n³ − 12n² + 35n − 30`, **exact integer equality**, at every
`n = 5..14`:

| `n` | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
|---|---|---|---|---|---|---|---|---|---|---|
| `min Δ₂` | −5 | −6 | −5 | −1 | 7 | 20 | 39 | 65 | 99 | 142 |
| `cubic` | −30 | −36 | −30 | −6 | 42 | 120 | 234 | 390 | 594 | 852 |

This is condition (iv)'s required check, reproduced independently. The table matches
`INFORMAL-PROOF.md` §8's stated values and the formalizer's
`EVIDENCE/forest-delta2-cubic-bound-check.out.json` element for element. It also
explains *why* the bound is sharp: equality in L2.2 forces every degree into `{1,2}`,
and equality in L2.5 forces `c = 1` once `n > 5` — i.e. the path `Pₙ`, whose
`i₂ = C(n−1,2)`, `i₃ = C(n−2,3)`. The formalizer's own generator reports exactly one
minimising class at each `n = 6..14` and two at `n = 5`, consistent with the `(n−5)`
factor vanishing at `n = 5`; my census agrees (at `n = 5`, `P₃ + K₂` also attains −5).

### C5 — positivity iff the order is at least 9

- **C5a, the cubic.** Over integer `n`: `cubic(n) > 0` first at `n = 9`, and `> 0` for
  every `n ∈ [9, 400)`. Values at `n = 0..8` are `−30, −6, 0, −6, −18, −30, −36, −30, −6`
  — all `≤ 0`. So "positive iff `n ≥ 9`" is exact on the integers (note `cubic(2) = 0`,
  which is non-positive but not negative; the "iff" is for strict positivity and holds).
- **C5b, the theorem's own object.** `min Δ₂` over forests of order `n` is `≤ 0` for
  every `n ≤ 8` and `> 0` for every `9 ≤ n ≤ 14`. The threshold is therefore **exact**,
  not merely sufficient: at `n = 8` the minimum is `−1`, attained by the connected
  minimiser with `m = 7`, `S = 6`, `i₂ = 21`, `i₃ = 20` — i.e. `P₈`, matching the
  synthesis's "*Sharp:* `P₈` attains it at `n = 8` (`Δ₂ = −1`)" and the terminal
  declaration's own docstring.

### C6 — the Horner identity behind L3.3/L3.4

`n³ − 12n² + 35n − 30 = (n−9)³ + 15(n−9)² + 62(n−9) + 42` on every integer `n` in
`[−50, 200]`; constant term `cubic(9) = 42`. This is the exact identity
`INFORMAL-PROOF.md` §4b names, and it is what makes `nlinarith` with
`sq_nonneg ((n : ℤ) − 9)` sufficient at L3.5.

### C7 — the edgeless forest, and where §4a's display step breaks

On the edgeless forest (`c = n`, `m = 0`, `S = 0`), `6Δ₂ = n(n−1)(n−5)` exactly, and the
cubic bound holds at every order `5..14` (at `n = 9`: `288 ≥ 42`). This is the case the
informal proof says needs "no edgeless clause" — correct, because the general chain
already covers it.

It is also the counterexample to the *individual* relaxation `6S ≥ 6(n−2)` written on
line 2 of §4a's display: there `S = 0 < n − 2` at **every** order `5..14`. See finding
**F-1**.

### C8 — where the component count enters

`m = n − c` on every censused forest, and `S ≥ n − 2c` always (equivalently `S ≥ 2m − n`,
which is L2.2). Over all `(n, c)` with `5 ≤ n ≤ 14`, `1 ≤ c ≤ n`, the Lean hint term
`(n−5)·(n−m−1)` is identically `(n−5)·(c−1)` and is non-negative. So the component count
enters the proof of record **only** through `c ≥ 1`, i.e. `m ≤ n − 1`, and is otherwise
eliminated — exactly what the informal proof's numbered step 2 says and what the Lean
certificate does.

### C10 — C-U4-F's sharper component-corrected bound

The sealed critique C-U4-F states
`6·Δ₂(F) ≥ n³ − 12n² + 35n − 30 + 6(c−1)(n−5)`. I verified this stronger inequality on
all **15,204** censused forests of order `2..14`: zero counterexamples, 134 equality
cases. The award's `forest_delta_two_lower` is exactly this with the non-negative term
`6(c−1)(n−5)` dropped — valid precisely because `n ≥ 5`. This independently corroborates
the attribution "C-U4-F (component-corrected bound)" and shows the award's lemma is the
`c`-free weakening of the critic's form, as the record says.

### C11/C12 — record integrity

- All 27 of the run's own `VERITYOS ENTRY` tag digests recompute over their bodies
  (under `lstrip('\n')` or `strip()+'\n'` normalization); **zero** non-recomputing tags.
  This is the defect class the run's Dispatch 5 record names (a dropped trailing byte
  making an ENTRY tag digest fail to recompute); it does not occur here.
- `EVIDENCE/axiom-check-all-declarations.txt`: 27 lines, and the set of names in them is
  **equal** to the set of 27 names registered by the `VERITYOS ENTRY` headers of
  `Main.lean` (checked as a set comparison, not by eye) — so the sweep covers every
  registered declaration and nothing else. Every line reports exactly
  `[propext, Classical.choice, Quot.sound]`; zero `sorryAx`. Every entry is a named
  `definition`/`lemma`/`theorem`, never an anonymous `example` (condition (v)).
- `grep` over `LeanProject/LeanProof/Main.lean` for `sorry`, `admit`, `native_decide`:
  **zero** occurrences. `decide` occurs twice, both inside doc-comment prose describing
  seat U4's measurement, never as a tactic.
- `RECEIPTS/kernel-verification.json`: `verdict.verified = true`, `code = "verified"`,
  and all eleven checks `passed` (`path_containment`, `pinned_project`,
  `incomplete_proof_scan`, `unsafe_execution_scan`, `execution_sandbox`, `toolchain`,
  `project_build`, `single_file`, `axiom_probe`, `axiom_policy`, `source_immutable`).
- The condition-(iv) generator declares its imports at the top
  (`hashlib, json, functools, sys, itertools` — standard library only) and neither it nor
  its output carries a wall-clock, PID or host field; the only matches for my
  forbidden-field scan were the two literal `schema_note` strings asserting their
  absence.

### Byte-for-byte transcription check (the 25 consumed frozen entries)

Both the informal proof's §2 table and the formalizer report's table map the 25
transcribed declarations to frozen ENTRIES 1, 2, 3, 17, 23, 25, 41, 42, 43, 44, 45, 46,
47, 48, 49, 50, 51, 53, 54, 58, 59, 66, 68, 70, 71. I parsed the frozen G1 source
(SHA-256 `aa517ebc…9fda1ca4`, 187 entries) and confirmed each of those 25 ENTRY numbers
carries exactly the declared name and kind. I then compared the 25 bodies against the
run's transcriptions under a normalizer that removes **only** the two disclosed classes
and then requires **exact string equality** of the remainder:

| class | count | entries |
|---|---|---|
| exact after scope normalization (namespace re-wrap / qualifier strip / `noncomputable` line break) | 12 | 1, 2, 3, 47, 53, 54, 58, 59, 66, 68, 70, 71 |
| exact after the disclosed binder un-sugaring | 13 | 17, 23, 25, 41, 42, 43, 44, 45, 46, 48, 49, 50, 51 |
| **residual content difference** | **0** | — |

The binder accounting matches `INFORMAL-PROOF.md` §3 **exactly**: entries 17, 23, 25, 41,
43, 44, 45, 46, 48, 49, 50, 51 gained both `{V : Type u}` and `(F : SimpleGraph V)`;
ENTRY 42 gained `{V : Type u}` only (its statement never mentions `F`); entries 47, 53,
54, 58, 59 gained nothing; entries 1, 2, 3, 66, 68, 70, 71 were re-wrapped in
`namespace Erdos993G1 … end Erdos993G1` with the unqualified leaf identifier. No
hypothesis, conclusion, tactic or proof term differs in any of the 25.

`SOURCE/originating-frozen-g1-Main.lean` is byte-identical to
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` (same SHA-256).

### Frozen ENTRY 176 and the strict-generalisation claim

ENTRY 176 is
`Erdos993G1.ThirdWide.forest_delta_two_ten_pos {X} [Finite X] (F) (hF : F.IsAcyclic)
(hn : Nat.card X = 10) : 0 < delta F 2`. Reading its proof body confirms the informal
proof's §4a account precisely: it opens with the **same** `have` sequence in the **same
order** (`components_card_pos_of_card_pos`, `forest_card_edges_add_components`,
`indepCount_two_add_edges`, `indepCount_three_add_edge_incidence`,
`degreeChoose_sum_lower`, the handshake `hd`), substitutes the numeral 10, and closes
with `linarith`. Carrying `n` symbolically instead — and supplying the one product term
that the numeral made unnecessary — is exactly what `forest_delta_two_lower` does. The
award's `9 ≤ Nat.card X` strictly contains ENTRY 176's `Nat.card X = 10`, so "strictly
generalises frozen ENTRY 176" is accurate, and no enumeration, induction or pendant
identity is inherited.

---

## Independent Critic Pass

A separate adversarial pass over my own ledger, run before closing.

**Is the theorem vacuous or trivially true?** No. `min Δ₂(8) = −1 < 0` and
`min Δ₂(9) = 7 > 0` (C5b), so the hypothesis `9 ≤ n` is exactly the threshold: the
statement is false at every smaller uniform threshold and has content at 9.

**Could `nlinarith` be closing something weaker than the stated goal?** The goal after
`rw [… delta_nat]` is the cubic inequality in `i₃ − i₂`. I reconstructed a *linear*
certificate for it (L2.6) from the supplied hypotheses plus the one product hint, and
checked the resulting identity symbolically and on the census. The certificate is exact —
both relaxation steps are non-negative multiples of supplied facts, and the third line
equals the cubic identically. So the goal is genuinely implied; nothing is being closed
by a stronger unstated premise.

**Is the `mul_nonneg` hint doing hidden work?** It supplies `(n−5)(n−m−1) ≥ 0`, which is
`(n−5)(c−1) ≥ 0`. Both factors are non-negative from `hnz` and `hmz`, which come from
`hn` and from L1.3+L1.4. Nothing outside the ledger enters.

**Does any excluded object sneak in?** An identifier scan over the run's `Main.lean`
finds no `ν`, `τ`, `firstDescent`, `residual`, `ambientA`, `ambientH`, `deleteVerts`,
`IsMatching`, `vertexCover` — none as identifier, import or type ascription. The only
graph objects used are `IsAcyclic`, `edgeSet`, `ConnectedComponent`, `degree`,
`indepSetFinset`. The contract's `hypotheses` list is exactly `{hyp-finite, hyp-acyclic,
hyp-order-ge-nine}`, and I found no fourth hypothesis used anywhere in the chain.

**Does the enumerating EVIDENCE generator violate the "no enumeration at any order"
fence?** No, and this is the most plausible misreading of the record, so I state it
explicitly: the census is a **sharpness corroboration** required by condition (iv). No
Lean declaration in the project consumes it; the contract's dependency DAG contains only
frozen lemmas and ordinary integer arithmetic; `decide`/`native_decide` appear nowhere as
tactics. The *proof* enumerates nothing at any order. The fence holds.

**Is `forest_delta_two_lower` improperly bound as a second terminal declaration?** No.
`lean_binding.declaration_name` names only `forest_delta_two_pos_ge_nine`, the kind
histogram shows exactly one `theorem`, and `forest_delta_two_lower` is registered
`lemma`. Condition (iii) satisfied.

**Was the adjudicator's caution actually applied, or merely narrated?** Applied, and
present in the source at the named point: `have hsub : ((Nat.card X − 2 : ℕ) : ℤ) =
(Nat.card X : ℤ) − 2 := by omega` followed by `rw [hsub] at htriple`, immediately before
the closing `nlinarith`. I verified independently that the equation it asserts is *false*
without `hn` (at `n ≤ 1`), so the rewrite is genuinely licensed by the hypothesis rather
than being a cosmetic normalization.

**Findings.** Three non-blocking findings and four observations. None touches the
intended claim, the terminal declaration, any hypothesis, any fence, or any numeric
value of record.

> **F-1 (imprecision; non-blocking). The three-line display in `INFORMAL-PROOF.md` §4a
> compresses two relaxations into a simultaneous `c := 1` substitution, and its middle
> line is not implied by the facts its own annotation cites.** The display reads
>
> ```
> 6·Δ₂(F) = n(n−1)(n−5) − 6(n−c)(n−3) + 6S
>         ≥ n(n−1)(n−5) − 6(n−1)(n−3) + 6(n − 2)   [ENTRY 68: S ≥ n − 2c; ENTRY 59: c ≥ 1, ENTRY 58: n−c = |E| ≤ n−1]
>         = n³ − 12n² + 35n − 30
> ```
>
> The cited facts give `+ 6(n − 2c)`, not `+ 6(n − 2)`; passing from one to the other
> needs `c ≤ 1`, which is not available and is false for every disconnected forest. The
> step `6S ≥ 6(n−2)` is individually **false** on the edgeless forest, where `S = 0` and
> `n − 2 > 0` — at every order `5..14` (C7). What makes the displayed *conclusion*
> correct is that the combined `c`-dependence is `6c(n−5)`, monotone non-decreasing in
> `c` for `n ≥ 5`, so `c = 1` is the minimiser; the display does not state that
> monotonicity.
>
> **Why this is not a failure.** The valid derivation is present in the same section and
> is the proof of record. §4a's numbered node list — which the text introduces as "Node
> by node, exactly as the Lean proof runs" — carries every ingredient correctly: step 5
> gives `S ≥ 2m − n` with `m` symbolic, step 2 gives `m ≤ n−1`, and step 9 names the
> product hint `(n−5)(n−|E|−1) ≥ 0`, which is exactly the monotonicity term. The Lean
> proof keeps `m` symbolic and closes on that certificate (L2.6), never on the displayed
> shortcut. C-U4-F's sealed critique states the same route in its transparent form,
> `6Δ₂ ≥ cubic(n) + 6(c−1)(n−5)`, which I verified on 15,204 forests (C10). The third
> line of the display is arithmetically correct
> (`n(n−1)(n−5) − 6(n−1)(n−3) + 6(n−2) = n³ − 12n² + 35n − 30`, checked). Under
> `skills/proof-integrity-audit`'s taxonomy this is *imprecise but true*, with the
> correct support adjacent and mechanized — not an unsupported gap. **Recommendation
> (not a repair this seat may make):** replace the middle line with
> `≥ n(n−1)(n−5) − 6m(n−3) + 6(2m − n) = n³ − 12n² + 35n − 30 + 6(c−1)(n−5)`, i.e.
> C-U4-F's own form.

> **F-2 (cosmetic miscount in `FORMALIZER-REPORT.md`; non-blocking).** The report's
> deviation section says "**4 entries** (frozen ENTRIES 1, 2, 3, 66, 68, 70, 71 — the
> three definitions plus four top-level fully-qualified lemmas) needed re-wrapping". The
> parenthetical lists **seven** entries and is correct; the count "4" is not. My
> byte-level check confirms seven entries were re-wrapped (3 definitions + 4 lemmas).
> `INFORMAL-PROOF.md` §3 states the same fact correctly ("these four — and ENTRIES 1-3
> themselves"). The report's other counts are right: 25 = 3 definitions + 22 lemmas;
> 27 = definition ×3 + lemma ×23 + theorem ×1; 12 entries gained both binders.

> **F-3 (undefined notation in `INFORMAL-PROOF.md`; non-blocking).** §4a writes
> "`B(4) = −3`" without defining `B` anywhere in that file; §8 uses the unscaled cubic.
> `B(n) = (n³ − 12n² + 35n − 30)/6` is defined in the EVIDENCE generator's docstring and
> in C-U4-F's critique, and `B(4) = −18/6 = −3` is consistent with both. Substance
> correct, notation locally unglossed.

**Observations (no action implied).**

- **O-1.** `INFORMAL-PROOF.md` §4a says the bound "is genuinely false below `n = 5`".
  Exactly: it fails at `n = 2, 3, 4` and happens to hold (slackly) at `n = 0, 1`. The
  sentence's evident referent, the `n = 4` failure, is correct and tightest.
- **O-2.** The synthesis and adjudication *display* `forest_delta_two_lower` with the
  `theorem` keyword while condition (iii) requires a `lemma`. The run follows condition
  (iii) and the compiled-statement-governs rule. No conflict, but the displays and the
  condition are not literally reconcilable on their face.
- **O-3.** The run's `Main.lean` carries **local** `VERITYOS ENTRY` tags 1–27 with
  locally recomputed digests, not the frozen ENTRY numbers and digests. The award
  statement's phrase "with their VERITYOS ENTRY tags and digests" is satisfied in
  substance by the disclosed provenance mapping (`INFORMAL-PROOF.md` §2 and the
  formalizer report's table), which I verified name-by-name and body-by-body against the
  frozen source — a stronger check than tag equality would have been. All 27 local tag
  digests recompute (C12).
- **O-4.** `INFORMAL-PROOF.md` §5 asserts that "the exact same proof strategy, in the
  exact same order of steps, discharges `forest_delta_two_lower` here as in C-U4-T's
  `CritU4T.lean`". `SOURCE/` is outside this seat's §1 read list, so I did not read that
  file's content and record this as **attested, not independently verified**; the
  in-boundary adjudication ("Lean readiness", Contract-ready group 1) independently
  attests that `CritU4T.lean` compiles both declarations and that the adjudicator rebuilt
  it from a fresh copy-out. The three `SOURCE/` digests match the contract and
  `CAPSULE-VERIFICATION.json`.

---

## Scope and Fence Check

Each mandatory fence, and where it travels on the award's face. "Contract" =
`THEOREM-CONTRACT.yaml` `theorem.informal_statement` (and its rendering in
`EVIDENCE/THEOREM-CONTRACT.md`); "IP" = `INFORMAL-PROOF.md` §6; "face" = the docstrings
of the two new declarations in `Main.lean`.

| fence | present | verified |
|---|---|---|
| uniform in the order, no horizon | contract, IP, face | **yes** — the statement quantifies over all `n ≥ 9`; no order-indexed case split exists in the proof |
| **no enumeration at any order** | contract, IP, face | **yes** — no `decide`/`native_decide` tactic anywhere; the DAG consumes only frozen lemmas and integer arithmetic; the EVIDENCE census is a sharpness corroboration, not a proof input |
| `ν`, `τ`, the excess `d`, `x(F) < r` enter nowhere | contract, IP, face | **yes** — identifier scan of the run's `Main.lean` returns no such name as identifier, import or type ascription |
| `Δ₂ > 0` is a **POSITIVITY** statement, opposite sign from no-recovery | contract, IP, face | **yes** — the conclusion is `0 < delta F 2`; no `Δ_r ≤ 0` statement occurs anywhere in the run |
| a forest **THRESHOLD** theorem, **never** "the run's first unconditional forest theorem" | contract, IP, face | **yes** — a line-wrap-tolerant scan finds the phrase exactly once in each of `THEOREM-CONTRACT.yaml`, `EVIDENCE/THEOREM-CONTRACT.md`, `INFORMAL-PROOF.md`, `FORMALIZER-REPORT.md` and `Main.lean`, and in all five it is immediately preceded by "never": five negated occurrences, zero affirmative ones |
| does **not** sharpen `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an order bound is a different object) | contract, IP, face | **yes** — the claim's object is a threshold on `Δ₂` itself; no order bound `Δ_k(G) < 0 ⟹ n ≤ (k+1)²` is stated, used or implied |
| is **not** `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` | contract, IP, face | **yes** — rank 3 is untouched; only `delta F 2` appears |
| bears on **no tier**, on FOREST/TREE/TRANSFER, or on Erdős #993 | contract, IP, face | **yes** — no tier object, no G1 residual, matching branch, cover branch or `d`-band occurs in the run's Lean source or informal proof |
| alias line names `E993-R25-FOREST-DELTA2-POS-ORDER-9`, frozen ENTRY 176, `E993-PAIR-RANK3-FOREST-MIN` | contract, IP §6, face | **yes** — all three named |
| a **grade change** (`proved_informal → formally_verified`), **not a new claim** | contract, IP, face | **yes** — stated in all three places |
| strict generalisation of frozen ENTRY 176 | contract, IP, face | **yes** — verified against ENTRY 176's actual statement (`Nat.card X = 10 ⊂ 9 ≤ Nat.card X`) |

**Attribution (condition (i)).** Required: critic-attributed jointly to **C-U4-T**
(contract form, quantitative cubic) and **C-U4-F** (component-corrected bound,
`entry176_is_an_instance` disclosure), on the frozen G1 project's own compiled lemmas;
seat **U4**'s route framed the question and settled the `decide` question. This travels
on the award's face in all four required places: the contract's `informal_statement`
(and therefore inside the hashed claim), `INFORMAL-PROOF.md` §5, the docstrings of
ENTRY 26 and ENTRY 27 in `Main.lean`, and `FORMALIZER-REPORT.md` §(i). I checked the
attribution against the sealed sources: C-U4-F's critique does carry the
component-corrected bound and `entry176_is_an_instance`; the adjudication and synthesis
both state the identical joint attribution. **Satisfied.**

**Scope exclusions (condition (ii)).** Required in `INFORMAL-PROOF.md` *and* the
contract's `informal_statement`. Both carry the full fence list. **Satisfied.**

**Repairs (condition (iii)).** None mathematical (0 of 2 used); the one formalizer
caution applied at the named point and independently confirmed load-bearing; exactly one
terminal declaration bound, with `forest_delta_two_lower` registered as a lemma.
**Satisfied.**

**Exact-integer generator (condition (iv)).** `EVIDENCE/verify_forest_delta2_cubic_bound.py`
ships with an explicit standard-library import list, is digested in the report's hash
table (recomputed here), contains no wall-clock/PID/host field in itself or its output,
and performs exactly the required check (`6·min Δ₂(n) == cubic(n)` at `n = 5..14`). Its
result is independently reproduced above. **Satisfied.**

**Axioms (condition (v)).** `#print axioms` on **every** named declaration — all 27, not
only the terminal one — reporting exactly `[propext, Classical.choice, Quot.sound]`,
zero `sorryAx`; no anonymous `example` was registered. The report's axiom sentence reads
"**within the three standard axioms**", the required wording. **Satisfied.**

**Fail-closed check.** No fence is weakened, silently or otherwise; no claim in the
record asserts anything the fences exclude; nothing marked NOT a dependency is a
dependency.

---

## Verdict

**passed**

The informal proof at `INFORMAL-PROOF.md` (SHA-256 `2196aa7d…6610a926`) is a correct
proof of the intended claim, which is exactly the contract's `informal_statement`
(claim SHA-256 `5880da9d265a9cadd001f17f193d1c32c732964e7f96e2c9f2499e7f26a0b6c1`,
recomputed by this seat and equal to the value the brief names). Every definition,
lemma and inference step is ledgered above with its hypotheses and their points of
entry; every equality used is an identity, recomputed; the single truncating
ℕ-subtraction is converted under a hypothesis that genuinely licenses the conversion;
every numeric claim in the proof and in `FORMALIZER-REPORT.md` reproduces exactly under
an evaluator this seat wrote from scratch, over a census of all 15,205 forest classes of
order at most 14 validated against A000081, A000055 and A005195; the cubic bound is
sharp at every order 5..14 and fails below its hypothesis (most tightly at `n = 4`,
bound `−3` against true `−4`); positivity holds exactly from order 9, the threshold
being exact because `min Δ₂(8) = −1`; the 25 transcribed frozen entries are
content-identical to `sources/g1/`, byte for byte, modulo exactly the two disclosed
un-sugaring classes and no other change; the terminal declaration's hypotheses match the
claim one-for-one; nothing marked NOT a dependency is a dependency; and every mandatory
fence and every condition (i)–(v) travels on the award's face.

Three non-blocking findings are recorded and none is a defective step in the proof of
record: **F-1**, a compressed and individually unjustified middle line in §4a's summary
display, whose conclusion is correct and whose valid derivation is present in the same
section's numbered node list, in the Lean certificate, and in C-U4-F's sealed critique
(recommendation stated, not applied — this seat repairs nothing); **F-2**, a "4" that
should read "7" in `FORMALIZER-REPORT.md`'s deviation section, contradicted by its own
correct parenthetical; **F-3**, the symbol `B` used once in §4a without a local gloss.
No defect has been softened into a pass: F-1 is stated in full, with the exact step, the
exact counterexample to that step read in isolation, and the exact reason it does not
defeat the proof.

This audit is the informal proof-integrity gate only. It makes no `formally_verified`
claim and no kernel-verification or statement-fidelity finding; those are separate
gates, and the controller — not this seat — registers this file and runs `close`.

*Attestation `c6-la1-informal-pass-20260922`, independent informal proof-integrity
reviewer `c6-la1-fable-informal-20260922`, award group `C6-LA1`, registry effect
`E993-R25-FOREST-DELTA2-POS-ORDER-9`, Cycle 6 terminal Stage 7, 2026-09-22.*
