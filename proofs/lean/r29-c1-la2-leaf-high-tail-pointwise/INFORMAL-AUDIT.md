---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260925
critic_id: c1-la2-fable-informal-20260925
attestation_id: c1-la2-informal-pass-20260925
claim_sha256: 4f072f6ddf8ce9455f12862cdc5e6e8c3940ecfeb9722fed3a1fdc2aad7df987
---

# Informal Proof Integrity Audit

Award `C1-LA2` (r29, `erdos-993-math-dre-20260925-r29-high-tail-certification`, Cycle 1 Stage 7). Workflow run root
`runs/lean-2026-09-25-c1-la2-leaf-high-tail-pointwise/`. Auditor seat: independent informal proof-integrity reviewer,
reviewer id `c1-la2-fable-informal-20260925` (kind `independent-mathematical-proof-integrity-reviewer`). I am not the
artifact producer, and I edited nothing in the Lean run.

**Boot acknowledgment.** I am operating within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, then the brief
`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md`. Subsystems loaded: the constitution, the identity startup protocol,
and the proof-integrity-audit skill. The harness injected the project `CLAUDE.md` and the user memory index at session
start. I loaded no other VerityOS file. No conversation log was written, because this is a controller-dispatched seat
whose only output is this file.

**Model disclosure (two parts).**
- Chartered model, on dispatch-record authority (the brief): Claude Opus 5.5, effort high.
- Model id my runtime reports for itself, verbatim: `claude-opus-5-5[1m]`.
- I made no child delegation.

**Read boundary and disclosures.**
- Read in full:
  - the run's `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `LeanProject/LeanProof/Main.lean`, `FORMALIZER-REPORT.md`,
    `EVIDENCE/axioms.txt`, `EVIDENCE/axioms-all-declarations.txt` and the tail of `EVIDENCE/build.log`;
  - the capsule manifest, `SOLUTION-CONTRACT.md` and `SEMANTIC-CONTRACT.md`;
  - the synthesis sections `## Exact established results` and `## Lean awards` (through C1-LA2);
  - U's adjudication, `## Lean readiness` only;
  - the formalizer brief.
- Read by keyword only: the endpoint passages of `T1/RETURN.md`, `C-T1-F` and `C-T1-U`.
- Read by program only:
  - the keys and `new_declaration_transport` of `CAPSULE-VERIFICATION.json`;
  - the frozen `FORMALIZATION-STATE.json`, fragments and `Main.lean`;
  - `SOURCE-DIGESTS.json` and the carry files `ADJ-U-tails-LA2.lean` and `ADJ-U-awards-LA2-Main.lean`.
- Mathlib: I read `Bipartite.lean:286`, `Clique.lean:983–991` and `DoubleCounting.lean:98`, inside the pinned package
  directory.
- **Boundary disclosures.**
  - I printed the first ~1,500 characters of the run's own `FORMALIZATION-STATE.json`, which is not on my list. That
    output was the carried-entry index, and none of this audit's conclusions rests on it.
  - A directory listing of the run-root `scratchpad/` showed sibling scratch directory names. I opened none of them.
- No network, no install, no `lake`/`lean`, and nothing written outside `scratchpad/c1-s7-informal-LA2/`.

## Intended Claim

The contract's `theorem.informal_statement`. `" ".join(s.split())` of it has SHA-256
`4f072f6ddf8ce9455f12862cdc5e6e8c3940ecfeb9722fed3a1fdc2aad7df987`, which I recomputed and which equals the brief's value.

**Claim (HTP), terminal.** Let `G` be a finite simple bipartite graph, `v` an original degree-one vertex with support `s`,
and `p` an integer with `p ≥ 1` and `3p ≥ 2α(G) + 1`. Then `Δ_{p−1}(G − {v,s}) − Δ_{p−1}(G − N_G[s]) ≤ 0`, where
`Δ_k(G − D) = i_{k+1}(G − D) − i_k(G − D)` counts independent sets of the original carrier that avoid `D`. There is no
selector, residual, connectivity or nonemptiness hypothesis.

**Companion (HTA), a lemma on the same face.** Under `G` bipartite, `p ≥ 1` and `3p ≥ 2α + 1`,
`C5LA1.aggregate G p ≤ 0`, with the original strict selector.

**Lean form.** The terminal `E993HighTail.bipartiteLeafHighTailPointwise` has statement-text SHA-256 `805b1585…31d2`,
recomputed from `Main.lean`. It equals `lean_binding.expected_statement` and appears verbatim in the brief, the
synthesis and `SOLUTION-CONTRACT.md` §2. The companion `bipartiteHighTailAggregateAllRanks` has text SHA-256
`752a355b…96af`, recomputed; it also appears verbatim in all three and in the contract's companion field.

**Hypotheses, one for one.** The Lean hypotheses match the claim exactly:

| Lean hypothesis | Claim |
|---|---|
| `hBip` | bipartite |
| `hv : IsGraphLeaf G v` (`∃! u, G.Adj v u`) | original degree-one vertex |
| `hp : 1 ≤ p` | `p ≥ 1` |
| `hTail : 2 * G.indepNum + 1 ≤ 3 * p` (ℕ, no subtraction) | `3p ≥ 2α + 1` |

`C5LA1.H G v = {v, s}` and `C5LA1.R G v = insert s (N(s)) = N_G[s]`. Under `hp`, the ℕ rank `p − 1` is the integer
`p − 1`.

## Claim Ledger

Verdict key:
- **V** = verified, with reproduced evidence (script and row cited).
- **V-src** = verified by reading the source against the claim.

Scripts:
- `E` = `evaluator.py`
- `C` = `check_carry.py`
- `S` = `check_statements.py`
- `M` = `check_manifest.py`

| # | Claim (INFORMAL-PROOF §) | Hypotheses and where they enter | ℕ/ℤ | Evidence | Verdict |
|---|---|---|---|---|---|
| D1 | Definitions of record 1–14 and 18 (`C4LA1.*`, `C5LA1.*`, `taggedFamily`) are the frozen first-interior text | — | — | C: all 17 carried regions of `Main.lean` are byte-equal to the frozen fragment files, to the frozen `Main.lean` regions and to the `FORMALIZATION-STATE.json` digests; the contract's descriptions contain each fragment verbatim | V |
| D2 | `i_k(G−D)` counts independent `k`-subsets of `V` disjoint from `D`; `Δ_k = (i_{k+1}:ℤ) − i_k`; `q_j = #taggedFamily G (univ∖H_v) R_v j` = independent `j`-subsets of `univ∖H_v` meeting `R_v` (§1) | — | casts ℕ→ℤ per count | V-src (entries 10–12, 18); `E` implements them from these texts | V |
| D3 | Mathlib meanings: `IsBipartite := Colorable 2`; `indepNum = sSup{n | ∃ s, IsNIndepSet n s}`; `IsIndepSet.card_le_indepNum`; `card_nsmul_le_card_nsmul` (double count) | — | — | Mathlib source read | V-src |
| L1 | 2.1 `i_0(G−D) = 1`, any `G`, `D` | none | — | E `split`/`Delta0` rows (`c[0] = 1` on every deletion) | V |
| L2 | 2.2 `i_1(G−D) = |univ∖D|` | none | — | E: 515,096 `Delta0` rows | V |
| L3 | 2.3 `Δ_0(G−D) = n − |D| − 1` in ℤ | none | `n − |D|` is exact by `|D| ≤ n` (`Nat.cast_sub`, `card_le_univ`) | E: 515,096 rows, 0 failures; identity recomputed | V |
| L4 | 2.4 (S2) the `p = 1` term is `deg_G(s) − 1` for every leaf of every finite simple graph | `IsGraphLeaf` gives `v ~ s`, so `v ≠ s` and `|H| = 2`; irreflexivity gives `s ∉ N(s)`, so `|R| = deg(s) + 1` | ℤ | Recomputed: `(n−3) − (n−deg(s)−2) = deg(s) − 1`. E: 257,548 leaf rows on every labelled graph of order ≤ 6 (bipartite or not), all bipartite graphs of order 7, and the random sets; 0 failures; `|H| = 2`, `|R| = deg + 1` and `H ⊆ R` on every row | V |
| L5 | 2.5 (S3, graph-general) a leaf and `α ≤ 1` give `N(s) = {v}`, so the term is 0 | `IsGraphLeaf` (`support_adj`, `support_unique`); no bipartiteness | — | V-src (lines 772–793: `w ∈ N(s)`, `w ≠ v` ⇒ `{v, w}` is independent of size 2 ⇒ `2 ≤ α`, contradiction). E: every leaf with `α ≤ 1` among all graphs of order ≤ 6 (2 rows, the two leaves of `K_2`) has term 0 | V |
| L6 | 2.6 branch `p = 1`: `p < 2 ∧ 1 ≤ p ⇒ p = 1`; the guard gives `α ≤ 1`; L5 then gives term `0 ≤ 0`; `hBip` is not used | `hp`, `hTail` | ℕ `p − 1 = 0` | E ℕ grid (0 ≤ α, p ≤ 400): every guarded `p = 1` pair has `α ≤ 1`. V-src line 814 (no `hBip`) | V |
| L7 | 2.6(a) `H_v ⊆ R_v` | `IsGraphLeaf` (`v ∈ N(s)`) | — | V-src (lines 464–475); E row check | V |
| L8 | 2.6(b) `i_k(G−H) = q_k + i_k(G−R)` for `D ⊆ E`, any graph | `H ⊆ R` | ℕ | V-src (`card_filter_add_card_filter_not`); E: 2,566,424 rows, 0 failures | V |
| L9 | 2.6(c) with `p − 1 + 1 = p`, the term equals `q_p − q_{p−1}` | `p ≥ 2` (a fortiori `p ≥ 1`) | ℤ | E: 2,051,328 rows at every `1 ≤ p ≤ n+1`, 0 failures (also true at `p = 1`, where `q_0 = 0`) | V |
| L10 | 2.6(d) `leaf_indep_cap`: independent `A ⊆ univ∖H_v` ⇒ `|A| ≤ α − 1` (`A ∪ {v}` is independent) | `IsGraphLeaf` (the only neighbour of `v` is `s ∉ A`) | `α − 1` is exact since `α ≥ |A| + 1 ≥ 1` | V-src (lines 477–516); E: 257,548 rows, 0 failures (checked in the truncated form) | V |
| L11 | 2.6(e) the guard with `p = k + 1` gives `2((α ∸ 1) ∸ k) ≤ k` in truncated ℕ, before the case split | `hTail`, `p ≥ 2` | truncated ℕ; exact on the branch `k ≤ α − 1` | E: all 107,067 guarded pairs `(α, p)` with `α, p ≤ 400`, 0 failures. On the branch `k ≤ α ∸ 1` the integer inequality `2((α−1) − k) ≤ k` also holds (0 failures). Hand check: `2α + 1 ≤ 3k + 3 ⇒ 2α − 2 − 2k ≤ k` | V |
| L12 | Above the cap (`α ∸ 1 < k`), `q_k = q_p = 0` (`tagged_zero_above_leaf_cap`) | L10 | ℕ | V-src (lines 559–570, 586–592) | V |
| L13 | Entry 41 at `U = univ∖H_v`, `W = R_v`, `a = α ∸ 1`: `k·q_{k+1} ≤ 2(a ∸ k)·q_k`. Its parts: (i) each tagged `(k+1)`-set has `≥ k` tagged `k`-subsets (delete any vertex but one fixed tag); (ii) the addable set `E ⊆ U` has `|E| ≤ 2(a − |A|)`, because each colour class of `E` joined to `A` is independent inside `U`; (iii) the double count | **`IsBipartite` only in (ii)** (`card_extension_le`, `obtain ⟨c⟩ := hBip`, line 299); the cap is L10; `hk` is unused in the body | truncated `a − k` in ℕ | V-src (lines 272–430; `hk` unused, matching the build warning at 419:5). E: 1,912,428 rows (bipartite, every `k ≥ 1`, truncated form), 0 failures | V |
| L14 | Cancellation `k·q_{k+1} ≤ k·q_k ∧ k ≥ 1 ⇒ q_{k+1} ≤ q_k` | `1 ≤ k` (from `p ≥ 2`) | ℕ | E cancellation grid, 0 failures; V-src (`nlinarith` after `by_contra`) | V |
| L15 | 2.6(f): `q_p ≤ q_{p−1}`, so the term is `≤ 0` for `p ≥ 2` | L9, L12–L14 | ℤ | E: HTP guarded bipartite rows, 1,363,180, 0 positive | V |
| L16 | 2.7 (HTA): each summand of `aggregate G p` is the (HTP) term of a leaf; `Finset.sum_nonpos` concludes; the selector is used only for membership | `IsGraphLeaf` from `leafSet` membership; `hBip`, `hp`, `hTail` passed on | ℤ | V-src (lines 827–836); E: 641,553 guarded `(G, p)` aggregates with the literal strict selector `Δ_p(G−v) < 0`, 0 positive | V |
| L17 | 2.8 the terminal theorem is L6 ∪ L15 at the same hypotheses | all four | — | V-src (line 850) | V |
| L18 | §3 hypothesis ledger: `IsTree` unused; no selector, residual, connectivity or `Nonempty` hypothesis | — | — | `IsTree`/`Nonempty` occur 0 times in `Main.lean`; hypothesis texts read | V |
| L19 | §4 cast audit (`p − 1`, `α − 1`, `a − k`, `n − |D|`) | as above | every truncation is inactive where it is used | L3, L10, L11 and the ℕ grid | V |
| L20 | §5 carry table: 17 fragments byte-identical; 8 new bodies byte-identical to `ADJ-U-tails-LA2.lean` (`5db83f7b…`), which is byte-identically the tail of `ADJ-U-awards-LA2-Main.lean` (`87003231…`); only the `namespace`/`open`/`end` wrapper is in-run; no declaration re-derived | — | — | C: every body digest listed in §5 recomputed in full and found in `INFORMAL-PROOF.md`; `endswith` check true; carry-file digests equal `SOURCE-DIGESTS.json`; no `decide`/`sorry`/`admit`/`native_decide`/`axiom` token in `Main.lean` or the tail file | V |
| L21 | Nothing marked NOT a dependency is a dependency | — | — | After their own definitions, `Main.lean` never references `leafDegree`, `crossingIndex` or `highTailAggregateFromShadow`. `vertexDeletion*` and `IsFavorableAt` enter only through `aggregate` (companion). Entry 44 is not carried | V |
| L22 | Structure: one `theorem`, placed last; no primed names; the companion is a `lemma` before the terminal | — | — | S | V |

## Reproduced Mathematical Evidence

All scripts are my own, standard library only, deterministic and free of wall-clock fields. They sit under
`scratchpad/c1-s7-informal-LA2/` with the stated import lists, and import no prior evaluator.

| File | SHA-256 |
|---|---|
| `evaluator.py` (itertools, random, sys, hashlib, json) | `7f29de678beffaa2bf908c86e46768208a9eeecaeaacfad8fe47b91feb7f55a6` |
| `evaluator-output.txt` (internal JSON digest `c392fea9…b550`, identical on two runs) | `e77f1c1b630a1ec08aca1aeaebdb9b6811edb1cfc99da5b7ceb4b3958ebf2f56` |
| `check_carry.py` / output | `44f2eedf…7196` / `3bd62bcd…2c4d` |
| `check_statements.py` / output | `0228a7ea…a469` / `44f163c9…8853` |
| `check_manifest.py` / output | `9480b188…7194` / `f161ed7d…9d39` |
| `count_bip7.py` / output | `30afb64b…8267` / `1fcaa0e5…4eb0` |

**Integrity of inputs.**
- Contract `7ef3f53a…4ece`, informal proof `affa1fcb…e43a` and `Main.lean` `d968eb56…d496` equal the brief's
  expected digests.
- Capsule: all 86 of 86 members match their bytes and SHA-256. The seal `3967f4ca…d48a` is reproduced as compact
  key-sorted JSON of the manifest minus `seal_sha256`.
- Frozen first-interior `Main.lean` is `8d864da2…d7a9`.

**Exhaustive grid.** Every row checks the definitions of record directly, with deletion realised as avoidance on the
original carrier.
- Every labelled simple graph of order 1–6: 33,867 graphs, of which 5,604 are bipartite.
- Every labelled bipartite graph of order 7: 103,237 graphs. The generator was cross-checked by brute force over all
  2^21 graphs, which gave 103,237 (`count_bip7.py`).
- Seeded random samples: 1,500 bipartite graphs of order 8–12, and 680 random trees of order 8–14.

Rows checked, all with **0 failures**:

| Check | Rows |
|---|---|
| S2 `term(1) = deg(s) − 1` | 257,548 |
| `Δ_0` identity | 515,096 |
| `|H|`, `|R|`, `H ⊆ R` | 257,548 |
| tagged split | 2,566,424 |
| leaf cap | 257,548 |
| entry-41 inequality at `U = univ∖H_v`, `a = α ∸ 1` | 1,912,428 |
| term `= q_p − q_{p−1}` | 2,051,328 |
| (HTP) under the guard, bipartite | 1,363,180 |
| (HTA) with the literal strict selector | 641,553 |

**Arithmetic lemmas.**
- The ℕ guard lemma (L11) and the `p = 1` pinning (L6) hold on every guarded pair `0 ≤ α, p ≤ 400`: 107,067 pairs, 0
  failures.
- The cancellation step (L14) holds on its grid.

**Hypotheses outside their stated scope (sharpness, as the record claims).**
- **The guard is load-bearing and sharp.** Below the guard, 435,215 bipartite (leaf, `p`) rows have a strictly positive
  term.

  | Witness | Relation to the guard | `α` | Term |
  |---|---|---|---|
  | `P_3` at `p = 1` | `3p = 3 = 2α − 1` | 2 | **+1** |
  | `P_3 ⊔ K_2` at `p = 2` | `3p = 6 = 2α` | 3 | **+1** |
  | `P_6` at `p = 2` | `3p = 6 = 2α` | 3 | **+1** |

  Family A (C-F1-T: centre `s`, leaf `v`, `α − 1` legs) at `α = 2..8`:

  | `α` | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
  |---|---|---|---|---|---|---|---|
  | term at `p = ⌊2α/3⌋` | +1 | +1 | +6 | +10 | +5 | +85 | +126 |
  | term at the first guarded rank | −1 | −3 | −2 | −13 | −44 | −39 | −210 |

  This matches B1 and B3 of the synthesis. The values at `α = 3, 4` also match family A's closed form
  `C(m,p)(2^p−1) − C(m,p−1)(2^{p−1}−1)`, which I checked by hand.
- **Bipartiteness is load-bearing at `p ≥ 2`.** On `P_3 ⊔ 2K_3` at `α = 4`, `p = 3` (guard equality `9 ≤ 9`), I get
  `q_3 = 9`, `q_2 = 6` and term **+3**, matching B4. No non-bipartite guarded positive exists at order ≤ 6 (99,728
  guarded non-bipartite rows). The claim does not assert a minimal order, and this is recorded only as context.
- **The `p = 1` endpoint needs no bipartiteness.** It holds on every graph (L5), so bipartiteness is correctly not
  consumed there.

## Independent Critic Pass

Separately from the ledger, I re-read each closed row, looking for an unstated hypothesis, an inactive truncation that
could activate, a circular use, or a statement stronger than the Lean text.

1. **Could `α = 0` or `V = ∅` break a truncation?** No. A leaf `v` exists, so `α ≥ 1`, and `α − 1` is exact everywhere.
   `hcoeff` is proved in truncated ℕ and is valid for every `α` (grid). It is consumed only when `k ≤ α ∸ 1`.
2. **Is the tag set right?** Tagged sets live in `U = univ∖H_v` and meet `R_v`, that is, they meet `N(s)∖{v}` inside
   `U`. The split identity needs only `H ⊆ R` (L7). It is checked on every row, including leaves whose support has other
   leaves.
3. **Does entry 41 need the global cap?** No. It is applied with the `U`-relative cap `a = α ∸ 1` (L10). The addable set
   `E` is filtered from `U`, so `A ∪ (E ∩ colour class) ⊆ U` and the cap applies. I confirmed the `U`-relative form on
   1.9M rows.
4. **Is the ℕ/ℤ boundary respected at `p = 1`?** `p − 1 = 0` in ℕ. The `p = 1` branch rewrites to `Δ_0` via `subst`, and
   L4 and L5 are stated at rank 0. There is no hidden `p ≥ 2` use.
5. **Does the claim say more than the Lean?** No. The informal statement asserts exactly the terminal statement and the
   companion, with "integer `p ≥ 1`" tied to the ℕ `p` by `hp`. It asserts no strict sign, no sign below the guard, and
   no selector or residual content.
6. **Attribution and provenance.** The bodies are presented as carried from the U adjudicator, not re-derived. I
   confirmed this byte for byte (L20). The critic-attributed mathematics (A1/A3 endpoint, S2 from T1) is credited on the
   face.
7. **Editorial observations (not defects).**
   - `INFORMAL-PROOF.md` §5 writes "Entries 15–17, 19–40, 43, 44 and 45 are not carried" in original numbering, directly
     after a table in which registrar entries 15–17 are carried. It is true under the table's "Original entry" column,
     but a reader could misparse it.
   - `EVIDENCE/axioms.txt` was overwritten by the kernel verifier with its probe output. This is disclosed in
     `FORMALIZER-REPORT.md` and belongs to the kernel/workflow gate, not this audit.
   - HTA condition (iii) (receipt `#print axioms` covering the companion) is not met literally, as the formalizer states.
     Its companion axioms are exactly the three in the unbound `axioms-all-declarations.txt`. That is the controller's
     ruling, not an informal-proof defect.

The critic pass found no defect. Every ledger row stays closed.

## Scope and Fence Check

Checked against brief §2 and the synthesis `## Lean awards` C1-LA2. Each item appears in `INFORMAL-PROOF.md` §7 and in
the contract's FENCES and EXCLUDED CONCLUSIONS text:

| Fence or exclusion | Status |
|---|---|
| No sign below the guard; the guard is sharp (B1); nothing in `3p < 2α + 1` (§3.3) | present. My sharpness rows are boundary evidence only and take no step into the lower region |
| No favorable-selector, eligibility or residual statement | present. The selector appears only as the carried aggregate's filter |
| No non-bipartite `p ≥ 2` statement (false, `P_3 ⊔ 2K_3`, B4) | present, and reproduced (+3) |
| The graph-general `p = 1` companion `leafEndpointAtOne` is a lemma, not a registered claim until SR-1 | present |
| NOT `E993-BETA-TARGET` (§3.4) | present |
| No transfer to `E993-BETA-AGG`, all-rank `E993-R23-…`, any no-recovery key or Erdős #993 (§3.1) | present |
| No strict sign | present |
| §3.8 separate certificate; entries 41–42 are context, never certificates | present. `highTailAggregateFromShadow` is not called |
| §3.7 attribution on every face | present |

The attribution required by the synthesis and brief is on both faces (`INFORMAL-PROOF.md` §6 and §5, and the contract's
ATTRIBUTION text):
- **Codex (GPT-6 Luna/Sol/Astra):** the mechanism, entries 41/42, the proposed statement, the `p = 1` gap, and the
  bipartite-free endpoint observation (prior art).
- **Definition layers:** r24 C4-LA1 (entries 1–4), r26 (entries 5–14), first-interior (entry 18).
- **r29 seats:** T1 (the `p = 1` endpoint, `deg(s) − 1`); C-T1-F (A1), C-T1-U (two-branch), C-F1-T (A3), C-F1-U (A3)
  and the U adjudicator (`leafEndpointAtOne`, and the base candidate the bodies are carried from); U1 and the critics
  (compiles); T2 (the aggregate corollary's use).

**Excluded bodies.**
- U1's `decide` helper is absent: no `decide` token appears anywhere in `Main.lean`.
- C-U1-T's ordering and primed names are absent.

## Verdict

passed

`INFORMAL-PROOF.md` (`affa1fcb…e43a`) is a complete and correct statement-level proof of the contract's
`informal_statement` (claim SHA-256 `4f072f6d…f987`), and of the exact declarations of `Main.lean` (`d968eb56…d496`).
- Every inference step is verified: 22 ledger rows plus 3 definition rows, all verified, none escalated.
- Every hypothesis is named where it enters, and every ℕ subtraction is inactive where it is used.
- The definitions are byte-identical to the frozen first-interior source.
- The terminal hypotheses match the claim one for one.
- The claim asserts nothing fenced.

This attests the informal mathematics only. The kernel receipt, the statement-fidelity review, the (HTA) certificate
ruling and SR-1 remain with their own gates.

Model disclosure: chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id
`claude-opus-5-5[1m]`.
