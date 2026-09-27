---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260926
critic_id: c1-la2-fable-informal-20260926
attestation_id: c1-la2-informal-pass-20260926
claim_sha256: 61fe2c2330184fdf27211b163be0332a411fc74ac8faaa3d29a87d206509e821
---

# Informal Proof Integrity Audit

Boot acknowledgment: operating within VerityOS. Loaded `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md` (single-problem scale, one prover/critic cycle). Subsystem used: experiments (this
run root). Reads stayed inside the brief's §1 boundary. I read the Lean run's contract, `INFORMAL-PROOF.md`,
`CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md` (by its source), `FORMALIZER-REPORT.md`, `EVIDENCE/*` and
`LeanProject/LeanProof/Main.lean` plus `Snippets/`. I also read the sealed C1-LA2 capsule: the synthesis `## Lean awards`,
`## Exact established results` and `## Reconciliation` (for R5), the U adjudication `## Lean readiness`, the U2 return, the
C-U2-T and C-U2-F critiques, the formalizer brief, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, the frozen first-interior
`Main.lean`, `FORMALIZATION-STATE.json` and `Snippets/`, and the frozen carry files. No Mathlib source was needed: the one
Mathlib theorem is used as a black box, and C-U2-F spot-checked the pinned citation. I read no other scratch or run, and I
edited nothing in the Lean run.

Model disclosure (two-part): the chartered model, on dispatch-record authority, is Claude Opus 5.5 at effort high. The
runtime reports its own id verbatim as `claude-opus-5-5[1m]` ("Opus 5.5 (1M context)"). No child agent was used.

Integrity gates I recomputed:
- `THEOREM-CONTRACT.yaml` digest `c9c16b09…b4edc`, `INFORMAL-PROOF.md` digest `74b13dd3…c3a9` and `Main.lean` digest
  `7c279f4b…49f8` all equal the brief's expected values.
- Capsule seal `dfc68849…57121`: all 347 members match their byte counts and SHA-256.
- All eleven carry files match `sources/c1-stage7-sources/SOURCE-DIGESTS.json`.
- `claim_sha256`: `" ".join(informal_statement.split())` hashes to `61fe2c23…e821`, as required.

## Intended Claim

The contract's `theorem.informal_statement`, whose mathematical content is:

> For every finite vertex type `V`, every simple graph `G` on `V` and every natural `p ≥ 1`: if (HALL-COND) holds for the
> transport network at rank `p` with the fixed selector `F = F_p(G)` — that is, for every `X ⊆ I_{p+1}(G)`,
> `Σ_{B∈X} w_F(B) ≤ Σ_{A∈N(X)} w_F(A)`, where `w_F` is the active-tag weight and (REL) is literally (D) ∪ (S) — then
> `C5LA1.aggregate G p = S(G, p) ≤ 0`.

The statement also carries scope remarks:
- graph-generic;
- the hypothesis is for every `X`, and the conclusion depends on it only at `X = I_{p+1}`;
- the converse is "false as a statement" and is not asserted (synthesis R5);
- STATED status;
- attribution;
- the Gate ruling 9 phrasing equivalence.

The Lean terminal declaration `E993Transport.aggregate_nonpos_of_weightedHall (G) [DecidableRel G.Adj] (p) (hp : 1 ≤ p)
(h : WeightedHall G (favorableLeaves G p) p) : C5LA1.aggregate G p ≤ 0` matches the claim hypothesis for hypothesis:
- `V` finite: the ambient `[Fintype V] [DecidableEq V]`;
- any simple graph: `G`;
- `p ≥ 1`: `hp`;
- (HALL-COND) at `F_p(G)`: `h`;
- the conclusion is `aggregate ≤ 0`.

There is no extra hypothesis and none is missing. `expected_statement` occurs exactly once in `Main.lean`, followed by
` := by`, and its SHA-256 is `174fc753…6a73`, as the contract records.

## Claim Ledger

Legend: **V** = verified, with reproduced evidence (exact integers; see the next section) and an argument checked line by
line against the Lean body.

| id | claim (INFORMAL-PROOF step) | hypotheses and where they enter | ℕ/ℤ, casts | verdict |
|---|---|---|---|---|
| D1 | Definitions of record `C4LA1.*` (entries 1–4), `C5LA1.*` (5, 6, 8–13) and `E993Interior.taggedFamily` (18) are carried byte-identically. | — | `forwardDifferenceDel` and `vertexDeletionForwardDifference` are ℤ differences of ℕ casts. `p − 1` is ℕ inside `aggregate`. | V: every run body equals the frozen first-interior marker block byte for byte, and marker digest = fragment file = both `FORMALIZATION-STATE.json` entries (`check_bytes.py`). |
| D2 | The eight `E993Transport` definitions equal the brief §2 frozen text and U2's compiled text. `activeWeight` tests `B.erase v` against `W_v = N(s_v).erase v`, never `\|F ∩ B\|` and never `B ∩ N(s_v)`. `transportRel` is (D) ∪ (S) literally (`u ∉ B`, exactly two neighbours). `favorableLeaves` is the same filter as inside `aggregate`. | — | All weights, flows and Hall sums are ℕ with no subtraction. | V: whitespace-normalized equality to brief §2, and exact substring of U2 `Main.lean` (`check_carry.py`). Semantics were read against SEMANTIC-CONTRACT §1.2 and reproduced by my independent transcription (evaluator). |
| D3 | Carried helpers `Leaf.support_adj`, `leaf_insert_indep`, `H_subset_R` and `tagged_count_split` travel inside fragment 42. The lemma `highTailAggregateFromShadow` rides along only because the helpers are `private`, and is not a dependency of the terminal theorem. | `IsGraphLeaf` for the first three; `D ⊆ E` for the split | `tagged_count_split` has no subtraction. The `indepNum − 1` and `a − k` inside fragment 42 lie outside the terminal chain. | V: read in full. `tagged_count_split`: 252,982 exact checks, 0 failures. `H_v ⊆ R_v` and `W_v ⊆ R_v`: 35,140 leaf instances each. |
| L1 | Step 1, `card_active_eq_tagged`: for a leaf `v` and `j ≥ 1`, `B ↦ B∖{v}` is a bijection from the active-`v` sets in `I_j` onto `taggedFamily(V∖H_v, R_v, j−1)`. | `IsGraphLeaf G v`: `s_v ∉ B` (forward) and `N(v) = {s_v}` (backward, `leaf_insert_indep`). `hj` enters only in the backward cardinality `(j−1)+1 = j`. | `j − 1` is guarded by `hj`. | V: 252,982 checks with `j ≥ 1`, 0 failures. Hand-checked both maps and both inverses. At `j = 0` both sides are 0 (35,140 checks), so `hj` is a proof device. The record does not call it sharp. |
| L2 | Step 2, `layerWeight_eq_sum_card`: double counting over any finite `F`. | none on `F` | ℕ | V: 245,308 checks with arbitrary `F` (non-leaves included), 0 failures. |
| L3 | Step 3, `layerWeight_sub_eq_sum` (general (WID)): `LW(p+1) − LW(p) = Σ_{v∈F} [Δ_{p−1}(G−H_v) − Δ_{p−1}(G−R_v)]`. | `hF` (degree one) enters through L1 and `H_subset_R`. `hp` enters twice: at the `j = p` instance of L1 and in `(p−1)+1 = p`. `(p+1)−1 = p` needs no guard. | ℤ via `push_cast`. `p − 1` is guarded by `hp`. | V: 210,441 instances with `p ≥ 1`, 0 failures. `hp` is sharp as recorded: `K_{1,3}`, `p = 0`, `F` = three leaves gives **0 against 6**, and 16,295 of 34,867 `p = 0` instances fail. `hF` is also needed: on `K_3` with `F = {0}` and `p = 1`, LHS 0 against RHS 2, 1, 1 for each of the three possible values of the unconstrained `support` (`hF_robust2.json`). |
| L4 | Step 4, `activeWeightAggregateIdentity`: at `F = F_p(G)`, `LW(p+1) − LW(p) = S(G, p)`. | `F_p ⊆ leafSet` (`isGraphLeaf_of_mem_favorableLeaves`); `hp` | Closing `rfl`, kernel-accepted (the audit covers the mathematics, not the kernel). | V: 210,441 instances with `p ≥ 1`, 0 failures. Unguarded at `p = 0`: `F_0(G) = ∅` on all 34,867 graphs, `S(G, 0) = 0`, and the identity holds. Argument: a leaf `v` has a neighbour, so `i_1(G−v) ≥ 1 = i_0(G−v)`. |
| L5 | Step 5, `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN): row sums, exchange of finite sums, capacities, cast, then L4. The support clause is discarded. | `hp` (through L4) | `Nat.cast_le` is monotone. `linarith` works over ℤ. | V: the argument is checked line by line. Its content is implied by the grid below (Hall ⇔ flow, and Hall ⇒ `S ≤ 0`). |
| L6 | Step 6, `card_sigma_fiber_filter`: clones with base in `S` number `Σ_S w`. | finiteness | ℕ | V: this is `Finset.card_sigma` after a set equality. Checked by reading. |
| L7 | Step 7, `exists_saturatingFlow_of_weightedHall` (HALL⇒FLOW), for any `F` and `p`, via Hall's theorem on the clone expansion. The flow is `f(B, A) = #{x : base x = B, base φx = A}`. | (HALL-COND) at `X = image of the clone set` (`X ⊆ I_{p+1}`, because a positive clone count forces membership). Mathlib `Fintype.all_card_le_filter_rel_iff_exists_injective`. | ℕ | V: the argument is checked, including `hset2` (the neighbourhood of the clone set is exactly the target fibre over `N(X)`). Flow and brute-force Hall agree on all 205,789 instances where brute force was feasible. |
| L8 | Critic companions: `transportRel_mem_indepFamily` (both arc types land in `I_p`; `(p+1)−2+1 = p`), `weightedHall_of_saturatingFlow` and the iff. | literal (D)/(S); `u ∉ B`; exactly two neighbours | The switch count is `card_sdiff_add_card_inter`, additive, no truncation. | V: 1,482,161 arcs, 0 outside `I_p`. The literal relation and my witness enumeration agree on 212,262 random pairs. Hall ⇔ flow: 205,789 agreements, 0 disagreements. |
| T | Step 8, terminal composition: L7 at `F = F_p(G)`, then L5. | `hp`, `h` | — | V: Hall ⇒ `S ≤ 0` has 0 failures in 210,441 instances (192,091 Hall-true, 17,609 of them with positive supply). All 18,350 instances with `S > 0` are Hall-false. |
| U | "Uses (HALL-COND) only at `X = I_{p+1}`": `Σ_{I_{p+1}} w ≤ Σ_{N(I_{p+1})} w ≤ Σ_{I_p} w` (weights ≥ 0, `N ⊆ I_p`), then L4. | the whole-layer instance only | ℕ | V: whole-layer instance ⇒ `S ≤ 0` has 0 failures on the grid. The informal proof correctly says the Lean proof consumes every `X` through Hall's theorem. |
| C | Scope remark: "the converse is false as a statement and is not asserted (synthesis R5)". | — | — | **Imprecise; it asserts nothing beyond the record's definition. Escalation E1.** The converse is not asserted, which complies with the fence. R5 defines "false/strictly stronger as a statement" as the subfamily quantifier plus unreachable positive capacity at the whole-layer cut. §3 of `INFORMAL-PROOF.md` and `hyp-hall` both add that no instance separating the two in truth value is known. Read literally as "some `(G, p)` has `S ≤ 0` and (HALL-COND) false", the sentence is unsupported. On my grid, 0 of 212,142 instances separate them (including every labeled graph on at most 6 vertices, and 1,701 targeted `p ≥ 2` instances with positive supply). At `p = 1` they coincide provably: every target weight is 0, so (HALL-COND) ⇔ supply = 0 ⇔ `S = 0`. |
| N | Numeric claims: `K_{1,3}` at `p = 0` gives 0 against 6; `(p+1)−1 = p`; `(p−1)+1 = p` iff `p ≥ 1`; `(p+1)−2+1 = p`; `F_0 = ∅`. Report counts: 26 definitions, 51 edges, 50 digested sources, 35 declarations, exactly one `theorem`. | — | — | V: all reproduced (`numeric_claims.json`). All 50 contract source digests match. The contract DAG is acyclic, with every edge between declared nodes. The terminal statement closure uses no node marked "not in the terminal statement" (`layerWeight`, `IsSaturatingFlow`, `taggedFamily` are proof or companion level only, as marked). |
| K | Carry table (INFORMAL-PROOF §9, report R2): each recorded source-declaration SHA-256 matches the carry-file lines cited. Each carried body equals its source except for the declared edits. | — | — | V (`check_carry.py`): entries 23–26, 29, 30, 32, 33 are identical. The only diffs are: 27, `theorem→lemma` and the dead `have hpk2` plus its simp argument removed; 28, 31 and 34, `theorem→lemma`; 35, `lemma→theorem` and a line break of the statement. No `sorry`, `admit`, `native_decide`, `axiom` or `decide` token appears; the only import is `Mathlib`. |

## Reproduced Mathematical Evidence

All evidence is under `scratchpad/c1-s7-informal-LA2/`. It is my own code, written from the Lean text and SEMANTIC-CONTRACT
§1.2. It uses the Python standard library only, with imports `itertools`, `random`, `json`, `hashlib`, `collections`, `re`,
`difflib` and `os`. The seeds are fixed at 993030 and 99330, all arithmetic is exact integer, and no hashed file contains a
wall-clock field. No prior evaluator was imported.

**Evaluator.** `evaluator.py` (`ce1b6ea9…c7c0`) transcribes entries 1–21 literally:
- ℕ-truncated `p − 1` in `aggregate`;
- `IsFavorableAt := i_{p+1}(G−v) − i_p(G−v) < 0`;
- `activeWeight` by `(B∖{v}) ∩ W_v ≠ ∅`;
- `transportRel` literal.

It also contains an Edmonds–Karp max-flow and a brute-force Hall check over every `X ⊆ I_{p+1}` (up to 14 sources).

**Grid.** `run_checks.py` (`96b1a614…a9f1`) produces `results.json` (`ab630b3d…d6af1`) and `run.log`. It covers 34,867
graphs:
- every labeled simple graph on 1 to 6 vertices (33,867);
- 600 random graphs on 7 to 9 vertices;
- 400 random trees on 7 to 11 vertices;
- every `p` from 0 to `n`.

It found no failure in any identity or implication; every count is in the ledger. The only "failures" are the intended ones:
- 16,295 general-(WID) failures at `p = 0`, which exhibit the guard;
- 120,305 differences when a non-leaf tag is forced into `F`, which exhibit that `hF` is needed.

**Numeric claims.** `numeric_claims.py` (`83511519…5b38`) produces `numeric_claims.json` (`0dbf8…eac5ac`):
- `K_{1,3}` at `p = 0`: `[0, 6]`; at `p = 1, 2, 3`: `[6, 6]`, `[−3, −3]`, `[−3, −3]`.
- `P_3` at `p = 1`: `F = {1, 2}`, `S = 2`, supply 2, capacity 0, Hall false. This is a hand-checkable instance of the
  contrapositive.
- Smallest nontrivial Hall-true instance: `K_{1,3}` at `p = 2`, `F` = all three leaves, `LW(3) = 3`, `LW(2) = 6`, `S = −3`.
- The contract checks listed under N.

**Other evidence.**
- `hF_robust.py` and `hF_robust2.py` (`2585772d…`, `d29e698c…`): the `hF` exhibit holds for every value of the unconstrained
  `support`. This came out of my critic pass: the `P_3` exhibit depended on the choice, and `K_3` does not.
- `search_separating.py` (`674b6526…58e1`), output `search.log`: 1,701 instances with `p ≥ 2` and positive supply (disjoint
  unions, pendant-augmented random graphs, trees on 12 to 14 vertices). 0 separating instances; every Hall failure has
  `S > 0`.
- `check_bytes.py` and `check_carry.py` (`3d08df2c…`, `c37ba80e…`): the byte identity and carry diffs of ledger rows D1, D2
  and K.

**Sharpness exhibited outside hypotheses.**
- `hp` for the general form: `K_{1,3}` at `p = 0`, 0 against 6.
- `hF`: `K_3` with `F = {0}` at `p = 1`, 0 against 2, 1 or 1, depending on the support choice.

The record calls `hp` dispensable for the terminal form, and it is: `S(G, 0) = 0` on every graph tested, with the proof
above.

## Independent Critic Pass

I re-attacked my own ledger with the claim unchanged.

1. **Is the evaluator faithful?** Max-flow and brute-force Hall agree on 205,789 instances, which cross-validates both. `W_v`
   excludes `v`: the literal prose weight `B ∩ N(s_v) ≠ ∅` would make every present tag active (erratum R30-E-b), and my
   `activeWeight` does not do that. `support` off leaves is arbitrary in Lean. I found that my first `hF` witness depended on
   it and replaced it with a support-independent one. No claim of record depends on `support` off `F`, because `F_p ⊆
   leafSet`.
2. **Hidden hypotheses.** No `IsTree`, eligibility, connectivity or nonemptiness enters any step. `[Fintype V]` enters every
   `Finset.univ` and the clone types. Classical decidability is ambient, and the N8 `rfl` is kernel-accepted (not audited
   here). The exhaustive coverage of the graph-generic scope includes disconnected graphs, isolated vertices and `K_2`
   components (where `H_v = R_v`).
3. **Every ℕ subtraction.** There are three:
   - `p − 1` in `aggregate` and L3, guarded by `hp`;
   - `j − 1` in L1, guarded by `hj`;
   - `(p+1) − 1` in L3, always exact.

   The (S) cardinality is additive. There is no other truncation in the terminal chain.
4. **Could the proof be circular or assume the sign?** No. L7 assumes only (HALL-COND). L5 uses only saturation and capacity.
   L4 is an identity.
5. **Could the fence remark C hide a false mathematical assertion?** It is the only sentence of the claim that my evidence
   does not support under a literal truth-value reading. It is not a step of the proof, not in the Lean statement, and the
   brief §2 mandates it with R5's meaning. The face defines the meaning and adds "no separating instance is known". I keep it
   as an escalation, not a proof defect. It would become a defect only if read as asserting a counterexample, which the face
   explicitly disclaims.
6. **Attribution and STATED status.** Both are present on `INFORMAL-PROOF.md` §8 and in the contract's `informal_statement`,
   with every party the brief lists:
   - Codex (GPT-6 Astra/Sol/Luna);
   - the first-interior run for entries 1–18 and 42;
   - F2 and U2 (Sonnet 5);
   - C-U2-T, C-U2-F, C-F2-T and C-F2-U (Opus 5.5);
   - C-U2-T and C-U2-F for the converse, the iff and the layer closure;
   - the T/F/U adjudicators and the synthesis.

   The terminal body is correctly marked critic-first (C-U2-T CA-4). The critic companions are marked `proved_informal`-only.

My critic pass agrees with every V in the ledger.

## Scope and Fence Check

The claim is graph-generic, with no `IsTree` and no eligibility. `F` is fixed at rank `p`. `activeWeight` is the
active-tag test (`B.erase v` vs `tagWitnesses`), and the face uses "another neighbour of `s_v`", never `|F ∩ B|` or
`B ∩ N(s_v)`. `transportRel` is (D) ∪ (S) literally.

The claim does not assert any excluded conclusion:
- (HALL) itself;
- any tree or eligible-row instance of (HALL-COND);
- the primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`;
- a sign of `S` beyond the implication;
- any census value;
- RTree wording;
- TREE, FOREST or TRANSFER keys;
- the parent problem.

The hypothesis-for-every-`X` remark and the "used only at `X = I_{p+1}`" remark are present and correct. The key stays
STATED. It registers `formally_verified` only after an isolated second read and this award's close, and the face says so.
The C1-LA1 chain is re-registered as lemmas.

Escalations. None blocks this audit.
- **E1 (wording; controller or synthesis).** "The converse is false as a statement" should not be read as a truth-value
  claim. No separating instance is known, and on 212,142 instances (every labeled graph with at most 6 vertices included)
  (HALL-COND) at `F_p` held exactly when `S ≤ 0`. At `p = 1` the two are provably equivalent. Suggested wording for
  registration: "the converse is not asserted; (HALL-COND) is strictly stronger in form (subfamily quantifier; unreachable
  positive capacity at the whole-layer cut); no separating instance is known."
- **E2 (outside my boundary).** Byte identity of entries 14–21 and 23–28 with C1-LA1's frozen fragments is unverified here.
  The formalizer also flags it. The controller should compare digests.
- **E3 (Lean-side, informational).** `EVIDENCE/contract-equivalence-check.log` records only `rc=0` and one `#check` line. The
  repair-9 equivalence rests on the harness in `DRAFTS/`, which the fidelity or kernel reviewer should read.

## Verdict

passed

`INFORMAL-PROOF.md` proves the intended claim at statement level. Every definition, lemma and inference step is sound. Every
hypothesis enters where it is named. Every ℕ subtraction is guarded, and every recorded identity and sharpness witness
reproduces in exact integers. No fenced conclusion is asserted. Escalation E1 concerns the wording of a mandated scope remark
and is not a defect in the proof.
