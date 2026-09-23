---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-sonnet-20260920
critic_id: c1-la2-fable-informal-20260920
attestation_id: c1-la2-informal-pass-20260920
claim_sha256: 48c1fb76dc66ef5425c10de0ddc0087c74b58767aa2589c92931133f2244a882
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** Operating within VerityOS. Loaded this session:
`verity.md`, `identity/startup-protocol.md`, and
`skills/proof-integrity-audit/skill.md` (the brief's §0 authorization), plus —
per the task-type map — the experiment workspace
`experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20` and its
`SEMANTIC-CONTRACT.md` / `SOLUTION-CONTRACT.md`. This is a bounded
single-problem proof-integrity audit inside an experiment workspace; no durable
VerityOS record is written, no `inbox/` routing is needed, and nothing here is
promoted to memory, decisions, logs, reports, or project state. Scale mode:
**single problem** (one theorem, statement-level ledger). Forbidden actions
observed: no edit to the contract, the Lean source, the informal proof, or any
receipt; no child delegation; no read of the sibling award run
`runs/lean-2026-09-20-c1-d5-seven-matching-sign/`; scratch confined to
`<run root>/scratchpad/c1-s7-informal-LA2/`.

**Model disclosure.** Chartered seat: Claude Opus 5, chartered effort **high**,
stated on **dispatch-record authority** (the controller brief
`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md`). **This seat cannot
self-inspect its runtime model or effort**: the Agent transport that dispatched
it exposes no effort parameter and offers no API for reading back its own model
identity or sampling configuration. The harness session prompt names
`Opus 5 (1M context)` / `claude-opus-5[1m]`, but that is prompt metadata, not a
verified runtime readback, and it is recorded here as such. Child delegation:
none used; every read, computation, and judgement below was performed directly
in this session.

**Read boundary honoured.** Read: the award run's `THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`,
`EVIDENCE/axioms.txt`, `FORMALIZER-REPORT.md`, `LeanProject/LeanProof/Main.lean`;
the sealed capsule `control/c1-stage7-capsules/C1-LA2-PACKET-MANIFEST.json` and
its members (`cycles/cycle-1/stage6/SYNTHESIS.md` `## Lean awards`,
`cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` `## Lean readiness` and
its E11 entry, `cycles/cycle-1/stage3/returns/U2/RETURN.md`, and the two U2
critiques `.../critics/U2/F/CRITIQUE.md` §4 and `.../critics/U2/T/CRITIQUE.md`);
`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`; and the frozen G1 source
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` read-only, for the
definitions' provenance (entries 1–3 in full, plus a one-line `grep` confirming
that entry 155 `Erdos993G1.ThirdWide.fiveMatching_forbidden` exists under that
name, which is a provenance claim `INFORMAL-PROOF.md` §3.1 makes). Two reads
beyond the brief's enumerated list are disclosed rather than concealed, both
inside the award run and both one line long: `EVIDENCE/axioms.txt` and a
keyword `grep` over `Main.lean` for fenced notions and `sorry`/`admit`/
`native_decide`. The sibling award run
`runs/lean-2026-09-20-c1-d5-seven-matching-sign/` was **not** opened; its
directory name appeared in one `ls` of `runs/` and nothing in it was read.
Nothing else.

**Gate recomputations (all performed by this seat, not trusted from prose).**

| Recomputation | Result |
|---|---|
| `claim_sha256` = SHA-256 of `theorem.informal_statement` under `" ".join(s.split())` | `48c1fb76dc66ef5425c10de0ddc0087c74b58767aa2589c92931133f2244a882` — **equals the brief's expected value** |
| `THEOREM-CONTRACT.yaml` | `79c31cd6c4d67dc3abbe0c984897642c3a6558d02816d84acd358e84c1cf43a3` — matches |
| `INFORMAL-PROOF.md` | `93366e7c81065578d6fa5749172832404fac1cbe2805b00e330c93b371e20667` — matches |
| `LeanProject/LeanProof/Main.lean` | `15c8f7f19e9754f71cf96d7b92935e78b8768db54646798d9552dd1eec81ffd0` — matches |
| Capsule `seal_sha256` (SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`) | `c9c57e52d812166a1eb905874f38963b1972815800dcb17469b0f0dfd35aecd7` — matches |
| All 9 capsule member files (bytes + SHA-256) | 9/9 match |
| `lean_binding.expected_statement_sha256` | `a64f786132d896f06ff0b412ed8e9b60f6569b27f6665e2c26ee9d6316ee7e06` — matches, and the declaration text occurs verbatim in `Main.lean` (entry 18) |
| Frozen G1 source digest | `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4` — matches |

Recomputation script: `scratchpad/c1-s7-informal-LA2/claim_hash.py`
(SHA-256 `f16409aa5004ef674b95d8e8ee4704b7c7aac56371e7669cadd5645dc18cab80`),
transcript `claim_hash.out`.

## Intended Claim

The intended claim is **exactly** the contract's `theorem.informal_statement`
(contract `c1-la2-perfect-matching-uniform-sign-v1`), whitespace-normalized
digest `48c1fb76…2244a882`:

> For every finite simple graph G on a vertex type X of cardinality 2m carrying
> a perfect matching (an injective f : Fin m x Bool -> X with
> G.Adj (f (i,false)) (f (i,true)) for every i : Fin m), and every natural r
> with 2m <= 3r+1: Delta_r(G) <= 0. Equivalently, with d = 2m-2r (always even,
> forced by the perfect-matching hypothesis): a perfect-matching graph of order
> 2r+d with 3d <= 2m+2 has Delta_r <= 0. Uniform over even d only; not Tier 3a
> (says nothing about graphs without a perfect matching); no sharpness claim; no
> transfer to firstDescent/x(G), forests, residuals, G1 tuples, Tier 1, Tier 2,
> the diagnostic band, FOREST, TREE, TRANSFER, E993-BETA-AGG, or Erdos #993.

`INFORMAL-PROOF.md` is audited as the proof of that claim and of nothing else.

**Statement of record.** `SYNTHESIS.md` `## Lean awards`, "Award group B
(companion) — the perfect-matching uniform lemma", states: *for every finite
simple graph `G` with a perfect matching (`2m = Nat.card X = 2r+d`) and
`3d ≤ 2m+2`: `Δ_r(G) ≤ 0`; equivalently … for every `r` with `2m ≤ 3r+1`.* The
contract's `informal_statement` is that sentence plus the synthesis's own
"Excluded conclusions" paragraph, and adds nothing. The arithmetic bridge
`3(2m−2r) ≤ 2m+2 ⟺ 4m ≤ 6r+2 ⟺ 2m ≤ 3r+1` is exact over ℤ, so the two forms of
the hypothesis coincide (see ledger row L14 for the one imprecision this raises).

**Claim-to-Lean binding.** The contract's `lean_binding.expected_statement` is
character-identical to the registered entry 18 (modulo the namespace prefix,
`Erdos993G1.C1LA2.` vs. the `namespace`-scoped short name), and the hypotheses
in the claim are exactly the Lean hypotheses, one for one:

| Claim clause | Lean binder/hypothesis |
|---|---|
| finite simple graph `G` on vertex type `X` | `{X : Type u} [Finite X] (G : SimpleGraph X)` |
| `X` of cardinality `2m` | `(m : ℕ) (hn : Nat.card X = 2 * m)` |
| `f : Fin m × Bool → X` injective | `(f : Fin m × Bool → X) (hf : Function.Injective f)` |
| matched pairs adjacent | `(he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))` |
| every natural `r` with `2m ≤ 3r+1` | `(r : ℕ) (hr : 2 * m ≤ 3 * r + 1)` |
| `Δ_r(G) ≤ 0` | `Erdos993G1.delta G (r : ℤ) ≤ 0` |

No extra hypothesis appears in Lean and none in the claim is missing from Lean.

## Claim Ledger

Statement-level ledger over `INFORMAL-PROOF.md`. Verdict taxonomy per
`skills/proof-integrity-audit/skill.md`. "Reproduced" means verified by this
seat's own executable computation (§ Reproduced Mathematical Evidence);
"derivation" means verified by explicit re-derivation here.

| # | Claim (source) | Depends on | Evidence | Verdict |
|---|---|---|---|---|
| L1 | `indepCount F k = (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)` — actual independent `k`-subsets counted once (`INFORMAL-PROOF.md` §1, entry 1) | — | Compared character-by-character with `SEMANTIC-CONTRACT.md` lines 9–10 and the frozen G1 source entry 1. Defining body identical. Re-implemented literally in both evaluators. | **verified** |
| L2 | `coeff F k = if 0 ≤ k then indepCount F k.toNat else 0` (§1, entry 2) | L1 | Identical to `SEMANTIC-CONTRACT.md` lines 11–12 / frozen entry 2. Zero at negative `k` reproduced. | **verified** |
| L3 | `delta F k = coeff F (k+1) − coeff F k` (§1, entry 3) | L2 | Identical to `SEMANTIC-CONTRACT.md` lines 13–14 / frozen entry 3. Yields `Δ_{−1} = 1` and `Δ_r = i_{r+1} − i_r` for natural `r`; both reproduced. | **verified** |
| L4 | Tooling note: entries 1–3 are `namespace`-wrapped rather than dotted, so their registered-entry digests differ from the frozen ones, but the elaborated declarations and defining bodies are identical (§1) | L1–L3 | Frozen entries 1–3 read directly: same binders, same types, same bodies; only the `namespace Erdos993G1 … end` wrapper and the dotted-name form differ. Registered digests `f6bc96fd…`/`15ce5e34…`/`d7dc776c…` vs. frozen `858f5de3…`/`92ee6695…`/`b34fa17e…`, exactly as disclosed. Disclosure is accurate and complete; no meaning change. | **verified** (imprecision disclosed, not concealed) |
| L5 | The `m` pairs `{f(i,false), f(i,true)}` are disjoint edges of `G`, and `Finset.univ.image f = Finset.univ` — the endpoint set is all of `X`, `|image f| = 2m = |X|` (§3.1; entries 9, 11) | L1 | Derivation: `f` injective ⟹ `|image f| = |Fin m × Bool| = 2m`; `Nat.card X = 2m`; a subset of a finite set of equal cardinality is the whole set (`Finset.eq_of_subset_of_card_le`). No case split needed. Reproduced structurally: every graph in the sweeps is built on a fixed `mK₂` whose endpoints are all of `[2m]`. | **verified** |
| L6 | Forbidden-set lemma: for independent `S`, `∃ Q ⊆ image f` with `Q.card = 2·|S ∩ image f|` and every `x ∈ Q` in `S` or adjacent to `S` (§3.1, entry 8) | L5 | Derivation: `C = {p : f p ∈ S}`; `flip(i,b) = (i,!b)` is a fixed-point-free involution; `C ∩ C.image flip = ∅` (otherwise a matched pair lies inside `S`, contradicting independence, since `f p ~ f (flip p)` by `he`); `f` injective ⟹ `|(C ∪ C.image flip).image f| = 2|C| = 2|S ∩ image f|`; each element is in `S` (from `C`) or adjacent to a point of `S` (from `C.image flip`). | **verified** |
| L7 | Support bound: every independent `S` has `|S ∩ image f| ≤ m`; with L5, `α(G) ≤ m`, hence `indepCount G k = 0` for `k > m` (§3.1/§4; entries 10, 15) | L5, L6 | Derivation: `Q ⊆ image f` and `|Q| = 2|S ∩ image f| ≤ |image f| = 2m`. Reproduced: check **S** (`i_k = 0` for all `k > m`) — 0 violations over 16,781,328 exhaustive graphs and 2,500,000 sampled graphs. | **verified (reproduced)** |
| L8 | Every independent set meets each matching edge at most once, so a size-`k` independent set meets exactly `k` distinct edges (§3.1) | L5, L6 | Derivation: both endpoints of a matching edge are adjacent, so at most one lies in `S`; `image f = univ` (L5) forces each vertex of `S` onto exactly one edge. | **verified** |
| L9 | Every independent `(r+1)`-set `S` contains exactly `r+1` independent `r`-subsets (§3.1, entry 12) | L1 | Derivation: subsets of independent sets are independent; `x ↦ S.erase x` is injective on `S` (`Finset.erase_injOn`) and exhausts the `r`-subsets of `S`. Reproduced: check **E** (count is exactly `k`) — 0 failures on every independent set of all 16,781,328 exhaustively enumerated graphs plus 2,100,000 sampled graphs. Note: Lean proves the `≥ r+1` direction, which is the direction `Finset.card_mul_le_card_mul` consumes; the informal "exactly" is nonetheless true. | **verified (reproduced)** |
| L10 | Every independent `r`-set `B` extends to at most `2(m−r)` independent `(r+1)`-sets: `B` meets exactly `r` edges, the forbidden set `Q` of those `2r` vertices is excluded, leaving the `2(m−r)` vertices on the `m−r` free edges, at most two per edge (§3.1, entry 13) | L6, L7, L8 | Derivation: `S = B ∪ {z}` independent, `z ∉ B` ⟹ `z ∉ Q` (if `z ∈ Q` then `z ∈ B`, excluded, or `z` is adjacent to a point of `B ⊆ S`, contradicting independence of `S`); `S ↦ z` is injective into `univ \ Q`, and `|univ \ Q| = 2m − 2r = 2(m−r)`. Reproduced: check **X** — 0 failures, same populations as L9. | **verified (reproduced)** |
| L11 | Containment double count: `(r+1)·i_{r+1} ≤ 2(m−r)·i_r`, unconditional in `r` with ℕ truncation; when `r > m` both sides are `0` (§3.1, entries 14, 16) | L9, L10, L7 | Derivation: `Finset.card_mul_le_card_mul` on `B ⊆ S` with lower bound `r+1` per `S` (L9) and upper bound `2(m−r)` per `B` (L10); for `r > m` both index sets are empty by L7. Reproduced: check **C** over every `r ∈ [0, n]` — 0 violations over 16,781,328 exhaustive and 2,500,000 sampled graphs. | **verified (reproduced)** |
| L12 | Threshold arithmetic: `2m ≤ 3r+1 ⟹ 2·(m−r)_ℕ ≤ r+1`, including the truncated branch `r ≥ m` (§3.2, entry 17) | — | Derivation: for `r < m`, `2m − 2r ≤ (3r+1) − 2r = r+1`; for `r ≥ m`, `(m−r)_ℕ = 0` and `0 ≤ r+1`. Reproduced: exhaustive over `(m,r) ∈ [0,400)²` — 0 counterexamples; the converse also holds for `r < m`, so the two conditions are equivalent there. Equivalently `d := 2(m−r)`, `2m = 2r+d`, `3d ≤ 2m+2 ⟺ d ≤ r+1`. | **verified (reproduced)** |
| L13 | Assembly: `(r+1)i_{r+1} ≤ 2(m−r)i_r ≤ (r+1)i_r` using `i_r ≥ 0` (entry 7), then cancel `r+1 > 0` to get `i_{r+1} ≤ i_r`, i.e. `Δ_r ≤ 0`; the `r ≥ m` branch instead uses `i_{r+1} = 0` (§4, entry 18) | L11, L12, L7, L3 | Derivation: `mul_le_mul_of_nonneg_right` then `le_of_mul_le_mul_left` with `0 < r+1` in ℤ; the ℕ→ℤ passage is `delta_nat_aux` (entry 6) from `coeff_nat_aux` (entry 5), i.e. the zero extension `coeff F (k:ℤ) = indepCount F k` for natural `k`. `indepCount` is a cast of `Nat.card`, hence `≥ 0` (entry 7). Reproduced: check **T** — 0 violations of `Δ_r ≤ 0` at every admissible `(G, r)`. The `r < m` case split in Lean is a redundancy, not a gap: the same chain also closes the `r ≥ m` case since `2(m−r)_ℕ = 0`. | **verified (reproduced)** |
| L14 | Contract clause: "Equivalently, with `d = 2m−2r` (always even …): a perfect-matching graph of order `2r+d` with `3d ≤ 2m+2` has `Δ_r ≤ 0`" | L12 | Over ℤ the two forms are exactly equivalent (`3(2m−2r) ≤ 2m+2 ⟺ 2m ≤ 3r+1`), and `d = 2(m−r)` is even. If `d` is instead read as a **natural** excess (`d ≥ 0`), the `d`-form silently presupposes `r ≤ m` and is then strictly weaker than the first sentence, which quantifies over every natural `r`. `SEMANTIC-CONTRACT.md` defines excess as `d(F,r) = |V(F)| − 2r` with no nonnegativity clause, so the ℤ reading is the contract-literal one and the equivalence is exact. Under either reading the **proved** statement is the first sentence, i.e. the stronger one; no claim is made that is not proved. | **imprecise but true under the contract-literal reading; recorded, not a defect** |
| L15 | Grade claim: `compiled-candidate`, kernel-verified with axioms exactly `propext`, `Classical.choice`, `Quot.sound`; explicitly **not** `formally_verified` (§6) | — | `EVIDENCE/axioms.txt` read directly: exactly those three axioms, no `sorryAx`. `Main.lean` grep: no `sorry`, `admit`, `native_decide`, or `axiom` declaration; 18 registered entries, exactly one `theorem`. The informal proof itself names the missing gates (no reviewer assignment, no independent informal audit, no fidelity review, no close). No overclaim. | **verified** |

Ledger totals: 15 rows, **15 terminal**, 0 open, 0 escalated as defects,
1 recorded imprecision (L14) and 1 recorded disclosed-tooling deviation (L4),
neither of which affects the truth of the claim or the completeness of the proof.

**Dependency closure.** L1→L2→L3; L5→{L6,L8}; {L6,L7,L8}→L10; L9,L10→L11;
L11,L12,L7,L3→L13. Every leaf is either a definition checked against
`SEMANTIC-CONTRACT.md` or an elementary finite-combinatorial fact reproduced
below. No step imports an unproved external result; no Mathlib lemma is used
outside its stated hypotheses (`Finset.card_mul_le_card_mul`,
`Finset.eq_of_subset_of_card_le`, `Finset.erase_injOn`, `Finset.card_image_le`,
`le_of_mul_le_mul_left`, `mul_le_mul_of_nonneg_right` — each checked against the
use site).

## Reproduced Mathematical Evidence

Two evaluators, **written from scratch for this audit** under
`<run root>/scratchpad/c1-s7-informal-LA2/`, importing no prior evaluator and
sharing no code. They use deliberately different algorithms so that agreement is
evidence rather than a shared bug:

- `pm_audit.c` (SHA-256 `a2cbc98b77c72e67d28c0899af6cc05907cecc9a21c09ba129364f0aed51de8b`) —
  subset-DP independence oracle over bitmasks, exact `int64`; transcript
  `pm_audit.c.out` (`d3320e5d53d5f1a678f315aa6d57550f2f6807a57ec12d2091f692546819683c`).
- `pm_audit.py` (SHA-256 `77ad686f9c9c55b1ed7d16fc8b734fa3e6efd95e17997aba051dfdc02824d712`) —
  explicit pair scan over `itertools.combinations`, exact Python integers;
  transcript `pm_audit.py.out`
  (`9b01519ae17c3c7a3d18cb15af3ffabdb5d574d1e5777333f3df61e1dd495091`).

Both implement `indepCount`, `coeff` (zero at negative `k`), and
`delta F k = coeff F (k+1) − coeff F k` literally from `SEMANTIC-CONTRACT.md`.
Model: vertices `0 … 2m−1`, the perfect matching fixed as
`mK₂ = {(0,1),(2,3),…}`; ranging over **every** subset of the `C(2m,2) − m`
non-matching pairs enumerates exactly the graphs on `[2m]` containing that
perfect matching, i.e. up to isomorphism every graph of order `2m` carrying a
perfect matching.

Checks per graph: **T** the theorem (`2m ≤ 3r+1 ⟹ Δ_r ≤ 0`, every `r`);
**C** the containment count (every `r`, unconditional, ℕ truncation);
**Z** `r+1 > m ⟹ i_{r+1} = 0`; **S** `α ≤ m`; **E** the per-`S` count is exactly
`r+1`; **X** the per-`B` bound `≤ 2(m−r)`.

### 1. Exhaustive sweeps over all perfect-matching graphs

| `n = 2m` | graphs (all supergraphs of `mK₂`) | T | C | Z | S | E | X |
|---|---|---|---|---|---|---|---|
| 4 (`m=2`) | 16 | 0 | 0 | 0 | 0 | 0 | 0 |
| 6 (`m=3`) | 4 096 | 0 | 0 | 0 | 0 | 0 | 0 |
| 8 (`m=4`) | 16 777 216 | 0 | 0 | 0 | 0 | 0 | 0 |

At `n = 8` the per-object lemma checks **E** and **X** were run on every one of
the 16 777 216 graphs (not a subsample). `pm_audit.py` independently reproduced
the `n = 4` and `n = 6` rows, including the tightness counts (1 and 0 admissible
`(G,r)` with `Δ_r = 0` and `i_r > 0`), with 0 disagreements.

### 2. Samples at `n = 10` and `n = 12`

| `n = 2m` | random supergraphs of `mK₂` (5 edge densities, p = 1/8 … 7/8) | T | C | Z | S | E | X |
|---|---|---|---|---|---|---|---|
| 10 (`m=5`) | 2 000 000 (E/X on all 2 000 000) | 0 | 0 | 0 | 0 | 0 | 0 |
| 12 (`m=6`) | 500 000 (E/X on 100 000) | 0 | 0 | 0 | 0 | 0 | 0 |

### 3. `mK₂` for `m ≤ 12`: the bound is tight, and the threshold is exactly the sign condition

`i_k(mK₂) = C(m,k)·2^k` (verified against brute force for `m ≤ 5`), so
`Δ_r = 2^r[2C(m,r+1) − C(m,r)]` and

```
Δ_r(mK₂) ≤ 0   ⟺   2(m−r) ≤ r+1   ⟺   2m ≤ 3r+1.
```

Checked for every `m ∈ [1,12]` and every `r ∈ [0,2m]`: the hypothesis of the
theorem and the sign of `Δ_r` on `mK₂` coincide with **no** exception. So the
threshold is not merely sufficient but exactly sharp on this family.

### 4. The boundary `2m = 3r+1` and the first failure `2m = 3r+2`

Boundary (`3r+1` even, i.e. `r` odd) — equality, `Δ_r = 0`, conclusion holds
non-strictly:

| `r` | `m` | `n` | `i_r` | `i_{r+1}` | `Δ_r` |
|---|---|---|---|---|---|
| 1 | 2 | 4 | 4 | 4 | 0 |
| 3 | 5 | 10 | 80 | 80 | 0 |
| 5 | 8 | 16 | 1 792 | 1 792 | 0 |
| 7 | 11 | 22 | 42 240 | 42 240 | 0 |
| 9 | 14 | 28 | 1 025 024 | 1 025 024 | 0 |
| 11 | 17 | 34 | 25 346 048 | 25 346 048 | 0 |
| 13 | 20 | 40 | 635 043 840 | 635 043 840 | 0 |

First failing case `2m = 3r+2` (`r` even), one step past the threshold — the
hypothesis is **false** there and `Δ_r(mK₂) > 0` exactly as predicted:

| `r` | `m` | `n` | `i_r` | `i_{r+1}` | `Δ_r` |
|---|---|---|---|---|---|
| 2 | 4 | 8 | 24 | 32 | **+8** |
| 4 | 7 | 14 | 560 | 672 | **+112** |
| 6 | 10 | 20 | 13 440 | 15 360 | **+1 920** |
| 8 | 13 | 26 | 329 472 | 366 080 | **+36 608** |
| 10 | 16 | 32 | 8 200 192 | 8 945 664 | **+745 472** |
| 12 | 19 | 38 | 206 389 248 | 222 265 344 | **+15 876 096** |

### 5. Positive controls (the checker is not vacuous)

Re-running the sweeps with the hypothesis deliberately **relaxed** produces
violations, and the earliest violation is exactly the `mK₂` boundary case above:

| population | relaxed hypothesis | T violations |
|---|---|---|
| all 16 777 216 graphs, `n = 8` | `2m ≤ 3r+2` | **933** (first: `4K₂` at `r = 2`, `i_2 = 24`, `i_3 = 32`, `Δ_2 = +8`) |
| 2 000 000 samples, `n = 10` | `2m ≤ 3r+4` | **664 722** |
| 500 000 samples, `n = 12` | `2m ≤ 3r+3` | **45 965** |
| all 16 777 216 graphs, `n = 8` | `2m ≤ 3r+1` (as stated) | **0** |

So the 0-violation results in §§1–2 are informative, not an artifact of an
inert test.

### 6. The perfect-matching hypothesis is load-bearing (reported, not a change to the statement)

Dropping the perfect matching while keeping the same order and the same `r`
breaks the conclusion:

| graph | `n` | perfect matching? | `r` | `2m ≤ 3r+1`? | `Δ_r` |
|---|---|---|---|---|---|
| `3K₂ ∪ K₁` (registered, `d = 3`) | 7 | no — **odd order** | 2 | n/a | **+2** (`i_2=18`, `i_3=20`) |
| `8K₁` | 8 | no (`ν = 0`) | 3 | yes (`8 ≤ 10`) | **+14** |
| `K₂ ∪ 6K₁` | 8 | no (`ν = 1`) | 3 | yes | **+5** |
| `3K₂ ∪ 2K₁` | 8 | no (`ν = 3 < 4`) | 3 | yes | −10 (a near-perfect matching often suffices — which is why the rows above matter) |
| `4K₂` | 8 | **yes** | 3 | yes | −16 |
| `4K₂` | 8 | **yes** | 2 | **no** (`8 > 7`) | **+8** |

The registered `3K₂ ∪ K₁` value `Δ_2 = +2` reproduces the run's own recorded
value (T critique, `E993-FOREST-D3-BARE-MATCHING3-SIGN`, smallest witness order
7). Note that this witness has **odd** order, so no perfect-matching graph
exists at that order at all — the hypothesis already forces even order, which is
precisely the "uniform over even `d` only" fence. The even-order rows (`8K₁`,
`K₂ ∪ 6K₁`) show the fence is load-bearing at an order and rank where a legal
perfect-matching instance does exist. The last row shows the *threshold*, not
just the matching, is load-bearing.

### 7. Definition-level checks against the semantic contract

- `indepCount F k = Nat.card {S // F.IsNIndepSet k S}` — actual independent
  `k`-subsets counted once; `i_0 = 1`; zero beyond `α`. Reproduced.
- `coeff F k = 0` for `k < 0`; `coeff F (k:ℤ) = indepCount F k` for natural `k`.
  Reproduced (`coeff(−1) = coeff(−5) = 0`).
- `delta F k = coeff F (k+1) − coeff F k`; `Δ_{−1} = 1`; `Δ_r = i_{r+1} − i_r`
  for every natural `r`, including `r ≥ n` where both terms are `0`. Reproduced.
- **No first-descent, forest, residual, stratum, tree, or G1-guard notion enters
  anywhere.** Direct grep of `LeanProject/LeanProof/Main.lean` for
  `firstDescent`, `residual`, `IsTree`, `IsAcyclic`, `forest`, `ambient`,
  `ordinaryG1Guards`, `deleteVerts`, `closedNeighborhood`, `vertexDegree`,
  `stratum`, `sorry`, `admit`, `native_decide`, `axiom` — **no hits**. The proof
  uses only `indepCount`/`coeff`/`delta` plus Mathlib `Finset`/`SimpleGraph`
  machinery.

## Independent Critic Pass

Run after the ledger was complete, against the unchanged claim, deliberately
looking for reasons to fail it.

1. **Does the proof prove a weaker statement than the claim?** No. The claim
   quantifies over *every* natural `r` with `2m ≤ 3r+1`, including `r ≥ m`. The
   proof covers that region explicitly (entry 15 + the `by_cases` in entry 18),
   and the region is non-empty (e.g. `m = 2, r = 2`: `4 ≤ 7`). Checked by check
   **Z**: 0 violations. *No gap.*
2. **Is "exactly `r+1`" (§3.1, first bullet) an overclaim relative to the Lean
   `≥ r+1`?** The Lean proves the direction the double count consumes; the
   informal's "exactly" is the stronger reading and is nonetheless **true**
   (check **E**: 0 failures on every independent set of every graph in the
   exhaustive `n ≤ 8` sweeps and of 2 100 000 sampled graphs at `n = 10, 12`). The
   inequality used downstream is the one Lean establishes. *No defect; the
   informal's extra precision is correct.*
3. **Does the informal §3.1 description of the extension bound match the Lean?**
   The informal describes injectivity of `S ↦ (the unique element of S \ B)`;
   the Lean argues the mirror direction, `filter ⊆ (univ \ Q).image (z ↦ insert z B)`
   then `card_image_le`. Both yield the identical bound `≤ |univ \ Q| = 2(m−r)`,
   and the informal's map is itself injective into `univ \ Q`. *Presentational
   difference only; mathematically the same step.*
4. **Is `|univ \ Q| = 2(m−r)` safe under ℕ truncation when `r > m`?**
   `Q ⊆ univ` with `|Q| = 2r` forces `2r ≤ 2m`, hence `r ≤ m`, so the
   subtraction is not truncated where it is used; and where no such `B` exists
   the statement is vacuous. *Sound.*
5. **Degenerate `m = 0`.** `Nat.card X = 0` with `Finite X` forces `X` empty;
   then `i_0 = 1`, `i_k = 0` for `k ≥ 1`, and `Δ_0 = −1 ≤ 0`, `Δ_r = 0 ≤ 0` for
   `r ≥ 1`. The containment at `r = 0` reads `i_1 ≤ 0`, true. *No corner
   failure.* (Also covered by the `n = 4 … 12` sweeps at every `r`, including
   `r` beyond `α`.)
6. **Is `Δ_r ≤ 0` ever violated inside the hypothesis region?** Over
   16 781 328 exhaustively enumerated perfect-matching graphs and 2 500 000
   sampled ones, at every admissible `r`: **zero** violations; and relaxing the
   hypothesis by one unit immediately produces 933 violations at `n = 8`. *The
   claim is confirmed and the threshold is confirmed to be exactly the right
   one.*
7. **Is the double count itself ever violated?** Check **C**, run
   unconditionally in `r` on every graph in every population: **zero**
   violations. *The load-bearing lemma is confirmed independently of the
   theorem.*
8. **Is the namespace/digest deviation (L4) a concealed substitution of
   definitions?** No. The frozen source was read directly and the defining
   bodies are identical; the deviation is disclosed in `INFORMAL-PROOF.md` §1,
   in `FORMALIZER-REPORT.md`, and in the contract's `definitions[]` descriptions,
   with the frozen digests cited. *Disclosed tooling artifact, not a semantic
   change.* It is nevertheless the one place where a future reader could be
   misled by a digest mismatch, and it is recorded here for that reason.
9. **Does the "Equivalently … 3d ≤ 2m+2" clause assert a false equivalence?**
   Only under a reading of `d` as a *natural* number, where it would be strictly
   weaker than the first sentence rather than equivalent. Under the contract's
   own excess convention (`d(F,r) = |V(F)| − 2r`, integer-valued) the
   equivalence is exact. In neither reading does the contract claim something
   unproved. *Recorded as imprecision (L14); not a defect, and not softened into
   silence.*
10. **Does anything in the proof depend on the sibling award run, on a
    certificate, on `native_decide`, or on a computer search?** No. The proof is
    a two-lemma elementary double count plus `omega`-level arithmetic; grep
    confirms no `native_decide`/`sorry`/`admit`; the provenance chain
    (F critique §4 → U adjudication E11 → synthesis Award group B → this
    contract) is intact and reproduces the same argument in the same shape.
    *Clean.*
11. **Is the grade claim defensible?** `INFORMAL-PROOF.md` §6 claims
    `compiled-candidate` and explicitly disclaims `formally_verified`, naming
    the outstanding gates. Consistent with `EVIDENCE/axioms.txt` and with this
    audit's own status (this audit is itself one of those gates; the fidelity
    review and the close remain outstanding). *No overclaim.*

Critic verdict: **agrees with the prover on every ledger row.** No disputed
row, no unsupported gap, no citation mismatch, no untraceable assertion.

## Scope and Fence Check

The claim asserts nothing fenced. Each fence checked against the claim text,
`INFORMAL-PROOF.md` §5, the synthesis "Excluded conclusions", and the Lean
source.

| Fence | Status |
|---|---|
| **Uniform over even `d` only** | Stated in the claim and in §5. Confirmed necessary: `Nat.card X = 2m` and the perfect matching force `d = 2(m−r)`, always even; odd-order witnesses such as `3K₂ ∪ K₁` are outside the statement by construction (§6 of the evidence). |
| **Not Tier 3a** | Stated. The hypothesis is a perfect matching on **all** of `X` (`2m = Nat.card X`), not a matching of size `≥ m(d)` inside a larger graph; the Lean hypothesis `hn : Nat.card X = 2 * m` makes this unavoidable. Confirmed load-bearing: `8K₁` and `K₂ ∪ 6K₁` at `n = 8, r = 3` satisfy `2m ≤ 3r+1` and have `Δ_3 > 0`. Nothing is said about `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`. |
| **No sharpness claim** | The conclusion is the non-strict `Δ_r(G) ≤ 0`; §5 explicitly records that sharpness on `mK₂` is a comparator fact and not part of the award. This audit reproduced the sharpness (§§3–4 of the evidence) **as a report only**; it forms no part of the claim and no part of the verdict. |
| **No transfer to `firstDescent`/`x(G)`** | Neither appears in the claim, the informal proof, or `Main.lean` (grep: no hits). |
| **No transfer to forests / trees / acyclicity** | No acyclicity hypothesis anywhere; `domain-graph` is "an arbitrary ordinary simple graph on `X`. No acyclicity, no forest hypothesis." Grep: no `IsTree`/`IsAcyclic`/`forest` hits. |
| **No transfer to residuals or G1 tuples** | `residual`, `ambientA`, `ambientH`, `deleteVerts`, `closedNeighborhood`, `ordinaryG1Guards` appear nowhere. |
| **No Tier 1 / Tier 2 / diagnostic band** | Not mentioned except to be excluded; nothing in the DAG touches `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, or `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`. |
| **No FOREST / TREE / TRANSFER / `E993-BETA-AGG` / Erdős #993** | All named in the claim's exclusion list; none is used, implied, or strengthened. |
| **No new definition, no weakened definition** | Entries 1–3 are the `SEMANTIC-CONTRACT.md` definitions verbatim in body (L4); entries 4–18 are fresh lemmas over them. `indepCount F k = Nat.card {S // F.IsNIndepSet k S}`, `coeff` zero at negative `k`, `delta F k = coeff (k+1) − coeff k` — all as required. |
| **Hypotheses in the claim = hypotheses of the Lean declaration** | Confirmed one-for-one (table in § Intended Claim); `expected_statement_sha256` recomputed and matched; the declaration text occurs verbatim in `Main.lean` entry 18. |
| **Axiom / completeness policy** | `EVIDENCE/axioms.txt`: exactly `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, `admit`, `sorryAx`, `native_decide`, or `axiom` declaration in the source. (Recorded as read; kernel adjudication is not this seat's remit.) |

One scope observation, recorded for the controller and **not** a defect: the
claim's first sentence is *stronger* than its own "Equivalently" restatement
under a natural-number reading of `d` (L14, critic item 9). The proof
establishes the stronger sentence, so the contract is not over-claiming; the
wording is merely looser than the mathematics it governs.

## Verdict

**passed**

`INFORMAL-PROOF.md` (SHA-256 `93366e7c81065578d6fa5749172832404fac1cbe2805b00e330c93b371e20667`)
is a complete and correct informal proof of the contract's
`theorem.informal_statement` (`claim_sha256`
`48c1fb76dc66ef5425c10de0ddc0087c74b58767aa2589c92931133f2244a882`, recomputed
by this seat and matching). Every definition it uses is the
`SEMANTIC-CONTRACT.md` definition; every inference step is either an elementary
derivation re-derived here or a finite-combinatorial fact reproduced by this
seat's own executable evaluators; the claim's hypotheses are exactly those of the
Lean declaration `Erdos993G1.C1LA2.perfectMatching_delta_nonpos`; and the claim
asserts nothing fenced.

No step is defective. Two items are recorded as imprecisions rather than
defects, both already disclosed by the producer and neither affecting the truth
or completeness of the proof:

- **L4** — entries 1–3 are `namespace`-wrapped rather than dotted, so their
  registered-entry digests differ from the frozen G1 entries' digests; the
  defining bodies were read and are identical.
- **L14** — the contract's "Equivalently … `3d ≤ 2m+2`" restatement is exactly
  equivalent only under the integer-valued excess convention; under a
  natural-number reading it is strictly weaker than the first sentence. The
  proved statement is the stronger first sentence in either case.

Scale mode: single problem. Stop reason: **all ledger claims terminal**
(15/15), prover and critic in agreement, with independently reproduced
evidence. Not budget exhaustion, not a stall, not a blocked source.
Outstanding gates beyond this seat's remit: the independent fidelity review and
the canonical close; per `INFORMAL-PROOF.md` §6 and `FORMALIZER-REPORT.md` the
run's grade remains **`compiled-candidate`** and nothing here makes it
`formally_verified`.

Attestation id: `c1-la2-informal-pass-20260920`.
Reviewer id: `c1-la2-fable-informal-20260920`
(kind `independent-mathematical-proof-integrity-reviewer`).
Producer id: `c1-la2-formalizer-sonnet-20260920`.
