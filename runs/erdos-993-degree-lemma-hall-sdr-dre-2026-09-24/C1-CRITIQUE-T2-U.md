# Critique

Critic `C-T2-U` (orientation U, formal / structural), Cycle 1 Stage 4 of r28, on the return of seat `T2`
(route `C1-T-02 DOMINANCE-NEAREST-BRANCH-ASSIGNMENT-PROOF`, orientation T).

**Boot.** Operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read in full (verity.md's display was truncated
mid-read, so I re-read the missing middle section; startup-protocol was read in two parts). No other VerityOS
file outside the run root was read. The host harness put the repository `CLAUDE.md` and the user
auto-memory index into my context without my asking. I did not act on either, and neither enters any step below.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

**Read-boundary disclosure (critic's own).**
(i) To check the Stage 2, Stage 3 and Stage 4 manifests, `seals.py` hashed the bytes of every file each manifest
lists. That includes the other five seats' `RETURN.md` files and dispatches named in the Stage 3 manifest, plus
`control/CLAIM-STATUS-LINT-c1-stage3.json` and `control/PATH-CHECK-c1-stage4-dispatch.json` from the Stage 4
manifest. The bytes were hashed only. Nothing was printed, displayed or used, and only digest matches were reported.
(ii) `ls -la` of `scratchpad/c1-T2/` and of my own scratch showed each parent's `..` line: link count only, no
sibling names.
(iii) One `grep` over `sources/r27/second-reads/SR-JOIN.md` and one lexical search over
`sources/authority/CLAIM-IDENTITY.json`. Both files are under `sources/`, which is authorized.
There was no other search, no network, no install and no background job. `jobs` was empty at close.

## Identity and seal audit

Seals were recomputed canonically: SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True,
separators=(",",":"))`, with no trailing newline (`scratchpad/c1-crit-T2-U/seals.py`).

| Manifest | Recorded seal | Recomputed | Members (bytes + SHA-256) |
|---|---|---|---|
| Capsule `control/c1-critic-capsules/T2-PACKET-MANIFEST.json` | `06759f9179652c4c97a693f03198ff12b6ac902ee9b08ed487917a5ef320c7f0` | identical | 14/14 match |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `7ead45432169e189c210cd2f81486dfb9f6fbd9b46af0c1c81eb902e8a76812e` | identical | 13/13 match |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5` | identical | 24/24 match |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b` | identical | 83/83 match |
| `control/SOURCE-DIGESTS.json` entries | — | — | 62/62 match |

- The capsule seal is `06759f9179652c4c97a693f03198ff12b6ac902ee9b08ed487917a5ef320c7f0`, verified.
- The assigned return `cycles/cycle-1/stage3/returns/T2/RETURN.md` is 48,311 B, SHA-256 `660e2e45…05167addf`. That
  matches both the capsule and the Stage 3 manifest.
- Every digest the return lists is backed. Its Stage 2 seal equals mine. Each "additional digest" is a Stage 2
  member or a `SOURCE-DIGESTS.json` entry, and all of those match. The generator `scratchpad/c1-T2/hs_sdr_check.py`
  is 23,403 B, SHA-256 `19bdb1fd…6192a`, and matches the return exactly.
- The return's `## Read-boundary disclosure` is recorded in `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`: one
  `ls experiments/`, one `skills/optimization-loop/skill.md` read, and one `ps -u` listing. I checked what depends
  on these, and nothing does. Every number in the return reproduces from the digested generator (replay below) and
  from my independent instrument. The `ps` listing showed only a sibling's command line, and no claim uses it.
- The citation of `SR-JOIN` JN-1 for Lemma DM is accurate: `sources/r27/second-reads/SR-JOIN.md` line 185 states
  `S∖N_S[r] ⊆ S∖{r}` in the "nonnegative convolution" paragraph.

## Independent re-derivation

**Replay, copy-out-first.** `hs_sdr_check.py` was copied to `scratchpad/c1-crit-T2-U/replay/` and run as
`python3 hs_sdr_check.py 15`, which took 19.2 s in the foreground. The report digest is
`91694350e5ddfcfe2a374cab4af5c8bde9ea83387bca9ffe6c39a986162f1a27`, and `cmp` against the seat's
`hs_sdr_report.json` shows the files are byte-identical. The one-shot leaf/support check was replayed the same way and
printed `1434843 0`.

**My own instrument** (`scratchpad/c1-crit-T2-U/own/crit_instr.py`, standard library only). It shares no code with
T2's generator.
- **Free trees** are built by *centroid decomposition*. A unicentroidal tree is a rooted tree whose root branches all
  have fewer than `n/2` vertices. A bicentroidal tree is an unordered pair of rooted `n/2`-trees joined at their roots.
  Rooted trees are generated as canonical sorted nested tuples. There is no leaf extension and no AHU deduplication.
  The counts match A000055 at orders 1–16 (`…, 7741, 19320`). Every tree passes a union-find
  connectivity-and-acyclicity test.
- **`c_v(k)`** is computed by a *rooted DP at `v`*: the "v-included" polynomial `x·Π_children without(child)`. This
  is not `i_{k−1}(T−N[v])`. On every tree of order ≤ 11 it agrees with a brute-force bitmask enumeration.
- **Fixed points** are asserted: `c(0)=0`, `c(1)=1`, `Σ_v c_v(k)=k·i_k`, stars `K_{1,m}` (`m=3..8`), and the spider
  `S(2,1,1)` at `k=3`, where `c=(0,1,2,2,1)`.
- **Checks:** the threshold form at every `t` from 1 up to one more than the maximum `c`, and the matching form with
  my own BFS augmenting-path matcher (not Kuhn's DFS).

**Results.** The order-16 run is `crit_report_16.json`, SHA-256 `28b92790…fb292401`, and it reproduces identically
on rerun.

| Horizon | Trees | `(T,k)` instances (`Br≠∅`, `1≤k≤α`) | Threshold failures | Matching failures | Threshold≠matching |
|---|---|---|---|---|---|
| order ≤ 15 | 13,187 | 117,393 | 0 | 0 | 0 |
| order ≤ 16 | 32,507 | 309,532 | 0 | 0 | 0 |

T2's 13,187 trees and 117,393 instances are reproduced exactly, under the same counting convention, by an
independent generator and an independent `c` routine. Order 16 is my own extension of the horizon.

**Hubs (Parts 3–4).** Both hubs were recomputed with my own instrument (`own/hubs.py`, output `own/hubs.txt`).
- At every vertex and every `k`, my `c_v(k)` and `i_k` agree with T2's report tables.
- (HS) holds in both threshold and matching form at every `k ≤ α`: 7 values for H10 and 15 for H22.
- I checked every sort-and-pair assignment T2 exhibits against my own `c` values: 7 rows for H10 and 15 rows for H22.
  In each row the leaves are distinct, every slot of every branch vertex appears the right number of times, the paired
  vertex is a leaf, `τ` and `μ` equal my `c` values, and `μ ≥ τ`. There are 0 defects.
- Vertex 0's slot in H10 is paired with leaf 4, one of B1's leaves, at every `k`. That confirms T2's "borrowed from
  B1's pair" claim.

**Part 2 (sort-and-pair), checked line by line.**
- *Direction 1* is correct. It uses only that `φ` is an injective function with `c_{φ(x)} ≥ τ(x)`.
- *Direction 2* is correct.
  - What gets sorted is the slot multiset: each branch vertex `deg v − 2` times.
  - Ties are harmless. The argument needs only that the first `i` sorted slots all have `τ ≥ τ(x_i)`, which holds
    under any tie-break.
  - (HS) is used only at `t = τ(x_i) ≥ 1`.
  - The injection additionally needs `m ≤ |L|`, so that the `i`-th leaf exists for slots with `τ = 0`. T2 gets this from
    the tree identity `m = |L| − 2`, which uses `IsTree` and `n ≥ 2` through the registered r27 reformulation. That
    hypothesis enters at this step, but T2's Part 2 does not name it there. An alternative source is (HS) at `t = 0`,
    which `SOLUTION-CONTRACT.md` §2's `∀ t : ℕ` quantification supplies.
- *Brief question: is checking only `t ∈ {c_v(k) : v ∈ Br, c_v(k) ≥ 1}` equivalent to checking all `t ≥ 1`?* Yes, for
  trees. I proved it independently. `slots_{≥t}` is constant on each interval `(τ_{(j+1)}, τ_{(j)}]` between
  consecutive distinct slot values, and it is 0 above the maximum. `leaves_{≥t}` is nonincreasing. So for `t` in such
  an interval, `slots_{≥t} = slots_{≥τ_{(j)}} ≤ leaves_{≥τ_{(j)}} ≤ leaves_{≥t}`.
  - For a *general* slot/leaf system this finite family is **not** sufficient on its own. The count condition `m ≤ |L|`
    (the `t = 0` instance) must be added. On trees it is automatic.
- Grade: `E993-R28-SDR-THRESHOLD-EQUIVALENCE` stays **`proved_informal`**. It is a correct, elementary proof, with the
  hypothesis attribution above added.

## Attacks and findings

**Finding 1 (critic-derived advance, closes T2's open step): the pendant-path chain is TRUE (Lemma PP).** T2's
Step 4′ gap is closed, and the brief's "distance-≥2 extension" is settled.

*Lemma PP.* Let `G` be any finite simple graph containing a path `u_0 – u_1 – … – u_m = ℓ` with `m ≥ 1`,
`deg u_m = 1` and `deg u_i = 2` for `1 ≤ i ≤ m−1`. The degree of `u_0` is arbitrary. Then for every `k` and every
`0 ≤ i ≤ m−1`, `c_{u_i}(k) ≤ c_ℓ(k)`.

*Proof.*
- Write `R := G − {u_1,…,u_m}`. Only the edge `u_0u_1` joins `R` to the path, and the degree conditions alone force
  this, so neither acyclicity nor connectivity is used.
- `G − N[ℓ] = G − {u_{m−1},u_m}` is `R` with the path `u_1…u_{m−2}` hanging at `u_0`.
- **Case `1 ≤ i ≤ m−1`.** `G − N[u_i] = G − {u_{i−1},u_i,u_{i+1}}` is `(R` with `u_1…u_{i−2}` hanging at `u_0)` plus
  a separate path on `m−i−1` vertices. For `i = 1` the first part is `R − u_0`. This is isomorphic to the induced
  subgraph `(G − N[ℓ]) − u_{i−1}`, since deleting `u_{i−1}` splits the hanging path into the same two pieces. An
  isomorphism preserves `i_j`, and Lemma DM (induced-subgraph monotonicity) gives
  `c_{u_i}(k) = i_{k−1}(G−N[u_i]) ≤ i_{k−1}(G−N[ℓ]) = c_ℓ(k)`.
- **Case `i = 0` with `m ≥ 2`.** Let `A := R − N_R[u_0]` and `B := R − u_0`, so `A` is an induced subgraph of `B`.
  Let `P_j` denote the path on `j` vertices, with `I(P_0) = I(P_{−1}) = 1`, so that
  `I(P_j) = I(P_{j−1}) + x·I(P_{j−2})` for `j ≥ 1`.
  - `I(G−N[u_0]) = I(A)·I(P_{m−1})`.
  - Expanding on `u_0`: `I(G−N[ℓ]) = I(B)·I(P_{m−2}) + x·I(A)·I(P_{m−3})`.
  - Subtracting, `I(G−N[ℓ]) − I(G−N[u_0]) = (I(B) − I(A))·I(P_{m−2})`. Every coefficient of this is ≥ 0, by Lemma DM
    and because path polynomials have nonnegative coefficients. Taking the coefficient of `x^{k−1}` gives
    `c_{u_0}(k) ≤ c_ℓ(k)`.
  - `m = 1` is T2's Lemma LS. ∎

*Checks.* On every free tree of order ≤ 16 and every `k ≤ n`, I tested every vertex on every pendant path, including
the terminal vertex of degree ≥ 3: 5,645,355 checks with 0 failures (`crit_report_16.json`, `pp_checked`). A
random-graph test covered 4,000 graphs of order ≤ 15 with a pendant path of length 1–4, compared against brute-force
counts: 283,908 checks with 0 failures (`own/pp_graphs.txt`). That supports the claim that no tree hypothesis is used.

*The brief's non-nesting question.* T2's literal claim is correct, and here is a concrete example: `v – u_1 – u_2 – ℓ`
hanging from a branch vertex `v`. `T − N[u_1]` contains `ℓ` but not `v`, while `T − N[ℓ]` contains `v` and `u_1` but
not `ℓ`, so neither set contains the other. The obstruction is only to the *identity* embedding. The re-embedding
`u_1 ↔ ℓ` (delete `u_0` from `T − N[ℓ]`) is an isomorphism onto an induced subgraph. T2's conclusion that "Lemma DM
does not extend past distance 1" is therefore **struck**.

**Finding 2 (critic-derived advance): (HS) is proved for every tree whose branch tree has maximum degree ≤ 2.**
- *Branch tree.* The branch tree `B(T)` has vertex set `Br`. Each internal direction from `v` leads, through
  degree-2 vertices, to exactly one branch vertex, and that pair forms an edge of `B(T)`. `B(T)` is a tree.
- *Count identity.* Write `b(v) := deg_{B}(v)`, so `p(v) = deg v − b(v)` and `p(v) − (deg v − 2) = 2 − b(v)`.
  Summing over `Br` gives `Σ(p(v) − slots(v)) = 2|Br| − 2(|Br|−1) = 2`. For any branch subtree `D` hanging off `v`,
  `Σ_{w∈D}(2 − b(w)) = 1`.
- *Theorem BTP.* Suppose `T` is a finite tree with `b(v) ≤ 2` for every `v ∈ Br`; equivalently no branch vertex is
  count-deficient. Then (HS) and (HS-SDR) hold at every `k` and every `t`.
- *Proof.* Each `v` assigns its `deg v − 2` slots to distinct leaves among its own `p(v) ≥ deg v − 2` pendant leaves.
  Distinct branch vertices have disjoint pendant-leaf sets, because each leaf's pendant path ends at a unique vertex,
  so the map is injective. Lemma PP gives `c_ℓ(k) ≥ c_v(k)` on every pair. T2's Direction 1 then turns this into (HS). ∎
- The class includes every caterpillar and every spider. To order 16 it covers 27,737 of the 32,492 trees with
  `Br ≠ ∅`. The census confirms 0 local-assignment failures on all of them (`local_valid_fail = 0`).
- *Corollaries.*
  - Theorem ES in its unrestricted form (every extremal branch vertex is self-sufficient, whatever its pendant path
    lengths) is proved. T2's narrow "all pendant directions of length 1" form is superseded.
  - The naive local assignment fails **exactly** when some branch vertex has `b(v) ≥ 3`. T2 asserted "exactly" before
    it had the c-validity to back it; Lemma PP now supplies it.

**Finding 3 (critic proof): order 10 is minimal *and unique*.** A count-deficient `v` needs `b(v) ≥ 3`. Each of the
three internal directions contains a branch vertex `w` with at least `deg w − 1 ≥ 2` further, pairwise disjoint,
nonempty directions. So `n ≥ 1 + 3·3 = 10`. Equality forces `deg v = 3` and each neighbour to be a degree-3 branch
vertex carrying two leaves. That is exactly T2's H10. The census agrees: count-deficient trees by order are
`10:1, 11:4, 12:19, 13:77, 14:287, 15:1002, 16:3365`. T2's minimality claim is upgraded from `bounded_computation` to
`proved_informal`, with uniqueness added. *Brief: same object as T1's starved hub?* I cannot read T1 within my grant.
By the uniqueness proof, any order-10 tree with a branch vertex that has no pendant direction is H10 up to isomorphism.
The adjudicator should confirm the match.

**Finding 4 (critic-derived conjecture, sharper than (HS)): the Rooted Export Conjecture (REC).**
- *Statement.* For every tree `T`, every `k` and every root `r ∈ Br`, there is a slot→leaf injection with
  `c_ℓ ≥ c_v` in which every slot of `v` uses a leaf on `v`'s side away from `r`.
- *Why it is induction-ready.* By the subtree identity (net surplus exactly 1), each hanging branch subtree then
  exports exactly one leaf to its parent. REC is equivalent to the success of a bottom-up greedy: each non-root `v`
  keeps `deg v − 2` of its `deg v − 1` available leaves (its own pendant leaves plus one export per branch child) and
  exports the largest-`c` leaf it can spare. The exchange argument: a larger export never hurts an ancestor.
- *Evidence.* REC implies (HS-SDR), and it holds for BTP trees by Finding 2. On **every** count-deficient `(T,k)` to
  order 16 (46,977 instances), it holds for **every** root: by matching, `down_all_roots_ok = 46,977`, and by the
  greedy over 210,932 root-instances with 0 failures (`own/greedy16.txt`). Grade `conjecture`, supported by a
  `bounded_computation` to order 16.
- *The naive per-direction strengthening is false.* "Every internal direction from `v` contains a leaf with
  `c ≥ c_v`" fails in 349 `(T, k, v, direction)` cases to order 16. The first is at order 12: edges
  `0-1,0-4,0-7,1-2,1-3,4-5,4-6,7-8,8-9,7-10,10-11`, `k=6`, `v=0`, direction `7`, `c_0 = 20 > 18`, where 18 is the
  best leaf in that direction. REC survives because a parent may absorb one bad import.

**Finding 5 (census observation, F1's domain, recorded as a prior).** On all 309,532 instances to order 16, whenever
`slots_{≥t} > 0` the slack `leaves_{≥t} − slots_{≥t}` is at least 1. So (HS) is never tight there. Slack 1 first
occurs at order 14 (`t = 13`, `k = 7`) and occurs 19 times in total to order 16. The dominant minimum slack is 2
(`min_slack_hist`).

**Finding 6 (overstatements).**
- (a) Part 2 and Part 5 claim "three mutually independent implementations". The three checks share `all_occ` /
  `forest_poly` and the generator, so they are one `c`-computation checked three ways. Also, sort-and-pair agrees with
  the threshold form *by theorem*, so that agreement tests the code and not (HS). Narrowed to "three checks on one
  shared `c_v(k)` routine". My instrument supplies the genuinely independent confirmation.
- (b) Part 1 Step 4′ and the Part 2 corollary say "no per-edge or per-pendant-direction rule can work". The
  per-pendant-direction rule works on the whole BTP class (Finding 2). Struck.
- (c) Part 3 says H10 has "`α(T)=6`". In fact `α(H10) = 7`: `{0,4,…,9}` is independent, since the hub is not adjacent
  to any leaf. T2's own report has a `k=7` row. Struck and corrected to 7.
- (d) Part 5 says "roughly 9× the instance count". This compares `C-T2-U`'s order-12 figure, 12,977, taken under a
  different convention, with T2's convention. Under T2's own convention the order-12 figure is 6,884 (my count), so the
  comparison is not like-for-like. Struck as a ratio.
- The fence items are clean: no (PW) premise, and (DL) is not re-proved (see below).

## Mechanism-equivalence and fence check

- T2's route is an explicit assignment plus the sort-and-pair equivalence. The route does not compare a branch vertex
  pointwise with an arbitrary leaf. Lemma LS and Lemma PP compare a vertex only with the leaf at the end of *its own*
  pendant path, which is not (PW). (PW) is never used as a premise.
- (DL) appears only as a cited input, `E993-R27-FOREST-DEGREE-LEMMA`, and is never a target. There is no no-recovery
  wording and no status transfer to fenced keys. The Codex target is not mentioned. No census receives a formal grade.
  T2 grades its census `bounded_computation`, which is correct.
- Every local lemma used is either proved or named as open.
  - T2's open node, the pendant-path chain, is now closed by Lemma PP.
  - The one remaining open node is (HS) on trees with some `b(v) ≥ 3`. Its critic-sharpened form is REC. The smallest
    case not covered by any census is order 17. The smallest *open-as-theorem* case is H10: numerically verified at all
    `k`, with no proof.
- Alias check, lexical, over `sources/authority/CLAIM-IDENTITY.json` (392 claims): "pendant path", "branch tree",
  "leaf/slot", "slot dominance" and "R28" have zero hits. The nearest hits are "caterpillar" →
  `E993-PAIR-CATERPILLAR-TRANSFER` (an independence-polynomial transfer recursion) and "export" → r23 tag/Hall keys (a
  residual-class retag apparatus). Both are mathematically distinct: neither involves `c_v(k)`, leaves against branch
  slots, or a tree-wide injection.
- Critic candidates are listed below. Each is STATED at a review stage and needs an isolated second read before
  registration.
  - `E993-R28-PENDANT-PATH-LEAF-DOMINANCE` (Lemma PP, general finite graphs): `proved_informal`.
  - `E993-R28-HS-BRANCH-TREE-MAX-DEGREE-2` (Theorem BTP): `proved_informal`. Its inputs are Lemma PP and the r27
    reformulation's slot count, the latter only through Direction 1, which does not need it.
  - `E993-R28-ROOTED-EXPORT-CONJECTURE` (REC): `conjecture`, with census to order 16 at `bounded_computation`.
- T2's candidate 2 (`…EXTREMAL-BRANCH-VERTEX-LENGTH1-SELF-SUFFICIENT`) is a strict special case of Theorem BTP's
  corollary. I recommend folding it in rather than registering it separately. T2's candidate 3 should be re-graded
  `proved_informal` (Finding 3).

## Certification audit

| Literal | Status |
|---|---|
| Stage 2 seal `2eff91ef…` | backed (recomputed) |
| Generator 23,403 B / `19bdb1fd…`, report digest `91694350…`, replay byte-identical, ~19.5 s | backed (replayed; 19.2 s) |
| 13,187 trees; 117,393 instances; zero threshold/matching/sort-pair failures and mismatches | backed (replay plus independent instrument) |
| A000055 counts to order 15; "all 94 free trees of orders 2–9" | backed (1+1+2+3+6+11+23+47 = 94) |
| 1,434,843 leaf/support instances, 0 failures | backed (replayed); subsumed by my 5,645,355 Lemma PP checks |
| "three mutually independent implementations" | **struck**: one shared `c` routine (Finding 6a) |
| H10 "`α(T)=6`" | **struck**: `α = 7` (Finding 6c) |
| H22: 10 branch vertices, 10 slots, 12 leaves, `p = 0` at 0–3, `α = 15`, 10/10 matched at every `k` | backed (recomputed) |
| "order 10 exact minimal" | backed, and upgraded to proved with uniqueness (Finding 3) |
| "no per-edge or per-pendant-direction rule can work"; "Lemma DM does not extend past distance 1" | **struck** (Findings 1–2) |
| "roughly 9× the instance count" | **struck** as a mixed-convention ratio (Finding 6d) |
| "order 16 ≈ a minute" (an estimate) | an estimate, not a certification. My order-16 run with extra checks took 54 s |
| Sort-and-pair proof "complete, both directions" | backed, but the `m ≤ |L|` input (tree identity or `t = 0`) must be named at Direction 2 |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

T2's core deliverable is sound: the Hall-free sort-and-pair proof of `E993-R28-SDR-THRESHOLD-EQUIVALENCE`
(`proved_informal`), a census reproduced exactly by an independent instrument, and correct hub computations. The
narrowing covers the struck literals (Finding 6), T2's own open gap (closed here, which reverses its "no local rule"
reading), and the minimality grade (upgraded). On the critic side, Lemma PP and Theorem BTP are `proved_informal`
statements whose mathematics I believe is complete, and they settle (HS) for every tree whose branch tree is a path.
(HS) itself remains OPEN, confined to trees where some branch vertex has `b(v) ≥ 3`.

## Remaining obligation

1. **(HS) on trees with a branch vertex of branch-tree degree `b(v) ≥ 3`.** This is the only open part. The smallest
   instance is H10 (order 10, unique), which is verified numerically at every `k` but not proved. A successor should
   prove REC: for a fixed root `r`, show by induction on the branch tree that the greedy export from each hanging
   subtree `D` (net surplus exactly 1) is never "bad" at two children of the same non-root vertex, and never at three
   children of the root. The per-direction version is false (Finding 4 witness, order 12), so the invariant has to
   allow one bad import per vertex.
2. **Second reads** for the critic-stated `E993-R28-PENDANT-PATH-LEAF-DOMINANCE` and
   `E993-R28-HS-BRANCH-TREE-MAX-DEGREE-2` before registration. In the sort-and-pair proof, name the `m ≤ |L|` input
   (tree identity, or (HS) at `t = 0`) at Direction 2.
3. **Formalization.** Sort-and-pair is a viable Lean alternative to Mathlib Hall for `sdr_iff_threshold`, provided it
   quantifies over `t = 0` or cites the slot count. Lemma PP is formalizable as an induced-subgraph isomorphism
   combined with `indepSetFinset` monotonicity.
4. **Census horizon.** Order 16 is covered by the matching and threshold forms, by independent instruments, with no
   failures. Order 17 and above are untested by this critic.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-crit-T2-U/`.

| File | SHA-256 |
|---|---|
| `seals.py` (seal and member-digest check) | `bef673b5029d7880d9e0f1a1d60e4fa526020daf1ce8d401c6bc4df22a736ad2` |
| `own/crit_instr.py` (centroid generator, rooted-at-`v` DP, brute force, checks) | `d524a07ad14d6050d7c2f0012379676f7298c4c7ba968e0fedb525c6f2f4a17f` |
| `own/run_crit.py` (census driver: HS both forms, Lemma PP, BTP, DIR, REC-by-matching, slack) | `f14e1abb1fa6d12df4201e9502ec63519e83c49334ef4ad0243a51c7cf3166eb` |
| `own/crit_report_16.json` (canonical, inner sha `428a061c…aa6abd`) | `28b92790fd01201234ec7018ee8f96a96d513e80f39c956a87e038c7fb292401` |
| `own/crit_report_15.json` / `own/crit_report_12.json` | `a31a965c…299056e7` / `e0bba2f5…f372e98f` |
| `own/out16.txt` / `own/out15.txt` / `own/out12.txt` | `f34b2b8c…bf` / `37bdd66f…15` / `94465635…40` |
| `own/greedy.py` and `own/greedy16.txt` (REC greedy, all roots, order ≤ 16) | `77073c00511489d87f7d12d01423d28977acbe39b0b5e4c43d7bf2f7dac2285f` / `48140ac0cf0d99fcb429140e604a8777142907a4c586d289223b61514b87dd71` |
| `own/hubs.py` and `own/hubs.txt` (H10/H22 recomputation vs T2 tables) | `4f37d743…e38207` / `b676b0844c785b846db22508cecb4ba1db2b955f1da1ce1d6ed5435bc97389e8` |
| `own/pp_graphs.py` and `own/pp_graphs.txt` (Lemma PP on random general graphs, seed 28) | `af1ba0d6…b35b0` / `c755aee508a471f213dbcb69af3bf19d928277535f48113a3c5d6e6b1e273c69` |
| `replay/hs_sdr_check.py` (copy of T2's generator) | `19bdb1fde4f6e01e5613f9a9893da103aa6974f1be3814db1195865ce0f6192a` |
| `replay/hs_sdr_report.json` (byte-identical to the seat's; canonical digest `91694350…1a27`) | `96e94c9ce25372c34cd04f4a6d63c3d4250a828024304cd3985c5b75de00ba74` |

No background job was started, so there was nothing to kill.
