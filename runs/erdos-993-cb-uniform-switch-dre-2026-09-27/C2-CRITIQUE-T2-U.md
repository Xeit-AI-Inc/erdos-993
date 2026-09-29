# Critique

Critic `C-T2-U` (cross-orientation U, formal / structural) of Cycle 2 of r31, assigned to the return of seat T2, route
`C2-T-02`, mechanism token `FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE`, orientation T (prove).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run's grant. I then read the
dispatch file, the critic protocol, the capsule and only the capsule members, plus sources under `sources/` (authorized Stage 2
members) and the T2 scratch artifacts (copied out first).

**Model disclosure (two parts).** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures.**
1. The harness put the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's e-mail address into my context
   before any tool call. I did not open them with a tool and did not use them. Following the dispatch, the controller owns
   conversation logging, so I wrote no conversation log.
2. Replaying the seat's `alias_check.py` (copy-out-first) made that script read
   `control/CLAIM-IDENTITY.run-local.json`, which is not a capsule member. I did not open the file myself. The only content I saw
   is the script's printed summary lines and its output digest.
3. I ran one `ls -la` on `scratchpad/c2-T2/`, a granted artifact directory. It lists that directory only, with no recursion.
   I ran `grep -rn` twice, both times rooted at `sources/` (within the grant): once to find the Lean definitions of
   `vertexDeletionForwardDifference`/`IsFavorableAt`/`forwardDifferenceDel`, and once to list the declarations of C1-LA3's
   frozen `Main.lean`. No search was rooted above a granted directory.
4. Outside the capsule list, I read these source files, all under `sources/`: `sources/r30/records/SEMANTIC-CONTRACT.md`
   (§1.1), the favorability key's registry record in `sources/authority/CLAIM-IDENTITY.json`, the frozen C1-LA3
   `Main.lean` (entries 2, 4, 15–17), the r30 C1-LA2/C5-LA1/C6-LA2 `Main.lean` definition entries 3 and 13 (by grep), and
   `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` (lexical alias check only).
5. No network, no installs, no Lean or lake. Python standard library only. The one background job (the copy-out replay of
   `main_verify.py`, literal PID `32785`) ran to completion and was confirmed stopped with `kill -0` before this file was written.

## Identity and seal audit

- Dispatch `DISPATCH-C-T2-U.md`: SHA-256 `8bba5895e460d0b396d39386abeef3170497f53b4b041031fb7560fdd23c675a`. **Match.**
- **Capsule seal** `control/c2-critic-capsules/T2-PACKET-MANIFEST.json`: declared `51fb7be2429e4adcb0f8297e0df382cde66a617f37abb412a7ee61c379851523`.
  I recomputed it as SHA-256 over compact key-sorted JSON without `seal_sha256`, with no trailing newline. **Match.** All 14 listed
  files match their SHA-256 values and byte counts.
- Stage 2 seal `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: recomputed, **match**.
- Stage 3 seal `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: recomputed, **match**.
- Stage 4 dispatch seal `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: recomputed, **match**.
- The return `cycles/cycle-2/stage3/returns/T2/RETURN.md` has SHA-256 `88b5eaec…96afd7`, which matches the capsule.
- The return's inventoried artifacts (copied into `scratchpad/c2-crit-T2-U/replay/`) all match the return's table:
  `tree_dp.py` `202c174e…`, `main_verify.py` `308fa575…`, `alias_check.py` `d55d71c2…`, `diagnose_e00.py` `ae921f4d…`, and
  the outputs `af0177fa…`, `2888f81f…`, `5816bd5c…`.
- The return's C1-LA3 citations check out against the frozen source. Entry 17 `twoBinom_coeff_strictAnti_of_gap` has entry hash
  `b39cd787…`. Its statement is `1 ≤ t`, `t ≤ a+b`, `3a+4b+2 ≤ 6t` ⇒ `r(t+1) < r(t)`. Entry 4 is the recurrence (`d60b2141…`).
  Entry 16 is log-concavity, and it is **non-strict** (`r(n)·r(n+2) ≤ r(n+1)²`).
- Registered keys touched:
  - `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (`proved_informal` modulo
    Darroch/Newton). This is the object whose part (ii) the route tries to re-prove without Darroch/Newton.
  - The C1-LA3 award key `E993-R31-CB-8-…-FOR-5-LE-J-LE-M`: tool (G) is its companion.
  - `E993-TREE-REAL-ROOTED` (REFUTED; not revived).
  - The criterion and threshold keys are context only.

## Independent re-derivation

**Instruments** (my own code, written from the contracts; the seat's scripts were used only as replays):
- `crit_literal.py` builds `CB(d,m)` as a labelled tree from the contract's definition. It checks the tree (edge count plus
  reachability) and computes the independence polynomial of `T`, `T − v`, `T − c_{1,1}` and `T − c_{m,8}` with a rooted-forest
  DP.
- `crit_symbolic.py` and `crit_pi_formula.py` do exact integer and rational algebra.

**Fidelity first: the difference convention.** The favorable selector of record is
`IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0`, with
`vertexDeletionForwardDifference G v p = i_{p+1}(G − v) − i_p(G − v)`. This is the frozen r30 `Main.lean`, entry 3, identical
in the C1-LA2, C5-LA1 and C6-LA2 award sources. r30 `SEMANTIC-CONTRACT.md` §1.1 says the same, with the fixed point
`Δ_8(K_{1,11}) = 55 − 165 = i_9 − i_8`. The favorability key's own statement also writes "`Δ_k(T − w) := i_{k+1}(T − w) − i_k(T − w)`".
So private-leaf favorability at `p*` is

  **`i_{p*+1}(T − c) < i_{p*}(T − c)`.**

The return instead defines and proves `Δ_{p*}(T − c) < 0` as "`[x^{p*}]I(T−c) < [x^{p*−1}]I(T−c)`" (its "The obligation"
section and §1). `main_verify.py` computes the same quantity: `top = coeff(p*)`, `prev = coeff(p*−1)`. In the record's
convention that is `Δ_{p*−1}(T − c) < 0`, favorability at rank `p* − 1`, not at `p*`.

This is a **fidelity failure of the index** (the attack brief for T1 names exactly this risk: "`p*` vs `p* − 1`"). Descent at
`p* − 1` does not imply descent at `p*` for `I(T − c)`. That implication would need unimodality of a forest polynomial, which
is not available (forest polynomials are not real-rooted; `E993-TREE-REAL-ROOTED` REFUTED). Every statement and number in the
return about "`Δ_{p*}(T−c)`" is therefore about the wrong quantity **as favorability evidence**.

**Literal-tree re-derivation at the record index.** Every residue-2 row `m = 107, 110, …, 311` (69 rows) passes all of the
following:
- The closed forms of record equal the literal DP: 128 small checks for `d ∈ 1..8`, `m ∈ 1..4`, and full equality at every
  class row for `I(T)`, `I(T − v)` and two different private leaves, with 0 mismatches.
- The fixed point `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`, reproduced.
- `p*` is eligible, with `x` computed through `α`.
- **`Δ_{p*}(T − c) < 0` and `Δ_{p*}(T − v) < 0` in the record convention.** For example, at `m = 107`
  `Δ_{p*}(T − c) = −11548817847…` (408 digits).
- The return's backward quantity has the same digits it reports (`−69833073525…`, 407 digits at `m = 107`; 419 at `m = 110`;
  430 at `m = 113`).

The fresh rows `m = 116, 119` (ruling 9) and `m = 137` were computed on the literal tree before any universal statement below.
So the target inequality is true at every tested row. The return simply proved a different one.

**The block decomposition re-derived.** `(1+2x)G_c = (1+x)(1+2x)^8 + x(1+x)^7(1+2x)`. Multiplying by
`G^{m−1} = Σ_j C(m−1,j) x^j(1+x)^{8j}(1+2x)^{8(m−1−j)}` gives the return's `E0_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` and
`E1_j = x^{j+1}(1+x)^{8j+7}(1+2x)^{8(m−1−j)+1}`. The pairing is
`(1+x)(1+2x)^{8m} + x(1+x)²(1+2x)^{8m−1} = (1+x)(1+2x)^{8m−1}(1+3x+x²) =: Π`, since `(1+2x) + x(1+x) = 1+3x+x²`. Confirmed.

**Gap arithmetic at the record index** (my derivation; `6p* = 32m + 8`):
- `E0_j` (`j ≥ 1`) needs (G) at `(a, b, t) = (8j+1, 8(m−j), p* − j)`. Then `3a+4b+2 − 6t = −2j − 3`.
- `E1_j` (`j ≥ 0`) needs (G) at `(8j+7, 8(m−1−j)+1, p* − j − 1)`. Then `3a+4b+2 − 6t = −2j − 7`.
- The side condition `1 ≤ t ≤ a+b` holds, because `t ≥ p* − m + 1 ≥ 1` and `a + b ∈ {8m, 8m+1}`.
- I checked this exhaustively over every `j` for every class `m ∈ [107, 2399]` (1,917,090 checks, 0 failures).

At the record index, then, **every** `E0_j` with `j ≥ 1` and **every** `E1_j` strictly decreases by (G). The return's deficits
at `j = 0, 1` (3 and 1, which I reproduced) exist only at the return's backward index. The one weight-1 piece that (G) does not
cover is the leftover `x(1+x)²(1+2x)^{8m−1}`, whose gap is `+2`. The pairing absorbs it into `Π`.

## Attacks and findings

**F-1 (fatal to the return's headline as stated): index convention.** Shown above. The return's theorem, the 52-row sweep, the
ratio table and the candidate key all concern `i_{p*} − i_{p*−1}`, which is favorability at `p* − 1`. **Struck as favorability
at `p*`.** The numbers themselves replay exactly:
- `main_verify.py` replay: byte-identical digest `2888f81f…`, `SWEEP_ALL_NEGATIVE True`, 123 cross-checks.
- `tree_dp.py` replay: `af0177fa…`.
- `alias_check.py` replay: `5816bd5c…`.
- I recomputed the ratio table independently and all six entries agree: 7.4969, 7.7076, 7.9183, 9.8147, 14.0288, 18.2429.
- Identities (i) and (ii) and `Θ·p* = 6C − (p*+4)(C − D)` hold exactly, and `Θ > 0`, at every `m = 107..182` I checked.

These are true statements about the backward quantity only.

**F-2 (a false lemma): the new ascent tool (G') is false as stated, and its proof has an inequality reversed.** The return
states: for `1 ≤ k ≤ a+b` with `6k ≤ 3a+4b`, `r(k) < r(k+1)`.
- **Counterexample:** `(a, b, k) = (0, 9, 6)`. Then `6k = 36 = 3a+4b`, but `r(6) = C(9,6)·2⁶ = 5376 > r(7) = C(9,7)·2⁷ = 4608`.
  Others: `(2, 0, 1)` with `2 > 1`, and `(0, 8, 5)` with `r(5) = r(6) = 1792`. On `a, b ≤ 30` there are 499 counterexamples.
- **The error.** The proof says "log-concavity `r(k−1)r(k+1) ≤ r(k)²` combined with `r(k+1) ≤ r(k)` gives `r(k−1) ≥ r(k)²/r(k+1)`".
  Log-concavity gives the opposite inequality, `r(k−1) ≤ r(k)²/r(k+1)`. So it is not C1-LA3's argument "run in reverse":
  non-ascent propagates forward under log-concavity, not backward.
- **Corrected tool (critic-derived).** Run the argument forward instead: from `r(k+1) ≤ r(k)`, log-concavity at `k+1` gives
  `r(k+2) ≤ r(k+1)`. Recurrence (R) at `k+1` then gives `6k ≥ 3a+4b−5`. So
  **`6(k+1) ≤ 3a+4b` ⇒ `r(k) < r(k+1)`** (0 failures on `a, b ≤ 30`).
- **Consequence for E0_1.** The return applies (G') at `(9, 8m−8, p*−3)`, where `3a+4b − 6k' = 5` for every class `m`. The
  corrected tool needs 6, so it **misses by one**, and the return's universal "`E0_1` descent" argument is **struck**.
- **Repair (critic-derived; relevant only to the return's own index).** Strict log-concavity of `(1+x)^a(1+2x)^b` in the
  interior (`a+b ≥ 2`, `1 ≤ k ≤ a+b−1`) has an elementary proof by factor induction. After one factor `(1+λx)`, the minor
  becomes `D'_k ≥ D_k + λ²D_{k−1}` plus a nonnegative cross term. With strict log-concavity, C1-LA3's descent argument extends
  to deficit 1: **`6k ≥ 3a+4b+1` ⇒ `r(k+1) < r(k)`** (0 failures on the grid). That covers `E0_1` at the backward index.
  Neither this repair nor (G') is needed at the record index.

**F-3: the named open lemma concerns the wrong quantity.** The return's remaining lemma `|Θ| < (m−1)|Δ(E0_1)|` bounds a
backward-index quantity. At the record index the paired block is not dominated; it is negative on its own (see F-4). For the
record, I also closed the return's lemma as stated:
- `Θ + (m−1)Δ_bw(E0_1) = [x^{p*}](1−x)[(1+x)(1+3x+x²)(1+2x)^7 + (m−1)x(1+x)^9](1+2x)^{8m−8}`.
- Dividing by `C(8m−8, p*−11)2^{p*−11}` and clearing positive denominators gives an explicit degree-11 integer polynomial in
  `t` (`m = 3t + 2`).
- After the shift `t = 35 + w` (that is, `m ≥ 107`) all 12 coefficients are strictly negative. The smallest all-negative shift is
  `t = 5`.
- It agrees with big-integer evaluation at `t = 35..60`.

This is a fixed polynomial certificate, so it is `computer_assisted` (ruling 10) and critic-derived. It is not needed for
favorability.

**F-4 (critic-derived advance): the paired block at the record index is proved negative in closed form, with no Darroch, no
Newton and no asymptotics.**
- Let `s(k) = C(8m−1, k)2^k`, `m = 3t + 2`, `u = 16t = p* − 12`. Then
  `Δ_{p*}(Π) = [x^{p*+1}](1−x)Π = [x^{p*+1}](1 + 3x − 3x³ − x⁴)(1+2x)^{8m−1}`, because
  `(1−x)(1+x)(1+3x+x²) = 1 + 3x − 3x³ − x⁴`.
- With `K = p* + 1`, `N = 8m − 1` and `N − K = 8t + 2`, the successive ratios `s(k+1)/s(k) = 2(N−k)/(k+1)` are:
  - `s(K)/s(K−1) = (u+6)/(u+13)`
  - `s(K−1)/s(K−2) = (u+8)/(u+12)`
  - `s(K−2)/s(K−3) = (u+10)/(u+11)`
  - `s(K−3)/s(K−4) = (u+12)/(u+10)`
- Hence
  `Δ_{p*}(Π)/s(p*−1) = (u+8)(u+6)/((u+12)(u+13)) + (2u+13)/(u+12) − 3(u+11)/(u+10)`.
- Over `(u+10)(u+12)(u+13)` the numerator is
  `(u³+24u²+188u+480) + (2u³+59u²+559u+1690) − (3u³+108u²+1293u+5148) = −(25u² + 546u + 2978)`.
- So

    **`Δ_{p*}(Π) = −C(8m−1, p*−1)·2^{p*−1}·(25p*² − 54p* + 26) / ((p*−2)·p*·(p*+1)) < 0`**

  for every `m ≡ 2 (mod 3)` with `m ≥ 2`. The quadratic has roots ≈ 0.72 and 1.44, so it is positive for `p* ≥ 2`.
- Instrument `crit_pi_formula.py` checks the identity exactly against big integers at `t = 0..299`. So does the equivalent
  form `−C(8m−1, p*−3)2^{p*−3}(25p*² − 54p* + 26)/((p*−2)(p*−1)(p*+1))`. `crit_symbolic.py` finds the uncancelled numerator
  `−(6400t² + 8736t + 2978)(16t + 12)` with zero remainder.

**Assembly (critic-derived; STATED at a review stage).** For every class `m` and `c = c_{1,1}`:

`Δ_{p*}(T − c) = Σ_{j=1}^{m−1} C(m−1,j)·Δ_{p*}(E0_j) + Σ_{j=0}^{m−1} C(m−1,j)·Δ_{p*}(E1_j) + Δ_{p*}(Π)`.

Each summand is strictly negative:
- `E0_j` and `E1_j` by C1-LA3's formally verified companion (G), with gaps `−2j−3` and `−2j−7`.
- `Π` by the closed form above.

All weights are positive, so `Δ_{p*}(T − c) < 0`. The dependencies are the closed form of record for `I(T − c)` (a
`proved_informal` node, validated here against the literal DP) and tool (G). Nothing uses Darroch, Newton, a mode or mean
argument, an asymptotic step, or a finite-range certificate.

**Transfer to every private leaf.** I checked the symmetry claim.
- For each choke `i`, permuting its 8 pendant paths `u_i–b_{ij}–c_{ij}` is an automorphism.
- Permuting the `m` choke subtrees at `r` is an automorphism.
- Together (`S_8 ≀ S_m`) these act transitively on the `8m` private leaves, and they fix `r, s, v`, `n`, `α` and hence `p*`
  (which depends on `m` alone).
- Isomorphic deletions have equal counts, so the predicate transfers.
- On the literal trees, `I(T − c_{1,1}) = I(T − c_{m,8})` at every row checked.

Confirmed. The return's transfer section is correct, but it transfers the wrong-index statement.

**Other attacks.**
- `1 ≤ t ≤ a+b` holds everywhere.
- ℕ-subtraction is safe: `p* − j ≥ 1` because `j ≤ m − 1 < p*`.
- The endpoint `m = 107` is covered by the uniform formula; no `M_0` is needed.
- There is no circularity: (G) is formal and independent of favorability.
- The closed form for `I(T − c)` is carried as a node. Its formal link to `cbGraph` is U3's object and remains open.

## Mechanism-equivalence and fence check

- **Darroch/Newton hygiene (fence 3).** The return applies neither. Neither do I. The only inputs are recurrence (R),
  log-concavity (formal, C1-LA3) and exact binomial ratios.
- **Fidelity (fence 2).** The index convention is violated (F-1), and this is the controlling finding. The route builds no
  network and does not derive `F_{p*}`, which is appropriate for a coefficient route but means it certifies no selector
  statement at all as delivered.
- **Census discipline (fence 7).** The return graded its 52-row domination `computer_assisted` and did not claim a universal
  result from data. That is correct on its own terms.
- **Refuted mechanisms (fence 6).** None revived. The route never applies real-rootedness to `I(T − c)`.
- **Fence 1.** One rank, the class only; no status transfer to any aggregate.
- **Mechanism equivalence.** The route's mechanism (block decomposition plus tool (G)) differs from the r30 key's proof
  (Newton plus Darroch on every block and on `Π`) only in how it proves each block. The *predicate* is part (ii) of the r30
  favorability key restricted to `d = 8`, `m ≡ 2 (mod 3)`, `m ≥ 107`.
- **Alias.** The return's candidate key `…EVERY-PRIVATE-LEAF-FAVORABLE-AT-RANK-16M-PLUS-4-OVER-3-VIA-TWO-BINOMIAL-DESCENT-EXCEPT-ONE-CERTIFIED-BLOCK`
  is lexically clear against the frozen registries: no exact hit in `sources/authority/CLAIM-IDENTITY.json` or the frozen
  master-494; `PRIVATE-LEAF`, `PAIRED-BLOCK` and `1-PLUS-3X` have 0 hits. It fails claim identity on two counts:
  1. Its name asserts favorability at `p*`, but what was proved is at `p* − 1` (F-1).
  2. The suffix `VIA-…-EXCEPT-ONE-CERTIFIED-BLOCK` describes a method, not a predicate. Mathematically it would alias the r30
     key's part (ii) on a sub-scope.

  **Do not register it.** The right record for the corrected result is a Darroch/Newton-dependency discharge note on the r30
  favorability key, scoped to the r31 class. If the synthesis wants the new lemma as its own key, it should be the paired-block
  lemma, a predicate that is new: for example
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-PAIRED-BLOCK-1-PLUS-X-TIMES-1-PLUS-3X-PLUS-X2-TIMES-1-PLUS-2X-TO-8M-MINUS-1-STRICTLY-DECREASES-AT-RANK-16M-PLUS-4-OVER-3`.
  That name has no exact or substring hit in either frozen registry. It needs an isolated second read.

## Certification audit

| Return literal | Status |
|---|---|
| "`Δ_{p*}(T−c) < 0` … i.e. `[x^{p*}] < [x^{p*−1}]`" (the obligation, §1, §7, candidate key) | **Struck.** Wrong index against the selector of record (F-1). |
| "`E1_j` … **proved** (universal, Darroch/Newton-free)" | Stands as a statement about `r(t+1) < r(t)` at the return's `t`. At the record index the same tool gives it with a larger margin. |
| "`E0_j`, `j ≥ 2` … **proved**" | Stands, as above. |
| "`E0_1` … via (G'): **proved** … new content" | **Struck.** (G') is false (F-2); its application misses the corrected tool by one. |
| "(G') … exactly C1-LA3's own proof, run in reverse" | **Struck.** The log-concavity inequality is reversed. |
| "`Θ = [6C − (p*+4)(C−D)]/p*` **proved** (exact algebra)" | Stands: re-derived from (R), and the identities are exact. It concerns the backward index only. |
| "52 rows … exactly negative" and the digit counts 407/419/430 | Replayed byte-identically and reproduced by my literal DP. Retained as `bounded_computation` about `Δ_{p*−1}`, not favorability. |
| "ratio monotonically increasing … 7.50 … 18.24" | Reproduced. Bounded observation only. |
| Grade "`computer_assisted` on the class" for the candidate key | **Struck** (F-1, F-2). |
| Digests `af0177fa…`, `2888f81f…`, `5816bd5c…` and the script hashes | Verified; replays byte-identical. |
| "Hypothesis range `1 ≤ t ≤ a+b` holds throughout" | Verified. |
| `FAV_darroch_free: advanced` (the return's gate line) | **Not backed by the return's own content** (wrong index). Advanced by this critique's derivation (F-4 plus the assembly), subject to a second read. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

`ELIG_formal: not_advanced`
`HALL_formal: not_advanced`
`FAV_darroch_free: advanced`
`cut_candidate: none`

**Retained, narrowed to:**
- The mechanism: the block decomposition of `I(T − c)` and tool (G) on the blocks `E0_j` (`j ≥ 1`) and `E1_j` (all `j`).
- The exact identities (i), (ii) and the `Θ` reduction, at the backward index.
- The bounded evidence, as statements about `Δ_{p*−1}`.

**Struck:**
- The favorability claim at `p*` (index fidelity).
- Tool (G') and the universal `E0_1` claim that rests on it.
- The candidate key and its grade.

The route's objective is nonetheless reached **by this critique**, not by the return. At the record index `Δ_{p*}(T − c) < 0`
for every private leaf and every class `m`, with no Darroch and no Newton. The blocks follow from (G), and the paired block from
the exact closed form `−C(8m−1, p*−1)2^{p*−1}(25p*² − 54p* + 26)/((p*−2)p*(p*+1))`. I believe the mathematics of that
statement is complete. Its grade is `proved_informal` (critic-derived, STATED at Stage 4, needs an isolated second read), and
it carries the closed-form node of record for `I(T − c)` as an input. As a finite certificate it would be none: the paired-block
bound is a hand identity with no range restriction.

## Remaining obligation

1. **Isolated second read** of the critic-derived private-leaf proof.
   - The convention `Δ_p = i_{p+1} − i_p`.
   - The gap forms `−2j−3` and `−2j−7` with `1 ≤ t ≤ a+b`.
   - The identity `(1−x)(1+x)(1+3x+x²) = 1 + 3x − 3x³ − x⁴`.
   - The four ratio factors and the numerator `−(25u² + 546u + 2978)`, `u = p* − 12`.
   - Positivity of the weights and the automorphism transfer.
2. **Favorability of the whole selector.** `F_{p*} = leafSet` also needs the arm leaf `v` (T1's object) at the same index
   convention. Check T1's return for the same `p*` vs `p* − 1` issue; its blocks `V_j` equal the `E0_j` here.
3. **Formal targets**, each a clean Lean statement over `Polynomial ℤ` coefficients:
   - The block identity for `I(T − c)` (an analogue of U1's identity for `I(T)`).
   - The paired-block inequality, via `Nat.choose` successor ratios. It has no `S_5`-type certificate and is universal.
   - The (G) applications (carried byte-identically from C1-LA3 entry 17).
   - The link of `I(cbGraph m − c_ij)` to the closed form. U3 owns this; it is open.
4. **The return's own open lemma** `|Θ| < (m−1)|Δ(E0_1)|` is closed by a degree-11 polynomial certificate (F-3,
   `computer_assisted`). It is moot for favorability and should not be funded further.
5. **Tool (G')** must not be carried or formalized as stated. The valid ascent statement is `6(k+1) ≤ 3a+4b ⇒ r(k) < r(k+1)`.
   The valid deficit-1 descent (`6k ≥ 3a+4b+1`) needs strict log-concavity, which is not in C1-LA3 (entry 16 is non-strict).

## Artifact inventory

Critic scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T2-U/`
(Python 3 standard library only; run with `python3 -B`).

| File | SHA-256 | Role |
|---|---|---|
| `own/crit_literal.py` | `3261a9d36257a3b0f7ae1ef76eb78a588aaf6e689d74216e7da91361d1f6bac9` | literal `CB(d,m)` builder, tree test, forest DP; closed forms vs literal (128 small + all class rows); record-index `Δ_{p*}(T−c)`, `Δ_{p*}(T−v)`, `x`, eligibility, the return's backward quantity, at `m = 107..311` step 3 |
| `own/crit_literal_out.json` | `485c546a76b794594c6b2bc18687fed333b3f95f6b82e59842f95a006118925a` | its output (69 rows, all negative at the record index; 0 mismatches) |
| `own/crit_literal_run.log` | `80b70558948ece867b8fb69ee28067f10e6e2289b4512c2a77bf6cf93c35c6e1` | run log |
| `own/crit_symbolic.py` | `f2c109d1a16eb8a0dd30224854590e0a4a56062ccfdd1d7cb170db28640ee72e` | record-index gap identities (1,917,090 checks); paired-block numerator; the return's open lemma as a degree-11 polynomial with shift test; (G') counterexamples; corrected tools |
| `own/crit_symbolic_out.json` | `e8dfaa66ce275ba902b3f4ca333d4686de68fc0190a962d8b66277419f488396` | its output |
| `own/crit_symbolic_run.log` | `2d59e145ea4858d37abfc0fa7722e9760f89981e08268eb78d4de5864b7daab3` | run log |
| `own/crit_pi_formula.py` | `5b35b143baf9e01519b74079775bae6d97353450708f0f5478b169fec99c3e37` | exact check of both closed forms of `Δ_{p*}(Π)` at `t = 0..299`; the return's ratio table |
| `own/crit_pi_formula_out.json` | `f4f62c1db27b5edbb6b3786744df651ee35aa704a81453d4b5bf47faa1f4442e` | its output |
| `replay/{tree_dp,main_verify,alias_check,diagnose_e00}.py` | `202c174e…`, `308fa575…`, `d55d71c2…`, `ae921f4d…` | the seat's scripts, copied out first (the originals' outputs are kept under `replay/orig/`) |
| `replay/tree_dp_out.json` | `af0177fa12262c946edc1a87cafe585055b60374922320215923482c5940709a` | replay, byte-identical |
| `replay/main_verify_out.json` | `2888f81f08798d3681f3355d907f59b475cce4eae93398842672529b515e22a8` | replay, byte-identical (PID `32785`, completed, confirmed stopped) |
| `replay/alias_check_out.json` | `5816bd5c46233d843a171ebd8e33c65f5409736993de5d197edf4855e30f33a3` | replay, byte-identical |
| `replay/main_verify_run.log` | `edce34551f97e83ddbf4b1047ef93107fe589aeea7124e5aef561a7dec01cca3` | replay log |
