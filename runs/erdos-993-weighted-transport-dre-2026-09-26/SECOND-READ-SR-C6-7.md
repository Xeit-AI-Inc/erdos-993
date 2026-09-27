# Second Read

Read `SR-C6-7`: AT, the arm-tag identity for a leaf on a degree-2 support (synthesis item 8; registration K-8). Run
`erdos-993-math-dre-20260926-r30-weighted-transport`, Cycle 6 (terminal cycle). Reader: Claude Opus 5.5, effort high. Isolated, with
no child delegation.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The host injected the root `CLAUDE.md` and the
auto-memory index into my context. I did not open them and did not act on them. I kept no conversation log, because the brief allows
only this file and my scratch directory.

## Identity and seal audit

- **Brief.** `control/C6-SECOND-READ-BRIEF-SR-C6-7.md` has SHA-256
  `95487aded46177341329a51bbd81e81c11ff9cc01b822bb94b9c692110847627`, recomputed with `shasum -a 256` before I followed it. It matches.
- **Protocol.** `control/C6-SECOND-READ-PROTOCOL.md` has SHA-256 `c2e9d131218cd682ab9113d8d0c536834dbf3c0e1e6aa2cdd5d8d1cb218837f9`,
  which matches its capsule digest.
- **Capsule seal.** `control/c6-second-read/SR-C6-7-PACKET-MANIFEST.json` has recorded seal
  `6325adbeb11d8d9aa09ff9a24d6c5b1dd7958ac48720ab9692496375325a6a49`. I recomputed it as the SHA-256 of the compact, key-sorted JSON of
  the manifest minus `seal_sha256`, with no trailing newline. It is identical. The manifest is stage `cycle-6-second-read-SR-C6-7`,
  schema `verityos.math-dre.packet-manifest.v1`, with 216 files. All 216 members match their listed SHA-256 and byte counts (0 bad;
  `seal_check.py`).
- **Frozen instruments.** All 177 capsule members under `sources/c6-stage7-sources/` match `sources/c6-stage7-sources/SOURCE-DIGESTS.json`
  (0 bad). I checked this before reading any of them.
- **Registries read.** The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c6-stage2.json` (460 claims, 460 unique keys),
  the frozen 434 master `sources/authority/CLAIM-IDENTITY.json` (434), and the live 457 master
  `sources/heterogeneous-closure/master-2026-09-27/CLAIM-IDENTITY.json` (457).
- **Read-boundary deviations, each disclosed.**
  1. **Glob outside the capsule.** A `grep -il` for the arm-tag terms used the glob `control/controller-facts/*`. The shell expanded it to
     every file in that directory, including files that are not capsule members. The output printed only the names of matching files.
     Among them were the non-members `CF-REPLAY-c4b.json`, `CF-REPLAY-c5b.json`, `CF-REPLAY-c5c.json`, `CF-REPLAY-c5d.json`,
     `cf_replay.py`, `cf_replay_c2*.py`, `cf_replay_c3c.py`, `cf_replay_c4a/b/c.py` and `cf_replay_c5a/b/c/d.py`. The same search also
     used the globs `sources/c6-stage7-sources/C-F2-U/*.py` and `sources/c6-stage7-sources/ADJ-F/own/*.py`, and every matching name it
     printed is a capsule member. No non-member file content was displayed, and I used none. The matches were on the case-insensitive
     token "at", so they are noise.
  2. **Probe of the output directory.** `ls second-reads/SR-C6-7`, run before I created it, returned "No such file or directory". No
     names were listed.
  3. **Host spill files.** The host saved two oversized tool outputs (a combined boot and manifest print, and a manifest print) under its
     own tool-results directory. I did not open those files. I re-read the same content from the capsule and boot files directly.
  4. **Copy-out replay.** I copied the capsule member `sources/c6-stage7-sources/ADJ-F/own/trees.py` byte-identically into my scratch
     (`replay-adjF/trees.py`, same SHA-256 `322b8c96…`) for a copy-out replay. The sealed member was not edited.
  - No network, installs, `lake`/`lean`, `find`, background jobs, process listings or kills were used. All Python ran as `python3 -B`,
    standard library only, with exact integers.

## Statements read

- **SR-C6-7a (AT).** On any finite simple graph `G`, let `v` be a leaf whose support `s` has degree 2 with `N(s) = {v, r}`. Then:
  - `W_v = {r}`;
  - for every `j ≥ 1`, `q_v(j) = i_{j−1}(G − N_G[r] − v)`;
  - hence, for every `p ≥ 2`, `q_v(p) − q_v(p−1) = Δ_{p−2}(G − N_G[r] − v)`.

  This is an identity about one leaf's summand. It signs nothing.
- **SR-C6-7b (key and name).** `E993-R30-LEAF-ON-DEGREE-TWO-SUPPORT-TAGGED-COUNT-EQUALS-INDEPENDENT-COUNT-ONE-LOWER-OFF-FAR-NEIGHBOUR-CLOSED-NEIGHBOURHOOD-AND-LEAF`.
  The questions are whether the name is a predicate of 7a, and whether it passes the alias check against the 460 snapshot, the 434
  master and the 457 master. Scope: any finite simple graph, every `j ≥ 1`. Required attribution on the face: `C-F2-U`, the F
  adjudicator's check, and the definitions of record.
- **Origins read.**
  - `C-F2-U` `## Attacks and findings` F-5.
  - The F adjudication `## Established results`, item AT.
  - Synthesis `## Exact established results` item 8, `## Registrations` K-8, and the SR-C6-7 row of the second-read batch table.
  - The synthesis `## Lean awards` row for AT, which carries the guarded Lean form.
  - `C-F2-T` R2 (the F2 witness as `q_19(j) = [j = 1]`), and the F2 return's witness rows as records.
  - `SEMANTIC-CONTRACT.md` §1.1 and `SOLUTION-CONTRACT.md` §§3–4.
  - The controller alias pre-screen entry K-8.
  - Controller facts `C6-STAGE5-CONTROLLER-FACTS-F.json` and `C6-STAGE6-CONTROLLER-FACTS.json`. These are facts, never authority; they
    contain no AT-specific item.

## Independent re-derivation

**Definitions of record** (`SEMANTIC-CONTRACT.md` §1.1):

- A leaf `v` is an ORIGINAL degree-one vertex. Its support `s = s_v` is its unique neighbour.
- `H_v = G − {v, s_v}`, so BOTH `v` and `s` are already removed in `H_v`. `R_v = G − N_G[s_v]`, and `W_v = N_G(s_v) ∖ {v}`.
- `q_v(j) = i_j(H_v) − i_j(R_v)`. This is the number of independent `j`-subsets of `V ∖ {v, s}` that meet `W_v`, which is
  `(taggedFamily G (univ ∖ H G v) (R G v) j).card`.
- The per-leaf summand at rank `p` is `q_v(p) − q_v(p−1)`. Also `Δ_k(X) = i_{k+1}(X) − i_k(X)`.

**Proof of 7a.** Assume `N_G(s) = {v, r}` with `|N_G(s)| = 2`.

1. **The vertices are distinct, and `v ∉ N_G[r]`.** `r ≠ v` because the degree is 2, and `r ≠ s` because `G` is simple. `v` is not
   adjacent to `r`, because `v`'s only neighbour is `s ≠ r`. So `v ∉ N_G[r]`, while `s ∈ N_G(r) ⊆ N_G[r]`.
2. **`W_v = {r}`.** `W_v = N_G(s) ∖ {v} = {r}`.
3. **The bijection.** Fix `j ≥ 1`. An independent `j`-subset `A` of `V ∖ {v, s}` meets `W_v = {r}` if and only if `r ∈ A`. Then
   `A′ = A ∖ {r}` has these properties:
   - it has `j − 1` elements;
   - it is independent;
   - it avoids `v` and `s`;
   - it avoids `N_G(r)`, because `A` is independent and contains `r`;
   - it avoids `r`.

   So `A′` is an independent `(j−1)`-subset of `V ∖ (N_G[r] ∪ {v, s}) = V ∖ (N_G[r] ∪ {v})`, since `s ∈ N_G[r]`.

   Conversely, let `A′` be an independent `(j−1)`-subset of `V ∖ (N_G[r] ∪ {v})`. Then `A′ ∪ {r}`:
   - is independent, because `A′` avoids `N_G(r)`;
   - has `j` elements, because `r ∉ A′`;
   - avoids `v`, and avoids `s ∈ N_G[r]`;
   - contains `r`.

   The two maps are mutually inverse. Hence `q_v(j) = i_{j−1}(G − N_G[r] − v)` for every `j ≥ 1`.
4. **The summand.** For `p ≥ 2`, both `p` and `p − 1` are `≥ 1`. So
   `q_v(p) − q_v(p−1) = i_{p−1}(X) − i_{p−2}(X) = Δ_{p−2}(X)`, where `X = G − N_G[r] − v`. ∎

**Where each hypothesis enters.**

- `deg(s) = 2` is what makes `W_v` the singleton `{r}`.
- "`v` is a leaf" enters only through the definitions of `s_v`, `H_v` and `W_v`. The bijection itself needs no fact about `v` beyond
  `v ∉ A`, because `v` is removed explicitly on both sides.
- No tree, connectivity, bipartite, eligibility, favorability or selector hypothesis is used. The statement is graph-generic.
- The subtracted set is exactly right. `N_G[r]` removes `r`, its neighbours and `s`. The separate "`− v`" is necessary, because
  `v ∉ N_G[r]` while `H_v` excludes `v`.
- The negative controls confirm this. Every wrong variant fails on every tree instance of order ≤ 11:
  - `G − N[r]`, which keeps `v`: 637 of 637 fail;
  - `G − N(r) − v`, which keeps `r`: 637 of 637 fail;
  - `G − {v, s, r}`: 635 of 637 fail.

  The correct form fails on 0 of 637.

**Guards and ℕ-subtraction.**

- **`j ≥ 1` is load-bearing in ℕ.** At `j = 0`, `q_v(0) = 0`, but the truncation `0 − 1 = 0` gives `i_0 = 1`. This mismatches on every
  instance: 637 of 637 trees and 4,188 of 4,188 random graphs.
- **`p ≥ 2` is load-bearing in ℕ.** At `p = 1` the summand is `q_v(1) − q_v(0) = 1 − 0 = 1`. The truncation `p − 2 = 0` instead gives
  `Δ_0(X) = i_1(X) − 1`. This mismatches unless `|X| = 2`: in 609 of 637 tree instances and 3,226 of 4,188 random-graph instances.
- **Over ℤ both guards disappear.** With zero extension (`i_{−1} = 0`), both forms also hold at `j = 0` and at `p = 1`. That is the
  convention of the F adjudicator's instrument (`co(P, −1) = 0`).
- **The Lean form is consistent.** The synthesis's guarded form
  `∀ j ≥ 1, (taggedFamily G (univ ∖ H G v) (R G v) j).card = indepSetCount G (insert v (insert r (G.neighborFinset r))) (j − 1)`
  agrees with the proof. `insert v (insert r (N(r)))` is `N_G[r] ∪ {v}`. In `taggedFamily`, "meets `R G v = {s, v, r}` inside
  `univ ∖ {v, s}`" is exactly "contains `r`". The identity consumes no other ℕ-subtraction.

**Edge cases.**

- **`X = G − N_G[r] − v = ∅`.** Then `i_0(X) = 1` and `i_{j−1}(X) = 0` for `j ≥ 2`, so `q_v(1) = 1` (the set `{r}`) and `q_v(j) = 0` for
  `j ≥ 2`. The summand is `Δ_{p−2}(∅)`: it is `−1` at `p = 2` and `0` at every `p ≥ 3`. This is the F2 witness `K_{1,17}` plus the path
  `0–18–19`, with `v = 19`, `s = 18` and `r = 0`, where `q_19(j) = [j = 1]`. That agrees with `C-F2-T` R2 and `C-F2-U` F-5.
  - Instances: 11 trees of order ≤ 11, 692 connected cyclic graphs and 1,223 arbitrary graphs.
- **`r` of degree 1 in `G`.** Then the component is the path `v–s–r`, with `N[r] = {r, s}` and `X = G − {v, s, r}`. The identity holds,
  and `r` is itself a leaf on the same support, with the symmetric identity.
  - Instances: 2 trees (the path on 3 vertices) and 5,166 arbitrary graphs, 0 failures.

**Own instrument** (`scratchpad/c6-sr-SR-C6-7/at_check.py` and `at_controls.py`; exact integers, standard library).

- **Tree generator.** Free trees are grown by leaf addition and deduplicated by a centre-rooted canonical code. The counts per order
  1–11 are 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, which equals A000055 and totals 436 trees.
- **Counter.** Independent sets are counted by recursive enumeration over a bitmask. `q_v` is computed twice:
  - by definition, as the independent subsets of `V ∖ {v, s}` meeting `W_v`, by brute force;
  - as `i_j(H_v) − i_j(R_v)`.

  The two agree everywhere (`def_fail` 0).
- **Every free tree of order ≤ 11.** The check runs at every leaf with a degree-2 support, every `j ∈ [1, n+1]` and every
  `p ∈ [2, n+2]`, so beyond capacity too.
  - 351 of the 436 trees carry such a leaf, giving 637 instances.
  - The identity was checked 7,149 times with 0 failures. The summand was checked 7,149 times with 0 failures.
- **Random connected graphs with cycles, order 3–10.** There are 4,000 graphs from seed 993007. Each has a planted leaf on a degree-2
  support, has at least one cycle, and is randomly relabelled. Every qualifying leaf is tested.
  - This gives 4,188 instances.
  - The identity was checked 38,511 times with 0 failures. The summand was checked 38,511 times with 0 failures.
  - `RESULT_SHA256 1e073fd06552a5f1a3f1d58d7eeb558e3e7255b9b3f17f5feb9d87b6fb38b9fd`.
- **Arbitrary random simple graphs, order 3–10.** There are 6,000 graphs from seed 993077 that carry at least one qualifying leaf. Of
  these, 4,443 are disconnected and 1,307 contain a cycle.
  - This gives 10,827 instances.
  - The identity was checked 84,955 times with 0 failures. The summand was checked 84,955 times with 0 failures.
  - `RESULT_SHA256 f2ed58e672add8f199a20a808931e0b14f3e27739f9a005b79b0ccce7a9baa9f`. This hash includes the negative controls.
- **Third instrument, reference only.** I ran a copy-out replay of the F adjudicator's arm-tag block (`ADJ-F/own/checks_f2.py` lines
  25–39, using its `trees.py`). It reproduced **18,979 checks, 0 failures** on every free tree of order ≤ 12, with 551 trees at order 12.
  - `C-F2-U`'s `witness_and_arm.py` checks the summand form on trees with `n ≤ 14`, `p ∈ [2, n−1]` (its 109,982). I read it but did not
    re-run it.
  - Both frozen instruments are tree-only. The general-graph scope rests on the proof above, and my random-graph checks are its records.

## Findings and repairs

1. **7a is correct as stated, at the stated scope and guards.** The proof is two lines, and each step is checked above. It is an
   IDENTITY about one leaf's tagged count and summand:
   - it signs nothing;
   - it is not (HALL), not (HALL-COND), not a flow and not a cut;
   - it says nothing about favorability, eligibility or `S(G, p)`.

   No repair to the statement is needed.
2. **Alias check: lexically clear.** I checked against all three registries (`alias_check.py`):
   - there is no exact key;
   - no `alias_patterns` regex hits the name, its spaced lower-case form, or the statement text;
   - there is no alias equality;
   - there is no token overlap ≥ 85% with ≥ 4 shared tokens.

   The top overlaps are `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (3/7), the OPEN primary aggregate key (2/6) and
   `E993-BETA-AGG-SUPPORT` (1/3), in all three registries. The forbidden phrases do not occur in the name. This reproduces the
   controller pre-screen. The pre-screen covered the 460 and the 457, and I add the 434.
3. **Content neighbour found. The lexical screen, the critic and the synthesis all missed it. This requires a repair.**
   `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` is VERIFIED (independently adjudicated informal proof) and present in the
   460, the 434 and the 457. It states, for every finite ordinary tree `T` and original leaf `v` whose support `s` has degree two with
   other neighbour `g`:
   - `A = T − {v, s}`, `H = A − g` and `U = A − N_A[g] = T − (N_T[v] ∪ N_T[g])`;
   - `I(A) = I(H) + z·I(U)`;
   - `b_v(T,p) − B_s(T,p) = Δ_{p−1}(A) − Δ_{p−1}(H) = Δ_{p−2}(U)` at every integer `p`, with zero extension.

   The notation matches AT's:
   - `A = H_v`;
   - `H = T − N_T[s] = R_v`;
   - `g = r`;
   - `U = T − N[r] − v`, because `N_T[v] = {v, s} ⊆ N_T[r] ∪ {v}`.

   So, restricted to trees:
   - AT's count form `q_v(j) = i_j(A) − i_j(H) = i_{j−1}(U)` is exactly the coefficient reading of the registered `I(A) = I(H) + z·I(U)`;
   - AT's summand form `q_v(p) − q_v(p−1) = Δ_{p−1}(H_v) − Δ_{p−1}(R_v) = Δ_{p−2}(U)` is exactly the registered last clause. The
     registry's own scope line gives `B_s(T,p) = Δ_{p−1}(T − N_T[s])`, and its statement gives `b_v − B_s = Δ_{p−1}(A) − Δ_{p−1}(H)`.

   AT is therefore NOT new at tree scope. Its new content is:
   - (i) the graph-generic scope. The recurrence `I(A) = I(A − r) + z·I(A − N_A[r])` needs no tree hypothesis, and neither does the
     bijection;
   - (ii) the reading through the r30 tagged count `q_v` and `W_v = {r}`.

   **Repair.** A new key is acceptable, because the statement is strictly broader than the registered tree identity and is a different
   predicate. But it must carry a DISTINCTION ROW against that key, name the prior tree form by key in its ATTRIBUTION, and claim no
   novelty at tree scope. The `C-F2-U` remark that AT is "likely already implicit in the `T_m` analysis of record" is superseded: AT is
   explicitly registered at tree scope under the key above.
4. **A second lexical and content neighbour.** `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD` is VERIFIED, and its scope contains
   "arm-tag". It is a Delete/Retag Hall-neighbourhood statement on `CB(j,k)` under the r23-style literal relation. Its deficiency
   `C(m,p−1)2^{p−1} − C(m,p−2)2^{p−2}` is the value AT gives for the arm summand when `X` is `m` disjoint edges. AT asserts no
   neighbourhood, relation or Hall content. It gets a distinction row.
5. **The brief's named non-neighbours: confirmed.**
   - The master's R26 fibre-bound key is an occupancy inequality over all independent subsets of a vertex set. It has no leaf, support,
     `W_v` or `q_v` content. It is not a neighbour, and AT's name and text avoid its alias patterns.
   - `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED at order 91) asserts injectivity of a linear down-map on marked sets.
     AT asserts no map and no injectivity, so it is not a neighbour and not a revival.
     - AT only evaluates the dimensions of that map's domain and codomain. At the `T_m` arm these are `q_v(p)` and `q_v(p−1)`.
     - For the record only: with `X` being 66 isolated vertices at `p = 34`, the difference is
       `C(66,33) − C(66,32) = 212336130412243110`. That is consistent with the refutation of record, and it is not evidence of anything
       here.
   - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID; `formally_verified`) is an input. It is not touched. It is different content:
     a whole-graph weight identity over all tags, whereas AT evaluates one tag's `q_v`. It gets a distinction row for clarity.
6. **Name (7b).** The key name asserts exactly the count form of 7a:
   - "leaf on degree-two support" is the hypothesis;
   - "tagged count" is `q_v(j)`;
   - "independent count one lower" is `i_{j−1}`;
   - "off far-neighbour closed neighbourhood and leaf" is `G − N_G[r] − v`.

   It does not assert the summand corollary, which is fine, since a name may assert less. It asserts no tree, sign or Hall content. It
   contains no working label (AT, F-5, K-8), no award label and no forbidden phrase. It is a predicate the statement satisfies. **No
   rename.**
7. **Consequences not in scope.** These are all outside this key, and none is graded here:
   - `C-F2-U`'s hub-family and pendant-path consequences (the pendant-path successor hint is struck in the synthesis);
   - the bounded searches;
   - the `T_22/34` record;
   - the implication "all summands ≤ 0 ⇒ (HALL-COND)".

## Registration text

```text
KEY: E993-R30-LEAF-ON-DEGREE-TWO-SUPPORT-TAGGED-COUNT-EQUALS-INDEPENDENT-COUNT-ONE-LOWER-OFF-FAR-NEIGHBOUR-CLOSED-NEIGHBOURHOOD-AND-LEAF
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For every finite simple graph G and every degree-one vertex v of G whose unique neighbour s = s_v has degree 2 with N_G(s) = {v, r}: W_v = N_G(s) \ {v} = {r}, and for every natural j >= 1, q_v(j) = i_{j-1}(G - N_G[r] - v), where q_v(j) = i_j(G - {v, s}) - i_j(G - N_G[s]) is the number of independent j-subsets of H_v = G - {v, s} that meet W_v, and G - N_G[r] - v deletes the closed neighbourhood of r (which contains s) and the vertex v (which is not in N_G[r]). Consequently, for every natural p >= 2, the per-leaf summand q_v(p) - q_v(p-1) equals Delta_{p-2}(G - N_G[r] - v) = i_{p-1}(G - N_G[r] - v) - i_{p-2}(G - N_G[r] - v). Proof on the face: an independent j-set of H_v meets W_v = {r} iff it contains r; A -> A \ {r} is a bijection onto the independent (j-1)-subsets of V \ (N_G[r] ∪ {v}), with inverse A' -> A' ∪ {r} (independent because A' avoids N_G(r); it avoids v and s; it has j elements because r is not in A'). Edge cases: if G - N_G[r] - v is empty then q_v(1) = 1 and q_v(j) = 0 for j >= 2; r of degree 1 is allowed. The guards j >= 1 and p >= 2 are load-bearing in natural-number arithmetic (j = 0: q_v(0) = 0 against i_0 = 1; p = 1: summand 1 against i_1 - 1); over the integers with zero extension (i_{-1} = 0) both forms also hold at j = 0 and p = 1. Guarded Lean form: for all j >= 1, (taggedFamily G (univ \ H G v) (R G v) j).card = indepSetCount G (insert v (insert r (G.neighborFinset r))) (j - 1).
SCOPE: Every finite simple graph, with no tree, connectivity, bipartite, eligibility, favorability or selector hypothesis; one degree-one vertex v at a time (leaves sharing a support are separate tags); every natural j >= 1 for the count form and every natural p >= 2 for the summand form. An identity evaluating one leaf's tagged count and summand; it signs nothing.
ATTRIBUTION: Stated by critic C-F2-U (Claude Opus 5.5; r30 Cycle 6 Stage 4 critique of the F2 route; summand form checked by brute force on trees of order <= 14); checked by the r30 Cycle 6 F adjudicator (18,979 count-form identities on every free tree of order <= 12, 0 failures); r30 Cycle 6 synthesis item 8; isolated second read SR-C6-7 (Claude Opus 5.5; graph-generic re-proof and own check). Definitions: q_v, W_v, H_v, R_v and the per-leaf summand from the Codex (GPT-6) lower-region run; taggedFamily and tagged_count_split from the first-interior definitions of record (Codex). Prior tree-scope form: E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION, whose clauses I(A) = I(H) + z*I(U) and b_v - B_s = Delta_(p-2)(U) are this statement restricted to finite ordinary trees; no novelty is claimed at tree scope.
FENCES: Not (HALL), not (HALL-COND), not a flow, relation or cut statement; not a favorability statement; asserts no sign of the summand or of S(G, p) and no eligibility content; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and the primary aggregate are untouched; not a revival of the refuted E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (no map and no injectivity are asserted; the identity only evaluates tagged counts); E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY is a separate input and is not touched; at tree scope it coincides with E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION and transfers no status to or from it; bounded checks are records, never evidence; the critic's hub-family, pendant-path and positive-summand-horizon consequences are not part of this key.
ALIASES: arm-tag identity
```

```text
DISTINCTION ROW: SR-C6-7-D1
KEY: E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION
TEXT: The registered key is a finite-ordinary-tree identity package (I(T-v), I(A) = I(H) + z*I(U), a_v = Gamma, b_v - B_s = Delta_(p-2)(U)) in the r23 original-leaf notation with gateway g. The new key restricts to exactly its I(A) = I(H) + z*I(U) coefficient reading and its b_v - B_s clause when G is a tree (A = H_v, H = R_v, g = r, U = G - N_G[r] - v), and extends that content to every finite simple graph in the r30 tagged-count notation q_v with W_v = {r}. It asserts nothing about I(T-v), a_v or Gamma. No novelty is claimed at tree scope; the registered key keeps its own grade and scope; no status transfers in either direction.
```

```text
DISTINCTION ROW: SR-C6-7-D2
KEY: E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD
TEXT: The registered key is a Hall-neighbourhood statement for the complete arm top family of CB(j,k) under the literal Delete/Retag relation (zero Retag export, exact neighbourhood cardinality, exact deficiency). The new key asserts no relation, neighbourhood, deficiency or Hall content; it evaluates one leaf's tagged count on any finite simple graph. The shared token is the arm-tag vocabulary only; the registered deficiency formula is not derived from, and does not follow from, the new key.
```

```text
DISTINCTION ROW: SR-C6-7-D3
KEY: E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY
TEXT: The registered key (formally verified) equates total source supply minus total target capacity of the active-tag weight network with the sum over a tag set F of q_v(p) - q_v(p-1), with q_v taken as defined. The new key evaluates q_v for one tag whose support has degree 2; it uses the registered key's definition of q_v only, is not a consequence of it, and neither strengthens nor touches it.
```

```text
RECORD: SR-C6-7-R1
CLAIM: Own brute force (reader SR-C6-7): on every free tree of order <= 11 (436 trees, A000055 counts; 637 leaf-on-degree-2-support instances), q_v(j) = i_{j-1}(G - N_G[r] - v) holds at all 7,149 checks with j in [1, n+1] and the summand form at all 7,149 checks with p in [2, n+2]; on 4,000 random connected graphs with cycles of order 3 to 10 (seed 993007; 4,188 instances) 38,511 plus 38,511 checks; on 6,000 arbitrary random simple graphs of order 3 to 10 (seed 993077; 4,443 disconnected, 1,307 with a cycle; 10,827 instances) 84,955 plus 84,955 checks; 0 failures everywhere; negative controls G - N[r], G - N(r) - v and G - {v, s, r} fail on 637, 637 and 635 of 637 tree instances; the unguarded natural-number forms fail at j = 0 on every instance and at p = 1 unless |G - N_G[r] - v| = 2.
STATUS: bounded_computation
PROVENANCE: scratchpad/c6-sr-SR-C6-7/at_check.py (fda237f9598e3b726e82680ca1bf7be1bb2194008a0f0e8a79c04f140f8ddfcd; RESULT_SHA256 1e073fd06552a5f1a3f1d58d7eeb558e3e7255b9b3f17f5feb9d87b6fb38b9fd) and at_controls.py (2b23ab1d0253460c7d76a0d9e2bb152a6e96decd75c20787b6b6b76bf5b0d130; RESULT_SHA256 f2ed58e672add8f199a20a808931e0b14f3e27739f9a005b79b0ccce7a9baa9f); copy-out replay of the F adjudicator's arm-tag block reproduced 18,979 checks, 0 failures, order <= 12.
```

## Verdicts

verdict[SR-C6-7a]: confirmed
verdict[SR-C6-7b]: confirmed_with_repairs

- **SR-C6-7a: confirmed.** The statement is exact at its scope (any finite simple graph), with the guards `j ≥ 1` and `p ≥ 2`, which
  are load-bearing in ℕ. It is an identity that signs nothing.
- **SR-C6-7b: confirmed_with_repairs.** The key name is a predicate of 7a and is kept unchanged, and the lexical alias check is clear in
  the 460, the 434 and the 457. The repairs:
  - the mandatory DISTINCTION ROW SR-C6-7-D1 against the VERIFIED tree-scope identity
    `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`, which is this statement restricted to trees;
  - naming that key in the ATTRIBUTION, with no novelty claimed at tree scope;
  - distinction rows D2 and D3.

  The exact text to register is under `## Registration text`. Grade `proved_informal`.

## Artifact inventory

Everything below is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/`, with SHA-256 values.

- `second-reads/SR-C6-7/SECOND-READ.md`: this file (no self-digest).
- `scratchpad/c6-sr-SR-C6-7/seal_check.py` (`cd6b9c0bed8c062f4fe5f789167cdc8d1bb970de06f9415dd91df4b45ea83b4c`): the capsule seal and
  216 member digests.
- `scratchpad/c6-sr-SR-C6-7/seal_check_out.txt` (`e2ded26f97531f8969aff9750faeb6a1e66c71d9aafd8b3dfeaf962e4635677c`).
- `scratchpad/c6-sr-SR-C6-7/alias_check.py` (`1faf7fc8e11525d1ad1b359e2d13daf37114fee03014df9e7106336e83d968c4`): the alias and content
  check against the 460, 434 and 457.
- `scratchpad/c6-sr-SR-C6-7/alias_check_out.txt` (`79fe6961180daaf595adb51d21307264756e2fa1333b246d36a6bdb0fa680072`).
- `scratchpad/c6-sr-SR-C6-7/at_check.py` (`fda237f9598e3b726e82680ca1bf7be1bb2194008a0f0e8a79c04f140f8ddfcd`): the own instrument, with
  its own generator and counter.
- `scratchpad/c6-sr-SR-C6-7/at_check_out.txt` (`4481bf00a07aa03df23438907123df29ff24e994b813c1d4ffb5c232386e354c`); its `RESULT_SHA256`
  is `1e073fd0…`.
- `scratchpad/c6-sr-SR-C6-7/at_controls.py` (`2b23ab1d0253460c7d76a0d9e2bb152a6e96decd75c20787b6b6b76bf5b0d130`): the negative controls
  and arbitrary graphs.
- `scratchpad/c6-sr-SR-C6-7/at_controls_out.txt` (`8c80c572cbbb7e3643fddd90d9c692321e57427f517f9b86359fc5086bb8e4a9`); its
  `RESULT_SHA256` is `f2ed58e6…`.
- `scratchpad/c6-sr-SR-C6-7/replay-adjF/trees.py` (`322b8c967984d094a1b30d902ba1cefb86eaa2bea2d59abc76d08a0244d37214`): a byte copy of
  the capsule member, used for the copy-out replay. The replay ran inline and printed "checks 18979 failures 0".
- **Process state.** No background jobs were started, so none is running at this write. There was no process listing and no kill.
- **Reread.** I reread this file before close: the headings match the protocol, there is one verdict line per statement, and the
  registration grammar holds (one field per line; the ALIASES line is a name only; GRADE is a bare token). The registration text
  contains no award working label, none of the three forbidden phrases, and no working label as a key or alias.
