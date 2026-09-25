# Critique

Critic `C-F1-U` (orientation U, formal/structural) of seat `F1`, route `C1-F-01 HIGH-TAIL-FALSIFICATION-AND-BOUNDARY`,
r29 Cycle 1 Stage 4. Return under review: `cycles/cycle-1/stage3/returns/F1/RETURN.md` (SHA-256 `44139def…6563`,
34,844 bytes).

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch requires. The task subsystem is this experiment
root (`experiments/`), read only within the capsule grant.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.** (1) The dispatch grants the return's artifacts under `scratchpad/c1-F1/`. The return says
that directory is unused and lists its artifacts under `scratchpad/c1-F1-replay/`. I copied exactly the 13 files the
return lists there (7 scripts, 6 reports), by name and with no listing or glob, into my scratch (`replay/`) before I read
them. I treat this as the dispatch's intended grant, applied to the path the return actually lists, and disclose it here.
(2) The harness injected the project `CLAUDE.md` and an auto-memory index into my context. I did not open those files and
did not use them. (3) The harness saved the over-long return read to a tool-results file under
`~/.claude/projects/…`, and I read the return from there. Its content is the same as the sealed return, which I digest-checked
on disk. (4) `gen_reconcile.py` was not replayed because it reads `control/controller-prerun/ht_report.json`, which is not a
capsule member. I read nothing else: no other return, critique, adjudication, experiment root, the network or
`controller-prerun/`. I ran no search rooted above my grant. My only `grep` calls were inside my own scratch copies and on
`control/SOURCE-DIGESTS.json`, which is a capsule member.

## Identity and seal audit

Canonical recomputation: SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",", ":"))`, no
trailing newline (`scratchpad/c1-crit-F1-U/seals.py`).

| Manifest | Recorded seal | Recomputed | Match |
|---|---|---|---|
| Capsule `c1-critic-capsules/F1-PACKET-MANIFEST.json` | `0b798ce91295d49ca8cae16fad8120bf5f8bf8dfdb4e3f3a91a08ad9a7a692dc` | same | yes |
| Stage 4 dispatch `C1-STAGE4-DISPATCH-MANIFEST.json` | `62f95191f0e3d8f8177493e94a7501a34a3909199b0d8a21e416b931a80d5058` | same | yes |
| Stage 3 `C1-STAGE3-PACKET-MANIFEST.json` | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | same | yes |
| Stage 2 `C1-STAGE2-PACKET-MANIFEST.json` | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | same | yes (equals the protocol's pinned value) |

All 14 capsule members match their manifest SHA-256 values and byte counts, including the return (`44139def…`). Digests the
return itself lists:
- `sources/first-interior/records/C2-SCOPE-AUDIT.md` `ad24a0fe…5cbb`, 6,628 bytes. This matches `SOURCE-DIGESTS.json`
  and my recomputation.
- `control/CLAIM-IDENTITY.run-local.json` `97abd89e…5082`. This matches the Stage 3 manifest entry. I did not open the
  file.
- All 7 script digests (`f1lib.py`, `gen_tsb.py`, `gen_htp_bipartite.py`, `gen_trees.py`, `gen_adversarial.py`,
  `gen_literal_attacks.py`, `gen_reconcile.py`) match the return's table byte for byte.
- Report digests: see the replay results under `## Certification audit`.

Claim identity. F1 names all 9 registry keys it touches, with statuses that agree with `C1-STAGE1-GATE.md`. It registers
nothing. Its lexical and mathematical alias check of the candidate `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` is a reasonable
check by that route. I did not open the registry to re-run it. The three auxiliary keys keep their master names in the
return. F1 does not present any compiled internal entry (41–44) as a certificate.

## Independent re-derivation

**Instrument.** I wrote my own instrument from SEMANTIC-CONTRACT §1 (`crit_instr.py`, `crit_checks.py`, `crit_family.py`),
using only the standard library and exact integers. It shares no code with `f1lib` or the controller's tool.
- Independent-set counts use bitmask enumeration over the original carrier, with deletion done as avoidance.
- `Δ_k(G − D) = i_{k+1} − i_k`. The term is `Δ_{p−1}(G − {v,s}) − Δ_{p−1}(G − N[s])`.
- The selector is `Δ_p(G − v) < 0`. `q_j` comes straight from its definition (independent `j`-sets meeting `W`).
- Bipartiteness uses a BFS 2-colouring test.
- Trees are grown by leaf extension and deduplicated by an AHU centre-rooted canonical string ("canonical form: AHU at
  centre(s)"). Each tree is re-tested with BFS connectivity and, separately, a union-find acyclicity test.
- Forests past subset-enumeration range use an exact tree DP. That DP was checked against brute force on every count
  wherever both run.

**Fixed points reproduced before any table:**
- `K_2`: `α = 1`, both leaf terms `0` at `p = 1`, both leaves favorable, `S = 0`.
- `P_3`: `α = 2`, the term at `p = 2` is `−1`.
- Free-tree counts for orders 1–14 are 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159 (A000055).
- Labelled bipartite graph counts for orders 1–6 are 1, 2, 7, 41, 376, 5177.
- On every tree to order 14: `i_2 = C(n,2) − (n − 1)` and `Δ_0 = n − 1`, with 0 failures.
- Stars: see the erratum under `## Attacks and findings`, item A5.

**Own-instrument results** (`crit_report_b6_t14.json`, report digest `8dc8e9eb…dc44`):

| Check | Horizon | Instances | Failures | Agreement with F1 |
|---|---|---|---|---|
| (TSB), every `W`, every `1 ≤ k ≤ a` | labelled bipartite, orders ≤ 6 | 1,235,654 `(H,W,k)` | 0 | equals F1's cumulative count at `n = 6` (replay log) |
| (TSB) companion `k > a` (`q_k = 0` and LHS `= 0` for every `a < k ≤ n`, every `W`) | same | all | 0 | F1 checks only `q_{a+1} = 0` exhaustively |
| `W = ∅` gives `q ≡ 0` | same | all | 0 | yes |
| Identity `q_j(H,W) = i_j(H) − i_j(H − W)`, both sides computed independently | same, every `(H,W)`, all `j` | all | 0 | see audit: F1's identity run was not shipped |
| (HTP) and (HTA), every leaf, every guarded `p ≥ 1` | labelled bipartite, orders ≤ 6 | 59,530 | 0 / 0 | equals F1's count at `n = 6` |
| `p = 1` guarded instances | same | exactly 2 (both leaves of `K_2`) | term 0 | yes |
| (ELIG), (TRN): cumulative eligible counts | trees, orders ≤ 14 | 4,123 / 5,303 | 0 / 0 | equal at every order to F1's replay log; 361 / 846 at order 12 (contract prior) |
| (TRN) eligible with `α ≤ 3` | trees ≤ 14 | 0 | — | yes |
| (HTP) and (HTA) on trees | trees ≤ 14 | 324,838 leaf/`p` | 0 / 0 | — |
| Smallest order with a positive term at `3p = 2α` | bipartite: 5 (`P_3 ⊔ K_2`, `v` a leaf of the `P_3`, `p = 2`, term `+1`); trees: 6 | — | — | bipartite minimum 5 is now established by an instrument; F1 only cited it from the prior |
| Smallest order with a positive term at `3p = 2α − 1` | trees: 3 (`P_3`, `p = 1`, term `+1`) | — | — | yes |

**The two minimal tree witnesses, checked by hand:**
- `P_6` with `v = 0`, `s = 1`: `H_v = P_4` has `i_1 = 4`, `i_2 = 3`, so `Δ_1 = −1`. `R_v = P_6 − {0,1,2} = P_3` has
  `i_1 = 3`, `i_2 = 1`, so `Δ_1 = −2`. The term is `−1 − (−2) = +1` at `α = 3`, `p = 2`, `3p = 2α`. Confirmed.
- `P_3` at `p = 1`: the term is `deg(s) − 1 = +1` (see item A3). Confirmed.

**Smallest eligible (TRN) tree rows.** These replay. One caveat: "the smallest eligible tree" at `α = 5` is not unique.
Order 7 has three eligible classes, with `S = −16, −14, −12`. F1's `S = −14` is the class its generator met first
(`[2,5,10,116,8,8,8]`). I recomputed that class independently and got `S = −14`, with favorable leaves `{0,4,5,6}` and
terms `[−2, −4, −4, −4]`.

## Attacks and findings

**A1 (critic-derived advance, proved_informal): the guard is sharp on trees at every `α ≥ 2`.** This settles the question
F1 left open at `α ≥ 9`.

Define the tree `T_m` (`m ≥ 0`, order `2m + 4`): a path `v – s – w – c`, plus `m` pendant edges `a_i – b_i` with each `a_i`
adjacent to `c`.

1. **Structure.** `T_m` is a tree: it is connected and has `2m + 3` edges. `v` is an original leaf with support `s`, and
   `W_v = N(s) ∖ {v} = {w}`.
2. **`α(T_m) = m + 2`.** The perfect matching `{vs, wc, a_i b_i}` gives `≤`. The independent set `{v, w, b_1, …, b_m}`
   gives `≥`.
3. **`α(H_v) = m + 1`.** Here `H_v = T_m − {v, s}`. The same argument applies to its matching `{wc, a_i b_i}` and its
   independent set `{w, b_i}`.
4. **`q_j`.** A tagged set of `H_v` must contain `w`. Its other vertices form an independent set of
   `H_v − N[w] = m K_2`. So `q_j = C(m, j−1)·2^{j−1}` for `j ≥ 1`, and `q_0 = 0`.
5. **The term.** `R_v = T_m − {v, s, w} = H_v − w`, so the term is `q_p − q_{p−1}` (the `tagged_count_split` identity).
   - At `p = 1` the term is `1`.
   - For `p ≥ 2` the term is `2^{p−2}·(2C(m, p−1) − C(m, p−2))`. For `2 ≤ p ≤ m + 1` this has the sign of
     `2(m − p + 2) − (p − 1)`, so it is `> 0` exactly when `3p < 2m + 5 = 2α + 1`.
6. **The sign pattern.** The term is positive for every `1 ≤ p ≤ ⌊2α/3⌋`. For `α ≥ 3` this range lies inside
   `p ≤ α − 1 = m + 1`. The term is `≤ 0` for every `p` with `3p ≥ 2α + 1`.
7. **Conclusion.** `T_m` has a positive term at `p = ⌊2α/3⌋ = p_guard(α) − 1` for every `α = m + 2 ≥ 2`. `T_0 = P_4`
   gives `α = 2`, `p = 1`. `T_1 = P_6` is exactly F1's minimal witness.

So on trees the largest `p` with a positive leaf term is exactly `⌊2α/3⌋` for every `α ≥ 2`. This uses (HTP) for the upper
side, and the pointwise gap is exactly 1 at every `α`. F1's widening gap at `α ≥ 9` is fully explained by its horizon: `T_m`
has order `2α`, which is 18 or more for `α ≥ 9`, above F1's cap of 16. F1's reading ("horizon effect") was right, and it is
now proved.

Instrument check (`crit_family.py`, report digest `d88766fb…bb9a`):
- For every `m ≤ 60` (orders 4–124), the exact DP confirms `α`, `α(H_v)`, the closed forms of `q_j` and the term, positivity
  on `1..⌊2α/3⌋`, and non-positivity under the guard.
- For `m ≤ 7` (order ≤ 18) every count is also confirmed by brute-force subset enumeration.

Fence note: this is a statement about the precision of the pointwise guard at the boundary rank. I did not evaluate the
selector or the aggregate below the guard, so nothing here touches the fenced lower region (fence §3.3).

**A2 (critic-derived, proved_informal): (TSB) is tight.** Its constant `2(a − k)` cannot be improved for any `a ≥ 1` or
any `1 ≤ k ≤ a`, even on trees.

On `H = H_v(T_{a−1})` with `W = {w}`, `a = α(H) = m + 1`:
`k·q_{k+1} = k·C(m,k)·2^k = (m − k + 1)·C(m, k−1)·2^k = 2(a − k)·q_k`. This is equality at every `1 ≤ k ≤ a`, confirmed in
`crit_family.py` for every `m ≤ 60`.

The consequence: the guard `3p ≥ 2α + 1` that (TSB) yields through `α(H_v) ≤ α − 1` is sharp because (TSB) is sharp. The
two facts are one fact. Separately, my labelled census records 5,235 tight `(H,W,k)` equalities with positive sides at
orders ≤ 6.

**A3 (critic-derived, proved_informal): the `p = 1` endpoint needs no bipartiteness.**
1. For any finite simple graph with a leaf `v`, at `p = 1`: `Δ_0(G − D) = (n − |D|) − 1`. So the term is
   `(n − 3) − (n − deg(s) − 2) = deg(s) − 1`. My instrument confirms this on all 32,110 leaf instances of all 33,867
   labelled graphs of orders ≤ 6.
2. Under the guard, `α ≤ 1`. A graph with `α = 1` is complete. A complete graph with a vertex of degree 1 is `K_2`. So
   `deg(s) = 1` and the term is `0`.

Confirmed: across all labelled graphs of orders ≤ 6, exactly 2 guarded `p = 1` leaf instances exist, both in `K_2`.
- `K_2 ⊔ K_1` has `α = 2` and is excluded, as the brief expects.
- `IsBipartite` is sufficient but not needed. The contract's colour-class argument is correct, but "complete + leaf ⇒ `K_2`"
  is the weaker-hypothesis route.
- F1 confirmed only the count (2 instances to order 8, replayed). It did not give this argument.

Separate point: a degree-1 support. `N[s] = {v, s}` holds exactly when `deg(s) = 1`. Then `R G v = H G v` as deletion sets,
so the term is `0` at every `p`. In a connected graph this forces `G = K_2`; in general it means a `K_2` component. F1's item
1 is correct. Consistently with this, at `p = 1` the formula `deg(s) − 1` gives `0` there.

**A4 (critic-derived, attributed): `α(H_v) = α(G) − 1` for every leaf of every finite simple graph.** This decides F1's
attack 3, which stood at 0 strict cases out of 25.
- `≤` is `leaf_indep_cap`: `v` extends any independent set of `G − {v, s}`.
- `≥`: take a maximum independent set `I` of `G`.
  - If `v ∈ I`, then `s ∉ I`, and `I ∖ {v}` lies in `G − {v, s}` with size `α − 1`.
  - If `v ∉ I` and `s ∈ I`, then `(I ∖ {s}) ∪ {v}` is independent (the only neighbour of `v` is `s`), so the previous case
    applies.
  - If `v, s ∉ I`, then `I ∪ {v}` is independent, contradicting maximality.
- No bipartiteness and no connectivity are used. The empty-set case is included: `K_2` gives `α(H_v) = 0 = α − 1`.
- Exhaustive check: 0 strict cases among 32,110 leaf instances (all graphs, orders ≤ 6) and 12,198 (bipartite, orders
  ≤ 6). For the `T_m` family, `α(H_v) = α − 1` for every `m ≤ 60`.

This is a Tier 3 companion candidate (SOLUTION-CONTRACT §1). It is stated at a review stage, so it needs an isolated second
read before registration (§4).

**A5: contract fixed-point erratum (stars at `p = 1`).**
- SEMANTIC-CONTRACT §2 and the critic common brief give the star leaf term as `C(m−1,p) − C(m−1,p−1)` ("`− 0`" for
  `R_v`).
- At `p = 1` that is wrong. `R_v` deletes all of `K_{1,m}`, and `Δ_0` of the empty graph is `0 − 1 = −1`, as the contract's
  own `K_2` fixed point says. So the true term is `m − 1`, not `m − 2`.
- My instrument: the formula is exact for `p ≥ 2` for every `m = 2..8`, and at `p = 1` the true term is `m − 1`.
- There is no in-scope consequence, because the guard never admits `p = 1` for `m ≥ 2`.
- F1 inherited the error. `gen_adversarial.check_star_formula` evaluates the formula only and never calls the instrument,
  despite its docstring. For `m = 2` (`P_3`) it therefore reports the sign crossover at `p = 1`. The true terms are `+1` at
  `p = 1` and `−1` at `p = 2`, so the crossover is `p = 2 = p_guard(2)`. This conflicts with F1's own tree census, which
  lists `P_3` at `p = 1` as a positive witness. The return's sentence "strictly below the guard floor … for every `m`
  tested" is false at `m = 2`.
- This is recorded for the controller as a contract erratum candidate (star fixed point, `p = 1`).

**A6: hypotheses and ℕ-subtraction, as F1 treats them.**
- The (ELIG)/(TRN) ℕ reading is correct. `x + 2 ≤ α − 2` in ℕ is false for `α < 2` and equals the integer hypothesis
  otherwise. My census applies the ℕ semantics literally.
- `p − 1` at `p = 1` is handled through the endpoint.
- The (TSB) `k ≤ a` remark is correct in ℤ: for `k > a`, `q_k = q_{k+1} = 0`, so both sides are `0`. I verified this for
  every `k ≤ n` exhaustively to order 6, while F1 checked only `q_{a+1} = 0` exhaustively.
- F1 does not locate where `IsBipartite` enters (TSB). It declines to, since it treats the mechanism as a black box. For a
  falsify route that is acceptable, but it is not a derivation. The return says so honestly.

**A7: mechanism-equivalence reasoning, which is partly wrong.**
- (TSB) vs `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`. F1 reads the refuted bound as "`r = a − k`-style". The refuted key
  says an independent `r`-set has at most `r` addable vertices, where `r` is the set's own size (`k` in (TSB)'s notation).
  So the relevant comparison is `2(a − k)` vs `k`. These are incomparable, equal only when `3k = 2a`. It is not "looser
  vs tighter". The correct distinction is that (TSB) is an aggregate double-count over tagged sets. Its per-set ingredient
  is `≤ 2(a − k)`, not `≤ k`, and the ingredient is attained where `≤ k` fails. On `H_v(T_m)`, the tagged 1-set `{w}` has
  exactly `2m = 2(a − 1)` addable vertices (all `a_i`, `b_i`), which exceeds `r = 1` for `m ≥ 1`. That is the exhibit the
  allocation (item 3e) asked for. It is ordinary-graph data. The refuted key's G1-tuple model was not opened here.
- (HTP) vs `E993-BETA-TARGET`. As the brief asks, consistency is a theorem, not a data check. Suppose (HTP) holds. Then
  every ordinary bipartite graph, leaf and rank with a positive term has `3p < 2α + 1`. So every such refutation witness
  of an unrestricted ordinary pointwise sign lies below the guard, with no need to fetch `T_22`/`T_60`. One caveat:
  `E993-BETA-TARGET` lives in the governed RTree model. The implication reaches its witnesses only through an
  ordinary-to-governed reading this run never attempts (fence §3.1). F1's cited arithmetic (`102 < 135`, `270 < 361`) is
  therefore redundant given (HTP), and unverified without it. F1 correctly labels it citation only.

**A8: circularity.** None. F1 proves nothing and uses no award as an ingredient.

## Mechanism-equivalence and fence check

- The return contains no no-recovery wording, re-proves no existing award, and makes no census/root-correction/Hall step.
  No compiled-internal entry is presented as an award (entries 41–44 are cited by number as "compiled internal,
  unawarded").
- The lower region is untouched. F1's per-`α` table records the largest positive-term `p` for each `α`. Those `p` sit below
  the guard, but the table is a record of the guard's precision, it contains no mechanism, and it is within Tier 2. My A1 is
  the same kind of record, at the boundary rank.
- (HTP) is not `E993-BETA-TARGET`: it is a proper rank restriction on ordinary bipartite graphs, and the governed model
  differs. (TSB) is not `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: it is an aggregate inequality with a different per-set
  bound (A7). F1 says why for both, but its (TSB) reason needs A7's correction.
- The boundary record's candidate registration text must be restated (see Verdict). "Sharp for `α = 2..8` on trees to
  order 16" is superseded by A1's "sharp at every `α ≥ 2`" (proved_informal, critic-derived, second read required).

## Certification audit

**Replays.** Copy-out-first: F1's scripts were copied into `scratchpad/c1-crit-F1-U/replay-run/` and run there. Every job
ran to completion, and each was confirmed finished by its literal PID.

| Report | Return's digest | Replay | Verdict |
|---|---|---|---|
| `tsb_report_n7.json` | `4f98c745…158a8` | `4f98c745…158a8` | reproduces. 56,649,670 triples, 0 failures; per-order graphs 1, 2, 7, 41, 376, 5177, 103237 |
| `htp_report_n8.json` | `03ecf220…a56` | `03ecf220…a56` | reproduces. 37,561,316 instances; 2,922,446 graphs at `n = 8`; `p = 1` count 2 |
| `literal_attacks_report.json` | `570bc793…d5a` | `570bc793…d5a` | reproduces |
| `trees_report_n16.json` | `ea2cba4b…6fb` | `ea2cba4b…6fb` | reproduces. 19,320 classes at `n = 16` (A000055); (ELIG) eligible 29,181, (TRN) eligible 32,364; 0 failures; per-`α` table identical |
| `adversarial_report.json` | `201d3ab8…9dd` | `daa148e6…05eb` | **does not reproduce.** The body hashes `elapsed_seconds` and per-family `seconds` (wall-clock floats). With those removed, the replayed body equals the shipped body exactly. The content is backed; the digest cannot be replayed. |
| `reconcile_report.json` | `d73eb45f…7b9` | not replayed (reads a non-capsule file) | unverified |

A mechanical note on replaying from files: `trees_report_n16.json` and `reconcile_report.json` cannot have their digests
re-checked from the file alone. Their integer-keyed dicts are hashed before JSON turns the keys into strings, and that
changes the sort order. Only a re-run reproduces those digests.

**Literals to strike or correct:**
1. "no floats, no wall-clock/PID/host fields hashed into any report body" (Replay section). This is **false** for
   `adversarial_report.json`. Strike it.
2. "Verified by inspection of every `import` line in the **five** generator files". There are six `gen_*.py` files plus
   `f1lib.py`. `random` is imported only inside `gen_adversarial.py`, with a fixed seed of 20260925. The import list itself
   is accurate. Correct "five" to "six".
3. Companion identity: "2,395,020 exact triples … reproduced by the `q_j` computation embedded in `gen_tsb.py`'s `q_table`
   plus a direct `i_j(H−W)` computation … `gen_tsb.py` already recomputes both sides". This is **false**. `gen_tsb.py`
   computes `q` only from its definition and never computes `i_j(H − W)`. The run was inline and was not shipped. The count
   is arithmetically consistent: `Σ_{n≤6} bip(n)·2^n·(n+1) = 2,395,020`. Strike the literal as unbacked by shipped evidence.
   The identity itself is now backed by my instrument, which found 0 mismatches on every `(H,W)` to order 6.
4. Star closed form: the return says "exact formula … every `p = 1..m+1`" and "strictly below the guard floor for every `m`
   tested". Both are wrong at `p = 1` and `m = 2` (A5). The docstring's "cross-checks the formula against the DP on a
   sample" is **unbacked**, because the function contains no DP call. Strike these. The zero guard failures remain true,
   because `p = 1` is never guarded for `m ≥ 2`.
5. "bipartite `P_3 ⊔ K_2` at order 5" as the general-bipartite minimum. F1 cited this from the prior. My instrument now
   establishes it (the minimum is order 5 among labelled bipartite graphs), so the literal may stand, attributed to this
   critique.
6. "Guard sharpness on trees, `α ≥ 9`: unresolved". This is superseded by A1.
7. "the smallest eligible-TRN tree by `α`". This should read "a smallest", because it is not unique at `α = 5` (see
   Independent re-derivation).

**Correct literals.** The counts 56,649,670, 37,561,316 and 2,922,446, "exactly 2 `p = 1` instances", the A000055 and
bipartite fixed points, "0 failures", and the families labelled `sampled` all check out. In the adversarial report,
`sampled_not_exhaustive_over_leaves` is true exactly where `leaves_sampled < num_leaves`. The (ELIG) and (TRN) eligible
counts are 29,181 and 32,364 at order 16 (see the trees replay); orders ≤ 14 are independently matched by my instrument.

**Disclosures (process).** Every number I checked comes from a job that ran to completion in my replay. The harness-stopped
first attempt of `gen_adversarial` left no trace in the shipped report. The replay content matches it modulo timing
fields, so the shipped report is from the completed fixed run.

## Verdict

F1's falsification evidence is retained. Its main numeric claims replay with matching digests (TSB order 7, HTP/HTA order 8,
literal attacks) and agree with my independent instrument on every overlapping horizon. No counterexample to (TSB),
(HTP), (HTA), (ELIG) or (TRN) exists within those horizons. F1's grades are all `bounded_computation`, and nothing claims
more.

The return is narrowed:
- strike literals 1, 3 and 4 above, and correct 2 and 7;
- correct the (TSB)-vs-addability-bound reasoning (A7);
- restate the boundary record. The candidate `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` should read: "On finite trees the
  pointwise guard `3p ≥ 2α + 1` is sharp at every `α ≥ 2`. The family `T_m` (order `2α`) has a positive original-leaf term
  at `p = ⌊2α/3⌋`. The smallest tree witness at `3p = 2α` is `P_6` (order 6, `α = 3`, term `+1`). At `3p = 2α − 1` it is
  `P_3` (order 3, `p = 1`, term `+1`). The smallest bipartite witness at `3p = 2α` is `P_3 ⊔ K_2` (order 5)." Grades: the
  minima are `bounded_computation` (exhaustive, two instruments); the every-`α` sharpness and the (TSB) tightness are
  `proved_informal`, critic-derived, and need an isolated second read.

My view of the mathematics: A1–A4 are complete informal proofs, graded `proved_informal`. None bears on the formal headline.

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Isolated second reads** (§4) of the critic-derived statements before any registration:
   - A1: `T_m` sharpness at every `α ≥ 2`;
   - A2: (TSB) equality at every `k`;
   - A3: the `p = 1` endpoint for every finite simple graph, and `term = deg(s) − 1`;
   - A4: `α(H_v) = α(G) − 1` for every leaf of every graph.
2. **Boundary record text.** Synthesis to adopt the restated registration text above, or narrow it. F1's "`α = 2..8`, open
   for `α ≥ 9`" is no longer the state.
3. **Contract erratum** for the controller: the star fixed point at `p = 1` (term `m − 1`), in SEMANTIC-CONTRACT §2 and the
   critic common brief.
4. **Digest hygiene.** `adversarial_report.json` should be re-emitted without wall-clock fields if its digest is to count as
   replayable. `reconcile_report.json` remains unverified by this critic.
5. **Nothing in F1 advances formal verification.** All four targets still need their own Stage 7 awards. The internal
   entries 41–44 remain context.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-crit-F1-U/`:

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `97d9d2b767a6a20a6a221cbcd45358170c9cd34afab4a1da50605978cd2b5577` | seal and digest recomputation |
| `crit_instr.py` | `b02c676ec1370a91c4430173a65d7059739ee53eba70f918e2303cbf335958f0` | own instrument (counts, term, selector, 2-colouring, tree tests, AHU canonical form) |
| `crit_checks.py` | `01db5d4c64f3cce6a1fffffc1c2efd7243ad03274f0a05d3340ebbde8fd5db31` | exhaustive checks: `python3 crit_checks.py 6 14 crit_report_b6_t14.json` |
| `crit_report_b6_t14.json` | file `9ddd132e710141ea3a9c64955be7e21512ce1dfe29a4f42b20e469e3ebab8c1c`; inner digest `8dc8e9eb5024632b69803a0d538177f80c9ce9ca7b5b617305498283e758dc44` | own census report |
| `crit_family.py` | `096dcac4101a889afe36082f14491205d418918f29ab6404af2fa1af368caff3` | `T_m` boundary family and (TSB) tightness: `python3 crit_family.py crit_family_report.json` |
| `crit_family_report.json` | file `5b4ee3b80dd39e0b6e30389e2803ef7c89722e1e4f1fbba33aca2230a1fddc2e`; inner digest `d88766fbf6cb306117902b3c08ac6e9df0973a65466d36cbf405bbf0a4cdbb9a` | family report (`m = 0..60`, `all_ok: true`) |
| `crit_report_b6_t12.json`, `test.json` | — | earlier smaller runs (superseded) |
| `replay/` | the 13 F1 files as copied (script digests match the return) | copy-out source |
| `replay-run/` | F1 scripts plus replayed reports and logs (`tsb`, `htp`, `trees`, `adv`, `lit`), and `*.pid` files | replays |

No background job remains. PIDs 90451–90455 were each confirmed exited by literal PID before this write.
