---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c4-la1-formalizer-opus-20260929
critic_id: c4-la1-opus-informal-20260929
attestation_id: c4-la1-informal-pass-20260929
claim_sha256: 8fc5ef8d5624ab8bd49d1883e7d0c5ce52a36e6f8a7e634c4c4e5315d4f00290
---

# Informal Proof Integrity Audit

**Boot.** I am operating within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, as the brief's §0 authorizes. I loaded no memory, knowledge, logs, decisions, operations or
conversations subsystem file, and I wrote no conversation log: the brief allows one output path.

**Model disclosure (two-part).** Chartered: Claude Opus 5.5, effort high, on dispatch-record authority (brief header). Runtime-reported
model id, verbatim: `claude-opus-5-5`. I used no child agents.

**Seat.** Reviewer `c4-la1-opus-informal-20260929` (kind `independent-mathematical-proof-integrity-reviewer`). I am not the artifact
producer. I edited no contract, Lean source, informal proof or receipt. Every file I wrote is under
`scratchpad/c4-s7-informal-LA1/` of the run root.

**Input integrity.** I checked every digest myself with `shasum -a 256` or Python `hashlib`:

- Brief `control/C4-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md`: `957ca249…6b3`, MATCH.
- `THEOREM-CONTRACT.yaml` `6a950375…b410`, `INFORMAL-PROOF.md` `5db9c005…a140` and `LeanProject/LeanProof/Main.lean` `c1ef9d63…699b`: all
  MATCH.
- Capsule `control/c4-stage7-capsules/C4-LA1-PACKET-MANIFEST.json`:
  - The seal `7d7d7144…c813` recomputes as the SHA-256 of the compact key-sorted JSON of the manifest minus `seal_sha256`. MATCH.
  - All 659 members match on SHA-256.
  - The manifest file's own SHA-256 is `768128a3efbad27342bde449db9619b8a90644d911faec430f49b14e952d5113`.
- `SOURCE-DIGESTS.json` directories: I recomputed every listed file, with 0 missing and 0 mismatched.
  - `c1-results` 462, `c2-results` 1,559, `c3-results` 183, `c4-base` 12 and `c4-stage7-sources` 772.
  - Against `sources/SOURCE-DIGESTS.json`: the r30 C1-LA2 award files (42) and `first-interior/c2-primary-v2` (69).
- The frozen statements `control/C4-FROZEN-STATEMENTS.lean` are `0fc723d7…ede1`. MATCH.

## Intended Claim

This is the contract's `theorem.informal_statement`, the object of this audit. I recomputed its SHA-256 as
`" ".join(s.split())` over the string: `8fc5ef8d5624ab8bd49d1883e7d0c5ce52a36e6f8a7e634c4c4e5315d4f00290`, which equals the value
the brief records. Its mathematical content:

> For every natural `m` with `107 ≤ m` and `m % 3 = 2`, with `T = cbGraph m` (the literal CB(8,m) on `Fin (17m+3)`) and
> `p* = (16m+4)/3`, the following hold, with all definitions the carried definitions of record: `T` is a tree;
> `crossingIndex T + 2 ≤ p*`; `3p* < 2α(T) + 1`; and there is a saturating integral flow for `favorableLeaves T p*` at rank `p*`
> (`IsSaturatingFlow`).

The Lean terminal is `E993Transport.cb8_topRank_eligible_and_weightedHall`. It has exactly the hypotheses `(m : ℕ) (hm : 107 ≤ m)
(hres : m % 3 = 2)`, and its conclusion is the four-conjunct statement above, verbatim. I checked the correspondence one for one:

- the binder `m : ℕ`;
- `107 ≤ m` ↔ `hm`;
- `m % 3 = 2` ↔ `hres`;
- conjunct 1 ↔ `(cbGraph m).IsTree`;
- conjunct 2 ↔ `C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3`;
- conjunct 3 ↔ `3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1`;
- conjunct 4 ↔ `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`.

There is no extra hypothesis (no `hfav`) and no hidden weakening. The terminal statement text, from `theorem` up to but excluding
` :=`, has SHA-256 `c17cc9cf…4952`. It occurs verbatim in `SOLUTION-CONTRACT.md` §2 and equals the contract's
`lean_binding.expected_statement`. The reserved name appears in `Main.lean` exactly twice: once as the declaration and once in the
registrar's entry marker. There is exactly one `theorem` declaration line.

## Claim Ledger

Granularity is statement level. "Recomputed" means evidence of my own under `## Reproduced Mathematical Evidence`. "Carried" means a
governed award's formally verified fragment. I checked those byte for byte and against their receipts. I did not re-prove them, and I
checked their hypotheses where they enter.

### Definitions (checked literally against the Lean source)

| ID | Object | Lean (entry) | Check | Verdict |
|---|---|---|---|---|
| D1 | `indepFamily G j`: the independent `j`-subsets | 10 | Text read; byte-identical to r31 C1-LA2 0014 and to r30 C1-LA1 Snippet 0014. It differs from r30 C1-LA2's copy only in its docstring and in `open scoped Classical` versus `open Classical in` (the synthesis records compiled `rfl` equalities). | verified |
| D2 | `tagWitnesses G v = N(support v) \ {v}`; `activeWeight G F B = #{v ∈ F∩B : (B\{v}) ∩ W_v ≠ ∅}` | 11, 12 | As D1. The informal §2 and N1 glosses match the text. | verified |
| D3 | `favorableLeaves G p = leafSet.filter (i_(p+1)(G−v) − i_p(G−v) < 0)` | 13, 3, 1, 2 | As D1. This is the strict selector. | verified |
| D4 | `transportRel`: deletion `A = B.erase q`, or switch `A = insert u (B \ N(u))` with `u ∉ B` and `|N(u)∩B| = 2` | 14 | As D1. Matches the informal §2. | verified |
| D5 | `IsSaturatingFlow`: ℕ-valued `f`; support on `I_(p+1) × I_p ∩ transportRel`; rows `=` `w`; columns `≤` `w` | 15 | As D1. The informal "saturating integral flow" is exactly this. | verified |
| D6 | `WeightedHall` | 16 | As D1. | verified |
| D7 | `crossingIndex` = least `k` with `i_(k+1) − i_k < 0` | 17 | Byte-identical to first-interior `c2-primary-v2` entry 14, as the informal §2 says. | verified |
| D8 | `leafSet`, `support`, `IsGraphLeaf` | 6, 5, 4 | Byte-identical to r30 and first-interior. | verified |
| D9 | `cbEdge`/`cbGraph`/`cbVertex`: labels `r=0`, `s=1`, `v=2`, `u_i=3+17i`, `b_ij=u_i+1+2j`, `c_ij=u_i+2+2j` | 18, 19, 21 | Text read. The labels match the informal §2. I rebuilt the graph from this text (evaluator `graph.py`). | verified |
| D10 | C1-LA1 template: `cb8Bpb`, `cb8Bpc` (36 cells each), `cb8CGamma`, `cb8Pb`, `cb8Pc`, `cb8Theta = 288/L`, `cb8Sigma`, `cb8Out`, `cb8In`, `cb8R1` | 26–38 | I parsed the tables from the entry text (72 cells). The formulas match the informal §2. | verified |
| D11 | E1 layer: `cbOpenChokeCount`, `cb8R` (zero-extended coefficient), `cb8Rho = R(j)/R(j−1)`, `cb8N` (guarded type term), `cb8E1G`, `cb8H`, `cb8E1Val` (choke/`w=0`/`q=0` → 0; Boolean `G/N`; ternary `w·H/((j−α)·N)`), `cb8E1Arc` | 51–59 | Read literally, including the ℕ-truncations `8q−1`, `m−q` and `w−1`, the ℤ index `j = p−q`, and `x/0 = 0`. My evaluator reproduces these semantics exactly. | verified |
| D12 | `chokeBeta`, `chokeGamma`, `IsSectorSource` (independent, with `r, v ∈ B`), `chokeState` | 60–62, hosted in 649 | Text read. The informal §2 matches. | verified |
| D13 | Frozen `cb8GSec` | hosted in `cb8GSec_nonneg_and_support` | Byte-identical to the frozen file. Its semantics match the informal §2: `pb`/`pc` on leg deletions, `σ(γ)` on the `u_i`-switch at state `(1, γ≥1)`, 0 elsewhere. | verified |

### Nodes and inferences

| ID | Claim (INFORMAL-PROOF §) | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| N1.0 | `q(X) ≤ m` (§4 N1) | none | A filter of `range m`. Recomputed (m=1 exhaustive). | verified |
| N1.B1 | Deletion classes: `q + w + ℓ = |B|`, `w ≤ 8q`, `ℓ + 8q ≤ 8m+1` | `0<m`, `B` independent, `r∉B` | The argument is sound. An active tag with `r∉B` is a `c_ij` whose witness `u_i∈B`. A non-choke, non-active vertex occupies a distinct slot: an arm slot, or a leg slot of an absent choke. Exhaustive at m=1 over all 33,573 independent sets: 0 failures. Literal at m=107/110/161 through the E1 row identity. | verified |
| N1.B2 | Insertion classes: Boolean `8q − w`; ternary `16m+2−2ℓ'−16q` | `0<m`, `A` independent, `r∉A` | The slot argument is sound: two vertices per empty slot. Exhaustive at m=1: 0 failures. | verified |
| N1.B3 | Non-choke insertion keeps `q` and raises `w` by `[z active]` | `0<m`, `z∉A`, `z≠r`, `z` non-choke | Witnesses are `r` or chokes. Exhaustive at m=1 over the independent sets plus 3,000 arbitrary finsets: 0 failures. At m=0 the claim fails (`A={r}`, `z=v`: `w` goes 0→2 against the indicator 1), so `0<m` is load-bearing. | verified |
| N2.E | `Σ_{α≤a} cb8N = cb8R` at every integer index | none | Vandermonde expansion. Used implicitly in `e1alg.py` (`P0[a+1] = r(j)`). It lies outside the terminal cone, as §3 says. | verified |
| N2.1 | `cb8E1Arc ≥ 0` | `m+1 ≤ p ≤ 8m+1`; `q ≤ m` (companion) | A guard failure gives 0. Otherwise `G, H ≥ 0` (C3-LA1, which needs `α ≤ a` and `ΣT > 0`, that is `1 ≤ j ≤ 8m+1`), and `j−α ≥ 0`. Recomputed: `G_α ≥ 0` and `H_α ≥ 0` for every `q ∈ [1,m]` and `α ∈ [0,a]` at m = 107, 110, 158, 161, 164, 200, 302, 404, 500, with 0 negatives. Exhaustive at m=1 for every `p ∈ [2,9]`. | verified |
| N2.2 | Support: a nonzero value forces `B ∈ I_(p+1)`, `r∉B`, `A = B.erase x` | none | This is the definition's guard. Exhaustive at m=1. | verified |
| N2.3 | Row `= w(B)` on `r`-free sources | B1; C2-LA3 (`F = leafSet`) | `w·G/N + ℓ·w·H/(ℓN) = w`, since `G+H = N`. At `ℓ = 0` the ternary term is `0·(x/0)` and the row closes through `G_j = N(j,j)` (C3-LA1 `e1_saturation`), which I confirmed live at m=107 for `q ≥ 64`. Recomputed: every realizable `(q, α)` for sampled `q` at 9 class rows (16,745 rows; 0 failures); literal at m=107/110/161; exhaustive at m=1 for all `p`. | verified |
| N2.4 | Column `= ρ_q·w(A)` on `r`-free targets with `q ≥ 1`, including `w=0` | B2, B3, C2-LA3; `q ≤ m < p*` | Boolean count `8q−w`, source type `w`. Ternary count `2(b−ℓ')`, source type `w−1`, `ℓ_B = ℓ'+1`. Recomputed exactly for every weight `0..8q` at sampled `q` on 9 class rows (16,843 columns; 0 failures); literal at m=107/110/161 (every preimage enumerated); exhaustive at m=1 for all `p`. | verified |
| N2.5 | Zero columns when `r∈A` or `q=0` | none | A guard on `B`, or a choke/`q=0` branch. Literal and exhaustive as above. | verified |
| N3.0 | `cb8GSec ≥ 0` and support | class (C1-LA1 (i)) | `pb`, `pc`, `σ ≥ 0` recomputed at every class row 5..302 (fails only at m=2, which is off class). | verified |
| N3.1 | Deletions and `β_i=1` switches of a sector source are `transportRel` images in `I_p*` | none | Sound: `u_i` is adjacent to `r`, and `N(u_i)∩B = {r, b_ij}`. Exhaustive at m=1. Outside the terminal cone, as §3 says. | verified |
| N3.2 | Leg count `Σ(β_i+γ_i) + 2 = |B|` | `0<m`, sector source | `r, v ∈ B` excludes `s` and every `u_i`. Exhaustive at m=1; literal at the class rows. | verified |
| N3.3 | Out bridge: row of `g_sec` = `Σ_i cb8Out(state_i)` | `B ∈ I_(p*+1)`, sector | Distinct arcs have distinct targets, and at most one label fires per arc. Exhaustive at m=1; literal at m=107/110/161 (every image enumerated). | verified |
| N3.4 | Out `≥ 1` | class: leg total `p*−1 = K` exact | C1-LA1 (ii). Recomputed min `Σ Out = 1` exactly at every class row 2..302 and at m=500 (exact DP), matching the identity `(25m/2+5)K − 7m/2 = D`. The literal row is exactly 1 at DP-extremal sector sources at m=107. | verified |
| N4.1 | In bridge: column = `Σ_i cb8In(state_i)` | `A ∈ I_p*`, `r,v ∈ A` | The only nonzero preimages are leg insertions. Switch-at-`r` preimages are non-sector and carry 0. Exhaustive at m=1; literal at the class rows (every preimage enumerated, including all `C(m+1,2)` switch-at-`r` pairs). | verified |
| N4.2 | In `≤ 1` | `m%3=2` (leg total `K−1`) | C1-LA1 `cb8_sum_in`. Recomputed max `Σ In = 1` exactly at every class row 2..302 and at m=500; the literal column is exactly 1 at extremal targets. It does not depend on N3, which I confirmed textually. | verified |
| N4.3 | Zero classes | none | Exhaustive at m=1 (every class); literal at the class rows. | verified |
| N5.1 | Switch preimages of `A ∋ v` with one choke: exactly the `8−γ` sets `(A\{u_i}) ∪ {r, b_ij}` | none | The derivation is sound: `r ∉ A` forces a switch at `s` or at a choke; `s` is excluded by `v ∈ A`, so the switch is at `u_i`. Exhaustive at m=1 (set equality). | verified |
| N5.2 | Inflow `(8−γ)σ(γ)`; 0 when `q ≥ 2` or `q=1` without `v` | none | Exhaustive at m=1; literal at the class rows for each `γ ∈ 0..8`. At `γ=0` the literal column is 0 because the switch summand requires `γ ≥ 1`. The junk value `cb8CGamma 0 = 0` only makes the frozen right-hand side vanish (see the critic pass). | verified |
| N6 | `w(B) = [v,r∈B] + Σ_i [u_i∈B]·γ_i` | `0<m` | Exhaustive at m=1 over 33,573 independent sets plus 20,000 arbitrary finsets. Fails at m=0 (`B={r,v}`: `w = 2` versus 1), so `0<m` is load-bearing. | verified |
| N7.c | `ρ_1` (E1 syntax) `= cb8R1(K)/cb8R1(K−1)` | `m ≥ 1`; `K` exact | Recomputed by two independent computations (array convolution versus `cb8R1`'s literal sum) at m = 2, 5, 107, 110, 158, 161, 164, 302, 500, 1001: all equal. | verified |
| N7 | Bundle: `g = f + g_sec` is nonnegative, supported on `transportRel`, Out `≥ w`, In `≤ w` | N2–N6 conclusions; C1-LA1 (iv)(v); C2-LA3; `ρ_q < 1` | Case split checked for completeness. Out splits on `r∈B` (sub-cases `v∈B`/`v∉B`) or `r∉B`. In splits on `r∈A` (sub-cases `v∈A`/`v∉A`) or `r∉A` (sub-cases `q=0`, `q≥2`, `q=1` without `v`, and `q=1` with `v` for `γ ∈ {0}`, `1..7`, `{8}`). Each case is sound, using `r∈X` ⇒ no choke in `X`. `ρ_q < 1` holds for all `1 ≤ q ≤ m` at every class row 2..302 and at m=500. Switch-image load `ρ_1γ + (8−γ)σ(γ) ≤ γ` for `γ = 0..8` at every class row 5..302 and at m=500 (it fails only at m=2, off class). Minimum slack 4.2476e−3 (107) to 1.54e−3 (302); margins 34.90, 51.50, 52.48, 53.46 at 107/158/161/164. Literal composed flow at m=107 (210 sets), m=110 (63) and m=161 (42), with every image and preimage enumerated: 0 violations, 0 negative arcs, minimum slack exactly 0 at both ends. | verified |
| N8 | Bundle ⇒ `WeightedHall` ⇒ integral saturating flow | none (Part A); r30 C1-LA2 0030–0031 | The Part A chain is sound: support restricts the sum to `N(X)`, nonnegativity extends `X ⊆ I_(p+1)`, and the ℚ→ℕ cast is an order embedding. (HALL⇒FLOW) is carried, byte-identical to r30 C1-LA2 Snippets 0030/0031, receipt `verified`. | verified |
| S | Stitch: conjuncts 1–3 from C2-LA1 0547 (`AdjU.cb8_topRank_of_flow`) via C1-LA2 0078 | `hm`, `hres` | Carried and receipt-bound. Recomputed on the literal tree: tree; `α = 9m+1`; the closed form `(1+2X)G^m + X(1+X)(1+2X)^{8m}` equals the tree-DP independence polynomial; `3p* = 16m+4 < 18m+3`; `x + 2 ≤ p*`; every leaf `v`, `c_ij` favorable at `p*` (`leafSet = {v} ∪ {c_ij}`). Results at every class row 2..500 (167 rows) are in the evidence below. | verified |
| C5 | ℕ-subtraction and cast audit (§5) | — | Every row rechecked; see below. | verified |

**ℕ-subtraction and cast audit (rechecked).**

- The statement has one ℕ operation, the floor `(16m+4)/3`. It is exact on the class, and `3p* = 16m+4` holds there.
- In the frozen statements, each subtraction is exact where it is used:
  - `8q−1` is used under `1 ≤ q`.
  - `m − q` holds by the companion.
  - `p* − q` holds because `q ≤ m < m+1 ≤ p*`.
  - `m − 1` holds because `m ≥ 107`.
  - `p* − 1` and `K − 1` hold because `K ≥ 1`.
  - `8 − γ` is taken in ℚ, and `γ ≤ 8` by leg exclusivity.
  - B1 and B2 are written subtraction-free.
- In the E1 definitions, `8q−1`, `m−q` and `w−1` are computed unguarded, but they are used only on the branch where `q ≥ 1` and
  `w ≥ 1`.
- `(k−α).toNat` sits under the guard `α ≤ k`. `j − α` is an integer.
- Division by 0 occurs only where the guard gives `N = 0`, and the value is then 0.
- One minor omission, not a defect: the table does not list the carried `cb8R1`'s `8m−7` and `k−i`. Both are exact, since `m ≥ 1` and
  `i ≤ min(7,k)`. The companion needs `8m−7 = 8(m−1)+1`, which is exact for `m ≥ 1`.

**Dependencies.** On a textual reference graph over the 758 entries, the terminal's closure excludes `cb8N_sum_eq_cb8R` and
`cb8_sector_arcImages_mem_layer`, exactly as §3 says. `cb8GSec_in_le_one` does not reach `cb8_sector_legCount`. The only N1 input of
`crit_cb8E1Val_nonneg` is the companion `cbOpenChokeCount_le`. `crit_cb_tagWitness_root_or_choke` is not in the file. Nothing marked
"not a dependency" is a dependency.

## Reproduced Mathematical Evidence

The code is my own. It uses the standard library only, and no prior evaluator was imported. Every file is under
`scratchpad/c4-s7-informal-LA1/`, with explicit imports stated in each file header. No hashed output contains a wall-clock field.

| File | SHA-256 | Imports | Role |
|---|---|---|---|
| `split_main.py` | `5788ef9f95988d778439de7d235a3ffa23950501dd24e6d0b7ee293ca229c9ce` | re, json, hashlib | split `Main.lean` into its 758 entries (`entries.json`); marker digest = SHA-256(body) for all 758 |
| `show.py` | `0eb93430d48a2a8c4ab24eb86a3303975bbcfdd70ae1941632914741ce8ff543` | json, sys, re | print declaration statements (reading aid) |
| `bytecheck.py` | `16c6047bcfc0ee868a24a1f9edaea28930a39a6929f6fcc2a1672a6b64eae2ec` | json, hashlib, os, re, glob | directory digests; origin `Main.lean` vs receipts; Snippet vs managed block; carried/in-file classification |
| `bytecheck2.py` | `c730b7e5372c8d1a42b36119654454219f6e5a9af574b79a15edfa52e3a03e25` | json, hashlib, re, glob, os | re-verify every `CAPSULE-VERIFICATION.json` carry row against origin Snippets |
| `frozencheck.py` | `75d4cc838b1fd35127dcf64d27defb861adcbe93cf8877a92f846aa853643c5f` | re, hashlib | 21 frozen headers; terminal statement digest and SOLUTION-CONTRACT occurrence |
| `refgraph.py` | `0c7a45e98c459f133660e963308e61cc6f1c797469dbddf7cc811bf6e34d5e74` | json, re | textual reference graph / dependency closure |
| `tmpl.py` | `600a468735784e1011f06f994e5a6ad410c5544b4c372e7977140b10b18d3cfc` | fractions, re, json | C1-LA1 template, tables parsed from the Lean text |
| `classrows.py` | `9d44f546501b2d8e878f1b76d00cbb25a8b7929ad2f644b500c7ca33d1ba425e` | fractions, math, sys, json, tmpl | template (i)–(v) by exact DP, rho_q < 1, switch-image load |
| `graph.py` | `1222b283fe3f04661ac3cc6edb966449ff81b7799bd2371138117d91cb2580b9` | sys, json, math | literal `cbEdge` tree; tree-DP independence polynomials; x, alpha, favorability |
| `netlit.py` | `7e3fa8b26eff01b9a87b35f5db9abc0130419239c00a96269397cdf410fb1fe3` | fractions, math, functools, graph, tmpl | literal network, `cb8GSec`, E1 layer (Lean semantics) |
| `exhaust_m1.py` | `ab8320459ec2c42c0d68c187fa55b23988f4031cc4819ff18851ee4c484c08e3` | itertools, json, random, fractions, netlit, tmpl | exhaustive m = 1 |
| `literal_class.py` | `ff51062dbae456b80d9c3a5401d979a12cbc59aa61a3d96ae1c8c9f8b8ccb452` | random, json, sys, fractions, netlit, tmpl | literal composed flow at class rows (seeds 11, 12, 13) |
| `e1alg.py` | `91eb2c8fdf28bfcec7812cb7b3ba11daff65b3c584634491e71778dd1b2ebfd9` | math, fractions, json, sys | G, H >= 0; row/column value identities |
| `companion.py` | `b4694b962be8363aa61190807dc6f452d55f0ebf2568c8aab12d7678d749fe2a` | math, fractions, json, sys, classrows | rho_1 link |
| `offclass.py` | `546dc4cc6fa5935e6764b11fb135f31adb9eab0184472efc6c9dda61551f972e` | fractions, json, tmpl, classrows, netlit | off-hypothesis probes |

Outputs (SHA-256): `entries.json` `7c55a1c3…ab83`; `bytecheck-out.json` `c5acf1a7…466c`; `exhaust_m1.json` `8726e780…4d53`; `lit-107.json` `d6ad34d5…1980`; `lit-110.json` `2274247b…d35e`; `lit-161.json` `b77bcd88…58da0`; `classrows-2-302.jsonl` `1ed35cd2…6df7`; `classrows-500.jsonl` `9b964712…7c7d`; `e1alg-107.jsonl` `772f2a96…513a`; `e1alg.jsonl` `b5eafda6…757f`; `graph-2-500.jsonl` `64db5085…a0df`; `offclass.json` `243e3799…ec46`; `companion.json` `7402f3f4…3252`. A run of `classrows.py` at m = 1001 was stopped by literal PID after 28 minutes (the rho_q loop) and left no output; nothing is claimed at m = 1001 except the companion (ledger row N7.c).

**Results.**

1. **Byte and receipt checks** (`bytecheck.py`, `bytecheck2.py`, `frozencheck.py`).
   - Each of the 8 origin awards has a receipt with verdict `verified`, and its `Main.lean` SHA-256 equals the receipt's
     `source_sha256_before` and `source_sha256_after`:
     - r31 C1-LA1 `f0578ed7…`, C1-LA2 `a906ec17…`, C1-LA3 `c0605e12…`;
     - C2-LA1 `986b5257…`, C2-LA2 `e75c66b2…`, C2-LA3 `7dab4388…`;
     - C3-LA1 `1388fa52…`;
     - r30 C1-LA2 `7c279f4b…`.
   - Every origin Snippet equals its managed block, with 0 mismatches.
   - All 627 `CAPSULE-VERIFICATION.json` carry rows re-verified against the origin Snippets: 622 byte-identical and 5
     keyword-rekeyed. For each of the 5, the reverse substitution `lemma → theorem` reproduces the origin digest.
   - My own classification of the 758 entries gives 627 carried and 131 in-file.
   - All 21 frozen headers (`cb8GSec` whole, and 20 theorems from docstring to `:= by` with `theorem → lemma`) occur exactly once. No
     unrekeyed copy exists.
   - There are 0 `sorry`, `admit`, `native_decide`, `axiom` or `decide` tokens outside comments. The 442 `set_option` lines all sit
     in carried fragments; in-file text has 0.
2. **Exhaustive literal checks at m = 1** (`exhaust_m1.py` → `exhaust_m1.json`).
   - Scope: 33,573 independent sets, with `|I_6| = 8,484` and `|I_7| = 8,332`.
   - N6, B1, B2 and B3 fail 0 times. So do N3 (images, leg count, Out bridge), N4 (In bridge, zero classes) and N5 (preimage set
     equality, inflow).
   - E1 clauses (1)–(5) fail 0 times at every `p ∈ [2, 9]`.
   - Off class (m = 1 is not in the class), the construction fails, as expected:
     - 1,400 negative `g_sec` arcs, which reproduces the synthesis's figure;
     - the composed Out fails at 1,736 sources;
     - the composed In fails at 1,190 targets.
3. **Literal composed flow at class rows** (`literal_class.py` → `lit-107.json`, `lit-110.json`, `lit-161.json`).
   - Scope: 60 sources and 150 targets at m=107; 18 and 45 at m=110; 12 and 30 at m=161.
   - The sets cover:
     - DP-extremal (tight) and random sector sources;
     - tight and random in-sector targets;
     - `r`-free sources with `q ∈ {1, 2, random, …}`;
     - switch-image targets for every `γ ∈ 0..8`;
     - `r`-free targets with `q ∈ {1, 2, random}`;
     - sets containing `r`.
   - Every image and preimage was enumerated literally, with `g = cb8E1Arc + cb8GSec` evaluated from the Lean definitions.
   - 0 failures of Out `≥ w`, In `≤ w`, the E1 row/column identities, the Out/In bridges, the switch inflow and the zero columns.
   - Extremal sector row = 1 and in-sector column = 1 exactly. Minimum Out and In slack is exactly 0. There are 0 negative arcs.
4. **Class-row arithmetic** (`classrows.py` → `classrows-2-302.jsonl`, `classrows-500.jsonl`). These are exact
   integer and rational checks at every `m ≡ 2 (mod 3)` from 2 to 302, plus m = 500:
   - `(16m+4)/3` and `K = p*−1` are exact;
   - C1-LA1 (ii) min `Σ Out = 1` and (iii) max `Σ In = 1`, by exact DP over all 45-state assignments;
   - (iv) Switch;
   - (v) Residual;
   - `ρ_q < 1` for every `1 ≤ q ≤ m`;
   - the switch-image load.

   All of these hold at every row with `m ≥ 5`. Only m = 2 fails (i), (v) and the switch-image load.
5. **E1 algebra** (`e1alg.py` → `e1alg-107.jsonl`, `e1alg.jsonl`). At m = 107, 110, 158, 161, 164, 200, 302, 404 and 500:
   - `G_α ≥ 0` and `H_α ≥ 0` for every `q ∈ [1, m]` and `α ∈ [0, 8q−1]`, as exact integer cross-multiplications: 0 negatives;
   - the row and column value identities, exact over ℚ with `x/0 = 0`, for every realizable weight at 13 sampled `q` per row: 0
     failures.
6. **Graph layer** (`graph.py` → `graph-2-500.jsonl`). At every class row 2..500 (167 rows):
   - `cbGraph` is a tree;
   - `α = 9m+1`;
   - the tree-DP independence polynomial equals the carried closed form;
   - the low window holds;
   - `leafSet = {v} ∪ {c_ij}`;
   - both leaf types are favorable at `p*` (`c_00` stands for every `c_ij` by the tree's automorphisms).

   `x + 2 ≤ p*` holds for every class row from 86 on and fails for every class row up to 83. `p* − x = 2` at 107, and `x = 570` at 107,
   which matches the SEMANTIC-CONTRACT row `CB(8,107)/572`. The synthesis's `x = 842/857/873` at 158/161/164 also reproduce.
7. **Off-hypothesis failures** (`offclass.py` → `offclass.json`), exhibited where the record calls a hypothesis load-bearing or sharp.
   - **Residue.** At m = 108 (≡0), 109 (≡1), 111 and 112, with the floor rank and the literal sector leg totals `p*−1` and `p*−2`,
     both template ends fail:
     - min `Σ Out = 2340306/2341661 < 1` at 108;
     - max `Σ In = 4688727/4683322 > 1` at 108;
     - similarly at the other off-residue rows.

     By the N3/N4 bridges, which hold for any `m`, these are literal `g_sec` row and column sums, so `m ≡ 2 (mod 3)` is load-bearing
     for the sector half.
   - **Positivity of m.** At m = 0, N6 fails (`B = {r, v}`: `w = 2` against the formula's 1), and so does B3.
   - **Non-strictness.** The template extremes are exactly 1 at every class row, so the Out/In bounds cannot be strict. This matches
     the synthesis (iv) and R31-SR-C4-6.
   - **The threshold 107** is not claimed sharp anywhere in the record: SOLUTION-CONTRACT and SEMANTIC-CONTRACT treat it as the
     class boundary. My scans find every recomputed ingredient true at every class row from 86 on. That is consistent with 107 being
     a proof-method threshold (C2-LA1's `S_5 > 0`), and it is not asserted or needed here.

These computations are bounded evidence and test instruments only. None of them is evidence for the universal statement; that is the
kernel's role and the proof's.

## Independent Critic Pass

I re-read the unchanged ledger adversarially, looking for gaps a kernel check would not reveal in the informal text:

- **Completeness of N7's case split.** Every `B ∈ I_(p*+1)` and every `A ∈ I_p*` falls in exactly one case. The key fact is that `r ∈ X`
  forbids every choke in an independent `X`, so `q = 0` whenever `r ∈ X`. This settles the cases `r∈A`, `v∉A` (N6 gives `w = 0`, and
  zero-class (ii) gives `g_sec = 0`) and `r∉A`, `q=1`, `γ ∈ {0, 8}` (`σ = 0`, and `ρ_1 < 1`). No case needs `ρ_q ≥ 0`, because `w ≥ 0`
  and `ρ_q < 1` suffice.
- **Hidden use of the class in "any m" nodes.** N3.1–N3.3, N4.1, N4.3, N5 and N6 hold at m=1, which is off class, exhaustively, and the
  literal checks agree at the class rows. So these nodes do not secretly use the class. The class enters only in N2 (through
  `p* ≤ 8m+1` and C2-LA3), N3.0, N3.4, N4.2, `ρ_q < 1`, the companion's exactness, and the stitch.
- **Rank bookkeeping.** The sector leg totals are `|B| − 2 = p*−1 = K` for sources and `p*−2 = K−1` for targets. These are exactly the
  premises of C1-LA1 (ii)/(iii) on the class. Off the residue class they fail (evidence 7).
- **Division conventions.** `x/0 = 0` occurs only inside the in-file `cb8E1Val`, and it never reaches the terminal statement. The
  `ℓ = 0` rows are live on the class (m=107, q ≥ 64), and they close through `e1_saturation`, not the rows identity. My evaluator
  implements `x/0 = 0` literally and confirms the rows at `ℓ = 0`.
- **The `γ = 0` reading (N5).** The phrase "at `γ = 0` the value is 0 through `cb8Sigma`'s junk value" is accurate for the frozen
  right-hand side. The literal fact is stronger and independent of the junk value: each of the 8 preimages carries 0, because the
  `cb8GSec` switch summand requires `1 ≤ γ`. §4 N5's parenthetical gives the correct informal meaning. This is a precision note,
  consistent with R31-SR-C4-3 F-2, not a defect.
- **Labelling precision (non-mathematical).** §3 and the stitch paragraph cite "C2-LA1 579" and "C2-LA1 entry 580". Those are base-entry
  numbers. The C2-LA1 registrar entries are 0546 and 0547, as the brief and synthesis write them (`0547 … (base entry 580)`). The
  declarations named are the right ones.
- **Second-read range (non-mathematical).** §0 and §8 of `INFORMAL-PROOF.md` cite R31-SR-C4-1..5 (and 1..4 for the critic-derived
  lemmas), while the dispatch also names R31-SR-C4-6. SR-C4-6 concerns template zero-slack (a scope note on the C1-LA1 key), not the
  critic-derived lemmas, so the attribution statement is not affected. I read the verdicts of all six (each `confirmed` or `confirmed_with_repairs`)
  and the findings of SR-C4-1, -2, -3, -4 and -6. None of their repairs touches a statement or step of this proof.
- **Record discrepancy outside the audited proof (for the controller).** `FORMALIZER-REPORT.md` records the capsule manifest's file
  SHA-256 as `2a70da3a…2dea4`. The file's actual SHA-256 is `768128a3…5113`, which is the value `CAPSULE-VERIFICATION.json` records.
  The seal and every member match, so this is a transcription error in the report only.
- **Nothing softened.** No step needed a repair, and I repaired nothing. Every critic item above is either wording or record hygiene.
  None is a defect in any statement or inference of the proof of the intended claim.

The prover's ledger and this critic pass agree on every row, with independent evidence.

## Scope and Fence Check

I checked both the contract's scope text and `INFORMAL-PROOF.md` §7.

| Fence (brief §2 / synthesis) | On `INFORMAL-PROOF.md` | On the contract scope text | Asserted beyond it? |
|---|---|---|---|
| One rank `p*` per tree | §7 | yes | no |
| `d = 8` | §7 | yes | no |
| Class `m ≥ 107`, `m ≡ 2 (mod 3)` only | §1, §7 | yes | no |
| Selector derived (`favorableLeaves`, C2-LA3), never assumed | §1, §7 | yes | no (no `hfav`) |
| No (HALL) at another rank, `m < 107`, `m ≡ 0,1`, `d ≠ 8`, heterogeneous patterns or arbitrary trees | §7 | yes | no |
| Full (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN | §7 | yes | no |
| No LP optimality; no `θ*` law (`cb8Theta` is a definition only) | §7 | yes | no |
| No Newton or Darroch input | §7 | yes | no (E1 condition (i) through C1-LA3's formal descent; nonnegativity through C3-LA1) |
| `S(T_m, p*) ≤ 0` NOT claimed; would transfer no status | §7 | yes | no |
| No grade asserted for any companion or intermediate | §0 | yes (SOLUTION-CONTRACT §4) | no |

**Attribution.** I compared both faces with the synthesis's "NEW declarations and their attribution" and "Attribution on the face"
lists, item by item. Both faces carry every item:

- Codex GPT-6's lower-region run;
- r30, named seats;
- Codex's heterogeneous-closure run;
- r31 Cycles 1–3;
- the Cycle 4 frozen texts (controller staff, R31-N-23);
- N1–N8 with their seats and critics, the helper blocks, and U1's bridge;
- the stitch (U3; its conditional form C-U3-F/C-U3-T);
- the adjudicators T and U;
- the formalizer `c4-la1-formalizer-opus-20260929` (Claude Opus 5.5).

The canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch` is on both faces.

## Verdict

passed

`INFORMAL-PROOF.md` is a correct statement-level proof of the contract's intended claim. Its definitions match the Lean source
literally. The terminal's hypotheses match the claim one for one. Every node N1–N8 and the stitch is sound, with the carried inputs used
within their hypotheses. Every ℕ-subtraction and cast is exact where it is used. Every recomputed numeric claim reproduces, including
the two-sided template tightness, the switch-image slack and margins, and the CB(8,107)/572 row. The failures outside the stated
hypotheses behave as the record says. The fences and the attribution are on its face. The items in the critic pass are wording, labels
and record hygiene, not defects.

**Read-boundary disclosure.**

1. **Harness context.** Before my first tool call the host placed the project `CLAUDE.md`, the user auto-memory index and the user's
   e-mail into my context. I did not open them with a tool, and nothing here rests on them. I performed no conversation logging (one
   permitted output).
2. **Directory listings.** Two directory listings printed names outside my grant, and I read nothing in them:
   - `ls scratchpad/` printed other seats' scratch directory names;
   - `ls sources/` printed the names of `authority`, `concurrent` and other directories.
3. **Reads.** All within the grant:
   - the run's contract, informal proof, capsule record, formalizer report, `Main.lean`, and `EVIDENCE/` (`sorry-walk.log`,
     `axioms.txt`, `options-census.json`, `forbidden-token-scan.json`);
   - the capsule manifest and its members' digests;
   - the synthesis's Reconciliation, Exact established results and Lean awards sections;
   - the frozen statements, SOLUTION-CONTRACT and SEMANTIC-CONTRACT (by `grep`);
   - the origin awards' `Main.lean`, Snippets and receipts under `sources/c{1,2,3}-results/` and `sources/r30/lean/`;
   - r30 C1-LA1's Snippets, for the network-definition byte comparison;
   - `first-interior/c2-primary-v2`'s `Main.lean`;
   - all `SOURCE-DIGESTS.json` files;
   - the six second reads' verdict sections, plus the findings sections of SR-C4-1, -2, -3, -4 and -6.
4. **Not read.** I did not read the run's `DRAFTS/`, `RECEIPTS/` or `SOURCE/`. I did not read the adjudications, critiques or return
   texts, other award runs, manuscripts, the master ledger, the network, or Mathlib sources: no Mathlib lemma's meaning was in doubt.
   I did not build Lean.
5. **Processes.** I used no full process listing. My background jobs were polled by literal PID only (71416, 71477, 71983, 72045, 72984),
   and `pgrep -f` with a job-specific pattern located one of them. All ran to completion except 72984 (the m = 1001 row), which I
   stopped by that literal PID. I read the harness's own output files for my background commands; I wrote nothing outside my
   scratch directory.
