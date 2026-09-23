---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c4-la2-formalizer-sonnet-20260921
critic_id: c4-la2-fable-informal-20260921
attestation_id: c4-la2-informal-pass-20260921
claim_sha256: 9d1b527d13d50f35e53fd457c922a21a31e631c9f547daded23f4019b7c624ff
---

# Informal Proof Integrity Audit

**VerityOS boot.** Operating within VerityOS. Loaded `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`
(scale mode: single problem; verdict discipline and guardrails of skill v0.4
applied). Subsystems touched: `identity/`, `skills/`, `experiments/` (this run
root only). No durable VerityOS record is written by this seat; the sole output
is this audit file and its scratch, under the run root.

**Model disclosure.** This seat is chartered Claude Opus 5 at effort `high`
(`control/C4-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md` §0, and
`control/C4-STAGE7-PROTOCOL.md` "Model policy"). The seat **cannot
self-inspect its runtime model or effort setting**; the transport exposes no
effort parameter. The model/effort statement is made **on dispatch-record
authority only**. Child delegation: none (forbidden by brief; none performed).

**Seat boundary.** Reviewer, not producer. Nothing outside
`scratchpad/c4-s7-informal-LA2/` was created or modified; the contract, the
Lean source, `INFORMAL-PROOF.md` and every receipt are untouched. No `lake`,
`elan`, or build command of any kind was run. No `/tmp`, `mktemp` or `TMPDIR`
path was used.

**Capsule and binding digests recomputed by this seat (all match):**

| object | recomputed SHA-256 | expected |
|---|---|---|
| `runs/…/THEOREM-CONTRACT.yaml` | `abcb0e4384a4f78345d2c67c60f72a25cbebccd767b550091bbeb0c298487e10` | match |
| `runs/…/INFORMAL-PROOF.md` | `019b4abf563cac0c3ae981e72351e560c3e9074c0bfe99b96a597dc71ec669c7` | match |
| `runs/…/LeanProject/LeanProof/Main.lean` | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | match |
| contract `lean_binding.expected_statement` | `bca81d5c08164f14197f86498d2c3dcccd426a6222a3366bfeb695d71f4022d7` | match |
| capsule seal `C4-LA2-PACKET-MANIFEST.json` | `5a2bde9118fffb7903d5474d53eb5342df62cb755fabfb284cc8780afc549938` | match |

The capsule seal was reproduced from first principles, not read off the
manifest: it is the SHA-256 of the manifest object with the `seal_sha256` key
removed, serialized as compact sorted JSON. All nine member files were
re-digested and re-sized independently; all nine match the manifest.

`claim_sha256` was recomputed by this seat as the SHA-256 of
`theorem.informal_statement` with whitespace collapsed by `" ".join(s.split())`
(the statement carries no newline and no repeated space, so the collapse is
verifiably the identity on it) and equals the value required by the brief:
`9d1b527d13d50f35e53fd457c922a21a31e631c9f547daded23f4019b7c624ff`.

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`:

> For every finite acyclic simple graph G on a finite vertex type X and every
> integer k >= 1: if Erdos993G1.delta G k < 0 (a strict descent in the
> independent-set-count sequence at rank k, verbatim G1 definitions) then
> Nat.card X <= (k+1)^2. Uniform in k and in G (any forest, connected or not,
> including the empty forest); no tightness claim beyond k=1; not a no-recovery
> statement; no transfer to Tier 1, NR1, FOREST, TREE, TRANSFER or Erdos #993.

The object audited is `INFORMAL-PROOF.md` **as a proof of that claim**. The
Lean declaration bound by the contract is

```lean
theorem forest_descent_order_bound {X : Type u} [Finite X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ (k + 1) ^ 2
```

which reproduces the Cycle 4 synthesis's Award group 2 statement of record
(`cycles/cycle-4/stage6/SYNTHESIS.md` lines 940–955) character for character,
and matches the adjudication's E3 (`…/stage5/adjudicators/T/ADJUDICATION.md`
lines 859–867 and 1036–1049). Hypothesis-by-hypothesis correspondence between
the informal claim and the declaration:

| informal claim | Lean | verdict |
|---|---|---|
| finite vertex type `X` | `{X : Type u} [Finite X]` | one-for-one |
| finite acyclic simple graph `G` | `(G : SimpleGraph X) (hG : G.IsAcyclic)` | one-for-one |
| every integer `k >= 1` | `(k : ℕ) (hk : 1 ≤ k)`, used as `(k : ℤ)` | one-for-one (every integer ≥ 1 is a cast natural ≥ 1) |
| `Erdos993G1.delta G k < 0` | `(hneg : Erdos993G1.delta G (k : ℤ) < 0)` | one-for-one |
| `Nat.card X <= (k+1)^2` | `Nat.card X ≤ (k + 1) ^ 2` | one-for-one |

No hypothesis is present in one and absent in the other; no hypothesis is
silently strengthened or weakened.

## Claim Ledger

Statement-level ledger. "Reproduced" means this seat re-derived or recomputed
the item with its own instrument (`scratchpad/c4-s7-informal-LA2/*.py`); "Lean"
means the corresponding registered declaration in `Main.lean` was read and
found to state the same mathematics (this seat audits the mathematics, not the
kernel).

### A. Definitions (INFORMAL-PROOF §1)

| id | claim | evidence | verdict |
|---|---|---|---|
| D1 | `indepCount F k = (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)` is the G1 definition verbatim | character-compared against `SEMANTIC-CONTRACT.md` entry 1; Lean entry 1 | verified |
| D2 | `coeff F k = if 0 ≤ k then indepCount F k.toNat else 0` verbatim (integer zero-extension) | `SEMANTIC-CONTRACT.md` entry 2; Lean entry 2 | verified |
| D3 | `delta F k = coeff F (k+1) − coeff F k` verbatim | `SEMANTIC-CONTRACT.md` entry 3; Lean entry 3 | verified |
| D4 | for `k : ℕ`, `delta G k < 0 ⟺ i_{k+1} < i_k` | `0 ≤ k` and `0 ≤ k+1` make both `coeff` branches the `indepCount` branch and `(k:ℤ).toNat = k`; Lean `coeff_nat`/`delta_nat` | verified |
| D5 | `i_k` is the count of **actual independent `k`-subsets**, each counted once | Mathlib `IsNIndepSet n s` = pairwise non-adjacent `Finset` of card `n`; `indepSetFinset n = {s | IsNIndepSet n s}`; `isIndepSet_iff : IsIndepSet s ↔ s.Pairwise (¬ Adj)` | verified |
| D6 | the negative-index zero-extension is irrelevant here (`k ≥ 0` throughout) | `hk : 1 ≤ k` and `k+1 ≥ 2`; only `coeff` at `k`, `k+1 ≥ 0` is touched | verified |

*Note on D1.* `Nat.card` is `toNat (mk α)`, which returns `0` for an infinite
type. That is harmless here because `[Finite X]` is a hypothesis of every
declaration in the chain; the same `[Finite X]` makes the conclusion's
`Nat.card X` the honest order `n`.

### B. Forest input (INFORMAL-PROOF §3.2) — the only use of acyclicity

| id | claim | evidence | verdict |
|---|---|---|---|
| B1 | for a finite acyclic `G`: `#E + #components = n` | tree identity `|E(C)| + 1 = |V(C)|` per component summed; Mathlib `IsAcyclic.isTree_connectedComponent`, `IsTree.card_edgeFinset`; Lean entry 9 | verified (standard; the Lean derivation via degree sums was read and is correct). This seat's generator builds every component by leaf addition, so each component carries exactly `order − 1` edges and `e = n − c` holds by construction across the population — corroboration, not an independent proof of B1 |
| B2 | `n ≥ 1 ⟹ #components ≥ 1` | `X` nonempty, `Nat.card_pos`; Lean entry 10 | verified |
| B3 | `n ≥ 1 ⟹ e ≤ n − 1` | B1 + B2, ℕ-safe (`omega`); Lean entry 11 | verified; 0 violations over the enumerated population |
| B4 | the empty forest needs no edge bound (`n = 0`: B1 reads `0 + 0 = 0`; the conclusion `0 ≤ (k+1)²` is trivial) | direct | verified |
| B5 | acyclicity is used **nowhere else** | read of all 17 registered declarations: the acyclicity hypothesis appears only in entries 9 and 11 (where it is used) and in entries 16 and 17 (where it is only forwarded into entry 11) — i.e. exclusively the edge-bound chain | verified |

*Mathlib meaning check.* `SimpleGraph.IsAcyclic G := ∀ ⦃v⦄ (c : G.Walk v v), ¬c.IsCycle`
— "no cyclic walk", exactly as the contract's `hyp-acyclic` describes; it does
**not** require connectedness or nonemptiness. The claim's "any forest,
connected or not, including the empty forest" is therefore accurate.

### C. Counting steps (INFORMAL-PROOF §3.3–3.4)

| id | claim | evidence | verdict |
|---|---|---|---|
| C1 | `i_k ≤ C(n,k)` | `indepSetFinset k ⊆ univ.powersetCard k`; Lean entry 8 | verified; reproduced on all 33,867 labelled graphs of order ≤ 6, 60,000 random graphs of order 7–8, and 3,269,194 forests: 0 violations |
| C2 | every non-independent `(k+1)`-set contains an edge of `G` | `¬IsIndepSet S` unfolds (`isIndepSet_iff`) to ∃ x,y ∈ S, x ≠ y, `Adj x y`; Lean entry 12 `hsub` | verified |
| C3 | for a fixed edge `e = {a,b}`, exactly `C(n−2, (k+1)−2) = C(n−2,k−1)` of the `(k+1)`-subsets contain `e` | Mathlib `Finset.card_filter_powersetCard_subset (s t) (n) (hst : s ⊆ t) (hsn : #s ≤ n) : #((t.powersetCard n).filter (s ⊆ ·)) = (#t − #s).choose (n − #s)`, applied at `s = e.toFinset` (`#s = 2` by `Sym2.card_toFinset_of_not_isDiag`, legitimate since `G` is loopless), `t = univ` (so `#t` is the order `n`), and the lemma's subset-size parameter set to `k+1` | verified; the count itself recomputed combinatorially for `n ≤ 12`, all `k ≥ 1` |
| C4 | `hk : 1 ≤ k` is what makes C3 available (`#s = 2 ≤ k+1`) | Mathlib hypothesis `hsn`; and at `k = 0` the true fibre count is `0` while truncated `C(n−2,k−1)` evaluates to `C(n−2,0) = 1` | verified (recomputed both sides at `k = 0`) |
| C5 | union bound: `#{non-independent (k+1)-sets} ≤ e · C(n−2,k−1)` | `Finset.card_biUnion_le` over `edgeFinset`; Lean entry 12 | verified |
| C6 | split: `C(n,k+1) = i_{k+1} + #{non-independent (k+1)-sets}` | `Finset.card_filter_add_card_filter_not`; Lean entry 13 | verified |
| C7 | (★) `C(n,k+1) ≤ i_{k+1} + (n−1)·C(n−2,k−1)` for `n ≥ 1` | C5+C6+B3, additive ℕ form, no truncated subtraction | verified; 0 violations over all three populations above |

### D. Binomial identities (INFORMAL-PROOF §3.5)

| id | claim | evidence | verdict |
|---|---|---|---|
| D7 | Identity 1: `C(n,k+1)·(k+1) = C(n,k)·(n−k)` | Mathlib `Nat.choose_succ_right_eq (n k : ℕ)`, unconditional | verified; recomputed for all `(n,k) ∈ [0,260]²` under ℕ-truncated subtraction: 0 mismatches |
| D8 | `Nat.choose_mul (hsk : s ≤ k) : n.choose k * k.choose s = n.choose s * (n−s).choose (k−s)` at `s = 2`, `k ↦ k+1` | Mathlib source read: the lemma has **only** `s ≤ k` as a hypothesis (no `k ≤ n`), so `2 ≤ k+1` (i.e. `k ≥ 1`) is the entire obligation, exactly as the proof says | verified |
| D9 | `n.choose(k+1)·(k+1).choose 2 = n.choose 2·(n−2).choose(k−1)` | D8 plus `k+1−2 = k−1` for `k ≥ 1` | verified |
| D10 | clearing with `n.choose 2·2 = n(n−1)` and `(k+1).choose 2·2 = (k+1)k` (both `Nat.choose_succ_right_eq` at `k = 1`) | Lean entry 14 `h2n`, `h2k` | verified |
| D11 | Identity 2: `C(n,k)·k·(n−k) = C(n−2,k−1)·n·(n−1)` (ℕ, truncated subtraction, `k ≥ 1`) | Lean entry 14 | verified; recomputed for `n ∈ [0,260]`, `k ∈ [1,260]`: 0 mismatches, **including** the truncation corners `n = 0, 1, 2` and `n < k` |
| D12 | `hk` is load-bearing for D11 | at `k = 0` the identity **fails** for every `n ≥ 2` (recomputed: 38 failures in `n ≤ 39`) | verified |
| D13 | both identities are multiplicative ℕ equalities — no division, no ℚ/ℝ intermediate | read of Lean entries 14 and 15 (`zify` only after the ℕ identities are established, with the `hnk`, `hn1` side conditions discharged) | verified |

*Contrast with the record.* Seat T4's original derivation (`…/returns/T4/RETURN.md`
§4) and C-T4-U's sharpening (`…/critics/T4/U/CRITIQUE.md` §4) both divide by
`(n−1)·C(n−2,k−1)` and manipulate the ratios `C(n,k+1)/C(n−2,k−1)` and
`C(n,k)/C(n−2,k−1)` in ℚ. The audited proof does **not** inherit that step: it
re-derives the same quadratic through the two multiplicative identities above.
That is a strict improvement in rigour (the record's division is valid but
needs `C(n−2,k−1) > 0`, which the record does not check explicitly), and it is
exactly what the contract's `formulation_status.evidence[2]` claims.

### E. Reduction to the quadratic (INFORMAL-PROOF §3.6)

Write `A = C(n,k)`, `B = C(n,k+1)`, `D = C(n−2,k−1)`.

| id | claim | evidence | verdict |
|---|---|---|---|
| E1 | sufficiency: `A + (n−1)D ≤ B` together with (★) and `i_k ≤ A` gives `i_k ≤ i_{k+1}`, i.e. `Δ_k ≥ 0` | chain `A + (n−1)D ≤ B ≤ i_{k+1} + e·D ≤ i_{k+1} + (n−1)·D`, then additive cancellation (`Nat.add_le_add_iff_right`) | verified; exhaustively re-checked as pure arithmetic over `A ≤ 24`, `D ≤ 9`, `n−1 ≤ 9`, `e ≤ n−1`, `i_{k+1} ≤ 24`, `B ≤ 59`: 0 violations |
| E2 | scaling by the positive `(k+1)·n`, using D7 on `B` and D11 on `(n−1)D`, turns the target into `A·[(k+1)(n + k(n−k))] ≤ A·[n(n−k)]` | `(n−1)·D·n = A·k·(n−k)` by D11, so `(n−1)D·(k+1)n = (k+1)·A·k·(n−k)`; `B(k+1)n = A(n−k)n` by D7 | verified symbolically |
| E3 | hence it suffices that `(k+1)(n + k(n−k)) ≤ (n−k)n`, since `A ≥ 0` gives the multiplied inequality and `(k+1)n > 0` cancels | Lean entry 15 `hmulA`/`hscaled`/`le_of_mul_le_mul_right` | verified |
| E4 | that inequality **is** `q(n) := n² − (k²+3k+1)n + k²(k+1) ≥ 0` | symbolic expansion: `(n−k)n − (k+1)(n + k(n−k)) − q(n) ≡ 0` | verified symbolically (exact polynomial arithmetic) |
| E5 | in the regime the reduction is an equivalence, not merely a sufficiency | `A = C(n,k) > 0` whenever `n ≥ (k+1)²+1 > k`; recomputed both directions for `k = 1..60`, `n = k+1..(k+1)²+59`: forward 0 failures, converse (under `A > 0`) 0 failures | verified |

### F. The quadratic (INFORMAL-PROOF §3.6)

| id | claim | evidence | verdict |
|---|---|---|---|
| F1 | `q((k+1)²) = −k(k+1) < 0` for `k ≥ 1` | symbolic: `q((k+1)²) + k(k+1) ≡ 0` | verified symbolically and numerically `k = 1..400` |
| F2 | `q((k+1)²+1) = 2 > 0` | symbolic: `q((k+1)²+1) − 2 ≡ 0` | verified symbolically and numerically `k = 1..400` |
| F3 | the vertex `(k²+3k+1)/2` lies strictly left of `(k+1)²+1`, because `k²+k+3 > 0` | symbolic: `2((k+1)²+1) − (k²+3k+1) ≡ k²+k+3` | verified symbolically |
| F4 | therefore `q` is strictly increasing on `[(k+1)²+1, ∞)` and `q(n) ≥ 2 > 0` for every integer `n ≥ (k+1)²+1` | symbolic: `q((k+1)²+1+s) − q((k+1)²+1) ≡ s² + s(k²+k+3) ≥ 0` for `s ≥ 0` (this is precisely the `nlinarith` certificate after the substitution `n = (k+1)²+1+s`) | verified symbolically and numerically `k = 1..400` |
| F5 | the threshold is exactly right: `q((k+1)²) < 0`, so this route cannot prove a bound below `(k+1)²` | numeric `k = 1..400`; and `A + (n−1)D ≤ B` **fails** at `n = (k+1)²` for every `k = 1..200` | verified |

### G. Assembly (INFORMAL-PROOF §3.1, §3.7)

| id | claim | evidence | verdict |
|---|---|---|---|
| G1 | proof by contradiction: assume `(k+1)² < n`, derive `Δ_k ≥ 0`, contradict `hneg` | Lean entry 17 | verified |
| G2 | no small-`n` case split is needed, because `(k+1)²+1 > k+1` for every `k ≥ 0` | `(k+1)²+1 − (k+1) = k²+k+1 > 0` | verified symbolically |
| G3 | the empty-forest / small-`n` regime is discharged by triviality of the conclusion, not by a vacuous-hypothesis lemma | `Nat.card X = 0 ≤ (k+1)²` needs no argument; matches contract `hyp-acyclic` note and `FORMALIZER-REPORT.md` condition (ii) | verified |
| G4 | the `Fintype.ofFinite X` bridge (with `classical`) only supplies instances; it changes no mathematics | `Nat.card_eq_fintype_card` is used to move between `Nat.card X` and `Fintype.card X` in entries 16/17 | verified |
| G5 | terminal statement = contract `expected_statement` = synthesis Award group 2 | character comparison; recomputed statement digest `bca81d5c…` | verified |

### H. Record-level claims made inside the proof

| id | claim | evidence | verdict |
|---|---|---|---|
| H1 | §4 attribution: `k²+3k` form is seat T4's (`RETURN.md` §4); sharp `(k+1)²` form critic-attributed jointly to C-T4-F (finding 1) and C-T4-U (§4); adjudicator-verified at "E3, ruling (a)" | all four loci read inside the sealed capsule. `RETURN.md` §4 states `n ≤ k²+3k`; C-T4-F lists `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` as a chartered addition; C-T4-U §4 proves `n ≤ (k+1)²` in three lines. The adjudicator's support is split across two loci — summary entry **E3** and the T4-section **Ruling (a)** ("both lemmas stand; the 'TIGHT' certification does not", which strikes the tightness literal and credits both critics independently). The proof's composite citation "E3, ruling (a)" names both correctly; E3 itself carries no `(a)` sub-label | verified |
| H2 | the sharp form implies the `k²+3k` form for `k ≥ 1` (`(k+1)² ≤ k²+3k ⟺ 1 ≤ k`) | direct | verified |
| H3 | §5 "true maxima are `4, 8, 11, 15` at `k = 1..4`" | exhaustive enumeration, below | verified for `k = 1,2,3` **conclusively**; `k = 4` corroborated but not closed (see Reproduced Evidence) |
| H4 | §3.2 "this run re-proves [`forest_card_edges_add_components`] byte-for-byte" | diffed the registered fragment against entry 58 of the frozen G1 source (`EVIDENCE/originating-source/Main.lean`, digest `aa517ebc…` re-verified by this seat) | **imprecise** — see critic finding 2; the mathematics is identical |

## Reproduced Mathematical Evidence

All instruments were written from scratch for this audit under
`scratchpad/c4-s7-informal-LA2/`. No prior evaluator, census, or generator from
this run (or from C-T4-U's `census.py`, or from the T4 return's
`verify_order_bound.py`) was read, imported, or executed. All arithmetic is
exact integer or exact symbolic; no floating point anywhere.

**Instruments**

| file | purpose |
|---|---|
| `algebra_check.py` | the two ℕ binomial identities under truncated subtraction, `choose_growth_of_large`, the symbolic reduction to `q(n)`, the three evaluations, monotonicity, sharpness, and the final cancellation |
| `forest_enum.py` | own unlabeled-tree generator (leaf addition + AHU canonical form at the tree centre), own independence-polynomial DP, own forest enumeration as multisets of trees, property checks |
| `probe.py` | the two graph-general steps on all labelled graphs of order ≤ 6 and random graphs of order 7–8; the exact fibre count; a non-exhaustive `k = 4` search at orders 20–25 |
| `extremal.py` | the `k = 1` extremal forests, the non-vacuity witness family, the `k = 0` analysis |

Logs: `algebra.log`, `enum19.log`, `enum20.log`, `probe.log`, `extremal.log`.

**(a) Algebra.** 15/15 checks pass (`algebra.log`).

* Identity 1 holds for every `(n,k) ∈ [0,260]²` in truncated-ℕ form.
* Identity 2 holds for every `n ∈ [0,260]`, `k ∈ [1,260]`, including the
  corners `n ∈ {0,1,2}` and `n < k` where ℕ-truncation is the hazard — and it
  **fails at `k = 0`** for every `n ≥ 2`, confirming `hk` is genuinely
  load-bearing for the route.
* `A + (n−1)D ≤ B` holds for `k = 1..400` on a dense band `n = (k+1)²+1 …
  (k+1)²+40` plus far-field points up to `100·((k+1)²+1)`; it **fails** at
  `n = (k+1)²` for `k = 1..200`.
* The reduction `(n−k)n − (k+1)(n + k(n−k)) ≡ q(n)` is an exact polynomial
  identity; `q((k+1)²) ≡ −k(k+1)`, `q((k+1)²+1) ≡ 2`,
  `2((k+1)²+1) − (k²+3k+1) ≡ k²+k+3`, and
  `q((k+1)²+1+s) − q((k+1)²+1) ≡ s² + s(k²+k+3)`. The last identity is the
  monotonicity argument in closed form and simultaneously exhibits the
  positivity certificate `nlinarith` must find.
* Forward and converse of the reduction agree in the regime (`A > 0`), so
  "reduces exactly to" in §3.6 is justified where it is used.

**(b) Exhaustive forest enumeration.** Own generator; **all unlabeled forests
of order ≤ 20**: 1,346,024 trees and **3,269,194 forests** enumerated. Per-order
counts were checked against the independent reference sequences (trees
`1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320,48629,123867,317955,823065`;
forests `1,1,2,3,6,10,20,37,76,153,329,710,1601,3658,8599,20514,49905,122963,307199,775529,1977878`)
— every order matched. The independence-polynomial DP was spot-checked against
brute-force subset counting on 73 trees. (The forest counts through order 16
also coincide with the 16-entry list C-T4-U reports in its §5 census, an
independent corroboration of both instruments.)

Results over that population:

* **Theorem: 0 violations.** `Δ_k(G) < 0 ⟹ n ≤ (k+1)²` held for every forest
  and every `k ≥ 1`.
* **Union bound (★): 0 violations**, every forest, every `k ≥ 1`.
* **`i_k ≤ C(n,k)`: 0 violations.**
* **Forest edge bound `e ≤ n−1`: 0 violations** (the generator carries
  `e = n − c` by construction, so this checks `c ≥ 1` for every nonempty
  forest, which is the step B2 that the bound actually needs).

**True maximum order admitting a strict descent at rank `k`:**

| `k` | true max `n` observed | `(k+1)²` | status |
|---|---|---|---|
| 0 | 0 (the empty forest only) | 1 | conclusive |
| 1 | **4** | 4 | **conclusive** (search range ≥ `(k+1)²`) |
| 2 | **8** | 9 | **conclusive** |
| 3 | **11** | 16 | **conclusive** |
| 4 | **15** | 25 | attained; no descent at `n = 16..20`; `21..25` not exhausted |
| 5 | 18 | 36 | search-limited |
| 6 | 20 | 49 | search-limited |

For `k = 1,2,3` the enumeration range reaches `(k+1)²`, and the audited theorem
(verified independently here) rules out every larger `n`, so `4, 8, 11` are
**proved maxima**, matching the record exactly. For `k = 4` the record's `15` is
attained (by a tree of order 15, `i = 1,15,91,288,510,503,260,62`) and no forest
of order 16–20 admits a `Δ_4` descent; orders 21–25 are beyond exhaustive reach
for this seat. A non-exhaustive search at orders 20–25 (40,000 random labelled
trees per order, all star forests — every integer partition — and 20,000 mixed
random forests per order) found minimum `Δ_4` values of
`2041, 3194, 4770, 6952, 9715, 13154` at `n = 20..25`: strongly positive and
increasing, consistent with `15` and with no sign of a counterexample. This
claim is a parenthetical fence in §5, not a premise of the theorem; it is
recorded as corroborated, not closed.

A cross-check on what the record means by those numbers: the adjudication's T4
Ruling (a) reports "per-rank slack `0, 2, 7, 13` at `k = 1..4` against true
maxima `4, 8, 11, 15`". Those slacks are against the **`k²+3k`** bound
(`4−4, 10−8, 18−11, 28−15`), not against `(k+1)²` (which would give
`0, 1, 5, 10`). This seat recomputed both columns; the record's arithmetic is
self-consistent and its maxima are the same quantity enumerated here.

**(c) The graph-general steps on graphs that are not forests.** §3.3 and §3.4
are not forest-specific and should hold for every simple graph; they do. All
**33,867** labelled simple graphs of order ≤ 6 and **60,000** random graphs of
order 7–8: `i_k ≤ C(n,k)` and `C(n,k+1) ≤ i_{k+1} + e·C(n−2,k−1)` (`k ≥ 1`)
with 0 violations. The exact fibre count of §3.4 was verified combinatorially
for `n ≤ 12` and every `k ≥ 1`, and shown to fail at `k = 0` under ℕ truncation
(true count `0`, truncated formula `1`).

**(d) Non-vacuity.** A theorem whose hypothesis is unsatisfiable would be a
fence problem. It is satisfiable at every rank: the edgeless forest on `k+1`
vertices has `i_k = k+1`, `i_{k+1} = 1`, so `Δ_k = −k < 0` for every `k ≥ 1`.
The enumeration independently exhibits at least one descending forest at every
rank `k = 1..20` inside the enumerated range.

**(e) The `k = 1` extremal case.** Exhaustively over all order-4 forests, the
forests with `Δ_1 < 0` are exactly `P_4` (`i = 1,4,3,0`) and `K_{1,3}`
(`i = 1,4,3,1`), both with `e = 3` and `Δ_1 = −1`; the bound `n ≤ (k+1)² = 4` is
attained there. No order-5 forest has `Δ_1 < 0`. This matches C-T4-U's
independent statement that `K_{1,3}` and `P_4` attain equality, and it is the
only rank at which attainment occurs anywhere in the searched range — exactly
what the fence "no tightness claim beyond `k = 1`" preserves.

## Independent Critic Pass

A second pass was run over this seat's own ledger, adversarially, before
closing. Seven items were raised; none is a defect in the mathematics of the
claim, and all are recorded here rather than softened away.

**1. `hk : 1 ≤ k` is necessary for the route, not for the truth of the
statement.** The brief asks what happens at `k = 0`. Answer: `Δ_0 < 0` means
`i_1 < i_0 = 1`, i.e. `i_1 = 0`, i.e. `n = 0`; and then `Nat.card X = 0 ≤ 1 =
(0+1)²`. So the statement is **true** at `k = 0` as well, and the exhaustive
enumeration confirms the empty forest is the unique `k = 0` witness. What fails
at `k = 0` is the *proof*: Identity 2 is false for every `n ≥ 2`, and the exact
fibre count is wrong under ℕ truncation. Including `hk` therefore **narrows**
the theorem relative to what is true — it can only under-claim, never
over-claim, so it is fence-safe. The contract's characterisation of `hk` as
"load-bearing" is correct as a statement about the proof route, and this seat
records explicitly that it is not a necessity claim about the mathematics.

**2. §3.2's "byte-for-byte" is imprecise.** The registered fragment
`Erdos993G1.forest_card_edges_add_components` (entry 9) is **not** byte-identical
to entry 58 of the frozen G1 source: the local copy adds `namespace Erdos993G1
… end Erdos993G1` around the declaration, and the three definitions are
re-wrapped across lines (hence different fragment digests: `7eef4f72…` vs
`0c2fc141…` for the lemma). A line-by-line diff shows the lemma's **statement
and every line of its proof script are identical**; only the namespace
packaging differs, which is what re-registration into a fresh project requires.
The mathematics is unaffected, and the definitions still match
`SEMANTIC-CONTRACT.md` verbatim as required. Recorded as wording imprecision
about provenance; it belongs to the statement-fidelity seat's domain, and it
does not touch this audit's verdict.

**3. §3.1's "in fact `n ≥ 2k+1`, used below" is unused.** The inequality is
true (`(k+1)²+1 − (2k+1) = k²+1 > 0`), but no later step uses it: the derivation
needs only `k ≤ n` and `1 ≤ n`, both of which the Lean proof derives directly
from `hn`. Harmless surplus, not a gap.

**4. §3.6's parenthetical describes a different cancellation than the one
used.** The text says "cancelling the common factor `A·(k+1)` when `A > 0`,
trivial when `A = 0`", whereas the actual route multiplies the quadratic by
`A ≥ 0` and then cancels the *positive* factor `(k+1)·n`. Both are valid; the
route taken needs no `A > 0` case split at all. The stronger word "reduces
exactly" is nevertheless justified in the regime, since `A = C(n,k) > 0`
whenever `n ≥ (k+1)²+1`, and this seat verified both directions numerically.
Cosmetic.

**5. §5 conflates two record labels.** It writes "the `x ≤ 4` rank closure
(`E6`/`E993-R25-FOREST-DESCENT-ORDER-BOUND-RANK-4` …)". In the record these are
two distinct objects: `E6` is the unconditional `K₁`-addition closure at
`x ≤ 4` (adjudication, "Exact theorems"), while
`E993-R25-FOREST-DESCENT-ORDER-BOUND-RANK-4` is C-T4-F's rank-4 order bound
`Δ_4(G) < 0 ⟹ |V(G)| ≤ 21`. Both carry the undischarged Hunter dependency and
both are excluded by the fence, so the conflation excludes *more*, never less.
No mathematical consequence; recorded for the record's precision.

**6. The synthesis's DAG lists a case split the proof does not perform.** The
synthesis DAG ends with "the `n ≥ k+1` case split (`n < k` gives `Δ_k = 0`;
`n = k` forces an edgeless forest)". The audited proof dispenses with it
(§3.1). This seat confirms the dispensation is sound rather than a silently
dropped branch: the contradiction hypothesis is `n ≥ (k+1)²+1`, and
`(k+1)²+1 > k+1` for every `k ≥ 0`, so the small-`n` regime is never entered;
where it would be entered the conclusion is true with no argument. The proved
statement is identical to the statement of record — no weakening. Equivalently:
the proof proves the contrapositive on the whole complement of the conclusion,
which is the complete obligation.

**7. Could the sharp constant be wrong by one?** Checked adversarially in both
directions. `q((k+1)²) = −k(k+1) < 0` for every `k ≥ 1`, so the quadratic route
cannot yield `n ≤ (k+1)² − 1`; and the method's inequality `A + (n−1)D ≤ B`
demonstrably fails at `n = (k+1)²` for `k = 1..200`. Conversely `q` is ≥ 2 from
`(k+1)²+1` onward. So `(k+1)²` is exactly the threshold this method yields —
neither over- nor under-stated — while the *truth* (`4, 8, 11, 15`) is smaller,
which is precisely why the "no tightness beyond `k = 1`" fence is required and
is honoured.

No item in this pass changes a "verified" verdict to anything else. Prover and
critic verdicts agree on every ledger row, each supported by independently
reproduced evidence.

## Scope and Fence Check

Checked against the sealed capsule: `SYNTHESIS.md` "Award group 2" (statement
of record and its excluded conclusions), `ADJUDICATION.md` E3 and "Lean
readiness", `RETURN.md` §4, and both T4 critiques. Capsule seal and all nine
member digests re-verified by this seat.

| fence | required | audited proof | verdict |
|---|---|---|---|
| tightness | no tightness claim beyond `k = 1`; the word "TIGHT" is struck | §5 states no tightness claim beyond `k = 1` and cites the true maxima `4, 8, 11, 15`. The string "TIGHT" occurs exactly once in the document, at `INFORMAL-PROOF.md` line 194, inside the disclaimer 'the word "TIGHT" is not used' — i.e. it is never predicated of the result. This seat grepped the whole file to confirm there is no second occurrence and no lower-case tightness assertion beyond the `k = 1` exemption | clean |
| linear ceiling | none | no linear ceiling asserted anywhere; the bound is quadratic and stated as such | clean |
| no-recovery | must not be, and must not imply, a no-recovery statement | clean, and demonstrably so: the theorem's contrapositive yields `Δ_k ≥ 0` for `n > (k+1)²`, which is the **opposite sign** from the no-recovery conclusion `Δ_r ≤ 0`. A no-recovery statement (`SEMANTIC-CONTRACT.md`: a recovery at rank `r` is `x(F) < r` and `Δ_r(F) > 0`) cannot be derived from it. `x(G)`, `firstDescent` and later ranks do not occur in the statement or anywhere in the proof | clean |
| Tier 1 | no transfer to `E993-R25-UNR-FOREST-WIDE` | Tier 1 asks for `Δ_r ≤ 0` given `|V| ≥ 2r+2` and `x(F) < r`; the theorem supplies `Δ_r ≥ 0` in the far range `n > (r+1)²` and nothing at all in the band `2r+2 ≤ n ≤ (r+1)²`. No transfer is possible, and none is claimed | clean |
| `K₁`-addition target `T-C4-04`, NR1, FOREST, TREE, TRANSFER, Erdős #993 | no transfer | §5 excludes each by name; the proof's dependency closure (§6) contains only Mathlib, the three G1 definitions, and two elementary re-derivations — no prior Lean award, no matching/cover machinery, no G1 tuple/guard machinery | clean |
| `x ≤ 4` closure not bundled | must not be bundled (undischarged Hunter dependency) | §5 excludes it explicitly and the dependency closure confirms non-use; label conflation noted as critic finding 5 | clean |
| attribution | `k²+3k` form to seat T4; sharp form critic-attributed jointly to C-T4-F and C-T4-U | §4 does exactly this, with loci, and adds that the Lean proof re-derives the quadratic rather than citing the critics' arithmetic — which this seat confirmed by reading the derivation (division-free, unlike the record's) | clean |
| hypotheses match the Lean declaration one-for-one | required | verified in the Intended Claim table above; `G` acyclic, `1 ≤ k`, `Δ_k < 0` correspond exactly, no extra and no missing hypothesis | clean |
| scope of quantification | "any forest, connected or not, including the empty forest", uniform in `k` and `G` | `IsAcyclic` requires neither connectedness nor nonemptiness; `k` is universally quantified with no horizon; the empty forest is in range and the conclusion is trivially true there | clean |
| registered-but-unformalised content | none permitted | the dependency closure (§6) is Mathlib + the three G1 definitions + two elementary re-derivations; this seat found no appeal to any unformalised registered claim | clean |

One observation that is **not** a fence violation but is worth the controller's
notice: §5's sentence "the `k²+3k` form is not registered as a separate
corollary lemma in this run" is accurate, and harmless, because the sharp form
implies it for every `k ≥ 1` (`(k+1)² ≤ k²+3k ⟺ 1 ≤ k`) — the adjudication's
"a fortiori" reading is sound.

## Verdict

**passed**

`INFORMAL-PROOF.md` is a correct and complete informal proof of the contract's
`informal_statement`. Every definition is the verbatim G1 definition; every
lemma and inference step in the ledger (44 rows: D1–D6, B1–B5, C1–C7, D7–D13,
E1–E5, F1–F5, G1–G5, H1–H4) is closed: 42 verified outright; H3 (the record's
true maxima) verified conclusively at `k = 1,2,3` and corroborated at `k = 4`;
and the single non-mathematical row H4 recorded as imprecise (critic finding
2). Every mathematical row carries evidence reproduced by this seat's own
exact-integer or exact-symbolic instrument. The
two ℕ-subtraction hazards (the fibre index `k−1` and the absorption identity)
are correctly guarded by `1 ≤ k`; the quadratic reduction, its three
evaluations and its monotonicity argument are exact; the constant `(k+1)²` is
exactly what the method yields, neither over- nor under-stated; the omission of
the record's `n ≥ k+1` case split is sound, not a dropped branch; the theorem's
hypothesis is satisfiable at every rank, so the result is not vacuous; and the
claim asserts nothing fenced. Independent exhaustive computation over all
3,269,194 unlabeled forests of order ≤ 20 (plus 93,867 general graphs for the
two graph-general steps) produced **zero** counterexamples to the theorem or to
any intermediate bound, and reproduced the record's true maxima `4, 8, 11`
conclusively and `15` to the limit of exhaustive reach.

Four imprecisions are recorded (critic findings 2, 3, 4, 5): "byte-for-byte"
overstates a re-registration that differs in namespace wrapping; "`n ≥ 2k+1`,
used below" is unused; §3.6's cancellation parenthetical describes a route the
proof does not take; and §5 conflates two record labels while excluding both.
None of them is a mathematical defect, none affects any step of the derivation,
and none changes a verdict. No defect has been softened into a pass; had any
step failed, this audit would say `failed` and name it.

This audit is informal proof-integrity only. It does not attest kernel
verification, axiom hygiene, or statement fidelity; those belong to the
`RECEIPTS/kernel-verification.json` gate and to the independent
statement-fidelity reviewer.
