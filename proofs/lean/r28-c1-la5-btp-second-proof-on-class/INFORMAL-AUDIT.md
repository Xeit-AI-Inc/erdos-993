---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la5-formalizer-opus-20260925
critic_id: c1-la5-fable-informal-20260925
attestation_id: c1-la5-informal-pass-20260925
claim_sha256: 142d681a01146b4b008726e5bb860fc8b74051edd99018157cb3a407ce0d9bee
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. Boot reads, exactly as the brief §0 authorizes:
`verity.md`, `identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`. Subsystems loaded: the
constitution, the identity startup protocol, and the proof-integrity-audit skill (procedural layer). The host placed
the repository `CLAUDE.md` and the user auto-memory index in context. I acted on them only for the boot. I wrote no
conversation log and nothing outside this folder, because the Stage 7 brief restricts my writes to it.

**Model disclosure.** The seat is chartered as Claude Opus 5 at high effort (brief header; dispatch-record
authority). The seat cannot inspect its own runtime effort. This session's system context reports the model as
"Opus 5.5 (1M context)", model id `claude-opus-5-5[1m]`, and that is the model I state. I used no child agent.

**Seat and scope.**
- Reviewer id `c1-la5-fable-informal-20260925` (kind `independent-mathematical-proof-integrity-reviewer`).
- Producer `c1-la5-formalizer-opus-20260925`. I am not the producer.
- Run `runs/lean-2026-09-25-c1-la5-btp-second-proof-on-class/`.
- I edited no run artifact.

**Input digests (recomputed).**

| Input | SHA-256 | Status |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `5d556ebb8a8bfad8f9c8b84e5a68db257f574f4b738c14f34a4170307ac550f2` | matches the brief |
| `INFORMAL-PROOF.md` | `aeb3012295803d1bda48dc2df1a40bf359eb19eb630aa8b6ff043a0dcdf90bcd` | matches the brief |
| `LeanProject/LeanProof/Main.lean` | `91f529100aa4e3bc4687d03705dc46e8a43323f0cefeaf707d48c7f606374ee7` | matches the brief |
| `control/C1-STAGE7-FORMALIZER-BRIEF-LA5.md` | `c4d3e3db5b20c61dbb82ba9cfd24b1ce82b5aefa20cf66fe2a749f17ce53156c` | matches its capsule entry |

The capsule seal is `0b67697942b40c93873de4984856e40fdec10446e6fe79417c2833ea47a00a57`. I recomputed it as the SHA-256
of the compact, key-sorted JSON of the manifest without `seal_sha256`, and it is identical. Of the 377 members, 362
match. The 15 that do not are all post-seal lifecycle files of the sibling runs C1-LA2, C1-LA3 and C1-LA4
(`EVIDENCE/fidelity-audit-input.json`, `FIDELITY-REVIEW.md`, `LOOP-STATE.json`, `LOOP-STATE.md`,
`VERIFICATION-REPORT.md`). §4 declares these expected. No carried source drifted: the C1-LA4 and C1-LA2 `Main.lean`
files, the r25 source and all seven `sources/c1-stage7-sources/` carry files match their recorded digests.

`FORMALIZER-REPORT.md` is present. It was written after the first refused write, which it discloses in item 7 of its
procedural notes. Both carried sibling runs are closed: `VERIFICATION-REPORT.md` reads `formally_verified` for
C1-LA4 (2026-09-25T02:50:13Z) and for C1-LA2 (2026-09-25T02:44:34Z).

## Intended Claim

The claim is the contract's `theorem.informal_statement`. Its whitespace-collapsed SHA-256, which I recomputed with
`" ".join(s.split())`, is `142d681a01146b4b008726e5bb860fc8b74051edd99018157cb3a407ce0d9bee`. That equals the brief's
value.

In substance: let `G` be a finite simple graph that is a tree and lies in the class `BranchTreeMaxDegreeLeTwo`. That
is, every `v` with `deg v ≥ 3` has at most two neighbours `w` from which some `z` with `deg z ≥ 3` is reachable in
`G − v`. Then for every `k ∈ ℕ`, `(indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k`.

The route runs through Theorem BTP: an explicit own-leaf SDR from the slots to leaves, then the threshold form at
every `t` (including `t = 0`), then the carried C1-LA2 reduction. The claim assumes no `n ≥ 2`, no `k ≥ 1` and no
`t ≥ 1`. Scope: a second proof of (DL) on this class only, filed as a scope note on `E993-R27-FOREST-DEGREE-LEMMA`,
never as a (DL) key. The fences and attribution are part of the claim text.

The terminal declaration is `Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees`.
- `lean_binding.expected_statement` hashes to `1a75cd0380d2d84989938a2604b37051c8e586e373fe2cabb207fd2a41c75a72`,
  which equals the recorded `expected_statement_sha256`.
- The statement followed by ` :=` occurs verbatim in `Main.lean`.

## Claim Ledger

Each row is a statement-level claim of `INFORMAL-PROOF.md`, bound to its Lean entry in `Main.lean`. "Verified" means
three things:
- the inference is valid as stated;
- every hypothesis is named where it enters;
- the finite content has been reproduced by my own code (next section).

| # | Claim (entry) | Hypotheses and where they enter | Inference audit | Verdict |
|---|---|---|---|---|
| D1 | `indepCount` (entry 1) | none | Byte-identical to r25 entry 1 in `sources/r25/.../Main.lean` (body equality; digest `5484fc21…`). | verified |
| D2 | `indepDegreeSum` (entry 2) | none | Byte-identical to entry 2 of the sealed C1-LA4 and C1-LA2 `Main.lean` (digest `a1ed32eb…`). See note (i) on the r27 comparison. | verified |
| D3–D5 | `occ`, `slotsAtLeast`, `leavesAtLeast` (entries 3–5) | none | Byte-identical to C1-LA4 entries 3–5, which equal C1-LA2 entries 3–5. The definition text occurs verbatim in `sources/c1-stage7-sources/U1-Main.lean`, so the origin U1 is confirmed. The contract descriptions' Lean text occurs verbatim in `Main.lean`. | verified |
| D6 | `BranchTreeMaxDegreeLeTwo` (entry 6, new) | none | For each `v` with `3 ≤ deg v`, the predicate counts neighbours `w` with a `v`-avoiding walk to some `z` with `3 ≤ deg_G z`. This is reachability in `G − v`, and `z ≠ v` holds automatically because `z ∈ p.support`. The walk may have length 0, so `w` itself may be the branch vertex. This is SR-BTP's internal direction. Each internal direction contains exactly one nearest branch vertex, so the count is `deg_B(v)`. My two independent implementations (component search vs branch-tree walk) agree on every tree to order 18. | verified |
| D7 | `indepCount_eq_card_indepSetFinset` (entry 7) | finite `V` | Byte-identical to r25 entry 4 (digest `4463e7ee…`). | verified |
| C1 | Carried C1-LA4 layer (entries 8–13) | graph-general: injective `u`, consecutive adjacency, interior degree 2, leaf end | Entries 8–12 are byte-identical to C1-LA4 entries 7–11. Entry 13 equals C1-LA4 entry 12 except that `theorem` becomes `lemma` on the head line. That is a one-line diff; reversing it reproduces the original marker digest `6f0dcbe2…`. The shift argument is valid at `i = 0`: `π 2 = 0` is covered by `u(π a) = u i ∈ J`. Closed run, `formally_verified`. | verified (carried) |
| C2 | Carried C1-LA2 reduction (entries 14–20) | `∀ t` hypothesis; `hT` unused (R28-E-a) | Entries 14–19 are byte-identical to C1-LA2 entries 7–12. Entry 20 equals C1-LA2 entry 33 with the same N1 head-keyword change; the reversal reproduces `eefb5f18…`. Mathematically, `D_k − 2k·i_k = Σ_v (deg v − 2)c_v(k) = Σ_{Br}(deg−2)c_v − Σ_L c_v − 2Σ_{deg 0} c_v ≤ 0` given the aggregate (HS), which the layer-cake sums recover. The `ℕ → ℤ` cast of `deg v − 2` is guarded by `2 ≤ deg v` on `Br`. Closed run, `formally_verified`. | verified (carried) |
| L21 | `walk_avoiding_iff_induce_reachable` | `w ≠ v`, `z ≠ v` (supplies the membership proofs) | Forward: induction on the walk; every edge joins two vertices of `{v}ᶜ`. Backward: map along `Embedding.induce`; the image support lies in `{v}ᶜ`. The step is valid. | verified |
| L22 | `branchTreeMaxDegreeLeTwo_iff_induce` | none | The filter predicates agree pointwise. Forward: `w ≠ v` from `Adj v w`, `z ≠ v` from `p.end_mem_support`. Backward: L21. The equivalence with the synthesis wording (`(G.induce {v}ᶜ).Reachable ⟨w,_⟩ ⟨z,_⟩`, `z ≠ v`, degrees in `G`) is exact. The extra `∃ hw : w ≠ v` is implied by `Adj v w`. | verified |
| L23 | `pendant_chain_back_eq` | `f`, `g` injective on `[0,a]`, `[0,b]`; adjacency; **only `f`** interior degree 2; `f a = g b`; `deg (f a) = 1` | Induction on `j ≤ min a b`. For `j = 0 → 1`, `a, b ≥ 1` follows from `j+1 ≤ min a b`, and a degree-1 vertex has one neighbour. For `j > 0`, `0 < a−j < a`, so `deg = 2` with the two distinct chain neighbours (injectivity of `f`). `g(b−j−1)` is a neighbour of `x`. It is not `g(b−j+1) = f(a−j+1)` (IH, injectivity of `g`, `b−j+1 ≤ b`). No acyclicity or connectivity is used. Note: the Lean docstring's "(`a, b ≥ 1`)" is not a hypothesis; the lemma is more general. That is harmless. | verified |
| L24 | `pendant_chain_eq` | L23's hypotheses for both chains; `1 ≤ a, b`; `3 ≤ deg f 0`, `3 ≤ deg g 0` | If `a < b`, L23 at `j = a` gives `f 0 = g(b−a)` with `0 < b−a < b` (uses `a ≥ 1`). So `deg = 2` by **`g`'s** interior degree, which contradicts `3 ≤ deg f 0`. The case `b < a` is symmetric via L23 with the roles swapped. With `a = b`, `j = a − i` gives `f i = g i`. INFORMAL-PROOF says "`deg (f 0) = 2`"; since `f 0 = g(b−a)`, that is the same vertex, so the statement is correct. The `3 ≤ deg` anchor hypotheses are necessary: in `P_3` (0–1–2), the chains `(1,2)` and `(0,1,2)` end at leaf 2 with different anchors. | verified |
| L25 | `exists_pendant_chain` | **`G.IsAcyclic`**; `v ~ w`; `hno` (every walk `w ⇝ z` to a branch `z` meets `v`); finiteness (length `< card X`) | Take a longest `v`-avoiding path `q` from `w` (`Nat.findGreatest`; `P 0` holds since `w ≠ v`). Every vertex of `q` has `deg < 3` (`hno` applied to `takeUntil`). `Q = v :: q` is a path. For the end `ℓ`: `deg ≥ 1` (penultimate neighbour) and `< 3`. A second neighbour `x` on `Q` equals `Q.penultimate` by Mathlib `IsAcyclic.eq_penultimate_of_adj_end` (checked in the pinned Mathlib `Acyclic.lean:216`: path `p`, `Adj v w`, `w ∈ p.support` ⇒ `w = p.penultimate`). A second neighbour off `Q` extends `q`, which contradicts maximality. Interior vertices of `Q` lie on `q` (`deg < 3`) and have two distinct neighbours by path injectivity (`IsPath.getVert_injOn`, `Paths.lean:410`), so `deg = 2`. **Acyclicity is necessary:** see the bowtie below. | verified |
| L26 | `pendant_chain_occ_le` | chain data; graph-general | C1-LA4 entry 13 at `i = 0` on `u := fun i : Fin (m+2) => f i`. Injectivity comes from the `InjOn`; adjacency, degree and leaf data transfer. `u 0 = f 0`, `u (last) = f (m+1)`. | verified |
| L27 | `exists_own_leaves` | **`hT`** (only `hT.isAcyclic`, via L25); **`hB`** (only here: `Int ⊆` the `hB` filter, so `|Int| ≤ 2`); `3 ≤ deg v` | `Int` and `Pend` partition `N(v)` (`card_filter_add_card_filter_not`). Hence `deg v − 2 ≤ |Pend|` by `omega`. The ℕ subtraction is exact because `deg v ≥ 3`, and `omega` is sound for truncated subtraction anyway. `L : Pend → leaves` is injective by L24 at `i = 1`, since both anchors are `v` with `3 ≤ deg v`. `O := Pend.image L`. | verified |
| L28 | `btp_sdr_exists` | `hT`, `hB`, `k` | `e v : Fin (deg v − 2) ↪ O v` via `nonempty_of_card_le`. `f⟨v,j⟩ := e v j`. Injectivity: a common image is an own leaf of `v` and `v'`, so `v = v'` by L24 at `i = 0` (`v.2`, `v'.2` give the anchor hypotheses); then `j = j'` because `e v` is injective. Leaf and dominance follow from L26. No Hall, no slot count, no surplus identity. | verified |
| L29 | `threshold_of_sdr` | any finite graph; injective `f` into leaves with `occ v ≤ occ (f s)`; **every `t`** | `#{s : t ≤ c_{v(s)}} = Σ_{v∈Br}[t ≤ c_v](deg v − 2) = slotsAtLeast G k t` (`Fintype.sum_sigma`, `sum_subtype`, `sum_filter`, `filter_filter`; `Σ_{j<deg−2} 1 = deg − 2`). The image of `f` lies in `{ℓ : deg ℓ = 1, t ≤ c_ℓ}`, and `f` is injective. This holds at `t = 0` too. | verified |
| L30 | BTP face | `hT`, `hB`, `k` | L28 ∧ L29. All `t` and all `k`, including 0. | verified |
| T31 | Terminal theorem | `hT`, `hB`, `k` | `dominance_implies_degree_lemma G hT k (L30 G hT hB k).2`. The hypotheses match the claim one-for-one (`X` finite with `DecidableEq`, `G` with `DecidableRel`, `hT`, `hB`, `k`), and so does the conclusion. | verified |

**Casts and ℕ-subtraction.**
- `deg v − 2` occurs only inside `Fin (deg v.1 − 2)` with `v : {v // 3 ≤ deg v}`, in `slotsAtLeast` under the
  filter `3 ≤ deg v`, and in L27 under `hv : 3 ≤ deg v`. There is no truncation.
- `a − j`, `b − j`, `b − a`, `a − i`, `i − 1` in L23–L25 are each guarded by the stated order hypotheses. I checked
  every `omega` side condition against its context.
- The only ℤ step is inside the carried C2, and the casts there are sound.
- Every equality used is an identity: the layer-cake identity, the two double counts, and the sigma/subtype
  regrouping in L29. I recomputed them numerically (next section).

**Notes.**
- (i) The r27 source `sources/r27/c1-la1-forest-degree-extension/…/Main.lean` is outside my §1 read list, so I did not
  open it. The `indepDegreeSum` text is byte-identical to the entry carried by both closed sibling runs, whose
  fidelity reviews accepted it as r27 entry 7. `CAPSULE-VERIFICATION.json` records the r27 entry-digest match
  (`a1ed32eb…`, `match: true`).
- (ii) The r25 G1 entries (1 and 4) I checked byte-for-byte against `sources/r25/c4-forest-descent-order-bound/
  LeanProject/LeanProof/Main.lean` (`736eb9df…`).
- (iii) Every one of the 31 marker digests equals the SHA-256 of the entry body between its markers, and each
  `Snippets/` fragment equals its marker digest.
- (iv) Forbidden tokens: `sorry`, `admit`, `native_decide`, `axiom` and `decide` each occur 0 times in
  `Main.lean`. The only import is `import Mathlib`.
- (v) `EVIDENCE/axioms-all-declarations.txt` lists 31 declarations. 30 depend on `[propext, Classical.choice,
  Quot.sound]`; `walk_avoiding_iff_induce_reachable` depends on `[propext, Quot.sound]`.

## Reproduced Mathematical Evidence

I wrote all code myself. It uses the standard library only and imports no prior evaluator. It lives in this folder,
and no hashed output carries a wall-clock field.

| File | SHA-256 | Imports |
|---|---|---|
| `check_text.py` | `26a9f70cbb35636f28bea4e994f28ee2766a465a1816e55aa61d6de41b33cd1f` | `hashlib, json, re, os, difflib` |
| `btp_replay.py` | `639ccb999a895dee1666779a5ce01021aed067dbe4859b75e4941c0fcb869443` | `sys, json, hashlib, itertools, collections` |
| `btp_replay_fast.py` | `7272a55c20f5212f0cce839e377deb38adcee782848f550c409f6070a5793019` | `sys, json, collections`, `btp_replay` |
| `witnesses.py` | `ebeaecc5a544b741b85130e899e5ec5c0bccd967d728a12c2ec7f2830acba4ae` | `json, random, itertools, collections`, `btp_replay` |
| `check_text.out.json` | `243bf940195ab1709412cd5f991a649d3af39498ed5a7a6f7a87d182590f2a71` | |
| `replay-order14.json` | `a6e94672deb6d69e0a2e56c53f3db26bdc4398463acf30588954eeba82cd07a8` | |
| `replay-order16.json` | `d308fb58dc661372510e648e0cbf04a47cf80171ac5f1f9270b36ee7fe2b5fea` | |
| `fast-order1-16.json` | `fd45b667333f1de44cc1393ef57537c006d79a8ebbe1fb15c337b308cf87f29a` | |
| `fast-order1-18.json` | `15a7d8e0794f36d3b9fce8256bf9f84e8589d52781341a6e79cea4f287bb25a6` | |
| `witnesses.out.json` | `36df79653f9d80300d5440f05537fa8fc12c024cbee86a9e6e880af260a56047` | |

**Instrument.**
- Free trees are generated by leaf extension with a canonical centre-rooted AHU form. The counts per order equal
  A000055 (1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320, 48629, 123867 for orders 1–18),
  which the code asserts.
- `c_v(k)` comes from a rooted in/out independence-polynomial DP at every root.
- On all 201 trees of order ≤ 10, `c_v(k)`, `i_k` and `D_k` are checked against brute-force subset enumeration,
  including `D_k = Σ_J Σ_{v∈J} deg v = Σ_v deg v · c_v(k)`.
- `Σ_v c_v(k) = k·i_k` is asserted on every tree and every `k`.
- The class is computed two independent ways, and they agree on every tree:
  - (a) Lean's reading: component search in `T − v` from each neighbour, hitting any vertex with `deg_T ≥ 3`;
  - (b) branch-tree degrees by walking each direction through degree-2 vertices.

**(HS) replay on the class, order 1–14 (the brief's requirement).** 5,059 class trees (of 5,447 trees) and every
`k ∈ {0,…,n}`: 71,903 `(T,k)` instances. Every `t ∈ {0,…, max c + 1}` was checked, 3,176,196 threshold rows in all
(rows counted over all trees).
- `slotsAtLeast ≤ leavesAtLeast`: **0 failures**, including `t = 0` and `k = 0`.
- (DL) `D_k ≤ 2k·i_k` as an integer statement: 0 failures.
- The explicit own-leaf injection holds at every instance:
  - `|own(v)| = deg v − b(v) ≥ deg v − 2`;
  - own-leaf sets are pairwise disjoint (asserted);
  - `c_ℓ(k) ≥ c_v(k)` for every own leaf: 0 failures.

**Extension to order 16** (exhaustive `t`). 27,753 class trees and 450,962 `(T,k)` instances, with 0 (HS), 0 (DL)
and 0 own-leaf dominance failures. Over all trees, class or not, (HS) has 0 failures to order 16. That is consistent
with a minimum counterexample order of 22.

**Extension to order 18.** Here the threshold check is restricted to `t ∈ {0} ∪ {c_v(k) : v ∈ Br}`. This is complete:
`slots_{≥t}` is constant on each interval between consecutive distinct branch values, `leaves_{≥t}` is non-increasing,
and `slots_{≥t} = 0` above the largest branch value. I cross-checked the restriction against the exhaustive run to
order 16 (same verdicts). Result: 155,308 class trees, 0 (HS) failures, 0 (DL) failures, 0 own-leaf dominance
failures.

**Record numbers reproduced.**
- *C-T2-U Finding 2 and 3:* class trees with `Br ≠ ∅` to order 16 number **27,737** of **32,492**. Trees outside the
  class by order are `10:1, 11:4, 12:19, 13:77, 14:287, 15:1002, 16:3365`. All exact.
- *Contract `formulation_status` (SR-BTP BT-1):* 155,290 class trees to order 18. I get 155,308 class trees in all,
  minus the 18 paths (`Br = ∅`), which gives **155,290 with `Br ≠ ∅`**, exact. The 2,991,832 `(T,k)` instances
  reproduce exactly as `Σ (n+2)` over those trees, i.e. `k ∈ {0,…,n+1}`: 2,836,542 + 155,290.
- *Informal proof §1:* the class contains every tree with at most one branch vertex (628/628 to order 16: paths,
  stars, spiders) and every caterpillar (8,384/8,384 to order 16; brooms and double brooms are caterpillars). The
  unique order-10 tree outside the class is H10 (degrees 3,3,3,3 and six leaves).

**`T22`** (synthesis edges, recomputed).
- `IsTree` holds: connected with 21 edges.
- `Br = {0,1,8,15}`, `L = {4,7,11,14,18,21}`, `α = 13`.
- The branch tree has edges `{0–1, 0–8, 0–15}`, so it is `K_{1,3}` with `b(0) = 3`. **`T22` is outside the class:**
  the root has three branch neighbours, so `hB` fails at `v = 0`. Vertex 0 has no own leaf but one slot.
- (HS) fails at exactly `(k,t) = (12,18)` and `(11,137..141)`, each with slots 1 > leaves 0. There are no other
  failures.
- `c_0(12) = 18`, and every leaf has `c_ℓ(12) = 17`. The hand certificate `[x^11](1+3x+x^2)^6 = 18` and
  `[x^11](1+x)^2(1+3x+x^2)^5 = 17` is recomputed. `c_0(11) = 141`; leaves have 136 at `k = 11`.
- (DL) still holds: `D_12 = 372 ≤ 456 = 2·12·19` and `D_11 = 3099 ≤ 3762 = 2·11·171`.
- So `hB` is sharp for the **BTP face** at every branch-degree bound `D ≥ 3`, since `T22`'s branch tree has maximum
  degree exactly 3. It is not sharp for the terminal (DL) conclusion, which r27 proves on all forests. That is why the
  terminal theorem is only a scope note, as the claim states.

**Where acyclicity is necessary** (hypothesis `hT`). Take the bowtie: two triangles sharing vertex 0 (5 vertices,
degrees 4,2,2,2,2).
- It satisfies the Lean class predicate: no other branch vertex, so the count is 0.
- It fails the BTP face at `t = 0`: slots 2 > leaves 0.
- It fails the terminal inequality at `k = 1`: `D_1 = 12 > 10 = 2·1·i_1`.

Dropping `hT` therefore breaks both the face and the theorem, and L25 is exactly where it is consumed.

**Graph-general pieces.** These were checked on 3,000 random graphs with cycles (orders 3–10, seed 20260925).
- Pendant-path dominance `c_{u_i}(k) ≤ c_ℓ(k)`, the carried C1-LA4 content used at `i = 0`: 151,545 instances,
  0 failures.
- Anchor uniqueness, which needs no acyclicity (L23/L24): 2,470 leaves carrying a branch-anchored chain, 0 leaves
  with two distinct such chains.

## Independent Critic Pass

I ran a separate adversarial pass over the ledger above, with each objection tested against the source.

1. *Is the class predicate vacuous or mis-scoped?*
   - No. 155,308 of the 205,004 trees of orders 1–18 satisfy it, and 49,696 do not.
   - Its complement to order 16 reproduces C-T2-U's independent census exactly.
   - The degree is `G.degree` (in `T`), not the degree in `G − v`, matching the synthesis ("component … contains a
     vertex of degree ≥ 3").
   - The length-0 walk, where `w` itself is branch, is counted as internal. That is correct.
   - Classical decidability of the filter does not affect membership.
2. *Does the terminal hypothesis list match the claim?*
   - Yes: `hT`, `hB`, `k`, with no `n ≥ 2`, `k ≥ 1` or `t ≥ 1`.
   - `hT` is consumed only through `IsAcyclic`. Connectivity is never used; its carried use is the unused
     parameter, confirmed by the linter warning in `EVIDENCE/axioms.txt`.
   - The 1-vertex tree is covered, and the claim holds there (`D_k = 0`).
3. *Hypothesis placement against the synthesis's gloss.* The synthesis attributes "connectivity → pendant paths;
   acyclicity → disjoint own-leaf sets". The proof instead uses acyclicity for pendant-chain existence (L25) and only
   the degree pattern for disjointness (L23/L24).
   - I tested the proof's allocation: anchor uniqueness holds on graphs with cycles (0 failures), and the bowtie
     shows acyclicity is needed for L25.
   - The informal proof's allocation is the correct one and more precise. INFORMAL-PROOF §4 states it truthfully.
   - This is not a defect.
4. *Is anything marked NOT a dependency actually a dependency?*
   - None of the following is present in `Main.lean` except in docstrings: Hall machinery, `sdr_iff_threshold`,
     `slot_leaf_sdr_exists`, `R28U2.*`, (HS) `tree_leaf_slot_dominance`, the slot count, the surplus identity,
     C1-LA2 entries 13–32, `CriticU1F.*`, and r27 `forest_degree_lemma`.
   - Nothing is transported from `sources/c1-stage7-sources/`.
   - The route is the direct own-leaves injection, as §4 prefers.
5. *Provenance truthfulness (R5).*
   - The informal proof says entries 6 and 21–31 were written in-run and that no critic-authored Lean body is carried.
     Entries 8–13 and 14–20 are verified byte-identical carries (or the disclosed N1 head change) from the closed
     sibling runs.
   - The carry table's original and registered digests are all correct.
   - Every capsule-membership statement I checked is true: the sibling `Main.lean` digests match the sealed ones.
6. *Numeric claims.* Every number in the proof, the contract's formulation evidence and the synthesis's `T22` block
   that I could test reproduced exactly, under the interpretations stated above.
7. *Wording observations (non-blocking, not defects of the proof).*
   - (a) The contract's informal statement calls r27 `forest_degree_lemma` "an input that is not edited". It is an
     input only in the brief's sense (its entry 7 definition), not a dependency of this proof. INFORMAL-PROOF §1
     states this precisely ("an input to nothing here").
   - (b) Entry 23's docstring mentions `a, b ≥ 1`, which the lemma does not assume.
   - (c) Process note for the controller, outside the mathematics: `FORMALIZER-REPORT.md` R4 discloses that the kernel
     verifier overwrote `EVIDENCE/axioms.txt` after the pre-verification write, by its own design. The file is bound
     in the receipt.

The critic pass found no defective step.

## Scope and Fence Check

- **NOT (HS) on all trees.** The claim asserts (HS) only under `hB`. `T22` is recomputed outside the class (`b(0) = 3`)
  and refutes (HS) at `(12,18)` and `(11,137..141)`. The claim says (HS) `tree_leaf_slot_dominance` is FALSE. Present
  on the face: contract, INFORMAL-PROOF §5, entry 30 docstring.
- **Sharp for every `D ≥ 3`.** Stated, and backed by `T22` having branch-tree maximum degree exactly 3.
- **NOT (DL) on all forests; scope note only.**
  - The terminal theorem is (DL) on the class only, filed as a scope note on `E993-R27-FOREST-DEGREE-LEMMA`, never a
    (DL) key.
  - The r27 face is not edited: the r27 source is neither imported nor carried, and `indepDegreeSum` is its entry text.
  - Present in the contract, INFORMAL-PROOF §1/§5, and the entry 31 docstring.
- **`slot_leaf_sdr_exists` and `R28U2.tree_leaf_slot_dominance`** are never carried or used (grep: absent).
- **No status transfer** (SOLUTION-CONTRACT §3.1) and **not (PW)**: both stated.
- **Attribution travels on the face.** The contract's `informal_statement` and INFORMAL-PROOF §6 both carry:
  - C-T2-U (Theorem BTP);
  - C-T2-F, C-F2-T, C-F2-U, C-T1-F (independent proofs);
  - SR-BTP (repairs; canonical proof);
  - U adjudicator (route `U-BTP-CLASS-FORMAL`);
  - the pendant-path lemma's critics (SR-PP) and the C1-LA4 formalizer (carried Lean text);
  - (LC) U1 and the C1-LA2 formalizer;
  - the common attribution.

  I checked the synthesis `## Lean awards` C1-LA5 list (C-T2-U; C-T2-F, C-F2-T, C-F2-U; SR-BTP; U-BTP-CLASS-FORMAL) and
  the brief's addition C-T1-F against the capsule's critiques:
  - C-T2-U Finding 2 is Theorem BTP;
  - C-F2-T Finding 2 and C-F2-U F-2 are concordant proofs;
  - C-T1-F F2 is the branch-tree reduction;
  - the route is defined at U adjudication line 479.

  The attribution is complete.
- **Grades.** The contract lists no `formally_verified_conditional` or `compiled` grade. The formulation status is
  `established`, and the report status is `compiled-candidate`.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete, correct statement-level proof of the contract's intended claim (claim SHA-256
`142d681a01146b4b008726e5bb860fc8b74051edd99018157cb3a407ce0d9bee`).
- Every hypothesis is named where it enters, and the hypothesis table is accurate.
- Every ℕ-subtraction is guarded.
- The definitions match the Lean source literally, and the G1 and r25 entries are byte-identical.
- The terminal declaration's hypotheses match the claim one-for-one.
- No excluded conclusion is asserted.
- The route is the direct own-leaves injection composed with the carried C1-LA4 lemma and C1-LA2 reduction, with no
  Hall machinery and nothing from U2.
- The independent replay found 0 failures of (HS), of the own-leaf injection and of (DL) on every class tree to order
  18 (exhaustive `t` to order 16), and it reproduced every tested record number.

Model disclosure: chartered Claude Opus 5 (high effort, dispatch-record authority); runtime-reported model "Opus 5.5
(1M context)", id `claude-opus-5-5[1m]`; no child agent.
