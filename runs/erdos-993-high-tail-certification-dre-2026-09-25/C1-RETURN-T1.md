# RETURN — Cycle 1, Route T1

`route_id: C1-T-01 HIGH-TAIL-EXTRACTION-AND-ENDPOINT` · `mechanism_fingerprint: HIGH-TAIL-EXTRACTION-AND-ENDPOINT` · orientation T (prove) · seat T1
`load_bearing_obligation`: `control/C1-ALLOCATION.md` item 1 (T1) — read the frozen source and write the exact dependency diagram for entries 18/41–44 and 1–17; derive the REGISTRY form of (TSB); prove the `p = 1` endpoint of (HTP) with every hypothesis named, plus the general `deg(s) − 1` formula; write candidate statement-level informal proofs for (TSB), (HTP) at every `p ≥ 1`, (HTA) at every `p ≥ 1`, and (ELIG); write the compiled-internal-vs-awarded distinction table; reproduce the `K_2`, `P_3`, `K_{1,m}` fixed points before any table.

## Boot acknowledgment

VerityOS booted this session by reading EXACTLY the two authorized files, in order: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the dispatch, the startup protocol's own further map (memory, conversations, modules, skills, logs, decisions) was NOT followed — the controller has booted for the run. No other VerityOS file outside this experiment root was read.

## Stage 2 seal verification

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (the object with its `seal_sha256` field removed, `sort_keys=True`, `separators=(",", ":")`, no trailing newline):

```
stated seal:   58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
computed seal: 58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
match: True
```

## Sources read and digests verified

All read under the grant (`control/SOURCE-DIGESTS.json`), digests recomputed with `shasum -a 256` and matched byte-for-byte before use:

| File | SHA-256 (recomputed) | matches manifest |
|---|---|---|
| `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` | `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9` | yes |
| `sources/first-interior/c2-primary-v2/FORMALIZATION-STATE.json` | `5411a8c2451549b650be1af2e551c40d8b4440f65ce50c691023ef1be2dc94a0` | yes |
| `sources/first-interior/c2-primary-v2/SOURCE/CANDIDATE-PROOF.md` | `cc9fa001269c7e649bea456661f92b9aea2f17ee406f24da6ebfabe78161a0c9` | yes |
| `sources/first-interior/records/FINAL-ANALYSIS.md` | `16bb743e632a1983c1dd2d3d61bced3959d7b00cfb44be0e5100ad880aa2ee0b` | yes |
| `sources/first-interior/records/C2-SCOPE-AUDIT.md` | `ad24a0fe7c7021c90f3d5bdf07df57746d89ac6ff65f4c27c7a0071c67e95cbb` | yes |
| `sources/first-interior/c2-primary-v2/THEOREM-CONTRACT.yaml` | `61029a5001c862684a6e8b8e96cced4af2b0e48353183a00b95efe5272cad61e` | yes |
| `sources/first-interior/c2-primary-v2/EVIDENCE/axioms.txt` | `fe4fbfbfe99a8d994f08cc91dd54c931451d092c782a030ac4d1f496c2c18193` | yes |
| `sources/first-interior/c2-primary-v2/DEPENDENCIES.yaml` | `f2d29a42fe90c3a2507f3036ce6bb2e6cdf88f979f4c3d6c0becadc179944f32` | yes |
| `sources/authority/CLAIM-IDENTITY.json` | `97abd89e77314edba1f2ebde486a5e39ccd295cc3ffe609c36ef9e3da7775082` | yes (matches `control/SOURCE-DIGESTS.json` entry and `control/CLAIM-IDENTITY.run-local.json`) |

Also read in full: `control/C1-WORKER-COMMON-BRIEF.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`, `control/C1-STAGE1-GATE.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/SOURCE-DIGESTS.json`. Mathlib API sources read for declaration meaning and file:line pins only (permitted; not part of the digested packet): `Mathlib/Combinatorics/SimpleGraph/Clique.lean`, `Acyclic.lean`, `Bipartite.lean` under the pinned `mathlib-v4.32.2-project/.lake/packages/mathlib/`.

## Read-boundary disclosure

None. No file was read outside the two authorized boot files and the grant described above.

## 0. Registered claims named before any census

Per brief item 3, named here, before any numeric/census evidence is presented below:

- `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` — **VERIFIED** (`formally_verified`), the first-interior award (`E993Interior.firstInteriorAggregate`, entry 45). Input to this run; never re-proved or re-registered.
- `E993-R26-TOP-RANK-RESIDUAL-SIGN` — **VERIFIED**, r26's award on the residual top-rank class (four hypotheses, including the residual condition). Input; T2's object, cited here only for the distinction table.
- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — **OPEN**. Statement (registry): "For every finite ordinary tree T and every natural p≥x(T)+2, sum over all favorable ORIGINAL leaves v, defined by Δ_p(T−v)<0, of [Δ_(p−1)(T−{v,s_v})−Δ_(p−1)(T−N_T[s_v])]≤0." This run's (HTA) closes it only on the high-tail sub-region `3p ≥ 2α+1`; the remaining open region is `x+2 ≤ p, 3p < 2α+1` (fenced, out of scope here).
- `E993-BETA-TARGET` — **REFUTED**. Statement: "For leaf v with support s, p with k_A≥2 and a_v(p)<0: b_v(p)≤Bgen_s(p−1)." Scope: universal at `k_A≥2` on the governed `RTree` model with a favorable-selector premise, `(β)`. Distinct from (HTP): (HTP) is on ordinary bipartite graphs, has NO favorable-selector premise (every leaf's term, not just favorable ones), and is restricted to `3p≥2α+1` rather than all `k_A≥2`. The C2 scope audit (`C2-SCOPE-AUDIT.md` §2) records this distinction; the refutation witnesses (`T22` at `p=34`, `T60` at `p=90`) sit below the `3p≥2α+1` guard (checked there), so they are consistent with, not counterexamples to, (HTP).
- `E993-BETA-AGG-SUPPORT` — **REFUTED**. Per-support-fibre aggregate on governed `RTree`, distinct scope from both (HTA) (a single global sum, not per-support) and `E993-BETA-TARGET`.
- `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` — **REFUTED**. Statement: "every independent r-set S of U has at most r addable vertices" (a per-set universal bound on ordinary G1 tuples). Distinct from (TSB): (TSB) bounds `2(a−k)` addable vertices via a bipartite colour-class split, not `r` (=`k`) addable vertices, and (TSB) compares two **counts** `q_{k+1}`, `q_k` of tagged independent sets rather than bounding one set's addable-vertex count directly. `E993-C3-GRAPH-ADDABLE-VERTEX-AVERAGE-IDENTITY` (VERIFIED) — the averaging identity `Σ_S e(S) = (r+1)i_{r+1}(G)` — is a related but distinct object (an identity about the total, not a per-set or per-colour-class bound); it is not an alias of (TSB) and this run does not cite or use it.
- Auxiliary keys entering registration this cycle, all **OPEN, `formal_award: false`**, certificate "OPEN proposal only; independent Sol high scope audit approved exact identity" (`C2-SCOPE-AUDIT.md`): `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB), `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP), `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG) — T1's three objects.

## 1. Compiled-internal vs awarded — distinction table

| Target | Compiled internal (entry, digest) | Its hypotheses | Registry statement (this run) | Gap the award must add |
|---|---|---|---|---|
| (TSB) | entry 41 `E993Interior.taggedShadowBound`, `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f` | `hBip`, arbitrary `U W : Finset V`, `a k : ℕ`, `hcap : ∀ A ⊆ U, IsIndepSet A → A.card ≤ a` (U-relative, caller-supplied), `hk : 1 ≤ k`; conclusion in ℕ | `U = univ`, `a = H.indepNum`, `hcap` discharged by `IsIndepSet.card_le_indepNum`, `hka : k ≤ H.indepNum` added, conclusion cast to ℤ | Instantiate `hcap` from `indepNum` (one Mathlib lemma application), add the `k ≤ a` binder, recast the ℕ inequality to ℤ (`Int.ofNat_le`/`Nat.cast_le` direction only — no new arithmetic) |
| (HTP) | entry 42 `E993Interior.highTailAggregateFromShadow` (`972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d`) composed with entry 42's private `Leaf.leaf_term_nonpos`, `p ≥ 2` only | `hShadow` (an abstract copy of TSB's conclusion, supplied as a hypothesis, not proved in-file at entry 42), leaf `v`, `hv : IsGraphLeaf`, `p`, `hp : 2 ≤ p`, `hTail` | Same statement at every `p ≥ 1`; `hp : 2 ≤ p` replaced by `hp : 1 ≤ p`; new base case at `p = 1` | Prove the `p = 1` case (§3 below); this run supplies it |
| (HTA) | entry 44 `E993Interior.bipartiteHighTailAggregate` (`b7ee9d1adcac58675ea4216906ca944049df3f3be12873c4996cb23fe4dc3b93`), `p ≥ 2` only, composes entry 42 with `taggedShadowBound` directly (discharges `hShadow`) | `hBip`, `p`, `hp : 2 ≤ p`, `hTail` | Same statement at every `p ≥ 1` (T2's terminal object; this route supplies the `p = 1` leaf-term input it needs) | Sum the `p = 1` leaf terms over the favorable filter (immediate once (HTP) at `p=1` is in hand — T2's object) |
| (ELIG) | entry 43 `E993Interior.eligibleAlphaGeSeven` (`dbd200bd15cf7cf8ce2516587fb25491dbddad2b171a079bda87b92258c32b06`) with private helpers in `E993Interior.Guard` | `hT : IsTree`, `hInterior : crossingIndex + 2 ≤ indepNum − 2` (ℕ) | Identical statement — SOLUTION-CONTRACT §2's `interiorEligibilityAlphaGeSeven` is a byte-identical re-export | None mathematically; only the registrar carry (byte-identical copy into a new award project) and its own fidelity/kernel gate — U1's task |

Every internal declaration above is **compiled, kernel-checked inside the first-interior package, and NOT separately awarded** (fence `SOLUTION-CONTRACT.md` §3.8, ruling 2 of `C1-STAGE1-GATE.md`). It is cited here by entry number and fragment digest as context only.

## 2. Fixed points (own instrument), reproduced BEFORE the tables above are relied on

**IMPORT LIST** (standard library only): `itertools`, `hashlib`, `json`, `math`, `sys`, `heapq`.

Script: `scratchpad/c1-T1/fixed_points.py` (SHA-256 `74e34689f777b430778cc6bb526e60e3cd030c43bca4469eda4168280d1d6c1f`). It never writes an answer in as a literal — every count is produced by brute-force enumeration over the graph's original vertex set with deletion realised as avoidance (matching `C5LA1.indepSetsAvoiding`/`indepSetCount`, entries 10–12), and every object called a tree/bipartite passes an explicit acyclicity-and-connectivity / 2-colouring test in the code (`is_tree`, `is_bipartite` functions).

Copy-out-first replay (target is the in-root replay directory, never `/tmp`):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T1/fixed_points.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T1-replay/fixed_points.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T1-replay
python3 fixed_points.py > fixed_points.out.json
shasum -a 256 fixed_points.out.json
```

Reproduced result: `fixed_points.out.json` SHA-256 `1ec01100b7ae6d7d9724fffbac65d8e57b0a2701f37c02974e5c14cd32fabc8c`, identical between the original run in `scratchpad/c1-T1/` and the copy-out replay in `scratchpad/c1-T1-replay/` (no wall-clock/PID/host field is hashed). Internal results digest (embedded, of the results object minus that field itself): `bee4fa79f5b0992e1a24a4287abc9aae0161c30809e04a379e4e4e46dab223b9`. All 726 checks passed (0 failed).

Attained horizons (stated exactly, not as filter bounds): stars `K_{1,m}` for `m = 2..8`, every `p = 1..m+1`; trees for `n = 2..7` (the star and path at each order, plus — for `n ≥ 4` — the first 40 lexicographic Prüfer sequences decoded, each independently verified as a tree by the acyclicity-and-connectivity test); the tagged-count-split identity on 4 named small graphs (`K_2`, `P_3`, `K_{1,3}`, a disjoint `2K_2`) across all `W ⊆ V` and `j = 0..n+1`; the TSB inequality on 6 named bipartite graphs (`K_2`, `P_3`, `K_{1,4}`, `P_5`, a disjoint `2K_2` plus an isolate, `C_6`) for `W` ranging over every subset of size `≤ 3` plus `V` itself, every `1 ≤ k ≤ α`. This is a bounded spot check of the identities this route's derivation uses, not an exhaustive census (route F1 owns the exhaustive attack).

### `K_2` (`x`, `Δ_k`, `α`, graph named on every row)

Vertices `{0,1}`, edge `{0,1}`; `is_tree`: pass; `is_bipartite`: pass; `α(K_2) = 1`. Leaf `v=0`, support `s=1`; `H_v = R_v = {0,1}` as deletion sets (both empty carriers). At `p=1` (`p−1=0`): `Δ_0(H_v) = i_1(∅) − i_0(∅) = 0 − 1 = −1`; same for `Δ_0(R_v) = −1`; **term `= −1 − (−1) = 0`**, matching `SEMANTIC-CONTRACT.md` §2's stated fixed point exactly. Both leaves are favorable at `p=1` (`Δ_1(K_2 − v) = i_2(pt) − i_1(pt) = 0 − 1 = −1 < 0`, one-vertex graph). `S(K_2, 1) = 0 + 0 = 0`.

### `P_3` (`x`, `Δ_k`, `α`, graph named)

Vertices `{0,1,2}`, edges `{0,1},{1,2}`; `is_tree`: pass; `is_bipartite`: pass; `α(P_3) = 2`. Leaf `v=0`, support `s=1` (degree 2). `H_v = \{2\}` (one isolated vertex), `R_v = \emptyset` (0 vertices, since `N[1] = \{0,1,2\}`). At `p=2` (`p−1=1`): `Δ_1(H_v) = i_2(\{2\}) − i_1(\{2\}) = 0 − 1 = −1`; `Δ_1(R_v) = i_2(\emptyset) − i_1(\emptyset) = 0 − 0 = 0`; **term `= −1 − 0 = −1`**, matching the stated fixed point exactly.

### `K_{1,m}` (`m = 2..8`), leaf term, `α = m`

All confirmed trees/bipartite by the code's own tests. `H_v = ` `(m−1)` isolated vertices, `R_v = \emptyset`. For `p ≥ 2`: direct term (computed by graph deletion) equals the closed form `C(m−1,p) − C(m−1,p−1)` exactly, at every `m=2..8`, `p=2..m+1` (35 rows, all match). Sign is nonpositive **iff** `2p ≥ m`, confirmed at every row (`m=2`: fails only at `p=1`; `m=8`: fails at `p=1,2,3`, first nonpositive at `p=4=⌈8/2⌉`) — the "sign first fails at `p = ⌈m/2⌉ − 1`" statement of `SEMANTIC-CONTRACT.md` §2 is confirmed exactly by direct computation. At `p=1` the closed form does **not** apply (see §3 below): direct term always equals `deg_G(s) − 1 = m − 1 > 0` for `m ≥ 2`, confirmed at every `m=2..8` — this is itself the computational confirmation that stars with `m ≥ 2` are never in the `p=1` guarded region (their `α = m ≥ 2` forces `3·1 = 3 < 2m+1`), so the endpoint's truth is specific to `K_2` (`α=1`) exactly as `SEMANTIC-CONTRACT.md` states.

## 3. Target 2 (HTP): step-by-step derivation with every hypothesis named

**Statement** (`SOLUTION-CONTRACT.md` §2 `bipartiteLeafHighTailPointwise`): for finite bipartite `G` (`hBip`), original leaf `v` (`hv : IsGraphLeaf`, i.e. `∃! u, G.Adj v u` — finiteness `[Fintype V][DecidableEq V]` enters here to make `IsGraphLeaf`, `support`, `H`, `R` computable/well-defined, entries 4–9), integer `p ≥ 1` (`hp`), guard `3p ≥ 2α(G)+1` (`hTail`): `Δ_{p−1}(G−\{v,s\}) − Δ_{p−1}(G−N_G[s]) ≤ 0`.

**Case `p ≥ 2`** (extracted from entry 42's `Leaf.leaf_term_nonpos`, lines 1136–1153 of `Main.lean`, composed with entry 41's `taggedShadowBound`):

1. Put `k := p−1 ≥ 1` (this is where `hp : 1 ≤ p`, sharpened to `2 ≤ p` in this branch, enters: it makes the ℕ subtraction `p−1` equal the integer value and gives `k ≥ 1`, matching TSB's `hk`).
2. `W := N_G(s) \setminus \{v\}` (viewed inside `univ \setminus H_v`); simplicity of `G` gives `W ⊆ V(H_v)` (`H_subset_R`, lines 991–1002, uses `hv` via `support_adj`).
3. `H_subset_R` (`C5LA1.H G v ⊆ C5LA1.R G v`) — uses `hv` to get `G.Adj v (support G v)`, hence `support G v ∈ R_v`.
4. `tagged_count_split` (lines 1045–1084) at `D := H_v`, `E := R_v`, `hDE := H_subset_R`, proved for every `k` — this is the Lean source's realisation of `q_j(H,W) = i_j(H) − i_j(H−W)` (companion identity, §5 below), applied twice: at rank `p−1` and at rank `p`.
5. `leaf_indep_cap` (lines 1025–1043): every independent `A ⊆ univ \setminus H_v` has `A.card ≤ α(G) − 1`, because `v` can be adjoined (`leaf_insert_indep`, uses `hv` again for the uniqueness of `support`) and `IsIndepSet.card_le_indepNum` (Mathlib `Clique.lean:991`) bounds the extended set by `α(G)`. **This is where `α(H_v) ≤ α(G) − 1` is established** — the ℕ subtraction `α(G) − 1` is guarded by `α(G) ≥ 1` (true: `v` witnesses a nonempty independent set).
6. `leaf_tagged_monotone` (lines 1099–1134): sets `hcoeff : 2·((α(G)−1) − k) ≤ k`. This is exactly the guard: `hTail : 2α(G)+1 ≤ 3p` combined with `k = p−1` gives `2(α(G)−1−k) = 2α(G) − 2 − 2k = 2α(G) − 2p ≤ 3p − 1 − 2p = p − 1 = k` (integer arithmetic; the ℕ form is guarded by `k ≤ α(G) − 1`, checked by the `by_cases hbig` split at line 1113 — if `k > α(G)−1` both tagged families are empty by `tagged_zero_above_leaf_cap`, entry 42 lines 1086–1097, using `leaf_indep_cap` again).
7. Apply `taggedShadowBound` (entry 41) with `U := univ \setminus H_v`, `W := R_v`, `a := α(G)−1`, this `k`; `hcap` is exactly `leaf_indep_cap`. **This is where `hBip` enters** (inside `Core.card_extension_le`, line 826: `obtain ⟨c⟩ := hBip` extracts the 2-colouring used to split the addable set into two independent-preserving colour classes, lines 827–848) — nowhere else in the leaf-term proof.
8. Combine: `k·q_p ≤ 2(α(G)−1−k)·q_{p−1} ≤ k·q_{p−1}` (step 6's `hcoeff` applied to `Nat.mul_le_mul_right`), then divide by `k ≥ 1` (`hk`) to get `q_p ≤ q_{p−1}` (a monotone comparison of **counts**, never a division of a possibly-zero count — no division by `q_k` occurs anywhere, matching `CANDIDATE-PROOF.md` step 3's explicit disclaimer).
9. `leaf_term_nonpos`: substitute `q_p − q_{p−1} ≤ 0` (step 8) into `tagged_count_split`'s two instances (step 4) to get `Δ_{p−1}(H_v) − Δ_{p−1}(R_v) = q_p − q_{p−1} ≤ 0`. Closed by `omega` (pure integer linear arithmetic once the two split identities and the count inequality are in context).

Every ℕ-subtraction in this branch: `p−1` (guarded by `hp : 1 ≤ p`, in fact `2 ≤ p` here), `α(G)−1` (guarded by `α(G) ≥ 1`, from the leaf), `(α(G)−1)−k` (guarded by the `by_cases hbig` split, entries either discharge it as zero via `tagged_zero_above_leaf_cap` or it is a genuine nonneg difference). Every cast: the final inequality is stated in ℤ (`C5LA1.forwardDifferenceDel` returns `Int`), the intermediate `taggedShadowBound` combinatorics stay in ℕ and are combined via `omega`/`nlinarith`, which discharge the ℕ→ℤ correspondence automatically once the guards above hold.

## 4. Target 2, `p = 1` endpoint — new proof, every hypothesis named

This is NEW work (not present in the compiled source; `FINAL-ANALYSIS.md` and `C2-SCOPE-AUDIT.md` §2 both flag it as the open gap: "At `p = 1`, key 1's `k ≥ 1` premise is unavailable").

**Claim.** For finite bipartite `G` (`hBip`), original leaf `v` with support `s` (`hv`), at `p = 1`, if `3·1 ≥ 2α(G)+1` then the term is `0`.

**Proof.**
1. The guard at `p=1` reads `3 ≥ 2α(G)+1`, i.e. `α(G) ≤ 1` (integer arithmetic on `hTail`; no ℕ-subtraction is involved in this step, only a linear inequality).
2. `v` is a degree-one vertex, so `{v}` is an independent 1-set: `α(G) ≥ 1`.
3. Hence `α(G) = 1` exactly.
4. **Where bipartiteness enters**: a bipartite graph with `α(G)=1` has `|V(G)| ≤ 2`. Proof: let `(X,Y)` be the 2-colouring classes (`hBip` gives `G.Colorable 2`, i.e. `IsBipartite` per `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean:286`, `abbrev IsBipartite (G) := G.Colorable 2`). Each colour class is independent (no edges inside a colour class, by definition of a proper colouring), so `|X| ≤ α(G) = 1` and `|Y| ≤ α(G) = 1`; `V = X ∪ Y` (colouring is total), so `|V| ≤ 2`. This is the exact step the SOLUTION-CONTRACT's guiding text asks to be named: bipartiteness enters through "two vertices of one colour class are non-adjacent" — precisely the independence of each colour class.
5. `G` has an edge (`v` is a leaf, adjacent to `s`), so `|V(G)| ≥ 2`. Combined with step 4, `|V(G)| = 2`, `V(G) = \{v,s\}`, and (since `\{v,s\}` is an edge and there are no other vertices) `G ≅ K_2` on this vertex pair. This matches `SEMANTIC-CONTRACT.md`'s "a bipartite graph with `α=1` has at most two vertices... so `V = {v,s}` and `G = K_2`" exactly.
6. `H_v = G − \{v,s\} = \emptyset` (0 vertices as a deletion set covering all of `V`), `R_v = G − N[s] = G − \{v,s\} = \emptyset` as well (since `N[s] = \{v,s\}` when `|V|=2`). So `H_v = R_v` as deletion sets.
7. `Δ_0(H_v) = i_1(\emptyset) − i_0(\emptyset) = 0 − 1 = −1`; identically `Δ_0(R_v) = −1`. **Term `= −1 − (−1) = 0`.**

This is verified computationally in §2 above on the literal `K_2` graph object (not merely asserted): `term_K2_p1 == 0` (own instrument, `is_tree`/`is_bipartite` both pass on the object first).

**General `p=1` formula (any graph with a leaf, not just the guarded case).** For ANY finite simple graph `G` with a leaf `v`, support `s`: `H_v = G − \{v,s\}`, `R_v = G − N[s]`. Since `s ∈ N[s]` and `s ∉ H_v`'s deletion set beyond `\{v,s\}`, and every non-support-non-leaf vertex of `H_v` survives in `R_v` too except `s`'s OTHER neighbours (which are removed by `N[s]` but not by `\{v,s\}`): `i_0(H_v) = i_0(R_v) = 1` (empty set always independent), `i_1(H_v) = |V| − 2` (every vertex other than `v,s`), `i_1(R_v) = |V| − 1 − \deg(s)` (every vertex outside `N[s]`, and `|N[s]| = \deg(s)+1`). So `Δ_0(H_v) − Δ_0(R_v) = [i_1(H_v)-1] - [i_1(R_v)-1] = i_1(H_v) - i_1(R_v) = (|V|-2) - (|V|-1-\deg(s)) = \deg(s) - 1`. This is confirmed computationally at every `m=2..8` on `K_{1,m}` (§2 above: `direct_term == deg(s)-1` at `p=1`, all 7 checks pass), where `\deg(s) = m \geq 2`, giving a strictly POSITIVE term — confirming `SEMANTIC-CONTRACT.md`'s statement that the endpoint is true only because the guard forces `K_2` (`\deg(s)=1` there, term `=0`), and that on a general bipartite graph at `p=1` the term is `\deg(s)-1 \geq 0`, not automatically `\leq 0`.

## 5. Target 1 (TSB): registry-form derivation

**Internal** (entry 41, `E993Interior.taggedShadowBound`): `∀ U W : Finset V, ∀ a k : ℕ, (hcap : ∀ A ⊆ U, IsIndepSet A → A.card ≤ a) → 1 ≤ k → k·(taggedFamily G U W (k+1)).card ≤ 2·(a−k)·(taggedFamily G U W k).card` (ℕ).

**Registry form** (`SOLUTION-CONTRACT.md` §2 `bipartiteTaggedShadowBound`): `hBip`, `W : Finset V`, `1 ≤ k ≤ H.indepNum`, conclusion in ℤ with `H.indepNum` in place of `a`, `Finset.univ` in place of `U`.

**Derivation.**
1. Instantiate `U := Finset.univ`.
2. Instantiate `a := H.indepNum`.
3. Discharge `hcap` by `SimpleGraph.IsIndepSet.card_le_indepNum` (Mathlib, `Mathlib/Combinatorics/SimpleGraph/Clique.lean:991`: `[Finite α] {t : Finset α} (tc : G.IsIndepSet t) : t.card ≤ G.indepNum`) — this discharges the internal lemma's `U`-relative cap generically, for ANY `A ⊆ univ` (trivially satisfied) that is independent, without any further hypothesis; this closes the extraction gap noted in the distinction table.
4. Add `hka : k ≤ H.indepNum` as a new registry-level hypothesis. It is not needed to typecheck step 3's application (`card_le_indepNum` holds unconditionally for independent sets), but it makes the ℕ truncated subtraction `a − k` inside the internal statement equal the integer value `H.indepNum − k` used in the registry's ℤ statement — i.e. it is exactly the guard `CLAIM-DISTINCTIONS`/`SEMANTIC-CONTRACT.md` §3 calls out ("`k ≤ a` in ℕ ... guarded by the hypotheses that make them equal the integer values"). Without it the statement is still TRUE (both sides are computed correctly by ℕ truncation, and for `k > a` the tagged families are empty on both sides, `0 ≤ 0`, per `CANDIDATE-PROOF.md` step 2's "for `k>h`, both `q_k` and `q_{k+1}` vanish"), but the registry text's presence of `1 ≤ k ≤ a` matches the Lean signature exactly only with `hka` added.
5. Recast: `(k:ℤ)·q_{k+1} ≤ 2·((a:ℤ)−k)·q_k` follows from the ℕ inequality of step 1–3 by `Nat.cast_le` / `omega` — a direction-preserving cast, no new arithmetic content, valid unconditionally (ℕ `≤` casts to ℤ `≤` always).

**Extraction finding (flagged, not resolved — an F1-scope literal-hypothesis question).** Reading `Core.tagged_deletions_lower` (lines 854–887) and `Core.tagged_extensions_upper` (lines 888–938), NEITHER private helper consumes `hk : 1 ≤ k` — `tagged_deletions_lower`'s signature (line 854–857) has no `hk` parameter at all, and `tagged_extensions_upper`'s signature (line 888–891) likewise has none; the final `nlinarith [hcount]` (line 957) closes directly from `Finset.card_nsmul_le_card_nsmul`'s output without using `hk` either. So in the EXTRACTED proof, `hk` is a hypothesis of the outer statement's signature that is not found to be consumed by the proof body. This is consistent with (not a contradiction of) the mathematics — at `k=0` the claimed inequality `0 ≤ 2a·q_0` is true trivially since `q_0 = 0` by the `taggedFamily` definition (a 0-subset can never meet a nonempty `W`, and if `W=∅` both sides are still `0≤0`) — but it means the registry text's `1 ≤ k` guard is, on this reading, not load-bearing for the Lean proof obligation itself. Whether a Lean statement WITHOUT the `k ≤ a` clause (or without `hk`) differs operationally from the registry text is exactly the class of question `C1-ALLOCATION.md` assigns to F1 ("the registry text '1 ≤ k ≤ a' vs a Lean text without `k ≤ a`"); T1 reports the finding and does not resolve it.

**Companion identity** `q_j(H,W) = i_j(H) − i_j(H−W)`. This is `tagged_count_split` (entry 42, lines 1045–1084) specialised at `D := ∅`, `E := W`: `indepSetCount G ∅ k = (taggedFamily G (univ\∅) W k).card + indepSetCount G W k`, i.e. `i_k(H) = q_k(H,W) + i_k(H−W)` (since `univ\∅ = univ` and `H−W` realises `indepSetCount G W`), rearranged to `q_k = i_k(H) − i_k(H−W)`. Proved directly (no new hypotheses beyond `D ⊆ E`, here `∅ ⊆ W` trivially) by partitioning `indepSetsAvoiding G D k` into the tagged and untagged parts (`Finset.card_filter_add_card_filter_not`, line 1081) and showing each part equals the claimed Finset (`htag`/`havoid`, lines 1053–1080) via `Finset.mem_filter`/`Finset.mem_powersetCard` unfolding and `tauto`. Verified computationally in §0/§2's instrument on 4 named graphs across all `W` and `j=0..n+1` (52 rows, all match; see script section "tagged_count_split").

## 6. Target 3 (ELIG): step-by-step derivation with every hypothesis named

**Statement**: `hT : G.IsTree`, `hInterior : crossingIndex(G) + 2 ≤ indepNum(G) − 2` (ℕ) `⊢ 7 ≤ indepNum(G)`.

1. `ha4 : 4 ≤ α(G)` — `omega` from `hInterior` directly. The ℕ-truncated subtraction `indepNum − 2` is handled correctly by `omega`'s native ℕ-subtraction semantics: if `α(G) < 2` the right side is `0`, forcing `crossingIndex + 2 ≤ 0`, impossible since `crossingIndex : ℕ ≥ 0` gives `crossingIndex+2 ≥ 2`; so `α(G) ≥ 2` is forced first, and then `crossingIndex+2 ≤ α(G)-2` (now the honest integer statement) forces `α(G) ≥ 4`.
2. `hn : α(G)+1 ≤ |V(G)|` — `Guard.order_ge_alpha_succ` (lines 1231–1255), needs `hT` (specifically `hT.card_edgeFinset`, the BUNDLED tree fact "a tree has exactly `n−1` edges", which packages BOTH `hT.connected` and `hT.isAcyclic` — Mathlib `SimpleGraph.IsTree` is `structure IsTree extends connected : G.Connected where isAcyclic : G.IsAcyclic`, `Acyclic.lean:60,56`; the specific fact used is `IsTree.card_edgeFinset`, `Acyclic.lean:296`) and `2 ≤ α(G)` (from step 1). Proof by contradiction: if `|V| ≤ α`, the maximum independent set `S` (existence: `G.exists_isNIndepSet_indepNum`, Mathlib) has `|S| = α ≥ |V|`, forcing `S = V` (all vertices independent), forcing `edgeFinset = ∅` (any edge would violate independence of `S=V`); but `hT.card_edgeFinset` says `|edgeFinset| = |V|-1`; combined with `|edgeFinset|=0` gives `|V|=1`, contradicting `α ≥ 2 > 1 = |V| \geq \alpha`.
3. `hc : Δ_{x(G)}(G) < 0` — `Guard.crossing_negative`, definitional (`Nat.find_spec` on entry 14's existence proof, no new hypothesis).
4. `h0 : 0 ≤ Δ_0(G)` — `Guard.delta_zero_nonneg`, needs `2 ≤ |V(G)|` (from steps 1–2, since `α≥4⟹|V|≥5≥2`). Uses `count_bridge`/`delta_bridge` (entries connecting `C5LA1` counts to `Erdos993G1.indepCount`, both `∅`-deletion so purely definitional rewriting) plus `indep_count_zero=1`, `indep_count_one=|V|`: `Δ_0 = |V|-1 \geq 0` for `|V|\geq 2` — no `IsTree` needed for THIS particular step (only finiteness).
5. **Exclude `α=4`**: forces `crossingIndex=0` (from `hInterior`: `0+2\le 4-2=2`... precisely `crossingIndex \le 0`), contradicting `hc` combined with `h0` (`Δ_0 <0` and `Δ_0\ge0` cannot both hold).
6. **Exclude `α=5`**: forces `crossingIndex \le 1`; need `h1: 0\le\Delta_1(G)`, `Guard.delta_one_nonneg`, needs `hT` (via `hT.card_edgeFinset`, the `n-1`-edges fact again) and `6\le|V|` (from `hn` at `\alpha=5`: `|V|\ge6`). Derivation: `i_2(T)+|E|=\binom{|V|}{2}` (`Erdos993G1.indepCount_two_add_edges`, a purely combinatorial double-count, no acyclicity needed) combined with `|E|=|V|-1` (the tree fact) gives `i_2(T) = \binom{|V|}{2}-(|V|-1)`, matching `SEMANTIC-CONTRACT.md`'s stated identity EXACTLY and independently confirmed by this route's own instrument (§2/§7 below: `tree_i2_identity`, all matches). `\Delta_1 = i_2-i_1 = \binom{|V|}{2}-(|V|-1)-|V| = \binom{|V|}{2}-2|V|+1 \ge 0$ for `|V|\ge6` (via the `scaledChooseTwo` identity `2\binom{n}{2}=n(n-1)$ and `nlinarith`).
7. **Exclude `α=6`**: forces `crossingIndex\le2`, `|V|\ge7`; need `h2:0\le\Delta_2(G)`. Two sub-branches on `|V|`:
   - `|V|\ge9`: `Guard.delta_two_nonneg_large`, uses `hT.isAcyclic` (STANDALONE, not the bundled tree fact) inside `Erdos993G1.indepCount_three_add_edge_incidence` (entry 34) — specifically via `triple_local_identity` (entry 31, line 521-524: `hF.cliqueFree (by omega:3\le3)` rules out a triangle among any 3-vertex subset — this is where acyclicity is used on its OWN, separate from connectivity, matching the brief's demand to name connectivity/acyclicity "separately"). Gives `\Delta_2=\frac{(n-1)(n-2)(n-9)}{6}+D$, `D=\sum_u\binom{\deg u}{2}\ge0`; both terms `\ge0$ for `n\ge9`.
   - `|V|\in\{7,8\}`: uses the tree's bundled `n-1`-edges fact again PLUS an explicit vertex-cover argument (`cover_degree_one`/`cover_degree_two`, using `hS.isIndepSet` and `edge_cover_subset`, itself independent of acyclicity — a pure independence-cover argument) to bound `D\ge15$ (`n=7`, one-vertex cover forces `\deg\ge6`) or `D\ge9$ (`n=8`, two-vertex cover forces `\deg(u)+\deg(w)\ge7`), giving `\Delta_2\ge5$ or `\ge2$ respectively.
8. `crossingIndex\in\{0,1,2\}$ all contradict `hc$ once `h0,h1,h2\ge0$ are all in hand, so `\alpha\ne6$.
9. Steps 5, 6, 8 exhaust `\alpha\in\{4,5,6\}$ (from `ha4$ and the `by_contra$ assumption `\alpha\le6$), all excluded, so `\alpha\ge7$.

Every ℕ-subtraction: `indepNum-2$ (guarded by `\alpha\ge2$, itself forced before use, step 1), `crossingIndex$ comparisons (`\text{Nat.find}$, no subtraction), `n-1,n-2,n-9$ inside the `\Delta_2$ formula (guarded by `n\ge9$ in that branch; the `n\in\{7,8\}$ branch avoids the formula entirely and uses the cover bound instead). No cast beyond `\mathbb{N}\to\mathbb{Z}$ for the count identities (`Erdos993G1.indepCount$ is `\mathbb{Z}$-valued by definition, entry 15, to allow signed differences).

## 7. Additional numeric confirmation: `i_2(T) = C(n,2) − (n−1)` on trees

Own instrument (§2's script, section `tree_i2_identity`), Prüfer-sequence-generated (`heapq`-based decode, exact/deterministic, no randomness) labelled trees, EACH independently confirmed a tree by the acyclicity-and-connectivity test before use: `n=2` (1 tree, the sole labelling), `n=3..7` (path and star plus, for `n\ge4`, the first 40 lexicographic Prüfer sequences decoded — capped, non-exhaustive, horizon stated exactly). 145 tree instances total, `i_2(T)` computed by brute-force independent-2-set enumeration on the ORIGINAL vertex set (never a formula), compared against `C(n,2)-(n-1)`: **all 145 match** (`tree_i2_identity_all_match: true` in `fixed_points.out.json`).

## 8. Grades

| Claim | Grade | Basis |
|---|---|---|
| (TSB) `E993-BIPARTITE-TAGGED-SHADOW-BOUND` | `proved_informal` | Registry-form derivation §5, complete and hypothesis-complete; corroborated by `bounded_computation` (own instrument, 156 spot-check rows, all hold, non-exhaustive); NOT `formally_verified` — no Lean kernel check performed in this route (U1's task) |
| (HTP) `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, `p\ge2` | `proved_informal` | §3, extracted and re-derived faithfully from the compiled internal lemma |
| (HTP), `p=1` endpoint | `proved_informal` | §4, NEW derivation this route, corroborated by own-instrument computation on `K_2` and the general `\deg(s)-1$ formula confirmed on `K_{1,2..8}$ |
| (HTP), full statement `p\ge1$ | `proved_informal` | union of the two grades above; weakest-input rule (`SOLUTION-CONTRACT.md` §4) keeps it at `proved_informal`, not `formally_verified` |
| (ELIG) `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` | `proved_informal` | §6, extracted faithfully from the compiled Lean proof; the load-bearing identity `i_2(T)=C(n,2)-(n-1)$ independently confirmed (`bounded_computation`, §7, 145/145 match, non-exhaustive) |
| entries 41-44 (compiled internal) | **no grade of its own** | `SOLUTION-CONTRACT.md` §4: "a compiled internal lemma inside another award's package has NO grade of its own until its own certificate closes" |
| `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, `E993-R26-TOP-RANK-RESIDUAL-SIGN` | `formally_verified` (unchanged) | inputs, never re-graded by this route |

No certification in this return is strengthened beyond its evidence: nothing here is reported as `formally_verified`, and the `bounded_computation` corroborations are explicitly labelled non-exhaustive with their exact attained horizon (never presented as a filter/asymptotic bound).

## 9. Alias check — lexical AND mathematical (separate step)

Queried `sources/authority/CLAIM-IDENTITY.json` (407 claims, `claim_key`/`statement`/`scope`/`aliases` fields) for every claim whose statement, scope, or alias list contains any of: `tagged`, `shadow bound`, `addable`, `eligib`, `high-tail`/`high tail`, `bipartite` (45 distinct matches). Reviewed the mathematically closest matches individually:

- `E993-BF-1` (VERIFIED) — "layer-4 shadow bound's exact reach is `|U|\le2p-3`..." — a DIFFERENT "shadow bound" (about the reach of a layer-4 construction on a set `U`, a design-target inequality's failure diagnosis, not an independent-set-count comparison). Not an alias, lexically or mathematically, of (TSB).
- `E993-CAND-R18C1T1-1` (REFUTED) — "the epsilon-discount bound (design-target inequality discounting the shadow bound by epsilon on G2)" — a rejected mechanism candidate from a different run (R18), not a target claim, unrelated statement. Not an alias.
- `E993-C3-GRAPH-ADDABLE-VERTEX-AVERAGE-IDENTITY` (VERIFIED) — "`\sum_S e(S) = (r+1)i_{r+1}(G)`" (a total/averaging identity over ALL independent `r`-sets of the whole graph, no bipartite/colour-class structure, no `W`-tag). Mathematically adjacent (addable vertices) but a distinct object from (TSB)'s tagged, colour-class-split count comparison. Not an alias; noted in §0 as a related-but-distinct identity, not used by this route's proof.
- `E993-PAIR-ALPHA-FLOOR` (VERIFIED) — "`\alpha(F)\ge\lceil n/2\rceil`" via forest-bipartite colour class — the SAME underlying fact (a forest/bipartite graph's larger colour class is independent) is used as an INGREDIENT inside `taggedShadowBound`'s `Core.card_extension_le` (my §5 step 3 above), but the REGISTERED claim itself is about `\alpha(F)` vs `n`, not about tagged-set incidence counts; not a statement-level alias of (TSB).
- `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (REFUTED), `E993-BETA-TARGET` (REFUTED), `E993-BETA-AGG-SUPPORT` (REFUTED) — addressed in §0 with the "why distinct" required by brief item 3.
- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN) — addressed in §0.
- No claim in the 407-row registry states (TSB), (HTP), or (ELIG) verbatim or as a mathematical equivalent; none of `E993-BIPARTITE-TAGGED-SHADOW-BOUND`, `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` collide with any other `claim_key` or `aliases` entry (each is `OPEN`, `aliases: []` in the registry as read).

Conclusion: no new claim identity conflict found. The three run-local objects T1 worked on keep their existing OPEN registry identities; this route registers no new `E993-R29-…` key (T2 owns the two genuinely new run-local keys, (HTA)'s and (TRN)'s).

## 10. `headline_resolved`

`headline_resolved: no`

(Per `SOLUTION-CONTRACT.md` §5 and `C1-WORKER-COMMON-BRIEF.md` item 6: the headline is all four targets `formally_verified`, which is Stage 7's outcome, not any single route's.)

## 11. Route verdict

`route_verdict: proved_conditional`

Rationale: (TSB), (HTP) (including the newly-proved `p=1` endpoint), and (ELIG) are each given complete, hypothesis-complete, statement-level informal proofs at registry scope (`proved_informal` grade, §8) — not merely bounded computation and not yet a Lean kernel certificate. "Conditional" here reflects that formal (Lean/kernel) verification of the registry-scope statements is outstanding (U1's task, and the governed award workflow the controller invokes after synthesis); none of the three targets is `refuted`, `blocked`, or merely `compiled` (they exceed compiled-internal: the registry-scope gaps identified in §1 are closed informally, not merely restated).

## Remaining obligation

Written as what a successor inherits:

1. **Lean formalization of the registry-scope statements.** (TSB): instantiate `U:=univ`, `a:=H.indepNum`, discharge `hcap` via `IsIndepSet.card_le_indepNum` (`Clique.lean:991`), add `hka:k\le H.indepNum`, cast to ℤ (§5) — mechanical, no new mathematical content. (HTP): formalize the NEW `p=1` case (§4) as a Lean lemma (`α(G)=1 \Rightarrow |V|\le2` from `hBip`/`Colorable 2`, then the direct `K_2` computation) and compose with the existing `p\ge2` body (entry 42's `Leaf.leaf_term_nonpos`, generalizing `hp:2\le p` to `hp:1\le p` with a case split at `p=1`). (ELIG): byte-identical re-export of entry 43, per the distinction table — no new proof content, only the registrar carry. This is U1's assigned object; T1 supplies the informal proofs and the exact identity of every Mathlib lemma and entry number needed.
2. **The `hk`/`k\le a` literal-hypothesis question flagged in §5** (whether the compiled `taggedShadowBound`'s `hk:1\le k` is actually load-bearing, since neither `Core.tagged_deletions_lower` nor `Core.tagged_extensions_upper` consumes it) is unresolved by this route and is explicitly F1's assigned class of question (`C1-ALLOCATION.md` item 3(d): "the registry text '1 ≤ k ≤ a' vs a Lean text without `k ≤ a`").
3. **(HTA)'s own certificate and T2's (TRN)** are not this route's object; T1 supplies the `p=1` leaf-term proof (HTA) needs to close at every `p\ge1$ (not just `p\ge2$), and the compiled-internal distinction table (§1) T2 can cite directly for (TRN)'s relation to entry 44.
4. **No boundary-sharpness claim is made here** (F1's object); §2's star computation ("sign first fails at `p=\lceil m/2\rceil-1`") is offered only as a corroborating fixed point for (HTP)'s statement, not as input to any boundary determination.
5. **Registration**: (TSB), (HTP), (ELIG) keep their existing `OPEN` registry identities (`formal_award:false`) until a governed Lean award closes each separately (fence `SOLUTION-CONTRACT.md` §3.8) — this route registers nothing new and changes no status.

## Background jobs

None were launched by this route (every computation in §2/§7 ran synchronously in the foreground and completed in well under a second); nothing to kill or poll.

## Model disclosure

chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5.
