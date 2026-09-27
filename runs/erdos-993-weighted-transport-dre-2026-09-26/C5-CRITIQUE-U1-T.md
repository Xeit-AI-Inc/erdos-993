# Critique

Critic `C-U1-T` (orientation T, prove) of seat `U1`, route `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER`, r30 Cycle 5 Stage 4
(`erdos-993-math-dre-20260926-r30-weighted-transport`), 2026-09-27.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** Operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the first 150 lines of the startup protocol; the rest was not
needed for this task). No other VerityOS file was opened. The host injected the project `CLAUDE.md` and the user's memory
index into context at session start; I did not open or act on either, and I kept no conversation log (writes are
restricted to this critique and my scratch).

**Read boundary.** I read the dispatch (`DISPATCH-C-U1-T.md`, SHA-256 `2ff07bb4…a7923`, verified before I followed it), the
14 capsule members, my own seat's section of the attack briefs (lines 1–19 preamble and 115–136 only), the U1 return, the
inventoried artifacts under `scratchpad/c5-U1/` (copy-out-first), and under `sources/`: `mathlib-binding/PIN.json` and
`first-interior/c2-primary-v2/LeanProject/` (the seed files and `Main.lean`, for byte comparison and the `crossingIndex`
entry). In the Stage 2 manifest (a capsule member) I looked up digests with a Python filter; I read no listed file outside my
grant. `sources/r24/` does not exist (one `ls` of that exact path returned "No such file"). I ran no `find`/`grep`/`rg`
above my grant: every `grep` was on a named single file inside the grant, and the one `find` was inside my own scratch. No
network, no installs. No `lake update`/`lake clean`. Every `lake`/`lean` call ran after `cd` into my copied pinned project.
I started no background job, so none needed killing. I did not read `runs/`, `cycles/cycle-4/`, `second-reads/`, the
run-local registry, another return, any critique or adjudication, or `sources/heterogeneous-closure/`.

## Identity and seal audit

- **Capsule seal** (`control/c5-critic-capsules/U1-PACKET-MANIFEST.json`), recomputed as canonical JSON without
  `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline): `79e10b9480265280e7a8ccec911b39ffc6466fd28bf976bf8bfd4f94e8dcc6a5`
  — **matches**. All 14 members match their listed SHA-256 and byte counts.
- **Stage 4 dispatch manifest seal** recomputed `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` = recorded.
  **Stage 3 manifest seal** `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` = recorded.
- **Stage 2 seal** recomputed `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` = the manifest's own field, the
  common brief's literal, and the return's literal. **Discrepancy:** `C5-CRITIC-PROTOCOL.md` duty 1 quotes
  `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684` as the Stage 2 seal. No capsule member reproduces that
  literal. I treat it as a stale literal in the protocol (clone residue class, R30-E-h) and use the recomputed value, which
  the common brief confirms. This is a controller erratum, not a U1 defect.
- **Return digests.** All seven inventoried digests match on disk: `lakefile.toml` `45d0ca58…`, `lake-manifest.json`
  `52a4d73c…`, `lean-toolchain` `2bdc48ad…`, `LeanProof.lean` `f4dfdef8…`, full `Main.lean` `05c24dda…` (3229 lines), first
  2956 lines `66db6c73ad8f…` (131 533 bytes), `gk_tree_layer.py` `d5dc3200…`.
- **Carry of C4-LA1's text.** The file `runs/…c4-la1…/Main.lean` is outside my grant and is not a Stage 2 member, so I could
  not byte-compare the 2956-line prefix against the award file itself. What I could establish:
  1. The prefix hash equals the `66db6c73…` prefix quoted by gate ruling 40 (a capsule member) as C4-LA1's text of record.
  2. All 113 registrar entries in U1's file hash to their own header digests. This covers entry 22 `gkEdge` (`fa84b00e…`)
     and entry 23 `gkGraph` (`2cc3de97…`).
  3. The 14 entries shared with the first-interior source of record
     (`sources/first-interior/c2-primary-v2/…/Main.lean`, `8d864da2…`) are byte-identical: `C4LA1.*`, `C5LA1.support`,
     `leafSet`, `H`, `R`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`, `aggregate`, and
     `E993Interior.taggedFamily`/`highTailAggregateFromShadow`.

  The Snippets digest comparison the brief requests remains for an adjudicator who holds `runs/`.
- **Seed files.** The four seed files are byte-identical to `sources/first-interior/c2-primary-v2/LeanProject/`'s. The
  return's "byte-identical to C1-LA1's" is outside my grant but consistent with this. `PIN.json` (`af78b3d8…`) names
  `sources/r24/c5-la1/LeanProject/` as the seed location, and that path does not exist. That is a stale pointer in a frozen
  source (noted only). The Mathlib rev `905b9581…` matches in the lakefile, in `PIN.json` and in the shared project's
  manifest.
- **Model disclosure.** The return discloses chartered sonnet/xhigh, runtime `claude-sonnet-5`. That is consistent with the
  allocation ("routes Claude Sonnet 5 xhigh").
- **Read-boundary disclosures.** U1's three items are two names-only `ls` and one `find` inside Mathlib. They match the
  Stage 3 disclosures record item for item. Note only.

## Independent re-derivation

**Fidelity (duty 2).** The return computes no weight, relation, selector, supply, capacity or `S`: its object is the
unweighted structural layer of `G_k`. The fidelity questions (active tags; (D) ∪ (S); `F` at rank `p`) are therefore
vacuous for its numbers, and the return says so accurately. One part applies: `x` must be computed through rank `α`.
U1's `crossing_index` appends the zero-extension coefficient and scans `j = 0..α`, which is correct. My instrument does the
same.

**Lean rebuild (copy-out-first).**
- Setup: I copied the four seed files and `Main.lean` into `scratchpad/c5-crit-U1-T/LeanProject/` and bound
  `.lake/packages` by manual symlink to the shared `mathlib-v4.32.2-project`.
- Build: `lake build` ran in the foreground from a cold `.lake/build`. It reported `Build completed successfully (8657 jobs)`
  in 21 s. The only warning was a pre-existing `Try this` hint at line 758 of the carried prefix.
- Probe file (`Check.lean`):
  - `#check gkGraph_isTree : ∀ (k : ℕ), (gkGraph k).IsTree`, general in `k`.
  - `#print SimpleGraph.IsTree` shows Mathlib's structure with fields `connected : G.Connected` and
    `isAcyclic : G.IsAcyclic`.
  - Both projections extract from `gkGraph_isTree k`.
  - Two `decide` spot checks at `k = 2` confirm that `gkGraph` is the literal relation: `0 ~ 5` holds and `1 ≁ 2`.
- `#print axioms`:
  - `gkGraph_isTree`, `gkChildEdge_range`, `gkGraph_card_nonroot` and C4-LA1's terminal
    `gk_deletionSaturatingFlow_of_rank_ge` give `[propext, Classical.choice, Quot.sound]`.
  - `gkGraph_connected`, `gkGraph_reachable_zero`, `gkGraph_adj_parent`, `gkChildEdge_injective`, `gkParentVal_lt`,
    `gkParentVal_le` and `gkParentVal_at_arm_tip` give `[propext, Quot.sound]`.
- The appended block (lines 2957–3229) contains no `sorry`, `admit`, `native_decide`, `axiom` or `decide`.
- **Proof review.** Connectivity comes from explicit walks of length ≤ 3 from `gkVertex k 0`: a case split on `v.val`, with
  `i := (v.val − 5)/3` guarded by `omega` from `v.val < 3k+5`. Acyclicity comes from Mathlib's
  `isTree_iff_connected_and_card`:
  1. An injective map `gkChildEdge` sends non-root vertices to `s(v, parent v)`.
  2. Injectivity holds because `gkParentVal` is strictly decreasing on `n ≥ 1`, so `v = parent w ∧ w = parent v` is
     impossible.
  3. The range of `gkChildEdge` equals `edgeSet`, shown by one case per `gkEdge` disjunct: the child is always the
     larger-valued endpoint.
  4. The non-root count is `3k+4`.

  Every ℕ subtraction (`n − 1`, `(n − 5)/3`, `(n − 5) % 3`) sits under a branch guard discharged by `omega`. The argument is
  uniform in `k`, with no enumeration. `k = 0` is covered (the arm branch is vacuous by `omega`). **`gkGraph_isTree` is a
  genuine, general, kernel-checked proof. Grade `compiled` (scratch; no award).**

**Numeric replay.** I ran U1's generator copy-out-first in `scratchpad/c5-crit-U1-T/replay/` with `python3 -B` (23 s). It
reproduces `RESULT_SHA256 60f1b4cf2414e933376a2a5819bc8ad738b0f883412597a9998e0d223e6f2f70` byte-identically.

**My own instrument** (`crit_gk.py`, stdlib only) is independent of U1's code:
- adjacency is evaluated from the literal `gkEdge` disjunction over all ordered pairs;
- tree test by BFS plus edge count, `k = 0..60`;
- `I(G_k)` by exhaustive subset enumeration (`k ≤ 4`) and, separately, by a leaf-pruning DP (`k ≤ 60`), both equal to the
  closed form `P_k = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`;
- `α = 2k+3` and `x` through rank `α` for `k = 0..400`, with `x(G_0) = 2`, `x(G_1) = 3` and `x(G_k) = k+1` for `2 ≤ k ≤ 400`;
- every step of the proof below checked in exact integers or `Fraction` for `k = 0..400`, with zero failures
  (`RESULT_SHA256 9d4c9ea3…0309`).

The return's tabulated coefficients (`88/87`, `377/367`, `7519/7391`, `17524403/17508787`) and its `8Δ_{k+1}` values
(`8, −8, −80, −1024, −124928`) are all **correct** by my instrument. They are not produced by U1's shipped code (see
Certification audit).

**Critic-derived advance (C-U1-T; STATED at a review stage, `proved_informal` pending an isolated second read).**
*Theorem.* For every `k ≥ 0` and every `0 ≤ j ≤ k`, `Δ_j(G_k) = i_{j+1}(G_k) − i_j(G_k) ≥ 0`. Moreover
`Δ_{k+1}(G_k) = −2^{k−3}(k² + 3k − 8)`. Hence `x(G_k) = k+1` for every `k ≥ 2` (and `x(G_k) ≥ k+1` for every `k`).

*Proof.*
- **Setup.** Rooting at `0`, `P_k = (1+y)·Q` with `Q = C + R`, where `C = (1+3y+y²)^{n}`, `n = k+1`, and
  `R = y(1+y)(1+2y)^k`. The block factors are:
  - root excluded: leaf `1+y`, cherry at `2` `1+3y+y²`, each arm `P_3` `1+3y+y²`;
  - root included: `y·1·(1+y)²·(1+2y)^k`.

  Write `c_j`, `r_j` for coefficients.
- **Domination** `c_j ≥ (k+1) r_j` for all `j`. Split `1+3y+y² = (1+2y) + y(1+y)`. Keeping the first two binomial terms,
  `(1+3y+y²)^k ≥ (1+2y)^k + k·y(1+y)(1+2y)^{k−1}` coefficientwise. Multiply by `1+3y+y²`, then use `1+3y+y² ≥ y + y²` on
  the first term and `1+3y+y² ≥ 1+2y` on the second. This gives `C ≥ y(1+y)(1+2y)^k + k·y(1+y)(1+2y)^k = (k+1)R`.
- **Ratio margin.** `C` is real-rooted with positive coefficients, of degree `2n` and palindromic. By Newton's inequalities,
  `c_{j+1}/c_j` is nonincreasing in `j`. At the centre, `c_n² ≥ c_{n−1}c_{n+1}(1+1/n)² = c_{n−1}²(1+1/n)²`. So
  `c_{j+1} − c_j ≥ c_j/n ≥ r_j` for every `j ≤ n − 1 = k`.
- **`Q` is nondecreasing through index `k+1`.**
  `q_{j+1} − q_j = (c_{j+1} − c_j) + (r_{j+1} − r_j) ≥ r_j + r_{j+1} − r_j = r_{j+1} ≥ 0` for `j ≤ k`.
- **Multiplying by `1+y` preserves this.** The new coefficients are `p_j = q_j + q_{j−1}`. So `p_{j+1} − p_j` is a sum of two
  nonnegative increments of `Q` for `1 ≤ j ≤ k`, and `p_1 − p_0 = q_1 ≥ 0`. So `Δ_j(G_k) ≥ 0` for `j ≤ k`.
- **The first descent.** By palindromy `c_{k+2} = c_k`. Therefore
  `p_{k+2} − p_{k+1} = (q_{k+2} − q_{k+1}) + (q_{k+1} − q_k) = r_{k+2} − r_k`. Here `r_{k+2} = 2^k` and
  `r_k = k·2^{k−1} + C(k,2)·2^{k−2}`, so `Δ_{k+1} = −2^{k−3}(k²+3k−8)`, which is `< 0` iff `k ≥ 2` (`+1` at `k = 1`). ∎

This re-derives the registered `8Δ_{k+1} = −2^k(k²+3k−8)` in two lines and supplies the missing half: no descent before
`k+1`, which is exactly what the brief named. **Undischarged classical dependency:** Newton's inequalities for real-rooted
polynomials (named on the face; not under `sources/`).

**Consequence for the Lean line (critic finding).** The `G_k` (HALL)-shaped corollary at every eligible rank needs only
`k + 1 ≤ crossingIndex (gkGraph k)`, i.e. the half just proved. From it, `hElig : crossingIndex + 2 ≤ p` gives `p ≥ k+3`, and
`favorableLeaves ⊆ leafSet` by the filter. C4-LA1's terminal `gk_deletionSaturatingFlow_of_rank_ge` (every `F ⊆ leafSet`,
every `p ≥ k+3`) then yields `∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f`, with deletion support
(a special case of (D) ∪ (S)). The corollary uses **neither `indepNum = 2k+3` nor the `Δ_{k+1} < 0` half nor any `k ≥ 2`
guard**. It is true for every `k`, vacuously for `k ≤ 2`, where no rank is eligible. `IsTree` (U1's theorem) is needed only
to state it as an instance of the tree-scoped (HALL) signature.

## Attacks and findings

1. **`gkGraph_isTree` (∀ k): survives.** Statement, definition carry, `IsTree` meaning, uniformity and axioms are verified
   above. The brief's "child→parent bijection" and "descent to the root" are implemented as injection plus exact range, and
   connectivity uses explicit walks. Both are valid.
2. **"`crossingIndex = k+1` is supplied informally" (return step 6 and remaining obligation 2): struck as a proof claim.**
   The return's "informal proof" is the closed form plus a bounded scan to `k = 400`. That is a formula plus
   `bounded_computation`, not a proof of `Δ_j ≥ 0` for `j ≤ k` at all `k`. The gap is closed above by the critic, not by U1.
3. **CD-1 "type-checks against the current definition layer (`clawRank`, `clawLayer`, `clawShadow` all elaborate)": struck
   (unbacked).**
   - None of `clawRank`/`clawLayer`/`clawShadow`/`clawProduct_normalizedMatching` exists in any shipped file. The shipped
     `Main.lean` contains no claw declaration.
   - The check file was deleted, and no log or statement text was shipped.
   - I therefore cannot answer the brief's questions: whether the claw-product poset is defined or abstract; whether the
     scope `q_i ≥ 1` and covers `L_k → L_{k−1}` hold; whether SR-C4-5's guards (`N_{k−2} = 0` at `k = 1`, no truncated
     subtraction) are respected.
   - The claim that the statement "is the T adjudicator's draft" is likewise unverifiable from the evidence.
   - CD-1 stays `proved_informal` at its Cycle 4 grade, and U1 contributes **nothing checkable** toward its Lean form.
4. **`indepNum = 2k+3` scoping: correct, but off the critical path.**
   - The witness `{1,3,4} ∪ {5+3i, 7+3i : i < k}` is independent and has size `2k+3`.
   - The fiber bound works: core `{0..4}` ≤ 3 (a star-plus-cherry tree whose maximum independent set is `{1,3,4}`), and each
     arm `P_3` ≤ 2.
   - The Mathlib names exist in the pin: `IsIndepSet.card_le_indepNum` needs `[Finite α]`;
     `exists_isNIndepSet_indepNum`; `Finset.card_eq_sum_card_fiberwise` needs `Set.MapsTo`.
   - The return's phrase "at most one of its three vertices' pairwise-adjacent middle can coexist with both ends" is garbled.
     The intended fact (a `P_3` has independence number 2) is right.
   - As shown above, `indepNum` is **not needed** for the `G_k` (HALL) corollary. U1's ordering ("1. indepNum first") is
     therefore not "the order most likely to close fastest".
5. **`crossingIndex` is not in the carried text.** In my build, `#check C5LA1.crossingIndex` fails with `Unknown identifier`:
   C4-LA1's `Main.lean` does not carry entry 14. The Lean node must carry first-interior entry 14 (`378868ab…`,
   `Nat.find` with the terminal-difference existence proof) byte-identically through the registrar, keyed by origin. U1's
   "port … `Nat.find` definition" should read "carry", never re-author (ruling 40).
6. **Scope and overlap.** No Hall, weight, flow, cut or aggregate claim is made. No natural-number subtraction issue arises
   in the shipped Lean: every guard was checked. Nothing is circular.
7. **Replication versus contribution.** `α(G_k) = 2k+3` and the closed form are already registered (SR-C4-8 / the eligibility
   key's companion content), and U1 correctly labels them replication with no new key. A "generic DP versus closed form"
   agreement at `k ≤ 40` is two independent codes and is admissible as a bounded check. It adds nothing to a proved
   statement.

**Standing letters (gate ruling 39):** U1 supplies **none** of (a′)–(d′). No Lean award beyond seeds (compiled scratch only),
and none of (a′)–(c′). The critic-derived `x(G_k) ≥ k+1` lemma supplies no letter either. It shortens the path to a (d′)
Lean corollary, which would still need one of (a′)–(c′).

## Mechanism-equivalence and fence check

- None of the ten refuted mechanisms is touched: the return asserts no transport relation, tag, retag, occupancy or
  covariance object.
- The critic's corollary route uses C4-LA1's deletion-supported flow on `G_k` at its registered restricted scope. It is not
  `E993-R23-LITERAL-DELETE-ONLY-HALL` revived: that key is refuted at its own scope, while the `G_k` family theorem is a
  separate verified key. It is also not per-leaf injectivity (a flow is not linear injectivity; C4-LA1's face records this
  fence).
- No closed region is re-proved. No census value enters any proof: the `k ≤ 400` scan is corroboration, and the critic's
  proof uses none. No RTree wording. No live root read. (LIFT) and (DCB) are unused. `D, C ≥ 0` is unused.
- **Claim identity.** Keys touched:
  - `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` (consumed);
  - `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (companion content
    `α`, `x ≤ k+1`, the `8Δ_{k+1}` form);
  - `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (grade unchanged);
  - (HALL) and the primary aggregate, untouched under their master names.

  U1 proposes no key, which is correct. For the critic-derived statement, the synthesis should decide whether it is a
  scope/companion note on the eligibility key (which carries `x ≤ k+1` on its face) or a separate key. A candidate predicate
  name, if separate: `E993-R30-GK-TREE-CROSSING-INDEX-EQUALS-K-PLUS-ONE-FOR-K-AT-LEAST-TWO`. **Alias check not performed**:
  the run-local registry is outside my capsule, and the lexical and mathematical check against it is owed by the adjudicator
  or synthesis.

## Certification audit

Stands (backed by my replay):
- "`gkGraph_isTree`, general in `k`, sorry-free"
- "`#print axioms gkGraph_isTree`: `[propext, Classical.choice, Quot.sound]`"
- "Build completed successfully (8657 jobs)"
- the seven artifact digests
- "first 2956 lines = `66db6c73…`" (as a hash of U1's file; binding to the award file is via the gate-40 prefix only)
- `RESULT_SHA256 60f1b4cf…`
- "61 / 40 / 400 rows"
- "`x = k+1` on `k = 2..400`"
- the `k = 1` exception (`x = 3`)
- "26 new declarations" (I counted 26 in lines 2957–3229)

**Struck or corrected:**
1. "`#print axioms` … on every declaration built along the way … all checked individually, **same axiom list**". False as
   written: seven of the helpers depend on `[propext, Quot.sound]` only. This is harmless (a subset of the permitted list),
   but the literal is inaccurate.
2. "CD-1 … **type-checks** against the current definition layer (`clawRank`, `clawLayer`, `clawShadow` all elaborate)" and
   "exactly one warning … and no error". Unbacked: nothing shipped, file deleted. Struck.
3. "my script's `8·Δ_{k+1}` column matches `−2^k(k²+3k−8)` exactly at every `k` checked" and the table's `i_{k+1}`, `i_{k+2}`
   values. `gk_tree_layer.py` computes neither `Δ_{k+1}` nor the formula and prints no coefficients, so the "column" is not
   produced by the shipped generator. The values are correct by the critic's instrument, but the return's attribution to its
   generator is struck. The same applies to "Two instruments … the already-registered `8·Δ_{k+1}` formula are cross-checked
   at `k = 1..400`".
4. "`crossingIndex = k+1` is supplied **informally**". Struck as a proof claim (bounded evidence only). Superseded by the
   critic's proof.
5. The return's "IMPORT LIST: `hashlib`, `json`" versus the script docstring's "hashlib, json, sys". The code imports
   `hashlib, json`. Cosmetic.
6. The appended-block header comment says the object includes "`indepNum = 2k+3`", which is not proved in the file.
   Cosmetic, but it should not survive into an award.
7. "byte-identical to C1-LA1's" (seed files) and "byte-identical to C4-LA1's frozen `Main.lean` (Cycle 4 close table)".
   Not verifiable in my grant. Both are consistent with what I could check (first-interior seed identity; gate-40 prefix).
   Left for an adjudicator holding `runs/`.

## Verdict

verdict: retained_narrowed
headline_resolved: no

Retained: `gkGraph_isTree (k : ℕ) : (gkGraph k).IsTree`, general, kernel-checked, three permitted axioms at most. Grade
`compiled` (scratch; no award; no key). Narrowed away:
- the CD-1 "type-checks" claim (unbacked);
- the "informal proof" of `crossingIndex = k+1` (bounded evidence only);
- the uniform-axiom-list literal;
- the attribution of the `8Δ_{k+1}` column to the shipped generator.

The critic-derived theorem `Δ_j(G_k) ≥ 0` (`j ≤ k`), hence `x(G_k) = k+1` for all `k ≥ 2`, is in my view mathematically
complete at grade `proved_informal`. It carries one named classical dependency (Newton's inequalities) and needs an
isolated second read before registration. Chartered opus/medium; transport-resolved model opus (explicit parameter);
runtime-reported model id: claude-opus-5-5[1m].

## Remaining obligation

The smallest Lean node on this line is **`k + 1 ≤ C5LA1.crossingIndex (gkGraph k)`**, equivalently
`∀ j ≤ k, 0 ≤ C5LA1.forwardDifferenceDel (gkGraph k) ∅ j`. It requires:
1. carrying first-interior entry 14 (`378868ab…`) byte-identically;
2. a count bridge: `indepSetCount (gkGraph k) ∅ j` equals the `j`-th coefficient of `(1+y)·[(1+3y+y²)^{k+1} + y(1+y)(1+2y)^k]`,
   from the root split and the block product;
3. the two inequalities of the critic's proof: coefficientwise domination `C ≥ (k+1)R`, and the ratio margin
   `c_{j+1} − c_j ≥ c_j/(k+1)` for `j ≤ k`. The margin needs Newton's inequality for `(1+3y+y²)^{k+1}` or an elementary
   substitute; Mathlib coverage is unchecked.

With that node, the `G_k` (HALL)-shaped corollary at every eligible rank follows in a few lines from C4-LA1's terminal
theorem plus `gkGraph_isTree`. `indepNum = 2k+3` and `Δ_{k+1} < 0` are not needed for it; they are needed only to state
eligibility non-vacuously (the family is eligible iff `k ≥ 3`).

CD-1 in Lean remains wholly open. Its statement must be shipped, with the claw definition layer defined (not abstract),
before its fidelity can be reviewed. After that comes the induction on `M` per SR-C4-5.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-U1-T/`:

| File | SHA-256 | Note |
|---|---|---|
| `seal.py` | `426b22878587575633112abae713f423de1e0f06ded8276bf35d56e5623eabcf` | capsule, Stage 2/3/4 seals and member digests |
| `crit_gk.py` | `c9edefd4f2b9244e6d5ab5441ae6dca5cbac2921a1d8d4f4a195ecebea6b75f0` | critic instrument (stdlib; `python3 -B`) |
| `crit_gk.out` | `16d880546357ae100ddcd498c7940d55d4358e4ca8a8e17903661e1e2e08d51d` | its output; `RESULT_SHA256 9d4c9ea347ea05918b9cb24ad235068007f3060903a0d2f48128a09e51320309`; `fails []` |
| `replay/gk_tree_layer.py` | `d5dc320002949bac466776b12d2579508c6d10f4ad0305310384f358278d265c` | U1 generator, copied out |
| `replay/replay-stdout.txt` | `044ca9afd10a0a5ad2ed346f8db395bdfacddd6f1125576d2ef24803fd633c40` | replay output (`60f1b4cf…` reproduced) |
| `LeanProject/LeanProof/Main.lean` | `05c24dda55cea6f877bc2e3caed0a156e559e6ef6254d303d81e377aaf64165e` | U1's file, copied out; built cold |
| `LeanProject/Check.lean` | `686c4a90a78794dfeeac802e36609f9d13cee861b188d19a120d19be2dc6dee5` | statement, `IsTree` and axiom probes |
| `check-output.txt` | `fbb0a7969fc68f1f4e3753ee9ed7f552beb89cf010ef9957b842b1b6a7c11cdf` | `#print axioms` output |
| `LeanProject/Api.lean` | `fb6ea78a19192af026aceca9d55080c734b361888f4a0bad1d404052eade6f66` | Mathlib API probe; `crossingIndex` absence |
| `api-output.txt` | `24203ff064bd3a27b93cdc244f23cab529c3bd40bcb719da25ac8e207c2775f4` | its output |

Also present: `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain, LeanProof.lean}` (copies of U1's seed
files) and `.lake/packages` (symlink to the shared pinned Mathlib; never copied, never updated or cleaned). There is no
`__pycache__`, and no background job was started.
