# Orientation Adjudication

Adjudicator: Stage 5, orientation U (formal / structural), Cycle 1 of r29 (Erdős #993: certify the uniform high-tail
mechanism and its non-residual top-rank consequence). Portfolio: the return of seat `U1` (route `C1-U-01
LEAN-EXTRACTION-SKELETON`) and its two cross-orientation critiques, `C-U1-T` and `C-U1-F`.

**VerityOS boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness put the root
`CLAUDE.md` and the memory index into my context; I did not use either, and I opened no memory, conversation, module,
skill, log or decision file. For the task I loaded the sealed dispatch `control/dispatch/c1-stage5/DISPATCH-ADJ-U.md`, the
protocol `control/C1-ADJUDICATOR-PROTOCOL.md`, the capsule `control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json` with
all 18 of its members, the portfolio's inventoried scratch (copied out before any replay), frozen files under
`sources/`, and Mathlib source lines in the pinned shared package. Per the dispatch I did not start conversation logging.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Capsule seal.** I recomputed the SHA-256 of the canonical JSON of `U-PACKET-MANIFEST.json` with `seal_sha256`
removed (`sort_keys`, separators `(",",":")`, no trailing newline):
`e3897a7e2808c21db1e9edcbedc5f795b445297992fb1ee3cccab77d22e50444`. That equals the declared seal and the value in the
dispatch. **Capsule seal verified.**

**Capsule members.** All 18 members match on SHA-256 and byte count. They include:
- `RETURN.md` of U1: `e620a26f…`, 43,484 B.
- `critics/U1/T/CRITIQUE.md`: `a0f9a070…`, 24,431 B.
- `critics/U1/F/CRITIQUE.md`: `a0faedc3…`, 24,388 B.
- `C1-STAGE5-CONTROLLER-FACTS-U.json`: `6a4b704e…`.
- `PATH-CHECK-U.json`: 0 findings.

**Packet seals, recomputed the same way.**

| Manifest | Seal | Result |
|---|---|---|
| Stage 2 `C1-STAGE2-PACKET-MANIFEST.json` (169 files) | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | verified |
| Stage 3 `C1-STAGE3-PACKET-MANIFEST.json` (22 files) | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | verified |
| Stage 4 `C1-STAGE4-PACKET-MANIFEST.json` (36 files) | `f5a61035a30eb80affc2dcd3bbbf7333ccfc14d6586e96ffef87fecea7fd0386` | verified |

- **Admission.** Stage 3 admitted 4 of 4 returns, with U1 at `e620a26f…`, the value above. Stage 4 admitted 8 of 8
  critiques, with both U1 critiques at the digests above, `C-U1-T` and `C-U1-F` both `retained_narrowed`.
- **Frozen sources.** All 149 entries of `control/SOURCE-DIGESTS.json` match. For the Lean work that covers
  `Main.lean` `8d864da290947d75…` (61,296 B), all 45 `Snippets/*.fragment` files, the four project files, and
  `CANDIDATE-PROOF.md` `cc9fa001…`.
- **Mathlib pin.** The shared checkout's `git rev-parse HEAD` is `905b95818eb32af7874a58b427f50c1711a5e96c`, equal to
  `PIN.json`. The toolchain is `leanprover/lean4:v4.32.2`.
- **Registry state.** I checked it from the sealed contracts and gate rather than the registry itself.
  - (TSB), (HTP) and (ELIG) are OPEN with `formal_award: false`.
  - (HTA) and (TRN) are run-local candidates.
  - `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` and `E993-R26-TOP-RANK-RESIDUAL-SIGN` are VERIFIED inputs.
  - Nothing in this portfolio proposes a registration.

**Read-boundary disclosures (mine).**
1. **U1's replay directory.** U1's inventoried scratch is split between `scratchpad/c1-U1/` (the literal grant) and
   `scratchpad/c1-U1-replay/`, which the return names as its replay bundle. The controller's CF-U-1 and `C-U1-F` used
   the same directory. I copied its five files out by exact name and replayed only from the copies.
2. **Non-member digest.** While verifying `SOURCE-DIGESTS.json` I hashed `control/CLAIM-IDENTITY.run-local.json`, which
   is not a capsule member. I computed its digest only and read none of its content.
3. **Directory listings.** My listings were non-recursive `ls` calls on granted directories only: `c1-U1/`,
   `c1-U1-replay/`, `c1-crit-U1-T/`, `c1-crit-U1-F/` and their named subdirectories, plus my own scratch.
4. **Searches and processes.** I ran no `find`, `grep -r` or `rg` above my grant. I used no network and installed
   nothing. Every `lake`/`lean` call ran after a `cd` into a pinned project under my scratch. I started no background
   job.

## Route-by-route decisions

There is one route, `C1-U-01` (U1). Its verdict of record is **retained_narrowed**: a correct, replayed, sorry-free
compile of all five §2 statements, with the narrowings below.

**My replays, weighed above the seat's self-report.**
- **U1's bundle.** I copied it out and ran `replay.sh` into `scratchpad/c1-adj-U/u1-replay/`.
  - The assembled `Main.lean` is `9fa0ffdd69f74cf2…` (70,523 B). It equals the frozen `Main.lean` followed by the append
    `f3b89bbf…`, byte for byte.
  - `lake build` succeeded with 8657 jobs.
  - The axiom output `11ea513c…` reproduced byte for byte.
- **Axioms on all ten.** I ran `#print axioms` on **all ten** U1 declarations (`u1-all10-axioms.txt`, `7ca5ceb5…`). Each
  shows exactly `[propext, Classical.choice, Quot.sound]`.
- **Fixed points.** The payload `a557df48…` reproduced from my copy of U1's script.

**Claims retained.**
- The byte-identical carry of entries 1–45.
- All five §2 statements proved, with no `sorry`, `admit`, `native_decide` or `axiom`.
- The `p = 1` endpoint proved.
- The `p ≥ 2` branch routed through entry 42's `Leaf.leaf_term_nonpos`, fed by entry 41's ℕ form exactly as entry 44
  does. There is no circularity through the new ℤ lemma.
- Private helpers are callable from the same file.
- No grade change claimed.

**Claims narrowed or struck.** Details are in `## Cross-route reconciliation`.
1. The **"preferred" cross-award import plan and the three LA3 public restatements are withdrawn**. The verifier admits
   a single source importing only Mathlib (CF-U-3; both critics). Wholesale single-file carry is the only admissible
   plan.
2. **Declaration keywords.** U1 declared all ten declarations as `theorem`. Every non-terminal one must be a `lemma`.
3. **Statement text.** U1's `bipartiteTaggedShadowBound` does not match the contract text: it writes
   `E993Interior.taggedFamily` twice where the contract has `taggedFamily`. Its `bipartiteLeafHighTailPointwise`
   differs only in line breaks. My comparator (`stmt_compare_adj.out`) confirms both. The meaning is unchanged:
   `C-U1-F` proved the elaborated types `rfl`-equal.
4. **Draft contracts not binding-ready.** The drafts lack `definitions:` blocks, namespace-qualified
   `declaration_name`s, the ℕ/ℤ equivalence text, fences and attribution.
5. **Counts and evidence.**
   - "nine declarations" and "six new declarations" become **ten**.
   - "independently reproduced" is struck: the replay is the seat's own script.
   - The `lemma` "Correction verified" build shipped no artifact. It is struck as evidence; the substance is now
     backed by three compiled candidates.
6. **Hypothesis narrative.**
   - "`hT` enters TRN three times" describes U1's proof, not a necessity.
   - "`hv` forces `α ≥ 1`" is wrong: any singleton is independent.
   - "`hBip` enters the `p = 1` branch" is overstated. It is **not needed at all** there (my correction, below).
7. **U1's `bipartite_indepNum_one_card_le_two`** contains `by decide` over `Fin 2`. It should not travel into an award.
   It is unnecessary under my endpoint proof, and both critics replaced it.

## Cross-route reconciliation

The paired critics disagree or diverge on the claims below. I resolved each one separately, using replays; I did not
average verdicts.

| # | Claim | `C-U1-T` | `C-U1-F` | My replay | Ruling |
|---|---|---|---|---|---|
| 1 | Number of new declarations in U1's append | ten | "nine" | `grep` finds **10** (lines 12–181 of the append). `C-U1-F`'s own `critic-check-output.txt` prints ten axiom lines. | **T is right.** F's "nine" is a miscount in its prose; its shipped evidence covers ten. |
| 2 | Pinned Mathlib `file:line` citations | backed, each line read | "not verified; unaudited" | I read `Clique.lean:991`, `Bipartite.lean:286`, `Acyclic.lean:598` and `:617`, and `Card.lean:643` at `905b9581`. | **Backed** by T's read and my spot check. F's "unaudited" is superseded. |
| 3 | Minimal LA4 carry | {1–14, 18, 41, 42, 44}, with a new `Δ_0` lemma replacing entry 43 | {1–6, 8–34 without 35–38, 39–44}, keeping U1's `Guard`-based proof | Both compile. My LA4b (T's set, my own proof) and LA4a (the plan of record: every entry 1–44) compile with the three axioms. | **No contradiction.** The two answers belong to two different proofs. T's set is the global minimum and removes entry 43 and the whole G1 chain from the TRN award. I recommend it (see `## Lean readiness`). |
| 4 | Minimal LA3 carry | {1–17, 19–40, 43} | {4, 10–12, 14–17, 19–34, 39, 40, 43}. Entries 35–38 are unused; one `C4LA1` entry is needed only so the `open` lines of entries 10–14 resolve. | Both compile (I rebuilt F's). | Both are admissible. I rule **{1–17, 19–40, 43} as the plan of record**, which keeps the definition layer of record whole (contract §2). F's minimal set is a registrar option, not a requirement. |
| 5 | Where bipartiteness enters the `p = 1` endpoint | "only here, and only locally": two neighbours of `s` share a colour | agrees with U1: colour classes give `|V| ≤ 2` | My Lean lemma `leafEndpointAtOne` proves the term is `0` on **any** finite simple graph with an original leaf and `α(G) ≤ 1`, with no `IsBipartite`. It compiles with the three axioms. | **Both narrowed.** Bipartiteness is sufficient but not needed at `p = 1` (see the strongest correction below). |
| 6 | LA2 ordering | terminal `theorem` placed **before** `lemma bipartiteHighTailAggregateAllRanks` | the terminal theorem must be last, so use an auxiliary lemma | My LA2 and F's LA2 put the terminal theorem last and compile. T's LA2 compiles but has the terminal theorem before the companion. | **F is right** under the carry rule of record ("terminal theorem last"; first-interior precedent: entry 45 is last). T's LA2 order must be changed. |
| 7 | Registrar name hygiene of the critics' candidates | — | — | T's `helpers.lean`, `LA2full.lean` and `LA4full.lean` declare `lemma support_adj'`. **The registrar name regex rejects a trailing prime** (allocation). My and F's candidates have no primed names. | **A new narrowing of `C-U1-T`'s candidates.** They must be renamed before any registrar use. This does not affect their mathematics. |
| 8 | "independently reproduced" (U1) | backed | struck: it is the seat's own script | — | **F is right.** The independent evidence is the two critics' rebuilds and mine. |
| 9 | U1's `lemma` keyword test build | backed; no digest; superseded by `U1mod.lean` | unbacked as shipped | I rebuilt `U1mod.lean` (`f071a674…`): ten declarations, three axioms. | **Struck as shipped evidence.** The substance is backed by `U1mod` and by my LA2 and F's LA2. |
| 10 | Grade | "`proved_informal`-level confidence plus a working formal skeleton" | "complete at `proved_informal`, kernel-checked scratch" | — | The two agree in substance. **Every registry status stays OPEN or run-local** until each award's own close (fence §3.8). |
| 11 | HTP/HTA check counts | 44,074 HTP; 19,856 HTA | 59,530 HTP (bipartite, orders 1–6) | My instrument counts 31,876 HTP and 14,252 HTA with `p ≤ α + 1`. With `p ≤ n + 1` it reproduces **exactly F's 59,530**. | Counts reconciled for F. They differ only in the `p` range, and above the relevant layer the terms are identically `0`. T's range is unstated and not reconciled. This is not load-bearing: it is `bounded_computation`, a prior. |

**Agreed findings, confirmed by my replay:**
- TSB was checked 1,235,654 times with 0 failures. That is identical across `C-U1-T`, `C-U1-F` and my instrument
  (`a47673b4…`).
- The `p = 1` identity `term = deg(s) − 1` holds on all 32,110 labelled graphs with a leaf of order ≤ 6, with 0
  failures, in all three instruments.
- The keyword, lint and `decide` hygiene items.
- The SEMANTIC-CONTRACT star erratum at `p = 1` (R29-E-c, CF-U-star): the term is `m − 1`, not `m − 2`. It lies outside
  the guard and refutes nothing.

**The strongest correction (adjudicator-derived).** The `p = 1` endpoint of (HTP) does not consume `IsBipartite`.
- **Argument.** Let `v` be an original leaf with support `s`. For any `w ∈ N(s) ∖ {v}`, `w ≠ s`, so `v` is not adjacent
  to `w`, because `s` is `v`'s only neighbour (`Leaf.support_unique`). Then `{v, w}` is an independent 2-set, so
  `α ≥ 2`. The guard at `p = 1` gives `α ≤ 1`, so no such `w` exists.
- **Consequence.** `N(s) = {v}`, `deg s = 1`, and the term `deg(s) − 1 = 0` by U1's general formula.
- **Lean evidence.** `E993HighTail.leafEndpointAtOne` in my LA2 has no `hBip` binder and prints the three axioms.
- **Registered statement unchanged.** On (HTP)'s face `IsBipartite` is consumed only by the `p ≥ 2` branch, through
  entry 41's colour-class extension bound.
- **Attribution.** Codex's frozen `CANDIDATE-PROOF.md` ("Broader endpoint check": `α(H) ≤ 0`, so `H` is empty) already
  argues the endpoint without bipartiteness. The bipartite-free **compiled** lemma, and the correction of the
  U1/`C-U1-T`/SEMANTIC-CONTRACT narrative about where bipartiteness enters, are adjudicator-derived and STATED at a
  review stage.

## Established results

Grades follow SOLUTION-CONTRACT §4. "Kernel-checked scratch" means a sorry-free compile with only the three permitted
axioms, replayed by me. It is **not** `formally_verified`, and **no registry status changes**.

**Exact theorems at the §2 statements, with the hypotheses each proof consumes.**

| Target | Statement (§2, byte-exact in my candidates) | Hypotheses consumed | Evidence |
|---|---|---|---|
| (TSB) `bipartiteTaggedShadowBound` | `k·q_{k+1} ≤ 2(α(H) − k)·q_k` in ℤ | `Fintype`/`DecidableEq` (finiteness). `IsBipartite` only in entry 41's `card_extension_le` (both colour classes of the addable set adjoin `A`). `k ≤ α(H)` only in `Nat.cast_sub` (the ℤ cast). **`1 ≤ k` is not consumed**: the linter flags `hk` in entry 41 as unreferenced, and at `k = 0` the left side is `0`. It remains a statement-scope hypothesis of record. | U1, `C-U1-T` LA1/LA1c, `C-U1-F` LA1, my LA1 (all compiled) |
| (HTP) `bipartiteLeafHighTailPointwise` | term `≤ 0` at every `p ≥ 1` under `2α + 1 ≤ 3p` | For `p ≥ 2`: `IsGraphLeaf` (support, `H ⊆ R`, `leaf_indep_cap`: `α(H_v) ≤ α − 1`), `IsBipartite` (through entry 41 at the `U`-relative cap `U = univ ∖ H_v`, `a = α − 1`), and the guard (`2(α − 1 − k) ≤ k` with `k = p − 1 ≥ 1`). For `p = 1`: the guard (`α ≤ 1`) and `IsGraphLeaf` only. `p ≥ 1` makes `p − 1` the integer rank. | three compiled `p = 1` proofs: U1's (`|V| ≤ 2`), `C-U1-T`'s (colours), mine (leaf only) |
| (HTA) `bipartiteHighTailAggregateAllRanks` | `S(G, p) ≤ 0`, every `p ≥ 1`, guarded | HTP's hypotheses, summed over the favorable filter of `leafSet` (`Finset.sum_nonpos`). No selector, residual or connectivity hypothesis. | all three candidate sets |
| (ELIG) `interiorEligibilityAlphaGeSeven` | `x + 2 ≤ α − 2` (ℕ) ⇒ `7 ≤ α` | `IsTree`: both connectivity and acyclicity through `hT.card_edgeFinset` (`n − 1` edges) in `order_ge_alpha_succ` and `delta_one_nonneg`; acyclicity separately through `hT.isAcyclic` in the triple-incidence identity (entry 34). The ℕ hypothesis equals the integer hypothesis for every `α`: for `α < 2` both are false. | entry-43 re-export (every candidate) |
| (TRN) `topRankNonResidualAggregate` | `x + 2 ≤ α − 1` (ℕ) ⇒ `S(T, α − 1) ≤ 0` | Under the minimal proof (LA4b, mine and `C-U1-T`'s), `IsTree` is consumed **only** through `hT.isBipartite`. Eligibility forces `α ≥ 4` on any finite graph, because `Δ_0 = |V| − 1 ≥ α − 1`. Then `3(α − 1) ≥ 2α + 1` and entry 44 applies. Under U1's proof (LA4a), `hT` also enters `order_ge_alpha_succ`. The ℕ hypothesis equals the integer one for every `α`. | LA4a and LA4b (mine); `C-U1-F` LA4; `C-U1-T` LA4 |

**Recomputed numbers in the (ELIG) proof** (from entry 43 and Codex's frozen candidate §1). With `i_2 = C(n, 2) − (n − 1)`:
- `Δ_1 = C(n − 1, 2) − n`, which is `4` at `n = 6`.
- `i_3 = C(n, 3) − (n − 1)(n − 2) + D`, so `Δ_2 = (n − 1)(n − 2)(n − 9)/6 + D`. I checked this identity algebraically:
  `n(n − 1)(n − 5)/6 − (n − 1)(n − 3) = (n − 1)(n² − 11n + 18)/6`.
- At `n = 7`: `−10 + D` with `D ≥ C(6, 2) = 15`.
- At `n = 8`: `−7 + D` with `D ≥ C(3, 2) + C(4, 2) = 9`.

**Compiled companion lemmas (context on an award's face, not separately awarded).**
- In U1 and my LA2: `indepSetCount_zero`, `indepSetCount_one`, `forwardDifferenceDel_zero_eq` (`Δ_0(G − D) = |V| − |D| − 1`
  on any graph), and `leafTermAtOne_eq_degSubOne` (the `p = 1` term is `deg(s) − 1` on any graph with a leaf, so the
  endpoint is true only because the guard forces `K_2`).
- `bipartiteTaggedShadowBoundNat`, the ℕ form without `k ≤ a` (`C-U1-T` and mine).
- **Critic-attributed (`C-U1-T`):** `taggedCount_add_avoiding` / `taggedCount_eq_sub`, the identity
  `q_j = i_j(H) − i_j(H − W)`. It was proved fresh, costs entries 1, 10 and 11, and I rebuilt it.

**Critic-attributed or adjudicator-derived statements (STATED; an isolated second read is needed before any Tier-3
registration; none is proposed here):**
- **(a) `C-U1-T`:** the (TRN) conclusion for **every finite bipartite graph** (`bipartiteTopRankNonResidualAggregate`).
  I rebuilt it: three axioms.
  - Bounded non-vacuity: my instrument confirms 91 eligible bipartite labelled graphs of order ≤ 6, all non-trees, 0
    failures.
  - Through `IsAcyclic.isBipartite` (`Acyclic.lean:617`), the forest form follows at once.
- **(b) Adjudicator:** `topRankEligibleAlphaGeFour`. The ℕ top-rank eligibility forces `α ≥ 4` on **any** finite simple
  graph. Bounded check: 91 of 33,867 labelled graphs of order ≤ 6 are eligible, and all have `α ≥ 4`.
- **(c) Adjudicator:** `leafEndpointAtOne`, the bipartite-free `p = 1` endpoint (above).

**Bounded computations (priors, `bounded_computation`).** My instrument (`adj_instrument.py`, payload `a47673b4…`) covers
all 33,867 labelled graphs of order ≤ 6, of which 5,604 are bipartite, and finds no failure of TSB, HTP, HTA or the `p = 1`
formula. Both critics' tree censuses reproduced A000055 to order 12 (`C-U1-T`) and 13 (`C-U1-F`), with 0 failures of
ELIG and TRN. Those are critic counts; I did not re-run them.

**Refuted steps.** None. No counterexample to any target has been found or claimed.

**Record corrections.**
- U1's declaration counts.
- U1's "independently".
- U1's hypothesis narrative (items 6 and 7 above).
- `C-U1-F`'s "nine".
- `C-U1-T`'s LA2 ordering and its primed name.
- The SEMANTIC-CONTRACT `p = 1` narrative about where bipartiteness enters.
- The star erratum (already R29-E-c).

**Open bridges.** None inside this run's scope. The fences hold:
- Nothing transfers to any no-recovery claim, `E993-BETA-AGG`, TREE/FOREST, the lower region `3p < 2α + 1`, or Erdős #993.
- The two existing awards are inputs only. In my candidates entry 45 is never carried, and in U1's scratch it is carried
  byte-identically as a control.

## Rejected and narrowed mechanisms

- **Rejected: the cross-award import plan.** U1's "preferred" LA4 imports LA2 and LA3 `.olean`s. It is inadmissible
  because the kernel verifier admits a single source importing only Mathlib (CF-U-3; both critics). The LA3 "public
  restatements" `interiorOrderGeAlphaSucc`, `interiorDeltaZeroNonneg` and `interiorCrossingNegative` exist only for that
  plan and are withdrawn.
- **Narrowed: LA4's dependence on entry 43.** Carrying the `Guard` block and the G1 chain into the TRN award is
  admissible but unnecessary. The `α = 3` exclusion needs only `Δ_0(G) = |V| − 1` and `|V| ≥ α`, and both are proved
  in-file.
- **Narrowed: the claim that the registry-form (TSB) is the mechanism node of (HTP).** It is not. (HTP) uses entry 41 at
  the **`U`-relative** cap `U = univ ∖ H_v`, `a = α(G) − 1`, because deletion is realised by avoidance on the original
  carrier. So LA2 needs entry 41, not LA1's terminal statement, and the award groups are independent.
- **Narrowed: `bipartite_indepNum_one_card_le_two`.** It is correct but superfluous. It carries a literal `decide` on
  `Fin 2` and should be omitted from LA2, or rewritten without `decide`.
- **Refuted: nothing.** The boundary witness `P_3 ⊔ K_2` (term `+1` at `3p = 2α`, reported by `C-U1-F` and the prior)
  is a Tier-2 record about the guard's precision. It belongs to F's portfolio and refutes nothing in scope (fence §3.3).

## Lean readiness

**Ruling: all four award groups in orientation U are contract-ready.** Each has:
- (a) a complete statement-level proof with a closed dependency DAG at registry scope, including the `p = 1` endpoint
  and the `k ≤ a`/ℤ form;
- (b) every DAG node compiled sorry-free in an **admissible single-source file** (`import Mathlib` only), carrying the
  first-interior fragments byte-identically. My `carry_check.out` verifies every carried block against its frozen
  fragment and header digest, in all 14 candidate files: mine, `C-U1-F`'s and `C-U1-T`'s. The terminal statement equals
  the §2 text **byte for byte**, and `#print axioms` shows exactly `[propext, Classical.choice, Quot.sound]` on every
  new declaration;
- (c) **no open node.** The smallest unproved lemma is **none**. What remains is procedural: the governed workflow.

Informal DAG nodes (N·) are read against the carried Lean. I read entries 41–44 line by line.

**LA1: `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB).**
- Terminal: `theorem E993HighTail.bipartiteTaggedShadowBound`, text = §2 (contract-statement SHA-256 prefix
  `87b98c294ccee3aa`).
- Hypotheses: `hBip : H.IsBipartite`; `hk : 1 ≤ k` (statement scope; unconsumed); `hka : k ≤ H.indepNum`. The ℕ/ℤ note:
  `hka` makes the ℤ `α − k` equal the ℕ one.
- DAG:
  - N1 `tagged_deletions_lower`: each tagged `(k+1)`-set has at least `k` tag-preserving deletions.
  - N2 `card_extension_le`: the addable set `E` satisfies `|E| ≤ 2(a − |A|)`, because each colour class of `E` together
    with `A` is independent. **Bipartite here only.**
  - N3 `tagged_extensions_upper`: the injection `B ↦ B ∖ A`.
  - N4 `taggedShadowBound`: the double count.
  - N5 registry specialisation: `U = univ`, cap from `IsIndepSet.card_le_indepNum`, then the ℤ cast.
- Carried: entry 18 `taggedFamily` (`cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e`) and entry 41
  `taggedShadowBound` with its `Core` helpers (`50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f`).
- New: `lemma bipartiteTaggedShadowBoundNat` (optional companion), then the terminal theorem.
- Optional identity companion (critic-attributed, `C-U1-T`): `taggedCount_eq_sub`, at the cost of carrying entries 1
  (`7e0a588e…`), 10 (`ac0e331e…`) and 11 (`e22635d8…`).
- Adjudicator candidate: `awards/LA1` `Main.lean` `d88f6043e9b8e158…`.

**LA2: `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP), with (HTA) on its face.**
- Terminal: `theorem E993HighTail.bipartiteLeafHighTailPointwise` (`805b158547459c55`), **last** in the file.
- Companion: `lemma bipartiteHighTailAggregateAllRanks` (`752a355bfd0e80bc`), placed before it through
  `lemma leafHighTailPointwiseAux`.
- Hypotheses: `hBip`; `hv : C4LA1.IsGraphLeaf G v`; `hp : 1 ≤ p` (so `p − 1` is the integer rank); `hTail`.
- DAG:
  - N1 `H ⊆ R`.
  - N2 `tagged_count_split`: `q = i(H) − i(H − W)`.
  - N3 `leaf_indep_cap`: `α(H_v) ≤ α − 1`.
  - N4 zero above the cap.
  - N5 `leaf_tagged_monotone`: the guard gives `2(α − 1 − k) ≤ k`, then entry 41 at `U = univ ∖ H_v`.
  - N6 `leaf_term_nonpos` (`p ≥ 2`).
  - N7 `p = 1`: `leafTermAtOne_eq_degSubOne` plus `leafEndpointAtOne` (no bipartiteness).
  - N8 `Finset.sum_nonpos`.
- Carried: entries 1–14 (the `C4LA1`/`C5LA1` layer) and 18, plus 41 and 42 `highTailAggregateFromShadow` with its
  `Leaf` helpers (`972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d`).
- New, all `lemma` except the last: `indepSetCount_zero`, `indepSetCount_one`, `forwardDifferenceDel_zero_eq`,
  `leafTermAtOne_eq_degSubOne`, `leafEndpointAtOne`, `leafHighTailPointwiseAux`, `bipartiteHighTailAggregateAllRanks`,
  then the terminal theorem.
- Adjudicator candidate: `awards/LA2` `Main.lean` `8700323190cb4a14…`. `C-U1-F`'s `a04c15c6…` is equivalent (it uses
  U1's `|V| ≤ 2` endpoint without `decide`).

**LA3: `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG).**
- Terminal: `theorem E993HighTail.interiorEligibilityAlphaGeSeven` (`16f7270f20ee1f59`), a keyword re-export of entry
  43.
- Hypotheses: `hT : G.IsTree` (connectivity and acyclicity as recorded above); `hInterior` (ℕ). The ℕ/ℤ equivalence
  text: false for `α < 2`, equal to the integer hypothesis otherwise.
- DAG:
  - N1 `n ≥ α + 1`.
  - N2 `Δ_0 = n − 1 ≥ 0`, which excludes `α = 4`.
  - N3 `Δ_1 = C(n − 1, 2) − n ≥ 0` for `n ≥ 6`, which excludes `α = 5`.
  - N4 `Δ_2 ≥ 0` for `n ≥ 9` by inclusion–exclusion.
  - N5 the `n ∈ {7, 8}` cover bounds (`D ≥ 15`, `D ≥ 9`), which exclude `α = 6`.
  - N6 `Nat.find` descent at `x`.
- Carried (plan of record): entries 1–17, 19–40, and 43 with its `Guard` helpers
  (`dbd200bd15cf7cf8ce2516587fb25491dbddad2b171a079bda87b92258c32b06`). `C-U1-F`'s smaller set (without 1–3, 5–9, 13 and
  35–38) is a registrar option.
- New: the terminal theorem only.
- Adjudicator candidate: `awards/LA3` `Main.lean` `1ef28389c46e148a…`.

**LA4: `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN).**
- Terminal: `theorem E993HighTail.topRankNonResidualAggregate` (`b21887c09fcf9d7c`).
- Hypotheses: `hT : G.IsTree`, consumed only through `IsTree.isBipartite` (`Acyclic.lean:598`) in the recommended proof;
  `hEligible` (ℕ; the equivalence text as for ELIG, with `d = 1`).
- DAG:
  - N1 `α ≥ 3` by arithmetic.
  - N2 `α ≠ 3`: `x = 0` would need `Δ_0(G) < 0`, but `Δ_0 = |V| − 1 ≥ α − 1 ≥ 2`.
  - N3 `3(α − 1) ≥ 2α + 1`.
  - N4 entry 44 at `p = α − 1 ≥ 3` with `hT.isBipartite`.
- **Recommended carry (LA4b): entries 1–14, 18, 41, 42, and 44** `bipartiteHighTailAggregate`
  (`b7ee9d1adcac58675ea4216906ca944049df3f3be12873c4996cb23fe4dc3b93`).
  - New: `indepSetCount_zero`, `indepSetCount_one`, `forwardDifferenceDel_zero_eq`, `indepNum_le_card`,
    `crossingIndex_negative`, `topRankEligibleAlphaGeFour`, then the terminal theorem.
  - Candidate `awards/LA4b` `Main.lean` `5457ede803a03fc9…`.
  - Why: the TRN certificate then does not carry entry 43 (ELIG's internal lemma) or the G1 chain.
- **Admissible fallback, the CF-U-3 plan of record (LA4a): entries 1–44.** It uses U1's `Guard`-helper proof.
  - Candidate `awards/LA4a` `Main.lean` `58029dc90c8adead…`.
  - `C-U1-F`'s `0487f2e8…` is the same proof on a smaller set.
- The synthesis chooses. Both compile.

**Conditions every award must meet** (from `C-U1-T` F7 and `C-U1-F` F-2, which I confirmed):
- **Contract fields.** Each `THEOREM-CONTRACT.yaml` must have:
  - a namespace-qualified `declaration_name` `E993HighTail.<name>`;
  - an `expected_statement` equal to the §2 text, with its SHA-256;
  - a `definitions:` block by exact `lean_name`, including `SimpleGraph.IsBipartite`, `SimpleGraph.indepNum` and the
    `C4LA1`/`C5LA1`/`taggedFamily` layer;
  - the ℕ/ℤ equivalence text;
  - fences §3.1, §3.4 and §3.8;
  - the attribution line (§3.7).
- **Source rules.** One terminal `theorem`, placed last. No name with a trailing prime. No literal `decide`.
- **Workflow.** Informal audit, fidelity review, kernel receipt, and an isolated second read.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Entering Cycle 1 the three auxiliary keys were "OPEN, proposal only", and (HTA) and (TRN) existed as no declaration
anywhere. This cycle's U portfolio, replayed by me, adds the following:
- **Compiled statements.** All five §2 statements are compiled at the exact contract text, in admissible single-source
  award files, by three independent builders.
- **The `p = 1` endpoint.** It is new informal-to-formal work, now with three distinct compiled proofs and a bipartite-free
  form.
- **Minimal carries.** The carry sets are established by compilation.

The stop gate is not triggered. Its decisive events are all four targets `formally_verified` (Stage 7's) or a confirmed
in-scope counterexample, and neither has occurred. The evidence here supports funding all four award groups at this
cycle's Stage 7.

## Headline assessment

headline_resolved: no
status: proved

`status` is stated at orientation U's evidence grade: `proved_informal`, backed by kernel-checked scratch compiles that I
replayed. It is not `formally_verified`, and no registry status changes (fence §3.8).

Per target:
- **(TSB):** a complete proof, verified.
- **(HTP):** a complete proof at every `p ≥ 1`, including the `p = 1` endpoint.
- **(HTA):** a complete proof, verified.
- **(ELIG):** a complete proof; I verified the recomputed numbers.
- **(TRN):** a complete proof, by two compiled routes.

No target has a counterexample.

The headline, all four targets formally verified, belongs to Stage 7's governed awards and cannot resolve at Stage 5.

## Next-route allocation

**Exact remaining obligation for orientation U.** Run the governed award workflow on LA1–LA4 from the candidates and
conditions in `## Lean readiness`:
1. contract submission;
2. informal audit;
3. fidelity review, including the ℕ/ℤ equivalence text and the hypothesis-consumption table above;
4. kernel-verification receipt;
5. isolated second read.

No mathematical node is open.

**Cycle 2 routes, if any award blocks at Stage 7** (at most one per target):
1. **`U-REPAIR` (award-mechanics repair).** It re-binds any award whose governed gate fails on mechanics: registrar
   ordering, names, the definition-layer carry set, statement binding, or `declaration_name`. It starts from my
   `awards/LA*` candidates or `C-U1-F`'s. In one cycle it could close every blocked award among LA1–LA4, because each
   needs only bookkeeping.
2. **`U-TIER3` (companion second reads), only if the synthesis wants them registered.** It would give isolated second reads
   and registrar-ready faces for:
   - the `q_j` identity (`C-U1-T`);
   - the bipartite and forest form of (TRN) (`C-U1-T`);
   - the bipartite-free `p = 1` endpoint and the any-graph `α ≥ 4` eligibility lemma (adjudicator).

   In one cycle it could close these as Tier-3 companion lemmas on an award's face. It changes no target's status.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-adj-U/`
(SHA-256 in parentheses where recorded).

**Copies and U1 replay.**
- `copy/u1/`: U1's append (`f3b89bbf…`), `replay.sh` (`516011cb…`), `fixed_points_check.py` (`a74fbf4e…`),
  `axiom-check-output.txt` (`11ea513c…`) and scratch `Main.lean` (`9fa0ffdd…`), copied out.
- `copy/critT/`: `C-U1-T`'s tails, assembler, specs, Lean files and instrument, copied out.
- `copy/critF/`: `C-U1-F`'s four award `Main.lean`s, their fragments, assembler, `CriticCheck.lean`, instrument and
  outputs, copied out.
- `u1-replay/` and `u1-replay.log`: U1's replay (assembled `9fa0ffdd…`, axiom output `11ea513c…`, 8657 jobs).
- `u1-all10-axioms.txt` (`7ca5ceb5…`): axioms on all ten U1 declarations.

**Critic rebuilds.**
- `rebuild-F/LA{1..4}/` and `rebuild-F/*.build.log`: `C-U1-F`'s award sources rebuilt (`3cb2055b…`, `a04c15c6…`,
  `65740a3e…`, `0487f2e8…`), each 8657 jobs, three axioms. LA2's axioms are on all eight declarations
  (`rebuild-F/LA2.axioms.txt`).
- `rebuild-T/LeanProject/`: `C-U1-T`'s files rebuilt, all with three axioms. They are LA1ax, LA1c (`8a0ae3b6…`), LA2ax,
  LA3ax, LA4ax and U1mod (`f071a674…`). LA1d fails as its intended negative control.

**Adjudicator candidates.**
- `awards/assemble_adj.py` (`1453d8bb…`): carries entries byte-identically after checking each block against its
  fragment and header digest.
- `awards/build.sh` (`84145c75…`).
- `awards/tails/`: LA1 (`5b5203c3…`), LA2 (`5db83f7b…`), LA3 (`49950839…`), LA4a (`2ea7f559…`), LA4b (`208ad4c7…`),
  `common_counts.lean` (`0bab2ede…`).
- `awards/LA1/…/Main.lean` (`d88f6043…`); `awards/LA2/…` (`87003231…`); `awards/LA3/…` (`1ef28389…`);
  `awards/LA4a/…` (`58029dc9…`); `awards/LA4b/…` (`5457ede8…`). Each builds in 8657 jobs.
- `awards/*.axioms.txt`: LA1 (`2e08b684…`), LA2 (`aead437a…`), LA3 (`66a2c6d2…`), LA4a (`bdedde59…`), LA4b
  (`9c7f9b96…`). Every new declaration shows the three axioms, and the new code raises no warnings.
- `awards/*.build.log` and `awards/*.assemble.json`.

**Checks and instrument.**
- `carry_check.py` (`730621f6…`) and `carry_check.out` (`864ea6b7…`): byte-identical carry in all 14 candidate files.
- `stmt_compare_adj.py` (`972b2d27…`) and `stmt_compare_adj.out` (`acc95c9e…`): terminal-statement comparison with §2.
- `adj_instrument.py` (`3b3f8917…`) and `adj_instrument.out` (`fa947957…`; payload `a47673b4…`): all labelled graphs of
  order ≤ 6.

**Background jobs.** None were started. Every build and script ran in the foreground, and a process check before this
write found no `lake`, `lean` or `python3` job running.
