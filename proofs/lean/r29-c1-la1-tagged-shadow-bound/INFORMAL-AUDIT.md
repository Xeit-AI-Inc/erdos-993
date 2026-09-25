---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-opus-20260925
critic_id: c1-la1-fable-informal-20260925
attestation_id: c1-la1-informal-pass-20260925
claim_sha256: 916c37557b52ed30fa4c007b525b9ad6e7479c74f9232916985bb5c369417622
---

# Informal Proof Integrity Audit

**VerityOS boot.** I operated within VerityOS. Boot reads: `verity.md`, `identity/startup-protocol.md`, and
`skills/proof-integrity-audit/skill.md` (the brief's §0 authorized set). Subsystems loaded: identity (startup protocol),
skills (proof-integrity audit), experiments (this run root, inside the brief's §1 read boundary only). I loaded no
memory, decisions, logs, operations or conversations files. The harness also injected the repository `CLAUDE.md` and
the user auto-memory index; I did not rely on either.

**Model disclosure (two-part).** Chartered model: Claude Opus 5.5, effort high (dispatch-record authority, per the
brief `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md`). Runtime-reported model id, verbatim: `claude-opus-5-5[1m]`.
Child delegation: none. Role: independent auditor, not the artifact producer. I edited nothing in the Lean run. I ran no
`lake`/`lean`, no network, and no installs.

**Read-boundary disclosure.** Everything I read is inside the brief's §1 list:
- the LA1 run's contract, informal proof, capsule verification, `EVIDENCE/*`, formalizer report, `Main.lean` and
  `Snippets/`;
- the sealed capsule manifest and these members: synthesis `## Exact established results`, `## Lean awards`
  (including C1-LA1) and the bounded-computation subsection of the former; U's adjudication `## Lean readiness`; T1
  §5; `grep` excerpts of C-T1-F and C-T1-U on TSB; the formalizer brief; `SOLUTION-CONTRACT.md`;
  `SEMANTIC-CONTRACT.md` (`grep` excerpts); `sources/c1-stage7-sources/*` (digests, and substring checks of the base
  candidate);
- the first-interior `Main.lean`, `Snippets/0018`, `Snippets/0041` and `FORMALIZATION-STATE.json` (entries 18 and 41);
- Mathlib sources in the pinned shared project (`Bipartite.lean`, `Clique.lean`, `Fintype/Defs.lean`,
  `DoubleCounting.lean`, `Finset/SDiff.lean`, `Finset/Card.lean`).

I did not open the r25 G1 source: LA1 uses no `Erdos993G1.*` declaration (checked by a `grep` of `Main.lean`).

**Input identity (recomputed).**
- `THEOREM-CONTRACT.yaml` = `32aa0f3bd021e4e58b5b35b52fc0b2dc44d4fe8ed6890e9b27a573320348b19e`.
- `INFORMAL-PROOF.md` = `3f7ff1d9bf320c45c4c1f06f7656d180e8760602448632958f39e9912fa00a04`.
- `Main.lean` = `efafb79b0f33e1319c72d6d102d26212580110d76283c12edaad1938f97bb55c`.
- All three match the brief.
- Capsule seal: the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256` is
  `522570034d34bd05dd48ea8eb640fc9dc75276378ed1536384a5c0180ac77502`. This matches the recorded seal. All 84/84
  members match their byte counts and digests.

## Intended Claim

`theorem.informal_statement` of the contract. `claim_sha256` recomputed as
`sha256(" ".join(s.split()))` = `916c37557b52ed30fa4c007b525b9ad6e7479c74f9232916985bb5c369417622`, which equals the
brief's value.

Mathematical content: for every finite `V` and simple graph `H` on `V` with `H.IsBipartite`, every `W ⊆ V`, and every
natural `k` with `1 ≤ k ≤ α(H)`:

`k·q_{k+1} ≤ 2(α(H) − k)·q_k` in ℤ, where `q_j = |{A ⊆ V : |A| = j, A independent in H, A ∩ W ≠ ∅}|`.

Lean binding (terminal statement text):
- `expected_statement` equals the source text of `Main.lean` from `theorem` up to ` :=` exactly.
- Its SHA-256 is `87b98c294ccee3aaddf06cd0a52cbb0a65e6d8981a091a6f030b38fdf2eb9f68`.
- It is a verbatim substring of `SOLUTION-CONTRACT.md` §2, the synthesis `## Lean awards` C1-LA1, the formalizer brief
  §2, and the base candidate `ADJ-U-awards-LA1-Main.lean`.

## Claim Ledger

Verdict key: V = verified with reproduced evidence (derivation, source check and/or exact computation).

| # | Claim (statement level) | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `SimpleGraph.IsBipartite G := G.Colorable 2` | — | Mathlib `Bipartite.lean:286`, read | V |
| D2 | `IsIndepSet s := s.Pairwise (¬G.Adj · ·)` | — | `Clique.lean:843`, read | V |
| D3 | `indepNum := sSup {n \| ∃ s, IsNIndepSet n s}`; `IsIndepSet.card_le_indepNum` (`[Finite α]`, Finset `t`): `#t ≤ indepNum` | `Finite V` from `Fintype V` | `Clique.lean:983`, `:991`, read | V |
| D4 | `Finset.univ := Fintype.elems` | — | `Fintype/Defs.lean:92`, read | V |
| D5 | `taggedFamily G U W k := (U.powersetCard k).filter (IsIndepSet A ∧ ¬Disjoint A W)` | — | Run entry 1 is byte-identical to first-interior entry 18 (see the carry checks below). The contract description contains this Lean text verbatim (substring check). | V |
| L1 (Step 1) | Every `B ∈ T_{k+1}` has at least `k` subsets in `T_k` | `taggedFamily` membership only; no `hBip`, `hk` or `hcap`. Uses `\|B\| = k+1` for `(B∖{v}).card = k` (ℕ `(k+1) − 1 = k`, exact). | Derivation re-checked. Computed: the down-degree is exactly `k+1` if `\|B ∩ W\| ≥ 2`, else `k`, on every case of the grid (0 failures). | V |
| L2 (Step 2) | For a proper `c : Coloring (Fin 2)`, independent `A`, and `E` with no `E`–`A` edge: `A ∪ {v ∈ E : c v = z}` is independent | proper colouring (`c.valid`) | Three-case derivation re-checked. Computed on every bipartite graph and every independent `A` (0 failures). | V |
| L3 (Step 3) | With `E ⊆ U`, `E ∩ A = ∅`, no `E`–`A` edge, `A ⊆ U` independent, and `hcap`: `\|E\| ≤ 2(a ∸ \|A\|)` | **`hBip` enters here and only here** (`obtain ⟨c⟩ := hBip`, `Main.lean:58`); `hcap` twice. ℕ: from `\|A\|+\|P\| ≤ a`, `\|A\|+\|Q\| ≤ a` and `\|P\|+\|Q\| = \|E\|`, the truncated `a ∸ \|A\|` equals the true difference because `\|A\| ≤ a`. | Computed on 151,496 (graph, independent `A`) pairs: the split sizes, `\|P\|+\|Q\| = \|E\|` and `\|E\| ≤ 2(a − \|A\|)` all hold (0 failures). The `Fin 2` step uses `omega` from `(c v).isLt`, with no `decide`. | V |
| L4 (Step 4) | For `A ∈ T_k`: #{`B ∈ T_{k+1}` : `A ⊆ B`} ≤ `\|E(A)\|` ≤ `2(a ∸ k)` | `hBip` (via L3), `hcap`. `B ↦ B∖A` is injective (`Finset.superset_injOn_sdiff`, read); `\|B∖A\| = (k+1) − k = 1` (exact ℕ). | Computed: the up-degree is ≤ `\|E(A)\|` ≤ `2 max(a−k, 0)`, and no `E`–`A` edges, on the whole grid (0 failures). | V |
| L5 (Step 5, entry 41) | `k·\|T_{k+1}\| ≤ 2(a ∸ k)·\|T_k\|` in ℕ, for any `U`, `a` with `hcap` | `hBip`, `hcap`; `hk` is in the signature but is never referenced (linter warning `Main.lean:178:5` in `EVIDENCE/build.log`) | Mathlib `card_nsmul_le_card_nsmul` read (`#s • m ≤ #t • n`; `bipartiteAbove` and `bipartiteBelow` read). Computed: the double-count totals agree exactly, and the chain `k·q_{k+1} ≤ Σ down = Σ up ≤ 2(a∸k)·q_k` holds at every `k ≥ 0` (0 failures). | V |
| L6 (Step 6, companion) | ℕ form at `U = univ`, `a = H.indepNum`, every `k ≥ 1`, with no `k ≤ a` | `hcap` from `card_le_indepNum`; `hk` passed through | Term-mode application, read. Computed on 3,183,500 checks (all `k ≥ 1`, including `k > a`; 0 failures). | V |
| L7 (Step 7, terminal) | ℤ form under `1 ≤ k ≤ α` | **`hka` enters only here**, via `Nat.cast_sub hka : ((α − k : ℕ) : ℤ) = α − k`. `Int.ofNat_le.mpr` is a monotone cast. `push_cast [hsub]`, then `linarith`. | ℕ/ℤ identity re-checked. Computed: the integer and truncated right sides agree whenever `k ≤ a` (0 mismatches). TSB checked on 1,718,470 in-scope triples (0 failures). | V |
| N1 | ℕ/ℤ cast audit (§4 of the proof) | — | Every ℕ subtraction in the file was enumerated (list below); none truncates on its domain. | V (one wording note below) |
| N2 | Not a dependency: `IsTree`, `p ≥ 1`, `p ≥ 2`, the guard, `C4LA1`/`C5LA1`/`Erdos993G1`, and the C-U1-F and U1 carry files | — | A `grep` of `Main.lean` finds no `IsTree`, `C4LA1`, `C5LA1`, `Erdos993G1`, `decide`, `sorry`, `admit`, `native_decide` or `axiom`. There are 4 registrar entries and 8 declarations. | V |

**ℕ subtractions enumerated.**
- `a - A.card` in `card_extension_le`: `|A| ≤ a` by `hcap`, so it is exact. At `|A| = k` it becomes `a - k`.
- `a - k` in entry 41: truncated when `k > a`. Both the ℕ statement and the proof are valid under truncation.
- `(k+1) - 1` in `card_erase_of_mem`: exact.
- `B.card - A.card` in `card_sdiff_of_subset`: `A ⊆ B`, so it equals 1 and is exact.
- `H.indepNum - k` in the companion: removed from the ℤ face by `Nat.cast_sub hka`.

**Carry checks (literal).**
- Run entries 1 and 2 are byte-identical to the frozen `Snippets/0018` and `Snippets/0041` (`cb43feeb…fa1e`,
  `50dcce4a…583f`).
- Both equal the `FORMALIZATION-STATE.json` `source_sha256` values for indices 18 and 41.
- The text between the `VERITYOS ENTRY` markers equals the text between the markers for entries 18 and 41 in
  `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` (`8d864da2…d7a9`).
- Entries 3 and 4 are substrings of the base candidate (`d88f6043…62ce`, which matches `SOURCE-DIGESTS.json`, as do
  the other two carry files).
- The declaration-text digests `eef5a659…` (507 B) and `f5f0011b…` (757 B) reproduce. The 507 B text runs from the
  docstring through the proof term, plus one trailing newline. The 757 B text runs from `theorem` through
  `linarith [hcastle]`, plus two trailing newlines.
- New text in entries 3–4: the namespace wrapper, `open E993Interior`, and `--` comments only.

**Terminal hypotheses match the claim one-for-one.** `V`/`Fintype`/`DecidableEq` ↔ finite `V`; `H`,
`DecidableRel` ↔ simple graph; `hBip` ↔ bipartite; `W : Finset V` ↔ tag set; `k : ℕ`, `hk : 1 ≤ k`,
`hka : k ≤ H.indepNum` ↔ `1 ≤ k ≤ α(H)`. The conclusion is the ℤ inequality with `q_j` at `U = Finset.univ`. There
are no extra hypotheses and none missing.

## Reproduced Mathematical Evidence

The evaluators are my own, written fresh under `scratchpad/c1-s7-informal-LA1/`. They use the standard library only,
with explicit imports, and exact integers. No prior evaluator was imported. No output contains a wall-clock field.

| File | SHA-256 |
|---|---|
| `tsb_audit.py` (imports `itertools, random, json, hashlib, sys`) | `eba1db7a533ae23752e1ece4f28741058a4ff2b54d13a739f09e79af509a4494` |
| `tsb_audit.out.json` | `eb92fce5c3cca2bd346dfef1e5e58cc2867a79810620da8da5a33f41082dd52c` |
| `triple_count.py` (imports `itertools, sys`) | `8bcc2a80b4a8cabf1c9828b43360cf7e5145fefc7700a3ad02015721bd3975b5` |
| `triple_count.out.txt` | `6116fa46ec07031363d8b2d8007506c2f783a28d0932138fd340afaa84a21f19` |

**Grid.**
- Exhaustive: every labelled graph of orders 1–6 (bipartite and non-bipartite), every `W ⊆ V`, every
  `0 ≤ k ≤ n+1`.
- Random: 205 bipartite graphs of orders 7–10 (seed `20260925`), every `W`, every `k`.

**Results.**
- **TSB in scope** (`1 ≤ k ≤ a`, integers): 1,718,470 triples (1,235,654 exhaustive, 482,816 random), 0 failures.
- **Steps 1–5 as integer statements.** Checked on the whole bipartite grid at every `k`, 0 failures:
  - exact down-degree;
  - per-set up-degree ≤ `|E(A)|` ≤ `2(a ∸ k)`;
  - colour-split sizes;
  - equality of the double-count totals;
  - the chain inequality.
- **Step 6 (ℕ companion, every `k ≥ 1`):** 3,183,500 checks, 0 failures.
- **Step 7 cast identity:** integer RHS = truncated RHS whenever `k ≤ a`, 0 mismatches. `q_0 = 0` and `q_k = 0` for
  `k > a` also hold (0 failures).
- **Companion S5 (all `k`, integers; context only, not the award):** 3,606,942 checks, 0 failures. This is consistent
  with the record: `hka` is consumed by the cast but is not mathematically needed, so there is no sharpness claim to
  test for `hka` or `hk`.
- **Record numerics reproduced.**
  - Labelled bipartite graphs of orders 1–6: 1, 2, 7, 41, 376, 5,177, total **5,604** (the contract's pre-run figure).
  - Order-7 count: 103,237.
  - The triple census `Σ 2^n·α` over labelled bipartite graphs of orders ≤ 7 is **56,649,670**, which equals the
    record's "56,649,670 triples to order 7". The orders ≤ 6 part, 1,235,654, equals C-T1-F's row count.
- **The sharp hypothesis (`hBip`) fails outside scope, as the record states (B4).**
  - `K_1 ⊔ K_5`, `W` = the isolate, `k = 1`: `α = 2`, `q_1 = 1`, `q_2 = 5`, and `k·q_2 = 5 > 2 = 2(α−k)·q_1`.
    Reproduced.
  - Among non-bipartite graphs of orders ≤ 6 there are 19,207 in-scope failures out of 5,115,960. This is context
    only; it shows `hBip` carries load.
- **§3.4 illustration.** `3K_2` with `A` = one endpoint, `k = 1`, `α = 3` has 4 addable vertices (more than `k`, and
  equal to `2(a−k)`). This matches C-T1-F's witness.
- **Tightness (context only; the award claims none).** `mK_2` with one tag gives equality at every `1 ≤ k ≤ α` for
  `m = 1..4`.

## Independent Critic Pass

I reran the ledger as an adversary, trying to break each closed row.

1. **Is `hBip` used anywhere other than L3?** No. `hBip` goes to `tagged_extensions_upper` and only from there to
   `card_extension_le`. `tagged_deletions_lower` has no `hBip` parameter. The proof's Step 3 statement is accurate.
2. **Is `hk` secretly load-bearing?** No. Entry 41's body never names it (linter at `:178:5`). My grid confirms the
   `k = 0` instance, `0 ≤ 2a·q_0 = 0`. The claim keeps `hk` as statement scope and the proof says so. The claim
   asserts nothing at `k = 0`.
3. **Could the cast be unsound at `k > a`?** It is not reached: `hka` restricts the claim. Where `k ≤ a`,
   `Nat.cast_sub` gives an identity (recomputed). The narrowing matches C-T1-F and C-T1-U. It corrects T1 §5 step 5,
   and the proof does not repeat T1's "unconditional" wording.
4. **Is Step 4's injection image right?** `B∖A` is a one-element subset of `E`: `v ∈ B∖A` gives `v ∈ U`, `v ∉ A`, and
   `insert v A ⊆ B`, which is independent. `|E.powersetCard 1| = |E|`. Correct.
5. **Double-count orientation.** Mathlib gives `|T_{k+1}|•k ≤ |T_k|•(2(a−k))`. `nlinarith` only commutes the
   products. Correct.
6. **Wording note in §4 of the proof (non-blocking; imprecise but true).** "The only truncated subtraction is
   `H.indepNum - k`" is accurate for the award-level statements (entry 41, the ℕ companion, the terminal). The private
   helper `card_extension_le` also states `2 * (a - A.card)`; Step 3 names this truncation explicitly, and it is exact
   under `hcap`. The two exact subtractions `(k+1)−1` and `(k+1)−k` never truncate. No step depends on the omission.
7. **Fence leakage in the claim text.** The `informal_statement` mentions non-bipartite graphs, `k = 0`/`k > a` and the
   refuted key only as exclusions. The ℕ companion is flagged as "a lemma only". There is no tightness, leaf, tree,
   selector or aggregate assertion. Pass.
8. **Out of scope for this informal audit, observations only (not defects of the proof).**
   - (a) `EVIDENCE/axioms.txt` was rewritten by the kernel verifier during its run. The formalizer report discloses
     this, and says the file has not been edited since the receipt.
   - (b) `EVIDENCE/fidelity-audit-input.json` post-dates `FORMALIZER-REPORT.md`. That is consistent with formalizer
     brief §5 step 8, under which the controller generates it.
   - These belong to the kernel and fidelity gates.

No row changed verdict under the critic pass. Prover and critic agree with the independent evidence on every row.

## Scope and Fence Check

- **Synthesis and brief §2 excluded conclusions.**
  - No leaf, tree, selector or aggregate statement: absent from both the claim and `Main.lean`.
  - No `k = 0` or `k > a` clause in the terminal theorem: it carries `hk` and `hka`, and the ℕ companion is a `lemma`.
  - No tightness claim: none, in both the contract and the proof.
  - Nothing about non-bipartite graphs: the only mention is the B4 exclusion.
  - No reopening or aliasing of `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: stated explicitly (§3.4). The per-set bound
    is `2(a−k)` inside a size-restricted incidence count, not "≤ r addable vertices".
- **§3.1:** no status transfer. `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER,
  `E993-BETA-AGG` and Erdős #993 are all listed as untouched.
- **§3.8:** separate certificate. Entry 41 is treated as context and the key moves only at this award's own close. The
  contract makes no `formally_verified` claim.
- **§3.7, attribution on the face.** `INFORMAL-PROOF.md` §6 and the contract's `informal_statement` both carry:
  - Codex (GPT-6 Luna/Sol/Astra): the mechanism, entry 41, and the proposed statement (Sol's C2 scope audit);
  - the first-interior source, for entry 18;
  - T1; C-T1-F and C-T1-U (the `Nat.cast_sub hka` narrowing); U1; C-U1-T and C-U1-F; U's adjudicator (base candidate,
    and author of the bodies of entries 3–4); F1, C-F1-T and C-F1-U.

  This matches the synthesis attribution line item for item. "Record on the face that `hk` is statement scope" is met
  in the contract, the proof, and a source comment.
- **R5 hypothesis naming.** `IsBipartite` is named where the 2-colouring is used. `1 ≤ k` and `k ≤ a` are named. `IsTree`,
  `p ≥ 1`, `p ≥ 2` and the guard are named as not used. The ℕ/ℤ cast audit, carry table and truthful provenance ("no
  declaration was re-derived") are present, and the last is verified.

## Verdict

passed

`INFORMAL-PROOF.md` is a correct statement-level proof of the contract's `informal_statement`:
- every inference step reproduces as an exact integer statement on the chosen grid;
- every definition matches the Lean source and Mathlib literally;
- the carried entries are byte-identical to the frozen first-interior source;
- the terminal hypotheses match the claim one-for-one;
- no fenced conclusion is asserted.

There are no defective steps. One non-blocking wording note (critic item 6) is recorded.
