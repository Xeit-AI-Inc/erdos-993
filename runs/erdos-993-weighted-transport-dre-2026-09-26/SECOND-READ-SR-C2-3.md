# Second Read

Isolated second read `SR-C2-3`, Cycle 2 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted
mixed-boundary transport). Object: the `CBstar` sector deletion-deficit theorem and its `t ≥ 2` corollary (synthesis S4, with S5,
S6 as inputs; `## Registrations` item 4). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the two files the protocol grants). I loaded no other VerityOS
subsystem: no memory, conversations, modules, skills, logs or decisions were opened or written. The protocol confines my writes to
this file and `scratchpad/c2-sr-SR-C2-3/`, so I wrote no conversation log.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The runtime id is the one my session's system context reports verbatim. The transport parameter is as the dispatch states it; I
cannot observe it from inside the session.)

## Identity and seal audit

- **Capsule** `control/c2-second-read/SR-C2-3-PACKET-MANIFEST.json` (stage `cycle-2-second-read-SR-C2-3`, 17 files). I recomputed
  the inner seal as the SHA-256 of the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",",":")`, no trailing
  newline): **`472463072a41ebcca16566c9a9521c11382ab57f470ae55002b7d7406344401a`**. It equals the stored value and the wrapper.
  I did this before reading any member.
- **Members: 17/17 match on SHA-256 and byte count.**

  | member | SHA-256 (prefix) | bytes |
  |---|---|---|
  | `SEMANTIC-CONTRACT.md` | `ee7ca2e2c3647555` | 17018 |
  | `SOLUTION-CONTRACT.md` | `3168e7a15baf7a7b` | 13035 |
  | `control/C2-ALLOCATION.md` | `0eb59050edcba5e6` | 12823 |
  | `control/C2-SECOND-READ-BRIEF-SR-C2-3.md` | `967e011595f0de06` | 4780 |
  | `control/C2-SECOND-READ-PROTOCOL.md` | `3a2cf76872ef1d6e` | 3338 |
  | `control/C2-STAGE1-GATE.md` | `7d196f5361b52063` | 5052 |
  | `control/C2-STAGE6-CONTROLLER-FACTS.json` | `ddc0754f3f1c9c31` | 12749 |
  | `control/C2-STAGE6-PACKET-MANIFEST.json` | `ee05d0fe10ebe162` | 6416 |
  | `control/PATH-CHECK-c2-second-read-briefs.json` (0 findings) | `660215f265351100` | 527 |
  | `control/SOURCE-DIGESTS.json` | `e82494df3e282ba9` | 232777 |
  | `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` (438 claims) | `cb8000c318a9bc5d` | 2650050 |
  | `cycles/cycle-2/stage3/returns/T2/RETURN.md` | `64dec148cdae177c` | 46715 |
  | `cycles/cycle-2/stage4/critics/T2/F/CRITIQUE.md` | `57355f5a048e2f83` | 26074 |
  | `cycles/cycle-2/stage4/critics/T2/U/CRITIQUE.md` | `4d84a085bd91a470` | 21618 |
  | `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md` | `eb0ccb003457d5dd` | 45722 |
  | `cycles/cycle-2/stage6/SYNTHESIS.md` | `3d30cc4b8c71451a` | 62952 |
  | `sources/authority/CLAIM-IDENTITY.json` (434 claims) | `eba20be33070e2cb` | 2624107 |

- **Nested seals.** I did not recompute the Stage 2–6 manifests' seals beyond my capsule; `C2-STAGE6-PACKET-MANIFEST.json` is a
  member and its digest matches, but I relied on nothing inside it.
- **Read-boundary disclosures (this seat).**
  1. The harness put the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open either
     as a source, and nothing below relies on them.
  2. One tool call displaying `SYNTHESIS.md` lines 340–720 exceeded the inline limit, and the harness saved that output to a
     session tool-result file outside the run root. I did not open that file; I re-read the same member in narrower line ranges.
  3. One `ls -la` of `second-reads/` (to confirm my output directory's parent existed). It showed directory names only
     (`SR-BUDGET`); I read nothing under it. It is outside my capsule and is disclosed here.
  4. `grep -n` was run only on capsule members (the T adjudication and the synthesis), never rooted above them. No `find`, no
     `rg`, no recursive listing.
  5. I opened no Mathlib or Lean source, ran no `lake`/`lean`, used no network, installed nothing, and started no background job
     (every script ran in the foreground and exited). Python standard library only, exact integers throughout.
  6. I did not read any seat or critic scratch (`scratchpad/c2-*` of other seats); my instrument shares no code with them.

## Statements read

| id | statement | where |
|---|---|---|
| SR-C2-3a | S4, the theorem: `max_{X ⊆ S^Q_{p+1}} (Σ_X w_F − Σ_{N_D(X)} w_F) = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})` on `CBstar(d,m,t)`, `Q = {r,v}`, `p ≥ 2`, `k = p−1`, `F ⊆ leaves`, `v ∈ F`, `P ⊆ F` | SYNTHESIS `## Exact established results` S4; origin C-T2-U "Critic-derived theorem"; T adjudication route T2 item 10 and G-CBSTAR |
| SR-C2-3b | S4, the corollary: `t ≥ 2`, `x(T) + 2 ≤ p` ⇒ no sector subfamily deletion-deficient ⇒ Hall on every sector subfamily under (D) ∪ (S); input (LB) as `n ≤ 4x` | same; C-T2-U "Critic-derived corollary" |
| SR-C2-3c | S5 (C-T2-F L1, P1) and S6 (T2's T-A, T-D-R1) as inputs, at narrowed scope; the strike of T-B (false positive at `CBstar(2,2,2)`, `p = 6`) | SYNTHESIS S5, S6, `## Refuted or narrowed mechanisms`; T2 RETURN §2–§4; C-T2-F Finding 1 and P1; C-T2-U Attack 1 |
| SR-C2-3d | the key `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (VERIFIED `proved_informal`), its attribution, the `CLAIM-DISTINCTIONS` row against `E993-R23-LITERAL-DELETE-ONLY-HALL`, and the scope note on (NM) for T-D-R1 | SYNTHESIS `## Registrations` item 4 and `## Headline verdicts` (NM row) |

Registry texts read (in the snapshot, verbatim):

- (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, VERIFIED `formally_verified` (award C1-LA4): "For every finite forest G of order n
  and every natural k: Δ_k(G) < 0 ⇒ n ≤ 4k (Δ_k = Erdos993G1.delta; k = 0 included: Δ_0 < 0 ⟺ n = 0)." The registry elsewhere
  records `delta G k = coeff G (k+1) − coeff G k`, with `coeff` the ℤ-indexed zero extension of `indepCount`. This is the forward
  difference `i_{k+1} − i_k`, the same convention as `C5LA1.forwardDifferenceDel G ∅ k`. Two internal checks agree: `Δ_0 < 0 ⟺
  n = 0`, and the attained cases `P_4` (k = 1) and `P_8` (k = 2).
- `E993-R23-LITERAL-DELETE-ONLY-HALL`, REFUTED: "For every finite ordinary tree T, natural p>=x(T)+2 under the r23 literal
  contract, and every X subset of the complete tagged top side P, |X|<=|Gamma_Delete(X)|." Its scope reads: false on the exact
  `CB(8,92)` full arm-tag top cut.
- (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`, VERIFIED `proved_informal`: `k·|X| ≤ 2(N − k + 1)·|∂_Q X|`
  on a sector whose complement `G − N_G[Q]` is a perfect matching on `N` edges. Unweighted and sector-only.

## Independent re-derivation

### Setup (hypotheses named where they enter)

- **Structure.** `T = CBstar(d,m,t)` has vertices `r, s, v`; `m` chokes `u_i ~ r`; `dm` supports `b_{il} ~ u_i`; and `t` private
  leaves `c_{ilj} ~ b_{il}`. So `n = 3 + m + dm + tdm = 3 + m + (t+1)M` with `M = dm`, and the brief's count is confirmed. The
  graph is a tree: my builder asserts connectivity (BFS) and acyclicity (union-find) separately, plus `|E| = n − 1`, on every
  instance.
- **Leaves.** The degrees are `deg r = m+1 ≥ 2`, `deg s = 2`, `deg u_i = d+1 ≥ 2`, `deg b = t+1 ≥ 2`, and `deg v = deg c = 1`.
  So **`leafSet(T) = {v} ∪ P`** exactly (asserted in code). The hypothesis "`F ⊆ leaves`, `v ∈ F`, `P ⊆ F`" is therefore the same
  as **`F = leafSet(T)`**.
- **Active weight in the sector** (`W_u := N(s_u) ∖ {u}`; erratum R30-E-b's `B ∩ W_u ≠ ∅` is the same test, since `u ∉ W_u`).
  - `W_v = {r}`, and `r ∈ B` for every sector member, so `v` is active in every sector member.
  - `W_c` is the other `t − 1` leaves of `c`'s star together with `u_i`. Since `u_i ~ r ∈ B`, `u_i ∉ B`, so `c` is active iff a
    sibling leaf of the same star is present.
  - Hence, with `F = leafSet`, **`w(B) = 1 + Σ_stars g_t(ℓ)`**, where `ℓ` is the star's leaf count in `B`, `g_t(ℓ) = ℓ` for
    `ℓ ≥ 2`, and `g_t(ℓ) = 0` otherwise.
  - The sector `S^Q_{p+1}` is in bijection with the rank-`k` states of the star forest `T − N[Q]` (`M` disjoint copies of
    `K_{1,t}`), where `k = p − 1` and `p ≥ 2` makes `k ≥ 1` honest in ℕ.

### SR-C2-3a: the theorem

1. **The deletion targets of a sector source `B`**, all in `I_p`:
   - For `q ∈ B ∖ Q`, `B ∖ {q}` is a sector target.
   - `B ∖ {r}`: `v` loses its only witness, and no private tag's witness set contains `r`. So its weight is `w(B) − 1`.
   - `B ∖ {v}`: `v` is gone, and `v` witnesses no private tag. So its weight is `w(B) − 1`.
2. **These two exits are private.** `B ∖ {r}` contains `v` but not `r`, and `B ∖ {v}` contains `r` but not `v`, so neither is a
   sector target. Each one determines `B` (add back the deleted vertex). So they are pairwise distinct across all sector sources,
   and `N_D(X) = ∂_sec X ⊔ {B∖r : B ∈ X} ⊔ {B∖v : B ∈ X}`. Therefore:

   `φ(X) := Σ_X w − Σ_{N_D(X)} w = Σ_{B∈X} (2 − w(B)) − w(∂_sec X)`.
3. **Why only weight-1 members can carry a deficit.**
   - The private exits of `B` have positive weight exactly when `w(B) ≥ 2`, and then `2(w − 1) ≥ w`. This is the precise form of
     the brief's "private exits of positive weight": for weight-1 sources the exits carry weight 0.
   - Removing a member with `w ≥ 2` from `X` removes a term `2 − w ≤ 0` and can only shrink `∂_sec X`. Weights are nonnegative,
     so `φ` does not decrease.
   - Hence `max φ` is attained on `X ⊆ X₁ = {w = 1}`. Because `v ∈ F` gives the baseline 1 and `P ⊆ F` makes every same-star
     leaf pair count, `X₁` is exactly the family `R1` in which every star is empty, centre-only or single-leaf.
4. **Inside `R1`.** Deleting a star vertex cannot create a same-star leaf pair, so every sector target of an `R1` member is an
   `R1` state of weight 1. Hence `φ(X) = |X| − |∂X|` for `X ⊆ R1_k`.
5. **Counting and the bound.** `R1` is the product of `M` "claws" (empty below `q = t+1` symbols). So
   `|R1_j| = C(M,j) q^j`. The down-degree is exactly `k` and the up-degree exactly `q(M−k+1)`, so the double count gives T-D-R1:
   `k|X| ≤ q(M−k+1)|∂X|`, that is, `|∂X| ≥ ρ|X|` with `ρ = |R1_{k−1}|/|R1_k|` (for `1 ≤ k ≤ M`).
   - If `ρ ≥ 1`, then `φ ≤ 0`, and the maximum is 0 (at `X = ∅`).
   - If `ρ < 1`, then `φ ≤ (1−ρ)|X| ≤ |R1_k| − |R1_{k−1}|`.
   - If `k > M`, then `R1_k = ∅`, and the formula gives 0 (`C(M,k) = 0`).
6. **Attainment.** When `k ≤ M`, every `R1_{k−1}` state has an empty star, hence an upper cover, so `∂R1_k = R1_{k−1}`. Then
   `X = R1_k` attains `C(M,k)q^k − C(M,k−1)q^{k−1}`.
7. **The criterion.** `C(M,k)q^k > C(M,k−1)q^{k−1}` ⟺ `q(M−k+1) > k` ⟺ **`(t+2)(p−1) < (t+1)(dm+1)`**. The side condition
   `k ≤ M` is then automatic. **At `t = 1`** this reads `3(p−1) < 2(dm+1)`, that is, **`3p < 2dm + 5`**: P8's criterion.
   - My closed-form computation gives `x = 458, 474, 490` and windows `[460,516]`, `[476,534]`, `[492,552]` at `CB(8,86/89/92)`.
   - On those windows the formula is positive exactly at `p = 460, 476, 492`, the P8 ranks.
   - At `CB(8,92)/492` it gives `R_491 − R_490` with `R_491·491 = R_490·492`.

**Own instrument, exact max-flow** (`sr_theorem.py`):

- **Coverage.** 15 configurations `(d,m,t)`: (1,1,1), (2,1,1), (2,2,1), (3,2,1), (1,2,2), (2,1,2), (1,3,2), (2,2,2), (3,2,2),
  (1,2,3), (2,1,3), (1,3,3), (2,2,3), (1,1,4), (1,2,4). Every rank `2 ≤ p ≤ α` was checked, **119 rows** in all.
- **Assertions, before any other output.**
  - Nonempty checks: `x` and `α`, with `x` scanned through rank `α` and `i_{α+1} = 0`.
  - `supply − capacity = S(T,p)` with the literal selector `F_p(T)`, where `S` is computed separately from `H_v` and `R_v`.
  - The same identity with `F = leafSet` (general (WID)).
- **Per-source facts (asserted).**
  - `w(B∖r) = w(B∖v) = w(B) − 1`.
  - The private exits are pairwise distinct.
  - `w(B) = 1` ⟺ at most one leaf per star.
  - Every star-vertex deletion from a weight-1 source has weight 1.
- **The theorem itself.** The exact deletion-only max-flow deficit (`Σ supply − maxflow`, sector sources, all deletion targets in
  `I_p`) equals the formula on **every one of the 119 rows**, and `X = R1_k` attains it. The positive rows are exactly the
  non-eligible low ranks (for example `CBstar(3,2,2)`: 17, 117, 405, 675, 243 at `p = 2..6`; `x = 7`).
- **Eligible rows**, with `F_p(T) = leafSet` on every one. Every row has `S < 0`, deletion deficit 0 and mixed deficit 0:

  | row | supply | capacity | `S` |
  |---|---|---|---|
  | `CBstar(2,2,2)/7` | 2194 | 3888 | −1694 |
  | `(3,2,2)/9` | 67470 | 103638 | −36168 |
  | `(3,2,2)/10` | 31302 | 67470 | −36168 |
  | `(1,2,3)/6` | 336 | 653 | −317 |
  | `(1,3,3)/8` | 7914 | 12495 | −4581 |
  | `(2,2,3)/9` | 48525 | 72744 | −24219 |
  | `(2,2,3)/10` | 24124 | 48525 | −24401 |

### SR-C2-3b: the corollary

1. **The (LB) input.** `x = x(T)` is `Nat.find (Δ_k(T) < 0)`, which exists through rank `α` because `Δ_α = −i_α < 0`. So
   `Δ_x(T) < 0` for the tree `T` (a forest). (LB), at its registered statement with `k = x`, gives **`n ≤ 4x`**, which is exactly
   what the corollary uses. (LB) is applied at its registered statement only.
2. **The chain.** `x + 2 ≤ p` makes `p − 1 ≥ x + 1` honest in ℕ, so `4(p−1) ≥ 4x + 4 ≥ n + 4`. Multiplying by `t + 2`:
   `4(t+2)(p−1) ≥ (t+2)(n+4)`.
3. **The identity** (with `n = 3 + m + (t+1)M`), by hand:
   `(t+2)(n+4) − 4(t+1)(M+1) = (t+1)(t−2)M + tm + 2m + 3t + 10`.
   - For `t ≥ 2` every term is `≥ 0`, and `3t + 10 > 0`. So `(t+2)(p−1) > (t+1)(M+1)`, and by step 7 the maximum deficit is 0.
   - The `(t−2)` factor is an honest ℕ subtraction only because `t ≥ 2`. For `t = 1` the identity lives in ℤ, the right side can be
     negative, and the three `CB` rows show that the corollary genuinely fails there.
4. **Mixed relation.** `N_{D∪S}(X) ⊇ N_D(X)` and weights are nonnegative, so the weighted Hall inequality holds on every
   `X ⊆ S^Q_{p+1}` under (D) ∪ (S), for this `F`.
5. **Grid** (`sr_tb_and_grid.py`; closed form `I(CBstar) = x(1+x)f^M + (1+2x)g^m`, `f = (1+x)^t + x`, `g = f^d + x(1+x)^{td}`).
   - The closed form is my own. It equals a generic rooted tree DP on 9 trees up to `CBstar(8,12,2)` (`n = 303`) and brute-force
     counts on 3.
   - Coverage: 1,200 trees, `t = 1..5`, `d = 1..10`, `m ≤ 30` (`t ≤ 3`) or `m ≤ 15` (`t = 4, 5`).
   - Results: `n ≤ 4x` on all 1,200 (an instance of (LB), not evidence for it); the identity holds on all; for every `t ≥ 2` no
     `p ∈ [x+2, α+1]` has a positive formula value; zero violations.
6. **Is the exclusion `F = {v}` needed?**
   - *As a hypothesis it is redundant.* `P ⊆ F` with `P ≠ ∅` (`d, m, t ≥ 1`) already excludes it.
   - *As a fence it is needed.* The theorem's formula is false for `F = {v}`. Every sector member then has weight 1, both private
     exits have weight 0, and the maximum deficit is the unweighted `max_X |X| − |∂X|` over the whole star-forest layer. My
     max-flow gives, for example, 51 at `CBstar(2,2,2)/5` (formula 0; this reproduces the T adjudicator's 51), 1140/1488/731 at
     `(3,2,2)/5,6,7`, and 5 at `(1,2,3)/4`.
   - *All of these ranks are non-eligible.* On every eligible small row, `F = {v}` has deficit 0 as well, but that is unproved.
   - *The literal selector does take the value `{v}`.* `F_α(T) = {v}` at `p = α` on `CBstar(2,2,2)`, `(1,3,2)` and `(3,2,1)`.
     Those ranks are non-eligible, and the source layer `I_{α+1}` is empty there. So the fence is not vacuous.
   - *`v ∉ F`* (for example `F = P`, the literal selector at `(1,3,2)/4`) is trivially non-deficient: `B∖r` carries the full
     weight. My max-flow gives 0 on all 119 rows with `F = P`.
7. **Bearing on (HALL).** The corollary is a statement for `F = leafSet(T)`. It bears on the (HALL) network at `(T, p)` only
   where `F_p(T) = leafSet(T)`. That holds on every eligible row I computed, and at 71 of the 119 rows overall. It is not proved
   for any eligible window (C-T2-F Remaining obligation 4; the T adjudicator's G-CBSTAR fence).

### SR-C2-3c: inputs S5, S6 and the T-B strike

- **L1** (C-T2-F): for `F = a{v} ∪ bP`, the whole-sector balance is
  `a[R_k − R_{k−1} + N^max_{k−1}] − b[G_k + G_{k−1} − G^max_{k−1}]`.
  - *Re-derived.* The whole-layer image is the non-maximal in-sector states plus the private exits `B∖v` and `B∖r`, each of weight
    `b·starweight(B)`.
  - *Terms.* The maximal states are those with every star centre-only or full, so `N^max = (x + x^t)^M` (`(2x)^M` at `t = 1`) and
    `G^max = M·g(t)·x^t(x + x^t)^{M−1}`. Also `R = f^M` and `G = M·w_t·f^{M−1}`.
  - *Check.* Asserted equal to the literal balance for `(a,b) ∈ {(1,1),(1,0),(0,1)}` on all 119 rows. **Confirmed.**
  - *Covers every selector.* `F_p` is `Aut(T)`-invariant and `Aut(T)` is transitive on `P`, so `F_p ∩ P ∈ {∅, P}`.
- **P1** (C-T2-F), `t = 2`. All three parts **confirmed**.
  - **(i)** `x ≥ M+1`. `I(T) = x(1+x)f^M + (1+2x)Σ_j C(m,j)x^j(1+x)^{2dj}f^{d(m−j)}`, where `f = 1 + 3x + x²` is real-rooted and
    palindromic.
    - Each `P_j` is real-rooted and palindromic about `c_j = M + j ≥ M`, so `(1+2x)P_j` has `Δ_k ≥ 0` for `k ≤ c_j`. At `k = c_j`
      use `P_{c+1} = P_{c−1}`.
    - `x(1+x)f^M` has `Δ_k = F_k − F_{k−2} ≥ 0` for `k ≤ M+1`.
    - Checked on the 300 `t = 2` grid trees.
  - **(ii)** Whole sector non-deficient for `p ≥ M+2` unless `F = {v}`. With `φ = k−1−M ≥ 0` (honest, since `k − 1 ≥ M`):
    - `N^max_{k−1} = C(M,φ)`;
    - `G_k = 2M[x^{M−1−φ}]f^{M−1} ≥ 2(M−φ)3^{M−1−φ}C(M,φ) ≥ 2C(M,φ)` for `φ ≤ M−1`;
    - hence the balance is at most `−C(M,φ) < 0`. The `F = P` case is `≤ 0` trivially.
  - **(iii)** `𝒲 = f^{M−1}(1 + 3x + (1+2M)x²)` is nonincreasing from `k = M+2` on, by palindromy of `f^{M−1}` about `M−1`.
    Checked on the 300 grid trees.
  - **"S4 subsumes P1(ii)" is accurate for `F = leafSet`.** At `t = 2` and `k ≥ M+1`, `(t+2)k = 4k > 3(M+1)`, so the S4 formula
    vanishes at every `p ≥ M+2`, not only at eligible ranks, and it covers all subfamilies. The remaining selectors `F = P` and
    `F = ∅` are the trivial `v ∉ F` case. P1(i) is independent information.
- **T-A** (T2): `f_t = (1+x)^t + x`, `w_t = Σ_{s≥2} s·C(t,s)x^s`, `𝒲 = f^{M−1}(f + M w_t)`.
  - Asserted equal to the literal sector count and weight at **every** local rank on all 15 configurations.
  - Valid under `F ⊇ {v} ∪ P` (= `leafSet`) and uniform `t` in the `CBstar` root-plus-arm sector only; the baseline 1 needs
    `v ∈ F`. **Confirmed at that scope.**
- **T-D-R1** (T2): `k|X| ≤ q(M−k+1)|∂X|` on the `q`-ary cube (`M` coordinates, each empty or one of `q` symbols).
  - Proof by exact biregularity (down-degree `k`, up-degree `q(M−k+1)`).
  - `sr_tdr1_alias.py` asserts both degrees and the layer size `C(M,k)q^k` on 24 `(M,q,k)` layers, and checks the inequality on
    every one of 80,950 nonempty subsets of the small layers. Zero failures.
  - With heterogeneous alphabets (sizes 2, 3, 4) the rank-0→1 up-degrees are `{5, 6, 7}`, so biregularity fails and no statement
    is made there.
  - At `q = 2` it is NM's statement (`N = M`), so it is not new there. **Confirmed at uniform `t`.**
- **T-B strike — reproduced** (`sr_tb_and_grid.py`, literal enumeration). At `CBstar(2,2,2)`, `p = 6`, `F_6 = leafSet`
  (9 leaves; non-eligible, `x = 5`):
  - `𝒲_5 = 504 > 𝒲_4 = 435`, so T-B fires;
  - the literal deletion image is 434 in-sector (one unreachable lower state, weight 1) plus 720 out-of-sector (`B∖r`, `B∖v`),
    for a total of **1154**;
  - the whole-sector balance is −650, and the maximum subfamily deficit is 0.

  At the eligible `CBstar(2,2,2)/7` there are 4 unreachable lower sector states, of weight 12 (C-T2-U's 4 and C-T2-F's 12 both
  reproduced). On my nine T-B configurations T-B has **13 false positives**, at (2,2,2)/5,6; (3,2,2)/7,8; (2,2,3)/5,6,7;
  (1,3,3)/5,6; (1,2,2)/4; (2,1,3)/4; and (1,2,4)/4,5.

  Both defects are real: T-B omits the out-of-sector targets and counts unreachable maximal states. At `t = 1` both vanish, and
  T-B is P8. **The strike is confirmed.**

### SR-C2-3d: key, predicate, alias check

- **Predicate check.** The name `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` asserts that an exact value of a deletion deficit
  on a `CBstar` sector is established. The statement gives exactly that: the exact maximum over sector subfamilies. The name does
  not assert Hall, non-deficiency, (HALL) or anything about the aggregate, so it asserts no more than the statement. It is a
  predicate the statement satisfies. The `t ≥ 2` corollary is a consequence carried on the face, and the name neither claims nor
  contradicts it.
- **Alias check (own script)** against both registries: the master registry (434 identities) and the run-local snapshot (438).
  - The key does not exist in either.
  - No `claim_key` or alias contains `CBSTAR`, `DELETION-DEFICIT`, `STAR-SECTOR` or `DEFICIT-EXACT`.
  - The only `SECTOR-DELETION` hit is NM's alias `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING`, a different object: an
    unweighted shadow ratio on a perfect-matching sector.
  - Running **every registered `alias_patterns` regex and every alias string** against the key and the full registration statement
    hits only two alias strings, and both are incidental:
    - `FOREST` (alias of `E993-TGT-FOREST`), matched inside the cited key name `E993-R27-FOREST-DESCENT-LINEAR-BOUND`;
    - `(LB)` (the cited input).

    The statement asserts nothing about FOREST.
  - **No lexical or mathematical collision.** The mathematical nearest neighbours are NM (contained at `t = 1` as the
    shadow-ratio input) and the non-key records P8/P9 (the `t = 1` case).

## Findings and repairs

1. **(3a, restatement, not a repair.)** "`F ⊆ leaves` with `v ∈ F` and `P ⊆ F`" is exactly `F = leafSet(T) = {v} ∪ P`. The
   registration text should say so, so that no reader takes it for a family of selectors.
2. **(3b, repair.)** The synthesis's phrase "so (HALL-COND) holds on every sector subfamily under (D) ∪ (S)" is the weighted Hall
   inequality **for `F = leafSet(T)`**. It bears on (HALL), whose `F` is `F_p(T)`, only at rows where `F_p(T) = leafSet(T)`. That
   is `bounded_computation` only (every eligible row computed; proved for no window). The face must carry this, and so must the
   (HALL) scope-note sentence. The synthesis's "`proved_informal`, under `F ⊇ {v} ∪ P`" is correct but should read "under
   `F_p(T) = leafSet(T)`" so that the selector condition is visible.
3. **(3b, answer on `F = {v}`.)** The exclusion is implied by `P ⊆ F`, but it must stay as a fence:
   - the formula is false for `F = {v}` (51 against 0 at `CBstar(2,2,2)/5`, among others);
   - `F_p(T) = {v}` does occur literally at `p = α` (non-eligible, empty source layer);
   - whether `F = {v}` can be deletion-deficient at an eligible rank is unproved (0 on every small eligible row).
4. **(3b, formalization note; not a defect at `proved_informal`.)** (LB) is stated with `Erdos993G1.delta`, and `x` is
   `C5LA1.crossingIndex` via `C5LA1.forwardDifferenceDel G ∅`. Both are `i_{k+1} − i_k` on the same graph, so the informal use is
   exact. A formal award would need the bridge the T adjudicator names (G-CBSTAR (b)).
5. **(3a, wording.)** "Deleting `r` or `v` gives each source private exits of positive weight" holds exactly for sources with
   `w ≥ 2`. Weight-1 sources get weight-0 exits, and that is the whole reason only `R1` can carry a deficit.
6. **(3a, harmless redundancy.)** C-T2-U's "exists iff `k ≤ M` and `(t+2)(p−1) < (t+1)(dm+1)`": the clause `k ≤ M` is implied by
   the inequality.
7. **(3b, sanity.)** The corollary's range restriction is not vacuous. With switch arcs, `F = leafSet` sectors still have positive
   mixed deficits at low non-eligible ranks (for example 14 at `CBstar(2,2,2)/4`, 162 at `(3,2,2)/5`). The theorem is about the
   deletion neighbourhood only, and (D) ∪ (S) enters only through `N_{D∪S} ⊇ N_D`.
8. **(Outside my brief; flagged for the controller.)** The registered statement text of (NM) in the snapshot contains the garbled
   fragment "(For `k N` the family is empty; …)". A comparison operator (presumably `k > N`) has been lost. This is a record-text
   repair, not a mathematical one.
9. **No refuted key is revived, and the fences hold.**
   - Every sector statement is a sector statement, not (HALL).
   - A deletion-only deficit is not a (CUT); all positive deficits here are at non-eligible ranks anyway.
   - Nothing bounds `S(T,p)` beyond (WID).
   - No census value enters a proof. The grid and max-flow rows are checks of proved statements.
   - No closed region is re-proved. At `t = 1` the theorem is the Cycle 1 P8/P9 record, and T-D-R1 at `q = 2` is NM.
   - There is no RTree wording.
   - (LB) is used at its registered statement only.
   - The grade is the weakest input's: `proved_informal`. (LB) is `formally_verified`, and the rest is informal.

## Registration text

**Key (register after this read).**

```text
key: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
status: VERIFIED
evidence_grade: proved_informal
formal_award: false
statement: Let d, m, t ≥ 1 and T = CBstar(d,m,t): the path r – s – v (v a leaf with support s), m chokes u_1..u_m adjacent to
  r, d supports b_{i,1..d} adjacent to each u_i, and t private leaves adjacent to each support; n = 3 + m + (t+1)dm, M := dm, and
  leafSet(T) = {v} ∪ P with P the tM private leaves. Let Q = {r, v}, p ≥ 2, k := p − 1, and F = {v} ∪ P (equivalently: F a set
  of leaves with v ∈ F and P ⊆ F; so F = leafSet(T)). With the literal active-tag weight w_F (SEMANTIC-CONTRACT §1.2: a tag
  u ∈ F ∩ B counts iff (B ∖ {u}) ∩ W_u ≠ ∅), the sector S^Q_{p+1} := {B ∈ I_{p+1}(T) : Q ⊆ B}, and the deletion neighbourhood
  N_D(X) := {B ∖ {q} : B ∈ X, q ∈ B} ⊆ I_p(T) (including the out-of-sector targets B ∖ {r} and B ∖ {v}):
    max_{X ⊆ S^Q_{p+1}} ( Σ_{B∈X} w_F(B) − Σ_{A∈N_D(X)} w_F(A) ) = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}),
  with C(M,j) = 0 for j > M. Equivalently, a deletion-deficient sector subfamily exists iff (t+2)(p−1) < (t+1)(dm+1); when it
  exists the maximum is attained by the weight-one family R1_k (every star empty, centre-only or single-leaf). At t = 1 the
  criterion is 3p < 2dm + 5 (P8).
  Corollary: if t ≥ 2 and x(T) + 2 ≤ p (x the first strict descent, computed through rank α), no X ⊆ S^Q_{p+1} is
  deletion-deficient; hence Σ_{B∈X} w_F(B) ≤ Σ_{A ∈ I_p, A joined to X by (D) ∪ (S)} w_F(A) for every X ⊆ S^Q_{p+1} — the
  weighted Hall inequality on every sector subfamily, for F = leafSet(T). Input: (LB) E993-R27-FOREST-DESCENT-LINEAR-BOUND at
  k = x(T), giving n ≤ 4x; with n = 3 + m + (t+1)M, (t+2)(n+4) − 4(t+1)(M+1) = (t+1)(t−2)M + tm + 2m + 3t + 10 > 0 for t ≥ 2.
  The corollary bears on the (HALL) network at (T, p) only where F_p(T) = leafSet(T).
proof_of_record: the Q-deletions B∖{r}, B∖{v} are private targets of weight w(B) − 1, so Σ_X w − Σ_{N_D(X)} w =
  Σ_{B∈X}(2 − w(B)) − w(∂_sec X); members of weight ≥ 2 cover themselves, so the maximum is attained inside R1 = {w = 1}; inside
  R1 every in-sector deletion target has weight 1 and the deficit is |X| − |∂X| on the (t+2)-symbol cube, where T-D-R1
  (k|X| ≤ (t+1)(M−k+1)|∂X|) bounds it by |R1_k| − |R1_{k−1}|, attained at X = R1_k. Corollary via (LB) as above.
attribution: C-T2-U (Claude Opus 5.5; critic-derived: the theorem, the self-covering reduction and the t ≥ 2 corollary);
  T2 (Claude Sonnet 5; T-A, the sector generating functions, and T-D-R1, the q-ary cube normalized matching consumed at the
  bound step); r27 for (LB) (E993-R27-FOREST-DESCENT-LINEAR-BOUND, award C1-LA4, with the attribution carried on its face);
  C-T2-F (Claude Opus 5.5; L1 and P1, recorded as evidence); the r30 T adjudicator (formula matched against exact deletion-only
  max-flow on 11 configurations); second read SR-C2-3 (Claude Opus 5.5; formula matched on 119 rows over 15 configurations);
  Codex (GPT-6) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the
  definition layer, entries 1–18.
fences: one source family (the root-plus-arm sector Q = {r, v}) of one tree family (CBstar, uniform t); not (HALL), not
  (HALL-COND) for any X ⊄ S^Q_{p+1}, not a (CUT) (a deletion-only deficit is never a CUT; every positive value occurs at a
  non-eligible rank for t ≥ 2), not the aggregate, nothing about the sign of S(T,p); the selector hypothesis F = leafSet(T) stays
  on the face — F_p(T) = leafSet(T) is bounded_computation only and proved for no eligible window; F = {v} is excluded (the
  formula is false there: e.g. max deficit 51 against formula 0 at CBstar(2,2,2), p = 5; F_α(T) = {v} occurs literally at
  p = α), and v ∉ F is trivially non-deficient; at t = 1 the theorem is the Cycle 1 P8/P9 record (R30-CB-RECORD) and is not
  new, and the corollary fails there (CB(8,86)/460, CB(8,89)/476, CB(8,92)/492); T-D-R1 is used at uniform t only; (LB) is used
  at its registered statement only (a formal version needs the crossingIndex ↔ Erdos993G1.delta bridge); not
  E993-R23-LITERAL-DELETE-ONLY-HALL (CLAIM-DISTINCTIONS row below); no status transfer to (HALL), the primary aggregate,
  E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993.
evidence: C-T2-U critique (theorem, corollary, 75 max-flow rows); T adjudication route T2 item 10 and G-CBSTAR (11
  configurations); SR-C2-3 (119 max-flow rows, 1,200-tree corollary grid). S5 recorded here, not as a separate key: C-T2-F L1
  (whole-sector balance for F = a{v} ∪ bP: a[R_k − R_{k−1} + N^max_{k−1}] − b[G_k + G_{k−1} − G^max_{k−1}], R = f^M,
  N^max = (x + x^t)^M, G = M·w_t·f^{M−1}, G^max = M·g(t)·x^t(x + x^t)^{M−1}) and P1 (t = 2: (i) Δ_k(T) ≥ 0 for k ≤ M, so
  x ≥ M+1; (ii) the whole sector is non-deficient under deletion for p ≥ M+2 unless F = {v}; (iii) 𝒲_k ≤ 𝒲_{k−1} for k ≥ M+2),
  proved_informal, critic-attributed to C-T2-F, confirmed SR-C2-3.
aliases: ["CBstar sector deletion-deficit", "CBstar exact sector deficit"]
registration_reason: r30 Cycle 2 (synthesis registration 4; second read SR-C2-3 confirmed / confirmed_with_repairs)
```

**`CLAIM-DISTINCTIONS` row.**

```text
row: R30-CBSTAR-SECTOR-DEFICIT-VS-R23-DELETE-ONLY-HALL
new_key: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
distinguished_from: E993-R23-LITERAL-DELETE-ONLY-HALL (REFUTED)
relation: distinct (not an alias, not a revival)
reason: The refuted key asserts, for every finite ordinary tree T and every p ≥ x(T)+2 under the r23 literal contract, the
  UNWEIGHTED cardinality Hall inequality |X| ≤ |Γ_Delete(X)| for every X in the complete r23 tagged top side; it is refuted on
  the exact CB(8,92) full arm-tag top cut. The new key differs on every axis: (i) scope — one tree family (CBstar(d,m,t)) and ONE
  source family (the r30 root-plus-arm sector S^Q_{p+1}, Q = {r, v}), not all trees and all X; (ii) weight — the r30 active-tag
  weight w_F (SEMANTIC-CONTRACT §1.2) with F = leafSet(T), not cardinality and not the r23 tag contract; (iii) role — it computes
  the exact MAXIMUM deletion deficit of that sector family; the deletion neighbourhood is a diagnostic of the family, not a
  proposed transport mechanism (the mechanism of record remains (HALL) with (D) ∪ (S)); (iv) consistency — at t = 1 it gives a
  POSITIVE deficit at CB(8,92)/492 (R_491 − R_490 = R_490/491), in agreement with the refutation, and its t ≥ 2 corollary is a
  non-deficiency statement on a family that excludes CB = CBstar(·,·,1), where the r23 witness lives. Nothing refuted is
  reasserted at any scope.
recorded_by: SR-C2-3 (text); controller registers
```

**Scope note on (NM).**

```text
key: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
scope_note (r30 Cycle 2, after SR-C2-3): T-D-R1 (T2, Claude Sonnet 5; retained by C-T2-U, C-T2-F and the T adjudicator;
  confirmed SR-C2-3) is the q-ary generalization: on the product of M coordinates, each empty or carrying one of q symbols,
  graded by the number of occupied coordinates, k·|X| ≤ q(M − k + 1)·|∂X| for every X in the rank-k layer (1 ≤ k ≤ M), with
  equality at the whole layer; proof by direct biregularity (down-degree k, up-degree q(M − k + 1)). In the CBstar(d,m,t)
  root-plus-arm sector it is the weight-one (≤ 1 vertex per star) subfamily, q = t + 1, M = dm, consumed by
  E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT. At q = 2 it is this key's statement (N = M) and is not new. Uniform t only:
  for heterogeneous star sizes t_i the up-degree Σ_{empty i}(t_i + 1) varies, biregularity fails, and no statement is made.
  This note changes neither the key's statement, grade nor fences.
```

**The (HALL) scope-note sentence (repair of the synthesis wording for the `CBstar` clause).**

```text
… and on every CBstar(d,m,t ≥ 2) root-plus-arm sector at every p ≥ x(T) + 2 (proved_informal,
E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT, for F = leafSet(T); it applies to (HALL) at rows where F_p(T) = leafSet(T),
which is bounded_computation only) …
```

## Verdicts

verdict[SR-C2-3a]: confirmed
verdict[SR-C2-3b]: confirmed_with_repairs
verdict[SR-C2-3c]: confirmed
verdict[SR-C2-3d]: confirmed_with_repairs

- **3a.** The theorem is correct as stated: re-derived, and matched by exact max-flow on 119 rows. The restatement `F = leafSet(T)`
  is an equivalence, not a change.
- **3b.** The corollary is correct. The repair is to put its selector bearing (`F_p(T) = leafSet(T)`) on the face, and to keep the
  `F = {v}` exclusion as a fence while noting that it is implied by `P ⊆ F`. (LB) says exactly `n ≤ 4x` here.
- **3c.**
  - L1, P1(i)–(iii), T-A (under `F = leafSet`, uniform `t`) and T-D-R1 (uniform `t`) are confirmed at their narrowed scopes.
  - The T-B strike is confirmed: the false positive 504 > 435 against the literal image 1154 is reproduced.
- **3d.** The key name is a predicate the statement satisfies, and the alias check is clean. The repairs are the exact texts
  above: the distinction row, the NM scope note, and the selector wording in the (HALL) scope note.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-sr-SR-C2-3/`. All
use the Python standard library only and exact integers. Every script ran in the foreground to completion; no background job
exists.

| file | SHA-256 |
|---|---|
| `sr_lib.py` (builder, tree test, independent sets, `x` through `α`, selector, literal `w_F`, aggregate, Dinic, closed form, DP) | `aef3e81d0dce252f8394403833314858f1fa2bf4adc59058157728a15042af01` |
| `sr_theorem.py` | `c8107edca4644572fde45c62cda8e2b25c3335dbf0528e343c8d847f7941ff68` |
| `sr_theorem_output.json` (119 rows) | `61aa6e33fe8a075119e49c9c1a4d06aa1606015198b03f0e087af66629920312` |
| `sr_tb_and_grid.py` | `6905f15ec801b24b3b3c17d5a27a32665e871439b481c35e46919f6cb7f29c29` |
| `sr_tb_and_grid_output.json` | `40ee22f64996188469f4b9945d11432b65c36c9e054d36a837ba96b73e170ce8` |
| `sr_tdr1_alias.py` | `308618262eb6c4da632d7b26b4453d587641dd8bd49bbeea65bdcf3eab1f4fce` |
| `sr_tdr1_alias_output.json` | `14cefa12850b68050018e1a0d8a550f9c40a93aaecf853470eab2cc2e829552f` |
| `registration_statement.txt` (alias-check input) | `0d0e555c08d13493f2db6bc5b714a0c7f9577e4deeff5715131a210b4f85a05b` |

Replay, from the scratch directory: `python3 -B sr_theorem.py && python3 -B sr_tb_and_grid.py && python3 -B sr_tdr1_alias.py`.
The outputs are deterministic, and no digest covers a clock, PID or host field. This file is the only write outside scratch.

Reread before close: done. The headings match the protocol exactly. There is one verdict line per statement, and the disclosure
line is present.
