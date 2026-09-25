---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260925
critic_id: c1-la2-fable-informal-20260925
attestation_id: c1-la2-informal-pass-20260925
claim_sha256: e5b3cc55ad63869a9d7c12553f5aaa9ebda58eec16941b6a9ef97a9b360216a7
---

# Informal Proof Integrity Audit

**Boot.** This seat operated within VerityOS. It loaded `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, as the brief's §0 authorizes. Subsystems in play: `skills/` (the audit
skill) and `experiments/` (this run). Under the brief's write boundary, the seat wrote only under
`scratchpad/c1-s7-informal-LA2/`. It made no conversation-log, memory, log or inbox write, and it edited no run
artifact.

**Model disclosure.** The dispatch record charters this seat as Claude Opus 5 at high effort. The session context
names the running model as Claude Opus 5.5 (`claude-opus-5-5[1m]`). The seat cannot inspect its own runtime model
or effort, so both statements rest on dispatch-record and session-context authority only. No child agents were
used. The formalizer's report names the same session model, so this pass is **not a second-family pass**. That is
recorded for the controller under `## Verdict`.

**Scope.** This audit covers the mathematics of `INFORMAL-PROOF.md` (SHA-256 `2a454a4b…48b2`, matches the brief)
as a proof of the contract's `theorem.informal_statement`. It checks the definitions and declarations in
`LeanProject/LeanProof/Main.lean` (`64545ccd…9efc`, matches) literally. It does not audit the kernel.

**Inputs verified before use.**
- `THEOREM-CONTRACT.yaml`: `095fc227…0526`, matches.
- The capsule seal was recomputed as the SHA-256 of the compact key-sorted JSON of the manifest minus
  `seal_sha256`. It gives `803d725ae8f0ef5cf45428e58b894bb33717de47a73ac36ea1212fc09819d865`, which matches.
- All 42 members match their listed byte counts and SHA-256.
- All seven carry files match `sources/c1-stage7-sources/SOURCE-DIGESTS.json`.

## Intended Claim

The contract's `theorem.informal_statement`, verbatim in substance, has four parts.
- **Setting.** `X` is a finite type with decidable equality, and `G` is a simple graph on `X` with decidable
  adjacency.
- **Hypothesis.** `G.IsTree`, and `k ∈ ℕ`. If `slots_{≥t}(k) ≤ leaves_{≥t}(k)` for every `t ∈ ℕ`, then
  `D_k ≤ 2k·i_k` in ℤ.
- **Erratum R28-E-a.** The `∀ t` quantifier stays. On trees the `t = 0` row follows from the rows `t ≥ 1`. The proof
  consumes only `t ≥ 1`, and `hT` is unused.
- **Scope, fences and attribution.** A separate, critic-attributed scope declaration covers every finite simple
  graph with the hypothesis at `t ≥ 1`. The fences and attribution follow it.

`claim_sha256` was recomputed as `sha256(" ".join(s.split()))` over that field. It gives
`e5b3cc55ad63869a9d7c12553f5aaa9ebda58eec16941b6a9ef97a9b360216a7`, which equals the value the brief states.

**Terminal declaration.** `Erdos993G1.dominance_implies_degree_lemma`. Its source text from `theorem` up to
` :=` is `lean_binding.expected_statement`:
- the SHA-256 of that text is `82e14d0c…0895`;
- the text occurs exactly once in `Main.lean` followed by ` :=`;
- it occurs verbatim in `SOLUTION-CONTRACT.md` §2.

The hypotheses match the claim one for one:

| Claim | Lean |
|---|---|
| finite type with decidable equality | `{X : Type u} [Fintype X] [DecidableEq X]` |
| simple graph with decidable adjacency | `(G : SimpleGraph X) [DecidableRel G.Adj]` |
| a tree | `(hT : G.IsTree)` |
| `k ∈ ℕ` | `(k : ℕ)` |
| threshold rows for every `t ∈ ℕ` | `(h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t)` |
| `D_k ≤ 2k·i_k` in ℤ | `(Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k` |

In the conclusion, `k` is cast to ℤ because `indepCount` is ℤ-valued. No subtraction occurs there.

## Claim Ledger

Evidence codes:
- **E-rep**: reproduced by this seat's own evaluator (`evaluator.py`, output `eval_6_14.json`).
- **E-lit**: literal text check (`carry_check.py`, `contract_check.py`).
- **E-der**: this seat's own derivation.

Grid A is every labelled simple graph on `n ≤ 6` vertices: 33,867 graphs and 269,747 `(G, k)` instances, with
`k = 0 … n+1`, so `k = 0` and `k > α` are included. Grid B is every free tree of order 1–14: 5,447 trees, where the
counts per order equal A000055, and 83,039 instances. T22 is the SR-HS-REF witness (24 instances).

### Definitions

| # | Item | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| D1 | `i_k := Erdos993G1.indepCount G k = (Nat.card {S // IsNIndepSet k S} : ℤ)`; bridge `i_k = (#I_k : ℤ)` | none (the bridge needs `Fintype`/`DecidableEq`/`DecidableRel`) | **verified, E-lit.** Main entries 1 and 6 are byte-identical to r25 entries 1 and 4 (same text; digests `5484fc21…`, `4463e7ee…`). Mathlib `IsNIndepSet` = independent and `card = n`, so `I_k` is the independent sets of size exactly `k`. |
| D2 | `D_k := indepDegreeSum G k = Σ_{J∈I_k} Σ_{v∈J} deg v` (ℕ) | same | **verified, E-lit.** Main entry 2 is byte-identical to r27 entry 7 (`a1ed32eb…`). U1's re-typed copy is absent. |
| D3 | `occ G v k = #{J ∈ I_k : v ∈ J}` | none | **verified, E-lit.** Character-identical to the §2 text and to U1 L45–49. It depends only on `indepSetFinset`; the contract's `def-occ` has `dependencies: []` (the false dependency is struck). |
| D4 | `slotsAtLeast G k t = Σ_{v : 3 ≤ deg v ∧ t ≤ occ} (deg v − 2)` (ℕ) | the ℕ-subtraction is guarded by `3 ≤ deg v` in the filter | **verified, E-lit/E-rep.** No truncation: every summand has `deg v − 2 ≥ 1` (`truncation_demo` shows the unguarded case would truncate). |
| D5 | `leavesAtLeast G k t = #{ℓ : deg ℓ = 1 ∧ t ≤ occ}` | none | **verified, E-lit.** |

### The (LC) proof

| # | Item | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| S0 | `c_v ≤ i_k` | any finite graph | **verified, E-rep.** 0 failures on grids A and B and on T22. |
| S1 | Generic layer cake: `Σ_{v∈s} w·f = Σ_{t∈[1,N]} Σ_{v∈s, t≤f v} w` for `f ≤ N` on `s` | `hN : f v ≤ N` enters only in `#{t∈[1,N] : t ≤ f v} = f v`; the `t`-range starts at 1 | **verified, E-der + E-rep.** 20,000 random cases, 0 failures. **Sharpness exhibited:** with `f = 5 > N = 3` the right side is 3, not 5. Including `t = 0` gives 13, not 8. |
| S2 | `Σ_{Br}(deg−2)·c = Σ_{t=1}^{i_k} slots_{≥t}`; `Σ_L c = Σ_{t=1}^{i_k} leaves_{≥t}` | S0 supplies `hN` with `N = #I_k`; any finite graph | **verified, E-rep.** 0 failures (grids A, B, T22). Rows `t > i_k` are `0 ≤ 0`, checked at `t = i_k + 1`, so `Icc 1 i_k` captures every `t ≥ 1` row. |
| S3 | `D_k = Σ_v deg v·c_v`; `Σ_v c_v = k·i_k` | any finite graph; `IsNIndepSet.card_eq` enters the second | **verified, E-rep** (D computed directly from its definition). |
| S4 | `h` summed over `t ∈ [1, i_k]` gives `Σ_{Br}(deg−2)c ≤ Σ_L c` (ℕ) | `h` enters **only** here, only at `t ≥ 1` | **verified, E-lit.** The Lean is `Finset.sum_le_sum (fun t _ => h t)` over `Finset.Icc 1 (#I_k)`; `h 0` is never used. |
| S5 | Cast to ℤ: `((deg v − 2 : ℕ) : ℤ) = deg v − 2` on `Br` | `3 ≤ deg v`, hence `2 ≤ deg v`, for `Nat.cast_sub` | **verified, E-rep/E-lit.** |
| S6 | `2k·i_k − D_k = Σ_v (2−deg v)c_v ≥ Σ_L c − Σ_{Br}(deg−2)c ≥ 0` | S3 cast to ℤ; `deg ∈ {0,2}` terms are `≥ 0`; `L`, `Br` disjoint; the last `≥` is S4 + S5 | **verified, E-der + E-rep.** The weight identity has 0 failures on 269,747 + 83,039 + 24 instances. |
| S7 | Conclusion `(D_k : ℤ) ≤ 2·k·i_k`, via D1's bridge | — | **verified.** |

### Hypothesis ledger

| # | Item | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| H1 | `IsTree` used nowhere in (LC) | — | **verified, E-lit.** `hT` does not occur in the proof body. The face records the linter warning. |
| H2 | `n ≥ 2` not needed for (LC) | — | **verified, E-rep** (`n = 1` is in both grids). |
| H3 | `k ≥ 1` not needed; `k = 0` gives `I_0 = {∅}`, `c = 0`, `D_0 = 0` | — | **verified, E-rep** (`k = 0` is in every grid). |
| H4 | Only the rows `1 ≤ t ≤ i_k` are consumed | — | **verified**, as S4. |

### Scope declaration and companions

| # | Item | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| G1 | Scope declaration: graph-general, hypothesis only at `t ≥ 1` (`CriticU1T.…_graph_general`, `CriticU1F.…_general`) | no acyclicity, no connectivity | **verified, E-rep.** The `t ≥ 1` hypothesis holds on 211,147 grid-A instances with **0** failures of the conclusion. (DL) fails on 47,799 instances (7 / 601 / 47,191 at `n = 4/5/6`), and the hypothesis fails on every one. |
| G2 | The `∀ t` form is strictly stronger off trees | — | **verified, E-rep.** Diamond `K_4 − {2,3}`, `k = 2`: the rows `t ≥ 1` hold, the `t = 0` row is `2 ≤ 0` (false), and (DL) holds with equality (`4 = 4`). `K_{2,3}`, `k = 3`: the same pattern (`6 = 6`, row0 `2 ≤ 0`). So stating the scope at `t ≥ 1` is correct. |
| C1 | Weight identity (`CriticU1F.weight_identity`, `CriticU1T.base_identity`) | any finite graph | **verified, E-rep.** |
| C2 | Pointwise split `(2−d)c = [d=0]2c + [d=1]c − [d≥3](d−2)c` | none | **verified, E-rep** (every vertex, every instance). |
| C3 | Exact leaf/branch identity with the `2Σ_{deg 0} c` term | any finite graph | **verified, E-rep.** |
| C4 | No-isolated form (`∀v, 0 < deg v`, or `1 ≤ deg v`) | no isolated vertex | **verified, E-rep.** **Sharpness:** the form fails on 20,027 grid-A instances with an occupied isolated vertex. On the one-vertex tree at `k = 1`, the left side is 2 and the right side is 0. |
| C5 | Tree with `n ≥ 2` has no isolated vertex | connectivity + `2 ≤ card X` only | **verified, E-der + E-rep.** |
| C6 | Tree identity `2k·i_k − D_k = Σ_L c − Σ_{Br}(deg−2)c` | C4 + C5; connectivity only | **verified, E-rep** (83,036 tree instances with `n ≥ 2`, 0 failures). |
| C7 | Biconditional `D_k ≤ 2k·i_k ⟺ Σ_{Br}(deg−2)c ≤ Σ_L c` | C6 | **verified, E-rep.** |
| C8 | Slot count `Σ_{Br}((deg:ℤ)−2) = |L| − 2` in ℤ | handshake `Σ deg = 2|E|` + `IsTree.card_edgeFinset` (`|E| + 1 = n`: acyclicity with connectivity) + C5 + C2 at `c = 1` | **verified, E-der + E-rep.** `Σ(2 − deg) = 2n − 2(n−1) = 2`. **Sharpness:** at `n = 1` it would read `0 = −2`. Stated in ℤ, never as truncated ℕ. |
| C9 | `slots_{≥0} = Σ_{Br}(deg−2)`, `leaves_{≥0} = |L|` | any finite graph | **verified, E-rep.** |
| C10 | Tree `t = 0` lemma (`tree_slots_le_leaves_zero`) | `IsTree`; `n < 2` gives `deg < n ≤ 1`, so `Br = ∅`; `n ≥ 2` uses C8 | **verified, E-der + E-rep** (every tree to order 14 and T22, 0 failures). |
| C11 | Quantifier bridge (`tree_forall_t_of_ge_one`) | `IsTree`; split `t = 0` (C10) from `t ≥ 1` | **verified, E-der.** This is the content of erratum R28-E-a. |

### Fences and provenance

| # | Item | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| F1 | "Hypothesis fails at `(T22, 11)` and `(T22, 12)`" | — | **verified, E-rep.** T22 is a tree (22 vertices, 21 edges, connected). `Br = {0,1,8,15}`, all of degree 3. `L = {4,7,11,14,18,21}`. `α = 13`. The hypothesis fails at **exactly** `k ∈ {11, 12}` and holds at the other 22 values of `k ∈ [0, 23]`. At `k = 12`, `c_0 = 18`, the other branch vertices have `c = 0`, and every leaf has `c = 17`, so `t = 18` fails (1 > 0) and that is the only failing row. At `k = 11`, `c_0 = 141`, the other branch vertices have `c = 4`, and every leaf has `c = 136`, so `t = 137…141` fail (1 > 0). Hand certificate `[x^11](1+3x+x²)^6 = 18` and `[x^11](1+x)²(1+3x+x²)^5 = 17`, both reproduced. `i_11 = 171`, `D_11 = 3099 ≤ 3762`; `i_12 = 19`, `D_12 = 372 ≤ 456`. (DL) holds at every `k` of T22. |
| F2 | Nothing depends on U2's two false declarations | — | **verified, E-lit.** None of `R28U2`, `slot_leaf_sdr_exists`, `tree_leaf_slot_dominance`, `tree_slots_zero_le` or `sdr_iff` occurs in `Main.lean`. The terminal proof calls only U1 lemmas and r25 entry 4. No companion references U2. `INFORMAL-PROOF.md` invokes neither declaration. |
| F3 | (DL) is not used | — | **verified, E-lit.** `forest_degree_lemma` occurs 0 times in `Main.lean`. |
| P1 | Carry table (33 rows, `INFORMAL-PROOF.md` §8) | — | **verified, E-lit.** All 33 rows reproduced: registered names, fragment SHA-256 (= registrar entry digest = fragment-file digest), original SHA-256 and exact line ranges. |
| P2 | Declaration transport | — | U1 bodies occur verbatim in `U1-Main.lean`. Every critic body occurs verbatim in its frozen file after the single `lemma`→`theorem` swap back; `pointwise_split` and `tree_degree_pos` need no swap. |
| P3 | Terminal proof block | — | Identical to U1's. `4f786221…` reproduced as the text after `:= by\n`; `7058e829…` is U1 L175–290. |
| P4 | `CriticU1F.tree_slots_le_leaves_zero` as the `t = 0` lemma | — | The brief names C-U2-F's `tree_slots_zero_le` as an *optional* alternative, and the synthesis reads "if it is preferred". The face uses the C-U1-F lemma, which is in the carry set, and says so truthfully. |

Cast audit summary:
- The only ℕ-subtractions are `deg v − 2`. They occur in `slotsAtLeast`, in the Step 2 sum over `Br`, in the
  layer-cake weight `w = deg − 2` (summed only over `Br`), in the right side of `slotsAtLeast_zero`, and in
  `tree_slots_le_leaves_zero`'s ℕ-side sum.
- Each is filter-guarded by `3 ≤ deg v`, and each cast uses `Nat.cast_sub` with `2 ≤ deg v`.
- Every sign argument (`2 − deg v ≥ 0` for `deg ≤ 2`, and the slot count) is carried out in ℤ.
- Every equality used was recomputed as an identity (S1–S3, S6, C1–C3, C6, C8, C9).

## Reproduced Mathematical Evidence

All scripts are this seat's own, written for this audit under
`scratchpad/c1-s7-informal-LA2/`. IMPORT LIST: standard library only (`evaluator.py`: `itertools, json, random,
sys`; `carry_check.py`: `hashlib, json, re, sys, pathlib`; `contract_check.py`: `hashlib, json, sys`). No prior
evaluator was imported. Outputs have sorted keys and no wall-clock, PID or host fields. Each was replayed once with
byte-identical output.

| File | SHA-256 | Command |
|---|---|---|
| `evaluator.py` | `ccf4a9e87b189d6c99af7b03315b4ec3484152b74ef16450a614bfbf092d1be6` | `python3 evaluator.py 6 14` (seed 20260925, ~26 s, foreground) |
| `eval_6_14.json` | `d6a4c7dbc1902d30e8faab30df897d85a1c8bcf8a797b4a4a92f375068714827` | output of the above; replay identical |
| `carry_check.py` | `d6ade86f13f9ad13a6d501eb1e5d230c318d13ddf2406b2a66f884070b7de5d3` | `python3 carry_check.py` |
| `carry_check.json` | `211ee53b32563c85ba399c996fb89913a2ebc1e55a829b170a61f42c420646a1` | replay identical |
| `contract_check.py` | `f652bff4852126c362ca02b29dd101bf03539da774adecff2f7324bf6b050029` | `python3 contract_check.py` |
| `contract_check.json` | `d570f4668c7593ed4c8605d13bdc4809ffe745263f07020810746f385b851535` | replay identical |

Key recomputed numbers:
- **Grid A** (all labelled graphs, `n ≤ 6`): 269,747 instances, 0 identity failures, 0 counterexamples to either
  the `t ≥ 1` or the `∀ t` implication. The `t ≥ 1` hypothesis holds on 211,147 instances and the `∀ t` hypothesis
  on 73,561. (DL) fails on 47,799 instances, 0 of them with the hypothesis. The first (DL) failure is `K_4 − e`,
  `k = 1`: `10 > 8`, with row 1 at `2 > 0`. The first `k ≥ 1` witness of a failing `t = 0` row is the diamond at
  `k = 2`.
- **Grid B** (free trees, orders 1–14; counts `1,1,1,2,3,6,11,23,47,106,235,551,1301,3159` = A000055): 83,039
  instances. The tree identity, biconditional and slot count hold on 83,036/83,036 instances with `n ≥ 2`. The
  `t = 0` row holds on 83,039/83,039. The `t ≥ 1` hypothesis holds throughout this range, a prior only.
- **Named graphs.** `K_4`, `k = 1`: `D = 12 > 8`, hypothesis fails. `K_{2,3}`, `k = 1`: `12 > 10`, hypothesis
  fails. `K_{2,3}`, `k = 3`: `6 = 6`, rows `t ≥ 1` hold, row0 `2 ≤ 0` fails.
- **Contract.** The dependency-graph edges equal the declared dependencies, and the graph is acyclic.
  `permitted_axioms` is exactly the three. The only occurrence of "compiled" is the evidence sentence "prior
  evidence, not a grade". `formally_verified` and `formally_verified_conditional` do not occur.
- **Mathlib meanings** (read in the pinned Mathlib package): `IsTree.card_edgeFinset : #E + 1 = card V`;
  `sum_degrees_eq_twice_card_edges`; `degree_lt_card_verts`; `IsNIndepSet` = `IsIndepSet ∧ card = n`;
  `indepSetFinset n = {s | IsNIndepSet n s}`.

## Independent Critic Pass

This is a separate adversarial pass over the ledger above, with the claims unchanged.

1. **Is the implication vacuous?** No. The `∀ t` hypothesis holds on every tree instance to order 14 (83,039) and
   on 22 of 24 values of `k` on T22.
2. **Is the tree-scoped statement trivially true?** Its conclusion does hold unconditionally on trees, because (DL)
   is a theorem (r27). But the proof does not use (DL): F3 finds 0 occurrences. The faces say "not a proof of (DL)
   and not a second proof of (DL)", so there is no overclaim. The non-trivial content is the implication and its
   graph-general `t ≥ 1` scope, which is sharp off forests (G1: 47,799 (DL) failures, each with a failing
   hypothesis).
3. **Off-by-one in the layer cake?** The `t`-range is `[1, N]` and `N = i_k ≥ max c_v`. `k = 0` gives `N = 1` with
   all `c = 0`. `k > α` gives `N = 0` and an empty range. The `t = 0` term is excluded; including it changes the
   value (S1 sharpness). Confirmed.
4. **ℕ truncation?** Every `deg v − 2` is under `3 ≤ deg v`. `2 * k * i_k` has no subtraction. The weight identity
   lives in ℤ. Confirmed.
5. **Does the r27 `indepDegreeSum` replacement change any carried proof's meaning?** The critic proofs were built
   against U1's re-typed definition. The r27 text has the same argument order and the same body, and C-U1-F's
   `Audit.lean` records `rfl` equality. At statement level the two definitions are the same function. Confirmed.
6. **Could a companion silently feed the terminal theorem?** No. The terminal proof calls only U1 lemmas and r25
   entry 4, so no critic declaration and no U2 declaration is a dependency (F2).
7. **Does the scope text overstate?** It says the implication holds on every finite simple graph "with the
   hypothesis only at `t ≥ 1`". Grid A agrees. G2 shows that the `∀ t` form would be strictly weaker off trees,
   so the face picks the right form.
8. **Is the fence text exact?** "Fails at `(T22, 11)` and `(T22, 12)`" is exact: those are the only failing `k`.

The critic pass found no defect in any proof step.

## Scope and Fence Check

**Excluded conclusions.** Checked against the synthesis `## Lean awards` C1-LA2 and the formalizer brief §2. Each
travels on the contract's `informal_statement`, on `INFORMAL-PROOF.md` §1/§7 and on the terminal docstring, and
none is asserted anywhere:
- not a proof of (DL), and not a second proof of (DL);
- the hypothesis fails at `(T22, 11)` and `(T22, 12)`, with (HS) REFUTED;
- no composition with `tree_leaf_slot_dominance`;
- the reformulation is a scope note on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, never a new key;
- no status transfer (`SOLUTION-CONTRACT.md` §3.1).

The docstring words the composition fence as "no composition with the refuted (HS)", which names the same object.

**Repairs.** All are applied:
- "carried byte-identically" is struck for U1's `indepDegreeSum`, and the r27 entry is registered instead;
- no `formally_verified_conditional` or other non-§4 grade appears;
- the `def-occ` dependency is removed;
- the informal statement is tree-scoped, with the graph-general `t ≥ 1` form separated and labelled as a
  critic-attributed scope declaration.

**Attribution on the faces** (`INFORMAL-PROOF.md` §6 and the contract's statement): U1 (seat) for (LC); C-U1-T and
C-U1-F for the graph-general form and the reformulation's Lean proofs, each keeping its namespace; r27 C-T2-U
(mechanism); the r27 T adjudicator (`2 ≤ n`); SR-JOIN; FLNYZ 2026 §8; r28 SR-PP (PP-3/PP-4). This is every item in
the formalizer brief §2 attribution line.

**Non-blocking escalations for the controller.** None is a defect in a proof step.
1. **Hall attribution.** The synthesis's "Attribution common to every face" also lists "Hall's theorem: classical,
   via Mathlib". The C1-LA2 faces omit Hall, following the formalizer brief §2 list exactly. Hall's theorem plays no
   role in this award's mathematics, so nothing is misattributed. Whether a line "Hall: not used here" should be
   added is the controller's decision.
2. **Carry-set wording.** `CAPSULE-VERIFICATION.json` marks `C-U1-F-Audit.lean` `carried_in_this_award: true`
   (meaning it is in the R7 carry set). `INFORMAL-PROOF.md` §8 and the formalizer report say it is "not
   transported; evidence only", and `Main.lean` confirms none of its declarations is present. The texts are
   consistent in substance but ambiguous in wording.
3. **Cast-audit wording.** The first bullet of `INFORMAL-PROOF.md` §5 says `deg v − 2` is ℕ-subtraction "only
   inside `slotsAtLeast` and in the Step 2 sum". It also occurs, equally guarded, in `slotsAtLeast_zero`'s right
   side and in the layer-cake weight; the next bullet names `tree_slots_le_leaves_zero`. The wording is imprecise
   but true in substance: every site is guarded.
4. **Out of scope, noted only.** The C-U1-F critique's certification line says "All 10 declarations". The file of
   record (`7ae3f19e…`) holds 13 declarations, and all 13 are transported and audited here. The award faces are
   unaffected.

**Read-boundary disclosure.** Three incidental reads went beyond the brief's list:
- a non-recursive `ls` of the run's `scratchpad/`, which revealed sibling directory names only (no contents read);
- an `ls -laR` of the Lean run root, which revealed `DRAFTS/` and sandbox file names (no `DRAFTS/` contents read);
- one `grep` for `PP-3|PP-4` in `second-reads/SR-PP/SECOND-READ.md`. That file is a capsule member but not on this
  brief's list; about a dozen matching lines were seen and nothing here relies on them.

The seat ran no `find` or `grep` rooted above the permitted paths, no network, no install, no `lake`/`lean`/`elan`
invocation, and no background job.

## Verdict

passed

The informal proof in `INFORMAL-PROOF.md` proves the contract's intended claim at statement level:
- Every inference step (S0–S7) and every companion (C1–C11) was checked, with each hypothesis located where it
  enters.
- Every identity was recomputed exactly, every bound was confirmed on the grids, and each stated sharpness was
  exhibited.
- The definitions match the Lean source, and the G1/r27 entries byte-identically match the frozen award sources.
- The terminal declaration's hypotheses match the claim one for one.
- Nothing depends on the two false U2 declarations or on (DL).
- The award's hypothesis is correctly fenced as failing at exactly `(T22, 11)` and `(T22, 12)`: the award is the
  implication, not (DL).

Escalations 1–3 above are wording and attribution items for the controller, not proof defects. This pass is
same-family (Claude) as the formalizer. The skill prefers a second-family pass where one is available.

chartered Claude Opus 5 / high (dispatch record); session context reports Claude Opus 5.5 (`claude-opus-5-5[1m]`);
the seat cannot self-inspect its runtime model or effort — stated on dispatch-record authority.
