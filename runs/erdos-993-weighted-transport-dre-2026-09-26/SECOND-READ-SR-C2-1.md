# Second Read

Isolated second read `SR-C2-1`, Cycle 2, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993). Object: the
ternary-cover second eigenvalue (synthesis S1, S2; `## Registrations` item 2). Date 2026-09-26.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(Chartered as Claude Opus 5.5 at high effort. The runtime id above is copied verbatim from what my session exposes.)

**Boot.** I am operating within VerityOS. I read exactly the two boot files the protocol permits:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both in full. I read
each in two byte-range reads: first the opening span, then the remainder before close. I loaded no other
VerityOS subsystem. There were no memory, conversation-log, operations, logs or inbox reads or writes, because the protocol's
isolation rule overrides the task-type map. The harness placed the project `CLAUDE.md` and the user auto-memory index in my
context at session start. I did not open either file, and nothing below relies on them.

**Read-boundary disclosures.**
1. I read only capsule members, the two boot files, and my own scratch files.
2. To check whether my output and scratch directories existed, I ran a non-recursive `ls` on `<run root>/scratchpad/` and
   `<run root>/second-reads/`. This showed only directory names. I opened nothing in them except my own new
   `scratchpad/c2-sr-SR-C2-1/` and `second-reads/SR-C2-1/`.
3. Inside capsule members, I ran `grep -n` on the headings and on terms (`R4`, `Johnson`, `PSD` and similar) of the T1 return,
   the two critiques, the T adjudication, the allocation, the Stage 1 gate and the controller facts. No search was rooted above a
   capsule member.
4. I ran no `lake`/`lean`, used no network, made no installs and started no background jobs. I did not read Mathlib, because
   nothing here needs a Lean API.

## Identity and seal audit

- **Capsule** `control/c2-second-read/SR-C2-1-PACKET-MANIFEST.json` (stage `cycle-2-second-read-SR-C2-1`, 17 files).
  - I recomputed the seal as the SHA-256 of the manifest minus `seal_sha256`, serialized with `sort_keys`, separators
    `(",",":")` and no trailing newline. It is `980cf1519f2558cd9b25e13a85d38a57b4485ce2e0107d0cc6c507e833451856`. This
    **matches** both the stored field and the wrapper's value.
- **Members:** all 17 match their listed SHA-256 and byte count (`ALL True`).
  - `SEMANTIC-CONTRACT.md` `ee7ca2e2…`
  - `SOLUTION-CONTRACT.md` `3168e7a1…`
  - `control/C2-ALLOCATION.md` `0eb59050…`
  - `control/C2-SECOND-READ-BRIEF-SR-C2-1.md` `584a2621…`
  - `control/C2-SECOND-READ-PROTOCOL.md` `3a2cf768…`
  - `control/C2-STAGE1-GATE.md` `7d196f53…`
  - `control/C2-STAGE6-CONTROLLER-FACTS.json` `ddc0754f…`
  - `control/C2-STAGE6-PACKET-MANIFEST.json` `ee05d0fe…`
  - `control/PATH-CHECK-c2-second-read-briefs.json` `660215f2…`
  - `control/SOURCE-DIGESTS.json` `e82494df…`
  - `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` `cb8000c3…`
  - `cycles/cycle-2/stage3/returns/T1/RETURN.md` `8c73a6da…`
  - `cycles/cycle-2/stage4/critics/T1/F/CRITIQUE.md` `4d8f2522…`
  - `cycles/cycle-2/stage4/critics/T1/U/CRITIQUE.md` `077586c7…`
  - `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md` `eb0ccb00…`
  - `cycles/cycle-2/stage6/SYNTHESIS.md` `3d30cc4b…`
  - `sources/authority/CLAIM-IDENTITY.json` `eba20be3…`
- The path check `control/PATH-CHECK-c2-second-read-briefs.json` shows 0 findings over 7 files.
- The registry snapshot has 438 claims with 438 unique keys. The master `sources/authority/CLAIM-IDENTITY.json` has 434 claims. The
  four run-local keys not in master are:
  - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`
  - `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`
  - `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`
  - `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`

  This agrees with the brief's "438 claims".
- Origin model disclosures, as they appear on the faces:
  - T1: Claude Sonnet 5 (`claude-sonnet-5`).
  - C-T1-F and C-T1-U: chartered opus/medium, runtime `claude-opus-5-5[1m]`.
  - T adjudicator: opus/high, `claude-opus-5-5[1m]`.

## Statements read

- **SR-C2-1a (S1, the theorem).**
  - *Setting.* Let `N ≥ k ≥ 2`. Let `L_j = {h ∈ {0,1,2}^N : |supp h| = j}`, and write `h ⋗ g` iff `g` is `h` with one nonzero
    coordinate set to 0. `B` is the `L_k × L_{k−1}` cover matrix.
  - *Claim.* `BBᵀ` (on `L_k`) and `BᵀB` (on `L_{k−1}`) have `λ₁ = 2k(N−k+1)`, which is simple with eigenvector `𝟙`. On `𝟙^⊥`
    they have `λ₂ = 2(k−1)(N−k+1)`, with multiplicity exactly `N`.
  - *Quadratic form of record.* `Σ_{g∈L_{k−1}} (Σ_{h⋗g} f(h))² ≤ 2(k−1)(N−k+1)·Σ_{h∈L_k} f(h)²` whenever `Σ f = 0`.
  - *Sources.* Synthesis `## Exact established results` S1; C-T1-F F1; C-T1-U R4; T adjudication item 3, E1 and G-SPEC.
- **SR-C2-1b (S2).**
  - *Claim.* `χ_J` with `|J| = r ≤ k−1` is an eigenvector of the cover operator with eigenvalue `2(k−r)(N−k+1)`.
  - *Also to confirm.* The `χ_J` span only `Σ_{r<k} C(N,r)` dimensions, so T1's "complete eigenbasis" obligation is false as
    posed.
  - *Sources.* T1 return, Step 2 items 2–4; C-T1-F F1; C-T1-U F2/F3; T adjudication item 2.
- **SR-C2-1c (the key).**
  - *Proposal.* `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`, VERIFIED `proved_informal`. The statement is S1 in quadratic form.
  - *Attribution.* C-T1-F and C-T1-U jointly (critic-derived); T1 for the attaining family.
  - *Fence.* Abstract poset only. It enters (HALL) only through Lemma C's composition at three CB rows.
  - *Sources.* Synthesis `## Registrations` item 2 and the brief.

## Independent re-derivation

I derived everything below from the definitions. I did not copy any seat's code, and I cite no census or controller prior as
evidence.

**Notation.** Let `D : ℝ^{L_k} → ℝ^{L_{k−1}}` be `(Df)(g) = Σ_{h⋗g} f(h)`, so `D = Bᵀ`. Let `U = Dᵀ`, so
`(Uφ)(h) = Σ_{g⋖h} φ(g)`. Then:
- `BBᵀ = UD` on `L_k`, with entries counting common lower covers;
- `BᵀB = DU` on `L_{k−1}`, with entries counting common upper covers. This is the operator T1 calls "`BBᵀ`" with its transposed
  `B`.

The quadratic form's left side is `‖Df‖² = ⟨f, UDf⟩`. Write `|L_j| = 2^j C(N,j)` and `Z′ = N−k+1`.

**Step 1: symmetry.** Let `σ_t` swap the values 1 and 2 in coordinate `t`. It preserves supports and the cover relation, so it
commutes with `D` and `U`. The group `G = ⟨σ_t⟩ ≅ (ℤ/2)^N` is abelian, and its characters are indexed by `J ⊆ [N]`.

**Step 2: isotypic basis.** Set `ε(1) = 1` and `ε(2) = −1`. For `J ⊆ S ⊆ [N]` with `|S| = j`, let
`e_{J,S}(h) = [supp h = S]·∏_{t∈J} ε(h_t)`.
- For fixed `S`, the `2^j` functions `{e_{J,S} : J ⊆ S}` are the characters of `{±1}^S`. They are orthogonal, each with squared
  norm `2^j`.
- So the full family over all `(J, S)` is an orthogonal basis of `ℝ^{L_j}`. The count checks: `Σ_{|S|=j} 2^j = |L_j|`.
- Since `σ_t e_{J,S} = (−1)^{[t∈J]} e_{J,S}`, the space `V_J^{(j)} = span{e_{J,S} : S ⊇ J}` (dimension `C(N−r, j−r)`, `r = |J|`)
  is the `J`-isotypic component.
- The components are mutually orthogonal and exhaust the layer. Every `G`-equivariant operator maps `V_J^{(j)}` into
  `V_J^{(j′)}`.

**Step 3: action of `D` and `U` (exact identities).**
- **`D` identity:** `D e_{J,S} = 2·Σ_{i∈S∖J} e_{J,S∖{i}}`.
  - Proof: `(De_{J,S})(g) ≠ 0` only if `supp g = S∖{i}` for some `i ∈ S`. The covers of such a `g` with support `S` are `g` with
    `h_i = c`, `c ∈ {1,2}`.
  - Their sum is `∏_{t∈J∖{i}} ε(g_t)·Σ_c ε(c)^{[i∈J]}`. This is `0` if `i ∈ J`, and `2·e_{J,S∖{i}}(g)` if `i ∉ J`.
- **`U` identity:** `U e_{J,T} = Σ_{j∉T} e_{J,T∪{j}}`.
  - Proof: a `g ⋖ h` has support `T` iff `supp h = T∪{j}` and `g` is `h` with `j` zeroed; that `g` is unique.
  - Since `j ∉ J` (as `J ⊆ T`), the value is `∏_{t∈J} ε(h_t) = e_{J,T∪{j}}(h)`.
- **Reduction to the Boolean lattice.** Identify `e_{J,S}` with the set `S∖J ⊆ [N]∖J`, and write `n = N−r`, `m = j−r`. Then:
  - `D|V_J = 2d`, the Boolean down operator `d[A] = Σ_{a∈A}[A∖a]`;
  - `U|V_J = u`, the Boolean up operator `u[A] = Σ_{b∉A}[A∪b]`.

  The basis has constant norm on each layer, so these matrices are the orthonormal-basis matrices. Hence `UD|V_J^{(k)} = 2ud` on
  level `k−r`, and `DU|V_J^{(k−1)} = 2du` on level `k−1−r`.
  - This agrees with C-T1-F's and C-T1-U's block forms:
    - `DU|V_J = 2(N−k+1)I + 2A(J(N−r, k−1−r))`;
    - `UD|V_J = 2(k−r)I + 2A(J(N−r, k−r))`.
  - The link is `du = (n−m)I + A` and `ud = mI + A`, where `A` is the Johnson adjacency: sets meeting in `m−1` elements have
    exactly one common superset and exactly one common subset.

**Step 4: Boolean and Johnson spectra (re-derived, not cited).** Work on `2^{[n]}`, with `E_m` the functions on the `m`-sets.
- **Commutation.**
  - `(du)[A] = (n−m)[A] + Σ_{a∈A, b∉A}[A∖a∪b]`.
  - `(ud)[A] = m[A] + Σ_{a∈A, b∉A}[A∖a∪b]`.
  - So `d_{m+1}u_m − u_{m−1}d_m = (n−2m)I` on `E_m`.
- **Raising from a kernel.** Let `K_i = ker d_i ⊆ E_i`, with `K_0 = E_0`. For `φ ∈ K_i`, induction on `s` gives
  `d u^s φ = s(n−2i−s+1) u^{s−1}φ`. The inductive step uses `(s−1)(c−s+2) + (c−2s+2) = s(c−s+1)` with `c = n−2i`. Hence, on
  `u^{m−i}K_i ⊆ E_m`:
  - `ud` acts as `(m−i)(n−m−i+1)`;
  - `du` acts as `(m−i+1)(n−m−i)`.
- **Dimensions.**
  - For `m ≤ n/2`, `d_m u_{m−1} = ud + (n−2m+2)I` is positive definite. So `u_{m−1}` is injective, `d_m` is onto, and
    `dim K_m = C(n,m) − C(n,m−1)`.
  - `‖u^sφ‖² = ∏_{l=1}^{s} l(n−2i−l+1)·‖φ‖² > 0` for `s ≤ n−2i`. So `u^{m−i}` is injective on `K_i` whenever `i ≤ n−m`.
- **Completeness.** For consecutive `i`, the `ud`-eigenvalues differ by `(m−i) + (n−m−i) = n−2i > 0`, so they are distinct. The
  summands `u^{m−i}K_i` (`0 ≤ i ≤ min(m, n−m)`) are therefore orthogonal eigenspaces. Their dimensions telescope to
  `C(n, min(m, n−m)) = C(n,m)`, so they exhaust `E_m`.
- **Johnson eigenvalues.** `A(J(n,m)) = ud − mI` has eigenvalues `θ_i = (m−i)(n−m−i) − i`, with multiplicity
  `C(n,i) − C(n,i−1)`, for `0 ≤ i ≤ min(m, n−m)`.
- **ℕ guards.** Each factor is non-negative on this range: `m−i ≥ 0` and `n−m−i ≥ 0` by `i ≤ min(m, n−m)`. `C(n,−1) := 0`.

**Step 5: assembly (both layers).** In the block `V_J` (`r = |J|`), both operators have eigenvalues
`μ(r,i) = 2(k−r−i)(N−k+1−i)`, with multiplicity `C(N,r)·(C(N−r,i) − C(N−r,i−1))`. The ranges are:
- on `L_k`: `0 ≤ r ≤ k` and `0 ≤ i ≤ min(k−r, N−k)`;
- on `L_{k−1}`: `0 ≤ r ≤ k−1` and `0 ≤ i ≤ min(k−1−r, N−k+1)`.

The spectrum then reads off as follows.
- **`(r,i) = (0,0)`:** `μ = 2k(N−k+1) = λ₁`, with multiplicity 1. Its eigenvector is `u^m` of the constant on `∅`, which is
  `Σ_S e_{∅,S} = 𝟙`.
- **Every other pair** has `r + i ≥ 1`:
  - **`i ≥ 1`:** `μ ≤ 2(k−1)(N−k) < 2(k−1)(N−k+1)`. The strict step **uses `k ≥ 2`**.
  - **`i = 0`, `r ≥ 2`:** `μ = 2(k−r)(N−k+1) ≤ 2(k−2)(N−k+1) < λ₂`. This uses `N−k+1 ≥ 1`, i.e. **`N ≥ k`**.
  - **`i = 0`, `r = 1`:** `μ = 2(k−1)(N−k+1) = λ₂`, with total multiplicity `C(N,1) = N`. This block exists on `L_{k−1}` only
    because `r = 1 ≤ k−1`, i.e. **`k ≥ 2`**. Its eigenvector in block `{t}` is `Σ_{S∋t} e_{{t},S} = χ_{{t}}`, T1's singleton flip
    character.
- **Gap to the top.** `λ₂ < λ₁` because `N−k+1 ≥ 1`.
- **Conclusion.** On each layer, `λ₁` is simple with eigenvector `𝟙`. The largest eigenvalue on `𝟙^⊥` is `λ₂`, with
  multiplicity exactly `N`. No eigenvalue lies strictly between `λ₂` and `λ₁`.
- **Quadratic form.** For `Σf = ⟨f,𝟙⟩ = 0`, `f` lies in the sum of the eigenspaces other than `λ₁`. So
  `‖Df‖² = ⟨f, UDf⟩ ≤ λ₂‖f‖²`, with equality at `f = χ_{{t}}` on `L_k`.
- **ℕ subtractions.** `k−1` (by `k ≥ 2`), `N−k+1 = N+1−k` (by `N ≥ k`) and `k−r−i ≥ 0` (by the ranges) are all
  the integer values.

**Where `k ≥ 2` matters.** It enters in exactly two places: the strict inequality for `i ≥ 1`, and the existence of the
`r = 1` block on `L_{k−1}`. At `k = 1` the formula gives `λ₂ = 0`, and the eigenvalue-and-multiplicity clause fails:
- on `L_0`, `𝟙^⊥ = {0}`;
- on `L_1`, `BBᵀ` is the all-ones matrix, so eigenvalue 0 has multiplicity `2N−1`, not `N`.

My instrument confirms both, exactly, for `N = 2..6`. The quadratic form itself holds trivially at `k = 1`, because
`(Σ_h f(h))² = 0`.

**S2 (flip characters).** On `L_j` (`j ∈ {k−1, k}`), `χ_J = Σ_{S⊇J} e_{J,S}` is the all-ones function on level `j−r` of
`2^{[N]∖J}`, which is the `i = 0` summand. So it is an eigenvector with eigenvalue `2(k−r)(N−k+1)` on **both** layers:
- for `r ≤ k−1` on `L_{k−1}`;
- for `r ≤ k` on `L_k`, where `r = k` gives eigenvalue 0.

This agrees with T1's direct case analysis (Step 2 item 2), which I also checked line by line:
- `i ∈ J` removals kill `χ_J`;
- `i ∉ J` removals preserve it;
- when `J ⊄ supp g`, the colour pair `±1` of the missing coordinate cancels.

Distinct `J` lie in distinct isotypic components, and each `χ_J` is nonzero, so the flip characters are linearly independent.
They span exactly `Σ_{r=0}^{k−1} C(N,r)` dimensions, counting `χ_∅ = 𝟙`.
- **On `L_{k−1}`** (T1's layer):
  - The layer has dimension `2^{k−1}C(N,k−1) = Σ_r C(N,r)·C(N−r,k−1−r)`.
  - This is strictly larger than `Σ_r C(N,r)` for every `N ≥ k ≥ 2`, because the `r = 0` term `C(N,k−1) > 1`.
  - At `(N,k) = (7,4)`: **64 = 1+7+21+35**, against **280 = 2³·C(7,3) = |L_3|**. The 280 is the dimension of the rank-`(k−1)`
    layer. At `(4,3)`: 11 against 24.
- **On `L_k`:**
  - Even allowing `|J| ≤ k`, the span is `Σ_{r≤k} C(N,r)`, which is 99 of 560 at `(7,4)`.
  - It is complete only in the degenerate case `N = k`, and there only by including `J = [N]`, the eigenvalue-0 vector that S2's
    range `r ≤ k−1` excludes.

The remaining eigenvectors are the "descendants" `u^{m−i}K_i` with `i ≥ 1` inside each block.

**Own exact instruments** (`scratchpad/c2-sr-SR-C2-1/`; stdlib; integers and `Fraction` only, no floating point).
- **`sr_spectrum.py`** covers 17 pairs `(N,k)`: (2,2), (3,2), (3,3), (4,2), (4,3), (4,4), (5,2), (5,3), (5,4), (5,5), (6,2), (6,3),
  (6,4), (6,5), (7,2), (7,3), (7,4). That is 34 operators, both layers of each pair, including the edge cases `N = k`. On every
  operator:
  - **(a)** the block identity holds exactly on every basis vector `e_{J,S}`, for all `J` of all sizes;
  - **(b)** my predicted multiplicities sum to the dimension;
  - **(c)** `∏_{λ∈pred}(M − λI)` annihilates every basis vector. `M` is symmetric, so the spectrum lies in the predicted set;
  - **(d)** exact traces `tr(Mᵉ)`, `e < #distinct`, solved as a Fraction Vandermonde system, give the multiplicities. They equal
    the prediction, so the **complete spectrum** is as derived;
  - **(e)** `λ₁ = 2k(N−k+1)` is simple, `M𝟙 = λ₁𝟙`, the second value is `2(k−1)(N−k+1)` with multiplicity `N`, and nothing lies
    strictly between;
  - **(f)** every `χ_J` (all `J`, `|J| ≤` layer rank) is an exact eigenvector with eigenvalue `2(k−r)(N−k+1)`. They are pairwise
    orthogonal and nonzero, and span `Σ C(N,r)`;
  - **(g)** the quadratic form holds on 40 random zero-sum integer `f` per pair, with exact equality at every `χ_{{t}}` on `L_k`.
    Fact D's companion `Σ_g d_X(g)² ≤ λ₂|X| + 2Z′|X|²/|L_k|` holds on 40 random `X` per pair. The companion is not an assigned
    statement; it is checked only for SR-C2-2's convenience.

  Output: `ALL_OK True`.
- **`sr_johnson_k1.py`** has three parts:
  - **(1)** the Boolean `ud`, `du` and Johnson spectra of Step 4, plus the commutation identity entrywise, for all `n ≤ 9` and
    `0 ≤ m ≤ n` (54 cases), by exact annihilation and traces;
  - **(2)** the `k = 1` control, with exact spectra for `N = 2..6`: the multiplicity clause fails, as above;
  - **(3)** `(8,3)` and `(8,4)`, both layers (dimensions up to 1,120): complete spectrum as predicted, `λ₂` of multiplicity 8,
    nothing between.

  Output: `ALL_OK True`.
- **Samples.**
  - `(7,4)`, `L_3` (dim 280): `{32:1, 24:7, 18:6, 16:21, 12:35, 8:49, 6:84, 4:63, 2:14}`.
  - `(7,4)`, `L_4` (dim 560): the same nonzero part, plus `0:280`.
- The instruments are independent of T1's `spectral_node.py`, of C-T1-F's LDLᵀ, of C-T1-U's annihilating polynomial and of the
  T adjudicator's PSD/nullity script. I read none of their code. They use a different method: an explicit block identity, and
  multiplicities fixed exactly by traces.

**Alias check (`sr_alias.py`, run on the snapshot, 438 claims).**
- **Candidate key.** It is absent from the snapshot and from master. No key contains `TERNARY`, `EIGEN`, `SPECTR` or `JOHNSON`.
- **Term search.** The full JSON of every claim was searched for 24 spectral and LYM terms:
  - zero hits for `spectr`, `eigen`, `johnson`, `ternary`, `lym`, `sperner`, `lubell`, `kruskal`, `katona`, `cauchy`,
    `quadratic form`, `isotyp`, `flip character`, `boolean lattice`, `cover matrix` and `up-down`;
  - `normalized matching` hits only NM;
  - `{0,1,2}` hits two unrelated vertex labellings;
  - `shadow` and `expansion` hit independent-set shadow and counting keys.
- **Patterns.** Every registered `alias_patterns` regex, and every registered alias of more than six characters, was matched
  against the candidate name and its statement text. There were zero hits.
- **Token `COVER`.** It appears in 31 keys, all in the vertex-cover or recovery sense (`COVER3`, `COVER4`, `GRAPH-COVER-…`,
  `…RECOVERY…`). That is a lexical echo only; here "cover" means the Hasse cover relation.
- **Mathematical nearest neighbour.** It is `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM, run-local,
  VERIFIED).
  - Its sector `S^Q_{|Q|+k}` over a perfect matching on `N` edges is order-isomorphic to `L_k` of `{0,1,2}^N` (per edge: neither,
    `b_i` or `c_i`), and `∂_Q` is the lower shadow. So the two keys share a **carrier**.
  - The predicates differ. NM is the normalized-matching (LYM-type) set inequality `k|X| ≤ 2(N−k+1)|∂X|`, which follows from
    biregularity alone. This key is a second-eigenvalue (`L²`) statement about zero-sum functions.
  - Neither implies the other. Via Cauchy–Schwarz, this key yields Fact D's bound `|∂X| ≥ k²|X|/(λ₂ + 2Z′|X|/|L_k|)`. That bound
    is stronger than NM for small `|X|/|L_k|`, since `k²/λ₂ = k/(2Z′)·k/(k−1)`, and weaker for large `|X|`.
- **Conclusion.** There is no duplication. There is a partial carrier relation with NM, which should be recorded as a
  distinction.

## Findings and repairs

1. **S1 is true exactly as the brief states it.**
   - I have an independent proof (Steps 1–5), and my instruments confirm the complete spectrum exactly on 19 ternary `(N,k)` pairs
     (38 operators, both layers), well beyond the six required. That is the 17 pairs of `sr_spectrum.py` plus `(8,3)` and `(8,4)`.
   - The multiplicity is exactly `N`. `λ₂` is attained only by the `N` singleton isotypic blocks `V_{{t}}` at their top (`i = 0`)
     level, whose eigenvectors are `χ_{{t}}`.
   - The `r = 0, i = 1` value `2(k−1)(N−k)` and every `|J| ≥ 2` block lie strictly below.
   - `k ≥ 2` matters for the eigenvalue and multiplicity clause, and fails at `k = 1`. It is not needed for the quadratic form.
2. **Operator and layer convention.**
   - The synthesis's S1 wording ("the cover operator `BBᵀ` … on both layers") names one operator for two layers. The brief's
     wording (`BBᵀ` on `L_k`, `BᵀB` on `L_{k−1}`, with `B` of shape `L_k × L_{k−1}`) is the precise one.
   - T1 and C-T1-F write `BBᵀ` for the `L_{k−1}` operator, with `B` transposed. The mathematics is identical, since both have the
     same nonzero spectrum and the nonzero eigenvalues `λ₁`, `λ₂` are what the statement asserts.
   - **Repair (wording only):** the registration text fixes the convention explicitly.
3. **The key name versus the quadratic form alone.**
   - The quadratic form of record by itself says only `λ₂ ≤ 2(k−1)(N−k+1)`. A key named `…SECOND-EIGENVALUE` would then assert
     slightly more than a bare upper bound: it names the value.
   - **Repair:** the registered statement carries the exact eigenvalue form. That is `λ₁` simple with eigenvector `𝟙`; `λ₂` exact
     on `𝟙^⊥` with multiplicity `N`; nothing strictly between; equality attained at `χ_{{t}}`. The quadratic form is the form of
     record that Fact D consumes.
   - With that, the name is a predicate the statement satisfies and does not exceed. It correctly avoids "SPECTRUM". The full
     block spectrum is proved (Step 5) but is not placed in the statement.
4. **S2 is true, and more broadly than stated.**
   - It holds on both layers with the same eigenvalue `2(k−r)(N−k+1)`: `r ≤ k−1` on `L_{k−1}`, `r ≤ k` on `L_k`.
   - C-T1-F's count is confirmed and located: **64 = Σ_{r=0}^{3} C(7,r)** (including `χ_∅ = 𝟙`) against **280 = |L_3| =
     2³·C(7,3)**, the rank-`(k−1)` layer at `(N,k) = (7,4)`.
   - The span is strictly short of the layer for every `N ≥ k ≥ 2`. So T1's obligation, "a *complete* eigenbasis (not just that
     each `χ_J` is an eigenvector)", is **false as posed**.
   - T1's same paragraph also gestures at "lower-weight descendants". Those descendants are the `i ≥ 1` summands of Step 4, and
     that is the correct route, but T1 did not close it.
   - S1 rests on the isotypic and Johnson argument. S2 supplies only the attaining vectors, which are the `i = 0` tops of each
     block.
5. **T1's certification literals.**
   - Two literals are confirmed as struck:
     - "verified for every `J` … all sizes" (the code checks singletons);
     - "`formally_verified`-grade" (nothing was compiled).
   - S2's standing does not depend on them. My instrument checks every `J` of every size on 34 operators.
6. **Fence wording.** The synthesis says S1 is "used in (HALL) only through Fact D at three rows", while the brief says "through
   Lemma C's composition at three CB rows". These agree, since Fact D is the Cauchy–Schwarz step inside Lemma C (ii). I
   harmonize the wording in the registration text.
   - That composition (S14) is SR-C2-2's object. This key does not certify it, does not decide any instance of (HALL), and is
     not a Hall, flow or cut statement.
7. **Attribution.** The attribution on the face is correct: C-T1-F (F1) and C-T1-U (R4) jointly, critic-derived; T1 for the
   attaining flip-character family and the operator identity `BᵀB = 2Z′I + C`. I add two things:
   - the classical-background note: the Johnson-scheme and Boolean up–down spectra are classical, and are re-derived in-run;
   - the contract's attribution convention (SEMANTIC-CONTRACT §3).
8. **Nothing is rejected.** No hypothesis is missing, and no ℕ-subtraction is unguarded. No fence is crossed, no status is
   transferred, and no refuted mechanism is revived: this is a statement about an abstract poset, not a mechanism. The primary
   aggregate is not touched.

## Registration text

```text
KEY: E993-R30-TERNARY-COVER-SECOND-EIGENVALUE
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let N ≥ k ≥ 2 be natural numbers. For j ∈ {k−1, k} let L_j = {h ∈ {0,1,2}^N : |supp h| = j}, where supp h is the set of nonzero coordinates, so |L_j| = 2^j·C(N,j). For h ∈ L_k and g ∈ L_{k−1} write h ⋗ g iff g is obtained from h by setting one nonzero coordinate to 0. Let B be the L_k × L_{k−1} matrix with B[h,g] = 1 if h ⋗ g and 0 otherwise. Then each of the real symmetric operators BBᵀ (on ℝ^{L_k}; entries count common lower covers) and BᵀB (on ℝ^{L_{k−1}}; entries count common upper covers) has largest eigenvalue λ₁ = 2k(N−k+1), simple, with eigenvector the all-ones vector 𝟙, and its largest eigenvalue on 𝟙^⊥ is λ₂ = 2(k−1)(N−k+1), of multiplicity exactly N; no eigenvalue lies strictly between λ₂ and λ₁. The λ₂-eigenspace is spanned by the N singleton flip characters χ_{t}(h) = [h_t ≠ 0]·(+1 if h_t = 1, −1 if h_t = 2), t ∈ [N] (on L_{k−1} the same formula restricted to L_{k−1}). Quadratic form of record: for every f : L_k → ℝ with Σ_{h∈L_k} f(h) = 0, Σ_{g∈L_{k−1}} (Σ_{h⋗g} f(h))² ≤ 2(k−1)(N−k+1)·Σ_{h∈L_k} f(h)², with equality at f = χ_{t}.
HYPOTHESES (where they enter): N ≥ k (L_k nonempty; N−k+1 ≥ 1 gives λ₂ < λ₁ and places every |J| ≥ 2 block strictly below λ₂); k ≥ 2 (λ₂ > 0; the i ≥ 1 descendants 2(k−1)(N−k) lie strictly below λ₂; the singleton blocks exist on L_{k−1}). At k = 1 the eigenvalue/multiplicity clause fails (on L_1, eigenvalue 0 has multiplicity 2N−1; on L_0, 𝟙^⊥ = {0}); the quadratic form holds trivially there. Every ℕ-subtraction (k−1, N−k+1, k−r−i) is the integer value under these hypotheses.
PROOF OF RECORD: The colour flips σ_t (1↔2 at coordinate t) generate (ℤ/2)^N and commute with B. Functions on L_j split orthogonally and completely into isotypic components V_J = span{e_{J,S} : J ⊆ S, |S| = j}, e_{J,S}(h) = [supp h = S]·∏_{t∈J} ε(h_t) (dimension count Σ_{|S|=j} 2^j = |L_j|). With n = N−|J|, Bᵀ acts on V_J as 2·(Boolean down operator) and B as the Boolean up operator on the subsets of [N]∖J, so BᵀB|V_J = 2(N−k+1)I + 2A(J(N−|J|, k−1−|J|)) and BBᵀ|V_J = 2(k−|J|)I + 2A(J(N−|J|, k−|J|)), A(J(n,m)) the Johnson-graph adjacency. The Boolean commutation d_{m+1}u_m − u_{m−1}d_m = (n−2m)I gives the Johnson eigenvalues θ_i = (m−i)(n−m−i) − i, multiplicity C(n,i) − C(n,i−1), 0 ≤ i ≤ min(m, n−m). Assembled: the eigenvalues on either layer are 2(k−|J|−i)(N−k+1−i); (|J|, i) = (0,0) gives λ₁; (1,0) gives λ₂ with multiplicity N; all others are strictly smaller.
EVIDENCE: Isolated second read SR-C2-1 (independent proof; own exact instruments: complete spectrum by exact annihilation plus exact trace-Vandermonde multiplicities on 19 ternary (N,k) pairs up to (8,4), both layers, 38 operators, including N = k; the Boolean/Johnson spectra for n ≤ 9; the block identity on every isotypic basis vector; S2 for every J; the k = 1 control). Stage 4/5 instruments: C-T1-F exact Fraction LDLᵀ; C-T1-U annihilating polynomial on 20 operators; T adjudicator exact PSD/nullity on 24 operators.
COMPANION (recorded on the face, not a separate key): Flip-character eigenvectors (T1). For J ⊆ [N] with |J| = r, χ_J(h) = [J ⊆ supp h]·∏_{t∈J} ε(h_t) is an eigenvector with eigenvalue 2(k−r)(N−k+1) of BᵀB on L_{k−1} (r ≤ k−1) and of BBᵀ on L_k (r ≤ k). The χ_J span only Σ_r C(N,r) dimensions (on L_{k−1}: 64 of |L_3| = 280 at (N,k) = (7,4)), so they are not an eigenbasis; the theorem rests on the isotypic argument, and the χ_{t} are exactly its λ₂-attaining vectors.
ATTRIBUTION: Critic-derived, jointly: C-T1-F (finding F1: the complete isotypic block decomposition, λ₂ sharp with multiplicity exactly N) and C-T1-U (finding R4: the (ℤ/2)^N isotypic decomposition on both layers with the full Johnson spectrum) — r30 Cycle 2 Stage 4 critics, Claude Opus 5.5. T1 (r30 Cycle 2 route C2-T-01, Claude Sonnet 5): the attaining flip-character eigenvector family and the operator identity BᵀB = 2(N−k+1)I + C (support-swap graph). T adjudicator (Claude Opus 5.5): the PSD/nullity replay. Second read SR-C2-1 (Claude Opus 5.5). The Johnson-scheme and Boolean up–down spectra are classical; they were re-derived in-run, not cited. Codex (GPT-6) for the transport mechanism in which the bound is consumed.
FENCES: Abstract poset {0,1,2}^N only — no tree, graph, weight w_F, selector F_p, eligibility, flow, Hall or (HALL) content. It decides no instance of (HALL) or (HALL-COND) and is not a Hall, flow or cut statement. Its only use toward (HALL) is Fact D (the Cauchy–Schwarz shadow bound) inside Lemma C (ii)'s sector composition at the first eligible rank of CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492 (synthesis S14); that composition is certified, if at all, by SR-C2-2, not by this key. No status change to E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL (OPEN), E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (OPEN), (WID), NM, (INV), the R23 aggregate, E993-BETA-AGG, TREE, FOREST, TRANSFER or Erdős #993. Not formally verified (no Lean fragment; smallest open formal node: the r = 0 Boolean up–down second eigenvalue).
DISTINCTION (for control/CLAIM-DISTINCTIONS.json): vs E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING — same carrier (NM's sector over a perfect matching on N edges is order-isomorphic to L_k of {0,1,2}^N, ∂_Q the lower shadow) but a different predicate: NM is the normalized-matching set inequality k|X| ≤ 2(N−k+1)|∂X| (from biregularity alone); this key is an L²/second-eigenvalue bound on zero-sum functions. Neither implies the other (via Cauchy–Schwarz this key gives |∂X| ≥ k²|X|/(λ₂ + 2(N−k+1)|X|/|L_k|), stronger than NM for small |X|/|L_k| and weaker for large). "COVER" here is the Hasse cover relation of the ternary poset, not a vertex cover (lexical echo only with the COVER3/COVER4/GRAPH-COVER keys). No lexical, pattern or mathematical duplicate among the 438 snapshot claims.
```

## Verdicts

verdict[SR-C2-1a]: confirmed
verdict[SR-C2-1b]: confirmed
verdict[SR-C2-1c]: confirmed_with_repairs

Reasons in brief:
- **SR-C2-1a.** The theorem holds exactly as the brief states it. I have an independent proof and exact complete spectra on 19
  ternary pairs (38 operators). The multiplicity `N` comes from the singleton blocks. `k ≥ 2` is needed for the eigenvalue and multiplicity clause.
- **SR-C2-1b.** S2 holds on both layers. The count is 64 flip characters against `|L_3| = 280`, the rank-`(k−1)` layer at
  `(7,4)`. T1's completeness obligation is false as posed, and S1 rests on the isotypic argument.
- **SR-C2-1c.** The name is a predicate the statement satisfies, and there is no duplicate in the registry. Two repairs apply:
  - the statement must carry the exact eigenvalue, the multiplicity `N` and attainment, not the quadratic-form upper bound alone;
  - the operator and layer convention, and the fence wording (Fact D inside Lemma C (ii), S14 left to SR-C2-2), are made
    explicit.

  The text above is the version to register verbatim.

## Artifact inventory

Scratch directory: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-sr-SR-C2-1/`.

| File | SHA-256 | Content |
|---|---|---|
| `sr_spectrum.py` | `8fa2d583c652e24214224eaf74ed019050944b3c9d44389866669d9c8c852a7d` | exact block identity, complete spectrum (annihilation + traces), S1/S2 checks, quadratic form; 17 pairs, 34 operators |
| `out_sr_spectrum.txt` | `819d0ecc932c7a14d56dd142dd03facc6a31d114138cef946b717ab729a38154` | `ALL_OK True`; internal DIGEST `12baed55375a6c84f69ede4188171551c096cd57457cba62d8688b775d59f85b` |
| `sr_johnson_k1.py` | `4d316936c1a957258819905088ee7a4b51a02d39b9fd69c893adce1f3034cb47` | Boolean/Johnson spectra and commutation (54 cases); `k = 1` control; `(8,3)`, `(8,4)` |
| `out_sr_johnson_k1.txt` | `9e42efba159bcfe3260bc26980b26be73d7c51eb9a5dcd0cc4befba96f65ee7d` | `ALL_OK True`; internal DIGEST `7e04ff33ce52669a68a0e185ae8fe9ade9e5372dcb612e46bcfcccc3bb0bf212` |
| `sr_alias.py` | `735bf41a12ac59c4dcdf338374b44067a60fc7189a859d10d3a71bab38b99b0d` | lexical, term and pattern alias check against the snapshot |
| `out_sr_alias.txt` | `9c332d53fc56385d1c9e8abd854cef8dc4e74804e5c21b77bb693003052f9a62` | internal DIGEST `d25352189c5b5a28cceed9da2903f278f1091c9905be83b9570175ea306f5fb7` |

**Replay.** Run these commands:

```text
cd scratchpad/c2-sr-SR-C2-1 && python3 -B sr_spectrum.py
cd scratchpad/c2-sr-SR-C2-1 && python3 -B sr_johnson_k1.py
cd <run root> && python3 -B scratchpad/c2-sr-SR-C2-1/sr_alias.py
```

- Timings: about 12 s, about 37 s, and under 1 s.
- `sr_johnson_k1.py` imports `sr_spectrum.py` from the same directory.
- I replayed `sr_spectrum.py` and `sr_alias.py` once each, and both outputs were byte-identical.
- The Python standard library only was used. `-B` means no `__pycache__` was written.
- No sealed member was edited.
