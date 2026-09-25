---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la4-formalizer-opus-20260925
critic_id: c1-la4-fable-informal-20260925
attestation_id: c1-la4-informal-pass-20260925
claim_sha256: 853d49ddf77c7fd4fbb151875a5c1d826913b1c96637967e0ab3c10b000f2000
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** I am operating within VerityOS. This session booted it before
any substantive work, per `CLAUDE.md` and `identity/startup-protocol.md`. Loaded, and nothing else:
`verity.md` (the constitution); `identity/startup-protocol.md` (the boot sequence); subsystem
`skills/`: `skills/proof-integrity-audit/skill.md` (the governing authority for this seat).
Loading discipline was applied: `writing/`, `logs/`, `operations/`, `memory/`, `knowledge/`,
`decisions/`, `projects/` and `conversations/` were NOT loaded, none being required by a governed
independent proof-integrity seat. Authority order observed: Ashton > `verity.md` > decision
records > the brief. Nothing durable was promoted; no run artifact was edited; everything this
seat wrote lies under `scratchpad/c1-s7-informal-LA4/`.

**Model disclosure.** The brief charters this seat as Claude Opus 5 at high reasoning effort, on
dispatch-record authority. **This seat cannot self-inspect its runtime model or effort setting**;
it states the charter, not an observation. Child delegation was forbidden and none occurred: every
read, recomputation and check recorded below was performed by this seat directly.

**Read boundary honoured.** Only the paths the brief §1 grants plus the two the §4 controller
addendum requires (`runs/lean-2026-09-25-c1-la1-forest-degree-extension/VERIFICATION-REPORT.md`,
and `runs/lean-2026-09-25-c1-la3-degree-lemma-implication-chain/LeanProject/LeanProof/Main.lean`
for the cross-round byte comparison the addendum directs), plus
`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean` under the pinned shared project for the meaning
of two acyclicity lemmas. `sources/external/lean-source/` was never opened. No `find` above the
run root, no network, no installs, no `lake` invocation of any kind, no background job.

---

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml` → `theorem.informal_statement`:

> Let G be a finite forest and x(G) the least k with Delta_k(G) < 0. (LB) For every natural k,
> Delta_k(G) < 0 implies n <= 4k. (R5) If n >= 21 then Delta_5(G) >= 0. (XR) For every natural r,
> x(G) < r implies n <= 4r - 4. Here n = Nat.card X and Delta_k is the G1 definition of record.
> The terminal declaration of this award is (XR); (LB) and (R5) are the other two award faces,
> registered as lemmas in the same project. All three are unconditional: the degree lemma (DL) is
> supplied by the carried, kernel-verified Erdos993G1.forest_degree_lemma of award C1-LA1, so no
> DlHyp hypothesis appears on any face.

`claim_sha256` recomputed independently by this seat as
`sha256(" ".join(informal_statement.split()))`:

```
853d49ddf77c7fd4fbb151875a5c1d826913b1c96637967e0ab3c10b000f2000
```

This **equals** the value the brief pins. (The statement carries no runs of whitespace, so the
collapse is the identity on it; both the raw and the collapsed string hash to the same value.)

Artifact digests recomputed and matched against the brief and the run's own records:

| artifact | recomputed SHA-256 | expected |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `a5d964540c9cc3aa05deb276256eacd28ab893612ce99abe9e50ea12ad2fbee8` | matches brief §1 |
| `INFORMAL-PROOF.md` | `526f85e839f0b653cfecae2022747954b6072ab9e62b62e7e48a066dd1b2cfb2` | matches brief §1 |
| `LeanProject/LeanProof/Main.lean` | `dcecb681d019a29c625dcea1a2385de920fffa6b8f185e79372f31ae547c1936` | matches brief §1 |
| packet-manifest `seal_sha256`, recomputed as sha256 of compact key-sorted JSON minus the seal field | `08d725c8bf93eda2ac791e2eaf1878849bc1f3a1ba7e246510d214e5bf9d2327` | matches brief §1 |
| `C1-LA1` `Main.lean` (carried copy) | `b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a` | matches brief R7 |
| `C1-LA3` `Main.lean` (pinned copy) | `cae9396136d9609bc3d086140e7c0e135ad0bf127fab48d22b58b850411f3a30` | matches brief R7 |
| frozen r25 award `Main.lean` | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | matches brief R1 |
| `C1-LA1` `VERIFICATION-REPORT.md` | `28bc7d1aa053679075c9f5563ddfcf431fcfb3a91a1b3a8d9dfab3b0e9cc38a6` | matches brief §4; `status: formally_verified` |
| `C1-LA3` `Main.lean` (current) | `23d9a1633c9d8f849be992f5f2f1cbe9b270092109903e98e51c903591017851` | matches brief §4 |

**Statement fidelity of the three faces.** Each of the three §2 statements of
`SOLUTION-CONTRACT.md` occurs in `Main.lean` **character-for-character**, the only difference being
the declaration keyword that the synthesis and brief §2 mandate (`lemma` for the two non-terminal
faces, `theorem` for the terminal one). Same for the block quoted in `INFORMAL-PROOF.md` §0. The
contract's `lean_binding.expected_statement` is the exact namespace-relative source text from
`theorem` up to but excluding ` :=` (verified by substring match, with the next six source
characters being ` :=\n  `), and its declared
`expected_statement_sha256 = 443de70788bc0250ae0bc52d1d4d9614b58858744c1e0a754a6363685f7e9d92`
is reproduced.

---

## Claim Ledger

Granularity: one row per definition, per statement, per inference step, per cast. Verdicts are
this seat's, on recomputed evidence. `=` means byte-identical carry verified by recomputing the
registrar entry digest from the bytes of the cited source; all 71 of this run's registrar entry
digests were recomputed from `Main.lean` itself and all 71 reproduce the declared values.

### A. Definitions of record

| # | object | Lean text checked against | verdict |
|---|---|---|---|
| D1 | `indepCount F k = (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)` | r25 entry 1 `5484fc21…`, `C1-LA1` entry 1, `C1-LA3` entry 1 — all three digests identical | verified `=` |
| D2 | `coeff F k = if 0 ≤ k then indepCount F k.toNat else 0` | r25 entry 2 `21190043…` | verified `=` |
| D3 | `delta F k = coeff F (k+1) - coeff F k` | r25 entry 3 `bdb46014…` | verified `=` |
| D4 | `closedNbhdFinset G J = J ∪ J.biUnion (G.neighborFinset ·)` | `C1-LA1` entry 4 `dec12eac…` | verified `=` |
| D5 | `extensionFinset G J = Finset.univ \ closedNbhdFinset G J` | `C1-LA1` entry 5 `a9075626…` | verified `=` |
| D6 | `e G J = (extensionFinset G J).card` | `C1-LA1` entry 6 `9e7ac487…` | verified `=`; composes to the `INFORMAL-PROOF` §1 table's `e(J) = (univ \ (J ∪ J.biUnion …)).card` |
| D7 | `indepDegreeSum G k = ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v` | `C1-LA1` entry 7 `a1ed32eb…` | verified `=` |
| D8 | `firstDescent G = Nat.find (exists_delta_neg G)` under `classical` | `C1-LA3` entry 9 `1597ea21…` (shares the registrar entry with `XrHyp`) | verified `=` |
| D9–D13 | `DlHyp`, `ExHyp`, `LbHyp`, `R5Hyp`, `XrHyp` | `C1-LA3` entries 5–9: `63dcbc2d…`, `00446097…`, `088244b7…`, `ffe90940…`, `1597ea21…` | verified `=` |

`INFORMAL-PROOF.md` §1's claim "No G1 definition is re-stated anywhere in this project" is
verified: `indepCount`/`coeff`/`delta` each occur exactly once as a `def`, and the six declarations
shared with the frozen r25 source (entries 1, 2, 3, 22, 61, 62 here) reproduce r25's entry digests
1, 2, 3, 4, 5, 6 exactly — recomputed, zero drift.

`C1-LA3`'s own definition layer (its entry 4) bundles `closedNbhdFinset`, `extensionFinset`, `e`,
`indepDegreeSum`; this seat diffed those four declaration bodies against `C1-LA1` entries 4–7 and
they are **identical text** (docstrings included). So the `DlHyp`/`ExHyp` propositions carried from
`C1-LA3` denote in this project exactly what they denoted in `C1-LA3`. This is load-bearing and is
confirmed.

### B. Carried statements and their provenance

| # | statement | origin | verdict |
|---|---|---|---|
| B1 | entries 1–16 | `C1-LA1` entries 1–16 | 16/16 digests reproduce — `=` |
| B2 | entries 22–59 | `C1-LA1` entries 17–54 | 38/38 digests reproduce — `=` |
| B3 | entry 60 `forest_extension_inequality` | `C1-LA1` entry 55 `9a2d591f…` → carried `ce29cda6…` | **keyword-only re-derivation, verified by diff**: the unified diff of the two bodies is exactly one line, `theorem` → `lemma`; every other byte identical. R10 admits this explicitly |
| B4 | entries 17–21 | `C1-LA3` entries 5–9 | 5/5 digests reproduce — `=` |
| B5 | entries 61–62 `coeff_nat`, `delta_nat` | `C1-LA3` entries 11–12 **and** r25 entries 5–6 | both origin digests reproduce — `=` |
| B6 | entry 63 (`pos_indepCount_of_delta_neg`, `delta_firstDescent_neg`, `firstDescent_spec`) | `C1-LA3` entry 14 at the R7-pinned digest `03c82b20…` | `=` against the pinned copy; drift handled below |
| B7 | entries 65–67 (`critic_lb_of_ex`/`lb_of_ex`, `critic_r5_of_lb`/`r5_of_lb`, `critic_xr_of_lb`/`xr_of_lb`) | `C1-LA3` entries 16–18 | 3/3 digests reproduce — `=` |
| B8 | entries 64, 68, 69, 70, 71 | authored in-run | correctly declared as authored; no origin claimed |

Total: 55 of `C1-LA1`'s 55 entries are present (54 byte-identical, 1 keyword-only), as the §4
addendum directs; all 11 `C1-LA3` entries the run carries are byte-identical to the pinned copy.
Every origin claim in `CAPSULE-VERIFICATION.json` → `entry_table` was re-checked against the three
carried source files; **no false byte-identity claim and no false re-derivation claim** was found.

**Sibling-run drift (§4 addendum).** This seat parsed `C1-LA3`'s current `Main.lean`
(`23d9a163…`) and the pinned copy (`cae93961…`) entry by entry. Exactly one of the 19 entries has a
different digest — entry 14 (`03c82b20…` → `418beecf…`) — and with `/-- … -/` and `-- …` comments
stripped the two entry bodies are **identical**. The unified diff confirms it: only two docstrings
changed, adding provenance prose about carry-list row 6; the three Lean declarations, their
binders, statements and proof scripts are byte-for-byte unchanged. Every one of the 11 fragments
`C1-LA4` carries is therefore byte-identical to the pinned round-0 copy and, comment-stripped,
byte-identical to the current copy. `INFORMAL-PROOF.md` §7's drift record and its citation rule
("cite the copy actually read, by digest `cae93961…`") are accurate.

### C. Inference steps

| # | step (`INFORMAL-PROOF.md` §) | checked how | verdict |
|---|---|---|---|
| C1 | §1: `exists_delta_neg` holds for every finite graph — `i_0 > 0`, `i_{n+1} = 0`, and a monotone chain otherwise | read the Lean proof line by line: `hcoeff`, `hdelta` (`coeff (j:ℤ) = i_j`, no truncation since `0 ≤ (j:ℤ)`), `hzero` from `Finset.card_le_univ`, `hpos` from `Nat.card_pos` on the nonempty finite subtype witnessed by `∅`, then `by_contra` + induction + `omega` | sound |
| C2 | §1: `Nat.find` is proof-irrelevant in the existence proof, so `firstDescent` is a well-defined least descent | the project registers exactly one `firstDescent`, and `XrHyp`, `firstDescent_spec` and the face all use it; the claim is internally coherent and nothing downstream depends on cross-run identity | sound (and not load-bearing here) |
| C3 | §4.1: `delta_nat` gives `Δ_k = i_{k+1} − i_k`, hence `i_{k+1} < i_k` | `delta_nat` is `coeff_nat` applied twice; `coeff_nat` is `simp [coeff]` at `0 ≤ (k:ℤ)`; `hlt` follows by `omega` from `hd` and `hneg` | verified |
| C4 | §4.2: `i_{k+1} ≥ 0`, so `Δ_k < 0` forces `i_k > 0` — "the step that makes the cancellation legitimate" | `pos_indepCount_of_delta_neg`: `hge0` is a cast cardinality via `indepCount_eq_card_indepSetFinset`, then `omega` | verified; the dependency on this step is stated correctly |
| C5 | §4.3: `(k+1)·i_{k+1} ≤ (k+1)(i_k − 1)` | `mul_le_mul_of_nonneg_left` with `0 ≤ (k:ℤ)+1` by `positivity` | verified |
| C6 | §4.4: (EX) then `n·i_k ≤ (k+1)(i_k−1) + 3k·i_k < (4k+1)·i_k`, "the slack is exactly the `−(k+1) < 0` term" | recomputed by hand: `(k+1)(i_k−1) + 3k·i_k = (4k+1)i_k − (k+1)`, and `k+1 > 0` | verified; the stated slack is exactly right |
| C7 | §4.5: cancel the positive `i_k` to get `n < 4k+1`, i.e. `n ≤ 4k` | `lt_of_mul_lt_mul_right` (needs `0 ≤ i_k`, supplied by `le_of_lt hpos`), then `omega`, then `exact_mod_cast` | verified |
| C8 | §4: "`k = 0` is included: `Δ_0 < 0` means `i_1 < i_0 = 1`, so `i_1 = 0`, which forces `n = 0`" | recomputed: `i_0 = 1` for every graph (only `∅`), `i_1 = n`; exhaustive replay over all 638 forests of order ≤ 10 finds `Δ_0 < 0` at order 0 only | verified |
| C9 | §5 (R5): contrapositive of (LB) at `k = 5`, the only technical content being the `(5:ℤ)` / `((5:ℕ):ℤ)` bridge | read `critic_r5_of_lb`: `by_contra`, `push_neg`, `exact_mod_cast`, `hLB G hG 5`, `omega` | verified |
| C10 | §5 (XR): `Δ_x < 0` by the spec, so `n ≤ 4x`; `x < r` gives `x ≤ r−1`, hence `n ≤ 4(r−1) = 4r−4` | read `critic_xr_of_lb`: `firstDescent_spec`, `hLB`, one `omega` | verified |
| C11 | §5: "(XR) uses only the SPEC of `firstDescent`, never its minimality" | confirmed from the proof body; and the observation is not a weakness — since `firstDescent` is the *least* descent, `firstDescent G < r` is the weakest such hypothesis, so stating (XR) at the minimum is the *strongest* form | verified, and the honesty of the remark is noted |
| C12 | §8: `dl_holds`, `ex_holds`, `lb_holds`, `r5_holds`, `xr_holds` — the composition | the five bodies in `Main.lean` are exactly the five lines quoted in §8 (modulo the `by intro …; exact …` rendering the report also quotes); `LbHyp`/`R5Hyp`/`XrHyp` are unfolded by application at the faces | verified |
| C13 | §8: "`dl_holds` … is not consumed downstream" | grepped the whole source: `dl_holds` occurs only at its own declaration; the contract lists `def-dlhyp` as a graph node with **no edge to `conclusion`** | verified — nothing marked NOT a dependency is a dependency |
| C14 | contract: `def-r5hyp` is NOT a dependency of the terminal statement | `R5Hyp`/`r5_holds` are used only by `forest_rank5_ceiling_20`; the (XR) chain is `xr_holds ← xr_of_lb ← lb_holds ← lb_of_ex ← ex_holds ← forest_extension_inequality` | verified |
| C15 | §2: acyclicity enters **exactly once, through (DL)**, and "nothing in §3–§5 uses acyclicity again" | traced every `hG` occurrence in the source: downstream of `forest_degree_lemma`, `hG` is only *transported* (into `forest_extension_inequality`, then into `ex_holds`, then as the `G.IsAcyclic` argument of the `Prop` abbreviations); no acyclicity lemma is applied anywhere in §3–§5 | verified |
| C16 | §2 (sub-clause): "the rooting API uses acyclicity only at `Erdos993G1.rootPath_unique` … from which `par_or`, `rk_par_lt`, `par_par_ne` and the swap-map injection follow" | **imprecise** — see Finding 1 | see Finding 1 |

### D. ℕ/ℤ cast and truncation audit

Every row of `INFORMAL-PROOF.md` §6 was re-derived from the Lean text.

| # | place | direction | this seat's check | verdict |
|---|---|---|---|---|
| E1 | `i_k : ℤ` as `(Nat.card … : ℤ)` | ℕ → ℤ | injective cast, `i_k ≥ 0` always; and, decisively, `indepCount` is defined through `Nat.card`, not `Fintype.card`, so it is **instance-independent** — without this the `[Finite X]`/`[Fintype X]` crossing in C7 would not be sound | verified |
| E2 | `indepCount_eq_card_indepSetFinset` | ℤ = ↑ℕ | source: `simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype, SimpleGraph.indepSetFinset]`; binders `[Fintype V] [DecidableEq V] [DecidableRel F.Adj]` exactly as §6 states | verified |
| E3 | `coeff_nat`, `delta_nat` | ℕ index → ℤ index | `0 ≤ (k:ℤ)` selects the `then` branch and `((k:ℤ)).toNat = k`; **no truncation** | verified |
| E4 | `Nat.card X = Fintype.card X` under `Fintype.ofFinite` | ℕ = ℕ | `hcard` is introduced by `Nat.card_eq_fintype_card` and used once, left-to-right, in the `calc`'s first step | verified |
| E5 | `(n : ℤ) ≤ 4*(k:ℤ)` → `Nat.card X ≤ 4*k` | ℤ → ℕ | both sides are casts of naturals; `exact_mod_cast`; no truncation | verified |
| E6 | `delta G 5` vs `delta G ((5:ℕ):ℤ)` | literal bridge | `((5:ℕ):ℤ) = (5:ℤ)`; `exact_mod_cast` | verified |
| E7 | **`4 * r - 4` on the face** | **ℕ truncated subtraction** | see below | verified, and honestly described |

**The one truncated subtraction.** `INFORMAL-PROOF.md` §6 claims it is honest, not clamped. This
seat recomputed the three supporting facts:

- `4 * r - 4 = 4 * (r - 1)` in ℕ for every `r` in `1..5000`: **0 violations**.
- `hx : firstDescent G < r` forces `1 ≤ r`, so the only reachable instances are the ones where
  truncated and ordinary subtraction agree. The proved content is `n ≤ 4·firstDescent G ≤ 4(r−1)`.
- At `r = 0` truncated `4*0 − 4 = 0`, but `firstDescent G < 0` is unsatisfiable in ℕ, so that
  instance is **vacuous-hypothesis-sound**, not arithmetic. No inequality anywhere is weakened or
  strengthened by truncation. The Lean discharge is a single `omega`, which is complete for linear
  ℕ arithmetic with truncated subtraction, so both branches are machine-decided.

This matches brief R8 exactly: the bound is obtained through `4*(r−1)` for `r ≥ 1` and the `r = 0`
vacuity, **never by clamping a false inequality**.

### E. Formal hygiene cross-checks (recomputed, not taken from prose)

| check | result |
|---|---|
| forbidden tokens `sorry` / `admit` / `native_decide` / `axiom` / `decide` in `Main.lean` | **none** |
| `EVIDENCE/axioms.txt` terminal line | `'Erdos993G1.forest_descent_restriction' depends on axioms: [propext, Classical.choice, Quot.sound]` |
| `EVIDENCE/axioms-all-declarations.txt` | 81 declarations, 81 distinct names, **0** outside `{propext, Classical.choice, Quot.sound}` |
| registrar entry kinds | 21 definitions + 49 lemmas + 1 terminal theorem = 71 — matches the report |
| contract shape | 22 definitions, 4 domains, 3 hypotheses, 30 graph nodes, 53 edges, 76 source materials — matches the report exactly |
| contract `source_materials` digests | **76/76** recomputed and matched against the files on disk |
| kernel receipt `RECEIPTS/kernel-verification.json` | verdict `verified`; all eleven checks `passed`; `source_immutable` passed |
| every artifact digest in `FORMALIZER-REPORT.md` §10 that this seat may read | 12/12 spot-recomputed, all byte counts and SHA-256 match |
| capsule seal | recomputed to `08d725c8…`, matches the declared `seal_sha256` |

---

## Reproduced Mathematical Evidence

Instrument: `scratchpad/c1-s7-informal-LA4/replay.py`
(SHA-256 `fdf1821cd06df0581ba4a3b7b1e8e599148f2cf99699d42c2c35555afe00983d`), written from scratch by
this seat. Standard library only; explicit import list `itertools`, `random`, `sys`,
`fractions.Fraction`; exact integer arithmetic throughout; no wall-clock field is written. No prior
evaluator was imported or consulted. Output:
`scratchpad/c1-s7-informal-LA4/replay-output.txt`
(SHA-256 `a14a7cb00b0e97b99439bd2d307df914597713f29a30bce7d0b3add4678c803f`).

**Method.** Forests are generated exhaustively up to isomorphism by leaf/isolated-vertex addition
(complete, because every non-empty forest has a vertex of degree ≤ 1 whose deletion leaves a
forest), with an exact canonical form: AHU encoding of each component rooted at its centre(s),
components sorted. `i_k` is computed **two independent ways** — by brute-force enumeration of all
`2^n` vertex subsets against the definition of record (`# of independent k-subsets`), and by an
independent-polynomial tree DP — and the two agree on every forest of order ≤ 10. Acyclicity is
verified independently as `|E| = n − c`.

**Census check on the generator.** Forests up to isomorphism by order 0..10:
1, 1, 2, 3, 6, 10, 20, 37, 76, 153, 329 — 638 in total. This is the known sequence, which is
independent evidence that the enumeration is complete and duplicate-free.

**Results (all assertions passed).**

| statement | instances tested | failures |
|---|---|---|
| (DL) `D_k ≤ 2k·i_k` | 6 380 (all 638 forests of order ≤ 10, every `k`) | 0 |
| (EX) `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k` | 6 380 | 0 |
| (LB) `Δ_k < 0 ⇒ n ≤ 4k` | 2 450 descent instances over all 638 forests of order ≤ 10 | 0 |
| (XR) `firstDescent G < r ⇒ n ≤ 4r − 4` | 3 190 | 0 |
| (LB)/(XR)/`firstDescent` existence | a further 3 348 forests of orders 11–60 (random forests, paths, stars, perfect matchings, brooms) | 0 |
| (R5) `n ≥ 21 ⇒ Δ_5 ≥ 0` | 2 640 forests of order ≥ 21 (the regime the statement actually speaks about, unreachable by exhaustive enumeration) | 0 |

**(LB) equality `n = 4k` attained** (the §4-addendum row): at `k = 1` by exactly **2** forests of
order **4** — the star `K_{1,3}` and the path `P_4`; at `k = 2` by exactly **1** forest of order
**8** — the path `P_8` (edge list `(0,1),(0,2),(1,3),(2,4),(3,5),(4,6),(5,7)`, which is
`7–5–3–1–0–2–4–6`). At `k = 0` the equality `n = 0` is attained by the empty forest. No forest of
order 5 has `Δ_1 < 0` and none of order 9 has `Δ_2 < 0`, so `4k` is not beaten at `k = 1, 2`.
This is exactly the tightness the synthesis permits ("no tightness claim for `4k` beyond
`k = 1, 2`") and the run correctly registers **none** of it.

**The `x < r ⇒ n ≤ 4r − 4` row** (§4 addendum), by order, over all forests of order ≤ 10:

| n | range of `x(G)` | `4·min x` | `4r − 4` at `r = min x + 1` | holds |
|---|---|---|---|---|
| 0 | 0..0 | 0 | 0 | yes |
| 1 | 1..1 | 4 | 4 | yes |
| 2 | 1..1 | 4 | 4 | yes |
| 3 | 1..2 | 4 | 4 | yes |
| 4 | 1..2 | 4 | 4 | yes |
| 5 | 2..3 | 8 | 8 | yes |
| 6 | 2..3 | 8 | 8 | yes |
| 7 | 2..4 | 8 | 8 | yes |
| 8 | 2..4 | 8 | 8 | yes |
| 9 | 3..5 | 12 | 12 | yes |
| 10 | 3..5 | 12 | 12 | yes |

**Failure outside the stated hypotheses** (the brief's "exhibit the failure where the record says
the hypothesis is load-bearing"). Acyclicity is not removable from any of the three faces:

- `K_5` (not acyclic): `i = (1, 5, 0, 0, 0, 0)`, so `Δ_1 = −5 < 0` while `n = 5 > 4·1 = 4`.
  **(LB) fails.** The same graph breaks both carried inputs: `D_1 = 20 > 2·1·i_1 = 10` (**(DL)
  fails**) and `n·i_1 = 25 > 2·i_2 + 3·i_1 = 15` (**(EX) fails**).
- The disjoint union of three `K_4` and three `K_3` (order 21, not acyclic):
  `i = (1, 21, 183, 847, 2196, 3024, 1728)`, so `Δ_5 = 1728 − 3024 = −1296 < 0` with `n = 21 ≥ 21`.
  **(R5) fails.** (Cross-checked two ways: `∏(1 + a_i x)` for the clique sizes, and brute force.)

**Arithmetic identities of `INFORMAL-PROOF.md` recomputed.**

- `4k ≤ (k+1)²` for `k` in `0..2000`: 0 violations; equality **exactly at `k = 1`**, hence strict
  for every other `k` — in particular for every `k ≥ 2`, which is what §10 fence 7 asserts. The
  claim that (LB) strengthens the r25 `(k+1)²` award as a separate key is therefore correct, and
  correctly *not* claimed to supersede it.
- (XR) read at `n = 2r + d` is **exactly** `d ≤ 2r − 4` over ℤ: 0 counterexamples over
  `r ∈ 0..399`, `d ∈ −399..399`. The admissible `d` at `r = 3, 10, 100` is `2, 16, 196`: it grows
  with `r`, so §10 fence 3 — "(XR) is NOT a uniform bound on `d`" — is substantiated, not merely
  asserted.
- `Δ_0 < 0` occurs, among all forests of order ≤ 10, only at order 0, confirming §4's `k = 0` case.

---

## Independent Critic Pass

A second pass was run over this seat's own ledger, adversarially, before closing. Items opened and
their disposition:

1. **"Does the `[Finite X]` → `[Fintype X]` crossing smuggle in an instance dependence?"** Opened
   because `ExHyp` is stated at `[Fintype X]` and `LbHyp` at `[Finite X]`. Resolved: `indepCount`
   is defined through `Nat.card` of a subtype and `delta`/`coeff` take no instances at all, so the
   three faces' *statements* are instance-free; the instance is introduced only inside the proof by
   `Fintype.ofFinite` under `classical`, and is reconciled with the face by
   `Nat.card_eq_fintype_card` used in one direction. Had `indepCount` been `Fintype.card`-based the
   step would have been unsound. It is not. **Closed, sound.**
2. **"Is `lt_of_mul_lt_mul_right` applied with the right side condition?"** It needs `0 ≤ c`, not
   `0 < c`; the proof supplies `le_of_lt hpos`. Even at `i_k = 0` the hypothesis `a·c < b·c` would
   be contradictory, so no gap. **Closed, sound.**
3. **"Could the `r = 0` instance of (XR) be true only by ℕ clamping?"** Re-examined: the conclusion
   at `r = 0` reads `Nat.card X ≤ 0`, which would be false for a non-empty carrier — but the
   hypothesis `firstDescent G < 0` is unsatisfiable in ℕ, so no instance of the statement is ever
   reached there. The declaration is vacuous-hypothesis-sound and is described as such on the face,
   in the contract's `hypotheses`, and in `INFORMAL-PROOF.md` §6. **Closed, correctly handled.**
4. **"Does (XR) secretly need `firstDescent`'s minimality, so that the minimality lemma is an
   undeclared dependency?"** No: the proof consumes only `firstDescent_spec`. And using the least
   descent makes the hypothesis weakest, hence the statement strongest, so the choice is not a
   hidden weakening. §5's own remark says precisely this. **Closed, sound and honestly reported.**
5. **"Is `exists_delta_neg` circular, given that it is registered in the definition layer and
   cannot use the lemma layer?"** Re-read: the in-run proof uses only `Finset.card_le_univ`,
   `Nat.card_pos` and the three G1 definitions, never `indepCount_eq_card_indepSetFinset`. No
   circularity. **Closed, sound.**
6. **"Is the empty carrier a real instance or a degenerate escape?"** Real: `X` empty gives
   `n = 0`, `i_0 = 1`, `i_1 = 0`, `firstDescent = 0`, and (XR) at `r = 1` reads `0 ≤ 0`. It is in
   the replay (the order-0 row) and it passes. **Closed.**
7. **"Is the `8/10/12` table an artefact of my generator missing forests?"** Cross-checked against
   the known forest census 1,1,2,3,6,10,20,37,76,153,329 and against a second, independent
   computation of `i_k` (brute force vs. tree DP). **Closed.**
8. **"Does the run assert anything the synthesis fenced?"** Checked statement by statement against
   the brief's reproduced §2 and `SOLUTION-CONTRACT.md` §3; see the next section. **Closed.**
9. **"Is the contract's dependency graph closed, and does it omit any real dependency?"** The
   `conclusion` node's dependency list reaches, transitively, every definition the (XR) chain
   actually uses — including `indepDegreeSum`, `e`, `upPairs`, `downPairs`, `rootPairs`,
   `swapMap`, `childrenFinset`, `rk`, which enter through the carried (DL) proof — while excluding
   `DlHyp` and `R5Hyp`, both of which this seat confirmed are genuinely unused by (XR). **Closed.**
10. **"Did I take any producer claim on trust?"** Every digest, count, identity and inequality in
    this audit was recomputed. The one class of statement not independently reproduced is the Lean
    kernel's own verdict, which is out of scope for an informal audit and is covered by the kernel
    receipt and the separate fidelity review. **Closed.**

### Findings

**Finding 1 — imprecise localization of acyclicity (non-blocking, no inference depends on it).**
`INFORMAL-PROOF.md` §2 says: "`C1-LA1`'s rooting API uses acyclicity only at
`Erdos993G1.rootPath_unique` (uniqueness of the path to the component root, from
`SimpleGraph.IsAcyclic.path_unique`), from which `par_or`, `rk_par_lt`, `par_par_ne` and the
swap-map injection follow". The carried `Main.lean` docstring on `rootPath_unique` makes the same
claim ("Acyclicity enters the rooting API here and nowhere else"). In fact **two** declarations
apply a Mathlib acyclicity lemma directly: `rootPath_unique` (line 714, `hG.path_unique`) and
`par_or` (line 729, `hG.eq_snd_of_adj_start`). This seat read the pinned Mathlib source: at
`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:210`, `IsAcyclic.eq_snd_of_adj_start` is itself
proved by `isAcyclic_iff_path_unique.mp h` — it *is* path-uniqueness, packaged as a corollary. So
the mathematical content of the sentence (acyclicity is consumed only as path-uniqueness of the
root path, entirely inside the (DL) development) is **correct**; only the declaration-level
"at `rootPath_unique` and nowhere else" is wrong, by one declaration.

Why this does not defeat the proof: the load-bearing claim of §2 — that acyclicity enters **exactly
once, through (DL)**, and that "nothing in §3–§5 uses acyclicity again" — was verified
independently by tracing every `hG` occurrence in the source, and is true: past
`forest_degree_lemma`, `hG` is only transported as an argument and no acyclicity lemma is ever
applied. No step of (LB), (R5) or (XR) depends on the count being one declaration rather than two,
and no hypothesis of any face changes. It is a gloss to correct, not a defect in the argument.

**Finding 2 — `CAPSULE-VERIFICATION.json` `entries_not_carried` is one entry short (machine record
only; the prose is right).** `r7_carry_provenance.C1-LA3.entries_not_carried` lists `[15
ex_of_dl, 19 degree_lemma_implies_chain]` and `entries_carried: 17` (= 19 − 2). But `C1-LA3` entry
13 is also not carried as an entry: it bundles eleven declarations, of which ten are deduplicated
against `C1-LA1` entries 17–27 (this seat diffed all ten: they differ only by the `theorem`/`lemma`
keyword and section layout, exactly as claimed) and the eleventh — the (DL)-**conditional**
`Erdos993G1.forest_extension_inequality` with binders `(k : ℕ) (hDL : …)` — is deliberately
excluded because it collides with `C1-LA1`'s unconditional entry 55. Both `FORMALIZER-REPORT.md` §5
and `INFORMAL-PROOF.md` §8 state this correctly ("entries 13, 15 and 19 are NOT carried"); only the
JSON field is coarse. This seat independently confirmed the collision by reading both files: the
two declarations do carry the same full name with different statements. For the controller's note,
not a repair this seat may make.

**Finding 3 — `EVIDENCE/axioms.txt` was rewritten by the verifier after being written pre-check
(disclosed, non-blocking).** Brief R4 requires `axioms.txt` before kernel verification and no edit
after the receipt. The producer wrote it first (99 bytes, `0d76e56a…`) and the kernel verifier then
replaced it with its own probe output (588 bytes, `e5acad79…`) as that skill's contract requires;
the axiom set is identical and the file has not moved since the receipt (recomputed: 588 bytes,
`e5acad79f4597af8a8de2cceb9c16f2b46e7d89269af10f0e1dd083d17c987c9`). `FORMALIZER-REPORT.md` §7
discloses this in full. Recorded as observed and correctly disclosed.

**Finding 4 — attribution is complete on the faces but partial in the contract (observation).**
All three award faces carry the full attribution in their docstrings (FLNYZ 2026 §8; FRESH-LEAD
lane 11; seat T3; critics `C-U1-T`, `C-U3-T`, `C-U3-F`, `C-U1-F` and seat U3; `C1-LA1`'s formalizer
and `C-F1-T`; and on (XR) the U adjudicator), and `INFORMAL-PROOF.md` §9 repeats it, so
`SOLUTION-CONTRACT.md` §3.7's "attribution travels on every face" and the synthesis's carry
condition (iii) are satisfied. `THEOREM-CONTRACT.yaml` carries the FLNYZ attribution, the pointer
to the synthesis's `## Lean awards` C1-LA4 statement, the `C1-LA1`/`C1-LA3` composition credit and
the R10 grade note verbatim, but does not name FRESH-LEAD lane 11, T3, the four critics or the U
adjudicator. Recorded for the controller; it does not affect the mathematics or any fence.

**No finding of any of these classes was made:** false claim, unsupported step, hidden hypothesis,
undeclared dependency, citation mismatch on a mathematical fact, clamped inequality, weakened
statement, hallucinated lemma, or arithmetic error.

---

## Scope and Fence Check

The claim asserts the three implications, the identification of the terminal declaration, and the
unconditionality of the three faces. Nothing else. Checked against the brief's reproduced §2 fences
and `SOLUTION-CONTRACT.md` §3:

| fence | asserted anywhere in the claim, the contract or `INFORMAL-PROOF.md`? |
|---|---|
| §3.1 order bounds only; contrapositive sign `Δ_k ≥ 0`; no no-recovery statement; no status transfer to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the aggregates, Erdős #993 | **not asserted**; explicitly disclaimed on all three faces, in the contract `conclusion`, and in §10.1 |
| §3.2 nothing asymptotic (no `N₀`, no CLT, no "sufficiently large forests are unimodal") | **not asserted**; disclaimed §10.2 |
| (XR) is NOT a uniform bound on `d` | **not asserted**; disclaimed §10.3 and substantiated by this seat's recomputation (`d ≤ 2r − 4` grows with `r`) |
| `r = 0` handled as vacuous-hypothesis-sound, not as correct arithmetic | **so handled**; §10 / §6 / the (XR) docstring / the contract's `hyp-first-descent-before-r` |
| the r25 `(k+1)²` award is unchanged; (LB) strengthens it as a separate key | **so stated**, §10.7; the comparison `4k ≤ (k+1)²` recomputed, strict off `k = 1` |
| nothing about `Δ_k` for `n > 4k` beyond the sign | **not asserted**; §10.4 |
| nothing about sharpness (`4k`, `20`, `4r − 4` attained) | **not asserted**; §10.5. This seat *did* compute attainment at `k = 0, 1, 2`; the run registers none of it, as the synthesis requires |
| nothing about non-forests | **not asserted**; §10.6 |
| (DL) is an average over `I_k`; no pointwise degree statement | **so stated**, §10.6 and the (DL) docstring |
| the (R5) consequences (rank-5 residue emptiness, the K₁-addition closure to `x ≤ 5`) are separate records, grade-bounded by the r25 census | **so stated**, §10.8; this run registers none of them |
| sealed r25/r26 records never edited | **so stated**, §10.9; and no file outside this run root was written |
| `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is not a premise | **not used anywhere**; §10.10; confirmed by reading the whole dependency chain |
| brief R9: no `DlHyp` binder on any face | **satisfied**: all three faces are `{X} [Finite X] (G) (hG : G.IsAcyclic)` plus their own single hypothesis; confirmed against the source text and the contract's `hypotheses` (finiteness, acyclicity, and for (XR) `firstDescent G < r` — three, and no more) |
| brief R10 grade contingency written on the face and in the contract scope | **satisfied**: all three docstrings, the `INFORMAL-PROOF.md` header, and `formulation_status.evidence`'s GRADE NOTE. Per the §4 addendum, `C1-LA1` has since closed `formally_verified` (`VERIFICATION-REPORT.md` `28bc7d1a…`, `status: formally_verified`), so the contingency is discharged at the controller's gate; the run's own text remains accurate as written |
| Gate ruling 3: no external Lean text; the three renames | **satisfied vacuously**: U2's file (carry-list row 8) is not carried, so `indepFinsets`, `mem_indepFinsets`, `degOn` do not occur; grepping the source for them returns nothing, and `sources/external/lean-source/` was not opened by this seat either |

The claim is **strictly narrower** than the fences allow at every point, and the attribution the
synthesis requires travels on every award face and in `INFORMAL-PROOF.md` (see Finding 4 for the
contract's partial copy).

---

## Verdict

**passed**

`INFORMAL-PROOF.md` (SHA-256 `526f85e839f0b653cfecae2022747954b6072ab9e62b62e7e48a066dd1b2cfb2`)
is a correct statement-level informal proof of exactly the claim recorded in
`THEOREM-CONTRACT.yaml` → `theorem.informal_statement`
(`claim_sha256 853d49ddf77c7fd4fbb151875a5c1d826913b1c96637967e0ab3c10b000f2000`, recomputed and
matching). Every definition it invokes is the definition of record, carried byte-identically and
re-verified by recomputed registrar entry digests; every inference step ((EX) ⇒ (LB), (LB) ⇒ (R5),
(LB) ⇒ (XR), and the `DlHyp`/`ExHyp` discharge) is sound and was re-derived by hand from the Lean
text; every cast and the single ℕ-truncated subtraction are correctly audited, with `4 * r - 4`
obtained through `4 * (r − 1)` for `r ≥ 1` and the `r = 0` vacuity, never by clamping; the three
faces are exactly the `SOLUTION-CONTRACT.md` §2 statements, character-for-character, with **no
`DlHyp` binder**; `DlHyp` and `R5Hyp`, marked NOT dependencies of the terminal statement, are
confirmed not to be dependencies; and the claim asserts nothing that the synthesis, the formalizer
brief §2 or `SOLUTION-CONTRACT.md` §3 fences. Independent exact-integer replay over all 638 forests
of order ≤ 10 and a further ~6 000 forests of orders 11–60 (including 2 640 of order ≥ 21 for (R5))
produced **zero** failures of (DL), (EX), (LB), (R5) or (XR), reproduced the `n = 4k` attainment at
orders 4 and 8 for `k = 1, 2` and the `x < r ⇒ n ≤ 4r − 4` row, and exhibited explicit non-forest
counterexamples (`K_5`; `3K_4 ⊔ 3K_3` on 21 vertices) showing acyclicity is load-bearing in every
face.

No defective step was found. Four findings are recorded above, none of them a defect in the proof:
Finding 1 is an imprecise one-declaration localization of where acyclicity is consumed inside the
carried `C1-LA1` rooting API (the mathematical content of the sentence is correct, and the
load-bearing claim "acyclicity enters exactly once, through (DL)" is verified true); Findings 2–4
concern a coarse field in a machine record, a disclosed verifier rewrite of `axioms.txt`, and the
contract's partial copy of the attribution. They are the controller's to dispose of; this seat
repaired nothing and edited no run artifact.

This audit is not a kernel receipt and not a statement-fidelity review. That the Lean statements
faithfully represent `SOLUTION-CONTRACT.md` §2 to the depth a fidelity seat requires remains the
independent fidelity reviewer's question, and this award's grade remains the controller's to set.
