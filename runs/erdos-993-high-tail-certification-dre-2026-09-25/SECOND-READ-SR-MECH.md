# Second Read

Isolated second reader `SR-MECH`, r29 Cycle 1 (`erdos-993-math-dre-20260925-r29-high-tail-certification`). Date 2026-09-25.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order. No other VerityOS subsystem was loaded.
Read-boundary disclosures:
- The harness placed the root `CLAUDE.md` and the user auto-memory index (`MEMORY.md`) into my context at session start. I did
  not open either file, and nothing below depends on them.
- To locate the Mathlib package directory I ran non-recursive `ls` on `/Users/ashtonsperry/.local/share/verityos/lean/`, on
  its two children (`mathlib-v4.32.2-project/` and, through a shell glob, `mathlib-v4.32.2-project.packages-restore-point/`),
  on `mathlib-v4.32.2-project/.lake/` and on `.lake/packages/`. All of these are inside the path-check's allowed roots.
- I then ran `grep`/`sed` only inside `.lake/packages/mathlib/Mathlib/`, on four files: `Combinatorics/Enumerative/DoubleCounting.lean`,
  `Data/Int/Cast/Basic.lean`, `Combinatorics/SimpleGraph/Clique.lean` and `Combinatorics/SimpleGraph/Bipartite.lean`.
- I made no `lake`/`lean` invocation, used no network, installed nothing, ran no background jobs and no `find`/`rg`/`ls -R`.
  Every computation used the Python standard library in the foreground, with exact integers.

Two-part model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
(The chartered model and transport clause rest on the dispatch record's authority. The runtime id is quoted verbatim from
my runtime.)

## Identity and seal audit

- Dispatch `control/dispatch/c1-second-read/DISPATCH-SR-MECH.md`, protocol `control/C1-SECOND-READ-PROTOCOL.md`, brief
  `control/C1-SECOND-READ-BRIEF-SR-MECH.md`: all read in full.
- **Capsule seal.** `control/c1-second-read/SR-MECH-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-MECH`, run id
  `erdos-993-math-dre-20260925-r29-high-tail-certification`.
  - Recorded seal: `f50305542f79242b865a640240bfb30276a31500e254230a2443b0b94d279e46`.
  - Recomputed seal (SHA-256 over compact key-sorted JSON with `seal_sha256` removed, no trailing newline): the same value.
    **Match.**
- **Members.** All 22 listed members match in both byte count and SHA-256, with 0 mismatches (`seal_check.py` → `seal_check.out.txt`).
  They include `SEMANTIC-CONTRACT.md` `9e8131e8…`, `SOLUTION-CONTRACT.md` `0327cc8e…`, `SYNTHESIS.md` `bd7efb53…`, the five
  critiques, the three adjudications, T1's `RETURN.md` and `Main.lean` `8d864da2…d7a9`. The `Main.lean` digest equals the
  one pinned in `SEMANTIC-CONTRACT.md` §1.
- `PATH-CHECK-SR-MECH.json` records 21 scanned files and 0 findings.
- **Scope of my reading.** The capsule lists no `scratchpad/c1-*` instrument, so I read and replayed no seat or critic instrument.
  Every number below comes from my own instrument. I read the registry `control/CLAIM-IDENTITY.run-local.json` (a capsule member)
  only for the exact face text of `E993-BIPARTITE-TAGGED-SHADOW-BOUND`, `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` and
  `E993-BETA-TARGET`. It contains no `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` yet, which is consistent with that record being new.

## Statements read

The ids follow the brief. Every item was first stated at a review stage.

- **SR-1 (S3 and erratum R29-E-d).** For every finite simple graph `G` and every original leaf `v` with support `s`, at
  `p = 1`: if `2α(G) + 1 ≤ 3`, then `Δ_0(G − {v, s}) − Δ_0(G − N_G[s]) = 0`, with no bipartiteness.
  - Companion: `term(p = 1) = deg(s) − 1` on every graph with a leaf.
  - R29-E-d wording: "bipartiteness is sufficient but not needed at `p = 1` (the guard plus a leaf force `V = {v, s}` on any
    finite graph)".
- **SR-2 (S4).** For every finite simple graph and every original leaf `v` with support `s`: `α(G − {v, s}) = α(G) − 1`.
- **SR-3 (S5).** (TSB) holds for every natural `k`, in ℤ with `U = univ` and in truncated ℕ. The brief also asks me to confirm:
  - `hk : 1 ≤ k` is not consumed by entry 41;
  - `k ≤ a` is what `Nat.cast_sub` needs.
- **SR-4 (S6).** (TSB) is tight: for every `1 ≤ k ≤ a` there is a bipartite `H` and a set `W` with `q_k > 0` and
  `k·q_{k+1} = 2(a − k)·q_k`. The witnesses are `mK_2` with one tag, and family B's `H_v` with `W = {w}`.
- **SR-9 (B4).** Two hypothesis-necessity witnesses:
  - `K_1 ⊔ K_5` breaks (TSB) without `hBip`;
  - `P_3 ⊔ 2K_3` at `α = 4`, `p = 3` breaks (HTP) without `hBip`.
  Both lie outside every target's hypotheses.

## Independent re-derivation

My definitions follow `SEMANTIC-CONTRACT.md` §1 and the Lean source of record (entries 8–12 and 18):
- `indepSetCount G D k` is the number of independent `k`-subsets of `univ` disjoint from `D`. At `k = 0` it is `1`, from the empty
  set, even when `univ ∖ D = ∅`.
- `Δ_k(G − D) = i_{k+1}(G − D) − i_k(G − D)` in ℤ.
- `H_v = {v, s}` and `R_v = insert s (N(s))`.
- `taggedFamily G U W k` is the set of independent `k`-subsets of `U` that meet `W`.

**Instrument.** `sr_mech.py`, written from scratch, uses bitmask enumeration with exact integers. Run as `python3 sr_mech.py 6`,
it produced `run6.out.txt` (report digest `4c931733…809d`); a smoke run at order 5 produced `run5.out.txt`.
`witness_recheck.py` recomputes the B4 witnesses a second, structurally different way (`itertools.combinations` over vertex
sets and edge tests).

### SR-1

Let `G` be finite and simple, `v` a leaf with support `s`, and suppose `2α(G) + 1 ≤ 3`, so `α(G) ≤ 1`.
1. `v ∈ N(s)` by adjacency symmetry.
2. Suppose `w ∈ N(s)` with `w ≠ v`. Then `w ≠ s` by irreflexivity. `w` is not adjacent to `v`: `v`'s only neighbour is `s`,
   and `w ≠ s`. So `{v, w}` is an independent 2-set, and `IsIndepSet.card_le_indepNum` (Mathlib `Clique.lean:991`) gives
   `2 ≤ α(G)`. This is a contradiction.
3. Hence `N(s) = {v}`, `R_v = insert s {v} = {v, s} = H_v` as Finsets, and the term is `x − x = 0`.

No colouring is used anywhere. The stronger R29-E-d form also holds on any finite simple graph. Any `u ∉ {v, s}` is non-adjacent
to `v`, so `{v, u}` would be independent. Hence `V = {v, s}` and `G = K_2`. The SEMANTIC-CONTRACT's colour-class argument is
also valid, because two vertices of one colour class are non-adjacent. Bipartiteness is therefore sufficient but not needed,
and R29-E-d's wording is exact.

**Companion.**
- `Δ_0(G − D) = i_1 − i_0 = (n − |D|) − 1` for every `D`.
- `|H_v| = 2`, because `v ≠ s`.
- `|R_v| = deg(s) + 1`, because `s ∉ N(s)`.
- Hence `term(1) = (n − 3) − (n − deg(s) − 2) = deg(s) − 1` on every finite simple graph with a leaf. No guard or colouring is
  involved. `H_v ⊆ univ` holds trivially, so the ℕ card `n − |D|` is exact.

**Instrument (every labelled graph of orders 1–6):** 33,867 graphs and 32,110 leaf rows.
- `term(1) = deg(s) − 1` held on every row (0 failures).
- 29,998 rows have a positive unguarded `p = 1` term.
- Exactly 2 rows satisfy the guard, both in the labelled `K_2`. On both, `R = H`, `V = {v, s}` and the term is `0`.

### SR-2

Let `α(G − {v, s})` be the largest independent set of `G` inside `univ ∖ {v, s}`.
- **`≤`.** Every such set `A` misses `s`, so `A ∪ {v}` is independent (`leaf_insert_indep`) and `|A| + 1 ≤ α(G)`. This is
  `leaf_indep_cap` in ℕ.
- **`≥`.** Let `J` be a maximum independent set of `G`. It contains at most one of the adjacent pair `v`, `s`, so
  `J ∖ {v, s}` is independent inside `univ ∖ {v, s}` with at least `α − 1` elements. The maximality refinement ("exactly one")
  is true, but it is not needed.
- **Is `α(G) ≥ 1` needed?** Not as a hypothesis. The leaf `v` exists, so `{v}` is independent and `α(G) ≥ 1`. The ℕ subtraction
  `α − 1` is therefore exact on every instance of the statement.
- **Other hypotheses.** No bipartiteness and no connectivity are used. The `K_2` case gives `0 = 1 − 1`.

**Instrument:** 32,110 leaf rows over all labelled graphs of orders ≤ 6, plus 721 leaf rows from 400 seeded random graphs of
orders 7–12 (seed 29993). 0 failures.

### SR-3

Take `U = univ` and `a = α(H)`.
- **`k = 0`.** The left side is `0·q_1 = 0`. Also `q_0 = 0`, because the only 0-set is `∅`, which is disjoint from every `W`. So
  both sides are `0`.
- **`k > a`.** No independent set has more than `a` elements (`card_le_indepNum`), so `q_k = q_{k+1} = 0`. Both sides are `0`
  in ℤ, even though the coefficient `2(a − k)` is negative there.
- **`k = a`.** `q_{a+1} = 0` and the coefficient is `0`.
- **Truncated ℕ.** For `k ≥ a` the right side is `0` and `q_{k+1} = 0`, so the inequality holds for every `k`. The same is true
  of entry 41's `U`-relative form at any cap `a` satisfying `hcap`, because `q_{k+1}(U) = 0` once `k + 1 > a`.
- **`hk` in entry 41.** I read the whole of entry 41, `Main.lean` lines 792–960, which covers all four `Core` helpers from line
  799 and the terminal lemma at lines 942–958.
  - The identifier `hk` occurs exactly once, in the binder at line 946. No helper takes a `k ≥ 1` argument.
  - Mathlib `Combinatorics/Enumerative/DoubleCounting.lean:98` states `card_nsmul_le_card_nsmul` with no condition on `m` or
    `n`: `#s • m ≤ #t • n`.
  - After `nsmul_eq_mul`, `hcount` is `q_{k+1}·k ≤ q_k·(2(a ∸ k))`, and the goal is its commutative rearrangement. So
    `hk : 1 ≤ k` is not consumed, textually or mathematically.
  - It is consumed one level up, in entry 42's `leaf_tagged_monotone` (line 1110 `have hk`, line 1121 pass to `hShadow`, then
    the cancellation of `k`).
  - Limit: I did not kernel-check an `hk`-free variant, and I found no record that anyone did. The confirmation is a source
    reading plus the proof's mathematics. `nlinarith`'s certificate does not need `hk`, because the goal and `hcount` share the
    same monomials.
- **`hka` and `Nat.cast_sub`.** Mathlib `Data/Int/Cast/Basic.lean:36` states `Nat.cast_sub {m n} (h : m ≤ n) : ((n − m : ℕ) : R) = n − m`.
  Identifying the ℕ right side `2·(a ∸ k)·q_k` with the ℤ right side `2·((a:ℤ) − k)·q_k` needs exactly `k ≤ a`. For `k > a` the
  all-`k` ℤ form is not a pure cast of the ℕ lemma. It needs the separate vanishing `q_k = 0`.

**Instrument.**
- Registry form, all 5,604 labelled bipartite graphs of orders 1–6, every `W` and every `0 ≤ k ≤ n + 2`: 3,083,184 rows,
  comprising 344,082 at `k = 0`, 1,503,448 at `k > a` and 1,235,654 at `1 ≤ k ≤ a`. There were 0 ℤ failures, 0 truncated-ℕ
  failures and 0 cases of nonzero `q_0`.
- Entry 41's `U`-relative ℕ form, bipartite orders ≤ 5, every `U`, every `W`, cap `a ∈ {cap(U), cap(U) + 1}` and every `k`:
  6,313,056 rows, 0 failures.

### SR-4

**`H = mK_2`, `W = {w}`.**
- `α(H) = m = a`, and `H` is bipartite.
- A tagged independent `j`-set must contain `w` and not its partner. Its other `j − 1` vertices come from `j − 1` distinct
  other edges, one endpoint each. So `q_j = C(m−1, j−1)·2^{j−1}` for `j ≥ 1`, and `q_0 = 0`.
- Then `k·q_{k+1} = k·C(m−1, k)·2^k` and `2(m − k)·q_k = (m − k)·C(m−1, k−1)·2^k`.
- These are equal because `k·C(m−1, k) = (m − k)·C(m−1, k−1)`: both equal `(m−1)!/((k−1)!(m−1−k)!)` for `k ≤ m − 1`, and both
  are `0` at `k = m`.
- `q_k > 0` exactly when `k − 1 ≤ m − 1`, which is every `1 ≤ k ≤ m`.

**Family B (C-F1-U), `H = H_v(T_{a−1})`.** `H` is the spider with edge `w–c` and `a − 1` paths `c–a_i–b_i`; it is a tree. Take
`W = {w}`.
- `α(H) = a`.
- Tagged sets contain `w`, and the rest is independent in `H − N[w] = (a−1)K_2`. So `q_j = C(a−1, j−1)·2^{j−1}`, the same
  numbers as `aK_2`.
- Equality therefore holds for the same reason.

**Precision.** At `1 ≤ k ≤ a − 1` both sides are positive. At `k = a` both are `0`, while `q_a > 0`. So at every `(a, k)` no
constant smaller than `2(a − k)` works: a negative constant fails at `k = a` because `q_a > 0`.

**Instrument.**
- `mK_2` by brute force for `m ≤ 7`, and family B for `m ≤ 6`: the closed forms, equality at every `1 ≤ k ≤ a`, and `q_k > 0`
  all confirmed.
- The identity with exact integers for every `1 ≤ k ≤ m ≤ 300`: 45,150 checks, 0 failures.

### SR-9

**(a) `K_1 ⊔ K_5`, `W` = the isolate `z`, `k = 1`.**
- `α = 2`: `z` plus one vertex of the `K_5`.
- `q_1 = 1` (`{z}`) and `q_2 = 5` (`{z, x}` for each of the 5 vertices of the `K_5`).
- `1·5 = 5 > 2 = 2(2 − 1)·1`.
- It contains triangles, so it is not bipartite. `1 ≤ k ≤ a` holds.

**(b) `P_3 ⊔ 2K_3` (path `v–s–w`, triangles `T, T'`), order 9, leaf `v`.**
- `α = 2 + 1 + 1 = 4`. The guard at `p = 3` is `2·4 + 1 = 9 = 3·3`.
- `G − {v, s} = K_1 ⊔ 2K_3`: `i_2 = C(7, 2) − 6 = 15` and `i_3 = 3·3 = 9`, so `Δ_2 = −6`.
- `G − N[s] = 2K_3`: `i_2 = 9` and `i_3 = 0`, so `Δ_2 = −9`.
- The term is `(−6) − (−9) = +3 = q_3 − q_2 = 9 − 6`, with `q_j` counting sets that contain `w`.
- It contains triangles, so it is not bipartite. `v` is a leaf, `p ≥ 1`, and the guard holds.
- The other leaf `w` gives the same `+3`.

**Instrument.** Both methods give identical values: `sr_mech.py` (bitmask) and `witness_recheck.py` (combinations).

**Outside every target.** (TSB), (HTP) and (HTA) require `IsBipartite`; (ELIG) and (TRN) require `IsTree`. Both witnesses contain
a triangle, so neither is bipartite nor a forest. They refute nothing in scope.

**Where bipartiteness is actually load-bearing in (HTP).** I re-derived this myself; C-T1-U's "alternative packaging" says the
same, and the synthesis records it as kernel-checked by T's adjudicator.
- On every finite simple graph with a leaf, `H_v ⊆ R_v` holds, so `tagged_count_split` gives `term(p) = q_p − q_{p−1}`.
- Every independent set inside `univ ∖ H_v` has at most `α − 1` elements, so `q_p = 0` whenever `p ≥ α(G)`. There the term is
  `−q_{p−1} ≤ 0`, with no guard and no colouring.
- Under the guard, the remaining branch `p ≤ α − 1` gives `2α + 1 ≤ 3p ≤ 3α − 3`, hence `α ≥ 4` and `p ≥ 3`.
- So without `hBip` the guarded statement can fail only at `α ≥ 4` with `3 ≤ p ≤ α − 1`, and witness (b) sits at the least
  corner `(α, p) = (4, 3)`.

**Instrument (every labelled graph of orders ≤ 6, bipartite or not).**
- Guarded rows: 119,640 non-bipartite, 704 at `p ≤ 2` and 180,168 at `p ≥ α`.
- 0 positive guarded terms overall, so none of these witnesses has order ≤ 6.

## Findings and repairs

1. **SR-1: confirmed.** All three proofs are valid on every finite simple graph:
   - C-T1-F A1: `N(s) = {v}`;
   - C-F1-T A3: any `u ∉ {v, s}` gives `α ≥ 2`;
   - C-F1-U A3: `α = 1` means complete, and complete with a leaf means `K_2`.

   The companion `term(1) = deg(s) − 1` is exact. R29-E-d's wording is exact and needs no change.

   On attribution: the registry face of `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (`scope_boundary`, which I read) already
   records the colour-free facts "the guard forces `alpha(G) = 1` and `alpha(H) = 0`", so Codex prior-art attribution is backed
   on the face. The synthesis also cites Codex's `CANDIDATE-PROOF.md` "broader endpoint check". That file is not in my capsule
   and I did not read it; the attribution does not depend on it.
2. **SR-2: confirmed.** The `≥` direction needs only "at most one of `v`, `s`", not maximality. `α(G) ≥ 1` is automatic from the
   leaf, so it is not a hypothesis. I agree with the synthesis's Tier 3 ruling: this belongs in a **scope note** on
   `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, not a separate key. It is graph-general and changes no status. It shows that the
   cap `a = α(G) − 1` at which (HTP)'s `p ≥ 2` branch applies the tagged-shadow bound is attained.
3. **SR-3: confirmed, with two precision notes carried into the registration text (not repairs to the statement).**
   - The brief's line range (854–958) leaves out entry 41's first two helpers (lines 799–853). I read 792–960 in full, and `hk`
     is absent there too.
   - The all-`k` ℤ form is not a pure cast above `α(H)`. It needs `q_k = 0` for `k > α(H)`.
4. **SR-4: confirmed.** The family B attribution should name C-F1-U's advance **A2**; the synthesis says only "C-F1-U (family B)".
   Tightness at `k = a` is the degenerate `0 = 0` with `q_a > 0`; for `1 ≤ k ≤ a − 1` both sides are positive. The registration
   text says so. Family B is a tree, so the tightness holds on trees.
5. **SR-9: confirmed_with_repairs.** The witnesses, their values, their non-bipartiteness and their out-of-scope status are all
   exact. The repair concerns the inference the synthesis draws from them in its registration item 2 (the (HTP) scope note):
   "Bipartiteness is load-bearing for `p ≥ 2`" over-states the scope.
   - At `p = 2` the guard gives `α ≤ 2 ≤ p`, and the term is `−q_1 ≤ 0` on every finite simple graph with a leaf. More generally
     this holds at every `p ≥ α(G)`.
   - Bipartiteness is load-bearing only on the branch `3 ≤ p ≤ α(G) − 1`, which forces `α ≥ 4`.
   - The synthesis's own "Refuted" bullet ("the (HTP) branch `p ≤ α − 1`") is the correct form.
   - The controller should register the narrowed sentence given under `## Registration text`, not the "`p ≥ 2`" sentence.

   B4 also belongs in the boundary record only as a clearly titled **hypothesis-necessity annex**. It says nothing about the
   guard's precision, so the record key must not be read as claiming more.
6. **Fences (all five items).**
   - Nothing evaluates a selector or aggregate below the guard, and nothing steps into `3p < 2α + 1`. SR-9(b) sits at guard
     equality, on a non-bipartite graph.
   - No status is transferred (§3.1, §3.4, §3.8). The two existing awards are neither touched nor re-registered.
   - No census value is used (§3.5).
   - Every item is a scope note or an annex; no new key is proposed. The only key named is the new boundary-record key
     `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` for the annex. Each scope note asserts no more than its statement.
7. **Evidence discipline.** No controller prior and no frozen census number is cited as evidence. Critic and adjudicator texts
   are cited only for attribution.

## Registration text

Register each block verbatim. None of them changes a status.

**SR-1: scope note on `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`** (status unchanged by this note):
> r29 C1 scope note (second read SR-MECH, SR-1). The `p = 1` endpoint is graph-general. For every finite simple graph `G` and
> every original leaf `v` with support `s`, if `2α(G) + 1 ≤ 3` then `N_G(s) = {v}`. Hence `C5LA1.R G v = C5LA1.H G v = {v, s}`
> and `Δ_0(G − {v, s}) − Δ_0(G − N_G[s]) = 0`. The guard and a leaf force `V = {v, s}`, that is `G = K_2`. Bipartiteness is
> sufficient but not needed at `p = 1` (erratum R29-E-d to the SEMANTIC-CONTRACT §2 endpoint narrative, whose colour-class
> argument remains valid). Companion on every finite simple graph with an original leaf: the `p = 1` term equals `deg_G(s) − 1`
> (`Δ_0(G − D) = (n − |D|) − 1`, `|H_v| = 2`, `|R_v| = deg(s) + 1`). So without the guard the `p = 1` term is positive whenever
> `deg(s) ≥ 2`. Grade `proved_informal`: the endpoint was critic-derived and STATED, then confirmed by an isolated second read;
> the companion is a route result. Attribution: Codex (GPT-6) prior art (this key's `scope_boundary` already records that the
> guard forces `α(G) = 1` and `α(H) = 0`); r29 critics C-T1-F (A1), C-F1-T (A3) and C-F1-U (A3), and the U adjudicator (compiled
> lemma `leafEndpointAtOne`), for the bipartite-free endpoint; r29 T1 for `term(1) = deg(s) − 1`. The endpoint lemma is a
> companion on C1-LA2's face, not a separate key. No status transfer (SOLUTION-CONTRACT §3.1, §3.8).

**SR-2: scope note on `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`** (Tier 3 as a scope note; no separate key):
> r29 C1 scope note (second read SR-MECH, SR-2). Leaf `α`-drop, graph-general. For every finite simple graph `G` and every
> original leaf `v` with support `s`, `α(G − {v, s}) = α(G) − 1`, where `α(G − {v, s})` is the largest independent set of `G`
> inside `univ ∖ {v, s}`.
> - `≤`: `v` extends every such set (`leaf_indep_cap`).
> - `≥`: a maximum independent set of `G` contains at most one of the adjacent pair `v`, `s`.
>
> No further hypothesis is needed: the leaf gives `α(G) ≥ 1`, so the natural subtraction is exact. No bipartiteness or
> connectivity is used. Consequently the cap `a = α(G) − 1` at which the `p ≥ 2` branch applies the tagged-shadow bound is
> attained. Grade `proved_informal` (STATED at review; isolated second read confirmed). Attribution: r29 critics C-F1-T (A2) and
> C-F1-U (A4); `leaf_indep_cap` is Codex's (first-interior entry 42 helper). No status transfer.

**SR-3: scope note on `E993-BIPARTITE-TAGGED-SHADOW-BOUND`:**
> r29 C1 scope note (second read SR-MECH, SR-3). The registered statement keeps `1 ≤ k ≤ α(H)`. The inequality
> `k·q_{k+1}(H, W) ≤ 2(α(H) − k)·q_k(H, W)` holds in ℤ for every natural `k`:
> - at `k = 0` both sides are `0` (`q_0 = 0`, because the empty set meets no `W`);
> - for `k > α(H)`, `q_k = q_{k+1} = 0`.
>
> The truncated-ℕ form with `2·(a ∸ k)` also holds for every `k`, including first-interior entry 41's `U`-relative form.
> Hypothesis accounting:
> - `hk : 1 ≤ k` is not referenced in entry 41's body. It is consumed one level up, in the (HTP) cancellation of `k`.
> - `hka : k ≤ α(H)` is consumed only by the ℤ recast `Nat.cast_sub`.
> - Above `α(H)` the all-`k` ℤ form is not a pure cast of the ℕ lemma. It uses the vanishing `q_k = 0`
>   (`IsIndepSet.card_le_indepNum`).
>
> Grade `proved_informal` (companion; STATED at review; isolated second read confirmed). Attribution: Codex (GPT-6) for the
> mechanism and entry 41; r29 critics C-T1-F (A2), C-T1-U (F4) and C-F1-T (A8). No status transfer (§3.1, §3.4).

**SR-4: scope note on `E993-BIPARTITE-TAGGED-SHADOW-BOUND`:**
> r29 C1 scope note (second read SR-MECH, SR-4). The bound is tight: the constant `2(a − k)` cannot be improved. For every
> `a ≥ 1` and every `1 ≤ k ≤ a` there is a finite bipartite `H` with `α(H) = a` and a one-vertex tag set `W = {w}` with
> `q_k(H, W) > 0` and `k·q_{k+1} = 2(a − k)·q_k`. Two witnesses:
> - `H = aK_2` (a perfect matching): `q_j = C(a−1, j−1)·2^{j−1}` for `j ≥ 1`, and equality is
>   `(a − k)·C(a−1, k−1) = k·C(a−1, k)`;
> - the tree `H = H_v(T_{a−1})` (edge `w–c` plus `a − 1` paths `c–a_i–b_i`), with the same `q_j`.
>
> For `1 ≤ k ≤ a − 1` both sides are positive; at `k = a` both are `0` while `q_a > 0`. So no smaller constant works at any
> `(a, k)`, even on trees. Grade `proved_informal` (STATED at review; isolated second read confirmed). Attribution: Codex (GPT-6)
> for the mechanism; r29 critics C-F1-T (A7, the matching) and C-F1-U (A2, family B). No status transfer.

**SR-9: B4 annex of `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`:**
> B4. Hypothesis-necessity annex (bipartiteness). Explicit exact finite witnesses. Both graphs contain triangles, so they are
> neither bipartite nor forests; they lie outside the hypotheses of every r29 target, refute nothing in scope and transfer no
> status.
>
> (a) `H = K_1 ⊔ K_5`, `W` = the isolate, `k = 1`: `α(H) = 2`, `q_1 = 1`, `q_2 = 5`, and `1·5 = 5 > 2 = 2(2 − 1)·1`. So
> `E993-BIPARTITE-TAGGED-SHADOW-BOUND` is false without `IsBipartite`.
>
> (b) `G = P_3 ⊔ 2K_3` (the path `v–s–w` plus two disjoint triangles; order 9), original leaf `v` with support `s`,
> `α(G) = 4`, `p = 3`, guard `2α + 1 = 9 = 3p`:
> - `i_2(G − {v, s}) = 15` and `i_3(G − {v, s}) = 9`;
> - `i_2(G − N[s]) = 9` and `i_3(G − N[s]) = 0`;
> - the term is `Δ_2(G − {v, s}) − Δ_2(G − N[s]) = (−6) − (−9) = +3 = q_3 − q_2 = 9 − 6` (the same at the other leaf `w`).
>
> So `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` is false without `IsBipartite`.
>
> Scope of the necessity. On every finite simple graph with a leaf, the term is `q_p − q_{p−1}`, and `q_p = 0` for `p ≥ α(G)`.
> So at every guarded `p ≥ α(G)`, in particular at `p ∈ {1, 2}`, the term is `≤ 0` without `IsBipartite`. Bipartiteness is
> load-bearing only on the branch `3 ≤ p ≤ α(G) − 1`, which forces `α(G) ≥ 4`. Witness (b) sits at that branch's least corner,
> `(α, p) = (4, 3)`.
>
> Grade: explicit exact finite (hand count plus two independent exact instruments at the r29 second read, beside the original
> critic instrument). Attribution: r29 critic C-T1-F (F2); replayed by the T adjudicator and the Cycle 1 synthesis; isolated
> second read SR-MECH. Fence: this annex is about hypothesis necessity, not the guard's precision. It takes no step into
> `3p < 2α + 1`, and it changes no status.

**Required companion repair, arising from SR-9.** In the synthesis's registration item 2 (the scope note on
`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`), replace "Bipartiteness is load-bearing for `p ≥ 2` (after SR-9)" with:
> Bipartiteness is load-bearing only on the branch `3 ≤ p ≤ α(G) − 1` (which forces `α(G) ≥ 4`; witness `P_3 ⊔ 2K_3` at
> `α = 4`, `p = 3`, boundary record B4). At every guarded `p ≥ α(G)`, including `p = 1, 2`, the term is `≤ 0` on every finite
> simple graph with an original leaf.

The same scope note's clause "At `p = 1` the guard forces `G = K_2`, and the term `deg(s) − 1` is `0` (bipartiteness not needed
there, after SR-1)" is confirmed as written. So is "`α(G − {v, s}) = α(G) − 1` (after SR-2)". The TSB scope-note sentence
"Bipartiteness is load-bearing: `K_1 ⊔ K_5` fails without it (after SR-9)" is also confirmed as written.

## Verdicts

verdict[SR-1]: confirmed
verdict[SR-2]: confirmed
verdict[SR-3]: confirmed
verdict[SR-4]: confirmed
verdict[SR-9]: confirmed_with_repairs

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-sr-SR-MECH/`:

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `f97fd8d95c4873fbcd4d372cdc64d5f3cb64b23f49ced3c7f50a4810cb77e087` | capsule seal and member digests |
| `seal_check.out.txt` | `46970372980abb642c2e75bddc336e2854a584d7f50d8124d6e8149655e99dbe` | seal match; 22/22 members OK |
| `sr_mech.py` | `e19c61203d6ae9888afbf43863b129fac78c4a4b879f880c877426f9da245bdd` | main instrument (SR-1, 2, 3, 4, 9) |
| `run6.out.txt` | `4446bb8b5b428e1261a458a54e9abffad76d6cdc25beaa8d90b22aeaa1337262` | `python3 sr_mech.py 6`; report digest `4c93173338fc27516738787bd40c424438da3e13df1ed5b483e5c2693e7f809d` |
| `run5.out.txt` | `8f00a83f35eb8cdc5b1d513c8ee0436278309a0ce161e5681acdf4fa1786308c` | order-5 smoke run |
| `witness_recheck.py` | `283533d645f1ca9a02e93104987bf63536579a3db5cfb3f9884c150d0542c03d` | second method for the B4 witnesses |
| `witness_recheck.out.txt` | `8303ed5c0be04fe412c4bc699c24ebf95a53fc74405b1869ded5ab7ff1412864` | its output |

Deliverable: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/second-reads/SR-MECH/SECOND-READ.md`.
No capsule member was edited. No background job was started, so there is nothing to kill.
