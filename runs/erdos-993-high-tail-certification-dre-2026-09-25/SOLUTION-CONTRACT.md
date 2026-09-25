# Solution Contract — r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence)

## 1. Targets and tiers

| Tier | Key | Statement | Status entering r29 |
|---|---|---|---|
| 1 | `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB) | Every finite bipartite simple graph `H`, every `W ⊆ V(H)`, `a = α(H)`, every `1 ≤ k ≤ a`: `k·q_{k+1} ≤ 2(a − k)·q_k` in ℤ. | OPEN in the master registry (proposal only; Codex C2 scope audit approved the identity). Internal lemma `taggedShadowBound` compiled inside the first-interior award at a `U`-relative cap hypothesis. |
| 1 | `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP) | Every finite bipartite `G`, original leaf `v` with support `s`, integer `p ≥ 1` with `3p ≥ 2α(G) + 1`: `Δ_{p−1}(G − {v, s}) − Δ_{p−1}(G − N_G[s]) ≤ 0`. | OPEN (proposal). Internal private lemma `leaf_term_nonpos` at `p ≥ 2`; `p = 1` is NEW endpoint work. |
| 1′ | `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA) | Every finite bipartite `G`, every `p ≥ 1` with `3p ≥ 2α(G) + 1`: `S(G, p) ≤ 0` (original selector, one tag per original leaf). | New run-local key (the corollary the charter asks for on Target 2's face). Internal `bipartiteHighTailAggregate` at `p ≥ 2`. |
| 1 | `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG) | Every finite tree `T`, integer `p = α(T) − 2`: `x(T) + 2 ≤ p ⇒ α(T) ≥ 7`. | OPEN (proposal). Internal lemma `eligibleAlphaGeSeven` compiled and kernel-checked inside the award. |
| 1 | `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN) | Every finite tree `T`, `p = α(T) − 1`: `x(T) + 2 ≤ p ⇒ S(T, p) ≤ 0`. | New run-local key (the charter's Target 4; Astra's proposed corollary, "supported informally"). |
| 2 | Boundary record `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` | The smallest bipartite graph, and the smallest tree, with an original leaf whose term is POSITIVE at `3p = 2α(G)` (or the largest `p` below the guard where positivity occurs), if any; the guard's precision. | Record (`bounded_computation` / `explicit_exact_finite_counterexample` to the STRONGER unguarded statement, which is already REFUTED as `E993-BETA-TARGET` in the governed setting and needs no new refutation key — a boundary record only). |
| 3 | Structural lemmas proved on the way (e.g. `α(H_v) ≤ α(G) − 1`; `q_j = i_j(H) − i_j(H − W)`; the `p = 1` characterisation `term = deg(s) − 1`) | Each a separate `E993-R29-…` key at its grade only if the synthesis judges it worth registering; otherwise companion lemmas on an award's face. | New. |

## 2. The exact Lean targets (Stage 7 statements of record unless the synthesis narrows them)

Definitions of record carried BYTE-IDENTICALLY through the registrar from the first-interior award source
(`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`; fragments under `…/Snippets/`): entries 1–14
(`C4LA1.*`, `C5LA1.*`), 15–17 (`Erdos993G1.indepCount/coeff/delta`, themselves byte-identical to the r25 award), 18
(`E993Interior.taggedFamily`), and — where an award's proof uses them — entries 19–40 (the `Erdos993G1` counting lemmas the
guard needs), 41 (`taggedShadowBound` with its `Core` helpers), 42 (`highTailAggregateFromShadow` with its `Leaf` helpers),
43 (`eligibleAlphaGeSeven` with its `Guard` helpers), 44 (`bipartiteHighTailAggregate`). A carried fragment enters as one
registrar unit; its `private` helpers travel inside it and remain callable within the single source file. Every NEW
declaration is authored in-run. Run-local definition (optional, for the registry wording of `q_j`):
`taggedCount H W j := (taggedFamily H Finset.univ W j).card`.

```lean
-- Target 1 (TSB): the registered statement (1 ≤ k ≤ a, integers). Companion: the ℕ form without k ≤ a (holds vacuously
-- above a); the identity taggedCount H W j = indepSetCount H ∅ j − indepSetCount H W j.
theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
    (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card

-- Target 2 (HTP): pointwise, p ≥ 1 (the p = 1 endpoint proved in-run), no residual/selector/connectivity hypothesis.
theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0

-- Target 2 corollary (HTA), on the same award's face (a second theorem-level declaration is a companion lemma; the
-- award's terminal theorem is the pointwise statement unless the synthesis rules otherwise):
lemma bipartiteHighTailAggregateAllRanks {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0

-- Target 3 (ELIG): the carried lemma re-exported as the terminal theorem (keyword-only re-derivation permitted).
theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum

-- Target 4 (TRN): the non-residual eligible top-rank corollary.
theorem topRankNonResidualAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0
```

Binder and cast conventions: `k ≤ H.indepNum` makes the ℤ subtraction equal the ℕ one; `p ≥ 1` makes `p − 1` the integer
rank; the ℕ hypotheses `crossingIndex G + 2 ≤ G.indepNum − d` (`d = 1, 2`) are false for `α < d` and equal to the integer
hypotheses otherwise — the fidelity review records this equivalence on each face (as the first-interior contract did).
Permitted axioms `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `native_decide`, `axiom`; no `decide`
over an enumeration for a universal step. One terminal `theorem` per award; every other declaration a `def` or `lemma`.

## 3. Fences

1. (TSB), (HTP), (HTA), (ELIG), (TRN) are statements about independent-set counts on finite bipartite graphs and trees.
   None is a no-recovery statement; none transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1,
   FOREST, TREE, TRANSFER, `E993-BETA-AGG` (governed RTree; needs an ordinary-to-governed bridge never attempted here),
   or Erdős #993.
2. `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` (VERIFIED, the first-interior award) and `E993-R26-TOP-RANK-RESIDUAL-SIGN`
   (VERIFIED) are never re-registered and their faces never edited; the relation of (TRN) to r26 and of (ELIG)/(HTA) to
   the first-interior award is recorded as scope notes with statuses unchanged.
3. The lower region `3p < 2α(T) + 1` is OUT OF SCOPE: no seat proposes, tests or attacks a compensation mechanism there;
   a boundary witness (§1 Tier 2) is a record about the guard's precision, never a step toward the lower region.
4. `E993-BETA-TARGET` (REFUTED: the all-window governed pointwise `(β)`), `E993-BETA-AGG-SUPPORT` (REFUTED) and
   `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (REFUTED: "at most `r` addable vertices" for every independent `r`-set) stay
   REFUTED at their exact scopes; (HTP) is a proper rank restriction on ordinary bipartite graphs and (TSB) is a
   size-restricted incidence count — neither is an alias of a refuted key (Codex's C2 scope audit recorded the
   distinctions; the run-local `CLAIM-DISTINCTIONS.json` carries them).
5. The census values (`M(6) = 22`; K1-addition closure `x ≤ 6`) are `bounded_computation`/census-dependent and never
   enter a proof or a Lean file; the r27 optimized root correction `M_k` and the r28 Hall/SDR route are not used.
6. Sealed r24–r28 records, the first-interior root and the follow-ups root are never edited; corrections are records.
7. Attribution travels on every face (SEMANTIC-CONTRACT §3): Codex (GPT-6) for the mechanism and the proposed
   statements; r26/r24/r25 for the definition layers; r29 seats and critics for their derivations.
8. Every award is a SEPARATE certificate: the three auxiliary keys change OPEN → VERIFIED only by their own awards; the
   internal lemmas' presence inside the first-interior package is context, never a certificate (the first-interior
   record's own words). Nothing marked compiled-internal is presented as awarded until its own close.

## 4. Evidence grades

As r28: `formally_verified` > `proved_informal` > `conditional` > `bounded_computation` > `conjecture`; `REFUTED` never
regresses; a statement first made at a review stage is STATED and needs an isolated second read before registration;
a composition's grade is its weakest input's; a compiled internal lemma inside another award's package has NO grade of
its own until its own certificate closes.

## 5. Stop gate (armed every cycle)

Decisive events: (a) all four targets `formally_verified` at §2 — the run ENDS at that cycle's Stage 7 close; (b) an
in-scope counterexample to a target (exact finite counts; two independent instruments; an isolated second read) — that
target closes REFUTED with its record and the others proceed. Each cycle's Stage 7 may fund any subset of the four award
groups whose DAG the synthesis rules closed; a blocked award carries its exact obligation into the next cycle's
portfolio. The run ENDS when every target is formally verified, refuted, or closed fail-closed with an exact blocked
obligation after the bounded repair budget; plateau: a cycle with no material progress on any open target. Six cycles is
the ceiling; controller checkpoint after Cycle 3.
