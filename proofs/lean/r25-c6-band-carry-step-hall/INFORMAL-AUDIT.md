---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la2-formalizer-sonnet-20260922
critic_id: c6-la2-fable-informal-20260922
attestation_id: c6-la2-informal-pass-20260922
claim_sha256: dabd5cbf0dc4792899d4d26e63e82c3184d847910e06d699064fd6aa0b449da7
---

# Informal Proof Integrity Audit

**VerityOS boot.** I am operating within VerityOS. Loaded this session:
`verity.md` (constitution), `identity/startup-protocol.md` (startup protocol),
`skills/proof-integrity-audit/skill.md` (the authority for this seat), and the
`experiments/` subsystem at run root
`experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20`. Scale mode:
*single problem* (one terminal theorem with its two nodes and the arithmetic
layer). Guardrails applied: verify, do not revise; recompute, do not rely on
prose agreement; do not silently repair a claim to make it pass; run a separate
critic pass before closing; no promotion of anything into durable VerityOS
records.

**Model disclosure.** Chartered Claude Opus 5, effort `high`. This seat cannot
self-inspect its own runtime model or effort setting; the model and effort are
stated here on dispatch-record authority
(`control/C6-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md`). Child delegation was
forbidden and none occurred. I am not the artifact producer and edited nothing
in the Lean run; I wrote only under
`scratchpad/c6-s7-informal-LA2-repair-1/`.

**Seat identity.** Reviewer `c6-la2-fable-informal-20260922`
(`independent-mathematical-proof-integrity-reviewer`). Artifact producer
(formalizer): `c6-la2-formalizer-sonnet-20260922`.

---

## Intended Claim

**Scope of this document.** This is the informal proof-integrity audit of the
**bounded-repair child run**
`runs/lean-2026-09-22-c6-band-carry-step-hall-repair-1`. It re-issues my audit
of the parent run `runs/lean-2026-09-22-c6-band-carry-step-hall` (audit file
SHA-256 `0339dd81fc5d56f36a0e0fbf130fb34220339758a6e6cdb9834b4f4e83333877`,
verdict `passed`) on the repaired registration. The repair re-registered the
identical 35 fragments under fully qualified names; I verified that claim by
diff rather than accepting it — see **Re-issue on the repaired registration**
under `## Independent Critic Pass`. Every ledger row, every recomputation and
every fence finding below is re-established directly against the child run's
own artifacts.

The intended claim is exactly `theorem.informal_statement` of
`runs/lean-2026-09-22-c6-band-carry-step-hall-repair-1/THEOREM-CONTRACT.yaml`
(file SHA-256 `3aa3f94e87b6fa82360475cfdab921d7931fceb3bef61bcbe3a96d4af25fb951`,
matching the brief's expected value).

`claim_sha256` recomputed by me as `sha256(" ".join(s.split()))` over that
string: **`dabd5cbf0dc4792899d4d26e63e82c3184d847910e06d699064fd6aa0b449da7`**
— equal to the value the brief names. (The normalized string is 2,593 bytes; the
raw string is also 2,593 bytes, i.e. it already carries no collapsible
whitespace.)

The terminal declaration, taken from the **compiled** source
`LeanProject/LeanProof/Main.lean` (SHA-256
`8770a6c5d0198fbe743246cff3e2cf2d0eab0eb292e391759556c3296911efd0`, ENTRY 35,
the file's only `theorem`), is:

```lean
theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    delta F k - delta F (k - 1) ≤ Bd r k
```

This is character-for-character the controller's transcription in the brief §2
and in the synthesis `## Lean awards` "Dispatch 2"; there is no arrangement
difference to report. `lean_binding.expected_statement` occurs **verbatim** in
`Main.lean`, and its declared digest
`ad366e9b9b28361a0807442124798e87842115ac2c0e5b4d587a86095ef587ac`
recomputes exactly. `conclusion.statement` is the same text whitespace-collapsed.

**Capsule gate (recomputed by me, independently of the producer).** The sealed
award capsule `control/c6-stage7-capsules/C6-LA2-PACKET-MANIFEST.json` re-seals
to `dc08ef8ca8dc5052e450d67b1982e4ec195615f54dfa9764a89bceb8f20ac619` under
SHA-256 of the compact key-sorted JSON of the manifest minus `seal_sha256`
(`separators=(",",":")`, `sort_keys=True`, no trailing newline) — the brief's
expected seal. All **9 of 9** member files match on both byte count and digest.
`INFORMAL-PROOF.md` re-hashes to
`ebbdbd95562aee01b71614460325da1e4d7dea2f1a25288706723c4fe17c6706`, and all 12
`source_materials` digests in the contract reproduce. The frozen G1 source
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` re-hashes to
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`, the value
`SEMANTIC-CONTRACT.md` and `INFORMAL-PROOF.md` §1 both cite.

**Kernel receipt.** `RECEIPTS/kernel-verification.json` of the child re-hashes
to `d8b3858092ff38bddd9f4ab31c0f6d3dd8d4597b4e9a960510de73e1e6a829bb` — the
value the coordinator names — reports `verdict.code = "verified"` with all 11
checks passed, and binds `source_sha256_before = source_sha256_after =
8770a6c5…`, i.e. the child's own `Main.lean`, with its `axioms_log_sha256` and
`build_log_sha256` reproducing byte-exactly against the files present
(`EVIDENCE/build.log`: `Build completed successfully (8657 jobs)`, and zero
occurrences of `sorry`, `sorryAx` or `native_decide` in the log).

**Immutability during the audit.** I re-hashed `THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, `Main.lean` and `EVIDENCE/verify_band_carry_step_hall.py`
at the end of the audit: all unchanged from the values above.

---

## Claim Ledger

Granularity: one row per definition, lemma and inference step. "Where the
hypothesis enters" is tracked per row. Every equality marked *(recomputed)* was
evaluated with my own exact-integer instrument
(`scratchpad/c6-s7-informal-LA2-repair-1/audit_instrument.py`), not read off the prose.

### Definitions (ENTRIES 1–12)

| id | object | statement as compiled | dependencies | verdict |
|---|---|---|---|---|
| D1 | `choose (n : ℕ) (k : ℤ) : ℤ` | `if 0 ≤ k then (n.choose k.toNat : ℤ) else 0` | ℤ | **verified** — the integer zero extension of `SEMANTIC-CONTRACT.md` §Conventions; also 0 for `k > n` via `Nat.choose`. Renamed from the seat's `C` (repair (3)). |
| D2 | `E (n : ℕ) (k : ℤ)` | `choose n (k+1) - choose n k` | D1 | **verified** |
| D3 | `D (b : ℕ) (m : ℤ)` | `choose b (m+1) - 2*choose b m + choose b (m-1)` | D1 | **verified**, the second difference |
| D4 | `capTerm (b : ℕ) (m : ℤ) : ℕ` | `(max 0 (D b m)).toNat` | D3 | **verified** — `max 0 x ≥ 0`, so `.toNat` is faithful; no truncation of information |
| D5 | `Mclamped (r a : ℕ) (m : ℤ) : ℕ` | `if a ≤ 2*r-1 then (Finset.range (2*r-a)).sup (fun b => capTerm b m) else 0` | D4 | **verified RANGED** — `Finset.range (2r−a)` is exactly `0 ≤ b ≤ 2r−1−a`; `Finset.sup ∅ = 0` reproduces the record's empty-range convention; `max_b max(0,D) = max(0, max_b D)` |
| D6 | `Bd (r : ℕ) (k : ℤ)` | `D (2*r-1) k + ∑ a ∈ Icc 1 6, (Nat.choose 6 a : ℤ) * (Mclamped r a (k-a) : ℤ)` | D3,D5 | **verified** — the RANGED object of record *(recomputed: see §Reproduced Evidence A)* |
| D7 | `indepCount F (k : ℕ)` | `(Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)` | graph | **verified** — character-for-character `SEMANTIC-CONTRACT.md` and the frozen G1 source, modulo the namespace prefix |
| D8 | `coeff F (k : ℤ)` | `if 0 ≤ k then indepCount F k.toNat else 0` | D7 | **verified** — ditto; the integer zero extension |
| D9 | `delta F (k : ℤ)` | `coeff F (k+1) - coeff F k` | D8 | **verified** — ditto; this is `Δ_k(F)` |
| D10 | `nonCover C` | `Finset.univ \ C` | graph | **verified** — `B = V ∖ C` |
| D11 | `bFinset C S` | `nonCover C \ S.biUnion (F.neighborFinset ·)` | D10 | **verified** — `b_S = \|B ∖ N(S)\|` in the ORIGINAL `F`, as the record requires |
| D12 | `partner M v` | `if h : ∃ w, M.Adj v w then h.choose else v` | graph | **verified** — the ONLY declaration under `attribute [local instance] Classical.propDecidable`, scoped by `section PartnerConstruction` (line 128) … `end PartnerConstruction` (line 144). I confirmed by inspection: exactly one occurrence of the attribute in the whole file, and **zero** occurrences of `Subsingleton.elim`. |

**Definition check against `SEMANTIC-CONTRACT.md` (brief item 3).** I extracted
the `indepCount`/`coeff`/`delta` block from `SEMANTIC-CONTRACT.md` and the
corresponding ENTRIES 7–9 from `Main.lean`, stripped comments and the entry
tags, whitespace-normalized both, and removed the `Erdos993G1.` prefix: the two
strings are **exactly equal**. The same three definitions also match the frozen
G1 source byte-for-byte after the prefix strip. `coeff`/`delta` therefore carry
the binding integer-zero-extension convention unmodified. `Bd` is not defined in
`SEMANTIC-CONTRACT.md`; I checked it against the RANGED object as stated in the
sealed capsule (synthesis `## Exact established results` B1, `## Lean awards`
Dispatch 2, and the F adjudication `## Lean readiness`) and re-implemented it
independently — see §Reproduced Evidence A.

### Arithmetic and numeric lemmas (ENTRIES 13–19)

| id | lemma | verdict |
|---|---|---|
| L1 | `D_eq_diff_E : D b m = E b m - E b (m-1)` | **verified** *(recomputed: no counterexample for `b ≤ 39`, `m ∈ [−5,44]`)* |
| L2 | `clamp_lemma : t.card ≤ n → 0 ≤ B → (∀ x ∈ t, f x ≤ B) → ∑ x ∈ t, f x ≤ n*B` | **verified** — graph-free; the `0 ≤ B` hypothesis is load-bearing and is discharged at the use site because `Mclamped` is ℕ-valued. Carried unmodified from seat F3's `Arithmetic.lean`. |
| L3–L7 | `bd_two_two … bd_six_six` (`Bd 2 2 = 24`, `31`, `48`, `33`, `-16`), all by `decide` | **verified** *(recomputed independently: all five)*. Plain `decide`, not `native_decide`; the kernel receipt's `unsafe_execution_scan` passed. These are **named lemmas**, not anonymous `example`s — the precise defect C-F3-U's certification audit item 1 struck in the originating return. |

### Graph lemmas and the two nodes (ENTRIES 20–34)

| id | lemma | hypotheses and where they enter | verdict |
|---|---|---|---|
| L8 | `indepCount_eq_card` | `[Fintype V] [DecidableEq V] [DecidableRel F.Adj]` | **verified** — bridges `Nat.card` of the subtype to the `Finset` filter's card |
| L9 | `nonCover_indep : F.IsIndepSet ↑(nonCover C)` | `hC` **only** | **verified** — `B` is independent because `C` covers; no `ν = τ`, no acyclicity |
| L10 | `fiber_card` | `hC`, `S ⊆ C`, `S` independent | **verified** — the fiber over `S` has card `choose(b_S, n−\|S\|)`, by the explicit bijection `T ↦ T∖C`, `U ↦ U ∪ S` (`Finset.card_nbij'`) against `Finset.card_powersetCard` |
| L11 | **NODE (i)** `coverFiberPartitionIdentity : coeff F k = ∑_{S ⊆ C indep} choose(b_S, k − \|S\|)` | `hC` **only** — no `ν = τ`, no order hypothesis, no `\|C\| = 6` | **verified** *(recomputed on 1,610 graphs; see B)* |
| L12 | `delta_fiber` | `hC` | **verified** — once-differenced form; this is the registered `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` |
| L13 | `carry_fiber : delta F k − delta F (k−1) = ∑_S D(b_S, k−\|S\|)` | `hC` | **verified** — twice-differenced form, the identity the composition consumes |
| L14–L20 | `partner_adj`, `partner_eq`, `partner_mem`, `partner_ne`, `partner_involutive`, `partner_injOn`, `partner_mem_cover` | `hM` (matching); `hC` for `partner_mem_cover` | **verified** — `φ` is a fixed-point-free involution of `M.verts`, and maps `M.verts ∖ C` into `C` because every `M`-edge is an `F`-edge and `C` covers it |
| L21 | `cover_subset_and_partner_out : (∀ v ∈ C, v ∈ M.verts) ∧ (∀ v ∈ C, partner M v ∉ C)` | `hM`, `hC`, `M.verts.ncard = 2*C.card` | **verified** — counting: `φ` injects `W∖C` into `W∩C`, so `\|W∖C\| ≤ \|W∩C\| ≤ \|C\|` and `\|W∖C\|+\|W∩C\| = 2\|C\|` force **both** to equal `\|C\|`; hence `C ⊆ W`, `φ(W∖C) = C`, and the involution sends `C` back into `W∖C` |
| L22 | **NODE (ii)** `konigSaturation : (bFinset C S).card ≤ (nonCover C).card − S.card` for **every** `S ⊆ C` | `hM`, `hC`, `M.verts.ncard = 2*C.card`. **This is the ONLY place `ν = τ` enters the whole proof.** | **verified** *(recomputed: holds on all 10 hand-built qualifying graphs for every `S ⊆ C`; fails on the controls — see C)* |

### The composition (ENTRY 35): inference steps

| step | inference | hypotheses consumed | verdict |
|---|---|---|---|
| S1 | `4 ≤ r`, **derived** from `12 = M.verts.ncard ≤ Fintype.card V = 2r+5` via `Set.ncard_le_ncard` + `omega` | `hMcard`, `hcard` | **verified** — `12 ≤ 2r+5 ⟹ 2r ≥ 7 ⟹ r ≥ 4` in ℕ. Not assumed; the target statement is complete as written. |
| S2 | `(nonCover C).card = 2r − 1` | `hcard`, `hCcard` | **verified** — `\|B\| = (2r+5) − 6 = 2r−1`; with `r ≥ 4` this is `≥ 7 > 0`, no ℕ-truncation |
| S3 | rewrite by `carry_fiber` | `hC` | **verified** (L13) |
| S4 | fiberwise split by `a = \|S\| ∈ range 7` (`Finset.sum_fiberwise_of_maps_to`), then `range 7 = insert 0 (Icc 1 6)` | `hCcard` (via `S ⊆ C ⟹ \|S\| ≤ 6`) | **verified** |
| S5 | `a = 0` fiber is exactly `{∅}`; `b_∅ = \|B\| = 2r−1`; head term is `D(2r−1,k)` **exactly**, not a bound | `hcard`, `hCcard` | **verified** — `S.card = 0 ↔ S = ∅` for a `Finset`; `bFinset C ∅ = nonCover C` since `Finset.biUnion ∅ = ∅` |
| S6 | each `a ∈ [1,6]` fiber: `card ≤ Nat.choose 6 a` (`Finset.card_powersetCard`, using `hCcard`); each term `D(b_S,k−a) ≤ capTerm(b_S,k−a) ≤ sup_{b<2r−a} capTerm ≤ Mclamped r a (k−a)` by **node (ii)** + `Finset.le_sup`; `clamp_lemma` closes the fiber | `hCcard`, **`hM`/`hMcard` through node (ii)**, `hcard` | **verified** — see the ℕ-subtraction audit below |
| S7 | head + six clamped strata `= Bd r k` by definition | — | **verified**, definitionally exact |

### ℕ-subtraction and cast audit (brief item 1)

Every natural subtraction and every cast in the proof, checked for truncation:

1. `fiber_card`, positive branch: the *statement* uses **integer** subtraction
   `(n : ℤ) − (S.card : ℤ)`. The ℕ-subtraction `n − S.card` appears only inside
   `htoNat`, under the branch hypothesis `hcard : S.card ≤ n`, so it is exact
   (`omega`). **No truncation.**
2. `fiber_card`, negative branch: `|S| > n` is closed by **emptiness**
   (`S ⊆ T` forces `|S| ≤ |T| = n`), not by arithmetic. `choose` is 0 by
   `if_neg`. This is exactly what `INFORMAL-PROOF.md` §3 asserts. **Correct.**
3. `coverFiberPartitionIdentity`, `k < 0`: both sides are 0 under the same
   `if 0 ≤ ·` zero extension on `coeff` and on `choose`. I confirmed the
   telescoping base numerically: `coeff(−1) = 0` and the fiber RHS at `k = −1`
   is `0` on all 10 hand-built qualifying graphs.
4. `konigSaturation`: the conclusion `(nonCover C).card − S.card` is **ℕ**
   subtraction. Truncation would make the right side *smaller*, i.e. the claim
   *stronger*, so it can never create a hole; and truncation does not in fact
   occur, because the proof builds `T = S.image (partner M) ⊆ nonCover C` with
   `|T| = |S|`, forcing `|S| ≤ |B|`, and closes by `Finset.card_sdiff` on
   `T ⊆ nonCover C`, which is exact. This is `INFORMAL-PROOF.md` §3's claim, and
   it is discharged **by proving the lemma**, not by assertion.
5. `Mclamped`/`Bd`: `2*r−1` and `2*r−a` are ℕ subtractions. I emulated the Lean
   definitions literally, truncation and guard included, and compared against the
   mathematical ranged object on `r ∈ [0,12] × k ∈ [−6,25]`: **zero
   divergences** for every `r ≥ 1` (at `r = 0` the record object is undefined
   because `2r−1 = −1`, and `r = 0` is unreachable under S1). The guard
   `a ≤ 2*r−1` returning 0 coincides with the record's empty-range convention.
6. Composition, `hrange`/`hguard`: with `4 ≤ r` (S1) and `1 ≤ a ≤ 6`, we have
   `2r−1−a ≥ 1` and `2r−a ≥ 2`, so `b_S ≤ 2r−1−a < 2r−a` is a truncation-free
   ℕ statement and `a ≤ 2r−1` holds. `omega` is sound here for exactly that
   reason. **No truncation.**

### Hypotheses match the claim one-for-one (brief item 3)

The `informal_statement`'s closing enumeration — "V a fintype vertex type with
decidable equality; F a simple graph on V with decidable adjacency; r a natural
number with `Fintype.card V = 2*r+5`; C a finset vertex cover of F with
`C.card = 6`; M a matching subgraph of F with `M.verts.ncard = 12`; k ranges over
all integers" — is **one-for-one** with the Lean binder list, in order, with
nothing added and no conjunct dropped. In particular it correctly types `r` as a
natural number. Every one of the five hypotheses is *consumed*: `hcard` at S1/S2,
`hC` at L9/L10/L11/L21/L22, `hCcard` at S2/S4/S6, `hM`+`hMcard` at S1 and through
node (ii) at S6. There is no idle hypothesis that would signal a mis-stated
theorem.

### Nothing marked NOT a dependency is a dependency

The award statement says "the frozen G1 project is not imported." Verified:
`Main.lean`'s only import is `import Mathlib`; there are **zero** occurrences of
`Erdos993G1` or `g1-c3` in the file; `LeanProject/lake-manifest.json` lists only
Mathlib and its standard transitive packages. The contract's
`success_criteria.sorry_free: true` is verified: zero `sorry`, `admit`,
`native_decide` tokens in `Main.lean`; zero `sorryAx` in the axiom log; 35
registered declarations and 35 axiom-print lines, with no anonymous `example`
anywhere (condition (v) satisfied literally). Axioms are `[propext,
Classical.choice, Quot.sound]` for every declaration except four
(`choose`, `E`, `D`, `capTerm`) that depend on **none**, and `D_eq_diff_E` which
depends on `[propext]` alone — all strict subsets of the permitted set.
`RECEIPTS/kernel-verification.json` reports `verdict.code = "verified"` with all
11 checks passed, and I confirmed it binds
`source_sha256_before = source_sha256_after = 8770a6c5…`, the digest of the
`Main.lean` I audited in this child run, with its `axioms_log_sha256` and `build_log_sha256`
reproducing byte-exactly against the files on disk.

---

## Reproduced Mathematical Evidence

All evidence below was produced by code **I wrote myself**, from the definitions
of record, under `scratchpad/c6-s7-informal-LA2-repair-1/`. I imported no prior
evaluator: not the producer's `EVIDENCE/verify_band_carry_step_hall.py`, and no
seat, critic or adjudicator generator. Python standard library only (`math`,
`itertools`, `json`, `hashlib`, `random`, `sys`; import list at the top of each
file). No wall-clock, PID or host field is emitted. Foreground execution only;
no network, no installs, no `lake`/`elan` of any kind.

| artifact | purpose |
|---|---|
| `audit_instrument.py` → `audit-instrument-output.json` (`482afd48f6ad7f581a5535530937154f92ce30d1c8d5ac4516cb2a94272796e3`) | ranged `Bd` two ways; node (i), node (ii), carry step on 10 hand-built graphs; 5 controls |
| `stress_sweep.py` → `stress-sweep-output.json` (`17a0cc6973128a6b7bbd0397b049380a4e121ca30a36a53a7c82485223f51799`) | seeded randomized search for a counterexample over 1,600 qualifying graphs |
| `hall-all-S-and-minimality.txt` | node (ii) as **literally** stated (every `S ⊆ C`, not only independent `S`) |
| `fixed-point-control.txt` | validation of my own machinery against a registered fixed point |
| `fence-check.txt` | fence/scope-exclusion presence check |
| `producer-generator-replay.txt` | byte-identical replay of the producer's shipped generator |

### A. The RANGED `Bd` — two independent implementations, and the range's force

I implemented `Bd` twice: (A1) the mathematical ranged object of record, and
(A2) a literal emulation of the compiled Lean definition *including* truncated
natural subtraction and the `if a ≤ 2*r−1` guard. Results:

- **Zero divergences** between A1 and A2 on `r ∈ [0,12] × k ∈ [−6,25]` for every
  `r ≥ 1`, and in particular on the whole required grid `r ∈ [2,9] × k ∈ [−3,20]`
  (192 cells).
- All four named checkpoints reproduce on **both** implementations:
  **`Bd(4,4) = 48`**, **`Bd(5,5) = 33`**, **`Bd(6,6) = −16`**,
  **`Bd(10,10) = −14406`**. So do the five kernel-checked Lean `decide` lemmas:
  `Bd(2,2) = 24`, `Bd(3,3) = 31`, and the three above at `r = 4,5,6`.
- Diagonal `r = 2..10`: `24, 31, 48, 33, −16, −210, −963, −3810, −14406` —
  the canonical figures; sign profile `Bd(r,r) ≥ 0 ⟺ r ∈ {2,3,4,5}` exactly,
  and that remains true out to `r = 16`.
- **The range is load-bearing, positively demonstrated.** Replacing the ranged
  clamp `max_{0≤b≤2r−1−a}` by the unranged `max_{0≤b≤2r−1}` gives
  `Bd(r,r) ≥ 0` for **every** `r ∈ [2,16]` (e.g. `+2225` at `r = 6` where the
  ranged object is `−16`), i.e. the unranged object never turns negative in the
  tested range. Without the range the object of record would be a different and
  useless one. This independently confirms erratum `C4-E-c` as the synthesis
  describes it, and confirms that node (ii) — which is precisely what supplies
  `b_S ≤ 2r−1−a` — is doing the work.

`D_eq_diff_E` recomputed with no counterexample for `b ≤ 39`, `m ∈ [−5,44]`.

### B. Node (i), node (ii) and the carry step on `ν = τ = 6` graphs

**Hand-built family (10 graphs).** Five of order 13 (`r = 4`, `|B| = 7`) and five
of order 15 (`r = 5`, `|B| = 9`), with `C = {0,…,5}` and the 6-edge matching
`{(i, i+6)}`: two forests plus three non-forests at each order, including a
triangle (`0–1–12`), an even 4-cycle, an odd 5-cycle (`0–12–1–13–2–0`), and dense
`K_{6,1}` / `K_{6,2}` hubs with cover-internal edges. For every graph I computed
`τ` by exhaustive subset search, `ν` by exhaustive matching search, acyclicity by
union-find and bipartiteness by 2-colouring — **nothing assumed**. Results:

- All 10 have `ν = τ = 6` with `|C| = 6`; **6 are non-forests** and **5 contain
  an odd cycle** (hence are non-bipartite).
- **Node (i) holds exactly** on every graph, against full `2^n` subset
  enumeration, at every `k ∈ [−4, n+2]`.
- **Node (ii) holds as literally stated** — for *every* `S ⊆ C`, not merely the
  independent ones — with 0 failures on all 10.
- **Carry step: 0 violations**, and the tightest slack is **0** (the bound is
  attained, not vacuous).

**Randomized stress sweep (1,600 further graphs).** Seeded, reproducible search
over random edge sets seeded with a 6-edge matching plus random cover-internal
and cover-to-`B` edges, filtered by exhaustive `ν = τ = 6`: **1,200 at order 13**
(182 forests, 1,018 non-forests, 745 non-bipartite, up to 40 edges) and **400 at
order 15** (43 forests, 357 non-forests, 256 non-bipartite, up to 46 edges).
Independent-set counts by an exact lowest-set-bit recurrence over all `2^n`
masks, `k ∈ [−3, n+2]`.

> **0 fiber-identity failures and 0 carry-step violations in 1,600 graphs;
> minimum slack 0; 17,603 tight cells.**

Together with the hand-built family that is **1,610 qualifying graphs, 1,381 of
them non-forests and 1,006 non-bipartite, at zero violations.** Acyclicity is
therefore not merely absent from the proof text — it is positively excluded as a
hidden hypothesis.

**Instrument validation against an independent datum.** `SOLUTION-CONTRACT.md`
§3 registers the refutation `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`:
`6K₂ ∪ (2r−7)K₁` has `Δ_r > 0` at `d = 5`. My instrument reproduces it exactly:
`Δ_r = 32, 68, 164` at `r = 4, 5, 6`, matching a closed-form hand computation
from `(1+2z)^6(1+z)^{2r−7}`. This validates my brute-force machinery against a
figure registered independently of this award.

### C. The `ν < τ` control — the hypothesis is load-bearing

The brief requires a control showing the hypothesis is not decorative. I built
five, each with a genuine vertex cover `C` of card 6 but **no** matching
saturating 12 vertices:

| control | `ν` | `τ` | node (ii) on independent `S` | carry step |
|---|---|---|---|---|
| CTRL-1 order 13, empty graph | 0 | 0 | 63 failures | **violated at 10 of the scanned `k`; worst `carry = 221` vs `Bd = 0` at `k = 10`** |
| CTRL-2 order 13, `3K₂` inside `C` + `7K₁` | 3 | 3 | 26 failures | **violated at 7 `k`; worst `130` vs `0`** |
| **CTRL-3 order 13, triangle + edge, `ν = 2 < τ = 3`** | **2** | **3** | 42 failures | **violated at 7 `k`; worst `109` vs `0`** |
| CTRL-4 order 13, triangle + `4K₂`, `ν = 5 < τ = 6` | 5 | 6 | 0 failures | holds |
| CTRL-5 order 15, `3K₂` inside `C` + `9K₁` | 3 | 3 | 26 failures | **violated at 9 `k`; worst `439` vs `64` (excess 375)** |

CTRL-3 is the required genuine `ν < τ` control (König failing; non-bipartite):
dropping the matching hypothesis while keeping a card-6 cover breaks the bound by
as much as 109. The hypothesis is load-bearing, decisively.

CTRL-4 is a calibration datum, not a failed control, and it locates the
hypothesis precisely. There `ν = 5 < τ = 6` and `C` is a *minimum* cover; node
(ii) **does** fail as literally stated — at the non-independent `S = {0,1}`,
where `b_S = 6 > 5 = |B| − |S|` — yet the carry step holds, because the
composition consumes node (ii) only at *independent* `S`, and for a minimum cover
the independent-`S` bound is automatic (if some independent `S ⊆ C` had
`|N(S) ∩ B| < |S|`, then `(C ∖ S) ∪ (N(S) ∩ B)` would be a smaller cover). So the
theorem's hypothesis is *sufficient and not minimal*. **This is not an
over-claim:** neither the synthesis nor `INFORMAL-PROOF.md` §2 claims minimality.
Their "equivalent, not merely sufficient" language is about the *packaging* —
`{C a cover, |C| = 6} ∧ {M a matching, |M.verts| = 12} ⟺ ν(F) = τ(F) = 6` — and
I verified both directions of that equivalence (`ν ≤ τ ≤ |C| = 6` and `ν ≥ 6`
close it; conversely `ν = τ = 6` supplies both witnesses). Node (ii) as stated is
in fact *equivalent* to `ν = 6` given a card-6 cover, by Hall's theorem, so the
stated hypothesis and the stated lemma are correctly matched to each other.

### D. Replay of the producer's shipped evidence

I re-ran `EVIDENCE/verify_band_carry_step_hall.py` in the foreground: it
reproduces `EVIDENCE/band-carry-step-hall-instance-check.out.json` **byte for
byte** (`all_checks_passed: true`), and every mathematical claim it makes was
independently confirmed by my own instrument. I found no substantive error in
it. One evidentiary imprecision is recorded under Finding 1 below.

---

## Independent Critic Pass

### Re-issue on the repaired registration — the diff, verified

This audit **re-issues** my `passed` audit of the parent run
`runs/lean-2026-09-22-c6-band-carry-step-hall` (audit SHA-256
`0339dd81fc5d56f36a0e0fbf130fb34220339758a6e6cdb9834b4f4e83333877`) on the
bounded-repair child. The parent's close was blocked on a registration defect,
not a mathematical one: its 35 entries were registered under **bare** names. The
formalizer re-registered the identical fragments under **fully qualified** names
in the child. I treated that account as a claim to be checked, not as a premise.

**What I verified, mechanically** (`main-lean-diff-check.txt`):

- Parent `Main.lean` `ef2e18ac…`; child `Main.lean`
  `8770a6c5d0198fbe743246cff3e2cf2d0eab0eb292e391759556c3296911efd0` — the
  coordinator's value. Both files are **767 lines**.
- Exactly **35 differing lines**, and every one of them is a
  `-- VERITYOS ENTRY n BEGIN <kind> <name> <64-hex>` marker comment. For each:
  the **entry number is unchanged**, the **kind is unchanged**, the **64-hex
  fragment hash is unchanged**, and the name changes exactly from `<name>` to
  `ErdosR25BandCarryStep.<name>`. **Zero** nonconforming differences.
- The 35 `… END` markers are identical on both sides.
- **Decisive check:** deleting every `-- VERITYOS ENTRY …` line from both files
  leaves 697 lines each, and those 697 lines are **byte-identical**
  (`5e8a56e0f74e2d2f2abf28625d2192756ae08f5491beab72d92d312030b01adb` on both).
  **Not one character of Lean changed** — no definition, no statement, no proof
  term, no tactic, no import, no attribute, no `section` boundary.

**What follows, and what does not.** Because the Lean content is byte-identical,
**nothing in the claim ledger changes**: every definition row, every lemma row,
the ℕ-subtraction audit, the hypothesis one-for-one check and all seven
composition inference steps stand exactly as recorded, and they stand on the
child's own bytes, not by inheritance. I re-established the machine-checkable
parts directly against the child rather than carrying them over on assertion:
`indepCount`/`coeff`/`delta` re-extracted from the **child** and matched
character-for-character against `SEMANTIC-CONTRACT.md` (namespace stripped);
`choose`, `Mclamped` and `Bd` re-extracted from the child and matched against
the parent's text; `THEOREM-CONTRACT.yaml` and `INFORMAL-PROOF.md`
byte-identical to the parent's (`3aa3f94e…`, `ebbdbd95…`), so `claim_sha256` is
necessarily unchanged and I recomputed it from the **child's** contract to
confirm; `expected_statement` verbatim in the child's `Main.lean` with digest
`ad366e9b…`; `declaration_name` fully qualified as
`ErdosR25BandCarryStep.bandCarryStepHall`; exactly one `theorem`; zero
`sorry`/`admit`/`native_decide`/`Subsingleton.elim`/`IsTree`/`IsAcyclic`/
`firstDescent` tokens; `import Mathlib` only and zero `Erdos993G1` references;
35 of 35 declarations axiom-printed with zero `sorryAx` and nothing outside the
three standard axioms; capsule verification passed. All 35 registrations in
`FORMALIZATION-STATE.json` are now fully qualified, **none bare** — the repair's
stated object, confirmed.

The `EVIDENCE/` tree is byte-identical to the parent's: the generator
(`7cda4768…`), its digested output (`661af044…`) and the axiom-check file
(`f7b79d57…`) all carry the same digests, so the producer's numeric evidence is
literally the same artifact I already replayed. My own instrument re-ran in this
directory to the same digest
(`482afd48f6ad7f581a5535530937154f92ce30d1c8d5ac4516cb2a94272796e3`),
confirming determinism, and the sweep output is carried unchanged
(`17a0cc6973128a6b7bbd0397b049380a4e121ca30a36a53a7c82485223f51799`). Since the
mathematical objects are the same bytes, re-running the 1,610-graph search would
re-derive the same numbers; I report that honestly rather than dressing a carried
result as a fresh one.

**Findings 1–5 below are carried unchanged**, because every artifact they
concern is byte-identical in the child. Finding 5 (the producer's disclosed
`/tmp` deviation) is a **parent-run** disclosure; I re-confirmed that the
child's own kernel receipt binds the child's own source digest, so the child's
receipt is sound on its own terms whatever the controller decides about the
parent's hygiene.

### The pass itself

I ran a separate adversarial pass over my own ledger before closing, hunting for
the defect classes this run has repeatedly produced: ℕ-truncation holes, a
silently unranged `Bd`, an acyclicity or `x(F) < r` premise smuggled in, a
weakened statement obtained to make the build pass, an over-claimed grade, a
mis-stated `sorryAx` count, and a numeric checkpoint asserted rather than
recomputed. Every one of those came back clean; the ℕ-subtraction audit above is
the full record. I then re-read `INFORMAL-PROOF.md` line by line against the
compiled source. The following are what survived. **None is a defect in the
proof; none changes the verdict.** I record them because an auditor who records
nothing has not looked.

**Finding 1 (evidence quality, producer's generator).** In
`EVIDENCE/verify_band_carry_step_hall.py`, `check_graph` computes
`is_acyclic = (len(edges) == n - 1) and _is_connected_or_forest(n, edges)`. That
is a *tree* test, not a *forest* test. Consequently the shipped digested output
reports `"is_forest": false` for **all three** graphs, including the two that
`INFORMAL-PROOF.md` §8 describes as forests, and Python's short-circuit means the
union-find is never actually invoked for any of them. §8's sentence "verified
acyclic-or-not by explicit union-find, NOT assumed" is therefore **not
certified** by the digested artifact. The underlying assertions are nonetheless
**true**, which I verified independently with my own union-find: graph A
(`6K₂ + K₁`) and graph B (`6K₂` + a satellite on covers 0 and 1) are forests, and
graph C adds the cover-internal edge `0–1`, closing the triangle `0–1–12` — an
*odd* cycle, so C is not merely non-forest but non-bipartite. My own 1,381
non-forest and 1,006 non-bipartite instances supply the acyclicity-independence
evidence at far greater strength than the three shipped graphs. Recommendation
for the controller: the `is_forest` field should be `_is_connected_or_forest`
alone, or §8's sentence trimmed. Non-blocking. (I also note the docstrings of
`build_graph_B`/`build_graph_C` argue with themselves in-line — cosmetically
poor, but they land on the correct conclusion.)

**Finding 2 (contract metadata, fidelity-seat territory).** The contract's
`hypotheses` array is empty though the theorem binds five hypotheses, and
`quantifiers` files `r` under `domain-int` (`lean_type: ℤ`) though `r : ℕ`, and
`C`/`M` under `domain-graph` (`lean_type: SimpleGraph V`) though `C : Finset V`
and `M : F.Subgraph`. The authoritative typing is carried correctly by
`conclusion.statement`, by `lean_binding.expected_statement` (verbatim in the
source, digest recomputed), and by the `informal_statement`'s one-for-one
hypothesis enumeration, which types `r` correctly as a natural number. The
intended claim is therefore unambiguous. Non-blocking; I flag it for the record.

**Finding 3 (contract DAG over-declaration).** `conclusion.dependencies` lists
`def-d-eq-diff-e`, but `D_eq_diff_E` is **not** on the terminal theorem's proof
path: `delta_fiber` and `carry_fiber` both close by `simp only [E, D]; ring_nf`,
never invoking it. This is an over-declared dependency — harmless, since the
lemma is true (recomputed), compiled and axiom-clean. The dangerous direction —
a real dependency left undeclared, or something marked NOT a dependency that is
one — does **not** occur. The contract's DAG also omits the 20 auxiliary lemmas
and lists no Mathlib names; that is a completeness gap against the formalizer
brief §5 step 5, not a statement-fidelity mismatch.

**Finding 4 (notation).** `INFORMAL-PROOF.md` §1 writes `Bd`'s stratum
coefficient as `choose(6,a)`, while the compiled `Bd` uses `Nat.choose 6 a` and
`choose` is the project's own zero-extended binomial. The two agree on the
summation range `a ∈ [1,6]`, so the object is unchanged; the prose is
notationally loose, not wrong.

**Finding 5 (process, disclosed by the producer, outside my mathematical
remit).** `FORMALIZER-REPORT.md`'s `## Disclosed deviation` discloses three
transient `/tmp` writes and a `cp` of a `/tmp` capture over
`RECEIPTS/kernel-verification.json` — the exact species of brief-rule breach the
formalizer brief §1 names. I neither waive nor adjudicate it; that is the
controller's. What I can attest mathematically is that the receipt on disk is
bound to the source I audited: `source_sha256_before = source_sha256_after =
8770a6c5…` is the current `Main.lean` digest, and the receipt's `axioms_log`
and `build_log` digests reproduce byte-exactly against the files present. No
mathematical consequence found.

**Convergence check.** I formed Findings 2, 3 and 4 from the contract and the
Lean source directly, before reading `FIDELITY-REVIEW.md`. On reading it at the
end of this pass I found that the isolated fidelity seat
(`c6-la2-fable-fidelity-20260922`) had independently recorded the same three
items as notes plus a dependency-graph completeness warning, on a `match`
verdict. Two seats that could not see each other converging on the same
non-blocking metadata set, and on nothing else, is corroboration for the ledger
rather than a new defect.

**Claims I could not verify, named as such.** The scratchpad paths cited in
`INFORMAL-PROOF.md` §0 (`scratchpad/c6-crit-F3-T/…`, `scratchpad/c6-crit-F3-U/…`)
are outside my read boundary and I did not open them. I verified the attribution
against the **sealed critiques themselves** instead: C-F3-T's `## Attacks and
findings` §E is titled "Both open nodes and the composed target are provable, and
I proved them"; C-F3-U's §A is "The decisive finding: all three `sorry`ed
statements are provable, and I proved them"; C-F3-T §F is "Natural-versus-integer
subtraction in `konigSaturation` — not a hole", exactly as §3 cites it; and both
critics' certification audits strike the seat's "two of three" `sorryAx` literal
in favour of **all three** (C-F3-T item 3, C-F3-U item 2 — the precise item
numbers `INFORMAL-PROOF.md` §7 cites). Every attribution the document makes is
supported by a sealed, digest-verified member of the capsule.

---

## Scope and Fence Check

I checked each mandatory fence and excluded conclusion for presence in **both**
places condition (ii) requires — the contract's `informal_statement` and
`INFORMAL-PROOF.md` — and, separately, for truth against the compiled source.

| fence / excluded conclusion | in `informal_statement` | in `INFORMAL-PROOF.md` | true of the compiled source? |
|---|---|---|---|
| FIXED-BAND `d = 5`, **named as such** | yes | yes (§6) | yes |
| `d` enters only through the order `2r+5` | yes | yes (§2) | **yes** — the only literal `5` in `Main.lean` outside comments and the lemma name `bd_five_five` is in `hcard : Fintype.card V = 2 * r + 5` |
| `x(F) < r` enters nowhere | yes | yes (§2, §6) | **yes** — no `firstDescent` or equivalent anywhere |
| acyclicity enters nowhere | yes | yes (§2, §6) | **yes** — no `IsTree`/`IsAcyclic` token; positively evidenced by 1,381 non-forest and 1,006 non-bipartite instances at 0 violations |
| `Bd` is the RANGED object; the range is load-bearing | yes | yes (§1, §6) | **yes** — `Finset.range (2*r−a)` is exactly `b ≤ 2r−1−a`; demonstrated load-bearing in §A |
| `r ≥ 4` is **derived**, not assumed | yes | yes (§2, §6) | **yes** — step S1 |
| a SECOND formally verified INPUT to `E993-R25-FOURTH-BAND-CLOSE-ALL-R`, **not a closure** | yes | yes (§6) | n/a (scope) |
| that composition stays `proved_informal` at its weakest link | yes | yes (§6) | n/a |
| arithmetic tail (`E993-R25-BD-TAIL-NEGATIVE`) untouched | yes | yes (§6) | n/a |
| the general half of `c(5) = 5` untouched | yes | yes (§6) | n/a |
| Corollary F at `d = 5` untouched | yes | yes (§6) | n/a |
| the finite part untouched | yes | yes (§6) | n/a |
| progress toward **NO** tier | yes | yes (§6) | n/a |
| resolves **no** headline | yes | yes (§6) | n/a |
| node (i) recorded separately as, in substance, the first Lean proof of the registered `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` (differenced form, equivalent under integer zero extension) — recorded, **not** registered by this formalizer | yes | yes (§3, §5) | consistent: I verified the equivalence's telescoping base, `coeff(−1) = 0 = ` RHS`(−1)` |
| attribution to **C-F3-T and C-F3-U for ALL THREE** declarations, on seat F3's unmodified `clamp_lemma` and `Arithmetic.lean`, precedent `E993-R25-MATCHING-DUAL-SCALAR-CORE` | yes | yes (§0) | supported by the sealed critiques |

**All 16 items are present in both required places.** The claim asserts nothing
fenced: it is a fixed-band `d = 5` statement, named as such, about a single
inequality at every integer `k`, with no tier, headline, closure or
`formally_verified` content anywhere in the contract, the informal proof or the
report — all three explicitly disclaim it, and `INFORMAL-PROOF.md`'s
`## Remaining gates` states `compiled-candidate` status only.

**The five mandatory repairs (condition (iii)) — all five present.**

1. **"all three", not "two of three."** `constructivity.rationale` states
   `sorryAx` was on **ALL THREE** theorem-level declarations of the originating
   seat's `GraphNodes.lean` and explicitly refuses to carry the seat's literal.
   `INFORMAL-PROOF.md` §7 records the same with the correct citations. ✔
2. **`success_criteria.sorry_free: true`** for this award's own `Main.lean`,
   and verified true by me (zero tokens, zero `sorryAx`). ✔
3. **Binomial renamed.** `ErdosR25BandCarryStep.choose`, so the theorem
   statement's cover binder `C` survives exactly as the award's exact form
   requires. ✔
4. **`Classical.propDecidable` bridge recorded in the contract.** The rationale
   records the exact tactic string
   `convert h using 2 <;> congr 1 <;> exact Subsingleton.elim _ _`, names where
   the originating construction needed it (the seat's whole-file attribute vs.
   the critic's Mathlib-derived instance) and records — with a claim I checked
   rather than took — that this project needs none, because the attribute is a
   `local instance` in exactly one `section PartnerConstruction … end` block
   wrapping only `partner`. I confirmed: one attribute occurrence, correctly
   scoped, and **zero** `Subsingleton.elim` in the file. Since the bridge is
   genuinely not used here, recording it together with the verified reason it is
   not needed is the only faithful discharge available, and it is not a
   weakening. ✔
5. **Critic attribution on the award's face for all three declarations.**
   Present in `INFORMAL-PROOF.md` §0 and in the contract's `informal_statement`
   ATTRIBUTION clause, naming node (i), node (ii) and the composition, on seat
   F3's unmodified `clamp_lemma` and `Arithmetic.lean`, with the
   `E993-R25-MATCHING-DUAL-SCALAR-CORE` precedent. ✔

**Conditions (iv) and (v).** (iv): the generator is under `EVIDENCE/`, uses the
standard library only with an explicit import list at the top, emits no
wall-clock/PID/host field into the hashed output (checked), covers the required
`r ∈ [2,9] × k ∈ [−3,20]` grid and the four named checkpoints, and carries the
fiber identity and carry step on explicit `ν = τ = 6` order-13 graphs; it replays
byte-identically. ✔ (v): `#print axioms` on **every** named declaration — 35 of
35, no anonymous `example` anywhere, so nothing escapes a receipt; and the
report's axiom sentence reads "within the three standard axioms". ✔

**One terminal declaration.** `Main.lean` contains exactly one `theorem`
(`bandCarryStepHall`); every component, including both nodes, is registered as a
`lemma`. ✔

---

## Verdict

**passed**

This verdict re-issues, on the bounded-repair child run
`runs/lean-2026-09-22-c6-band-carry-step-hall-repair-1`, the `passed` verdict I
recorded for the parent run. The repair changed **only** the 35 `VERITYOS ENTRY
… BEGIN` marker comments, replacing bare declaration names with fully qualified
ones; I verified by diff that the entry numbers, kinds and fragment hashes are
unchanged and that the Lean content is **byte-identical** after marker strip
(`5e8a56e0…` on both sides). No mathematical content was touched, so no ledger
row moves — and each row is re-established here against the child's own bytes.

The informal proof in
`runs/lean-2026-09-22-c6-band-carry-step-hall-repair-1/INFORMAL-PROOF.md` is a correct and
complete proof of the intended claim — the contract's `informal_statement`,
`claim_sha256` `dabd5cbf0dc4792899d4d26e63e82c3184d847910e06d699064fd6aa0b449da7`
as recomputed by me. Every definition, lemma and inference step in the ledger
above is verified with independently reproduced evidence: the two nodes are
correct and each consumes exactly the hypotheses claimed for it, `ν = τ` enters
at exactly one place (node (ii)) and nowhere else, `r ≥ 4` is genuinely derived,
every ℕ-subtraction is either truncation-free under an explicit hypothesis or
truncating in the strengthening direction, every numeric claim recomputes on my
own exact-integer instrument including all four named checkpoints
(48 / 33 / −16 / −14406), the `Bd` that is bound is the RANGED object and I
demonstrated positively that the range is load-bearing, the carry step survived
1,610 qualifying graphs at orders 13 and 15 — 1,381 of them non-forests, 1,006
non-bipartite — with zero violations and the bound attained, and the hypothesis
is load-bearing: four of five controls that drop the 12-vertex matching break the
bound, by as much as 375. All 16 fences and excluded conclusions travel on the
award's face in both required places, all five mandatory repairs are discharged,
the attribution the synthesis requires is present for all three declarations and
is supported by the sealed critiques, and nothing anywhere claims
`formally_verified`.

No defective step was found. The five findings recorded in the critic pass are
an evidence-quality imprecision in one field of the producer's generator
(Finding 1), two contract-metadata looseness items and one over-declared
dependency (Findings 2–4), and a producer process deviation already disclosed on
the face of the formalizer's own report (Finding 5). None of them touches an
inferential step, a hypothesis, a definition, a numeric claim or a fence, and
none is softened here: each is stated in full for the controller to act on as it
sees fit.

This attestation (`c6-la2-informal-pass-20260922`) covers the **informal
proof-integrity gate only**. It is not a fidelity attestation, not a kernel
receipt, and not a `close`; it makes no `formally_verified` claim.
