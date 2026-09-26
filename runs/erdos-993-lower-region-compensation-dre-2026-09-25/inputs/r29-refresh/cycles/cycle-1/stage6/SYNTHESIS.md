# Cycle 1 Neutral Synthesis

r29 (`erdos-993-math-dre-20260925-r29-high-tail-certification`): certify the uniform high-tail mechanism and its
non-residual top-rank consequence. Stage 6, neutral synthesis seat, 2026-09-25.

**VerityOS boot.** I am operating within VerityOS. For the boot I read exactly two VerityOS files: the constitution
`verity.md` and `identity/startup-protocol.md` (both relative to the VerityOS root). As the dispatch directs, I did not
follow the startup protocol's wider loading map (memory, knowledge, conversations, modules, skills, logs, decisions). The
harness put the repository's project instructions and the user's auto-memory index into my context at session start. I
did not open either file, and nothing below depends on them. I started no conversation log; this seat is a sealed
dispatch.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.** Everything I read or ran is listed here, and all of it was inside the grant.
1. I read the dispatch `control/dispatch/c1-stage6/DISPATCH-SYNTHESIS.md`, `control/C1-SYNTHESIS-PROTOCOL.md` and the
   capsule `control/C1-STAGE6-DISPATCH-MANIFEST.json`.
2. I read all twelve capsule members. To read the F and U adjudications in full, I copied them byte for byte into my
   scratch (`F.md`, `U.md`); their digests equal the capsule's.
3. I read `control/PATH-CHECK-c1-stage6-dispatch.json` (0 findings).
4. Under `sources/`:
   - I hashed all 149 files listed in `SOURCE-DIGESTS.json`, and nothing else;
   - I parsed eleven keys of `sources/authority/CLAIM-IDENTITY.json` (with no aliases printed) and its status counts;
   - I listed two directories non-recursively (`sources/first-interior/c2-primary-v2/` and its `LeanProject/LeanProof/`,
     including `Snippets/`);
   - I hashed the 45 `Snippets/*.fragment` files, and read the first five lines of fragment 41.
5. I ran no `find`, `rg`, recursive `grep`, recursive listing or glob `cat` rooted above a granted directory. The only
   `grep` calls were on single files: my own scratch script, and the fragment files for their banner.
6. I read no raw return, critique, critic or seat scratch, prior synthesis, other experiment root or external source.
7. I used no network, installed nothing, ran no Lean or `lake`, and started no background job.

One tool artefact had no effect: a shell `echo` of a literal `=====` failed under zsh, because zsh treats `=word` as a
command lookup. It printed nothing and read nothing.

## Identity and seal audit

**Seals.** Each was recomputed as SHA-256 over key-sorted compact JSON, with separators `(",",":")`, `seal_sha256`
removed and no trailing newline (script `scratchpad/c1-S/seal.py`).

| Object | Stated seal | Recomputed | Match |
|---|---|---|---|
| Stage 6 dispatch capsule `control/C1-STAGE6-DISPATCH-MANIFEST.json` (12 files) | `b090798b69246737605839e2e183974c8d0bbf7e84e835d0c1d56acd549b593f` | same | yes |
| Stage 5 packet manifest `control/C1-STAGE5-PACKET-MANIFEST.json` (30 files) | `ac2875c9d5e81bbd9582f19c7a3812389d8ce76d5b986ab85f64a623015016a4` | same | yes |

**Capsule members.** All 12 match on SHA-256 and byte count:

| Member | SHA-256 |
|---|---|
| `SEMANTIC-CONTRACT.md` | `9e8131e845fcbaab999332b2b5bcaa838477ad15f1101d523c3ada8daad5501d` |
| `SOLUTION-CONTRACT.md` | `0327cc8ee6fd83acb36074af4e8900bcd037e6613fc03020ac86e6b76d356e5f` |
| `control/C1-ALLOCATION.md` | `f02fcba93b43c8975c3ca6e1907b2cdcb2b95fabeedca3d23c775f78fc4128a9` |
| `control/C1-STAGE1-GATE.md` | `04b9c50c203e8bfc4eaf9d58af454a4c00b96efac5aae205ba3b173a66160dc3` |
| `control/C1-STAGE5-PACKET-MANIFEST.json` | `1d7db7f4c774e36aed1750a54ae678ce8e5ab0b4519240fbe35c6dc826ccabcb` |
| `control/C1-STAGE6-CONTROLLER-FACTS.json` | `7b0043e21ad4da1f29000860d190b803099e7165b3d2df221793e8a071d3a46e` |
| `control/C1-SYNTHESIS-PROTOCOL.md` | `9333fb7cb041632e08a910bb219a97c6683bb1f09d749ee197950315b302c0bb` |
| `control/PATH-CHECK-c1-stage6-dispatch.json` | `39bb6bd53f329dc4262ce81dbb3772f340337d1a6ca6af58aba0e8cb6e897fbc` |
| `control/SOURCE-DIGESTS.json` | `63bee54370bf0429db842e7979ec666311107557b31f6fc0a3b0ea52f437c087` |
| `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` | `3a68fa7be8d07a5741aa343de5e8e7868ae4f26557928f02f1e41adf3cb6721d` |
| `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md` | `0a689d4dd331c6d22d3da2677d24cd47ec08a1b29eed98e3615ea037dc9f1be4` |
| `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` | `c9b6a38c176a3b38fe1b7b16aa85e342a8a81478d1f058fe07e79ee6bf9e3c9e` |

**Consistency with Stage 5.** Every capsule member that also appears in the Stage 5 packet manifest carries the same digest
there: the two contracts, the allocation, the gate, `SOURCE-DIGESTS.json` and the three adjudications. The Stage 5
manifest's other members are outside my grant, so I did not hash them.

**Frozen sources.**
- All 149 entries of `SOURCE-DIGESTS.json` recompute and match.
- The first-interior `Main.lean` is `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`.
- All 45 `Snippets/*.fragment` digests equal the values the adjudicators cite (full list under `## Lean awards`).

**Adjudicators' own audits** (read, not re-run). All three recomputed the Stage 2, 3 and 4 packet seals and matched:
- Stage 2: `58655e87…6a6e`;
- Stage 3: `40561239…8205`;
- Stage 4: `f5a61035…0386`.

Each also verified its own capsule:

| Adjudicator | Capsule seal | Members |
|---|---|---|
| T | `6a7b7127…c1de` | 21 |
| F | `82e5e35a…fd81` | 18 |
| U | `e3897a7e…0444` | 18 |

**Admissions.**
- Stage 3 admitted 4 of 4 returns, and Stage 4 admitted 8 of 8 critiques (7 `retained_narrowed`, 1 `retained`).
- All three adjudications carry the two-part model disclosure, with runtime id `claude-opus-5-5[1m]`.
- Every read-boundary disclosure an adjudicator made is inside its grant; U's hash-only touch of one non-member is
  disclosed as hash-only.
- None of them affects validity, and I disturb no ruling.

**Registry state entering the synthesis** (from my parse of the frozen `CLAIM-IDENTITY.json`: 407 identities, 245
VERIFIED / 92 REFUTED / 44 OPEN / 26 CONDITIONAL):
- (TSB), (HTP) and (ELIG) are OPEN, with `formal_award: false` and the certificate "OPEN proposal only".
- `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` is VERIFIED `formally_verified`.
- `E993-R26-TOP-RANK-RESIDUAL-SIGN` is VERIFIED, and its strict companion `-STRICT` is VERIFIED at `proved_informal`.
- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is OPEN, and so is `E993-BETA-AGG`.
- `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT` and `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` are REFUTED.
- No `E993-R29-*` key is in the master registry. The run-local keys (HTA), (TRN) and the boundary record are ledger
  candidates only.

**Controller facts** (`C1-STAGE6-CONTROLLER-FACTS.json`, CF-S-1 to CF-S-7) are weighed as process facts and replays,
never as evidence for a mathematical claim.

## Reconciliation

I reconcile claim by claim against the three adjudications (T `0a689d4d…`, F `3a68fa7b…`, U `c9b6a38c…`). I resolve no
disagreement by counting votes, and I consult no lower tier. Where a replay exists, it outweighs a self-report. My own
spot-check instrument (`scratchpad/c1-S/synth_check.py`, stdlib, exact integers) is a neutral sanity replay. It is not an
isolated second read, and I grade nothing on it.

### Where the three orientations agree (no ruling needed)

| # | Claim | T | F | U | Synthesis |
|---|---|---|---|---|---|
| A1 | No in-scope counterexample to (TSB), (HTP), (HTA), (ELIG) or (TRN) | none; horizons to order 7 (bipartite) and 16 (trees) | none; bipartite to order 7–8, trees to order **18** | none; to order 6 | Agreed. My replay also finds 0 failures: all labelled graphs of order ≤ 6 (31,876 guarded HTP rows, 14,252 guarded HTA rows, 91 top-eligible graphs) and all 1,301 free-tree classes of order 13 (every free tree of order ≤ 13 checked; 42,154 guarded HTP rows; 1,339 ELIG-eligible, all with `α ≥ 7`; 2,147 TRN-eligible, all with `α ≥ 5`, maximum `S = −12`). |
| A2 | The ℤ form of (TSB) consumes `hka : k ≤ a` only through `Nat.cast_sub`; `hBip` enters only at `Core.card_extension_le` | ruling T1-1, kernel-replayed | row 11 | table (TSB) | Agreed. |
| A3 | `term(p = 1) = deg_G(s) − 1` for any leaf of any finite simple graph (T1) | E6 | result 1 | companion `leafTermAtOne_eq_degSubOne` | Agreed, `proved_informal` (a route result, T1). My replay: 32,110 leaf rows of order ≤ 6, 0 mismatches. |
| A4 | The SEMANTIC-CONTRACT star form `C(m−1, p) − C(m−1, p−1)` holds only for `p ≥ 2`; at `p = 1` the term is `m − 1` | agrees | row 8 | agrees | Agreed. Erratum R29-E-c. |
| A5 | 987 free-tree classes through order 12, not 976 | agrees | agrees | — | Agreed. Erratum R29-E-a. My partial sums reproduce A000055 through order 13 (1,301). |
| A6 | Cumulative eligible counts through order 12: 361 (ELIG) and 846 (TRN) | agrees | agrees | — | Agreed. My replay reproduces 361 and 846. |
| A7 | Refuted keys stay refuted and are distinct statements. The `E993-BETA-TARGET` witnesses `T_22` (`p = 34`) and `T_60` (`p = 90`) fail the high-tail guard, which is the registry's own `scope_distinction`. (TSB) is not the addability bound (the quantities are incomparable). | agrees | rows 12–13 | agrees | Agreed. F1's reason for the addability distinction is struck, and the critics' reason stands. |
| A8 | Entries 41–44 are compiled internal and unawarded; they are context, never certificates | agrees | agrees | agrees | Agreed (fence §3.8). |

### Disagreements, each ruled separately

1. **Grade of (HTA) and (TRN): `conditional` or `proved_informal`?**
   - The positions:
     - T2 graded them `conditional`, taking entry 44 as the input;
     - C-T2-U held `conditional`;
     - C-T2-F held `proved_informal`;
     - adjudicator T ruled `proved_informal`;
     - U's adjudicator reads "proved";
     - F's adjudicator reads "not refuted; composition".
   - **Ruling: `proved_informal`.** The input of record is the informal chain (TSB) → (HTP) → (HTA), each link
     `proved_informal` in the T portfolio (T1's extraction, re-derived by C-T1-F, C-T1-U and C-T2-F, and checked by T's
     adjudicator against lines 1086–1153 of `Main.lean`). Entry 44 is not the input: it has no grade (fence §3.8).
   - A composition takes its weakest input's grade, and that grade is `proved_informal`. C-T2-U's reading is correct only
     under the superseded entry-44 input.
2. **Is `hk : 1 ≤ k` consumed by entry 41?**
   - F's result 5 says "the proof through entry 41 consumes `hk`". T's adjudicator read lines 942–957 and found `hk`
     unreferenced in entry 41's body. U's adjudicator reports the unused-variable linter flagging `hk` in entry 41.
   - **Ruling: T and U prevail** (a direct source reading plus the linter, against a portfolio with no Lean). `hk` is a
     binder of entry 41 that its body does not use. It is consumed one level up, in `leaf_tagged_monotone`'s cancellation
     of `k`, and it is part of entry 42's `hShadow` interface.
   - The registry text "1 ≤ k ≤ a" keeps `hk` as a statement-scope hypothesis of record. F's sentence is narrowed
     accordingly. No award is affected.
3. **Lean readiness: F says "no group ready", T and U say "all four ready".**
   - F's ruling is expressly limited to F's own evidence: F has no Lean seat. F states that the combined DAG closes if
     the T and U portfolios supply the registry-scope proofs and compiled fragments.
   - They do. T's adjudicator compiled all five §2 statements in minimal-carry files (`CarryLA1`–`CarryLA4`). U's
     adjudicator compiled admissible single-source award candidates for every group, and rebuilt C-U1-F's and C-U1-T's.
   - **Ruling: no conflict. The combined DAG is closed for all four groups.**
4. **Does the `p = 1` endpoint consume bipartiteness?**
   - "Yes, locally" was the view of T1, U1, C-U1-T and the SEMANTIC-CONTRACT §2 prose ("a bipartite graph with `α = 1`
     has at most two vertices").
   - "No" was the view of C-T1-F A1, C-T1-U's two-branch route, C-F1-T A3, C-F1-U A3, and U's adjudicator (compiled
     `leafEndpointAtOne`).
   - **Ruling: bipartiteness is sufficient but not needed at `p = 1`.** Let `u ∉ {v, s}`. Then `u` is not adjacent to
     `v`, because `s` is `v`'s only neighbour, so `{v, u}` is independent and `α ≥ 2`. The guard `2α + 1 ≤ 3` gives
     `α ≤ 1`, a contradiction. Hence `V = {v, s}`, `N(s) = {v}`, `R_v = H_v` as Finsets, and the term is `0`.
   - T1's colour-class proof stays valid, and both proofs are admissible Lean bodies. This corrects the SEMANTIC-CONTRACT
     narrative (proposed erratum R29-E-d, below).
   - Prior art: Codex's frozen `CANDIDATE-PROOF.md` ("broader endpoint check") and the registry's `scope_boundary` for
     `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` ("the guard forces `alpha(G) = 1` and `alpha(H) = 0`") already argue
     without bipartiteness. Attribution therefore goes to Codex for the observation, and to the r29 critics and U's
     adjudicator for the compiled graph-general lemma.
5. **Minimal LA4 carry.**
   - C-U1-T: `{1–14, 18, 41, 42, 44}` plus a public `Δ_0 = n − 1` lemma.
   - C-U1-F and CF-S-3: `{1–6, 8–34, 39–44}`, keeping U1's `Guard`-based proof.
   - **Ruling: no contradiction. They are two different proofs, and both compile** (adjudicator U built LA4a and LA4b).
   - T's and U's adjudicators independently recommend the public route (LA4b), so the TRN certificate does not carry
     ELIG's internal lemma (entry 43) or the G1 chain. I adopt **LA4b as the plan of record and LA4a as the admissible
     fallback.**
6. **Minimal LA3 carry.**
   - C-U1-T: `{1–17, 19–40, 43}`. C-U1-F: `{4, 10–12, 14–17, 19–34, 39, 40, 43}`.
   - **Ruling: `{1–17, 19–40, 43}` is the plan of record**, as T and U both rule. It keeps the definition layer of record
     whole. C-U1-F's set is a registrar option, and a subset is never required.
7. **LA2 declaration order.**
   - C-U1-T placed the terminal theorem before the (HTA) companion. C-U1-F put the terminal last, using an auxiliary
     lemma. U's adjudicator ruled that the terminal goes last, following the carry rule of record and the first-interior
     precedent (entry 45 is last).
   - **Ruling: the terminal `theorem` goes last.** The (HTA) companion comes before it, through an auxiliary pointwise
     lemma.
8. **The order-6 tree boundary witness.**
   - F1 said `P_6` is the unique smallest witness. C-F1-T found two classes, and F's adjudicator confirmed them from F1's
     own report.
   - **Ruling: two classes, `P_6` and the spider `S(1,2,2)`.**
9. **"The guard is not sharp for disconnected instances" (F1).**
   - **Struck (C-F1-T; F's adjudicator).** `P_3 ⊔ K_2` has a positive term at `3p = 2α`, which shows the guard is sharp
     at `α = 3`.
10. **U1's Lean statements against the §2 text.**
    - U1 writes `E993Interior.taggedFamily` twice in `bipartiteTaggedShadowBound`, and breaks lines differently in
      `bipartiteLeafHighTailPointwise`. C-U1-F proved the elaborated types `rfl`-equal.
    - **Ruling:** the awards must bind the §2 text **verbatim**. U's adjudicator candidates do so byte for byte (they
      `open E993Interior` inside namespace `E993HighTail`). U1's variants are not used.
11. **Where `IsTree` enters (TRN).**
    - T2 cited `IsTree.isBipartite` (`Acyclic.lean:598`), whose term routes through `hG.connected.nonempty`. The
      acyclicity-only route is `IsAcyclic.isBipartite` (`:617`). T's adjudicator narrowed the citation, and U's LA4b uses
      line 598.
    - **Ruling:** mathematically, (TRN) consumes `IsTree` only through bipartiteness, and acyclicity suffices. Stage 7
      should prefer `hT.isAcyclic.isBipartite` (line 617) for literal hypothesis accounting. Line 598 is admissible if the
      fidelity face records the connectivity routing. This is not a blocker.
12. **Certificate route for (HTA).**
    - Both T's and U's adjudicators left this open for the synthesis.
    - **Ruling:** see `## Lean awards` (C1-LA2). In short, (HTA) goes on C1-LA2's face as a companion `lemma`. Its
      run-local key may be registered `formally_verified` on C1-LA2's kernel receipt, under three binding conditions.
      Otherwise it registers at `proved_informal`.
13. **(TRN) low-`α` step.**
    - T2's version: `Nonempty`, `n ≥ 4`, `order_ge_alpha_succ`.
    - The shorter version: ℕ arithmetic gives `α ≥ 3`, then `Δ_0 = n − 1 ≥ 0` gives `x ≥ 1`, so `α ≥ 4`. This was
      stated by C-T2-U (compiled `eligible_top_alpha_ge_four`), F's adjudicator (result 6) and U's adjudicator (compiled
      `topRankEligibleAlphaGeFour`).
    - **Ruling:** adopt the shorter derivation for the award (LA4b). T2's hypothesis accounting is narrowed: `Nonempty`
      is sufficient but not required, and `n ≥ α` comes from `exists_isNIndepSet_indepNum`. r26 prior art travels with the
      `α ≥ 4` ingredient: the registered text of `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` says "hEligible implies
      alpha >= 4 since x >= 1 always".
14. **Is equality possible at `α = 4` in (TRN)?**
    - T2 said yes (open item 5). C-T2-F, C-T2-U and controller CF-T-1 said no, because the minimum eligible `α` is 5.
    - **Ruling: T2's claim is struck.** On a tree, `α = 4` needs `x = 1`, so `Δ_1 < 0`. But `2Δ_1 = n² − 5n + 2 < 0` only
      for `n ≤ 4`, while `n ≥ α + 1 = 5`. My replay agrees: the minimum top-eligible `α` is 5 on every tree of order ≤ 13
      and on every labelled graph of order ≤ 6.
15. **Instance counts.**
    - F1's (HTP) counts use the cutoff `p ≤ n + 1`, which F1 never states. C-U1-T's counts are unreconciled.
    - **Ruling:** these are bounded priors only. Every count carries its `p`-range, and no count is load-bearing. My
      `p ≤ α + 1` counts (31,876 / 14,252) reproduce U's adjudicator exactly.

**Literal strikes carried by the adjudications** (adopted without change):
- **T1's struck literals:** 419, 140, 80, "15 hand-chosen `W`", and the Prüfer horizon.
- **T2's struck literals:** the runtime, "15 MATCH", "smallest", and "full list".
- **F1's struck literals:** rows 6, 8, 9, 10, 11, 12, 14 and 17.
- **U1's narrowed items:** counts, "independently", the hypothesis narrative, and `decide`.
- **C-U1-F:** "nine".
- **C-U1-T:** LA2 order, and the primed name `support_adj'`.

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. **STATED** marks a statement first made at a review stage (a critic, an
adjudicator, or this synthesis). It needs an isolated second read before registration. A compiled companion lemma is
kernel-checked inside an award's own certificate. It may carry that award's proof without a separate second read, but it
becomes a registered fact only after one.

### The five statements (all `proved_informal` at the close of Stage 6)

**R-TSB. (TSB) `E993-BIPARTITE-TAGGED-SHADOW-BOUND` — `proved_informal`.**
- Statement: for a finite `V`, `H.IsBipartite`, `W : Finset V`, `1 ≤ k ≤ α(H)`:
  `(k:ℤ)·q_{k+1}(H, W) ≤ 2(α(H) − k)·q_k(H, W)`, where `q_j = (taggedFamily H univ W j).card`.
- Proof (Codex mechanism; T1 registry derivation):
  - (i) **Deletions.** Every tagged independent `(k+1)`-set has at least `k` tagged `k`-subsets. If it meets `W` twice,
    all `k+1` deletions work; if once, deleting any of the `k` untagged vertices works.
  - (ii) **Additions.** Every tagged independent `k`-set `A` has an addable set `E` with `|E| ≤ 2(α − k)`. `E` is
    non-adjacent to `A`, and each colour class `E ∩ X_i` is independent, so `A ∪ (E ∩ X_i)` is independent and
    `|E ∩ X_i| ≤ α − k`. **Bipartiteness enters here only.**
  - (iii) **Double count.** Count the pairs `A ⊂ B`.
  - (iv) **Registry specialisation.** `U = univ`; the cap is `IsIndepSet.card_le_indepNum`; the ℤ cast uses
    `Nat.cast_sub hka`.
- `hk` is statement scope only. Evidence of record: T1 plus C-T1-F, C-T1-U and T's adjudicator. Scratch kernel
  compiles: T's adjudicator (`CarryLA1`), U's adjudicator (`awards/LA1`), C-U1-F and C-U1-T. Bounded: 56,649,670 triples
  to order 7, 0 failures (F1, replayed three times).

**R-HTP. (HTP) `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` — `proved_informal` at every integer `p ≥ 1`.**
- **`p ≥ 2`** (Codex body; T1 extraction):
  - Put `k = p − 1 ≥ 1`, with `q_j` counted in `G` on the carrier `univ ∖ H_v` with tag set `R_v`. Inside `U` this
    coincides with `N(s) ∖ {v}`.
  - The term equals `q_p − q_{p−1}` (`tagged_count_split`).
  - Every independent set inside `univ ∖ H_v` has size `≤ α(G) − 1` (`leaf_indep_cap`: `v` extends it).
  - The guard `3p ≥ 2α + 1` gives `2(α − 1 − k) ≤ k` (proved by `omega` in truncated ℕ, before any case split).
  - Entry 41 at the `U`-relative cap then gives `q_{k+1} ≤ q_k`. Above the cap both counts are `0`.
  - Consumes `IsBipartite` (through entry 41), `IsGraphLeaf` and the guard.
- **`p = 1`** (T1; bipartite-free form per disagreement 4): the term is `0`. Consumes the guard and `IsGraphLeaf` only.
- **Alternative packaging** (C-T1-U; kernel-checked by T's adjudicator). Split on `α ∸ 1 < p`:
  - In the zero branch, `q_p = 0`, so the term is `−q_{p−1} ≤ 0`. This uses no guard and no `hBip`.
  - In the other branch, `2α + 1 ≤ 3p ≤ 3α − 3` forces `α ≥ 4` and `p ≥ 3`, and `leaf_term_nonpos` applies.
- `hp : 1 ≤ p` makes the ℕ `p − 1` the integer rank. No selector, residual or connectivity hypothesis is used.

**R-HTA. (HTA) `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` — `proved_informal`.**
- Statement: `G.IsBipartite`, `1 ≤ p` and `2α + 1 ≤ 3p` give `C5LA1.aggregate G p ≤ 0`. This uses the original strict
  selector, with one tag per original leaf.
- Proof: `Finset.sum_nonpos` over R-HTP. Attribution: Codex/Astra proposal; T1 and T2.

**R-ELIG. (ELIG) `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` — `proved_informal`.**
- The ℕ hypothesis `x + 2 ≤ α ∸ 2` forces `α ≥ 4`. The cases below `α = 7` are excluded as follows:
  - `α = 4` needs `x = 0`, but `Δ_0 = n − 1 ≥ 0`.
  - `α = 5` needs `x ≤ 1`, but `Δ_1 = C(n−1, 2) − n ≥ 0` for `n ≥ 6` (value 4 at `n = 6`).
  - `α = 6` needs `x ≤ 2`, but `Δ_2 ≥ 0`, using `Δ_2 = (n−1)(n−2)(n−9)/6 + Σ_u C(deg u, 2)`:
    - `n ≥ 9`: the first term is nonnegative.
    - `n = 7`: `Δ_2 = −10 + D` with `D ≥ 15` (the star). T's and U's adjudicators recomputed this.
    - `n = 8`: `Δ_2 = −7 + D` with `D ≥ 9` (a two-vertex cover with degree sum ≥ 7).
- Hypothesis map (corrected by C-T1-F, C-T1-U and T's adjudicator):
  - acyclicity enters **all three** `Δ_2` branches, through entry 34 `indepCount_three_add_edge_incidence`;
  - connectivity enters through `hT.card_edgeFinset` (`m = n − 1`), in `order_ge_alpha_succ`, `delta_one_nonneg`, the
    three `Δ_2` branches and the cover-degree lemmas.
- Attribution: Codex (entry 43); T1 extraction, as corrected.

**R-TRN. (TRN) `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` — `proved_informal`.**
- Statement: `G.IsTree` and the ℕ hypothesis `x + 2 ≤ α ∸ 1` give `C5LA1.aggregate G (α − 1) ≤ 0`.
- Proof: the ℕ hypothesis forces `α ≥ 3`. `Δ_0 = n − 1 ≥ 0` gives `x ≥ 1`, so `α ≥ 4` and `p = α − 1 ≥ 3`. Then
  `3(α − 1) ≥ 2α + 1 ⟺ α ≥ 4`, so R-HTA applies with bipartiteness from `IsTree`.
- Relation to r26: `hAlpha` and the residual condition (★) are dropped. `hEligible` and the conclusion are textually
  identical. The mechanism is different (tagged shadow, not the (RI)/(RC) budget).
- Attribution: Codex/Astra proposal; T2 derivation; the x ≥ 1 shortening (C-T2-U; F's and U's adjudicators); r26 for the
  `α ≥ 4` ingredient.

### Companion and structural results

| # | Statement (exact hypotheses) | Grade | Attribution | Second read? |
|---|---|---|---|---|
| S1 | `q_k(H, W) = i_k(H) − i_k(H − W)` (`tagged_count_split` at `D = ∅`, `E = W`; any finite graph) | `proved_informal` | Codex (entry 42 helper); T1 | not required (route result); C-U1-T's fresh compiled `taggedCount_eq_sub` is optional on LA1's face |
| S2 | `term(p = 1) = deg_G(s) − 1` for every leaf of every finite simple graph | `proved_informal` | T1 | not required (route result) |
| S3 | Bipartite-free `p = 1` endpoint: a leaf and `α(G) ≤ 1` give `R_v = H_v`, so the term is `0`, on every finite simple graph | `proved_informal`, STATED | C-T1-F A1, C-F1-T A3, C-F1-U A3, U's adjudicator (`leafEndpointAtOne`); Codex prior art | **yes** (SR-1) |
| S4 | Leaf `α`-drop equality: `α(G − {v, s}) = α(G) − 1` for every leaf of every finite simple graph (`≤` is `leaf_indep_cap`; `≥` because a maximum independent set contains exactly one of `v`, `s`) | `proved_informal`, STATED | C-F1-T A2, C-F1-U A4 | **yes** (SR-2) |
| S5 | (TSB) holds for **every** `k ≥ 0`, in ℤ and in truncated ℕ (`q_0 = 0`; `q_k = q_{k+1} = 0` for `k > α`) | `proved_informal`, STATED | C-T1-F A2, C-T1-U F4, C-F1-T A8 | **yes** (SR-3) |
| S6 | (TSB) is tight at every `1 ≤ k ≤ a`: `mK_2` with one tag, and `H_v` of family B with `W = {w}`, give equality with `q_k > 0` | `proved_informal`, STATED | C-F1-T A7 (`mK_2`), C-F1-U (family B) | **yes** (SR-4) |
| S7 | Top-rank eligibility in ℕ (`x + 2 ≤ α ∸ 1`) forces `α ≥ 4` on **every** finite simple graph | `proved_informal`, STATED | C-T2-U, F's adjudicator (result 6), U's adjudicator; r26 prior art | **yes** (SR-5) |
| S8 | Every **tree** eligible at `p = α − 1` has `α ≥ 5`, so the guard is strict on (TRN)'s domain (slack `α − 4 ≥ 1`); no **bipartite** graph eligible at `p = α − 1` has `α = 4` | `proved_informal`, STATED | C-T2-F A1, C-T2-U A2; controller CF-T-1 | **yes** (SR-6) |
| S9 | The (TRN) conclusion holds on every finite **bipartite** `G` under the same ℕ hypothesis (connectivity unused), hence on every forest | `proved_informal`, STATED | C-T2-F A3, C-T2-U, C-U1-T, F's adjudicator | **yes** (SR-7) |
| S10 | Pinned Mathlib citations: `Clique.lean:991` `IsIndepSet.card_le_indepNum`, `Bipartite.lean:286` `IsBipartite := Colorable 2`, `Acyclic.lean:56/60/63/296/598/617` | read and backed | T's and U's adjudicators | — |

### Tier 2: the boundary record `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`

**B1. Sharpness at every `α ≥ 2`** — `proved_informal`, STATED, second read SR-8.
- Claim: for every integer `α ≥ 2` there is a tree `T` of order `2α` with `α(T) = α`, and an original leaf `v`, whose
  (HTP) term is strictly positive at `p = ⌊2α/3⌋`. So the guard `3p ≥ 2α + 1` cannot be relaxed by one rank on trees, and
  hence not on bipartite graphs.
- **Family A** (C-F1-T):
  - Shape: a centre `s` with leaf `v` and `m = α − 1` legs `s–w_i–u_i`.
  - `term(p) = C(m,p)(2^p − 1) − C(m,p−1)(2^{p−1} − 1) = (C(m,p−1)/p)·[t(2^{p−1} − ½) + p/2]`, with `t = 2α − 3p`.
  - The term is positive for `t ≥ 0` (and `p ≤ α`), and `≤ 0` for `t ≤ −1`, because `2^p − 1 ≥ p`.
- **Family B** (C-F1-U):
  - Shape: the path `v–s–w–c` plus `α − 2` pendant edges `a_i–b_i`, with every `a_i ~ c`.
  - `term(p) = C(m,p−1)·2^{p−1} − C(m,p−2)·2^{p−2}` with `m = α − 2`.
  - For `2 ≤ p ≤ m + 2` it has the sign of `2α + 1 − 3p`: it is **zero** at guard equality, and `term(1) = 1`.
- Verification:
  - I re-derived family A's factorisation by hand in this synthesis.
  - F's adjudicator checked both closed forms by recurrence for `m ≤ 10`, and the sign pattern for `m ≤ 1500`
    (4,518,005 exact checks).
  - My replay checks both closed forms against brute force at every `p` for `m ≤ 7` (168 checks), and positivity at
    `⌊2α/3⌋`.

**B2. The largest positive `p` on trees is exactly `⌊2α/3⌋` for every `α ≥ 2`** — `proved_informal`, STATED, second read
SR-8.
- This is a composition: B1 gives the lower bound, and R-HTP gives the upper bound, because every `p ≥ ⌈(2α+1)/3⌉` is
  `≤ 0`.
- F's adjudicator stated it as "conditional on (HTP)". Since R-HTP is now `proved_informal`, the composition is
  `proved_informal`.
- Bounded check: `α ≤ 9` to order 18 (F's adjudicator). My order-13 table matches `⌊2α/3⌋` for `α ≤ 8`; at `α ≥ 9`
  the horizon is below `2α`.

**B3. Minimal witnesses** — `bounded_computation`, three or more instruments each.

| Class | At `3p = 2α` | At `3p = 2α − 1` |
|---|---|---|
| Trees | order 6: `P_6` and `S(1,2,2)` (`α = 3`, `p = 2`, term `+1`) | order 3: `P_3` (`p = 1`, term `+1`) |
| Labelled bipartite graphs | order 5: `P_3 ⊔ K_2` (term `+1`) | order 3 |

**B4. Hypothesis-necessity annex** — explicit exact finite witnesses, STATED, second read SR-9. They lie outside every
target's scope, and they establish that bipartiteness is load-bearing.
- **`K_1 ⊔ K_5`, `W` = the isolate, `k = 1`:** `α = 2`, `q_1 = 1`, `q_2 = 5`, and `1·5 = 5 > 2 = 2(2−1)·1`. So (TSB)
  fails without `hBip`.
- **`P_3 ⊔ 2K_3` (the path `v–s–w` plus two disjoint triangles), at `α = 4`, `p = 3` (guard equality `9 = 9`):** the term
  is `q_3 − q_2 = 9 − 6 = +3`. So (HTP) fails without `hBip`.
- Source: C-T1-F. Replayed by T's adjudicator and by my instrument, and checkable by hand.

**Fence.** B1–B4 refute nothing in scope. They evaluate no selector and no aggregate below the guard, and take no step
into `3p < 2α + 1` (fence §3.3). The stronger unguarded statement is already REFUTED as `E993-BETA-TARGET` (in the
governed setting), so no new refutation key is needed.

### Bounded computations

All figures below are `bounded_computation`. Trees are counted as isomorphism classes (A000055); bipartite graphs are
labelled.
- **Free trees.**
  - To order 16: 32,508 classes; 32,364 TRN-eligible; 29,181 ELIG-eligible; 0 failures; maximum `S(T, α−1) = −12`.
    Three instruments, plus T's adjudicator's byte-identical replay.
  - To order 18 (F's adjudicator): 204,860 TRN-eligible and 200,699 ELIG-eligible; 19,730,188 guarded HTP instances; 0
    failures; A000055 matched at orders 17 (48,629) and 18 (123,867).
- **Labelled bipartite graphs.**
  - (TSB) to order 7: 56,649,670 triples.
  - (HTP)/(HTA) to order 8, with `p ≤ n + 1`: 37,561,316 instances.
  - 11,768 top-eligible graphs to order 7, of which 9,871 are not trees, all with `S ≤ 0`.
  - All with 0 failures.
- **Scope of these numbers.** The census values of fence §3.5 are not used anywhere. These counts enter no proof and no
  Lean file.

## Refuted or narrowed mechanisms

**Refuted or struck (as statements; none is a registry key, so no status changes):**
- **(TSB) and (HTP) without `hBip`.** Refuted by the B4 witnesses. Bipartiteness is load-bearing for (TSB) and for the
  (HTP) branch `p ≤ α − 1`.
- **The unguarded `p = 1` sign.** The term is `deg(s) − 1 > 0` whenever `deg(s) ≥ 2`, so the endpoint holds only because
  the guard forces `G = K_2`.
- **"Equality possible at `α = 4`" on (TRN)'s domain** (T2): struck, by S8.
- **"`α(H_v) < α(G) − 1` occurs"** (F1's "unresolved"): superseded by S4, which proves it never happens.
- **"The guard is not sharp for disconnected instances"** (F1): struck.
- **"`hk` is load-bearing in (TSB)"** and **"the ℤ recast is unconditional"**: struck.
- **The star closed form at `p = 1`, and "crossover strictly below the guard for every `m`"**: struck (R29-E-c). At
  `m = 2` the crossover is `p = 2 = p_guard`.
- **The `P_3 ⊔ K_2` prior as evidence that the lower region is nonempty**: struck as evidence. It is a non-tree at a
  non-eligible rank. Membership is shown instead by an order-11 tree with `α = 9`, `x = 4`, `p = 6` (T's adjudicator;
  no sign evaluated).
- **The claim that shipped evidence backs the identity count 2,395,020**, and **"no wall-clock fields hashed"** in F1's
  adversarial report: struck. The identity itself rests on three other instruments.

**Narrowed (Lean mechanics):**
- **The cross-award import plan (U1's "preferred" LA4)** is inadmissible. The governed verifier admits one source that
  imports only Mathlib (CF-S-3). The three LA3 public restatements that existed only for that plan are withdrawn.
- **LA4's dependence on entry 43** is admissible but unnecessary (LA4b removes it).
- **"The registry-form (TSB) is the mechanism node of (HTP)"** is narrowed. (HTP) uses entry 41 at the `U`-relative
  cap `U = univ ∖ H_v`, `a = α − 1`, so LA2 needs entry 41, not LA1's terminal theorem. **The four award groups are
  mutually independent.**
- **U1's `bipartite_indepNum_one_card_le_two`** is correct but superfluous. It carries a literal `decide` over `Fin 2`,
  and must not travel into an award.
- **C-U1-T's primed names** (`support_adj'`) are rejected by the registrar's name rule. They must be renamed if reused.
- **Draft contracts.** U1's LA1–LA3 drafts and T2's LA4 draft are not binding-ready (repairs listed under
  `## Lean awards`).
- **Hypothesis accounting.**
  - T1's (ELIG) map, T2's `Nonempty` and `:598` claims, and U1's hypothesis narrative are narrowed as ruled above.
  - U1's "`hv` forces `α ≥ 1`" is struck: any singleton is independent.

**Closed as unnecessary (no successor work):**
- F1's item 3: recomputing `T_22`/`T_60` is logically redundant and fenced.
- F1's item 4: a G1 addability witness is unneeded, because the structural distinction suffices.
- F1's item 6: orders 8–9 would add only bounded evidence.

## Headline verdicts

Exact evidence-grade verdict for every tier and key touched. **No registry status changes at Stage 6.** Every change
below is conditional on its own Stage 7 award, per fence §3.8.

| Tier | Key | Verdict at close of Stage 6 | Status now → at Stage 7 close |
|---|---|---|---|
| 1 | `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB) | `proved_informal`; not refuted; tight (S6, STATED) | OPEN → VERIFIED `formally_verified` iff C1-LA1 closes |
| 1 | `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP) | `proved_informal` at every `p ≥ 1`; not refuted; guard sharp (B1, STATED) | OPEN → VERIFIED `formally_verified` iff C1-LA2 closes |
| 1′ | `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA) | `proved_informal`; not refuted | run-local OPEN → VERIFIED `formally_verified` on C1-LA2's receipt under the companion conditions; otherwise VERIFIED `proved_informal` |
| 1 | `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG) | `proved_informal`; not refuted | OPEN → VERIFIED `formally_verified` iff C1-LA3 closes |
| 1 | `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN) | `proved_informal`; not refuted; strictly inside the high tail (`α ≥ 5`, S8, STATED) | run-local OPEN → VERIFIED `formally_verified` iff C1-LA4 closes |
| 2 | `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` | B1/B2 `proved_informal` STATED; B3 `bounded_computation`; B4 explicit exact finite | record; registered after second reads SR-8/SR-9 |
| 3 | S1–S9 | as tabled | no separate keys (see `## Registrations`) |
| input | `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` | VERIFIED `formally_verified`, **unchanged**; never re-registered or edited | scope note only |
| input | `E993-R26-TOP-RANK-RESIDUAL-SIGN` | VERIFIED `formally_verified`, **unchanged**; r26 stays the proof of record on the residual class, and (TRN) does not widen it | scope note only |
| input | `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` | VERIFIED `proved_informal`, **unchanged**; (TRN) states no strict inequality and implies nothing about `S ≤ −2` off the residual class | scope note only |
| open | `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN, unchanged.** (HTA) closes, at `proved_informal` now and formally with C1-LA2's companion, the region `{(T, p) : T a finite tree, x(T) + 2 ≤ p, 3p ≥ 2α(T) + 1}`. It contains every eligible top rank (C1-LA4) and every eligible first-interior rank (already VERIFIED). **The exact open remainder** is `{(T, p) : x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋}`, i.e. eligible ranks with `3p ≤ 2α`, equivalently depth `α − p ≥ ⌈α/3⌉`. It is nonempty (order 11, `α = 9`, `x = 4`, `p = 6`; membership only). B1 shows no leafwise pointwise argument extends below the guard. | OPEN; scope note |
| open | `E993-BETA-AGG` | OPEN, **unchanged**: governed RTree scope, and the ordinary-to-governed bridge was never attempted | none |
| refuted | `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` | REFUTED, **unchanged**; distinct from (HTP)/(TSB) | distinction note (optional) |
| program | NR1, FOREST, TREE, TRANSFER, Erdős #993 | **unchanged by construction** (fence §3.1): (TSB)–(TRN) are independent-set count statements, not no-recovery statements, and no status transfers | none |

The depth form of the open remainder (`α − p ≥ ⌈α/3⌉`) is my arithmetic restatement of T2's retained region
`{x + 2 ≤ p, 3p < 2α + 1}`. It is equivalent because `3p ≤ 2α ⟺ α ≤ 3(α − p)`, and it is STATED only as wording.

**Per-target stop-gate status** (`SOLUTION-CONTRACT.md` §5):

| Target | Status | Smallest unproved lemma |
|---|---|---|
| (TSB) | `proved_informal` | none |
| (HTP) with (HTA) | `proved_informal` | none |
| (ELIG) | `proved_informal` | none |
| (TRN) | `proved_informal` | none |

No target is REFUTED, and there is no in-scope witness at any horizon.

## Lean awards

**Ruling.** All four DAGs are closed at registry scope. Every node is either proved informally (the Exact established
results) and compiled sorry-free in an admissible single-source scratch file, or a byte-identical carried fragment. So
Stage 7 funds **all four groups as full awards**, not as bounded attempts. The groups are mutually independent and may
run in parallel.

The scratch compiles are replays, not certificates:
- T's adjudicator: `CarryLA1`–`CarryLA4`.
- U's adjudicator: `awards/LA1`, `LA2`, `LA3`, `LA4a`, `LA4b`, and C-U1-F's four files rebuilt.
- The controller: CF-S-2.

Every replay shows exactly `[propext, Classical.choice, Quot.sound]`.

### Carried fragments (byte-identical transport only)

Source: `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/NNNN-….lean.fragment`. The SHA-256 of each
fragment file was recomputed by me. Each travels as one registrar unit, with its `private` helpers inside it.

| # | Declaration | SHA-256 |
|---|---|---|
| 1 | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 7 | `C5LA1.leafDegree` | `ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68` |
| 8 | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 9 | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 10 | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 11 | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 12 | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 13 | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 14 | `C5LA1.crossingIndex` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` |
| 15 | `Erdos993G1.indepCount` | `f6bc96fd41a76a97b28a866a483e2b1d637d371832690897422edeeb9b65bc2b` |
| 16 | `Erdos993G1.coeff` | `15ce5e3474a249e2ae5d727a1012a8f6bea52cbbf8188b13cfe247eb844d5cf8` |
| 17 | `Erdos993G1.delta` | `d7dc776c79754ed209810ad69194b3b65d71e3bf718124b0133c53d1bee1a42c` |
| 18 | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 19 | `Erdos993G1.indepCount_eq_card_indepSetFinset` | `01ee774fedf7bb37cb52000e541f0c8196f3882ce0e4c5a77cc46e05ba98e876` |
| 20 | `Erdos993G1.coeff_nat` | `91c74d915628f89477cb21d889b1e6cb464d34247520df6084260b72ec796440` |
| 21 | `Erdos993G1.delta_nat` | `61f3c4d43f5847c9c65da6c606c0fa3083078cfbc394be9e5d90b14463c042a9` |
| 22 | `Erdos993G1.isNIndepSet_pair_iff` | `a5eb6d6e8d552c64fa2cb4001d5f440637a38ef7c2e15e179c1eaaab1db9d412` |
| 23 | `Erdos993G1.sym2_toFinset_injective` | `d90c2a73eb34028360b6e19de80ccb0f42b1901ef4a1fec0e9cc0281ba551a02` |
| 24 | `Erdos993G1.indepSetFinset_two_eq` | `9a618f5577e807ae3ba07edfc6fb09ddfe732dc3bca7f5260288a798c219a0d1` |
| 25 | `Erdos993G1.indepCount_two_add_edges` | `889082ae5e0ef42ec09114ff404a94b0e30b0f5d9d2f4e621868328930e53ce3` |
| 26 | `Erdos993G1.indepSetFinset_eq_filter_powersetCard` | `5dae608f7a4c0080d5baf5c3d9c7f348b9ca8c8fe0696a8ff41609ad9715e16b` |
| 27 | `Erdos993G1.card_nonindep_pairs` | `6e86164cc77740b70b633979f1bb9f55b1379ed261467391fe51ffb0836f3fcf` |
| 28 | `Erdos993G1.sum_card_filter_swap` | `8a32f504cb65462cc407e7d76e8cfa05f1df7f218b7072b70414f24aba94a68f` |
| 29 | `Erdos993G1.sum_nonindep_pair_incidence` | `bafc19d498fd73893dbbd27856e681905568a5a1ed659a421802e2d1f4c4b1d9` |
| 30 | `Erdos993G1.sum_indep_indicator` | `967e8cea5583894061db4c306ff05690dfe200422d9c6fd62d559a8ffbb1b3a8` |
| 31 | `Erdos993G1.triple_local_identity` | `b2a3d62321344a280924b2701b63fda6abb7f1fd6e8bba69fd46b6fc7538fbe7` |
| 32 | `Erdos993G1.indepSetFinset_three_incidence` | `e75d6c9bdb5332d9efa9c20535c35c0f047fcbf29add7232eaabf570bdb871a2` |
| 33 | `Erdos993G1.sum_triple_centered_neighbor_pairs` | `2d8c865096680299876ca4ee7a094c41cf849dd15d7c4ac33ae166f43d34e549` |
| 34 | `Erdos993G1.indepCount_three_add_edge_incidence` | `2f67af0812ec6608bd511d62e5579e86d21d3d59da08da663d11a124768a627e` |
| 35 | `Erdos993G1.forest_card_edges_add_components` | `7eef4f723871eb13f3132efb877cda06e5b4a7498589fca0a012eb49339ea183` |
| 36 | `Erdos993G1.components_card_pos_of_card_pos` | `2948f2bea2afbc682160cd1afae04ff4f83f519d4413e437dddd787c6d33f3a8` |
| 37 | `Erdos993G1.degreeDefect_nonneg` | `e13b00906721b8a815d185d3bc4f38148fccc231d200b3bb820579c0f05fdb8f` |
| 38 | `Erdos993G1.degreeChoose_sum_lower` | `990ee7b780b0a7a0c7c6a7c34cf026d13ded3d7de15d826aec6ea560dc1bff35` |
| 39 | `Erdos993G1.scaledChooseTwo` | `998f5e2749af9a08a08bf161dcce06d9fe4036299593a66572a2f1d12eee0ca4` |
| 40 | `Erdos993G1.scaledChooseThree` | `d6f3427951f65a5d5b754f7876b5fa0b8e855ce52dfa70173a4ab26edf87aff0` |
| 41 | `E993Interior.taggedShadowBound` (+ `Core` helpers) | `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f` |
| 42 | `E993Interior.highTailAggregateFromShadow` (+ `Leaf` helpers) | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` |
| 43 | `E993Interior.eligibleAlphaGeSeven` (+ `Guard` helpers) | `dbd200bd15cf7cf8ce2516587fb25491dbddad2b171a079bda87b92258c32b06` |
| 44 | `E993Interior.bipartiteHighTailAggregate` | `b7ee9d1adcac58675ea4216906ca944049df3f3be12873c4996cb23fe4dc3b93` |

Entry 45 (`firstInteriorAggregate`, `03de7a41…`) is **never carried**: it is the VERIFIED first-interior award (fence
§3.2).

### Rules binding on every group

These come from `SOLUTION-CONTRACT.md` §2, CF-S-3, CF-S-4 and the adjudications.

**Source file.**
- It is one self-contained source that imports only Mathlib, pinned at Lean v4.32.2 and Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`.
- Carried fragments come first, in entry order and byte-identical. Definitions precede lemmas.
- New declarations go in namespace `E993HighTail`, with `open E993Interior` (plus the `open` lines the carried layer
  needs), so that the §2 text, including the unqualified `taggedFamily`, elaborates **verbatim**.

**Declarations.**
- Exactly one terminal `theorem`, placed **last**. Every other new declaration is a `lemma`.
- No name has a trailing prime.
- No `sorry`, `admit`, `native_decide` or `axiom`. No `decide` in new text. The deprecated
  `Finset.filter_card_add_filter_neg_card_eq_card` is replaced by `Finset.card_filter_add_card_filter_not` in new text.
- `#print axioms` on every new declaration must show exactly `[propext, Classical.choice, Quot.sound]`.

**`THEOREM-CONTRACT.yaml`**, authored fresh (U1's and T2's drafts are not binding-ready). It must contain:
- a namespace-qualified `declaration_name` `E993HighTail.<name>`;
- an `expected_statement`: the exact namespace-relative source text, from `theorem` to just before ` :=`, which must equal
  the §2 text below, with its SHA-256;
- a `definitions:` block by exact `lean_name`. It covers `SimpleGraph.IsBipartite`, `SimpleGraph.indepNum`,
  `SimpleGraph.IsTree` where used, `Finset.univ`, and every carried `C4LA1.*`, `C5LA1.*`, `Erdos993G1.*` and
  `E993Interior.taggedFamily` definition. Lemmas, `Nat.sub` and `IsTree.isBipartite` are **not** definitions;
- the ℕ/ℤ equivalence text;
- the hypothesis-consumption table;
- the fences, attribution and excluded conclusions below.

**Workflow.** Registrar carry, informal audit, statement-fidelity review, kernel verification receipt, and an isolated
second read, per group.

**Informal proof of record.** For each group it is the corresponding statement-level proof under
`## Exact established results`.

### C1-LA1 — (TSB), key `E993-BIPARTITE-TAGGED-SHADOW-BOUND`. FUNDED.

**Terminal theorem**, as the §2 text verbatim:

```lean
theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
    (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card
```

- **Hypotheses.**
  - `hBip` is consumed at `Core.card_extension_le`.
  - `hk` is statement scope: it is passed to entry 41, whose body does not use it.
  - `hka` is consumed by `Nat.cast_sub`.
  - ℕ/ℤ note: under `hka`, the ℤ value `α − k` equals the ℕ value `α ∸ k`. The registry and Lean texts agree on
    `1 ≤ k ≤ a`.
- **Carry:** entries **18, 41**.
- **New declarations:**
  - required: the terminal theorem (entry 41 at `U = univ`, `a = H.indepNum`, the cap by
    `SimpleGraph.IsIndepSet.card_le_indepNum`, then `push_cast [Nat.cast_sub hka]`);
  - optional companions: `lemma bipartiteTaggedShadowBoundNat` (the ℕ form without `k ≤ a`) and the all-`k` ℤ lemma
    (S5; C-T1-F, C-T1-U);
  - optional identity companion S1 (C-U1-T's `taggedCount_eq_sub`, which adds entries 1, 10 and 11).
- **Base candidate:** U's adjudicator `awards/LA1` `Main.lean` `d88f6043…`.
- **Fences:** §3.1, §3.4 (this is not `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`), §3.7 and §3.8.
- **Attribution.**
  - Codex (GPT-6 Luna/Sol/Astra): the tagged-shadow mechanism, entry 41 and the proposed statement (Sol's C2 scope audit).
  - First-interior: the definition of entry 18.
  - r29:
    - T1: the registry derivation;
    - C-T1-F and C-T1-U: the `Nat.cast_sub hka` narrowing;
    - U1: the scratch compile;
    - C-U1-T and C-U1-F: carry sets and candidates;
    - U's adjudicator: the base candidate;
    - F1, C-F1-T and C-F1-U: falsification and tightness.
- **Excluded conclusions.**
  - No leaf, tree, selector or aggregate statement.
  - No `k = 0` or `k > a` statement in the terminal theorem (a companion only).
  - No tightness claim.
  - Nothing about non-bipartite graphs (it is false there, B4).
  - No reopening or aliasing of the refuted addability bound.

### C1-LA2 — (HTP), key `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, with (HTA) on its face. FUNDED.

**Terminal theorem**, as the §2 text verbatim, placed last:

```lean
theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0
```

**Companion lemma (HTA)**, as the §2 text verbatim, placed before the terminal theorem:

```lean
lemma bipartiteHighTailAggregateAllRanks {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0
```

- **Hypotheses.**
  - `hBip` is consumed only on the `p ≥ 2` branch, through entry 41 at `U = univ ∖ H_v`, `a = α − 1`.
  - `hv` supplies the support, `H ⊆ R` and `leaf_indep_cap`.
  - `hp` makes the ℕ `p − 1` the integer rank.
  - `hTail` is the guard.
  - There is no selector, residual or connectivity hypothesis.
- **Carry:** entries **1–14, 18, 41, 42**. The CF-S-3 minimum `{1–6, 8–13, 18, 41, 42}` is an admissible registrar
  option. Entry 44 is not needed.
- **New declarations (plan of record: U's adjudicator `awards/LA2` `Main.lean` `87003231…`):**
  - `lemma indepSetCount_zero`, `lemma indepSetCount_one`, `lemma forwardDifferenceDel_zero_eq`;
  - `lemma leafTermAtOne_eq_degSubOne` (S2);
  - `lemma leafEndpointAtOne` (S3, graph-general);
  - `lemma leafHighTailPointwiseAux`;
  - `lemma bipartiteHighTailAggregateAllRanks`;
  - `theorem bipartiteLeafHighTailPointwise`.
- **How the body works.** The `p ≥ 2` branch calls the in-file `private` helpers `E993Interior.Leaf.leaf_term_nonpos`,
  `tagged_count_split`, `H_subset_R` and `tagged_zero_above_leaf_cap`. `hShadow` is discharged by
  `E993Interior.taggedShadowBound G hBip`.
- **Admissible alternative body:** C-T1-U's two-branch split (T's adjudicator, `CarryLA2`), which needs no `p = 1`
  lemmas. **Excluded:** U1's `bipartite_indepNum_one_card_le_two` (`decide`), and C-U1-T's LA2 order and primed names.
- **(HTA) certificate ruling.**
  - (HTA) is Target 2's corollary, and §2 places it on this award's face. Fence §3.8's "own award" clause binds the three
    auxiliary keys, not the run-local (HTA) key.
  - The controller may register `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` as `formally_verified` on C1-LA2's kernel
    receipt if and only if all three of these hold:
    - (i) the `THEOREM-CONTRACT.yaml` lists the companion's exact §2 text and SHA-256 in a companion-statement field;
    - (ii) the fidelity review matches that text against the compiled source;
    - (iii) the receipt's `#print axioms` covers the companion.
  - If the governed workflow cannot bind a companion statement, (HTA) registers VERIFIED at `proved_informal`, noted
    "kernel-checked companion inside C1-LA2, not a separate certificate". Its standalone award then passes to a successor
    (same carry; body ready).
  - Either way, the stop gate is unaffected, because (HTA) is not one of the four targets.
- **Fences:** §3.1, §3.3 (nothing below the guard), §3.4 (not `E993-BETA-TARGET`, whose witnesses fail the guard), §3.7
  and §3.8.
- **Attribution.**
  - Codex (GPT-6 Luna/Sol/Astra): the mechanism, entries 41/42, the proposed statement, the identification of the
    `p = 1` gap, and the bipartite-free endpoint observation.
  - r24 C4-LA1 for the selector and leaf definitions (1–4); r26 for the `C5LA1` layer (5–14); the first-interior source
    for entry 18.
  - r29:
    - T1: the `p = 1` endpoint and the `deg(s) − 1` formula;
    - C-T1-F (A1), C-T1-U (two-branch), C-F1-T (A3), C-F1-U (A3) and U's adjudicator (`leafEndpointAtOne`): the
      bipartite-free endpoint;
    - U1 and the critics: compiles.
- **Excluded conclusions.**
  - No sign below the guard. The guard is sharp (B1).
  - No favorable-selector, eligibility or residual statement.
  - No non-bipartite `p ≥ 2` statement (false, B4). The graph-general `p = 1` companion is a lemma, not a registered claim
    until SR-1.
  - No transfer to `E993-BETA-AGG`, to the all-rank `E993-R23-…`, or to any no-recovery key.
  - No strict sign.

### C1-LA3 — (ELIG), key `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`. FUNDED.

**Terminal theorem**, as the §2 text verbatim:

```lean
theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```

- **Body:** `E993Interior.eligibleAlphaGeSeven G hT hInterior`. This is a **new terminal name applying the carried
  entry 43**, not a byte-identical re-export (C-T1-U; T's adjudicator).
- **Hypotheses.**
  - `hT` enters as follows: connectivity through `hT.card_edgeFinset`; acyclicity through entry 34 in all three `Δ_2`
    branches, and through `card_edgeFinset`.
  - `hInterior` is in ℕ. It is equivalent to the integer hypothesis `x + 2 ≤ α − 2` for **every** `α`: both are false
    when `α < 2`, and they are identical otherwise.
- **Carry (plan of record):** entries **1–17, 19–40, 43**. C-U1-F's `{4, 10–12, 14–17, 19–34, 39, 40, 43}` is a
  registrar option.
- **New declarations:** the terminal theorem only.
- **Base candidate:** U's adjudicator `awards/LA3` `Main.lean` `1ef28389…`.
- **Fences:** §3.1, §3.2 (the first-interior award is unchanged; the relation is a scope note), §3.5, §3.7 and §3.8.
- **Attribution.** Codex (GPT-6): entry 43's proof and the proposed statement. r25: the G1 definitions (15–17, byte-identical
  to the r25 award) and the `Erdos993G1` counting layer as carried in the first-interior source. r29: T1's extraction,
  corrected by C-T1-F, C-T1-U and T's adjudicator; U's adjudicator's recomputation.
- **Excluded conclusions.** No aggregate sign, no statement at any other depth, no no-recovery or unimodality claim, and
  no re-certification of `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`.

### C1-LA4 — (TRN), key `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`. FUNDED.

**Terminal theorem**, as the §2 text verbatim:

```lean
theorem topRankNonResidualAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0
```

- **Hypotheses.**
  - `hT` is consumed only through bipartiteness. Prefer `hT.isAcyclic.isBipartite` (`Acyclic.lean:617`); line 598 is
    admissible if the connectivity routing is recorded.
  - `hEligible` is in ℕ. It is equivalent to the integer hypothesis for every `α` (both are false when `α ≤ 1`).
- **Carry (plan of record, LA4b):** entries **1–14, 18, 41, 42, 44**.
- **New declarations:**
  - `lemma indepSetCount_zero`, `lemma indepSetCount_one`;
  - `lemma forwardDifferenceDel_zero_eq` (`Δ_0 = |V| − 1`, any graph);
  - `lemma indepNum_le_card`, `lemma crossingIndex_negative`;
  - `lemma topRankEligibleAlphaGeFour` (S7);
  - `theorem topRankNonResidualAggregate`.

  The terminal step is `E993Interior.bipartiteHighTailAggregate G (bipartite of hT) (G.indepNum − 1)` at
  `p = α − 1 ≥ 3`.
- **Base candidate:** U's adjudicator `awards/LA4b` `Main.lean` `5457ede8…` (T's adjudicator's `CarryLA4` is equivalent).
  Rename C-U1-T's primed helper if it is reused.
- **Admissible fallback (LA4a):** carry entries 1–44 (or CF-S-3's `{1–6, 8–34, 39–44}`) with U1's `Guard`-helper proof.
  Candidate: U's adjudicator `awards/LA4a` `58029dc9…`, or C-U1-F's `0487f2e8…`.
- **Optional companions:**
  - S8 (`tree_eligible_top_alpha_ge_five`), which adds entries 15–17, 19, 25, 26 and 39;
  - S9 (the bipartite form).

  Neither is needed. Neither becomes a registered claim before its second read.
- **T2 draft-contract repairs (required):**
  - move `Nat.sub`, entry 44 and `IsTree.isBipartite` out of `definitions`;
  - add `C4LA1.vertexDeletionIndepSetCount`, `vertexDeletionForwardDifference`, `IsFavorableAt`, `IsGraphLeaf`,
    `C5LA1.leafSet`, `indepSetsAvoiding` and `indepSetCount`;
  - state the equivalence for every `α`;
  - drop the `Nonempty` dependency from `hyp-tree`;
  - add the attribution below.
- **Fences:** §3.1, §3.2 (r26's award is never re-registered or widened, and r26 stays the proof of record on the
  residual class), §3.3, §3.7 and §3.8.
- **Attribution.**
  - Codex (GPT-6 Astra): the proposed corollary ("supported informally").
  - r26: the `C5LA1` definition layer and the `α ≥ 4` ingredient on the residual class. r24 C4-LA1: the selector and leaf
    definitions.
  - r29:
    - T2: the derivation;
    - C-T2-F and C-T2-U: `α ≥ 5` and the bipartite form;
    - C-T2-U, F's adjudicator and U's adjudicator: the `x ≥ 1` shortening;
    - C-U1-T: the minimal public route;
    - U's adjudicator: the base candidate.
- **Excluded conclusions.**
  - No strict inequality. `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` is untouched, and the census maximum of `−12` is
    bounded only.
  - No other rank.
  - `E993-R23-…` stays OPEN: C1-LA4 closes one rank of it, not the key.
  - No widening of r26.
  - No bipartite or forest statement in the terminal theorem.
  - No `E993-BETA-AGG` transport.

**`no award attempted`:** none. Every group's DAG is closed, and the smallest unproved lemma is none in all four.

## Progress and stop-gate ruling

material_progress: yes
plateau: no

**Material progress.** Entering Cycle 1, three things were missing:
- the `p = 1` endpoint had no proof;
- (TRN) had no derivation at registry scope;
- (TSB), (HTP) and (ELIG) existed only as ungraded compiled-internal lemmas.

Now:
- all five statements are `proved_informal` at registry scope;
- two independent `p = 1` routes exist, one of them graph-general;
- the `α = 4` tightness question is resolved (the minimum is `α = 5`);
- guard sharpness is proved at every `α ≥ 2`, pending a second read;
- admissible single-source award candidates compile for all four groups, with standard axioms, by three independent
  builders.

**Stop gate, per `SOLUTION-CONTRACT.md` §5:**
- **(a) All four targets `formally_verified`.** Not yet: no governed award exists at Stage 6. Every target's mathematics
  is `proved_informal` at the close of Stage 6, and Stage 7 follows with C1-LA1–LA4 all funded.
- **(b) In-scope counterexample.** None. Every witness found lies outside scope: non-bipartite (B4), or at `3p ≤ 2α`
  (B1–B3).
- **Plateau.** Not reached: this cycle made material progress on every target.

**Is a Cycle 2 needed if Stage 7 closes every funded award?** **No.** If C1-LA1, LA2, LA3 and LA4 all close
`formally_verified`, stop-gate event (a) ends the run at Cycle 1's Stage 7 close. The (HTA) certificate route does not
bear on this, because (HTA) is not one of the four targets. The STATED items' second reads (SR-1 to SR-9) are registration
hygiene, not stop-gate conditions. The controller should run them concurrently with Stage 7, as isolated seats, at the
Cycle 1 close.

## Next-cycle portfolio

This portfolio **applies only if Stage 7 does not close every funded award**. A route opens only for a target whose award
blocked, and it carries that award's exact blocked obligation. No mathematical node is open, so every route is a repair
or audit route. Nothing here goes outside the charter, and nothing touches the fenced region `3p < 2α + 1`.

1. **T1 `C2-T-01 BLOCKED-AWARD-MATHEMATICS` (targets TSB, HTP/HTA, ELIG).**
   - Opens only if a Stage 7 informal audit or fidelity review of C1-LA1, LA2 or LA3 returns a **mathematical** finding.
   - Task: re-derive the flagged node at statement level from the Exact established results, and hand the formalizer the
     corrected node.
   - For LA2, the alternative body is C-T1-U's two-branch split, which needs no `p = 1` lemma.
   - Could close in one cycle.
2. **T2 `C2-T-02 TRN-AWARD-REPAIR` (target TRN).**
   - Opens only if C1-LA4 blocks.
   - Task: switch between LA4b (entries 1–14, 18, 41, 42, 44, with a public `Δ_0` lemma) and the fallback LA4a (entries
     1–44, `Guard` helpers).
   - Repair the `IsTree → IsBipartite` citation (`:617` or `:598`, with a note) and the LA4 contract.
   - Could close in one cycle.
3. **F1 `C2-F-01 SECOND-READS-AND-LITERAL-AUDIT` (boundary and fence).**
   - Opens only if any of SR-1 to SR-9 was not completed, or disagreed, at the Cycle 1 close, or if a rebuilt award
     needs a literal audit.
   - Task: isolated re-derivations of the STATED items from their statements alone, plus one instrument on the B3
     minima.
   - For every award rebuilt in Cycle 2, a literal audit of the compiled `expected_statement`, covering:
     - `k ≤ a` and the ℤ cast;
     - `hp : 1 ≤ p` and the ℕ `p − 1`;
     - the ℕ eligibility hypotheses at `α < d`;
     - non-vacuity: the `K_2` endpoint, the order-7 TRN-eligible trees, and the order-9 ELIG-eligible trees.
   - Could close in one cycle.
4. **U1 `C2-U-01 AWARD-MECHANICS-REPAIR` (every target whose award failed on mechanics).**
   - Mechanics means registrar order, names, the carry set, statement binding, companion binding, `declaration_name`, or
     hygiene (`decide`, deprecated lemma, primes).
   - Task: re-bind from U's adjudicator's `awards/LA*` candidates (or C-U1-F's), with one terminal theorem, placed last.
   - For (HTA), this route may also carry the standalone-award option if companion binding was refused.
   - Could close every mechanically blocked award in one cycle.

**If Stage 7 closes every award, this portfolio is moot.** A successor run (not this one) would inherit the following:
- **(a) The exact open region of `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`:**
  - eligible ranks with `x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋`, i.e. depth `α − p ≥ ⌈α/3⌉`. It is nonempty; C-T2-F counted 3,806
    classes to order 16 with a single instrument, which is membership only and was not replayed.
  - The leafwise pointwise route provably stops at the guard (B1). What a successor uses there is outside this charter.
    Astra's lower-region experiment, if it exists, was not read.
- **(b)** A standalone (HTA) award, if the companion binding was refused.
- **(c)** Any second read not completed at close.
- **(d)** The unclaimed strict form `S(T, α − 1) < 0` on the non-residual eligible class. Bounded evidence gives a
  maximum of `−12` to order 18; C-T2-U's reported zero pointwise term was not replayed. It is not a target.
- **(e)** The unchanged program state: `E993-BETA-AGG` needs an ordinary-to-governed bridge that was never attempted, and
  NR1, FOREST, TREE, TRANSFER and Erdős #993 are untouched.

## Registrations

These are made **at the close**, each with grade and attribution on its face, in the order below. "SR-n" marks an item
that is **STATED** and needs an isolated second read before registration.

### Corrections first (records; never edits of sealed text)

| Erratum | Correction | Attribution | Second read |
|---|---|---|---|
| R29-E-a | SEMANTIC-CONTRACT §2: 976 → **987** classes to order 12 | T2; confirmed by C-T2-F, C-T2-U, T's and F's adjudicators, and the synthesis replay | none (controller erratum, multi-instrument) |
| R29-E-b | C1-ALLOCATION 2(e): no `E993-R24-*` key exists; the r24 `C4LA1.topRankSelectorCollapse` is a published Lean package without a claim identity | T2; C-T2-F; C-T2-U | none |
| R29-E-c | SEMANTIC-CONTRACT §2 star form: valid for `p ≥ 2` only; at `p = 1` the term is `m − 1 = deg(s) − 1` | T1; confirmed by every critic and all three adjudicators | none |
| R29-E-d (proposed) | SEMANTIC-CONTRACT §2 (HTP) endpoint narrative: bipartiteness is **sufficient but not needed** at `p = 1` (the guard plus a leaf force `V = {v, s}` on any finite graph) | C-T1-F, C-F1-T, C-F1-U, U's adjudicator; Codex prior art | **SR-1** |

### Target keys (conditional on Stage 7)

1. **`E993-BIPARTITE-TAGGED-SHADOW-BOUND`: OPEN → VERIFIED `formally_verified`**, if and only if C1-LA1 closes.
   - Certificate: the C1-LA1 kernel receipt with `E993HighTail.bipartiteTaggedShadowBound`.
   - Attribution: as on the face.
   - Scope note: "Registry statement at `1 ≤ k ≤ α(H)`. The inequality holds for every `k ≥ 0` (companion, after SR-3)
     and is tight at every `1 ≤ k ≤ a` (after SR-4). Bipartiteness is load-bearing: `K_1 ⊔ K_5` fails without it (after
     SR-9). No status transfer (§3.1, §3.4)."
   - If LA1 does not close: the key stays OPEN, with the evidence note "proved_informal (r29 C1)".
2. **`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`: OPEN → VERIFIED `formally_verified`**, if and only if C1-LA2 closes.
   - Scope note: "Every integer `p ≥ 1`. At `p = 1` the guard forces `G = K_2`, and the term `deg(s) − 1` is `0`
     (bipartiteness not needed there, after SR-1). `α(G − {v, s}) = α(G) − 1` (after SR-2). The guard is sharp on trees
     at every `α ≥ 2` (see the boundary record). Bipartiteness is load-bearing for `p ≥ 2` (after SR-9). The
     `E993-BETA-TARGET` witnesses fail the guard."
   - If LA2 does not close: the key stays OPEN, with the evidence note "proved_informal (r29 C1)".
3. **`E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (new).**
   - Registered `formally_verified` on C1-LA2's receipt under the three companion conditions; otherwise VERIFIED at
     `proved_informal`.
   - Statement: the (HTA) text of `SOLUTION-CONTRACT.md` §1.
   - Relations: proper sub-claim of nothing registered. It **closes the high-tail region** of
     `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` on trees.
   - Fences: §3.1 and §3.3.
   - Attribution: Codex/Astra proposal; r29 T1 and T2.
   - The HTA key and the TRN key were alias-checked lexically and mathematically by T2, and narrowed by both critics:
     no alias.
4. **`E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`: OPEN → VERIFIED `formally_verified`**, if and only if C1-LA3 closes.
   - Scope note: "Guard lemma only. ℕ hypothesis equivalent to the integer one for every `α`. Proof: Codex entry 43
     carried byte-identically under a new terminal name. The first-interior award is unchanged."
   - If LA3 does not close: the key stays OPEN, with the evidence note "proved_informal (r29 C1)".
5. **`E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (new).**
   - Registered VERIFIED `formally_verified` if and only if C1-LA4 closes; otherwise VERIFIED at `proved_informal`
     (its proof chain is route-derived and multiply re-derived, not STATED).
   - Statement: the (TRN) text of `SOLUTION-CONTRACT.md` §1.
   - Relations: `strictly_weaker_hypotheses_than E993-R26-TOP-RANK-RESIDUAL-SIGN` (same conclusion and rank;
     `hAlpha` and (★) dropped); `one_rank_of E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.
   - Fences: it names `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`, and states no strict inequality. It names
     `E993-R26-TOP-RANK-N2-LE-M` (REFUTED, unused).
   - Scope note (after SR-6 and SR-7): "Eligible trees have `α ≥ 5`, so the guard is strict. The conclusion holds on every
     finite bipartite graph under the same ℕ hypothesis. Every leaf is favorable at `p = α − 1` on trees with `α ≥ 2`
     (r24 `C4LA1.topRankSelectorCollapse`), so this is a full-leaf sum."

### Tier 2

6. **`E993-R29-HIGH-TAIL-BOUNDARY-RECORD` (new record)**, registered **after SR-8 and SR-9**.

   | Part | Content | Grade | Attribution |
   |---|---|---|---|
   | B1 | Sharpness at every `α ≥ 2` | `proved_informal` | C-F1-T family A, C-F1-U family B; F's adjudicator |
   | B2 | Largest positive `p` on trees = `⌊2α/3⌋` | `proved_informal` composition with (HTP) | F's adjudicator; composition ruled here |
   | B3 | The minima | `bounded_computation` | F1, C-F1-T, C-F1-U, F's adjudicator |
   | B4 | Hypothesis-necessity witnesses | explicit exact finite | C-T1-F; replayed by T's adjudicator and the synthesis |

   Fence: "a record about the guard's precision; refutes nothing in scope; no step into `3p < 2α + 1`; the unguarded
   statement is already REFUTED as `E993-BETA-TARGET`."

### Tier 3

My judgement: no separate keys. S1–S9 are **not** registered as separate `E993-R29-…` keys. Each is either a companion
lemma on an award face (kernel-checked there) or appears in the scope notes above once its second read passes. None
changes a status.

### Scope notes on inputs (no status change)

7. **`E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`.** "r29 certifies separately the guard (ELIG) and the high-tail aggregate
   (HTA) that compose to this statement (α ≥ 7 puts `p = α − 2` inside `3p ≥ 2α + 1`), under their own awards; this
   award is unchanged, never re-registered, never edited."
8. **`E993-R26-TOP-RANK-RESIDUAL-SIGN`.** "r29 `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` states the same conclusion at
   the same rank with `hAlpha` and (★) dropped, by a different mechanism (tagged shadow). This award remains the proof of
   record on the residual class and is not widened. Its strict companion is untouched."
9. **`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.** "OPEN. r29 (HTA) closes every eligible rank with
   `3p ≥ 2α(T) + 1`, formally upon C1-LA2's companion binding, else at `proved_informal`. That region contains every
   eligible top rank (r29 TRN) and first-interior rank (VERIFIED). The open remainder is exactly the eligible ranks with
   `x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋` (depth `α − p ≥ ⌈α/3⌉`), which is nonempty. The leafwise pointwise sign fails there at some
   leaf of some tree (boundary record)."
10. **`E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`** (optional distinction
    note). "Distinct from the r29 high-tail keys: the registered witnesses fail `3p ≥ 2α + 1`. (TSB) is a size-restricted
    incidence count whose constants `k` and `2(a − k)` are incomparable with the refuted per-set bound."

### Second reads the controller must run (isolated, from the statement alone)

| # | Item |
|---|---|
| SR-1 | S3 and R29-E-d |
| SR-2 | S4 |
| SR-3 | S5 |
| SR-4 | S6 |
| SR-5 | S7 |
| SR-6 | S8 |
| SR-7 | S9 |
| SR-8 | B1, B2 |
| SR-9 | B4 |

These cover CF-S-5 (i)–(viii) in full. Two items stated by this synthesis also need a second read if the controller
reuses them as registry text: the depth restatement of the open region, and family A's closed-form factorisation as I
re-derived it. The five target proofs are route-derived, so they need no STATED second read. Each award's own isolated
second read belongs to its Stage 7 workflow.

## Continuation ruling

headline_resolved: no
continue: yes

**The headline is not resolved.** It requires governed formal awards of all four targets, and none exists at Stage 6.

**Continuation.**
- Stage 7 of Cycle 1 funds **C1-LA1, C1-LA2 (with the (HTA) companion), C1-LA3 and C1-LA4**, all as full awards.
- If all four close `formally_verified`, stop-gate event (a) **ends the run at Cycle 1**, and the Cycle 2 portfolio is
  moot.
- The continuation flag is set because Cycle 2 runs if, and only if, some funded award blocks. In that case only the
  routes of `## Next-cycle portfolio` matching the blocked targets open.
- No decisive event (b) and no plateau was found.

**Close obligations** (process; not stop-gate conditions):
- the second reads SR-1 to SR-9, run concurrently with Stage 7;
- the errata R29-E-a to R29-E-d;
- the scope notes 7–10.

## Artifact inventory

I wrote only this file and scratch under `scratchpad/c1-S/` (run-root relative; SHA-256):

| File | SHA-256 | Role |
|---|---|---|
| `scratchpad/c1-S/seal.py` | `9f3c1d75bef2fcb44173dfb5f5ac1a36d1fe76558fb67ce919984ac3fd52d850` | dispatch-seal and member-digest check |
| `scratchpad/c1-S/F.md` | `3a68fa7be8d07a5741aa343de5e8e7868ae4f26557928f02f1e41adf3cb6721d` | byte copy of the F adjudication, for reading |
| `scratchpad/c1-S/U.md` | `c9b6a38c176a3b38fe1b7b16aa85e342a8a81478d1f058fe07e79ee6bf9e3c9e` | byte copy of the U adjudication, for reading |
| `scratchpad/c1-S/synth_check.py` | `73288e12adf4ae1b785f31ea76cfb15d01fd3438c577c2cf3e23b3f499f42859` | neutral spot-check instrument (stdlib, exact integers; subset enumeration with deletion as avoidance on the original carrier; 2-colouring test; free trees by leaf augmentation with a centre-rooted AHU canonical form, A000055 matched to order 13) |
| `scratchpad/c1-S/synth_check.out.json` | `5d37e8fd6172c3fad0a750a773f0922bc2d88f4c7d267c3d170a918fd6835af0` (inner digest `ad79b94f…033b`) | output; its contents are listed below |
| `scratchpad/c1-S/synth_check_perorder.py` | `69856bce133643fb8a81982b8d5ca918c2eb635fde35f629aee5f4d1bb6cd8eb` | cumulative eligible counts per order (361 and 846 through order 12; 1,339 and 2,147 through order 13) |

The output file `synth_check.out.json` records:
- families A and B checked against their closed forms (77 and 91 checks);
- the B4 witnesses;
- 21 `mK_2` equalities;
- labelled graphs of order ≤ 6:
  - 32,110 `p = 1` rows;
  - the guarded `p = 1` case fires twice, both `K_2`;
  - 32,110 `α`-drop equalities;
  - 31,876 HTP rows and 14,252 HTA rows;
  - 91 top-eligible graphs, minimum `α` 5;
- free trees to order 13: ELIG-eligible 1,339 (minimum `α` 7), TRN-eligible 2,147 (minimum `α` 5, maximum `S = −12`),
  and the largest positive `p` per `α`;
- 0 failures throughout.

**Background jobs.** None were launched. Every script ran in the foreground and exited before this write, so nothing
needed killing.

**Final check.** I reread this file before close for:
- the twelve headings, in order;
- the four flag lines, each exactly once;
- the two-part model disclosure;
- the absence of any literal filesystem path outside the run root.
