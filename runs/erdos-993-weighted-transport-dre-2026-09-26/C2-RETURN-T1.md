# RETURN — Route `T1`, Cycle 2, r30 (weighted mixed-boundary transport, Erdős #993)

**Route ID / mechanism fingerprint:** `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`. Orientation `T` (prove).
**Model disclosure (two-part, on the face):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.

## Boot

I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I did not follow the startup protocol's own
task-type map into memory, conversations, modules, operations, logs or decisions for this task, per the dispatch's
override — with the exceptions recorded below as read-boundary disclosures. The harness injected the project
`CLAUDE.md` and the user auto-memory index (`MEMORY.md`) into context at session start; I did not open either as a
source for this route's mathematics, and nothing below relies on them.

## Read-boundary disclosure

1. **Order.** Before verifying the dispatch digest and reading the dispatch file, I performed the VerityOS boot
   (`verity.md`, `identity/startup-protocol.md`) because the outer wrapper session's own project instructions
   (`CLAUDE.md`) mandate booting before any substantive response. This is an ordering deviation from the wrapper's
   instruction to read the dispatch first; the two files actually read are exactly the two the dispatch itself
   authorizes, so no unauthorized file content entered on this account, but the order is disclosed as instructed.
2. **`skills/optimization-loop/skill.md`.** During the same pre-dispatch boot, per the outer `CLAUDE.md` task-type
   map ("Controlled optimization or benchmark-driven improvement → load `experiments/` and
   `skills/optimization-loop/skill.md`"), I read this file. This is a VerityOS read outside the dispatch's two
   authorized boot files and is disclosed. It is not used anywhere in the mathematics below.
3. **`ls experiments/`** (non-recursive, one level) — listed the names of sibling experiment directories in the
   VerityOS `experiments/` subsystem (not this run's contents) during the same pre-dispatch orientation. Disclosed;
   no sibling experiment's contents were read.
4. **`find experiments/erdos-993-weighted-transport-dre-2026-09-26 -maxdepth 3 -type d`** — a bounded-depth
   recursive directory listing rooted at this run's own root, run before I had read the dispatch's grant-boundary
   rule. It returned only directory names (`control/`, `cycles/`, `runs/`, `second-reads/`, `sources/`,
   `scratchpad/`, etc.), no file contents. This is a search rooted above the specific grant (sources/ and my own
   scratch directory) and is disclosed per the rule.
5. **Not read:** no sibling seat's scratch, return, or critique; no other experiment root; no live root; no
   Mathlib was needed (no Lean in this route); no network; no installs.

All mathematics, computation, and claims below are built only from the sealed Stage 2 packet, `sources/`, the
Cycle 1 inheritance, and my own scratch work under `scratchpad/c2-T1/`.

## Stage 2 seal and source digests verified

- Dispatch file digest (outer wrapper check, performed first): SHA-256 of
  `control/dispatch/c2-stage3/DISPATCH-T1.md` = `5933a218cd4ece083c3ad2b7c1c95d5927618faba7e122513ef29ef97de34e5f` — **matches** the wrapper's stated digest exactly.
- Stage 2 packet manifest inner seal: recomputed SHA-256 of the canonical JSON of
  `control/C2-STAGE2-PACKET-MANIFEST.json` with the `seal_sha256` field removed (`sort_keys=True`,
  `separators=(",",":")`, no trailing newline) = `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da` —
  **matches** both the manifest's own `seal_sha256` field and the value cited in the dispatch. **I cite this seal
  value: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`.**
- Per-file digests verified against `control/C2-STAGE2-PACKET-MANIFEST.json` (or, for files outside that packet's
  own listing, the packet that governs them): `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
  `control/C2-ALLOCATION.md`, `control/C2-WORKER-COMMON-BRIEF.md`, `control/C2-STAGE1-GATE.md`,
  `cycles/cycle-2/stage2/ROUTE-STATE.md`, `control/CLAIM-IDENTITY.run-local.json` — all **MATCH**.
- Verified against `control/SOURCE-DIGESTS.json`: `sources/lower-region/inputs/ordinary_tree_checked.py`,
  `sources/lower-region/instruments/cb-switch-cut/{RESULTS.json,run.py,PROTOCOL.md}` — all **MATCH**.
- Verified against `control/C1-SECOND-READS-PACKET-MANIFEST.json`: `second-reads/SR-SECTOR/SECOND-READ.md` —
  **MATCHES**.

## IMPORT LIST (standard library only, across every script in `scratchpad/c2-T1/`)

`pathlib.Path`, `sys`, `math.comb`, `itertools.combinations`, `itertools.product`, `fractions.Fraction`,
`collections.deque`, `json`, `hashlib`. One authorized non-stdlib import: `sources/lower-region/inputs/ordinary_tree_checked.py`
(read-only, the run's designated exact evaluator), for `Graph`, `add_poly`, `mul_poly`, `trim`, `coefficient`,
`delta`, `first_strict_descent` only — never its `relation_row`/`maximum_matching` machinery, which implements the
**r23 Delete/Retag relation**, a refuted mechanism family (`SOLUTION-CONTRACT.md` §3.2), not this run's (D)∪(S)
relation.

## Setting recap (binding definitions used below; SEMANTIC-CONTRACT.md §1.2, SOLUTION-CONTRACT.md §2)

`CB(d,m)`: root `r`, arm `r–s–v`, `m` chokes `u_i ~ r`, each with `d` supports `b_{ij} ~ u_i`, each support with one
private leaf `c_{ij} ~ b_{ij}`. `N := dm`. Active-tag weight `w_F(B) = #{v∈F∩B : B∩N_T(s_v) ≠ ∅}`. Relation (D)∪(S):
deletion, or two-for-one switch on `u∉B` with exactly 2 neighbours in `B`. **Root-plus-arm sector** `X_sec := {B :
r,v ∈ B}` (so no choke is in `B`): every member has active weight exactly 1 (the arm tag `v` is active because
its support `s`'s other neighbour `r` is in `B`; a private tag `c_{ij}` is active iff its support `b_{ij}`'s other
neighbour `u_i` (the choke) is in `B`, and chokes are always excluded whenever `r∈B`, so private tags are never
active inside the sector). `k := p−1`, `Z' := N−k+1`.

## Step-by-step derivation

### Step 0 — registered claims named before any census (alias check, lexical AND mathematical)

Before reporting any table or number, the claims this route touches or re-confirms
(`sources/authority/CLAIM-IDENTITY.json` fused with `control/CLAIM-IDENTITY.run-local.json`, 438 claims):

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. Touched, not closed, by this route.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — VERIFIED `formally_verified` (C1-LA1). Used, re-confirmed
  numerically on every computed row below (never re-proved as a contribution).
- **(HALL⇒S≤0 companion)** `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` — VERIFIED
  `formally_verified` (C1-LA2). Used, not re-proved.
- **(INV)** `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` — VERIFIED `proved_informal`. Used (Step 2) to
  restrict attention to `Aut(T) = S_m ≀ S_d`-invariant families.
- **(NM)** `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` — VERIFIED `proved_informal`. Used and
  **distinguished** from my new spectral claim below: NM is a *degree* (double-counting) bound giving the *weak*
  ratio `δ = k/(2Z')`; my new claim is an exact *spectral* fact used to sharpen a Cauchy–Schwarz step past that
  weak ratio. Lexical check: no existing key contains "spectral", "eigenvalue", "flip-character", or "support-swap"
  attached to this object (grep of `control/CLAIM-IDENTITY.run-local.json` for
  `spectral|swap|flip|boolean|eigen|johnson|hahn|krawtchouk|lym|shadow|up.down` returns 20 keys, none stating this
  fact — closest by subject is NM itself, mathematically distinct as just explained).
- **P5–P9, Lemma C** (`R30-CB-RECORD`, Cycle 1 inheritance, `second-reads/SR-SECTOR/SECOND-READ.md`
  Registrations 1–4) — `bounded_computation`/`proved_informal`(modulo node (n1)). Used, re-derived where stated,
  never re-proved as a fresh contribution.
- **Ten refuted mechanism keys** (`SOLUTION-CONTRACT.md` §3.2) — none of this route's mechanisms is any of these:
  the weight here is the literal active-tag `w_F`, not `|F∩B|`; the relation is (D)∪(S) literal, not a Delete/Retag
  variant; no cut proposed here is deletion-only (Fact A already separates sector targets, which contain `r`, from
  switch targets, which do not — SR-SECTOR Registration 4).
- **New candidate key proposed by this route** (naming only; registration is the synthesis's act, not mine):
  `E993-R30-TERNARY-COVER-FLIP-CHARACTER-SPECTRUM` for the spectral fact of Step 2. Checked against all 438 run-local
  claims (grep above) and `control/CLAIM-DISTINCTIONS.json`: no lexical or mathematical alias found.

### Step 1 — INV restriction (where the hypothesis enters)

By (INV), if a deficient `X ⊆ I_{p+1}(T)` exists for `T = CB(d,m)`, an `Aut(T)`-invariant deficient `X` exists (the
deficit functional `X ↦ Σ_X w − Σ_{N(X)} w` is supermodular; its extremizers may be taken invariant — INV's own
hypothesis, cited not re-derived). `Aut(CB(d,m)) = S_m ≀ S_d` (permute the `m` chokes; within each choke permute
its `d` support+leaf pairs; the arm `r,s,v` has no further symmetry since `deg(r)=1+m`, `deg(s)=2`, `deg(v)=1` are
distinct once `m≥1`). **So it suffices to prove (HALL-COND) for every `Aut(T)`-invariant `X`.** This is where the
`IsTree`/finiteness/eligibility hypotheses of INV enter: `T` finite tree (checked, see Step 5), `w_F` genuinely
`Aut(T)`-invariant (`F = F_p(T)` is the whole leaf set at every eligible row computed below, and `Aut(T)` is
transitive on the `dm` private leaves, so `F` is invariant).

An `Aut(T)`-orbit of `B ⊆ V` is determined exactly by: (i) the arm/root state — `r∈B` (root state, forces every
choke ∉ B, `s∉B`, `v` free); `s∈B` (forces `r,v∉B`, chokes free); or neither `r` nor `s` ∈ B (chokes free, `v`
free) — and (ii) the **multiset**, over the `m` chokes, of each choke's **local branch type**: excluded-choke type
`(a,b)` with `a` supports and `b` leaves chosen, `a+b≤d` (`C(d;a,b,d−a−b)` realizations), or included-choke type
`(incl,j)` with `j` leaves chosen (`C(d,j)` realizations). Counting types: `(a,b)` with `a+b≤d` gives
`Σ_{s=0}^{d}(s+1) = C(d+2,2)` pairs; `(incl,j)` gives `d+1` more. For `d=8`: `C(10,2)+9 = 45+9 = 54` — **this
matches U2's cited "54 branch types" obstruction exactly**, confirming the orbit-space model. I verified this
branch decomposition computationally against both the generic (independently coded) tree DP and, for `n≤20`,
brute-force enumeration (`scratchpad/c2-T1/cb_network.py::verify_small`) on `(d,m) ∈
{(1,1),(2,1),(1,2),(2,2),(2,3),(3,2)}`: closed form = generic DP = brute force in every case (digest below).

**The root-plus-arm sector `X_sec` is exactly the `(r∈B, v∈B)` orbit-class**, a single point of the arm/root
coordinate crossed with the full space of choke-type multisets. Any `Aut(T)`-invariant `X` decomposes as
`X = (X∩X_sec) ⊔ (X∖X_sec)` along this same coordinate, so it suffices (by `N(X) ⊇ N(X∩X_sec) ∪ N(X∖X_sec)` and
`supply(X) = supply(X∩X_sec)+supply(X∖X_sec)`) to control the two pieces and their overlap — Step 2.

### Step 2 — sector piece: Lemma C, re-derived, and the (n1) gap narrowed

Lemma C (`R30-CB-RECORD`; `second-reads/SR-SECTOR/SECOND-READ.md` Facts A–D, re-derived there and re-checked here
independently, not re-proved as a fresh contribution) shows: for `X ⊆ X_sec`, `Σ_{N(X)} w ≥ |X|` — i.e. Hall holds
**for every subfamily of the sector, using the sector's own switch exits**, at `p ∈ [493,552]` unconditionally
(part (i), no spectral input, `δ = k/(2Z') ≥ 1`), and at `p = 492` conditionally on node (n1) (part (ii), the
Cauchy–Schwarz/Fact D argument, valid when `|X|/R_k ≤ x₀ = (k²−λ₂)/(2Z')`, composed with the switch-capacity bound
(Fact B) for larger `X`).

**Node (n1), re-derived (not cited) — this route's principal contribution.** The claim: every eigenvalue of `BB^T`
on `𝟙^⊥` is at most `2(k−1)Z'`, where `B` is the cover (down-shadow) matrix between ranks `k` and `k−1` of
`{0,1,2}^N`. I built `BB^T` explicitly from its definition (common upper covers) for six `(N,k)` pairs up to
`(6,4)` and derived, then verified exactly:

1. **Operator identity (general `N,k`, proved by direct case analysis, elementary).** For `g ≠ g'` at rank `k−1`,
   `(BB^T)_{g,g'} ∈ {0,1}`: it is `0` unless `g,g'` are related by a **support swap** (remove one element `i` from
   `supp(g)`, add a new element `j∉supp(g)` with either of the 2 colours, all else unchanged), in which case it is
   exactly `1`. Consequently `BB^T = 2Z'·I + C`, `C` the 0/1 adjacency matrix of the support-swap graph, and `C` is
   exactly `2(k−1)Z'`-regular (diagonal of `BB^T` = ways to add one new coordinate = `2Z'`; off-diagonal row-sum =
   `(k−1)` choices of `i` × `(N−k+1)=Z'` choices of `j` × `2` colours). Verified exactly (integer arithmetic) on all
   6 tested `(N,k)` pairs (`diag_ok`, `regular_ok` = true in every case; `spectral_node.py`).
2. **Flip-character eigenvectors (general `N,k,J`, proved by direct case analysis, elementary — this is the new
   claim).** For `J ⊆ [N]`, define `χ_J(g) := ∏_{t∈J} ε_t(g)` where `ε_t(g) = +1` if `g_t=1`, `−1` if `g_t=2`, and
   `χ_J(g)=0` unless `J ⊆ supp(g)`. **Theorem:** for every `J` with `|J| = r ≤ k−1`, `χ_J` is an exact eigenvector
   of `BB^T` with eigenvalue `2(k−r)Z'`, and `χ_J ⊥ 𝟙`. *Proof.* If `J ⊆ supp(g)`: a neighbour `g'` (remove
   `i∈supp(g)`, add `j∉supp(g)`, colour `c_j`) has `χ_J(g')=0` if `i∈J` (`r` choices, killing `J⊆supp(g')`), and
   `χ_J(g')=χ_J(g)` if `i∉J` (`k−1−r` choices) since then neither the removed nor the added coordinate lies in `J`
   (the added `j` is never in `J` because `J⊆supp(g)` and `j∉supp(g)`); summing the `2Z'` choices of `(j,c_j)` for
   each of the `k−1−r` valid `i`: `(C χ_J)(g) = 2(k−1−r)Z'·χ_J(g)`, so `(BB^Tχ_J)(g) = [2Z' + 2(k−1−r)Z']χ_J(g) =
   2(k−r)Z'·χ_J(g)`. If `J ⊄ supp(g)`: pick `t*∈J∖supp(g)`; any neighbour `g'` with `χ_J(g')≠0` must have `j=t*`
   (the only way `t*` enters `supp(g')`), and then summing the 2 colour choices `c_{t*}=±1` gives `(+1)+(−1)=0`
   contribution; every other neighbour already has `χ_J(g')=0`. So `(Cχ_J)(g)=0=(BB^Tχ_J)(g)`, consistent. Finally
   `⟨χ_J,𝟙⟩ = Σ_g χ_J(g) = 0` by the same colour-flip symmetry (pairing each `g` with its `J`-recolouring). ∎ —
   Verified exactly (integer arithmetic, no floating point) for every `J` with `1≤|J|≤k−1` (one representative `J`
   per size, all sizes) on the same 6 `(N,k)` pairs: `all_phi_exact = True` in every case (`spectral_node.py`,
   function `check_phi_eigenvector`).
3. **Consequence.** Taking `r=0` (`J=∅`, `χ_∅=𝟙`) recovers the trivial top eigenvalue `2kZ'` (Perron, `𝟙`).
   Taking `r=1` (any singleton `J`) gives **exactly** `2(k−1)Z'` — the target bound — **achieved with equality** on
   `𝟙^⊥`. So *if* the claim is true, it is *sharp*, and the achieving direction is now a fully general, unconditional
   theorem (not case-limited): **the bound `2(k−1)Z'` is attained on `𝟙^⊥` for every `N,k`.**
4. **What remains open (honest gap, not closed here).** I have not independently re-derived, from scratch, that
   the `χ_J` family together with their lower-weight descendants (the standard `sl₂`/Boolean-lattice induction that
   SR-SECTOR's Finding 5 sketches: `D_{j+1}U_j − U_{j−1}D_j = (n−2j)I` on the Boolean lattice, hence via complete
   reducibility of finite-dimensional `sl₂`-modules the ordinary Boolean up-down spectrum
   `(j−i)(n−j−i+1)`) **exhausts** the spectrum of `BB^T`, i.e. that no eigenvalue outside this family exceeds
   `2(k−1)Z'`. I re-derived the `D_{j+1}U_j − U_{j−1}D_j = (n−2j)I` commutation identity myself directly (off-diagonal
   terms of both compositions are identical — both count the unique `T ⊃ S,S'` with `|S∩S'|=|S|−1` — so they cancel
   in the difference, leaving only the diagonal `(n−j)−j=n−2j`), confirming SR-SECTOR's Finding 5 is correct as
   stated, but a full, independent, general-`N,k` proof that the flip-character decomposition is a *complete*
   eigenbasis (not just that each `χ_J` is *an* eigenvector) needs either the wreath-product representation theory
   of `(ℤ/2)^N ⋊ S_N` on `L_{k-1}` in full, or an independent completeness count, neither of which I closed here.
   **Numerical confirmation (Jacobi eigenvalue algorithm, pure-Python floats, `spectral_node.py::jacobi_eigenvalues`,
   `tol=1e-9`, ≤200 sweeps): for every one of the 5 `(N,k)` pairs where it converged (`(3,2),(4,2),(4,3),(5,2),(5,3)`),
   no eigenvalue among the top 5 exceeds the predicted second value except the unique top eigenvalue** —
   `jacobi_none_exceed_top_except_top = True` in all 5 cases (digest below). This is strong evidence, not a general
   proof.
   **Grade of node (n1): `proved_conditional`** — the achieving/sharpness direction is `formally_verified`-grade
   elementary (unconditional, general `N,k`); the no-exceedance direction is proved *modulo* the standard-but-not-
   independently-completed Boolean-lattice eigenbasis completeness, backed by exact confirmation on 6 `(N,k)` pairs
   for the achieving eigenvectors and floating-point confirmation on 5 pairs for no-exceedance. This is **more** than
   SR-SECTOR's own Finding-5 sketch closed (which did not exhibit the flip-character eigenvector family explicitly
   or verify it), and is offered as the requested Cycle 2 T1 face-proof advance on (n1), **not** a full formal
   closure. **Lemma C's grade is not upgraded past `proved_informal (modulo (n1), narrowed)`** by this route; I do
   not claim to remove the qualifier.
5. **Consequence for the three T1 rows.** Reproduced independently (own code, `scratchpad/c2-T1/cb_rows.py`, not a
   copy of `sources/lower-region/instruments/cb-switch-cut/run.py`; cross-checked against the generic tree-DP
   evaluator on every row, `closed_eq_generic = True` in every case): at `CB(8,86)/460`
   (`k=459,Z'=230,δ=459/460,x₀=1/460`), `CB(8,89)/476` (`k=475,Z'=238,δ=475/476,x₀=1/476`), and `CB(8,92)/492`
   (`k=491,Z'=246,δ=491/492,x₀=1/492`): all three have `x₀>0`, and Lemma C (ii) holds with margins **6863.256,
   11209.544, 18328.277** respectively (my own independent recomputation of the exact-Fraction `x₀`, `δ`, and the
   `[t^k] g_d(t)^m` coefficient `|X''|`, `g_d(t) = (1+2t)^d − dt((1+t)^{d−1}−1)`) — these numbers **match
   SR-SECTOR's cited values exactly** (6,863.26 / 11,209.54 / 18,328.28), constituting an **independent second
   instrument** for SR-SECTOR Finding 6 (which explicitly said the two smaller rows needed a second instrument
   before entering the record). **This route supplies that second instrument.** So: **sector Hall holds at all
   three rows**, `proved_conditional` on node (n1) as graded above.

### Step 3 — non-sector piece and the mixed case (the genuinely open part of obligation (a))

For `X ⊆ I_{p+1}(T) ∖ X_sec` entirely outside the sector: by (NM)/P9 (inherited, `δ ≥ 1` iff `3p ≥ 2N+5`), deletion
alone gives Hall **on every sector of the tree at ranks where `δ≥1`**; at the three T1 rows `δ<1` throughout the
eligible window's low end (the P8/P9 criterion is evaluated *per sector*, and the root-plus-arm sector is the one
Cycle 1 identified as the deficient one at these specific `p`). I did **not** find, and the allocation does not
claim exists, a second deficient sector at these three rows — P8/P9's criterion is uniform across "sectors of this
shape" (a distinguished vertex/pair with the rest a star forest), and the CB family's only non-trivial such
distinguished structure at the root is the arm; every choke's own local sector (fixing a choke's state) is
generically far from deficient (its local `δ`-analogue involves only that one choke's `d`-sized local structure,
not the global `N=dm`, so it is nowhere near threshold). I did not exhaustively verify this for every possible
sector definition, so I record it as an assumption, not a proved exhaustive classification (see Remaining
obligation).

**The mixed case.** For `X` intersecting both `X_sec` and its complement: `N(X) ⊇ N(X∩X_sec) ∪ N(X∖X_sec)`, and by
Fact A (SR-SECTOR Registration 4), **switch images of `X∩X_sec` always have `r∉A`** (the switch removes `r` from
`N_T(u_i)`), while **deletion images of `X∩X_sec` that stay useful for Lemma C's own accounting are the `q≠r,v`
deletions, which keep `r,v∈A`** (stay inside the sector). So Lemma C's own proof already uses BOTH kinds of target
for `X∩X_sec` alone. The question for the mixed case is whether `N(X∖X_sec)` (computed by NM/P9's deletion-only
argument, landing in whatever region `X∖X_sec`'s own deletion structure reaches) can **overlap** the *same*
`r∉A`-region targets that `X∩X_sec`'s switch exits rely on, in a way that would let one `X` "double-spend" a
target's capacity across the deficiency proofs for its two pieces. Since Hall's condition is evaluated once per
`X` on the *actual* `N(X)` (a set, not a multiset) and *actual* `capacity(A)` (fixed per target `A`, not
apportioned to whichever `X`-piece "claims" it), there is **no** double-spending risk *for a single fixed `X`*: if
`A ∈ N(X∩X_sec) ∩ N(X∖X_sec)`, its full capacity `w_F(A)` is available to cover `X` as a whole, and my job reduces
to showing `Σ_{A∈N(X)} w_F(A) ≥ supply(X)`, which is *implied* (not merely suggested) by
`Σ_{A∈N(X∩X_sec)} w_F(A) ≥ supply(X∩X_sec)` (Lemma C) **plus** `Σ_{A∈N(X∖X_sec)} w_F(A) ≥ supply(X∖X_sec)`
(NM/P9) **provided** `N(X∩X_sec)` and `N(X∖X_sec)` are disjoint, or, if not disjoint, provided the overlap's
capacity is not double-counted in a way that makes the sum of the two lower bounds exceed the true
`capacity(N(X))`. **This is exactly backwards from a risk of failure**: since
`capacity(N(X)) = capacity(N(X∩X_sec) ∪ N(X∖X_sec)) ≥ max(capacity(N(X∩X_sec)), capacity(N(X∖X_sec)))` always, and
each already dominates its own piece's supply, **the only way the combination could fail is if a target `A`
belongs to both `N(X∩X_sec)` and `N(X∖X_sec)`, causing `capacity(N(X))` (the true, unduplicated sum over the union)
to be SMALLER than `capacity(N(X∩X_sec)) + capacity(N(X∖X_sec))` — but I never need that sum, only that the union's
capacity dominates `supply(X∩X_sec)+supply(X∖X_sec)`, and since the union's capacity is at least as large as each
piece's own (already-sufficient) capacity, and supply is additive while capacity of a union is superadditive-or-equal
relative to either piece alone, THE ARGUMENT ACTUALLY GOES THROUGH exactly when**
`capacity(N(X∩X_sec) ∪ N(X∖X_sec)) ≥ capacity(N(X∩X_sec)) + capacity(N(X∖X_sec)) − capacity(N(X∩X_sec)∩N(X∖X_sec))`,
i.e. **I still need `capacity(N(X∩X_sec)∩N(X∖X_sec))` to not be double-required** — concretely, I need
`Σ_{A ∈ N(X∩X_sec)∩N(X∖X_sec)} w_F(A)` to not have been "used up" twice in the two separate Hall certificates
(Lemma C's flow and NM/P9's flow), because **a Hall bound on capacity is not itself a flow**: two different
sub-flows (one for `X∩X_sec`, one for `X∖X_sec`) could both want to route mass through the *same* target `A`,
and `Σf(·,A) ≤ w_F(A)` is a *joint* constraint across the whole flow, not per sub-family. **This is the exact gap I
did not close**: Lemma C's own flow for `X∩X_sec` and NM/P9's flow for `X∖X_sec` are constructed independently, and
I have not shown their combination respects each shared target's *single* capacity bound. Given the switch-capacity
margins are 6,863×–18,328× the raw deficit at the three rows (Step 2, and SR-SECTOR's own multiples 6,128.8×,
6,563.1×, 7,012.3× for the deletion-only sector deficit), I regard a full closure of this gap as very likely
achievable by a successor with a slightly more careful joint max-flow argument (e.g. via the max-flow/min-cut
theorem applied directly to the *whole* network restricted to `N(X)`'s support, rather than composing two
separately-built flows) — but I have **not** constructed that joint argument here.

### Step 4 — obligation (b): the two Lemma-C-uncovered rows

Computed independently (`cb_rows.py`, cross-checked against generic tree-DP, `closed_eq_generic=True`):
`CB(8,108)/577`: `n=1839, α=973, x=575`, eligible; `k=576, Z'=289, δ=288/289, x₀=−287/289`. `CB(7,144)/673`:
`n=2163, α=1153, x=671`, eligible; `k=672, Z'=337, δ=336/337, x₀=−335/337`. Both match SR-SECTOR's cited `x₀`
values exactly (independent reproduction).

**Diagnosis (why Lemma C's composition genuinely does not apply, not just a missing case).** `x₀ < 0` at both rows
means Fact D's hypothesis `|X|/R_k ≤ x₀` is *vacuous* (no non-negative `|X|` satisfies it) — the crude
Cauchy–Schwarz bound of Fact D is too weak at this aspect ratio (`Z'` small relative to `k`) to ever activate, for
*any* `X`, including `X = ∅`'s successor. Composition (ii) therefore has no regime where Fact D's contribution is
available, and Fact B's switch-capacity bound alone, `(|X|−|X''|)/(d−1)`, is **negative/useless** whenever
`|X| < |X''|` — and the natural adversarial test family (`X = X''` itself, the switch-dead sector sources with no
branch at `a=1`-with-a-leaf) has **only deletion available**, giving merely `Σ_{∂X''} w ≥ δ|X''|` by the *generic*
NM ratio, which is `< |X''|` since `δ<1`. I computed `|X''|` exactly for both rows
(`g_d(t)^m`'s `t^k` coefficient, exact big integers, 403 and 465 digits respectively) and its size relative to the
whole sector: `|X''|/R_k ≈ 6.48×10⁻⁹` at `CB(8,108)/577` and `≈ 2.56×10⁻¹⁵` at `CB(7,144)/673` — **astronomically
small**. This means the generic (worst-case) NM ratio `δ` is almost certainly *not tight* for the specific,
highly structured family `X''` (a "no local pattern" product family), and a **sharper, `X''`-specific shadow bound**
(a refined Kruskal–Katona-type inequality exploiting `X''`'s product/local-exclusion structure, rather than the
generic biregular double-counting behind NM) is exactly what "an expansion bound on the switch-dead family `X''`"
(the allocation's own phrasing) calls for. **I did not construct this sharper bound.** Given `δ` is already within
`7/289 ≈ 2.4%` and `6/337 ≈ 1.8%` of `1` at these two rows, I expect the needed sharpening to be small in magnitude,
not a new order of argument — but I have not produced it, and I am not willing to assert it without a proof.
**Obligation (b) is therefore reduced to a precisely quantified, well-scoped, but unresolved technical lemma**, not
closed.

### Step 5 — acyclicity-and-connectivity, `x`/`Δ_k` on every row, WID

Every object called a tree here passed an explicit code check (`scratchpad/c2-T1/tree_check.py::is_tree`:
`edges = n−1` and BFS reaches all `n` vertices ⇒ acyclic and connected ⇒ tree), run on all five target trees
(`out_tree_check.txt`, digest below) and on the six small verification trees. `x` was computed via
`first_strict_descent` on the polynomial through rank `α` (the generic DP's `forest_independence_polynomial`
carries all coefficients through `α` — the authorized evaluator's caveat about the terminal zero-extension
difference does not bite here because the DP-returned polynomial's own top coefficient is a true, non-trimmed
`i_α`, and `Δ_α = −i_α` is computed by evaluating `coefficient(poly, α+1)=0` explicitly, i.e. through rank `α`).

| Row | `n` | `α` | `x` | `p` | sign of `Δ_x(T)` | sign of `Δ_{x-1}(T)` |
|---|---|---|---|---|---|---|
| CB(8,86)/460 | 1465 | 775 | 458 | 460 | `<0` (330-digit magnitude) | `≥0` (327 digits) |
| CB(8,89)/476 | 1516 | 802 | 474 | 476 | `<0` (340 digits) | `≥0` (338 digits) |
| CB(8,92)/492 | 1567 | 829 | 490 | 492 | `<0` (352 digits) | `≥0` (350 digits) |
| CB(8,108)/577 | 1839 | 973 | 575 | 577 | `<0` (415 digits) | `≥0` (412 digits) |
| CB(7,144)/673 | 2163 | 1153 | 671 | 673 | `<0` (485 digits) | `≥0` (482 digits) |

Both `Δ_x<0` and `Δ_{x-1}≥0` were computed explicitly and asserted for every row (not just the first-descent index
taken on faith) — `first_strict_descent` returns the first rank with `Δ<0` by scanning from rank 0, so `Δ_{x-1}≥0`
is a logical consequence already checked by the scan itself, and I additionally computed both values directly with
exact big integers (`scratchpad/c2-T1/cb_network.py` verification run above; digests below).

**WID, independently computed sides, on every eligible row and on seven small non-eligible calibration rows**
(`transport.py`, brute-force literal `w_F`/relation on `n≤13`; `cb_rows.py`, `q_v(p)` vs `q_v(p−1)` split on the
five large rows): `supply − capacity = S` **exactly**, in every case (`wid_check = True` throughout;
`wid_holds = True` in every small-case row of `transport.py` after the initial bug — see below — was fixed).

**Errata found and fixed in my own scratch (not a claim against any registered result).** My first draft of
`transport.py` computed the per-leaf aggregate quantity as `Δ_p(T−v)` (the *selector* quantity used for
favorability) instead of `g_v = Δ_{p−1}(H_v) − Δ_{p−1}(R_v)` (the *aggregate* summand) — these are related but
different (`Δ_p(T−v) = Δ_p(H_v) + Δ_{p−1}(R_v)`, from `P(T−v) = H(x)+xR(x)`, not `Δ_{p−1}(H_v)−Δ_{p−1}(R_v)`). This
produced `wid_holds: False` in five of seven small test rows on the first run. Corrected before any numeric claim
was reported; the corrected code and its output are what is digested below.

## Grades (SOLUTION-CONTRACT.md §4)

- Orbit/branch-type reduction (Step 1): `proved_informal` (elementary, general `d,m`; computationally cross-checked
  on 6 small instances against an independent generic DP and, for `n≤20`, brute force).
- Sector Hall at the three T1 rows via Lemma C (Step 2): `proved_conditional` on node (n1) as graded there — I
  narrow, but do not remove, the "modulo (n1)" qualifier; my own contribution (the flip-character eigenvector
  family, item 2 above) is `formally_verified`-grade elementary and unconditional in its own right.
- Node (n1) itself: `proved_conditional` (achieving direction unconditional/general; no-exceedance direction
  backed by exact confirmation on 6 `(N,k)` pairs and floating-point confirmation on 5, general completeness not
  independently closed).
- Second instrument for SR-SECTOR Finding 6 (Lemma C (ii) at `CB(8,86)/460` and `CB(8,89)/476`): `bounded_computation`
  (independent exact reproduction of the cited margins).
- Non-sector piece (Step 3, first paragraph): `proved_conditional` on the unverified claim that no other sector of
  the CB family is deficient at these rows (not exhaustively checked).
- Mixed-case Hall (Step 3, T1's actual assigned obligation (a)): **not proved** — `bounded_evidence` (the joint-flow
  gap is named exactly, with a strong quantitative reason to expect it closes, but no proof).
- Obligation (b), the two uncovered rows: **not proved** — `bounded_evidence` (exact diagnosis of why Lemma C's
  composition fails, exact quantification of `x₀`, `δ`, `|X''|`, and of how small `|X''|` is relative to the
  sector, but no sharpened shadow bound constructed).
- WID cross-checks throughout: `formally_verified`-grade numeric confirmation (WID itself is already
  `formally_verified` by C1-LA1; this route's contribution is independent numeric re-confirmation, not a new proof).

## `headline_resolved: no`

## Route verdict: `bounded_evidence`

The route produced one genuinely new, general, unconditional elementary theorem (the flip-character eigenvector
family for the ternary cover matrix, Step 2 item 2), substantially narrowing node (n1) and supplying the second
instrument SR-SECTOR's Finding 6 needed; it independently reproduced and cross-validated the entire branch-type/
orbit-reduction picture and Lemma C's numerics on all three assigned rows; and it gave an exact quantitative
diagnosis of obligation (b)'s two uncovered rows. It did **not** prove (HALL-COND) for every `X` outside the
root-plus-arm sector on any of the three rows (the mixed-case joint-flow gap, Step 3), and did **not** close
obligation (b). No (CUT) candidate was found or attempted; no refutation is claimed.

## Remaining obligation (successor inheritance)

1. **Joint-flow closure for the mixed case (the core of obligation (a)).** Build a single max-flow argument on the
   restriction of the whole (D)∪(S) network to `X∩X_sec ∪ (X∖X_sec)` and its true neighbourhood (not two flows
   composed post hoc), and show the shared-target capacity is never jointly oversubscribed. Given the margins
   (6,863×–18,328× at the three rows), this looks close to mechanical but is not done.
2. **Exhaustive check that the root-plus-arm sector is the *only* deficient sector** of the CB family at these three
   rows (Step 3's stated but unverified assumption) — or an explicit second deficient sector if one exists.
3. **General completeness of the flip-character eigenbasis** for `BB^T` on `{0,1,2}^N` layers (node (n1)'s
   remaining gap): either a full wreath-product representation-theoretic decomposition, or an independent dimension/
   trace-based completeness argument, to remove the "modulo completeness" qualifier and let Lemma C drop "modulo
   (n1)" entirely.
4. **A sharpened, `X''`-specific shadow/expansion bound** for the switch-dead family at `CB(8,108)/577` and
   `CB(7,144)/673` (obligation (b)) — likely via the product/local-exclusion structure of `g_d(t)^m` rather than the
   generic NM ratio; the needed sharpening is small (`δ` is within 1.8–2.4% of 1 at these rows).
5. **Synthesis action requested:** register (subject to review) the candidate key
   `E993-R30-TERNARY-COVER-FLIP-CHARACTER-SPECTRUM` (Step 2 item 2) and record this route's numbers as the second
   instrument for SR-SECTOR Finding 6 (`CB(8,86)/460`, `CB(8,89)/476` Lemma C (ii) coverage).

## Replay (copy-out-first; scratch under `scratchpad/c2-T1/`, replay copies under `scratchpad/c2-T1-replay/`)

All scripts run in the foreground; no background jobs were started, so none required killing.

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-T1/{cb_network.py,transport.py,spectral_node.py,cb_rows.py,tree_check.py} \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-T1-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-T1-replay
python3 cb_network.py    # branch-decomposition cross-check, small (d,m)
python3 transport.py     # literal w_F / (D)∪(S) / WID / Hall brute force, small (d,m,p)
python3 spectral_node.py # node (n1): operator identity, flip-character eigenvectors, Jacobi check
python3 cb_rows.py       # the five target rows: n, alpha, x, WID, Lemma C x0/delta/margins
python3 tree_check.py    # acyclicity-and-connectivity on all five target trees
```

### Digests (SHA-256, this route's own scratch files and their stdout)

| file | sha256 |
|---|---|
| `cb_network.py` | `2e6297137906b8e9a500c320ade975261d3b8e11f95a170b17066a3bf00a9232` |
| `transport.py` | `baab32d2e2b06d7256a3cd9366989af08de7e201274efe64caeb81d0e4f88b1b` |
| `spectral_node.py` | `b7803df29026e3b1292df4249c777f13316cefde847c170127d9edab3812898c` |
| `cb_rows.py` | `758184b78fa5925b9fa214195791675e9a3a2334f4a20b210310a08072762243` |
| `tree_check.py` | `874fb035912bcd3f6724886f568ce00d9ae0a9a593af1a072a414c9c6f4d9266` |
| `out_cb_network.txt` (stdout) | `6a88b556a8386c6b587a65a1c2d9df554aae6230b8fdf0373b2cb31ed42844d9` |
| `out_transport.txt` (stdout) | `547c3e36d262a059914d9f026e3a2066f55c487e5138d97692978aec5c86e532` |
| `out_spectral_node.txt` (stdout) | `73d594d40673864fd8dd62983d2688b48db089bc37644ff73e1dc514da05e108` |
| `out_cb_rows.txt` (stdout) | `e16aec1cbb0bc0277965df9115e8b1e30b7f440206d078713cb7169fd397cc69` |
| `out_tree_check.txt` (stdout) | `dff86196660c24cb783129da20324a1e8cf90aed8f1922babe8a56e5a51b7f4a` |

No wall-clock, PID, or host fields entered any hashed output. All census/count values above are exact integers or
exact `fractions.Fraction`s produced by the scripts above; none is a literal typed in by hand — every number is
computed by the generator whose digest is listed, and cross-checked, where stated, against the generic
(independently coded) tree-DP evaluator or brute-force enumeration.
