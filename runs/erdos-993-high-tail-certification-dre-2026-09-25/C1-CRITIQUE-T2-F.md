# Critique

Critic `C-T2-F` (orientation F, falsify), r29 Cycle 1 Stage 4, on seat `T2`'s return (route `C1-T-02
TOP-RANK-NONRESIDUAL-COROLLARY`, orientation T). Run `erdos-993-math-dre-20260925-r29-high-tail-certification`.

Boot: operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and nothing else from VerityOS. After that I read only
the dispatch, the capsule members, `sources/` (authorized Stage 2 members) and the pinned Mathlib sources, which I
consulted for API meaning.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Read-boundary disclosure (filed out of caution): (i) I ran one non-recursive `grep -n "structure Connected" -A6` over
the `*.lean` files directly inside `…/Mathlib/Combinatorics/SimpleGraph/` and `…/SimpleGraph/Connectivity/` under
the shared Mathlib package directory, which is granted for API meaning. I also ran one `grep` on `Acyclic.lean`
there, to cite pinned lines. (ii) I ran `grep` on the assigned return and on T2's own `census_analyze.py` and
`census_gen.py` copies in my replay directory. (iii) I ran `ls` on my own critique target directory (`…/stage4/critics/T2/`,
which did not exist yet), and before copy-out I ran one non-recursive `ls` of `scratchpad/c1-T2/` to get its inventory.
Nothing else was listed or searched. I read no other return, critique, adjudication or experiment root. I used no
network and installed no packages.

## Identity and seal audit

Each seal was recomputed as SHA-256 of `json.dumps(manifest − seal_sha256, sort_keys=True,
separators=(",",":"))`, with no trailing newline:

| Object | Stated | Recomputed |
|---|---|---|
| Capsule `control/c1-critic-capsules/T2-PACKET-MANIFEST.json` | `f72d90d85163cba9b6e9e05ff9b9e973f22eb097af4f7f663f5386158639920c` | identical: MATCH |
| Stage 4 dispatch manifest | `62f95191f0e3d8f8177493e94a7501a34a3909199b0d8a21e416b931a80d5058` | identical: MATCH |
| Stage 3 packet manifest | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | identical: MATCH |
| Stage 2 packet manifest | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | identical: MATCH (equals the protocol's stated value) |

- All 14 capsule members match on SHA-256 and byte count. This includes the assigned return
  `cycles/cycle-1/stage3/returns/T2/RETURN.md` (`09eb816c…fe37`, 40,104 bytes), which also matches its Stage 3 manifest row.
- All 148 `sources/` rows of the Stage 2 manifest re-hash to their digests (0 mismatches). That covers every
  `sources/` file T2 lists: the r26 `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `VERIFICATION-REPORT.md`, and the
  first-interior `FINAL-ANALYSIS.md` and `C2-SCOPE-AUDIT.md`. `sources/authority/CLAIM-IDENTITY.json` has the same
  digest `97abd89e77314edba1f2ebde486a5e39ccd295cc3ffe609c36ef9e3da7775082` as T2's `control/CLAIM-IDENTITY.run-local.json`
  (the Stage 2 row). T2's abbreviation `97abd89e…82` is consistent with it.
- T2's `MATCH` claims for control-root files outside my capsule (`AUTHORIZATION.md`, `R29-CHARTER-PROMPT.md`,
  `C1-WORKER-COMMON-BRIEF.md`, `RESIDUE-CHECK.json`, `ROUTE-STATE.md`) are not re-hashed here, because those files are
  not in my grant. They are recorded as unverified by this critic, not as refuted.
- T2's artifacts, copied out first into `scratchpad/c1-crit-T2-F/replay/`: `census_gen.py` `7352d946…fb3a`,
  `census_analyze.py` `73c94c15…b264` and `census_result.json` `3b32e2a5…1460` all match the return's stated digests.
  My replay of `census_analyze.py 16` produced `census_result.json` with digest
  `3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460` twice (byte-identical to the shipped result).
- Pinned Mathlib: `git rev-parse HEAD` of the shared package gives `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals
  `sources/mathlib-binding/PIN.json`.

## Independent re-derivation

**Instrument (own, standard library, exact `int`)**: `scratchpad/c1-crit-T2-F/crit_instrument.py`. It uses a
different algorithm from T2's centroid generator and generating-function DP:

- **Free trees by canonical augmentation.** Each tree of order `n` is built by attaching a leaf to every vertex of
  every tree of order `n − 1`. Trees are deduplicated by a canonical form, which is the minimum over the centre
  vertices of the AHU string rooted at that centre. The centre set is an isomorphism invariant, so this is a
  canonical form. Every object passes an acyclicity-and-connectivity test (`n − 1` edges and one BFS component) and a
  2-colouring test in code, with 0 failures at every order.
- **Independence polynomials** come from the deletion recursion `I(M) = I(M − v) + x·I(M − N[v])`, memoised on
  vertex bitmasks of the original carrier. Deletion is done by avoidance, as in SEMANTIC-CONTRACT §1. As
  cross-checks, the recursion equals brute-force subset enumeration on all 436 trees of order ≤ 11 (whole graph) and
  on every induced subgraph of `K_2`, `P_3`, `K_{1,3}` and `P_5`.
- **`S(T, p)`** is computed from the definitions of record: original leaves, the unique support,
  `H = {v, s}`, `R = N[s]`, the strict selector `Δ_p(T − v) < 0`, and one summand per original leaf.

**Fixed points reproduced before any table**:

- `K_2` at `p = 1`: both leaves are favorable, both terms are `0`, `S = 0`.
- `P_3` at `p = 2`: both leaf terms are `−1`.
- Star `K_{1,m}`, `m = 2..8`, every `p ≥ 2`: the leaf term equals `C(m−1, p) − C(m−1, p−1)`.
- Free-tree counts for orders 1–16 equal A000055, summing to 32,508.
- Bipartite labelled graphs on 1–6 vertices number 1, 2, 7, 41, 376, 5177 (`bip_check.py`).

**Census, orders 1–16, `p = α − 1`** (`crit16.json`, digest `ead237a3…f832`). It agrees with T2 on every number:

- Eligible counts per order: 0 for orders 1–6, then 4, 6, 27, 90, 217, 502, 1301, 3156, 7741, 19320 for orders 7–16.
- Total: 32,364 eligible trees.
- Eligible trees by `α`, for `α = 5` to `15`: 3, 135, 877, 4068, 10794, 10594, 4644, 1082, 152, 14, 1.
- Orders ≤ 12 give 846 eligible trees.
- No eligible tree has `α ≤ 4`.
- `S > 0` never occurs. The maximum `S` over eligible trees is `−12`.
- Every leaf's pointwise term is `≤ 0` on every eligible tree, favorable or not.

T2's two named witnesses re-check exactly:

- Order 7, edges `(0,1),(0,4),(1,2),(1,3),(4,5),(4,6)`: `α = 5`, `x = 2`, `P = (1,7,15,12,5,1)`, all four leaves
  favorable with terms `−3` each, `S = −12`.
- Order 8, edges `(0,1),…,(0,5),(5,6),(6,7)` (taken from T2's shipped `witnesses`): `α = 6`, `x = 3`, favorable set
  `{1,2,3,4,7}`, terms `−5,−5,−5,−5,−3`, `S = −23`.

I also ran T2's DP (`census_analyze.indep_poly`) on every induced subgraph of `K_{1,3}` and `P_5`. It equals brute
force on all of them.

**TRN's derivation, re-derived**. `x` is `crossingIndex`, `α` is `indepNum`, ℕ throughout:

1. `x + 2 ≤ α − 1` in ℕ gives `α ≥ 3`. This needs no nonemptiness: at `α ∈ {0,1,2}` the right side is `≤ 1`.
2. `α ≥ 3` gives `n ≥ 3`. Then `i_0 = 1` (the empty set is independent) and `i_1 = n` (a `SimpleGraph` has no
   loops), so `Δ_0 = n − 1 ≥ 2 > 0`. By `Nat.find`, `x = 0 ⟺ Δ_0 < 0`, so `x ≥ 1` and `α ≥ 4`.
3. `p = α − 1 ≥ 3 ≥ 2`, and `3(α − 1) ≥ 2α + 1 ⟺ α ≥ 4`.
4. HTA at `p ≥ 2` (entry 44 `bipartiteHighTailAggregate`, compiled internal and unawarded) applies with `hBip`.

I also re-derived HTA at `p ≥ 2` in outline so that I do not rely on the entry:

- By `tagged_count_split`, the term equals `q_p − q_{p−1}` with `H = G − {v, s}` and `W = N(s) ∖ {v}`.
- `α(H) ≤ α(G) − 1`. Here `v` extends every independent set of `H`, because `v ∉ H` and `s ∉ H` (which uses
  `s ∉ H`), and `v`'s only neighbour is `s`.
- (TSB) at `k = p − 1 ≥ 1`. Each tagged `(k+1)`-set has at least `k` tag-preserving deletions. The addable set of an
  independent `k`-set induces a bipartite graph, and each colour class of it can be adjoined, so the set has at most
  `2(a − k)` vertices. This gives `k·q_{k+1} ≤ 2(α − 1 − k)·q_k`, and the guard gives `2(α − p) ≤ p − 1`.
- Hence `q_p ≤ q_{p−1}`. If `k > α(H)`, both counts are 0.
- Each summand is `≤ 0`, so every sub-sum over the selector is `≤ 0`.

I find the mathematics of TRN complete (`proved_informal` in my prose judgment). Its registry grade is the
synthesis's call.

## Attacks and findings

**A1. α = 4 (T2's open item 5): resolved. This is a critic-derived structural fact, attributed to `C-T2-F`.**
No tree that is eligible at the top rank has `α ≤ 4`, so the smallest possible `α` is 5.

*Proof.*

1. By steps 1–2 above, `α ≥ 4` and hence `n ≥ 5`, since a tree with an edge has `α ≤ n − 1`.
2. On a tree, `i_2 = C(n,2) − (n − 1)`, so `Δ_1 = i_2 − i_1 = (n² − 5n + 2)/2`.
3. This is `≥ 1` for every `n ≥ 5`. `n² − 5n + 2 < 0` exactly for `n ≤ 4`.
4. So `Δ_0 ≥ 0` and `Δ_1 ≥ 0`, which gives `x ≥ 2`. Eligibility `x + 2 ≤ α − 1` then forces `α ≥ 5`. ∎

The same holds on every finite bipartite graph:

- `n ≥ 6`: `e ≤ n²/4 ≤ C(n,2) − n`, so `Δ_1 ≥ 0`.
- `n = 5`: `Δ_1 < 0` needs `e ≥ 6`, which forces `K_{2,3}`, where `α = 3`.
- `n = 4` with `α = 4`: the graph is edgeless and `Δ_1 = 2`.

Checked exhaustively on the 5,177 labelled bipartite graphs of order 6 and below: 91 are eligible at the top rank,
with minimum `α` 5.

Consequences:

- The guard is never tight on TRN's domain. The slack is `3p − (2α + 1) = α − 4 ≥ 1`.
- T2's §1 step 5, "equality possible at `α = 4`", describes a case that never occurs.
- T2's candidate entry "derives alpha>=4 internally" can be strengthened to `α ≥ 5`.

Attribution caveat: the registry text of `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` already says "hEligible implies
alpha >= 4 since x >= 1 always" and, inside its `ℓ = 2` odd-path branch, "on the eligible class in fact alpha >= 5",
without a registry-stated proof. The general tree/bipartite proof above is mine.

**A2. Exhaustive corollary: TRN holds on every tree with `α ≤ 8` (critic-derived; `bounded_computation` over a complete class).**

- A bipartite graph has `α ≥ n/2`, so every tree with `α ≤ 8` has `n ≤ 16`.
- The two agreeing order-≤16 censuses (T2's and mine) therefore cover every tree with `α ≤ 8` completely.
- Up to isomorphism there are exactly 3, 135, 877 and 4068 eligible trees at `α = 5, 6, 7, 8`, all with `S ≤ −12`.
- With A1 (`α ≤ 4` is never eligible), TRN is verified by complete enumeration for `α ≤ 8`.

This is not a proof for general `α`. The proof is the HTA reduction.

**A3. Hypothesis placement: T2's "connectivity vs acyclicity" answer is imprecise in both halves (narrowing).**

1. §1 step 1 says only the `Nonempty` half of `hT` (the connectivity clause, `Connected.lean:316`
   `protected [nonempty : Nonempty V]`) enters. That is true as a Mathlib fact but not needed:
   - `α − 1 ≥ 2 ⇒ α ≥ 3` holds in ℕ with no honesty condition;
   - `n ≥ 1` then follows from `α ≥ 3`.
2. §1 step 6 and the draft contract say acyclicity supplies `hBip` "via `IsTree.isBipartite` (`Acyclic.lean:598`)".
   The pinned 598 lemma is `⟨hG.coloringTwo⟩`, and `IsTree.coloringTwo` is built from `hG.connected.nonempty.some`
   and tree distances (`Acyclic.lean:589–596`). It consumes the whole `IsTree`. The acyclicity-only route is
   `hT.isAcyclic.isBipartite` (field `isAcyclic`, `Acyclic.lean:63`; lemma `Acyclic.lean:617`).

**Critic-derived advance.** Connectivity is never used. TRN holds verbatim for every finite bipartite `G` under the
same ℕ hypothesis `crossingIndex G + 2 ≤ G.indepNum − 1`, and hence for every forest. The proof is steps 1–4 with
`hBip` in place of `hT`. It is conditional on HTA, exactly as TRN is. I record this as a scope observation, not a
registration.

**A4. §4 region note: right conclusion, wrong evidence (narrowing).**

- The remaining region `{p : x + 2 ≤ p ∧ 3p < 2α + 1}` is stated exactly.
- `3p = 2α` lies in it.
- `p = α − 2` is in the high-tail region iff `α ≥ 7`, which is consistent with ELIG.
- p = 1 cannot be an eligible rank on a tree (`x + 2 ≤ 1` is impossible), so HTA's `p = 1` endpoint plays no part
  in the scope note.

T2's claim that the region "is nonempty in general" cites the `P_3 ⊔ K_2` positive-term prior. That is a disconnected
non-tree, a pointwise term, and not an eligible rank, so it does not show that. My instrument supplies the correct
fact. It checks membership only and evaluates no sign in the fenced region: 3,806 trees of order ≤ 16 have an
eligible rank below the guard. The first is at order 11 (`α = 9`, `x = 4`, `p = 6`; AHU `((()()()()()())(()()))`).

**A5. Alias-check completeness (narrowing).**

- The return says the "Registered claims named" table carries "the full match list" of its 19 prefix hits. I confirm
  407 claims and 19 prefix hits.
- The table carries only 7 of the 19 prefix hits. It omits all six other R26 keys and six R23 Hall/rank-1 keys.
- The substantive omission is `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` (VERIFIED, informal only: `S ≤ −2` on the
  residual eligible class). It is at the same rank on the same aggregate. It is not an alias of TRN, since the
  hypotheses differ (`hAlpha`, (★)) and the conclusion is strict.
- The same key's text is prior art for T2's `α ≥ 4` ingredient ("x >= 1 always"), and T2 does not cite it.
- Confirmed:
  - no `E993-R24-` key exists;
  - `E993-R24-RC` and `r24 (RC)` are aliases of `E993-R26-TOP-RANK-RESIDUAL-SIGN`;
  - "COLLAPSE" and "SELECTOR" hit no statement or alias text.

**A6. r24 selector collapse (attack-brief item), verified on my census.** On all 32,508 trees of order ≤ 16 with
`α ≥ 2`, every original leaf is strictly favorable at `p = α − 1`. On trees `S(T, α − 1)` is therefore the full
leaf sum, and T2's exact `S` values are full leaf sums (T2's witnesses list `favorable = leaves`). This is a
critic-attributed scope-note candidate for TRN. It is not a registration of the r24 fact.

**A7. r26 relation: checked and correct.**

- The frozen r26 `Main.lean` has `topRankResidualSign (G) [DecidableRel G.Adj] (hTree) (hAlpha : 2 ≤ G.indepNum)
  (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) (hResidual : …) : aggregate G (G.indepNum - 1) ≤ 0`.
- The only extra hypotheses are `hAlpha` and (★), and the conclusion text is identical.
- Fragments 0001–0014 each occur byte-for-byte in both the r26 and first-interior `Main.lean`, so "identical
  conclusion" is literal.
- T2's "derivable as an immediate corollary" remark is correctly fenced as an unregistered observation.

**A8. Minor points.**

- "The smallest eligible tree" (§2): there are four eligible trees at the minimum order 7. T2's is one of them; mine
  (AHU `((()()())(()))`) has `S = −14`.
- In the draft `THEOREM-CONTRACT.yaml`:
  - it lists `Nat.sub` and a lemma (`bipartiteHighTailAggregate`) under `definitions`; they belong under dependencies;
  - the `hyp-eligible` ℕ/ℤ text ties the equivalence to `Nonempty`, but the equivalence holds for every `α`
    (at `α = 0` the integer side `x + 2 ≤ −1` is also false).
- No counterexample to TRN was found or is possible under the proof above.

## Mechanism-equivalence and fence check

- No no-recovery wording appears.
- The existing awards (`E993-R26-TOP-RANK-RESIDUAL-SIGN`, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`) are treated as
  inputs, never re-proved or re-registered.
- Entries 41–44 are cited as "compiled internal, unawarded". The phrase "already kernel-checked" in §1 step 4 is
  context only. I did not rebuild any Lean, since T2 is not a Lean seat.
- The lower region is not attacked. My A4 count checks membership only.
- No census value, root correction or Hall/SDR step enters the proof. The census is labelled `bounded_computation`.
- HTP vs `E993-BETA-TARGET`: T2 distinguishes them by carrier (governed `RTree` vs ordinary). TSB vs
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: T2 distinguishes them by `r` vs `2(a − k)` and cites the C2 scope audit.
  Both distinctions are adequate at T2's scope.
- Attribution: Codex/Astra for the proposal and r26 for the residual sub-case both travel.

## Certification audit

- **Struck:** "total wall time ≈ 1.1s" and "~1-2s". T2's own shipped `run1.log` reports `elapsed 22.555s`, and my
  replay took 27.7 s.
- **Struck:** "see the Registered claims named table above for the full match list" (7 of 19; A5).
- **Struck as evidence:** the §4 nonemptiness justification (A4). The claim stands on my count.
- **Narrowed:** "only the Nonempty half of `hT` enters" and "acyclicity … supplies `hBip`" via `Acyclic.lean:598` (A3).
- **Narrowed:** "the smallest eligible tree" becomes "an eligible tree of the minimum order 7" (A8).
- **Backed, by my instrument and replay:**
  - per-order and per-`α` counts; 32,508 trees and 32,364 eligible; 846 to order 12; 987 = A000055 through order 12;
  - `α ≤ 3` never eligible; `S > 0` never occurs; max `S = −12`;
  - both witnesses;
  - "byte-identical" digests `3b32e2a5…1460`;
  - Mathlib lines 598 and 617 exist as stated.
- **"Gap-free" (§9):** accepted for the logic. The hypothesis-placement commentary is imprecise (A3).

## Verdict

verdict: retained_narrowed
headline_resolved: no

The TRN reduction (eligibility ⇒ `α ≥ 4` ⇒ `p = α − 1` inside `3p ≥ 2α + 1` ⇒ HTA) is correct. I re-derived it
independently, including the HTA `p ≥ 2` core in outline. In prose I judge the mathematics complete
(`proved_informal`). T2's own `conditional` grade, pending HTA's own certificate, is not an overclaim.

The narrowings are A3, A4, A5 and A8, plus the struck wall-time and "full match list" literals.

Critic-derived advances, attributed to `C-T2-F`:

- no top-rank-eligible tree, or bipartite graph, has `α ≤ 4`, so the guard has slack `α − 4 ≥ 1` (A1);
- TRN is completely verified by enumeration for `α ≤ 8` (A2);
- connectivity is unused, so TRN holds for every finite bipartite graph, conditional on HTA (A3).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **TRN's formal award (LA4).** It needs HTA, or entry 44 carried byte-identically, at `p ≥ 2` only, plus the short
   ℕ arithmetic.
   - Use `hT.isAcyclic.isBipartite` (or `hT.isBipartite`; either compiles). The former makes the hypothesis
     accounting literal.
   - Add the `α ≥ 5` sharpening only if the synthesis wants it on the face. It needs the tree identity
     `i_2 = C(n,2) − (n − 1)`, which is available as entry 43's `delta_one_nonneg` helper, context only.
2. **Draft contract fixes.** Correct the draft `THEOREM-CONTRACT.yaml` per A8. State the ℕ/ℤ equivalence for every
   `α`.
3. **Alias table.** Complete it with the 12 omitted prefix hits, in particular `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`,
   and cite that key's text as prior art for `α ≥ 4`.
4. **Scope notes for the synthesis to judge** (not registrations): the bipartite generalisation of TRN (A3), the
   top-rank selector collapse on trees (A6), and "smallest eligible `α` is 5" (A1).
5. **Closed by this critique:** T2's item 5 (`α = 4`), resolved negatively with a proof. Item 6 ("976" vs 987) is
   confirmed independently: 987 (controller erratum R29-E-a).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-crit-T2-F/`:

| File | SHA-256 |
|---|---|
| `crit_instrument.py` (own instrument) | `60f80e526ce271588185df4c7cc60c7e040e673c552a0babf28a7530333f7099` |
| `crit12.json` (orders ≤ 12) | `21ad8add7264aa8cdf14c48efb10cfe2616c6c771a34c0b0fc4ebad4bdec3924` |
| `crit16.json` (orders ≤ 16) | `ead237a30e9867d0739420067cafc345ff6ef31fa9fa8886632c17dbb923f832` |
| `bip_check.py` (bipartite labelled ≤ 6) | `bc6ab40d327ff1eef29b70a3ee919a5b0cce312b7b828ea108cff9025f07b38d` |
| `replay/census_gen.py` (T2, copied out) | `7352d946688f3cf81925e34a7b50487261cbcbd0188fd2d33ed765b6c9a4fb3a` |
| `replay/census_analyze.py` (T2, copied out) | `73c94c150c35001325e5870c8393e49ce6e875534a3cd5e027e3a709f33fb264` |
| `replay/census_result.json` (T2 shipped) | `3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460` |
| `replay/census_result_replay.json`, `replay/census_result_replay2.json` (my replays) | `3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460` (both) |
| `replay/run1.log`, `replay/verify_seal.py` (T2, copied out) | `003212ce…3530`, `0c7384d8…125d` |

Every run was in the foreground (longest: 27.7 s). No background job was started, so there was nothing to kill.
Reread before close.
