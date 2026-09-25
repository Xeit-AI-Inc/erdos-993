---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-opus-20260925
critic_id: c1-la1-fable-informal-20260925
attestation_id: c1-la1-informal-pass-20260925
claim_sha256: dd45d580a9381c1e31b920d511f14d18a2dfaad215a8d881ccb2e1c74e814885
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** I am operating within VerityOS. Booted per `CLAUDE.md`: read
`verity.md`, `identity/startup-protocol.md`, and `skills/proof-integrity-audit/skill.md` (the brief's §0
authorization). Subsystems touched: `identity/`, `skills/`, `experiments/` (this run root only). Nothing
durable was written: everything this seat produced is under
`experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-s7-informal-LA1/`, which is
experiment scratch, not memory, decisions, projects, logs or reports. No run artifact was edited.

**Model disclosure.** Seat: independent informal proof-integrity reviewer, **Claude Opus 5**, chartered
effort **high**, per the dispatch record. **This seat cannot self-inspect its runtime model or effort
setting**; the model and effort above are stated on dispatch-record authority, not on observation. Child
delegation was forbidden and **no child agent was spawned**. No network, no package install; `lake clean`,
`lake update` and `elan` were never run; no Lean build was run at all (none was needed: this audit is of the
mathematics, not the kernel). All computation ran in the foreground.

**Read boundary honoured.** Read: the run's `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`,
`CAPSULE-VERIFICATION.json`, `FORMALIZER-REPORT.md`, `EVIDENCE/axioms.txt`,
`EVIDENCE/axioms-all-declarations.txt`, `EVIDENCE/carried-sources/*`,
`LeanProject/LeanProof/Main.lean` and its `Snippets/` digests; the sealed capsule
`control/c1-stage7-capsules/C1-LA1-PACKET-MANIFEST.json` and, of its members,
`cycles/cycle-1/stage6/SYNTHESIS.md` (`## Lean awards`, `## Exact established results`),
`cycles/cycle-1/stage4/critics/F1/T/CRITIQUE.md` (the critic-attributed proof of record);
`control/C1-STAGE7-FORMALIZER-BRIEF-LA1.md`; `control/C1-STAGE7-CONTROLLER-FACTS-LA1.json`;
`sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`;
`sources/c1-stage7-sources/U3-Extension.lean`; and Mathlib sources under the shared project
(`Combinatorics/SimpleGraph/Acyclic.lean`, `Walk/Traversal.lean`, `Walk/Operations.lean`,
`Paths.lean`) for the meaning of the Mathlib lemmas used. `sources/external/lean-source/` was **never
opened, listed or grepped**. `find /` was never run. One incidental exception is disclosed under
*Independent Critic Pass*, item C8.

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`:

> (DL) For every finite forest G and every natural k, the total incident degree over the independent
> k-sets satisfies (indepDegreeSum G k : Int) <= 2 * k * indepCount G k. (EX) Consequently, for every
> finite forest G and every natural k, (Fintype.card X : Int) * indepCount G k <= (k + 1) * indepCount G
> (k + 1) + 3 * k * indepCount G k. Hypotheses: acyclicity and finiteness only. (DL) is an average over the
> independent k-sets and bounds no individual set. Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026, section 8
> (Lemma 8.1 with consequence (8.3); the displayed step of Proposition 8.2). Injection derivation of the
> root-corrected lemma: critic C-F1-T, sustained by the F adjudication. Compiled (EX) step: U3, re-derived
> by C-U1-T.

**`claim_sha256` recomputed independently** as SHA-256 of `" ".join(s.split())` over that string:
`dd45d580a9381c1e31b920d511f14d18a2dfaad215a8d881ccb2e1c74e814885` — **equal** to the value the brief
states and to the front matter above.

The two declarations carrying the claim, byte-for-byte as registered in
`LeanProject/LeanProof/Main.lean` (entries 54 and 55):

```lean
lemma forest_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k

theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k
```

Both texts are **character-identical** to the award statement of record in synthesis `## Lean awards`
("C1-LA1") and to the formalizer brief §2, with the one mandated difference that `forest_degree_lemma` is
registered as `lemma` kind and `forest_extension_inequality` is the single terminal `theorem` — which is
what §2 requires. The contract's `lean_binding.expected_statement` is the terminal declaration's exact
namespace-relative source text from `theorem` up to but excluding ` :=`; I extracted that span from
`Main.lean` and compared it byte-for-byte to the contract field (**equal**), and recomputed
`expected_statement_sha256` = `47809abc5c4e94d89aa1859886dbd44cc040d742d3ed0b214aae7adcc240fe18`
(**equal** to the declared value).

Statement-level reading of (EX): both operands of every product live in ℤ; `(k + 1)` and `3 * k` elaborate
at ℤ with `k : ℕ` cast, and `indepCount G (k + 1)` takes the ℕ-successor. The two readings `↑(k+1)` and
`↑k + 1` agree because `Nat.cast` is a ring hom, so no ambiguity is exploitable. The statement is
**subtraction-free**, so no ℕ-truncation can hide in it.

---

## Claim Ledger

Every registered declaration, at statement-level granularity, with the hypotheses it consumes and where
they enter. Column *ℕ/ℤ* records the arithmetic in which the statement lives. Verdicts: **V** = verified
with reproduced evidence (recomputation and/or line-by-line derivation against the source);
**V(def)** = definition, checked literally against its authority.

Legend for hypotheses: **F** = finiteness/decidability instances (`[Fintype X] [DecidableEq X]
[DecidableRel G.Adj]`); **A** = `hG : G.IsAcyclic`; **I** = an independence hypothesis on a specific
finset; **–** = none beyond the ambient binders.

| # | Declaration | Kind | Hyps | ℕ/ℤ | Content checked | Verdict |
|---|---|---|---|---|---|---|
| 1 | `indepCount` | def | F | ℤ | r25 entry 1, carried byte-identically; `Nat.card {S // IsNIndepSet k S}` cast to ℤ | V(def) |
| 2 | `coeff` | def | – | ℤ | r25 entry 2; registered under R1; **not** a dependency of either award statement (verified: no occurrence outside its own entry) | V(def) |
| 3 | `delta` | def | – | ℤ | r25 entry 3; same, **not** a dependency | V(def) |
| 4 | `closedNbhdFinset` | def | F | ℕ | U3 lines 20–23, byte-identical; `J ∪ ⋃_{u∈J} N(u)` | V(def) |
| 5 | `extensionFinset` | def | F | ℕ | U3 lines 25–28; `univ \ closedNbhd` | V(def) |
| 6 | `e` | def | F | ℕ | U3 lines 30–31; `#extensionFinset` | V(def) |
| 7 | `indepDegreeSum` | def | F | ℕ | U3 lines 33–35; `Σ_{J∈I_k} Σ_{v∈J} deg v` — the definition of record for `D_k`, exactly as the brief §2 specifies | V(def) |
| 8 | `rootRep` | def | – | – | `(connectedComponentMk v).out`; constant on components, and lies in the component | V(def) |
| 9 | `rootPath` | def | F(dec.eq) | – | the `.toPath` of a chosen reachability witness `v ⇝ rootRep G v` | V(def) |
| 10 | `par` | def | F(dec.eq) | – | `(rootPath G v).snd`; Mathlib `Walk.snd := getVert 1`, "the only vertex in a nil walk", so `par r = r` at a root | V(def) |
| 11 | `rk` | def | F(dec.eq) | ℕ | `(rootPath G v).length` | V(def) |
| 12 | `childrenFinset` | def | F | ℕ | `{u : par u = v ∧ par u ≠ u}`; excludes `v` itself when `v` is a root | V(def) |
| 13 | `upPairs` | def | F | ℕ | `Σ_{J∈I_k} {v ∈ J : par v ≠ v}` | V(def) |
| 14 | `downPairs` | def | F | ℕ | `Σ_{J∈I_k} {u : par u ≠ u ∧ par u ∈ J}` | V(def) |
| 15 | `rootPairs` | def | F | ℕ | `Σ_{J∈I_k} {r ∈ J : par r = r}` — the correction term, **with multiplicity across components** | V(def) |
| 16 | `swapMap` | def | F(dec.eq) | – | `if (J.filter (par · = u)).Nonempty then ⟨J, choose⟩ else ⟨insert u (J.erase (par u)), u⟩` | V(def) |
| 17 | `indepCount_eq_card_indepSetFinset` | lemma | F | ℤ=ℕ | r25 entry 4, byte-identical; the only ℕ↔ℤ bridge for `i_k` | V |
| 18 | `mem_extensionFinset_iff` | lemma | F | – | `v ∈ ext J ↔ v ∉ J ∧ ∀ u ∈ J, ¬Adj v u` | V |
| 19 | `isNIndepSet_insert_of_mem_extensionFinset` | lemma | F, I | ℕ | `J ∈ I_k`, `v ∈ ext J` ⟹ `insert v J ∈ I_{k+1}` | V |
| 20 | `isNIndepSet_erase_and_mem_extensionFinset` | lemma | F, I | ℕ | inverse direction; the `card_erase` step is `(k+1)−1` in ℕ, exact, discharged by `omega` | V |
| 21 | `sigma_card_double_count` | lemma | F | ℕ | `Finset.card_bij'` with `(J,v) ↦ (insert v J, v)` and inverse `(J',u) ↦ (J'.erase u, u)`; both directions and both round trips checked | V |
| 22 | `sum_card_indepSetFinset_succ` | lemma | F | ℕ | `Σ_{J'∈I_{k+1}} #J' = (k+1)·#I_{k+1}` | V |
| 23 | `sum_e_eq_succ_mul_card` | lemma | F | ℕ | `Σ_{J∈I_k} e(J) = (k+1)·#I_{k+1}` | V |
| 24 | `double_count` | lemma | F | ℤ | `((k:ℤ)+1)·i_{k+1} = Σ_{J∈I_k} (e J : ℤ)`. **No acyclicity binder** (verified on the source) | V |
| 25 | `card_closedNbhdFinset_le` | lemma | F | ℕ | `#closedNbhd J ≤ #J + Σ_{v∈J} deg v` | V |
| 26 | `e_add_card_add_degreeSum_ge` | lemma | F | ℕ | `e(J) + #J + Σ deg ≥ n`, **subtraction-free** | V |
| 27 | `e_ge_sub` | lemma | F, I | ℤ | `(e J : ℤ) ≥ n − k − Σ deg`. **No acyclicity binder** | V |
| 28 | `rootPath_isPath` | lemma | F(dec.eq) | – | `Subtype.property` | V |
| 29 | `rootRep_eq_of_adj` | lemma | – | – | adjacent vertices share the component representative | V |
| 30 | `par_eq_self_of_nil` | lemma | F(dec.eq) | – | nil root path ⟹ `par v = v` (via `getVert_of_length_le`) | V |
| 31 | `not_nil_rootPath_of_par_ne` | lemma | F(dec.eq) | – | contrapositive of 30 | V |
| 32 | `adj_par` | lemma | F(dec.eq) | – | `par v ≠ v ⟹ Adj v (par v)` (Mathlib `Walk.adj_snd`) | V |
| 33 | **`rootPath_unique`** | lemma | F(dec.eq), **A** | ℕ | **acyclicity use 1.** Any path `v ⇝ rootRep G v` *is* `rootPath G v` (Mathlib `IsAcyclic.path_unique`); endpoint a bound variable, so it applies to a walk typed at a propositionally equal root without transport. Statement and proof correct | V |
| 34 | **`par_or`** | lemma | F(dec.eq), **A** | – | `Adj u v ⟹ par u = v ∨ par v = u` — the neighbourhood decomposition in relational form. Branch 1 applies Mathlib `IsAcyclic.eq_snd_of_adj_start` (whose own Mathlib proof is path-uniqueness); branch 2 applies `rootPath_unique` to `cons h (rootPath G v)`, legitimate because `u ∉ support` makes that walk a path and `rootRep G v = rootRep G u`. Both branches checked against Mathlib's actual signatures | V |
| 35 | `rk_par_lt` | lemma | F(dec.eq), **A** | ℕ | tail of the root path is the parent's root path, so `rk (par v) + 1 = rk v` | V |
| 36 | **`par_par_ne`** | lemma | F(dec.eq), **A** | – | **controller fact CF-LA1-1.** `par u ≠ u ⟹ par (par u) ≠ u`, by 35 applied twice. The auxiliary `par (par u) ≠ par u` is obtained correctly from the assumed `par(par u) = u` | V |
| 37 | `not_adj_of_indep` | lemma | I | – | pairwise non-adjacency inside an independent set | V |
| 38 | `notMem_of_par_mem` | lemma | F(dec.eq), I | – | `par u ≠ u`, `par u ∈ J` ⟹ `u ∉ J` (this is what makes the swap branch's cardinality exact) | V |
| 39 | `mem_childrenFinset` | lemma | F | – | filter unfolding | V |
| 40 | `neighborFinset_eq_of_root` | lemma | F, **A** | – | at a root, `N(v) = children(v)`; the excluded branch is closed by `ne_of_adj` | V |
| 41 | `par_notMem_childrenFinset` | lemma | F, **A** | – | uses 36; `par v ∉ children(v)` | V |
| 42 | `neighborFinset_eq_of_nonroot` | lemma | F, **A** | – | `N(v) = insert (par v) (children v)` | V |
| 43 | `degree_eq_card_childrenFinset_add` | lemma | F, **A** | ℕ | `deg v = #children(v) + [par v ≠ v]`; **exact**, no subtraction. Disjointness of the insert supplied by 41 | V |
| 44 | `sum_card_childrenFinset` | lemma | F | ℕ | `Σ_{v∈J} #children(v) = #{u : par u ≠ u ∧ par u ∈ J}` by fibrewise counting along `par` (`card_eq_sum_card_fiberwise`); child sets of distinct vertices are disjoint | V |
| 45 | `card_downPairs_add_card_upPairs` | lemma | F, **A** | ℕ | `#down + #up = D_k`: sum 43 over `v ∈ J` then over `J ∈ I_k`, the `#children` part becoming the down incidences by 44 and the `0/1` part the up incidences | V |
| 46 | `card_upPairs_add_card_rootPairs` | lemma | F | ℕ | `#up + #root = k·#I_k`: root and non-root members partition `J`, `#J = k`. **No acyclicity needed and none taken** | V |
| 47 | `swapMap_mem_upPairs` | lemma | F, **A** | ℕ | well-definedness. *Child branch*: `c ∈ J`, `par c = u`; `par c = c` would force `u = c ∈ J`, contradicting `u ∉ J`. *Swap branch*: independence of `insert u (J.erase w)` from `par_or` plus the branch condition; `#S = (k−1)+1 = k` with `1 ≤ k` available from `w ∈ J`. Both branches reproduced line by line | V |
| 48 | `swapMap_grandparent_pos` | lemma | F | – | child branch: `par (par c) = par u = w ∈ J` — the grandparent **is** in the image's set | V |
| 49 | `swapMap_grandparent_neg` | lemma | F, **A** | – | swap branch: `par (par u) ∉ insert u (J.erase w)`. `≠ u` by 36 (**exactly the CF-LA1-1 obligation, used exactly where the second read says it is needed**); `∉ J.erase w` because it would lie in `J`, differ from `w`, and be adjacent to `w` | V |
| 50 | `swapMap_injOn` | lemma | F, **A** | – | child/child: `u = par c` recovers the source. swap/swap: erase `u`, then re-insert `par u ∈ J_i`. mixed: excluded by 48+49, a property of the image alone | V |
| 51 | `card_downPairs_le_card_upPairs` | lemma | F, **A** | ℕ | `Finset.card_le_card_of_injOn` from 47 and 50 — the single injection the proof of record prescribes | V |
| 52 | **(RC)** `forest_root_corrected_degree_bound` | lemma | F, **A** | ℕ | `D_k + 2·#rootPairs ≤ 2·(k·#I_k)`, additively from 45, 46, 51 by `omega`. **No ℕ-subtraction** | V |
| 53 | `forest_degree_lemma_nat` | lemma | F, **A** | ℕ | drop the nonnegative root term | V |
| 54 | **(DL)** `forest_degree_lemma` | lemma (award) | F, **A** | ℤ | cast of 53 through 17 | V |
| 55 | **(EX)** `forest_extension_inequality` | theorem (terminal award) | F, **A** | ℤ | sum 27 over `J ∈ I_k`, expand the left side (`n·i_k − k·i_k − D_k`) through 17, close against 24 and 54 by `linarith`. Acyclicity enters **once**, through 54 | V |

**Hypothesis accounting.** Finiteness and the decidability instances are used everywhere (they are what makes
`I_k`, the three pair finsets and every cardinality meaningful) and are stated as **instance binders**, never
at one fixed `Fintype` instance — `C-U3-F`'s load-bearing caveat is respected on both award faces. Acyclicity
is consumed only inside the rooting API (entries 33–36 and their consumers) and reaches the terminal
statement exactly once, through (DL). The two ingredients of the (EX) step, `double_count` and `e_ge_sub`,
carry **no** `hG` binder: I verified on the source that the first `IsAcyclic` occurrence in a declaration
signature is at entry 33, so no stray acyclicity binder exists anywhere in the counting core. There is no
`α`/`indepNum` side condition, no `(★)`, no lower bound on `k` and no bound on the order anywhere in the
file.

**ℕ-subtraction and cast audit (independent).** Every quantity in entries 43–53 is a natural number and
every relation among them is additive. The **only** two `Finset.card_erase` steps in the whole source are
line 313 (inside carried entry 20: `(k+1)−1`, exact) and line 872 (inside entry 47: immediately re-added by
`card_insert_of_notMem`, closed by `omega` from `1 ≤ k`), and neither can truncate. No `Int.toNat`,
`Nat.sub` or clamped weight appears. The paper's weighting `2 − deg(v)`, which genuinely reaches `−3` and
`−5` and is the run's named clamping hazard (R9), **never appears**: the injection route replaces it by the
incidence split, so the hazard is structurally absent rather than merely avoided. Both award statements are
in ℤ as required.

**Dependency-graph check.** The contract declares 23 nodes and 40 edges; I recomputed: node set equals the
declared definitions ∪ domains ∪ hypotheses ∪ conclusion, no dangling edge, the graph is acyclic, and every
`dependencies` row of every definition, hypothesis and the conclusion has a matching edge. The contract's 16
`lean_name`s are **exactly** the 16 `definition`-kind entries of the source (no contract definition absent
from the source, none of the source's definitions absent from the contract). `permitted_axioms` is exactly
`propext, Classical.choice, Quot.sound`. **Nothing marked NOT a dependency is a dependency**: `coeff` and
`delta` are declared non-dependencies of the terminal statement, and I verified by search that neither name
occurs anywhere in the source outside its own registrar entry.

---

## Reproduced Mathematical Evidence

All evidence below was produced by instruments I wrote from scratch for this audit, under
`scratchpad/c1-s7-informal-LA1/` (`core.py`, `gen.py`, `run_unlabelled.py`, `run_labelled.py`,
`run_sharpness.py`, `run_counts.py`, `run_slack.py`). Python standard library only; imports are limited to
`itertools` (`combinations`, `product`), `collections` (`deque`, `defaultdict`, `Counter`), `math.comb`,
`hashlib`, `json`, `os`, `re`, `sys`. All arithmetic is exact integer arithmetic. No prior evaluator was
read or imported; no output file carries a wall-clock field. Independent-set enumeration, degrees, the three
pair finsets, the parent map and `swapMap` were re-implemented directly from the Lean definitions.

**E1 — the injection, replayed pair by pair, every unlabelled forest to order 10, at every rooting.**
Unlabelled trees were generated by leaf addition with AHU canonical dedup (a complete construction: every
tree of order m+1 is a tree of order m plus a leaf), then forests as multisets of trees. Class counts by
order came out `1, 2, 3, 6, 10, 20, 37, 76, 153, 329` — the correct forest sequence, an independent check
that the corpus is complete. **637 forest classes, 6,984 rooted instances** (every choice of one root per
component). For every instance and every `k` the instrument verified: the rooting API (`adj_par`,
`rk_par_lt`, **`par_par_ne`**, `par_or` on every edge, root count = component count); the exact degree
decomposition `deg v = #children(v) + [par v ≠ v]`; `sum_card_childrenFinset`;
`#down + #up = D_k`; `#up + #root = k·i_k`; and then, **pair by pair**, for every down incidence: that its
image lies in `upPairs`, that the two-sided grandparent invariant holds with the correct sign on its branch,
that the child branch recovers `u = par c` (so injectivity is independent of the choice function), and
global injectivity of the image map. The replay was run under **two different choice functions** (least and
greatest child in `J`) to confirm the argument does not depend on `Exists.choose`. Then `#down ≤ #up`,
**(RC)**, **(DL)**, **(EX)**, the subtraction-free `e(J) + k + Σdeg ≥ n`, and the double count
`Σ_{J∈I_k} e(J) = (k+1)·i_{k+1}`. **Zero defects.**

**E2 — every labelled forest to order 7, at every rooting, same full replay.** Labelled forests were
enumerated as acyclic edge subsets by incremental union-find; counts by order `1, 2, 7, 38, 291, 2932,
36961`, total **40,232** — exactly the band the contract's `formulation_status` cites, reproduced from
scratch. **280,392 rooted instances**, the identical battery of checks. **Zero defects.**

**E3 — the acyclicity hypothesis is load-bearing, and the two (EX) ingredients are not.** All **33,868**
labelled graphs on 0–6 vertices. No forest violates (DL) or (EX) at any `k`. Non-forests do: the
order-minimal witnesses found are the 4-vertex graphs with 5 edges (`K₄ − e`) at `k = 1`, which violate
**both** (DL) and (EX). So acyclicity is not decorative in either statement. Against the same corpus,
`double_count` and the per-set bound `e(J) + k + Σdeg ≥ n` hold for **every** graph, forest or not,
confirming that carrying them without an `hG` binder is correct and that no stray hypothesis is hidden in
them.

**E4 — the excluded conclusions, checked rather than assumed.**
*Tightness.* Over every instance of E1 and E2 with `k ≥ 1` and `i_k > 0`, (DL) is **never** tight; the
minimum slack `2k·i_k − D_k` over all unlabelled forest classes to order 10 is exactly **2**, and at `k = 1`
the slack is exactly `2c` (`c` = number of components) with zero exceptions. This is Established result 17,
reproduced independently, and it is consistent with §11.1's exclusion (tight only at `k = 0` and where
`i_k = 0`).
*(DL) does not certify acyclicity.* Every cycle `C_n`, `3 ≤ n ≤ 9`, satisfies (DL) with **equality at every
`k`** (every vertex has degree 2, so `D_k = 2k·i_k` identically). Confirmed by instrument.
*Only the root-corrected form at `k = 1` separates.* At `k = 1`, (RC) reads `|E| + c ≤ n`. Over all 33,868
graphs to order 6, `|E| + c ≤ n` holds **iff** the graph is acyclic: **zero mismatches**. So §11.2 is exactly
right in both halves.
*No pointwise claim is available.* The per-`J` inequality `Σ_{v∈J} deg v ≤ 2k` fails on forests — the
smallest witnesses are the star `K_{1,3}` at `k = 1` with `J` the centre (`3 > 2`). (DL) is an average over
`I_k` and the artifact asserts nothing else.

**E5 — the cited counting evidence.** Recomputing unlabelled forest classes through order 16 by the multiset
transform of the tree counts gives `1, 2, 3, 6, 10, 20, 37, 76, 153, 329, 710, 1601, 3658, 8599, 20514,
49905`, summing to **85,624** for orders 1–16 and **85,625** including the empty forest — so the contract's
"85,625 forest isomorphism classes to order 16" is exact, with the empty forest counted. Labelled forests by
the exponential-formula recurrence reproduce `40,232` for orders 1–7. Both cited numbers check out.

**E6 — artifact integrity (recomputed, not trusted).** Capsule seal recomputed by the stated rule
(SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`):
`330ce25019ae2db29089b3476205ff770719e0b47d3930f7299710936ffcb8ba` — **equal** to the declared seal; all
**51/51** members verified by byte count and digest, **0 mismatches**. `THEOREM-CONTRACT.yaml`
`58e4d0a8…b306997`, `INFORMAL-PROOF.md` `e912b6ca…a835e9b` and `Main.lean` `b49ea82a…ac5aafc5a` match the
brief's expected values. All **55** registrar entry digests reproduce the corresponding `Snippets/` fragment
bytes. The four carried G1 entries (`indepCount`, `coeff`, `delta`, `indepCount_eq_card_indepSetFinset`) are
**byte-identical** to r25 entries 1–4 of the frozen award source (whole-file digest `736eb9df…cfe7dfe0`
confirmed) and reproduce the originals' entry digests. All 14 carried U3 declarations are byte-identical at
the declaration level at the exact line ranges the carry table cites; the seven `theorem → lemma` deltas are
**leading-keyword-only**, exactly as recorded, with statement and proof body unchanged. All **22**
`source_materials` digests in the contract match their files. `EVIDENCE/axioms.txt` shows exactly the three
permitted axioms for the terminal declaration; `EVIDENCE/axioms-all-declarations.txt` covers **all 55**
declarations with **no axiom outside the allowlist** and no `sorryAx`. The source contains no `sorry`,
`admit`, `native_decide` or `axiom`, and no `decide` at all.

---

## Independent Critic Pass

A separate adversarial pass over my own ledger, run after the ledger was closed. Each item is an attempt to
break a claim, with the outcome.

**C1 — Is `swapMap` well defined when `u` has a child in `J` that is itself a root?** Attempted: if
`c ∈ J`, `par c = u` and `par c = c`, then `u = c ∈ J`. But `u ∉ J` on `downPairs` (entry 38). Closed: the
child branch always lands on a genuine non-root member. The Lean derives exactly this.

**C2 — Does the swap branch survive when `par u` is itself a root?** Then `par (par u) = par u = w`. The
argument still closes: `w ∉ J.erase w` by `ne_of_mem_erase`, and `w ≠ u` since `u ∉ J`. So the image's
grandparent is outside the image's set, as required. No hidden "the grandparent exists" side condition is
needed — `par` is total, and totality is what removes the "if `p(p(u))` exists" caveat of the critic's prose
version. Closed.

**C3 — Is the separating invariant really a property of the image alone?** Yes: `par (par y) ∈ K` is
computed from the image pair `(K, y)` only. Both signs are proved (entries 48, 49), so no mixed collision is
possible. I also replayed this pair by pair on 287,376 rooted instances (E1+E2) and under two distinct
choice functions. Closed.

**C4 — Does injectivity depend on `Exists.choose`?** No. The child branch recovers `u = par c` from the
image for **every** element of the filter, so the argument is choice-independent; I verified injectivity
empirically under both a least-element and a greatest-element choice. (Lean 4's definitional proof
irrelevance also makes `h.choose` depend only on the proposition.) Closed.

**C5 — Could (RC) be a stronger statement than the corpus supports, e.g. at a rooting that is not
`rootRep`'s?** The Lean statement quantifies over the single rooting `rootRep` supplies; my instrument
checked **every** choice of one root per component, which strictly contains it. Closed, and the claim in the
informal proof that the rooting is one root per component chosen by `rootRep` is correct (`rootRep` is
constant on components, lies in the component, and is a fixed point of `par` because a path from a vertex to
itself is nil).

**C6 — Does (EX) secretly need `k ≥ 1` or `n ≥ 1`?** No. At `k = 0`: `i_0 = 1`, `D_0 = 0`, (DL) reads
`0 ≤ 0` and (EX) reads `n ≤ i_1 = n`, an equality. For `k > n`: `i_k = 0` and both are trivial. The empty
graph was checked explicitly. Closed.

**C7 — Recorded imprecision (non-defect), `INFORMAL-PROOF.md` §8.** The cast audit states that the r25
bridge `indepCount_eq_card_indepSetFinset` is "used exactly twice: once in `forest_degree_lemma` and once
inside the terminal theorem's expansion step". It is in fact invoked **three** times in `Main.lean`: at
lines 1045 and 1074 as stated, and at line 429 inside the carried U3 body `double_count` — a use the
formalizer's own report names (§5: "both `Erdos993G1.double_count` (carried from U3) and this run's
`forest_degree_lemma` depend on it"). The claim is therefore an undercount, true only under the reading
"twice among the declarations authored in-run". Mathematically inert: the lemma is the identity
`i_k = (#I_k : ℤ)`, so no count of its uses can affect soundness, and no truncation is introduced by the
third. Recorded for the controller; **not** a defective step.

**C8 — Recorded imprecision (non-defect), `INFORMAL-PROOF.md` §3 and §7.** §3 says that from
`rootPath_unique` the rest follows "with no further use of acyclicity", and §7 says acyclicity "is consumed
only inside the rooting API, at `rootPath_unique`". `par_or` in fact applies a second acyclicity lemma
directly, Mathlib's `SimpleGraph.IsAcyclic.eq_snd_of_adj_start` — which §3's own proof sketch names one line
later, so the tension is visible on the face of the document. It is not a gap: I read Mathlib's source and
`eq_snd_of_adj_start` is itself proved from `isAcyclic_iff_path_unique`, so both uses are the same
uniqueness principle, both live inside the rooting API, and the load-bearing accounting — acyclicity enters
the terminal statement exactly once, through (DL); the double count and the per-set bound are unconditional
— is exactly correct. The formalizer's report states the precise version ("the only declaration that applies
`SimpleGraph.IsAcyclic.path_unique`"). Recorded; **not** a defective step.

**C9 — Claim not verifiable inside the read boundary.** §9 asserts "No identifier of this run coincides with
any declaration base name of the external slice." Neither the producer (which never opened
`sources/external/lean-source/`) nor this auditor (forbidden to open it) can verify that claim; it is
unverifiable by construction under Gate ruling 3. It is also not load-bearing: the fence is satisfied the
stronger way, by not carrying row 8 at all, and I confirmed the source contains **zero** occurrences of
`indepFinsets`, `degOn`, `R27DegreeLemma` or `AdjU.`. Flagged to the controller as a claim to soften or
drop, not as a defect.

**C10 — Contract description elision.** The `def-indepcount` description's "Lean text" block joins
`universe u` directly to `noncomputable def indepCount …`, eliding the blank lines and the
`namespace Erdos993G1` wrapper that sit between them in the source; the other 15 definition texts appear
verbatim in `Main.lean`. Per R2 namespace wrappers are not bodies, and the definition itself is
byte-identical to r25 entry 1 (digest reproduced), so this is a transcription nicety in a description field,
not a definitional discrepancy. Recorded.

**C11 — Contract over-listing.** The conclusion node lists `def-indepdegreesum`, `def-extensioncount`,
`def-uppairs`, `def-downpairs`, `def-rootpairs`, `def-swapmap`, `def-childrenfinset` and `def-rk` among its
dependencies although the terminal *statement* mentions only `indepCount` and `Fintype.card`. This is the
award's proof closure, which is what R3's "closed dependency graph" asks for; it over-states nothing about
the theorem and mis-states nothing about `coeff`/`delta`, the only entries marked non-dependencies.
Recorded as conservative, not defective.

**C12 — Incidental read outside the enumerated boundary, disclosed.** While verifying the hash table of
`FORMALIZER-REPORT.md` I hashed all 31 listed artifacts, one of which — `FIDELITY-REVIEW.md` — is not in my
brief's read list. Its bytes were hashed, never rendered or read; no content entered this audit. The result
is worth recording for the controller for a different reason: that file no longer matches the formalizer's
recorded digest (it is now 12,484 bytes, not 55), i.e. a later gate has written it since the formalizer
report was produced. Every one of the other 30 artifacts, including `Main.lean`, `THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, both receipts and both axiom files, matches its recorded byte count and digest exactly.

**C13 — Fidelity to the proof of record (R7).** I compared the development against `C-F1-T`'s critique
(Finding 1) line by line. The critique's `S` is the run's `downPairs`, its `T` the run's `upPairs`, its type
A the run's swap branch, its type B the run's child branch, its invariant "`p(p(u)) ∈ K`" the run's
two-sided grandparent invariant, its `Φ` the run's `swapMap`, and its conclusion
`D_k + 2·Σ_i a_{r_i} ≤ 2k·i_k` the run's (RC) in incidence form. The primary (injection) route was taken;
the switch point was never reached; the fallback machinery (U2's `R27DegreeLemma`, the edge-split join, the
separated-union convolution, the all-roots induction) appears nowhere in the source. R7 is met as written.

---

## Scope and Fence Check

| Fence / excluded conclusion | Finding |
|---|---|
| §3.1 no status transfer (r25 Tier 1, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the aggregates, `E993-BETA-AGG`, Erdős #993) | Not asserted anywhere in the contract, the informal proof or the Lean source. §11.6 states the exclusion explicitly. **Clear** |
| §3.2 nothing asymptotic | No `N₀`, no CLT, no unimodality, no "sufficiently large". **Clear** |
| §3.3 an average statement, no pointwise degree claim | Stated on the docstring of `forest_degree_lemma` and in §§2, 11.4; and the pointwise form is *false*, as my instrument exhibits. **Clear** |
| §3.6 every declaration authored in-run, no external Lean text, renamed identifiers | 37 declarations authored in-run; 18 carried from two in-run sources with digests; `sources/external/lean-source/` never opened by producer or auditor; zero occurrences of the three rename-flagged identifiers. The three mandated renames do not arise because row 8 is not carried. **Clear** (see C9 for the one unverifiable sub-claim) |
| No tightness claim for (DL) | Not claimed; and independently confirmed never tight for `k ≥ 1`, `i_k > 0` (min slack 2). **Clear** |
| No claim that (DL) certifies acyclicity | Not claimed; and independently confirmed that every cycle meets (DL) with equality, while (RC) at `k = 1` is equivalent to acyclicity. (RC) is proved here but **no acyclicity-characterisation corollary is drawn**, and (RC) is not an award statement. **Clear** |
| No `α`/`indepNum` hypothesis, no `(★)` | No such binder exists in the source. **Clear** |
| No no-recovery reading, no order bound, no (LB)/(R5)/(XR), no descent statement | None appears; `firstDescent` is absent from contract and project (a declared deviation, see below). **Clear** |
| Attribution travels on the face | `INFORMAL-PROOF.md` §0 and both award docstrings carry FLNYZ 2026 §8 for the mathematics; `C-F1-T` for the injection derivation, sustained by the F adjudication; U3 / `C-U1-T` for the compiled (EX) step; the r25 award for the G1 definitions of record. The contract's `informal_statement` — the hashed claim itself — carries the same attribution, so it travels in the scope text as well. T1's two-potential architecture was not used and is not claimed. **Clear** |
| Grade discipline | The artifact claims `compiled-candidate`, not `formally_verified`; `## Remaining gates` lists the gates still owed. Nothing in this audit upgrades any grade. **Clear** |

**Declared deviations I confirm as correctly declared, for controller adjudication (not defects):**
(i) `firstDescent` is absent from the contract and the project, contrary to the literal wording of R3. I
confirm it is a dependency of neither award declaration, that it belongs to (XR)/`C1-LA4`, that U3's source
defines it via an existence lemma (so the registrar's definition-before-lemma ordering genuinely blocks it),
and that the other two definitions R3 names — `indepDegreeSum` and `extensionCount`/`e` — are both present
with their Lean text. (ii) The seven `theorem → lemma` keyword changes on carried U3 bodies, recorded as
re-derivations per R2; I verified each is keyword-only with statement and proof body byte-identical.

---

## Verdict

**passed.**

The intended claim is exactly the contract's `informal_statement`, its `claim_sha256` recomputes to
`dd45d580a9381c1e31b920d511f14d18a2dfaad215a8d881ccb2e1c74e814885`, and `INFORMAL-PROOF.md` is a correct,
complete, statement-level proof of it. Every definition matches its authority literally and byte-for-byte
where byte-identity is claimed; every inference in the chain — the rooting API, the exact degree
decomposition, the incidence split of `D_k`, the single injection with its two-sided separating invariant
(including the `p(p(u)) ≠ u` obligation of controller fact CF-LA1-1, supplied as the named lemma
`par_par_ne` from `rk_par_lt` and used exactly where the second read says it is needed), the additive
assembly of (RC), the drop to (DL), and the composition with the two unconditional counting facts to (EX) —
was re-derived here and holds; the terminal declaration's hypotheses match the claim one for one, with
acyclicity and finiteness only; no ℕ-subtraction can truncate anywhere in the chain and the clamping hazard
R9 names is structurally absent; nothing marked as a non-dependency is a dependency; and the claim asserts
nothing fenced.

Three imprecisions are recorded above (C7, C8, C10) and three items are flagged for controller attention
(C9, C11, C12), together with the producer's two declared deviations. **None of them is a defective step**:
none changes a statement, a hypothesis, a fence, or the truth of any inference, and each is stated here
precisely rather than softened. No defect was found, and none was repaired by this seat — no run artifact
was edited.
