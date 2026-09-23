---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la6-formalizer-sonnet-20260922
critic_id: c6-la6-fable-informal-20260922
attestation_id: c6-la6-informal-pass-20260922
claim_sha256: 6ce5edf7aa430ba698905a9c47760561f32d54fcd3e82f7afe0d4b411e717f23
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted this session by
reading exactly the three files this seat's brief §0 authorizes and no other VerityOS
file: `/Users/ashtonsperry/VerityOS/verity.md` (root constitution),
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (startup sequence), and
`/Users/ashtonsperry/VerityOS/skills/proof-integrity-audit/skill.md` (the governing
skill for this seat). Subsystems loaded: `identity/`, `skills/` (one skill), and the
`experiments/` workspace named by the brief. Per the startup protocol's task-type map,
no `writing/`, `operations/`, `projects/`, `decisions/`, `logs/`, `memory/` or
`knowledge/` material was loaded; this run's own control and source documents, named
exactly by the brief's §1 read boundary, are the governing record. Scale mode: single
problem (`skills/proof-integrity-audit` §"Scale Modes"). **No `Agent` tool call was
made at any point** (child delegation forbidden by the dispatch). Nothing inside the
Lean run was edited; my only writes are this file and my scratch under
`scratchpad/c6-s7-informal-LA6/`.

**Model disclosure.** Chartered Claude Opus 5, effort high, per the dispatch record.
The Agent transport that invoked this seat exposes no effort parameter and **this seat
cannot self-inspect its own runtime model or effort setting** — stated on
dispatch-record authority, per the brief and per every prior seat, critic and reviewer
record in this run.

**Read boundary honored.** Lean run `runs/lean-2026-09-22-c6-sharpened-order-bound-argmin/`
(`THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`,
`FORMALIZER-REPORT.md`, `DEPENDENCIES.yaml`, `RECEIPTS/*`, `EVIDENCE/*` including both
originating-source copy-outs, `LeanProject/LeanProof/Main.lean` and its 12 registered
fragments); the sealed capsule `control/c6-stage7-capsules/C6-LA6-PACKET-MANIFEST.json`
and the capsule members needed for the statement of record (`SYNTHESIS.md`
`## Lean awards` + `## Exact established results`, `ADJUDICATION.md` `## Lean readiness`,
`RETURN.md` T2, both T2 critiques); the formalizer brief
`control/C6-STAGE7-FORMALIZER-BRIEF-LA6.md`; and Mathlib sources under the shared
project for the two `Nat.choose` lemmas the proof consumes. No network, no installs, no
package operations, no `lake`/`elan` invocation of any kind, no `/tmp`, and no `grep`
or `find` rooted above those paths. The run-local claim registry
(`control/CLAIM-IDENTITY.run-local.json`) is **outside** my boundary and was not read;
where the contract's scope sentence depends on it, I say so below.

**Digest gate (recomputed by me, not trusted).**

| artifact | expected | recomputed | result |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `6d9de6c2…50d2ab` | `6d9de6c29d22337ea7f5144690917e07d5d9a39551d2c9f526ade62a6750d2ab` | match |
| `INFORMAL-PROOF.md` | `1a2eb133…dbcd48` | `1a2eb133657e78a9c6bb42f50b4681f32731f63e584f5734ed2b78e6d2dbcd48` | match |
| `LeanProject/LeanProof/Main.lean` | `eacfd4ce…b02245` | `eacfd4ce67289a651db7fda05e16ad870ebfdcf0e6e4cbcf719604b849b02245` | match |
| capsule seal (compact key-sorted JSON minus `seal_sha256`) | `91a31efb…60d2882` | `91a31efbfb3f793581e09173b924d6fa9283c5db2d0c67184f5f89560de2d882` | match |
| all 10 capsule members | manifest digests | recomputed individually | 10/10 match |
| contract `expected_statement_sha256` | `2e109178…6ad139` | `2e1091783be18af5014ec227dfdccf1d45910e539c9182704ce96519f76ad139` | match, and the string occurs **verbatim** in `Main.lean` |
| all 4 contract `source_materials` | contract digests | recomputed individually | 4/4 match |
| `claim_sha256` (`" ".join(informal_statement.split())`) | `6ce5edf7…717f23` | `6ce5edf7aa430ba698905a9c47760561f32d54fcd3e82f7afe0d4b411e717f23` | **match** |

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`. In the
contract's own terms: with `C(a,b)` the zero-extended integer binomial coefficient (`0`
whenever `a < 0`, `b < 0`, or `b > a ≥ 0`),

```
H(n,k,e,c_e) := C(n,k+1) − e·C(n−2,k−1) + (e−c_e)·C(n−3,k−2) + (c_e−1)·C(n−4,k−3)
W(n,k,e)     := H(n,k,e, min(e, n−e))
```

**for every integer `n ≥ 4`, every integer `k`, and every integer `e` with
`1 ≤ e ≤ n−1`: `H(n,k,n−1,1) ≤ W(n,k,e)`** — i.e. `e = n−1`, `c_e = 1` minimises
`H(n,k,e,min(e,n−e))` over `1 ≤ e ≤ n−1`, in Candidate D's own words.

**Terminal declaration, in the exact compiled form (the compiled statement governs, per
formalizer brief §2):**

```lean
theorem candidateD_argmin (n k e : ℤ) (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n - 1) :
    Hbound n k (n - 1) 1 ≤ Hbound n k e (min e (n - e))
```

fully qualified `ErdosR25T2.candidateD_argmin`. The controller's brief transcribes the
statement as `W n k (n - 1) ≤ W n k e`; the compiled arrangement unfolds the left side
to `Hbound n k (n − 1) 1`, which is C-T2-F's compiled form and is what makes the
statement read in Candidate D's own words rather than one unfolding short of them. The
two arrangements are equivalent under `hn` by `ce_at_spanning_tree`
(`min(n−1, n−(n−1)) = 1` for `n ≥ 2`), which I verified independently for
`n = 2…400` and which **fails** at `n ≤ 1` (values `0` and `−1`), so that lemma's own
`2 ≤ n` hypothesis is load-bearing and is correctly discharged from `hn : 4 ≤ n`.

**Hypothesis-to-claim correspondence is one-for-one, with nothing extra and nothing
missing:** `hn : 4 ≤ n` ↔ "n ≥ 4"; `he1 : 1 ≤ e` ↔ "1 ≤ e"; `he2 : e ≤ n - 1` ↔
"e ≤ n−1"; `k : ℤ` free and unconstrained ↔ "every integer k". There is no instance
argument, no typeclass burden, no decidability side condition and no ambient variable.

---

## Claim Ledger

Every definition, lemma and inference step of `INFORMAL-PROOF.md`, at statement-level
granularity, with each hypothesis and where it enters. "Recomputed" means by my own
exact-integer evaluator (`scratchpad/c6-s7-informal-LA6/audit_eval.py`, standard library
only, written for this audit; **no prior evaluator was imported, and the binomial
coefficient is built from scratch by an iterative integer product, deliberately not
`math.comb`, and cross-checked against an independently constructed Pascal triangle**).

| id | claim | hypotheses and where they enter | evidence | verdict |
|---|---|---|---|---|
| D1 | `zchoose a b = if 0 ≤ a then (if 0 ≤ b then (a.toNat).choose (b.toNat) else 0) else 0` | none | byte-identical to seat T2's and (up to name) C-T2-F's compiled definition; zero extension reproduced at every boundary (`a<0`, `b<0`, `b>a≥0`) | verified |
| D2 | `Hbound n k e ce = zchoose n (k+1) − e·zchoose (n−2) (k−1) + (e−ce)·zchoose (n−3) (k−2) + (ce−1)·zchoose (n−4) (k−3)` | none | byte-identical to the seat's `Hbound` and to C-T2-F's `Hb` after renaming; term-for-term the contract's `H` | verified |
| D3 | `W n k e = Hbound n k e (min e (n − e))` | none | byte-identical to the seat's `W` / C-T2-F's `Wf`; matches the contract's `W` | verified |
| L1 | `zchoose_nonneg : 0 ≤ zchoose a b` | none | three-branch case split; `Nat.choose` cast is `Int.natCast_nonneg`, other branches `0 ≤ 0` | verified |
| L2 | `zchoose_pascal (ha : 1 ≤ a) (b) : zchoose a b = zchoose (a−1) (b−1) + zchoose (a−1) b` | `1 ≤ a` enters twice: to give `a.toNat = (a−1).toNat + 1`, and to close every boundary branch by `omega` | recomputed for `1 ≤ a ≤ 60`, all `b ∈ [−4, a+4]`: **0 failures**; and it **fails** at `a = 0, b = 0` (`1 ≠ 0 + 0`), so `1 ≤ a` is load-bearing. Mathlib backing checked in the pinned tree: `Nat.choose_succ_succ (n k) : choose (succ n) (succ k) = choose n k + choose n (succ k)` and `choose_zero_right (n) : choose n 0 = 1` — both unconditional, exactly as used | verified |
| L3 | `pascal_step1 (hn : 4 ≤ n) : zchoose (n−2) (k−1) = zchoose (n−3) (k−2) + zchoose (n−3) (k−1)` | `4 ≤ n` only through `1 ≤ n − 2` (`n ≥ 3` would suffice) | recomputed `4 ≤ n ≤ 80`, `k ∈ [−6, n+6]`: **0 failures**; first below-fence failure at `n = 2, k = 1` | verified |
| L4 | `pascal_step2 (hn : 4 ≤ n) : zchoose (n−3) (k−2) = zchoose (n−4) (k−3) + zchoose (n−4) (k−2)` | `4 ≤ n` through `1 ≤ n − 3` — **this is the binding instance** | recomputed same grid: **0 failures**; fails at `n = 3, k = 2` | verified |
| L5 | `pascal_step3 (hn : 4 ≤ n) : zchoose (n−3) (k−1) = zchoose (n−4) (k−2) + zchoose (n−4) (k−1)` | `4 ≤ n` through `1 ≤ n − 3` — binding | recomputed same grid: **0 failures**; fails at `n = 3, k = 1` (**the award statement's named witness**) | verified |
| I1 | pre-substitution difference `W(n,k,e+1) − W(n,k,e) = −C(n−2,k−1) + (1−δ(e))·C(n−3,k−2) + δ(e)·C(n−4,k−3)`, `δ(e) := min(e+1,n−e−1) − min(e,n−e)` | none beyond D2/D3 (the `C(n,k+1)` term cancels) | identity, recomputed on 233,926 instances (`4 ≤ n ≤ 80`, `k ∈ [−5,n+5]`, `e ∈ [−3,n+2]`): **0 mismatches** | verified |
| I2 | closed form `W(n,k,e+1) − W(n,k,e) = −(1+δ(e))·C(n−4,k−2) − C(n−4,k−1)` | needs L3, L4, L5, hence `4 ≤ n` | same 233,926 instances: **0 mismatches**; and my own symbolic derivation: substituting L3 gives `B = C + F + G` and L4 gives `C − D = F`, so the difference collapses to `−(1+δ)F − G` with `F = C(n−4,k−2)`, `G = C(n−4,k−1)` | verified |
| I3 | `δ(e) ≥ −1` for **every** integer `n, e` | none | recomputed over `n ∈ [−5,200]`, `e ∈ [−200,200]`: observed `δ ∈ {−1,0,1}`, **0 violations of `δ ≥ −1`** | verified |
| L6 | `W_antitone (hn : 4 ≤ n) (_he1 : 1 ≤ e) (_he2 : e+1 ≤ n−1) : W n k (e+1) ≤ W n k e` | `4 ≤ n` via L3–L5; `_he1`, `_he2` **inert** (underscore-prefixed in the seat's own file; C-T2-F finding F5) | follows from I2 + I3 + L1: `(1+δ) ≥ 0` and both binomials `≥ 0`, so both terms are `≤ 0`. The Lean discharge is one `omega`-proved product `hprod : 0 ≤ (δ+1)·zchoose (n−4) (k−2)` plus one `nlinarith` over L3–L5 — the only genuinely nonlinear atom pairing is exactly the one `hprod` supplies. **Unrestricted form recomputed**: 291,060 instances with `e` swept far outside `[1,n−1]`, **0 violations** | verified (and strictly stronger than its advertised type) |
| L7 | `W_min_at_spanning_tree (hn) (he1 : 1 ≤ e) (he2 : e ≤ n−1) : W n k (n−1) ≤ W n k e` | `he2` is consumed to build the ℕ witness `m := (n−1−e).toNat` with `e + m = n − 1`; `hn` passes to L6; `he1` is carried forward and handed to L6's inert slot | finite downward induction on `m`, base `m = 0` ⇒ `e = n−1`, step `le_trans (ih (e+1) …) (W_antitone …)`. Termination and coverage are exact: every `e ∈ [1,n−1]` is reached in `n−1−e` steps | verified |
| L8 | `ce_at_spanning_tree (hn : 2 ≤ n) : min (n−1) (n−(n−1)) = 1` | `2 ≤ n` (else the min is `0` or `−1`) | recomputed `n = 2…400`: **0 failures**; fails at `n ∈ {0,1}`; discharged in T1 from `hn : 4 ≤ n` by `omega` | verified |
| T1 | **terminal** `candidateD_argmin (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n−1) : Hbound n k (n−1) 1 ≤ Hbound n k e (min e (n−e))` | all three, as tabulated above | `have h := L7; unfold W at h; rwa [L8] at h`. The rewrite target `min (n−1) (n−(n−1))` occurs only on the left of `h` (`e` is a distinct free variable), and the rewrite would be sound even if it matched, since L8 is an identity under `hn`. **Recomputed on 205,359 instances** (`4 ≤ n ≤ 80`, `k ∈ [−5, n+5]`, `1 ≤ e ≤ n−1`): **0 failures** | verified |

**ℕ-subtraction and cast audit (clean).** Every object lives in `ℤ`; there is no natural
subtraction anywhere. The only `toNat` calls are (i) inside `zchoose`, both guarded by
`0 ≤ a` / `0 ≤ b`, so neither truncates, and the `b > a ≥ 0` case is the declared zero
extension via `Nat.choose`, not a truncation artifact; (ii) `a.toNat = (a−1).toNat + 1`
and `b.toNat = (b−1).toNat + 1` inside `zchoose_pascal`, each proved by `omega` under
the guard that makes it exact; (iii) `(n − 1 − e).toNat` in L7, where the accompanying
`by omega` proof of `e + ((n−1−e).toNat : ℤ) = n − 1` **requires** `he2` and is therefore
guarded. The only casts are `(ℕ → ℤ)` upward casts (`Nat.choose` results, the induction
index `m`), which cannot truncate. The ℕ/ℤ trap the semantic contract flags does not
bite here, in agreement with C-T2-U's line-by-line fidelity finding as quoted in the T
adjudication's `## Lean readiness`.

**Dependency-exclusion audit (nothing marked NOT a dependency is a dependency).**
`Main.lean`'s only import is `import Mathlib`. The frozen G1 project is **not** imported
and no `sources/g1/` entry is referenced, so the brief's byte-for-byte G1 transcription
check is not applicable to this award. Not present anywhere in the compiled source, the
12 registered fragments, or `DRAFTS/`: any `SimpleGraph`, `IsAcyclic`, `indepCount` or
`Erdos993G1` token; C-T2-F's Hunter (N1) fragment `hunter_rooted`; C-T2-F's Part 4
cubic `g`/`g_lower_neg`/`g_upper_pos`; C-T2-F's Part 5 §5 refutation theorems;
C-T2-U's `Hunter.lean`; and the seat's three dead `diff_*` lemmas. `#print axioms` on
all 12 registered declarations reports only `propext`, `Classical.choice`, `Quot.sound`
(the three `def`s depend on none); no `sorry`, `admit` or `native_decide` occurs.

---

## Reproduced Mathematical Evidence

My evaluator: `scratchpad/c6-s7-informal-LA6/audit_eval.py` →
`scratchpad/c6-s7-informal-LA6/audit_eval_report.json`
(`schema c6-la6-informal-audit-eval.v1`; import list `json`, `hashlib`, `sys` declared
at the top of the file; no wall-clock, PID, host or randomness anywhere; deterministic
nested loops; exit 0 with every hard check passing). Report digest of the run of record:
`1b8d15c8acb901ed57fb48cb91fb3364c3a9b1493b17f6fb948ee838d10a6d35`.

| check | population | result |
|---|---|---|
| L0 primitive self-test: my `nat_choose` vs an independently built Pascal triangle, plus the zero extension at every boundary | 2,135 + 120 | 0 mismatches |
| L1 **terminal claim** `Hbound n k (n−1) 1 ≤ Hbound n k e (min e (n−e))`, `4 ≤ n ≤ 80`, `k ∈ [−5,n+5]`, `1 ≤ e ≤ n−1` (**strictly wider than the producer's grid**) | 205,359 | **0 failures** |
| L1b `c_e` bridge: `min(n−1,n−(n−1)) = 1` for `n = 2…400` and `W n k (n−1) = Hbound n k (n−1) 1` | 399 + 8,568 | 0 failures; fails below `n = 2` as it must |
| L2 closed form **and** the pre-substitution difference, with `e` swept outside `[1,n−1]` | 233,926 each | 0 mismatches each |
| L2b `δ(e) ≥ −1`, observed range | 82,606 | 0 violations; `δ ∈ {−1,0,1}` |
| L3 `pascal_step1/2/3` at `4 ≤ n ≤ 80` | 3 × 4,235 | 0 failures; below-fence witnesses exhibited (see fence check) |
| L3b `zchoose_pascal` at `1 ≤ a ≤ 60` | 2,370 | 0 failures; `a = 0` failure exhibited |
| L4 `W_antitone` **unrestricted in `e`** (F5's strengthening) | 291,060 | 0 violations |
| L5 below-fence probes, kept as two separate questions: (a) the **closed form** at `n ∈ {3,2,1,0}`, `k ∈ [−40,40]`, `e ∈ [−3,n+2]`; (b) the **conclusion** at `n ∈ {3,2,1,0,−1}`, `k ∈ [−40,40]` | (a) 729 / 648 / 567 / 486; (b) 162 / 81 / 0 / 0 / 0 | (a) 17 mismatches at `n = 3` (`k = 1` for every `e`; `k = 2` for `e ≠ 1`), 8 at `n = 2` (all `k = 1`), **none** at `n ≤ 1`; on the producer's own narrow `n = 3` grid **exactly one**, `(3,1,1)` — reproducing the named witness. (b) **0 violations anywhere below the fence** |
| L6 uniformity in `k` at far-out `k` (`k ∈ [−60,−3] ∪ [n+3,n+58]`) | 89,355 | 0 violations |
| L7 the two facts the award reproduces when it **excludes** the seat's §5 | 2 | `Hb(9,2,8,1) = 35 < 36 = C(9,2)` and `C(10,2) = 45 < 56 = Hb(10,2,9,1)` — both confirmed, i.e. §5's own prose direction is false at both points |
| L8 the producer's three reported populations, recomputed arithmetically | — | `80,807` / `21` / `78,698` — all three match |
| L9 hypothesis necessity (see below) | 28,675 | `he2` load-bearing; `he1` not; `hn` not |
| L10 honest pricing of "uniform in `k`" | 45,843 | `H` has **no** `e`-dependence at all for `k ≤ −2` or `k ≥ n`; 740 `(n,k)` pairs in `4 ≤ n ≤ 40` show strict variation, all inside `−1 ≤ k ≤ n−1` |

**Producer-evidence replay.** I copied `EVIDENCE/argmin_evidence_check.py` into my own
scratch (never running it inside the Lean run, which I did not modify) and re-executed
it: `argmin_evidence_report.json` came out **byte-identical** to the committed one,
digest `2cba4b99f0e30c3d8bb45eb5ab55f3d9dd11fae9afa53d7b64adfc52ca8d453a`, and the
generator digest `55930437b860a77c823402f09909798d0e0fd0f9d5a31d96f68db697b6b05f9d`
matches the figure in `FORMALIZER-REPORT.md` §3(iv). Check A: 80,807 instances, 0
failures. Check B: named witness `(n,k,e) = (3,1,1)` identity failure confirmed, `n = 3`
scan mismatch count 1, `n = 4..60` identity holds throughout. Condition (iv) is met, and
the generator carries an explicit import list and no wall-clock/PID/host field.

**Where I went beyond the producer.** Higher `n` (80 vs 60), wider `k` (including
`[−60,−3]` and `[n+3,n+58]`), `e` outside the stated range for both the identity and
the antitone step, an independent binomial implementation, a hypothesis-necessity
sweep, a below-fence sweep of the **conclusion** (not only of the identity), and an
independent `n ≤ 3` hand proof (below).

---

## Independent Critic Pass

Run against my own ledger, before closing, per skill step 10.

**CP1 — did I verify the claim, or a paraphrase of it?** The contract's
`informal_statement`, its `conclusion.statement`
(`Hbound n k (n − 1) 1 ≤ Hbound n k e (min e (n − e))`), its `lean_binding.expected_statement`,
the string present verbatim in `Main.lean`, and `INFORMAL-PROOF.md` §3 are the **same**
statement, and the `expected_statement_sha256` recomputes. My evaluator evaluates that
statement, not a paraphrase.

**CP2 — could my evaluator share a blind spot with the producer's?** It does not use
`math.comb`; it builds `nat_choose` by iterative integer product and cross-checks it
against a separately constructed Pascal triangle, then checks the zero extension at
`a < 0`, `b < 0` and `b > a ≥ 0` explicitly. The two evaluators agree on all three of
the producer's reported populations, which I also reproduced in closed form arithmetically.

**CP3 — is the `rwa` step sound?** Yes, twice over: the rewrite target
`min (n−1) (n−(n−1))` occurs only on the left-hand side of `h` (the right-hand side
carries the free `e`), and even a right-hand match would be sound because L8 is a true
identity under `hn`.

**CP4 — does the induction really cover the range, and is the `.toNat` witness safe?**
Yes. `m := (n−1−e).toNat` with `he2 : e ≤ n−1` gives `e + (m : ℤ) = n − 1` exactly; the
induction generalizes `e` (so `he1` and `hm` travel with it) and reaches `e = n−1` in
`m` steps. This is precisely where `he2` does its work, which matches my independent
finding that `he2` is the one load-bearing hypothesis of the three (CP5).

**CP5 — are the stated hypotheses sharp, and does any bound fail outside them?**
Recomputed, one hypothesis dropped at a time:

- Drop `he1 : 1 ≤ e` (sweep `e ≤ 0`, 14,911 instances): **no violation**. `he1` is not
  necessary for the conclusion — it is honest domain bookkeeping, which the record
  already flags via C-T2-F's F5 ("only `e ≤ n − 1` does work there").
- Drop `he2 : e ≤ n − 1` (sweep `e ≥ n`, 13,764 instances): **8,436 violations**;
  smallest witness `n = 4, k = 1, e = 4`, where
  `Hbound(4,1,3,1) = 3 > 2 = Hbound(4,1,4,min(4,0))`. `he2` **is** load-bearing, exactly
  as the ledger's L7 entry predicts.
- Drop `hn : 4 ≤ n`: see the fence check — the **conclusion** survives, the **proof
  method** does not.

**CP6 — is the attribution consistent with the sources I can see?** Yes. C-T2-F's
critique finding F4 supplies `ce_at_spanning_tree` and the terminal `candidateD_argmin`
statement (I read F4 and compared it to the compiled `CriticT2F.lean`); everything else
is the seat's. `INFORMAL-PROOF.md` §4 and `FORMALIZER-REPORT.md` §3(i) state exactly
that split.

**CP7 — did I check the record's numbers, not only its mathematics?** Yes: every
population, both below-fence witness counts, all digests in the table above, the count
of registered declarations (3 defs + 8 lemmas + 1 theorem = 12, matching the 12
`#print axioms` lines), and the two §5-refutation integers.

**CP8 — three imprecisions I found, none of which is a defective proof step.** I record
them precisely rather than softening or inflating them:

1. **`INFORMAL-PROOF.md` §1 says "All four definitions below"** where three are
   displayed and bulleted (`zchoose`, `Hbound`, `W`), matching the contract's three
   `definitions` entries and the three `def`s in `Main.lean`. A counting slip in a prose
   header; no mathematical consequence.
2. **Provenance self-description overstated.** §2 says the eight supporting lemmas are
   "re-derived and re-proved in this run (not merely copied)" and §6 says the award
   "re-derives every fragment from scratch rather than transcribing the seat's file
   byte-for-byte". My byte comparison (run on all twelve entries individually) shows the
   opposite: ENTRIES 1–10 are **byte-identical**
   to seat T2's compiled file (modulo the enclosing namespace, the docstrings, and the
   cosmetic `theorem`→`lemma` keyword on entries 9–10), and ENTRIES 11–12 are byte-identical to
   C-T2-F's (modulo `Hb`→`Hbound`, `Wf`→`W`, and one line break in
   `ce_at_spanning_tree`). This is **not** a fidelity problem — byte-identity to the
   attributed sources is the strongest possible fidelity evidence, copying-out-and-rebuilding
   is exactly what formalizer brief §4 directs, and §1 of the same document describes it
   correctly ("re-registered, verbatim in mathematical content"). Only the two
   "from scratch / not merely copied" phrasings overstate independence. Note that §6
   uses that phrasing as its reason for **dropping** the three dead `diff_*` lemmas;
   the drop itself is independently sanctioned by condition (iii) and by C-T2-U's
   deletion experiment, so the action stands even though its stated reason is weak.
3. **A mis-parse of the fence phrase.** `INFORMAL-PROOF.md` §8 and
   `FORMALIZER-REPORT.md` §3(iv) gloss the fence witness as "at `k = 1`, matching
   ‘`k = 1` and below’". The governing phrase is "fails at `n = 3, k = 1, e = 1` **and
   below**", where "and below" is about `n`, not `k`. My scan settles it: at `n = 3` the
   closed form fails at `k = 1` for every `e` and at `k = 2` for every `e ≠ 1`, and at
   **no** `k ≤ 0`; at `n = 2` it fails at `k = 1` for every `e`; at `n ≤ 1` it does not
   fail. So the "`k = 1` and below" reading is false, the "`n = 3` and below" reading is
   true, and the reported **counts** are exactly right either way.

None of 1–3 touches a definition, a hypothesis, an inference step, a fence, or a
numeric result. I escalate them as record-accuracy items for the controller, not as
proof defects.

---

## Scope and Fence Check

Against the excluded conclusions of the synthesis dispatch (`SYNTHESIS.md`
`## Lean awards`, "Dispatch 6 (contingent; ranked last)") and formalizer brief §2–§3,
reproduced in my brief.

| fence / condition | finding |
|---|---|
| **NO graph token occurs** | **Satisfied.** `grep` over `LeanProject/LeanProof/` (`Main.lean` + all 12 registered fragments) and `DRAFTS/` for `SimpleGraph`, `IsAcyclic`, `indepCount`, `Erdos993G1`: **no occurrence**. The single import is `import Mathlib`; the frozen G1 project is not imported or referenced. The statement's only objects are zero-extended integer binomial coefficients. |
| **the seat's inverted §5 is not cited** | **Satisfied.** No §5 content is a dependency: nothing in the DAG, the contract, the generator or the evidence uses `N*(k) = k²+k+3`, the cubic `g(n,k)`, or the two boundary-order comparisons. `INFORMAL-PROOF.md` §0 and §5 name §5 **only to declare its exclusion**, which condition (ii) positively requires; and the two integers it reproduces there are the **critics' refutation** — `Hb(9,2,8,1) = 35 < 36 = C(9,2)` and `C(10,2) = 45 < 56 = Hb(10,2,9,1)`, both of which I recomputed and both of which are the **opposite** of §5's prose. The award therefore carries the corrected direction, never §5's inverted one. |
| **uniform in `k`** | **Satisfied,** and priced honestly. No hypothesis constrains `k`; recomputed at `k` far outside the producer's band with 0 violations. For completeness I record that the inequality is degenerate (`H` is constant in `e`) for `k ≤ −2` and `k ≥ n`; all substantive content sits in `−1 ≤ k ≤ n−1`. No record text overstates this. |
| **`n ≥ 4` is TIGHT (the closed form fails at `n = 3, k = 1, e = 1` and below)** | **Satisfied as stated, and stated correctly.** The tightness claim is explicitly about the **Pascal-derived closed form underlying the proof**, not about the conclusion. I confirm it: `pascal_step3` fails at `n = 3, k = 1`; `pascal_step2` fails at `n = 3, k = 2`; the closed-form identity fails at `(3,1,1)` (the named witness) and, on the producer's own `n = 3` grid, at that point **only**; it also fails at `n = 2, k = 1` ("and below"). **Crucially, the conclusion itself does not fail below the fence**, and the record says so twice (`INFORMAL-PROOF.md` §8, `FORMALIZER-REPORT.md` §3(iv)): my sweep at `n ∈ {2,3}`, `k ∈ [−40,40]` finds **no counterexample**, and by hand the conclusion is vacuous for `n ≤ 1`, an identity at `n = 2`, and at `n = 3` reduces to `C(0,k−2) ≤ C(1,k−1)`, true for every integer `k` (`C(0,k−2) = 1` only at `k = 2`, where `C(1,1) = 1`). So `hn : 4 ≤ n` is a hypothesis of the **method**, not of the truth. The award does not overclaim this, and downstream text must not shorten "the `n ≥ 4` fence is tight" into "the theorem fails below `n = 4`". |
| **`d`, `ν`, `τ`, `x(F) < r` nowhere** | **Satisfied.** None occurs in the statement, the definitions, the proof, the contract or the evidence. The only free parameters are `n`, `k`, `e` (and the bound `c_e`). |
| **binding condition (1): re-freeze; the seat's §4.1 contract NOT dispatched** | **Satisfied.** The contract is frozen on the integer statement actually proved; `informal_statement` names `Erdos993G1.ForestOrderBound.forest_descent_order_bound_sharpened` explicitly as **not** dispatched, and I confirmed against `RETURN.md` §4.1 that this is the right declaration name and that its `expected_statement` is the graph theorem `IsAcyclic → delta G k < 0 → Nat.card X ≤ k²+k+3` (node N12), which no shipped fragment proves. The award asserts nothing about graphs, forests, acyclicity, independent-set counts, or `Δ_k < 0 ⟹ |V| ≤ k²+k+3`. |
| **binding condition (2): do not carry or cite §5** | **Satisfied** (see the §5 row above). |
| **no new `E993-R25-…` registration; SCOPE UPDATE, never a grade change** | **Satisfied on the award's face.** Stated in the contract's `informal_statement` and in `INFORMAL-PROOF.md` §5, in the synthesis's own words. The sub-claim that the registry's scope text for `E993-R25-FOREST-ORDER-BOUND-SHARPENED` names this exact argmin as its open step rests on governing texts **inside** my boundary — C-T2-F finding F9 quotes that scope text verbatim ("ONE STEP NAMED OPEN (the argmin … not proved)"), and the adjudication and synthesis concur. I did **not** open `control/CLAIM-IDENTITY.run-local.json`; it is outside my read boundary, and the scope-text update is a controller action in any case. |
| **condition (i) attribution on the award's face** | **Satisfied.** Seat T2 for `zchoose`, `Hbound`, `W`, `pascal_step1/2/3`, `W_antitone`, `W_min_at_spanning_tree`; the `c_e = 1` bridge (`ce_at_spanning_tree` and the terminal `candidateD_argmin` statement) critic-attributed to C-T2-F. Present in `INFORMAL-PROOF.md` §4, `FORMALIZER-REPORT.md` §3(i), and `THEOREM-CONTRACT.yaml` `formulation_status.evidence[2]`. The contract's **scope text** (`informal_statement`) carries the exclusions that condition (ii) requires there; the attribution travels in the contract's evidence block rather than in the scope sentence, which is what conditions (i)/(ii) as written ask for. Verified against C-T2-F's F4 and the compiled `CriticT2F.lean`. |
| **condition (ii) scope exclusions in `INFORMAL-PROOF.md` and the contract's `informal_statement`** | **Satisfied.** Both carry: no graph token; not the forest order bound; §4.1 not dispatched; §5 not carried; no new registration; no transfer to any tier, NR1, FOREST, TREE, TRANSFER or Erdős #993. |
| **condition (iii) named repairs** | **Satisfied.** The re-freeze is done and is on the award's face. The three dead `diff_*` lemmas are **dropped**, and the record says which choice it made and why (see CP8.2 on the stated reason). Exactly one terminal declaration is bound: `candidateD_argmin`, the file's sole `theorem`-kind entry. |
| **condition (iv) digested exact-integer generator** | **Satisfied.** Replayed byte-identically; explicit import list; no wall-clock/PID/host field; Check A exactly at the specified grid with zero failures; the `n = 3` failure exhibited in the closed-form sense the fence itself defines. |
| **condition (v) `#print axioms` on every named declaration; "within the three standard axioms"** | **Satisfied.** 12 commands, 12 outputs, no anonymous `example` anywhere; the three `def`s depend on no axioms, every `lemma` and the `theorem` on a subset of `[propext, Classical.choice, Quot.sound]`; the report's axiom sentence reads "within the three standard axioms". |
| **no `sorry`/`admit`/`native_decide`; intended theorem never changed to obtain compilation** | **Satisfied.** None occurs. The compiled statement is C-T2-F's `candidateD_argmin` verbatim under this run's names; no hypothesis was added, weakened or dropped relative to the attributed sources. |

---

## Verdict

**passed**

The informal proof in
`runs/lean-2026-09-22-c6-sharpened-order-bound-argmin/INFORMAL-PROOF.md` is a correct,
complete, statement-level proof of exactly the claim in the contract's
`informal_statement` (`claim_sha256` recomputed by me as
`6ce5edf7aa430ba698905a9c47760561f32d54fcd3e82f7afe0d4b411e717f23`, equal to the value
the brief names). Every definition matches the compiled Lean source and the attributed
originating sources byte-for-byte in mathematical content; every hypothesis is placed
where the proof actually consumes it; every equality used is an identity that I
recomputed; every ℕ-subtraction and cast is guarded and non-truncating; the terminal
declaration's hypotheses correspond one-for-one to the claim; nothing marked not a
dependency is a dependency; and no fenced conclusion is asserted anywhere. There is no
defective step.

Three record-accuracy imprecisions are escalated for the controller, none of which
defects the proof and none of which I have repaired (repair is not this seat's
business): (1) "All four definitions" in `INFORMAL-PROOF.md` §1 where there are three;
(2) the "re-derives every fragment from scratch / not merely copied" phrasing in §2 and
§6, contradicted by byte-identity to the attributed sources — which is itself the
strongest fidelity evidence, and which leaves the §6 decision to drop the dead `diff_*`
lemmas standing on condition (iii) and C-T2-U's deletion experiment rather than on that
reason; (3) the "`k = 1` and below" gloss of the fence witness in §8 and
`FORMALIZER-REPORT.md` §3(iv), where "and below" is about `n`, not `k` — the reported
counts are nevertheless exactly right.

One substantive reading note travels with this pass, already stated correctly by the
award and worth keeping intact downstream: the `n ≥ 4` fence is tight for the **proof's
Pascal-derived closed form**, not for the **conclusion**, which I verify holds for every
integer `n` (vacuous for `n ≤ 1`, an identity at `n = 2`, and at `n = 3` equivalent to
`C(0,k−2) ≤ C(1,k−1)`, true for every `k`). Of the three hypotheses, only
`he2 : e ≤ n − 1` is load-bearing for the conclusion — smallest counterexample when it
is dropped: `n = 4, k = 1, e = 4`, where `Hbound(4,1,3,1) = 3 > 2 = Hbound(4,1,4,0)`.

This audit certifies the **mathematics** of the informal proof and its correspondence to
the declarations in `Main.lean`. It is not a kernel verification, not a formalization-
fidelity review, and it makes no `formally_verified` claim; the registry effect remains
the scope update the synthesis specifies, never a grade change.

**Attestation id:** `c6-la6-informal-pass-20260922`.
**Reviewer id:** `c6-la6-fable-informal-20260922`
(kind `independent-mathematical-proof-integrity-reviewer`).
**Artifact producer id:** `c6-la6-formalizer-sonnet-20260922` — a different seat; I
produced no artifact in the Lean run and edited nothing in it.
