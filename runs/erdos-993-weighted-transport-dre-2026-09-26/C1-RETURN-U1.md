# RETURN — Seat U1, Cycle 1, r30 (erdos-993-math-dre-20260926-r30-weighted-transport)

Route `C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION`, orientation U (formal/structural).
Load-bearing obligation: `control/C1-ALLOCATION.md`, numbered item 5 ((a) supermodularity /
invariant-maximizer / reduction theorem; (b) compression-uncrossing; (c) orbit quotient of the
smallest eligible `CB(d,m)` including switch exits; (d) fixed points).

Model disclosure (two-part): chartered Claude Sonnet 5, xhigh; transport-resolved model
`sonnet` (explicit parameter, per `AUTHORIZATION.md`'s transport probe of 2026-09-26); runtime-
reported model id: `claude-sonnet-5`.

## 0. Boot acknowledgment

VerityOS booted per the dispatch's restricted boot (not the full startup-protocol map): read
exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file (memory,
conversations, modules, skills, logs, decisions were NOT read — the controller has booted for
the run). No `## Read-boundary disclosure` items this cycle; see §9 for the exact read list.

## 1. Seal and digest verification

Stage 2 packet manifest `control/C1-STAGE2-PACKET-MANIFEST.json` (1006 files): recomputed
SHA-256 of the canonical JSON (the manifest with `seal_sha256` removed, `sort_keys=True`,
`separators=(",",":")`, no trailing newline) —

```
recomputed = 886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92
recorded   = 886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92
match: True
```

`control/SOURCE-DIGESTS.json` (schema `verityos.r30.source-digests.v1`, 981 files) and the
Stage 2 manifest were used to verify every source file read in this return by exact SHA-256
before reading it; every check passed (`OK`, no mismatches). Digests of every source read are
listed inline at first citation below and again in §9.

## 2. Registered claims named before any census (SEMANTIC-CONTRACT / SOLUTION-CONTRACT / claim
registry)

Before reporting any numeric row, this route names every registered claim its work touches or
could be mistaken for:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. Not touched: this route
  proves a *conditional structural reduction* between the original transport network's
  Hall-condition and a symmetry quotient's Hall-condition; it asserts nothing about whether
  (HALL) holds on any tree, and resolves no instance of (HALL) except the one small computed
  case in §5 (which is `bounded_computation`, not universal).
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — OPEN at Stage 1/2 (run-local,
  435th claim). Not proved here (that is F2/U2's assigned target, from the bijection
  `B ↦ B∖{v}`); this route only *uses* the identity as stated in SEMANTIC-CONTRACT §1.2 as an
  independent numeric cross-check (`supply − capacity = S(T,p)`, computed by two disjoint code
  paths — orbit weight totals vs. the leaf-tag `q_v` formula — in §5).
- **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` — VERIFIED `proved_informal`. Used
  and extended, not re-proved as registered: LIFT's registered statement is the one-directional
  "quotient saturating flow ⇒ original saturating flow" plus a remark that its own proof's
  supermodular-maximizer argument gives an invariant-cut existence corollary "once stated." This
  route independently re-derives that argument from scratch (§4) and generalizes it from the
  specific group `S_3≀S_m` of `T_m` (C6-T5) to an ARBITRARY finite group preserving the relation
  and weights, proves the maximizer-lattice property explicitly, and packages the full
  biconditional (both directions, with LIFT supplying one and the stated-but-unproved "elementary
  converse" supplying the other) as a single new candidate theorem. LIFT itself is not touched.
- **(DCB)** `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` — VERIFIED `proved_informal`. Not
  used, not touched (this route did not pursue the budget `D+C ≥ (2α+1−3p)Q`; that is T2's route).
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** (`E993-R23-LITERAL-DELETE-
  ONLY-HALL`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`,
  `E993-R23-HOT-TAG-SINGLETON-HALL`, `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`,
  `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`, `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-
  INJECTIVITY`, `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`, `E993-LOWER-REGION-
  C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`, `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-
  COVARIANCE`) plus `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, `E993-R28-TREE-LEAF-SLOT-DOMINANCE`
  and the C6-F4 own-support unit-capacity rule — **none is revived**. All ten (plus the two extra
  listed items) assert or refute a *specific* Hall/matching/injectivity/domination statement for
  a *specific* (usually wrong) weight or relation. This route's new statement (§4) makes no claim
  about whether any Hall-type inequality holds on any tree; it is a mechanism-neutral structural
  fact about supermodular set functions and finite group actions, applicable equally whether
  (HALL) later turns out true or false. It cannot be, and is not claimed to be, equivalent to any
  of these keys.
- **`T_m`/spider/path-star family theorems, the high tail, the order bands `n ≤ 2p+2`** — CLOSED,
  cited by attribution only in §6, never re-proved, never re-derived, never used as a step in a
  proof of anything in this return.
- Alias check for the new candidate key proposed in §4 (`E993-R30-INVARIANT-DEFICIENT-CUT-
  REDUCTION`): performed against `control/CLAIM-IDENTITY.run-local.json` (435 claims; SHA-256
  `86f94811fdea6cd71d153b16060e630db478c5bcffe82a7f952679327aef0fc4`, matches
  `SOURCE-DIGESTS.json` and the Stage 2 manifest) and `control/CLAIM-DISTINCTIONS.json` (SHA-256
  `a257ebbccb15e9f60ddcf7a697112969c3579bfaaa9f5e943a7f26e23e4783c3`, matches). Lexical search
  (substring match on claim key + statement text, case-insensitive) for `INVARIANT`,
  `SUPERMODULAR`, `ORBIT`, `REDUCTION`, `LIFT`, `QUOTIENT`, `COMPRESSION`, `UNCROSSING` returned
  20 hits (listed in `scratchpad/c1-U1/` session transcript); mathematical inspection of every
  hit found no claim asserting supermodularity of a transport deficit function, a lattice of
  deficit-maximizers, or a biconditional between original and orbit-quotient Hall-conditions for
  an arbitrary finite automorphism subgroup. The nearest is (LIFT) itself (distinguished above).
  No collision. Candidate for registration, **STATED, not yet registered** (needs an isolated
  second read per SOLUTION-CONTRACT §4: "a statement first made at a review stage is STATED and
  needs an isolated second read before registration").

## 3. IMPORT LIST (every script; standard library only; no network; no package installs)

`sys`, `json`, `hashlib`, `itertools.combinations`, `math.comb`, `math.factorial`,
`collections.deque`, `dataclasses.dataclass` (only inside the already-authorized, digest-verified
`sources/lower-region/inputs/ordinary_tree_checked.py`, which this route read but did **not**
import into its own instrument — see §9). This route's own five scripts import only each other
and the standard library.

## 4. Derivation: supermodularity, the maximizer lattice, and the invariant-cut reduction theorem

This is the route's primary (item 5(a)) deliverable: a full re-derivation, from the bare
definitions of SEMANTIC-CONTRACT §1.2, of the supermodular-maximizer argument that C6-T5 used
only for `T_m`'s specific group `S_3≀S_m` (`sources/lower-region/cycle-6/C6-T5/REPORT.md`, SHA-256
`9f2ef2ca0f2df9e25c9a9f8c52344fb85e39957cd36cdc729297abff3d587df3`), generalized to an arbitrary
finite group and packaged as a standalone theorem with an exact scope statement.

### 4.1 Setup

Fix a finite ordinary tree `T` (`IsTree`: connected **and** acyclic, checked separately — every
tree object in this return's code passes an explicit `is_tree` test combining an edge-count
check `|E| = n−1` with a BFS connectivity check; see §5, §7) and an eligible rank `p`
(`x(T) + 2 ≤ p`, `3p < 2α(T) + 1`, both ℕ-inequalities, no subtraction). Let `F = F_p(T)` be the
fixed original selector, `w_F` the active-tag weight of SEMANTIC-CONTRACT §1.2, and
`R = (D) ∪ (S) ⊆ I_{p+1}(T) × I_p(T)` the literal deletion/two-for-one relation. For
`X ⊆ I_{p+1}(T)` write `N(X) = {A ∈ I_p(T) : ∃ B ∈ X, (B,A) ∈ R}` and

```
φ(X) := Σ_{B∈X} w_F(B) − Σ_{A∈N(X)} w_F(A).
```

`(HALL-COND)` holds on `T` at `p` iff `φ(X) ≤ 0` for every `X`.

### 4.2 Lemma (submodularity of the reachable-capacity sum)

Claim: `c(X) := Σ_{A∈N(X)} w_F(A)` is submodular on `2^{I_{p+1}(T)}`.

Proof. For each target `A ∈ I_p(T)` let `R⁻¹(A) := {B ∈ I_{p+1}(T) : (B,A) ∈ R}` (finite, possibly
empty) and let `g_A(X) := 1` if `X ∩ R⁻¹(A) ≠ ∅`, else `0` — the indicator that `A ∈ N(X)`. Every
`g_A` is the indicator ("coverage") of a fixed set `R⁻¹(A)`, and every such indicator is
submodular: if `g_A(X∩Y) = 1` then `X∩Y∩R⁻¹(A) ≠ ∅`, so `X∩R⁻¹(A) ≠ ∅` and `Y∩R⁻¹(A) ≠ ∅`, giving
`g_A(X) = g_A(Y) = 1` and `g_A(X∪Y)+g_A(X∩Y) ≤ 2 = g_A(X)+g_A(Y)`; if `g_A(X∩Y) = 0` then either
`g_A(X∪Y) = 0` (trivial, `0 ≤ g_A(X)+g_A(Y)`) or `g_A(X∪Y)=1`, which forces `g_A(X)=1` or
`g_A(Y)=1` (since `(X∪Y)∩R⁻¹(A) = (X∩R⁻¹(A))∪(Y∩R⁻¹(A))`), giving `1 ≤ g_A(X)+g_A(Y)`. So
`g_A(X∪Y)+g_A(X∩Y) ≤ g_A(X)+g_A(Y)` in every case. Since `c(X) = Σ_A w_F(A)·g_A(X)` with
`w_F(A) ≥ 0`, `c` is a nonnegative combination of submodular functions, hence submodular:
`c(X∪Y) + c(X∩Y) ≤ c(X) + c(Y)` for all `X, Y ⊆ I_{p+1}(T)`. ∎

### 4.3 Lemma (supermodularity of φ)

`Σ_X w_F(B)` (sum over the fixed finite ground set `I_{p+1}(T)`) is exactly additive:
`Σ_{X∪Y} w_F + Σ_{X∩Y} w_F = Σ_X w_F + Σ_Y w_F` for all `X,Y` (elementary inclusion–exclusion for
a set function defined by summing a fixed weight over a subset — no inequality is needed, it is
an identity). Combining with §4.2:

```
φ(X∪Y) + φ(X∩Y) = [Σ_{X∪Y}w_F + Σ_{X∩Y}w_F] − [c(X∪Y)+c(X∩Y)]
                 ≥ [Σ_X w_F + Σ_Y w_F] − [c(X)+c(Y)]         (§4.2)
                 = φ(X) + φ(Y).
```

So `φ` is supermodular on `2^{I_{p+1}(T)}`. ∎ This holds for **any** finite bipartite relation and
**any** nonnegative integer weights on both sides — nothing tree-specific is used yet.

### 4.4 Lemma (the maximizers form a sublattice)

Let `M := max_X φ(X)` (attained, finite domain). If `φ(X)=φ(Y)=M`, then by §4.3
`φ(X∪Y)+φ(X∩Y) ≥ 2M`; but `φ(X∪Y) ≤ M` and `φ(X∩Y) ≤ M` by maximality, so
`φ(X∪Y)+φ(X∩Y) ≤ 2M`. Both bounds force equality: `φ(X∪Y) = φ(X∩Y) = M`. Hence the set of
maximizers of `φ` is closed under `∪` and `∩`: it is a sublattice of `(2^{I_{p+1}(T)}, ∪, ∩)`. ∎
(This is the fact stated without a name in C6-T5's report; here it is stated and proved as a
standalone lemma, for arbitrary `T`, `p`, `F`.)

### 4.5 Fact: `Aut(T)` always preserves `F_p(T)`, `R`, and `w_F`

For **any** finite tree `T` and eligible `p`, and any `γ ∈ Aut(T)`:

- `γ` preserves degree, hence maps `leafSet(T)` to itself and each leaf `v` to a leaf `γv` with
  `γ(support(v)) = support(γv)` (the support is "the unique neighbour of a degree-1 vertex," an
  isomorphism-invariant notion).
- `γ` restricted to `V∖{v}` is a graph isomorphism `T−v ≅ T−γv`, so the two graphs have identical
  independence polynomials and identical `Δ_p`; hence `v` favorable (`Δ_p(T−v)<0`) iff `γv`
  favorable. So `γ(F_p(T)) = F_p(T)` — **automatically**, for every finite tree, with no extra
  hypothesis.
- `γ(W_v) = γ(N(s_v)∖{v}) = N(γs_v)∖{γv} = W_{γv}`, so for `v ∈ F∩B`: `v` active in `B`
  (`(B∖{v})∩W_v ≠ ∅`) iff `γv` active in `γB`. Hence the active-tag set of `γB` equals
  `γ(`active-tag set of `B)` as a set, so `w_F(γB) = w_F(B)` for every `B`.
- `(D)` and `(S)` are stated purely via graph adjacency (`A=B∖{q}`; `A=(B∖N(u))∪{u}` for `u∉B`
  with `|N(u)∩B|=2`), so any automorphism carries `R`-arcs to `R`-arcs: `(B,A)∈R ⟺ (γB,γA)∈R`.

So **every** subgroup `Γ ≤ Aut(T)` — not only the specific `S_3≀S_m` used for `T_m` in C6-T5 —
satisfies the hypotheses "preserves the relation and the (invariant, nonnegative integer)
supplies/capacities" of (LIFT), for every finite tree `T` and every eligible `p`, with no extra
verification needed per tree. This is a genuine generalization beyond C6-T5's single computed
family.

### 4.6 Theorem (invariant deficient-cut existence; generalizes C6-T5)

Let `Γ ≤ Aut(T)` be any finite subgroup (by §4.5, always admissible). If `max_X φ(X) > 0` (an
original deficient cut exists somewhere), there is a `Γ`-invariant `X* ⊆ I_{p+1}(T)`
(`γX* = X*` for every `γ ∈ Γ`) with `φ(X*) = max_X φ(X) > 0`.

Proof. By §4.5, `φ(γX) = φ(X)` for every `γ, X` (reindexing the two sums by the bijection `γ`
and using `w_F∘γ = w_F`, `N(γX)=γN(X)`). So if `X₀` maximizes `φ`, so does `γX₀` for every
`γ ∈ Γ`. By §4.4 the maximizers are closed under finite intersection, so
`X* := ⋂_{γ∈Γ} γX₀` (a finite intersection, `Γ` finite) is again a maximizer: `φ(X*) = M`. `X*`
is `Γ`-invariant: for `δ ∈ Γ`, `δX* = ⋂_γ (δγ)X₀ = ⋂_{γ'∈Γ} γ'X₀ = X*` (reindexing `γ' = δγ`, a
bijection of `Γ` since `Γ` is a group). Since `M = max φ ≥ φ(X₀) > 0` for whatever `X₀` witnessed
positivity, `φ(X*) = M > 0`. ∎

**Numeric sanity check** (not a proof, an independent spot-check of §4.3 on a concrete instance):
`scratchpad/c1-U1/supermodularity_check.py` builds `CB(1,1)` (own from-scratch construction, `is_tree`
checked), takes `F` = every original leaf (not filtered by favorability — the lemma holds for any
finite `F` of degree-one vertices), and at `p=1` (source layer `I_2`, 10 sets; target layer `I_1`,
6 sets) exhaustively tests the supermodularity inequality over **all** `1024 × 1024 = 1,048,576`
ordered pairs `(X,Y)` of subsets of the 10-element source layer: **0 violations**; `max φ = 2`
attained by `256` of the `1024` subsets (consistent with the maximizers forming a sublattice, not
just an antichain). SHA-256 of `supermodularity_check.py`:
`0c314f2d632373093a270415c760f460ec5ecdcc9b6213092b1bc298752e4f5f`. Replay (copy-out-first, target
`scratchpad/c1-U1-replay/`, never `/tmp`):
```
cp scratchpad/c1-U1/supermodularity_check.py scratchpad/c1-U1/cb_search.py scratchpad/c1-U1-replay/
cd scratchpad/c1-U1-replay && python3 supermodularity_check.py
```
(already executed by this route from that exact directory; output reproduced byte-for-byte).

### 4.7 Corollary — the reduction theorem (candidate key `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`)

**Statement.** For every finite ordinary tree `T`, every eligible `p`, and every subgroup
`Γ ≤ Aut(T)`: the original transport network of `T` at `p` satisfies `(HALL-COND)` if and only if
its `Γ`-orbit quotient (nodes = `Γ`-orbits of `I_{p+1}(T)` and `I_p(T)`; orbit-total
supply/capacity; an orbit arc iff some member pair is `R`-related) satisfies `(HALL-COND)` for
its own subsets (unions of orbits).

*Proof, (⇐) quotient holds ⇒ original holds.* Contrapositive: if some `X₀` has `φ(X₀)>0`, §4.6
gives a `Γ`-invariant `X*` with `φ(X*) = max φ ≥ φ(X₀) > 0`. `X*` invariant means `X*` is a union
of `Γ`-orbits; `N(X*)` is also invariant (`N(γX*)=γN(X*)=N(X*)`), so `Σ_{X*}w_F` and
`Σ_{N(X*)}w_F` are exactly the orbit-total supply and capacity sums of the quotient over the
orbits making up `X*` and `N(X*)`. So `φ(X*)>0` is a deficient cut of the quotient's own
Hall-condition — contradiction. Hence original `(HALL-COND)` holds.

*Proof, (⇒) original holds ⇒ quotient holds.* This is exactly the "elementary converse" that
SEMANTIC-CONTRACT §1.2 names but only sketches ("a saturating original flow sums to a saturating
quotient flow"): any union-of-orbits `X` is in particular an ordinary subset of `I_{p+1}(T)`, so
original `(HALL-COND)` gives `Σ_X w_F ≤ Σ_{N(X)} w_F`; since `X` and `N(X)` are both invariant,
these sums are literally the quotient's own orbit-total sums for that union of orbits. So the
quotient inequality holds for every union of orbits, i.e. quotient `(HALL-COND)` holds. ∎

By finite max-flow/min-cut (both networks are finite bipartite networks with `(HALL-COND) ⟺`
saturating integral flow exists — Hall's theorem on the clone expansion, `(HALL⇒FLOW)` of
SOLUTION-CONTRACT §2), this yields: **the original network has a saturating flow iff its
`Γ`-orbit-quotient network has a saturating flow**, for any `Γ ≤ Aut(T)`. This is a strict
completion of (LIFT): (LIFT) alone supplies only the `(⇐)` direction and explicitly disclaims
`(⇒)` ("does NOT prove quotient feasibility"); this route supplies a full, independently
re-derived proof of `(⇐)` (generalized beyond `T_m`'s specific group) together with a full proof
of `(⇒)` (elementary, but not previously written out on any face read by this route), packaged as
one theorem with `Γ` an arbitrary finite subgroup of `Aut(T)` for an arbitrary finite tree — a
genuinely broader scope than the single `S_3≀S_m` action C6-T5 computed.

**Scope and limitation (stated on the face, as the fences require).** This theorem does **not**
decide `(HALL)` for any tree: it only trades an intractable full-set flow problem for an
equivalent orbit-quotient flow problem for a chosen `Γ`. Feasibility of the quotient itself still
needs to be established (by an explicit quotient flow, as in C6-T5 for `T_m` or in §5 below for
the smallest eligible `CB(1,7)`), or refuted. The theorem is vacuous for `Γ = {e}` and most useful
for large `Γ` (few orbits). Grade: **`proved_informal`** (complete, elementary, checked proof at
statement level; no Lean formalization attempted by this route — that is U2's assigned target);
status: **STATED**, pending an isolated second read before registration as
`E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` (SOLUTION-CONTRACT §4).

## 5. Orbit quotient of the smallest eligible `CB(d,m)`, including switch exits (item 5(c))

### 5.1 Finding the smallest eligible instance

`scratchpad/c1-U1/cb_search.py` builds `CB(d,m)` directly from the literal recipe of
SEMANTIC-CONTRACT §1.2 (path `r–s–v`; `m` chokes `u_i~r`; `d` supports `b_{ij}~u_i`; one private
leaf `c_{ij}~b_{ij}`) — an independent construction, not an import of
`sources/lower-region/instruments/cb-switch-cut/run.py`'s `cb()` function (that file was read
only for understanding, per §9). Every instance is checked with an explicit `is_tree` test
(edge count `= n−1` and BFS connectivity). `x` is computed through rank `α` explicitly (the loop
range is `0..α` inclusive, using zero-extension for the out-of-range coefficient at `α+1`), never
relying solely on a library call, per the dispatch's standing caution about
`ordinary_tree_checked.py`'s `first_strict_descent`.

Scanning `d ∈ {1,2,3,4}`, `m ∈ {1,…,40}`: **144** `(d,m)` pairs have a nonempty eligible window
with at least one favorable leaf; smallest by order is **`CB(1,7)`**: `n=24`, `α=15`, `x=8`,
eligible window `[x+2, ⌊2α/3⌋] = [10,10]` — a single eligible `p=10`.

Digest of `cb_search.py`: `da4ba385640d6547c0cf41a826bfa2f9e87955ca2adfd7e692c1947b0ccfc3c3`.
Replay:
```
cp scratchpad/c1-U1/cb_search.py scratchpad/c1-U1-replay/
cd scratchpad/c1-U1-replay && python3 -c "from cb_search import search; r=search(); r.sort(key=lambda x:x['n']); print(r[0])"
```

### 5.2 Own orbit-quotient builder, including switch exits — derived and validated

`scratchpad/c1-U1/cb_orbit.py` derives, from the literal `(D)∪(S)` relation applied to `CB(d,m)`'s
adjacency, the complete orbit-transition rule set (own derivation, not copied from
`verify_orbit_flows.py`, which handles the structurally different `T_m` claw graph, not
`CB(d,m)`'s choke→support→leaf chain):

- **State** = `(arm, counts)`: `arm ∈ {E,R,S,V,RV}` (which of `r,s,v` are chosen: empty / `{r}` /
  `{s}` / `{v}` / `{r,v}` — `{s}` with `r` or `v` is impossible by adjacency); `counts` a vector
  over the fixed branch-type alphabet `E(u,v)` (choke excluded, `u` supports + `v` leaves chosen,
  `u+v≤d`, multiplicity `d!/(u!v!(d−u−v)!)`) and `I(ℓ)` (choke included, `ℓ` leaves chosen,
  multiplicity `C(d,ℓ)`); `I`-types are forced to `0` whenever `arm∈{R,RV}` (a choke cannot
  coexist with `r`).
- **Deletions**: one selected vertex removed (arm vertex, or a branch's support/leaf/choke,
  moving that branch to the "one less" type).
- **Switches** (own derivation from adjacency, four kinds): insert `r` (removing `s`+1 choke, or
  2 chokes — the two cases `arm∈{S}`, total chokes `=1` and `arm∈{E,V}`, total chokes `=2`, the
  latter landing in arm `R` or `RV` respectively depending on whether `v` was present — **`v` is
  not adjacent to `r`, so the `arm=V` case is a genuine switch exit that a naive port of the
  `T_m` case list would miss**); insert `s` (removing `r,v`, only from arm `RV`); insert a choke
  `u_i` (removing 1 support + `r`, or 2 supports, per branch); insert a branch support `b_ij`
  (removing that branch's choke and one of its chosen leaves — **a switch kind with no `T_m`
  analogue**, since `T_m`'s claws have no intermediate support vertex).

**Validation against brute force** (own `all_independent_sets` + literal `(D)∪(S)` enumeration,
`scratchpad/c1-U1/validate_orbit.py`): for **six** tiny instances — `CB(1,1)` (n=6), `CB(1,2)`
(n=9), `CB(2,1)` (n=8), `CB(1,3)` (n=12), `CB(2,2)` (n=13), `CB(3,1)` (n=10) — every rank's
orbit-state set and multiplicity is checked against a full `2^n` brute-force enumeration grouped
by state, **and** the transition set of *every single labelled member* of *every* orbit at *every*
rank is checked against the predicted `transitions()` output (not a sample — exhaustive over all
members). First pass found and this route fixed **two genuine bugs** (wrong target arm on the
"insert `r` via two chokes" switch, and a missing case for that same switch when `arm=V`); after
the fix, **all six instances pass with zero mismatches** (state multiplicities and full
transition relations, every rank, every member). Digest of `cb_orbit.py` (post-fix):
`67697fe38cd7298109a0baf678bcacb751c01a6908373e944da38f768bf5c50b`; `validate_orbit.py`:
`21357e036fded57d14168cfdf1cbc086a985ffa222c339dbec0cbd83c21a212c`. Replay:
```
cp scratchpad/c1-U1/cb_search.py scratchpad/c1-U1/cb_orbit.py scratchpad/c1-U1/validate_orbit.py scratchpad/c1-U1-replay/
cd scratchpad/c1-U1-replay && python3 validate_orbit.py
```
(already executed from that exact directory; output `ALL CASES OK: True`, reproduced identically).

### 5.3 Applying the validated builder to `CB(1,7)` at `p=10`

`scratchpad/c1-U1/final_flow.py` computes, for `CB(1,7)`, `p=10` (`n=24`, `α=15`, `x=8`,
eligibility `x+2≤p` and `3p<2α+1` both asserted True):

| graph | `p` | `x` | `α` | `\|F\|` | `Σ`supply | `Σ`capacity | `S(T,p)` |
|---|---|---|---|---|---|---|---|
| `CB(1,7)`, n=24 | 10 | 8 | 15 | 8 (both leaf orbits: `v` and all 7 branch leaves `c_i`) | 29190 | 58002 | −28812 |

`supply − capacity = 29190 − 58002 = −28812 = S(T,p)` — **asserted and checked in code before any
other output** (WID cross-check via **two independent code paths**: the orbit-weight totals
above, vs. `S = Σ_v [q_v(p) − q_v(p−1)]` computed directly from `H_v, R_v` polynomials on the full
labelled graph — both give `−28812`, `assert`ed equal).

Orbit-layer census: `i_{11}(T)=8673` (upper, 57 orbit-states), `i_{10}(T)=22197` (lower, 90
orbit-states) — both cross-checked against the full tree-DP independence polynomial (a
*labelled* count, named as such; the 57/90 orbit counts are *up to the `S_7` branch-permutation
symmetry*, named as such).

**Quotient max-flow** (own exact-integer Ford–Fulkerson on the 57-source/90-target orbit
network, augmenting by bottleneck each time — terminates in at most `O(|nodes|·|edges|)`
iterations regardless of the (here modest, but in general huge) integer capacities; no network,
no external solver): **flow = 29190 = total supply — the quotient SATURATES, deficit = 0.**

By §4.7 (`Γ = Aut(CB(1,7)) ⊇ S_7` acting on the 7 branches, which by §4.5 automatically preserves
`F_p`, `R`, `w_F`): **quotient saturation ⇒ original `CB(1,7)` at `p=10` satisfies `(HALL-COND)`
via the (LIFT) direction** — a new, exactly-verified instance of `(HALL)` holding, beyond the
frozen fixed points of §6 (this is the smallest eligible `CB(d,m)`, not previously computed in any
source this route read; `d=1` is a genuinely different case from the frozen `CB(8,92)`, since
`d=1` has no internal `S_d` branch symmetry and forces the "insert-a-support" switch to interact
with a single-pair branch). Grade: **`bounded_computation`** (one tree, one rank; not a family
theorem). SHA-256 of the JSON result:
`1f61dcb3772345b6632424907b8d2eb5b84a198478b996e6e97b6edbdb6da235`. Digest of `final_flow.py`:
`b4db42d67a2c9d34958e69e98514aaa4c672e173dcc90035dfd5542ad789d3ea`. Replay:
```
cp scratchpad/c1-U1/cb_search.py scratchpad/c1-U1/cb_orbit.py scratchpad/c1-U1/final_flow.py scratchpad/c1-U1-replay/
cd scratchpad/c1-U1-replay && python3 final_flow.py
```
(already executed from that exact directory; JSON and SHA-256 reproduced identically).

## 6. Compression / uncrossing (item 5(b)) — a negative finding, with an explicit witness

**Claim tested.** The natural candidate compression on a source family `X ⊆ I_{p+1}(T)` —
replace a chosen tag-leaf `v ∈ F∩B` by its support `s_v` whenever the result stays independent —
is **not** a viable compression for `φ`: it is not even well-defined as a self-map on independent
sets, and where it is defined it can only weakly *decrease* the active weight, never increase it.

**Proof of the weight direction.** `F ⊆ leafSet(T)` always (SEMANTIC-CONTRACT §1.1: `F_p(T)` is a
subset of *leaves*). A support `s_v` is never a leaf of a tree with `d(s_v)≥2` (true whenever `v`
has a sibling-free support attached to anything else, which holds throughout `CB(d,m)`, `T_m`,
and every recorded fixed point), so `s_v ∉ F` for any leaf's own support in these families.
Replacing `v` by `s_v` in `B` therefore replaces an element that MAY be an active tag by one that
is NEVER a tag — the new set's `|F∩B'|`, hence its active-weight, can only stay the same or drop.
So this move can never be used to prove `φ` is maximized on "more compressed" families; at best it
is weight non-increasing, which is the wrong direction for compression to be useful (compression
arguments need a *non-decreasing* replacement to push mass toward extremal/canonical families).

**Independence can also fail outright**, not just the weight direction — explicit witness on the
validated `CB(1,3)` instance (`n=12`; vertices `r=0,s=1,v=2`; branch 0: choke `u=3`, support
`b=4`, leaf `c=5`): `B = {3,5}` (choke and its own branch's leaf) is independent
(`adj[3]={0,4}`, `adj[5]={4}`, disjoint from `B∖`selves) with leaf `5`'s support `= 4`,
`W_5 = adj[4]∖{5} = {3}`, and `(B∖{5})∩W_5 = {3} ≠ ∅` — tag `5` is **active** in `B`. The
candidate compressed set `B' = (B∖{5})∪{4} = {3,4}` is **not independent** (`3` and `4` are
adjacent — edge `(u,b)`): the compression move is not even a well-defined self-map here, because
the leaf's support is adjacent to the very choke that made the leaf's tag active in the first
place. (Verified directly in `cb_search.py`'s `adj`; not a separate script — see §9 transcript.)

**Conclusion.** The compression lemma asked for in item 5(b) **fails** at this natural scope: any
compression toward supports depletes the tag set by construction (since only leaves are ever
tags), and can break independence outright when the support is adjacent to another already-active
witness. This route did not find, and does not know of, a repaired compression order that avoids
both failure modes; it is left as an open item (§8). Grade: **`proved`** (of the negative/
non-well-definedness claim at the stated naive scope, via the explicit witness above — this is a
decisive disproof, not a bounded search).

## 7. Fixed points (item 5(d)) — cited, not re-derived

Per the fences (no closed region re-proved, no repeated `T_m` checks), these are **cited by
attribution**, not recomputed:

- **`T_m` orbit classification** (Codex, C6-T5, `sources/lower-region/cycle-6/C6-T5/REPORT.md`):
  automorphism group `G_m = S_3≀S_m`; independent-set orbits classified exactly by
  `(root bit, arm state ∈{0,1,2}, claw-type counts (e,c,u,v,w))` with `e+c+u+v+w=m`, orbit size
  `m!/(e!c!u!v!w!)·3^{u+v}` — VERIFIED `proved_informal` (the classification is a proof for every
  `m≥1`; its "computational application is only to the three frozen cases," per the source's own
  stated scope limitation).
- **Three recorded `T_m` rows** (same source, grade `bounded_computation`): `(m,p)=(22,34)`:
  `n=91,α=68,x=32`, upper/lower orbit counts `1686/1743`, `S=−498754180547001418536`;
  `(60,90)`: `n=243,α=182,x=87`, `27633/27976`; `(66,98)`: `n=267,α=200,x=96`, `36702/37090`. All
  three: switch-inclusive quotient flow saturates.
- **`CB(8,92)` sector ratio** (Codex/C6-U5 correction, `sources/lower-region/instruments/
  cb-switch-cut/PROTOCOL.md` + `run.py`, cross-referenced in SEMANTIC-CONTRACT §1.2): `n=1567`,
  `α=829`, `x=490`, eligible window `[492,552]`, record row `p=492`, 737 favorable leaves, the
  root-plus-arm sector has every member at active weight exactly ONE, residual-layer ratio
  `|R_491|/|R_490| = 492/491` (the corrected value; the earlier `493/491` used the wrong weight
  and is not revived). This route's §5.3 `CB(1,7)` computation is a **new** fixed point at a
  different, much smaller `d`, contributed by this route, not a re-derivation of the `CB(8,92)`
  record.

## 8. Route verdict, headline, remaining obligation

`headline_resolved: no` — (HALL) is neither `formally_verified` nor `REFUTED` by a confirmed cut
this cycle; that is never a single route's product (SOLUTION-CONTRACT §5, C1-ALLOCATION shared
rules).

**Route verdict: `proved`** — meaning: the route's assigned reduction theorem (§4.6–4.7,
candidate key `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`) is **proved at informal/statement
level** (grade `proved_informal`; **STATED**, not yet registered — needs an isolated second read),
together with one exact new `bounded_computation` instance (§5.3, `CB(1,7)` at `p=10`, saturates)
and one decisive negative finding (§6, the naive compression fails). This verdict is scoped
strictly to this route's own assigned lemma; **it does not mean, and must not be read to mean,
that `(HALL)` or `(WID)` is proved** — both remain OPEN, untouched by this route (§2).

## Remaining obligation (successor inheritance)

1. Second-read and, if it survives, register `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` (full
   statement and proof in §4.6–4.7 of this return).
2. The reduction theorem only trades problem size; it does not decide feasibility. A successor
   should apply it (with `Γ = Aut(T)` or a large subgroup) to the *actual* frozen `CB(8,92)`
   record or to other adversarial families at genuinely large scale, using the validated builder
   pattern of §5.2 (own orbit-state/transition derivation, brute-force-validated on tiny members
   first) generalized from `d=1` to general `d` (the alphabet and transition rules in
   `scratchpad/c1-U1/cb_orbit.py` are already written for general `d,m`; only the specific
   application in §5.3 was run at `d=1,m=7`, the smallest eligible instance, for tractability).
3. §6's negative finding rules out one naive compression; no repaired compression/uncrossing
   notion was found or attempted beyond it. This is the item 5(b) gap: a successor could look for
   a compression defined *within* the tag-bearing leaves only (never crossing into supports),
   which would not suffer the `F⊆leafSet` obstruction identified here — untried this cycle.
4. The `Γ`-invariant maximizer of §4.6 is constructed non-constructively (as an intersection of
   translates); it gives no explicit description of the invariant cut beyond "it exists and is a
   union of orbits" — a successor wanting an *explicit* invariant witness (e.g. for a human-
   readable refutation record) would need additional structure beyond this theorem.

## 9. Sources read (all digests verified before reading; no other VerityOS or run file read)

Boot: `verity.md`, `identity/startup-protocol.md`. Run/control:
`control/C1-WORKER-COMMON-BRIEF.md`, `control/C1-STAGE2-PACKET-MANIFEST.json` (seal verified §1),
`AUTHORIZATION.md` (SHA-256 `53427348cb66be6f79e2680fc22d2029252bdb895fdc4af5f532b20b2bc8d8e4`),
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/R30-CHARTER-PROMPT.md` (SHA-256
`91b682065b59501097d8cf1484439b1330acf33ed19b01039adbb02fb1dab858`), `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/SOURCE-DIGESTS.json`,
`control/CLAIM-IDENTITY.run-local.json` (digest verified §2), `control/CLAIM-DISTINCTIONS.json`
(digest verified §2); `control/RESIDUE-CHECK.json` digest verified
(`41dc01586900af028759893398c00f2372e3f6a114db23a708c28ed00b81b9fe`) but content not needed for
this route's mathematics (a controller housekeeping/audit record, not evidence for the
derivation) and not read beyond the digest check. Sources (`sources/lower-region/...`, all
digest-verified before reading, listed in §4/§5): `cycle-6/C6-T5/REPORT.md`,
`cycle-6/C6-T5/verify_orbit_flows.py`, `cycle-6/C6-T5/EVIDENCE.json`, `cycle-6/C6-T5/RETURN.json`,
`instruments/orbit-flow-twoforone/PROTOCOL.md`, `instruments/orbit-flow-twoforone/run.py`,
`instruments/orbit-flow-twoforone/smoke.py`, `instruments/orbit-flow-twoforone/SMOKE.json`,
`instruments/orbit-flow-twoforone/RESULTS.json`, `instruments/orbit-flow-twoforone/m22-p34.json`
(digest verified; not opened — 217KB, its contents are already summarized in the digest-verified
`C6-T5/REPORT.md` table cited in §7), `instruments/cb-switch-cut/PROTOCOL.md`,
`instruments/cb-switch-cut/run.py`, `inputs/ordinary_tree_checked.py` (read for definitions only;
**not imported** into this route's own instrument — §5 builds its own independence-polynomial DP
and its own brute-force independent-set enumerator from scratch, per the "own instrument" ethos).
Not read (authorized but not needed for this route's specific obligation, per the Loading
Discipline principle): the large predecessor ledgers/records under `sources/lower-region/records/`
and `sources/authority/`, `sources/r29/`, `sources/first-interior/`, `sources/public-docs/`,
`m60-p90.json`/`m66-p98.json` (multi-MB; their summary is in the digest-verified `C6-T5/REPORT.md`
table already cited). No sibling seat return, critic, or adjudicator work was read; no other
experiment root was read; no recursive `find`/`grep -r`/`ls -R` was run above this route's grant —
every `grep`-style search in this route's work targeted one exact named file. **No
`## Read-boundary disclosure` items.**

All scratch under `scratchpad/c1-U1/` (`cb_search.py`, `cb_orbit.py`, `validate_orbit.py`,
`final_flow.py`, `supermodularity_check.py`); every one of those five files was also copied
verbatim into `scratchpad/c1-U1-replay/` and re-run from there, reproducing every reported number
and digest identically (copy-out-first replay, per the shared rules — never `/tmp`). One
over-long exploratory brute-force script (an `O(4^n)`-blowup mis-sizing, not one of the five
scripts above) was foreground-launched, exceeded its interactive window, was auto-moved to a
background task by the harness, and was stopped by this route via `TaskStop` using its returned
task id (a PID-scoped stop, not a pattern kill); it produced no output and is not cited as
evidence anywhere in this return — the corrected, right-sized version is `supermodularity_check.py`
above. No other background job was started; no job was left running at close.
