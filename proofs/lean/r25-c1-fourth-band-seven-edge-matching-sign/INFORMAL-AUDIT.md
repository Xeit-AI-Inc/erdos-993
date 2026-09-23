---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-sonnet-20260920
critic_id: c1-la1-fable-informal-20260920
attestation_id: c1-la1-informal-pass-20260920
claim_sha256: ac88403c52ccb8a33af4ed33be0af4f6b8e1c2a4948671d41cf5b38088ec2f6c
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** This seat is operating within VerityOS. Before
any substantive work it read `verity.md`, `identity/startup-protocol.md`, and
`skills/proof-integrity-audit/skill.md`, per the brief
`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` §0. Subsystems loaded beyond
those files: `experiments/` (this run root, confined to the brief's read
boundary). No other VerityOS subsystem was needed or loaded. Nothing outside the
read boundary was opened; in particular the sibling award run
`runs/lean-2026-09-20-c1-perfect-matching-uniform-sign/` was **not** read.

**Model disclosure.** Chartered seat: Claude Opus 5, chartered effort high. The
Agent transport that dispatched this seat exposes no effort parameter and **this
seat cannot self-inspect its own runtime model or effort**; this disclosure is
made on dispatch-record authority per the brief's explicit instruction, not on
introspection. Child delegation was forbidden by the brief and none was used.
This seat is the independent informal reviewer, not the artifact producer: no
contract, Lean source, informal proof, or receipt was edited, and no file
outside `scratchpad/c1-s7-informal-LA1/` was written. The single registrable
output is this file, `scratchpad/c1-s7-informal-LA1/INFORMAL-AUDIT.md`; the
evaluator sources and their raw outputs sit beside it as the replay envelope.

**Independence of evidence.** Every number below was recomputed by code written
from scratch for this audit under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/c1-s7-informal-LA1/`
(`poly.py` exact-rational univariate polynomial arithmetic, `cert_check.py`,
`small_rank.py` exact-rational simplex, `slack_check.py`, `families.py`,
`forests.py`, `delta.c`). No prior evaluator, script, or datum from any earlier
seat of this run was imported, and no computer-algebra package was used.

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml`'s
`theorem.informal_statement` (contract `c1-la1-d5-seven-matching-sign-v1`,
contract SHA-256 `2479fc1af6b2bf38659922b7a51cdef8f25779010382b9f2c6374bd38b85961b`,
recomputed here and matching):

> For every finite simple graph G on a vertex type of cardinality 2r+5 carrying
> seven pairwise disjoint edges, Delta_r(G) <= 0, for every r >= 1. Bare: no
> crossing hypothesis, no acyclicity, no forest hypothesis. Delta, coeff,
> indepCount are the SEMANTIC-CONTRACT.md Erdos993G1 definitions reused
> verbatim. hr : 1 <= r is retained for fidelity with the C3 analogue
> (fiveMatching_delta_nonpos, entry 164) though derivable from cardinality
> (M.card = 14 <= Nat.card X = 2r+5 forces 5 <= r by omega; r <= 4 is vacuous).

`claim_sha256` recomputed independently as the SHA-256 of that string with
whitespace collapsed by `" ".join(s.split())`:
`ac88403c52ccb8a33af4ed33be0af4f6b8e1c2a4948671d41cf5b38088ec2f6c` — **matches**
the value the brief pins and the value in this audit's front matter.

Digest gate, all recomputed by this seat:

| artifact | expected | recomputed | match |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `2479fc1a…5961b` | same | yes |
| `INFORMAL-PROOF.md` | `be5d93c2…44c44c` | same | yes |
| `LeanProject/LeanProof/Main.lean` | `c1061ca6…6b5dc` | same | yes |
| capsule seal `C1-LA1-PACKET-MANIFEST.json` | `be4b00b4…10af4` | same | yes |
| `SEMANTIC-CONTRACT.md` (capsule member) | `3bbeae07…6aab3` | same | yes |
| `cycles/cycle-1/stage6/SYNTHESIS.md` (capsule member) | `b7cc57b1…8bae3` | same | yes |
| frozen C3 source (`sources/g1/lean/g1-c3-third-wide/…/Main.lean`) | `aa517ebc…1ca4` | same | yes |
| `lean_binding.expected_statement_sha256` | `cc5575f4…64706` | same | yes |

The declaration in `LeanProject/LeanProof/Main.lean` (entry 27) is a `theorem`
named `Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos` whose binders
match the contract one-for-one: `{X : Type*} [Finite X] (G : SimpleGraph X)`,
`(r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5)`, `(f : Fin 7 × Bool → X)`,
`(hf : Function.Injective f)`,
`(he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true)))`, conclusion
`Erdos993G1.delta G (r : ℤ) ≤ 0`. Four quantifiers (`X, G, r, f`), five
hypotheses (`hyp-finite, hyp-rank-pos, hyp-card, hyp-matching-injective,
hyp-matching-adjacent`), one conclusion — all present, none extra, none missing.

## Claim Ledger

Statement-level ledger in the order of the C3 `fiveMatching_*` chain the proof
mirrors. "Evidence" names the method; "verdict" uses the skill's taxonomy.

| # | claim (INFORMAL-PROOF.md location / Lean entry) | evidence | verdict |
|---|---|---|---|
| L01 | `indepCount F k = (Nat.card {S // F.IsNIndepSet k S} : ℤ)` (§1 / entry 1) | literal diff against `SEMANTIC-CONTRACT.md` | verified, verbatim (`Type u`→`Type*` only) |
| L02 | `coeff F k = if 0 ≤ k then indepCount F k.toNat else 0` (§1 / entry 2) | literal diff | verified, verbatim; zero at negative `k` as the contract requires |
| L03 | `delta F k = coeff F (k+1) − coeff F k` (§1 / entry 3) | literal diff | verified, verbatim; `Δ_r = i_{r+1} − i_r` |
| L04 | `stratum G M k j = (G.indepSetFinset k).filter (λS, (S∩M).card = j)` (§1 / entry 4) | fragment diff against frozen C3 entry 13 | verified; differs only by `Type u`→`Type*` and the namespace spelling |
| L05 | `|image f| = 14` for injective `f : Fin 7 × Bool → X` (§3 / entry 16) | re-derivation: `card_image_of_injective`, `card (Fin 7 × Bool) = 14` | verified |
| L06 | forbidden set: for independent `S`, ∃ `Q ⊆ M`, `|Q| = 2|S∩M|`, each `x∈Q` in `S` or adjacent to `S` (§3 / entry 17) | re-derivation: `C = f⁻¹(S)`, `flip` involution, `C ∩ flip C = ∅` because `S` independent and `f p ~ f (flip p)`; `|Q| = |C| + |flip C| = 2|S∩M|` | verified |
| L07 | support `|S∩M| ≤ 7` (§3 / entry 18) | `2|S∩M| = |Q| ≤ |M| = 14` | verified |
| L08 | eight-stratum partition `indepCount G k = Σ_{j=0}^{7} |stratum(k,j)|` (§3 / entry 19) | `card_eq_sum_card_fiberwise` over `S ↦ |S∩M|` with L07 bounding the fiber index set to `{0,…,7}` | verified |
| L09 | outside incidence `(r+1−j)·b_j ≤ (r+j−9)·a_j` in ℕ with truncation (§3 / entry 20) | re-derivation of both fiber bounds; the constant is `(2r+5) − (14 + r − j) = r+j−9`, i.e. `2m−d = 9`; truncation handled because `omega` proves `2r+5 − |M∪B| = r+j−9` in ℕ including the degenerate `r+j<9` case where both sides collapse to `0` | verified |
| L10 | inside incidence `(j+1)·b_{j+1} ≤ 2(7−j)·a_j` (§3 / entries 21–22) | re-derivation: LHS from `|T∩M| = j+1` erasures; RHS from `|M∖Q| = 14 − 2j = 2(7−j)` admissible insertions, using L06 again | verified |
| L11 | ℕ→ℤ re-centring `(t+(10−j))·b_j ≤ (t+j)·a_j` at `r = t+9` (§3 / entry 23) | substitution check; for `j ≤ 7` both coefficients are untruncated and positive for every `t ≥ 0` | verified; correctly identified as not skippable |
| L12 | closed-form dual family `λ_0..λ_7, μ_0..μ_6`: `coef_b(j) = 1` for `j = 0..7`; `coef_a(j) = 1` for `j = 4..7`, `< 1` for `j = 0..3` (§4) | own exact-rational arithmetic in `t`, all sixteen identities as exact polynomial identities, not samples (`cert_check.py` §a) | verified |
| L13 | denominator clearing `L(t) = 210·(t+4)…(t+10)`; `A_j = λ_j L`, `B_k = μ_{k−1} L`, `E_j = (1−coef_a(j))L` are non-negative integer-coefficient polynomials of degree ≤ 7 (§4) | exact polynomial division with zero remainder; coefficient-wise non-negativity; each compared literal-for-literal with the polynomials hard-coded in Lean entry 24 | verified (`L`, all 8 `A_j`, `B_4..B_7`, all 4 `E_j` match the Lean literals exactly; `B_1 = B_2 = B_3 = 0` independently confirmed) |
| L14 | the certificate identity: weighted outside + inside inequalities plus slack yield `Σb_j ≤ Σa_j` (§4 display; Lean entry 24 `Heq1`/`Heq2`) | symbolic expansion over `ℤ[t]` in all 16 free variables (`cert_check.py` §c), plus per-variable witnesses | **verified for the Lean form; the §4 display is false as written** — see Finding 1 |
| L15 | slack hypotheses: the lemma carries `ha0..ha3 : 0 ≤ a_j`, not the brief's single `ha7` (§4) | exact identities (L12) plus the call-site check in Lean entry 25 | verified, and **ruled on** below |
| L16 | `r ≥ 9` assembly `_ge9` (Lean entry 25) | reconstructed: `delta = i_{r+1} − i_r`, partition at `r` and `r+1`, `o0..o7`, `i1..i7`, `clear_value`, certificate, `sub_nonpos` | verified |
| L17 | small ranks `r = 5,6,7,8` closed by `omega` from the truncated system plus emptiness facts (§5 / Lean entry 26) | own exact-rational simplex: max(`Σb − Σa`) = 0 over the cone at each of `r = 5,6,7,8` (`small_rank.py`); every emptiness fact re-derived from its stated criterion | verified |
| L18 | `r ≤ 4` vacuous by cardinality (§5 / Lean entry 27) | `14 = |M| ≤ |X| = 2r+5 ⟹ r ≥ 5`; `hr : 1 ≤ r` is not needed for this and is genuinely redundant | verified |
| L19 | thin combining theorem (`by_cases 9 ≤ r`) (Lean entry 27) | read and checked; three lines, no new mathematics | verified |
| L20 | `stratum G M 6 7 = ∅` at `r = 5` is *needed* beyond the card-generic emptiness lemma (§5) | exact LP with the fact removed still gives max = 0 | **over-claim**: the fact is true but not needed — see Finding 3 |
| L21 | "Byte identity is preserved for `fiveMatching_stratum_empty` (C3 entry 158)" (§1) | byte diff against the frozen C3 fragment | **false as stated** (one token, `Type u`→`Type*`); semantically inert — see Finding 4 |
| L22 | "`A_0 = A_7` was an unexpected but confirmed coincidence" (§4) | exact comparison: `A_0 ≠ A_7`, `A_3 = A_7` | **typo**; the same sentence states the true fact `λ_3 = λ_7 = 1/(r−2)` — see Finding 4 |
| L23 | infeasibility of a single-`a_7`-slack certificate: "requires `λ_7 < 0` for small `t`" (§4) | solved the square saturating system exactly: `λ_7 = −9773/32256 < 0` at `r = 9`, `< 0` through `r = 15`, `≥ 0` only from about `r = 20` | verified |
| L24 | scope exclusions 1–9 (§6) | compared clause-by-clause with `SYNTHESIS.md` "Every excluded conclusion" | verified with two omissions of registration duties — see Finding 5 |

Dependencies: L14 depends on L12–L13; L16 on L08–L11 and L14–L15; L17 on
L08–L10 and the emptiness criteria; L19 on L16–L18. No claim is closed on prose
agreement alone.

## Reproduced Mathematical Evidence

### (a) The certificate as an exact polynomial identity

Working in `t` with `r = t+9`, the family of §4 was re-derived and every
identity checked as an exact polynomial identity in `t` (not at sample points):

* `coef_b(j) = λ_j(r+1−j) + j·μ_{j−1} = 1` for **all** `j = 0..7` — eight exact
  identities.
* `coef_a(j) = λ_j(r+j−9) + 2(7−j)·μ_j = 1` for `j = 4,5,6,7`; `< 1` strictly for
  `j = 0,1,2,3`.
* `L(t) = 210·(t+4)(t+5)(t+6)(t+7)(t+8)(t+9)(t+10) = 127008000 + 139154400t +
  64250760t² + 16217040t³ + 2418150t⁴ + 213150t⁵ + 10290t⁶ + 210t⁷`, identical to
  the Lean literal.
* Every `A_j = λ_j L` (`j = 0..7`), `B_k = μ_{k−1} L` (`k = 1..7`, with
  `B_1 = B_2 = B_3 = 0`), `E_j = (1−coef_a(j))L` (`j = 0..3`) is an
  integer-coefficient polynomial of degree 6 with **all coefficients
  non-negative**, hence `≥ 0` for every `t ≥ 0`; `L(0) = 127008000 > 0`, hence
  `L > 0` for every `t ≥ 0`. Each of the seventeen polynomials Lean entry 24
  hard-codes (`L`, `A_0..A_7`, `B_4..B_7`, `E_0..E_3`) matches my cleared
  multiplier coefficient for coefficient; `B_1 = B_2 = B_3 = 0` are absent from
  the Lean because `μ_0 = μ_1 = μ_2 = 0`, which I verified independently.

The two `ring` identities of Lean entry 24 were then expanded symbolically over
`ℤ[t]` in the sixteen free variables `a_0..a_7, b_0..b_7`; both reduce to zero
identically. The per-variable witnesses are:

* coefficient of `b_j`: `L = A_j·(t+10−j)` for `j = 0,1,2,3` and
  `L = A_j·(t+10−j) + j·B_j` for `j = 4,5,6,7` — eight exact identities;
* coefficient of `a_j`: `L = A_j·(t+j) + E_j` for `j = 0,1,2`;
  `L = A_3·(t+3) + 8B_4 + E_3`; `L = A_4·(t+4) + 6B_5`;
  `L = A_5·(t+5) + 4B_6`; `L = A_6·(t+6) + 2B_7`; `L = A_7·(t+7)` — eight exact
  identities.

Hence, with all multipliers non-negative on `t ≥ 0`, the weighted sum of the
eight outside and the four used inside inequalities plus `Σ_{j≤3} E_j a_j ≥ 0`
gives `L·Σb_j ≤ L·Σa_j` and therefore `Σ b_j ≤ Σ a_j`. A 20 000-point
integer replay at random `t ∈ [0,60]` and random `a_j` with `b_j` pushed to the
integer maximum permitted by the constraints produced zero violations.

As an external cross-check that the family I re-derived is the family of record,
the two numeric instances published in
`cycles/cycle-1/stage4/critics/U4/F/CRITIQUE.md` reproduce exactly: at `r = 50`,
`coef_a = (41/51, 21/25, 43/49, 5903/6300, 1, 1, 1, 1)`; at `r = 8`,
`coef_a = (−1/9, 0, 1/7, 13/35, 1, 1, 1, 1)`; `coef_b ≡ 1` at both. The only
binding sign condition is `μ_3 ≥ 0 ⟺ 9r ≥ 66 ⟺ r ≥ 8`, as §4 states; the run
uses the family only on `r ≥ 9`, strictly inside that range.

### (b) The small-rank duals `r = 5,6,7,8`

Each small-rank system was modelled exactly as the Lean branch supplies it
(ℕ-truncated outside coefficients `max(r+1−j,0)`, `max(r+j−9,0)`; the seven
inside inequalities; the branch's emptiness facts; non-negativity) and the LP
`max(Σb − Σa)` was solved with an exact-rational simplex written for this audit:

| r | order `2r+5` | emptiness facts the branch uses | re-derived | exact LP optimum |
|---|---|---|---|---|
| 5 | 15 | `a_0,a_1,a_2,a_3` (card: `15+j < 19`), `b_7` (`j > k`) | all | 0 |
| 6 | 17 | `a_0,a_1,a_2`; `b_0,b_1,b_2,b_3` | all | 0 |
| 7 | 19 | `a_0,a_1`; `b_0,b_1,b_2` | all | 0 |
| 8 | 21 | `a_0`; `b_0,b_1` | all | 0 |

Optimum `0` (attained only at the origin direction) means the system entails
`Σb ≤ Σa` over the rational cone, hence over ℕ; `omega`, being complete for
linear integer arithmetic, is a sound substitute for a hand-built dual here, as
§5 asserts. The untruncated system at `r = 9` (`t = 0`) also has optimum `0`,
confirming the certificate branch is not vacuous at its first rank.

### (c) `Δ_r` on actual graphs of order `2r+5`

`Δ_r(G) = i_{r+1}(G) − i_r(G)` computed exactly (independence polynomial by
branching with an isolated-vertex collapse in C, and by closed form / rooted-tree
DP in Python with arbitrary-precision integers; the two methods agree on every
family both can reach).

| family | range | graphs | result |
|---|---|---|---|
| comparator `7K₂ ∪ (2r−9)K₁`, `I(z) = (1+2z)⁷(1+z)^{2r−9}` | `r = 5..30` | 26 | `Δ_r < 0` at every rank, **no equality**; e.g. `−112, −376, −1252, −4214, −14381, …, −11082305707783184` |
| registered six-edge fence `6K₂ ∪ (2r−7)K₁` | `r = 5..30` | 26 | `Δ_r > 0` at **every** rank (`68, 164, 431, 1204, 3520, …`) — the checker is not vacuous, and seven is the threshold |
| every graph from `7K₂ ∪ K₁` (`r = 5`, `n = 15`) by adding ≤ 2 edges, exhaustively | `r = 5` | 4 852 | 0 violations, max `Δ_5 = −112` |
| structured supergraphs (clique on the `K₁` part; clique on one endpoint per edge; `P₁₄`; `C₁₄`; complete join; two-endpoint cliques; stars; `K_n`; …) | `r = 5,6,7` | 36 | 0 violations; equality (`Δ_r = 0`) occurs, e.g. on `K_n` and on the two-endpoint-clique family at `r = 5,6` |
| random supergraphs of `7K₂ ∪ (2r−9)K₁`, six density classes `p ∈ {.02,.05,.10,.25,.5,.8}`, three seeds | `r = 5,6,7` | 900 000 | 0 violations; max `Δ_r = 0` |
| random sparse supergraphs (exactly `k ≤ 10` added edges), two seeds | `r = 5,6,7` | 600 000 | 0 violations; max `Δ_r` equals the comparator value `−112 / −376 / −1252` |
| random supergraphs in the certificate branch | `r = 9,10,11,12` | 280 000 | 0 violations |
| **every unlabelled forest** of order 15 with `ν ≥ 7` (census regenerated here; 20 514 forests of order 15 total, matching the known count) | `r = 5` | 2 397 (1 361 trees) | 0 violations, max `Δ_5 = −112` |
| **every unlabelled forest** of order 17 with `ν ≥ 7` (census regenerated here; 122 963 forests of order 17 total, matching the known count) | `r = 6` | 49 671 (24 919 trees) | 0 violations, max `Δ_6 = −376` |

Total: **1 837 008 graphs, zero counterexamples.** The tree census was
regenerated from scratch (leaf addition + AHU canonical form) and self-checked
against the known counts `1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320,
48629` for `n = 1..17`; the matching routine was cross-checked against brute
force on every tree with `n ≤ 9`.

### (d) The slack-column question — **RULING**

The brief (and `SYNTHESIS.md` row 8, and `ADJUDICATION.md` "Lean readiness"
item 8) state that the certificate's slack column lives on `a_7`, "the analogue
of C3's `E·a_5` term". `INFORMAL-PROOF.md` §4 reports the opposite and encodes
four slack hypotheses `ha0, ha1, ha2, ha3 : 0 ≤ a_j`. I rule as follows.

1. **The informal proof is right and the brief/synthesis/adjudication are
   wrong.** For the family they all quote verbatim, `coef_a(7) = λ_7·(r−2) = 1`
   *exactly* — verified as a polynomial identity in `t`, and visible in exact
   arithmetic at every rank sampled:

   | r | `coef_a(0..7)` |
   |---|---|
   | 9 | `0, 1/9, 1/4, 24/49, 1, 1, 1, 1` |
   | 10 | `1/11, 1/5, 1/3, 199/350, 1, 1, 1, 1` |
   | 20 | `11/21, 3/5, 13/19, 1301/1575, 1, 1, 1, 1` |
   | 50 | `41/51, 21/25, 43/49, 5903/6300, 1, 1, 1, 1` |
   | 1000 | `991/1001, 124/125, 331/333, 17325893/17377675, 1, 1, 1, 1` |

   with `coef_b(j) = 1` throughout. The slack sits at `j = 0,1,2,3`; the top
   stratum `j = 7` is saturated. These values were produced twice, by two
   independently written routines (exact polynomial arithmetic in `t`, and
   direct rational arithmetic in `r`), and the `r = 50` row reproduces the
   published value in `cycles/cycle-1/stage4/critics/U4/F/CRITIQUE.md` digit for
   digit, as does that critique's `r = 8` row
   (`−1/9, 0, 1/7, 13/35, 1, 1, 1, 1`).
2. **This is a restoration, not an innovation.** The originating source of the
   family, `cycles/cycle-1/stage4/critics/U4/F/CRITIQUE.md`, already states
   "`coef_b(j) = 1` for every `j = 0..7` and `coef_a(j) = 1` for `j = 4..7`,
   `< 1` for `j = 0..3`". The `a_7` description was introduced downstream by the
   U adjudication and copied into the synthesis and the formalizer brief. The
   run's deviation returns the artifact to its source of record.
3. **The `a_7`-only alternative is genuinely infeasible**, as §4 claims. Imposing
   `coef_b(j) = 1` for `j = 0..7` and `coef_a(j) = 1` for `j = 0..6` determines
   the multipliers uniquely; solving exactly gives `λ_7 = −9773/32256 < 0` at
   `r = 9`, `−2861/16896` at `r = 10`, `−141/1408` at `r = 11`, still negative at
   `r = 15`, turning non-negative only around `r = 20`. A negative multiplier is
   not admissible, so no such certificate covers the `r ≥ 9` branch.
4. **Nothing is weakened.** The four extra hypotheses are *hypotheses of an
   internal, non-contractual auxiliary lemma*, and at the single call site
   (Lean entry 25, `sevenMatching_delta_nonpos_ge9`) they are discharged by
   `positivity` on `((a_j : ℕ) : ℤ)` — i.e. by pure cardinality non-negativity of
   `(stratum G M (t+9) j).card`, a fact available unconditionally for every
   finite graph. They impose no side condition on the terminal theorem, add no
   hypothesis to it, and narrow nothing. Adding hypotheses to an auxiliary lemma
   weakens *that lemma*; since the call site discharges them for free, the
   composite statement proved is unchanged. **Ruling: the deviation is correct,
   correctly disclosed, and weakens nothing.**

For completeness: `I1, I2, I3` are declared hypotheses of the certificate lemma
that its proof never uses (their dual weights `μ_0 = μ_1 = μ_2` are exactly
zero). This is the source of the three `unusedVariables` linter warnings the
formalizer reports. Unused hypotheses strengthen the lemma's antecedent and can
only make it harder to apply; the call site supplies them anyway. Harmless.

## Independent Critic Pass

A second pass was run over the ledger above, adversarially, before closing. It
produced five findings. None changes the truth of the claim; findings 1 and 4
are accuracy defects in `INFORMAL-PROOF.md` that a corrected reissue should fix.

**Finding 1 (accuracy defect, display; the only one I would call a defect
rather than a slip).** The first of the two displayed identities in §4 is
**false as written**:

```
L·(Σb_j) + Σ_{j=0}^{3} E_j·a_j  =  Σ_{j=0}^{7} A_j·(outside LHS)_j + Σ_{k=4}^{7} B_k·(inside LHS)_k
```

The `Σ E_j·a_j` block appears on the left only. Since
`L·Σb_j = Σ A_j·(outside LHS)_j + Σ B_k·(inside LHS)_k` holds exactly (I verified
this as the eight `b`-coefficient identities in §(a)), the displayed equation
asserts `Σ_{j≤3} E_j a_j = 0`, which is false. The second displayed identity is
**true** exactly as printed. The Lean encoding is correct: entry 24's `Heq1`
carries `(E0*a0+E1*a1+E2*a2+E3*a3)` on *both* sides, where it cancels, and
`Heq2` matches the printed second line. The sentence immediately following the
display ("Combined with the (hypothesis-supplied) outside/inside inequalities
weighted by the non-negative `A_j, B_k`, and `E_j·a_j ≥ 0`, this gives
`L·(Σb_j) ≤ L·(Σa_j)`") describes the correct deduction. The defect is confined
to the transcription of one display; the corrected identity is the one the Lean
proves and the one I verified. I record it as requiring correction, and note
that even read literally it does not reverse the argument's direction (chaining
the two printed lines yields `L·Σb ≤ L·Σa − 2ΣE_j a_j ≤ L·Σa`). It is therefore
non-load-bearing for the claim, and it is the reason this audit says "verified
for the Lean form" rather than "verified" at ledger row L14.

**Finding 2 (unrecorded correction of the source material, mathematically in the
run's favour).** `SYNTHESIS.md` row 8 and `ADJUDICATION.md` item 8 both name the
clearing constant as `105·(r+1)r(r−1)(r−2)(r−3)(r−4)(r−5)`. That constant does
**not** clear the family over ℤ: `μ_3` has denominator `70(r−2)(r−5)` and
`105/70 = 3/2`, so `μ_3·L_{105}` has half-integer coefficients. The run silently
uses `210·(t+4)…(t+10)`, which does clear every denominator — I verified both
claims by exact division. The run's value is correct and the synthesis's is not;
but unlike the `ha7` question, this correction of the source material is **not
recorded as a deviation** in `INFORMAL-PROOF.md` or `FORMALIZER-REPORT.md`. The
controller should register it alongside the slack-column deviation so the
synthesis's row 8 is not carried forward as-is into Cycle 2.

**Finding 3 (over-claim of necessity, conservative).** §5 states that `r = 5`
"needs one additional structural fact beyond the `M.card`-generic emptiness
lemma: `stratum G M 6 7 = ∅`". The fact is true (an independent `6`-set cannot
meet `M` in `7` vertices, since `S ∩ M ⊆ S`) and its four-line Lean proof is
correct. But it is not *needed*: with **all** emptiness facts removed from the
`r = 5` system, the exact LP optimum of `Σb − Σa` is still `0` — the ℕ-truncated
outside coefficients `(r+j−9)⁺ = 0` for `j ≤ 4` already force `b_0..b_4 = 0`, and
`b_7 ≤ (2/7)a_6` from the inside inequality suffices. The same holds at
`r = 6,7,8`: none of the branch's emptiness facts is logically required. The
claim of necessity is unsupported; the practice (supplying true extra facts to
`omega`) is harmless and, if anything, makes the branch more robust.

**Finding 4 (two prose inaccuracies, non-load-bearing).**
(i) §1: "Byte identity is preserved for `fiveMatching_stratum_empty` (C3 entry
158)". A byte diff against the frozen C3 source shows exactly one differing
token, `{X : Type u}` → `{X : Type*}`, and the registered fragment hashes differ
accordingly (`a570fff4…` here vs `0b411787…` in C3). The two elaborate to the
same universe-polymorphic statement, and §1 itself explains the `Type*`
substitution three sentences earlier, so the claim is self-inconsistent rather
than materially wrong.
(ii) §4: "`A_0 = A_7` was an unexpected but confirmed coincidence: `λ_3 = λ_7 =
1/(r−2)` literally". `A_0 ≠ A_7`; the true coincidence, which the same sentence's
own justification names, is `A_3 = A_7` (and the Lean literals for `A3` and `A7`
are indeed identical). A typo.
(iii) Minor, same class: §2 displays the theorem as `lemma … {X : Type u}` while
the registered declaration is `theorem … {X : Type*}`. Semantically identical;
inconsistent with §1's own explanation.

**Finding 5 (completeness of the fence restatement).** §6 restates the
synthesis's nine exclusions faithfully, with two omissions, both of registration
duties rather than mathematical content: (a) exclusion 7 in the synthesis also
records that the CONDITIONAL `E993-G1-MATCHING-COMPARATOR-SUFFICIENT` is **not**
refuted, that this contract is a *strengthening* of it, and that "the
claim-identity separation is recorded and must appear at registration"; §6's
item 7 keeps only the first half. (b) exclusion 4 in the synthesis adds that the
diagnostic band's counterexample class is confined to `ν = τ = 6` by S12, "a
separate informal result… **not** part of this award"; §6's item 4 omits that
sentence. Separately, `THEOREM-CONTRACT.yaml` has no field carrying the nine
exclusions, although `SYNTHESIS.md` directs that "Stage 7 must state each
exclusion in the frozen theorem contract"; in practice the contract binds
`INFORMAL-PROOF.md` (which carries them in §6) by SHA-256 as
`source-informal-proof`, so the exclusion set *is* cryptographically bound to the
contract. I flag both for the controller's registration step; neither is a
defect in the mathematics.

**Things the critic pass checked and found sound.** The "only place `d = 5` and
`m = 7` enter, jointly and only through `2m − d = 9`" claim is accurate under its
"jointly" qualifier (`m = 7` alone also enters L07, L08 and the `2(7−j)`
coefficient of L10; `d = 5` enters only through `n = 2r+5` in L09, and the two
meet only in `2r+5 − 14`). The re-centring at `t = r−9` is genuinely load-bearing
and present. The ℕ-truncation in L09 is handled soundly in the degenerate regime
`r+j < 9`, where both sides collapse to `0` consistently. `hr : 1 ≤ r` is unused
(the vacuity argument derives `5 ≤ r` from cardinality alone) and its retention
costs nothing, since `r = 0` is vacuous for the same reason. No first-descent,
forest, residual, crossing, tree, acyclicity or G1-tuple notion appears anywhere
in the Lean source (textual scan: zero occurrences of `firstDescent`, `residual`,
`IsTree`, `IsAcyclic`, `ambientA`, `ambientH`, `closedNeighborhood`, `crossing`,
`forest`). The `clear_value` step before the certificate call removes the
sixteen locals' definitional link to `stratum` and is a performance device with
no mathematical content. Splitting the assembly into `_ge9`, `_small` and a thin
combining theorem moves a declaration boundary only.

## Scope and Fence Check

* **Band.** The claim is fixed-band `d = 5` (`Nat.card X = 2r+5`) and is named as
  such in the contract title, the informal statement and §6 item 3. No
  `(m,d)`-uniform schema statement is made; `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`
  is untouched.
* **Bare.** No crossing hypothesis, no acyclicity, no forest hypothesis appears
  in the declaration or anywhere in its dependency chain. Confirmed by reading
  all 27 registered fragments and by textual scan.
* **Conclusion.** Non-strict sign at rank `r` only (`delta G (r:ℤ) ≤ 0`). No
  strictness, no statement at other ranks, no statement about `x(G)` or
  `firstDescent`, no log-concavity, TRS2 or real-rootedness claim.
* **No sharpness claim.** The `m = 6` fence
  (`E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`, REFUTED) is referenced in §6
  item 6 only as a registered refutation this theorem sits above and confirms.
  My own computation reproduces it (`Δ_r > 0` on `6K₂ ∪ (2r−7)K₁` for
  `r = 5..30`), but that fact is **not** part of the award and is recorded here
  only as the non-vacuity check the brief requested.
* **No transfer.** Nothing in the claim or its proof touches `x(G)`, forests,
  residuals, G1 tuples or guards, Tier 1 (`E993-R25-UNR-FOREST-WIDE`), Tier 2
  (`E993-G1WIDE-NO-SIZE-CAP`), the diagnostic band
  `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` (crossing-conditioned and **not**
  closed by this theorem), `E993-TGT-FOREST`, `E993-TGT-TREE`,
  `E993-TRANSFER-TO-FOREST`, `E993-EXISTS-COUNTEREXAMPLE`, `E993-BETA-AGG`, or
  Erdős #993. The forest/tree censuses in §(c) above are *evidence for* the
  general-graph claim at two orders; they assert nothing about any forest
  target, and no forest status is implied by them.
* **Hypotheses match the Lean one-for-one**, as tabulated under "Intended Claim":
  `hr : 1 ≤ r` retained, `Nat.card X = 2r+5`, injective `f : Fin 7 × Bool → X`,
  adjacency of the seven pairs. Nothing in the Lean statement is absent from the
  contract and nothing in the contract is absent from the Lean statement.
* **Definitions are the literal semantic-contract ones**: `indepCount` as
  `Nat.card {S // F.IsNIndepSet k S}`, `coeff` zero at negative `k`,
  `delta F k = coeff (k+1) − coeff k`, `stratum` as in the frozen C3 `FirstWide`
  scaffolding. No definition is shadowed, re-parameterised, or weakened.
* **Grade.** §6 item 9 keeps `novelty_claimed: false` and grades the artifact
  `compiled-candidate` at this stage. This audit closes only the informal
  proof-integrity gate; it makes no kernel, fidelity, or `formally_verified`
  claim, and it is not an award close.

## Verdict

**passed**

The informal proof in `INFORMAL-PROOF.md`
(SHA-256 `be5d93c2c05b9515a2caa078a58b74c80ba472fdbf480b23b63e1fc9de44c44c`)
establishes exactly the contract's `theorem.informal_statement`
(claim SHA-256 `ac88403c52ccb8a33af4ed33be0af4f6b8e1c2a4948671d41cf5b38088ec2f6c`),
with no unsupported step, no gap in the argument, and no overreach beyond the
fenced scope — the single display defect of Finding 1 excepted, and it is
excepted only because the identity it misprints was verified here in the
corrected form the Lean encodes and the adjoining prose asserts.
Every mathematical step in the chain — endpoints count, forbidden set, support
bound, eight-stratum partition, outside incidence with the constant `2m−d = 9`
and its ℕ truncation, inside incidence, the ℕ→ℤ re-centring, the closed-form
dual and its cleared integer certificate, the `r ≥ 9` assembly, the four
small-rank systems, the cardinality vacuity of `r ≤ 4`, and the combining
theorem — was recomputed independently here and is correct. On the slack-column
question the run is right and the brief, the synthesis and the U adjudication are
wrong; the four extra hypotheses `ha0..ha3` are discharged at the call site by
cardinality non-negativity alone, so nothing is weakened.

Five findings are recorded above. Four are prose or registration matters. One,
Finding 1, is a genuine accuracy defect: the first displayed identity in §4
carries the `Σ E_j·a_j` block on one side only and is therefore false as
printed. It does not defeat the proof — the Lean encodes the correct identity,
the adjoining prose states the correct deduction, I verified the corrected
identity exactly, and even the literal reading preserves the direction of the
inequality — but it is a defect in the artifact, not a matter of taste, and a
corrected reissue of `INFORMAL-PROOF.md` should fix it (together with
Finding 4's two typos) and should record Finding 2's clearing-constant
correction as a second disclosed deviation. Because reissuing changes the file's
SHA-256, `THEOREM-CONTRACT.yaml`'s `source-informal-proof` hash would have to be
reissued with it; that is a controller decision, not this seat's.

Attestation `c1-la1-informal-pass-20260920` by reviewer
`c1-la1-fable-informal-20260920` over producer
`c1-la1-formalizer-sonnet-20260920`.
