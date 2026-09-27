# Critique

Critic `C-U1-T` (cross-orientation critic, orientation T: prove) of seat `U1`, route `C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION`,
Cycle 1 Stage 4, run `erdos-993-math-dre-20260926-r30-weighted-transport`, 2026-09-26.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Boot acknowledgment: this critique was written within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. (The host session also injected the project
`CLAUDE.md` and the user's auto-memory index into context; I opened neither and did not rely on them.) Beyond the boot I read
only the capsule members, the U1 return, U1's five inventoried scripts (copied out first), and one frozen source,
`sources/authority/CLAIM-IDENTITY.json`, for the registered (LIFT) statement. I found that file with a `grep -rl` rooted at
`sources/`, which is inside the grant. I did not read or list any other return, critique, adjudication, experiment root,
`scratchpad/c1-U1-replay/`, or external source, and I used no network or package install. I started no background job.

## Identity and seal audit

All seals were recomputed as SHA-256 of the key-sorted compact JSON (`separators=(",",":")`, `seal_sha256` removed, no
trailing newline):

| object | recorded | recomputed | match |
|---|---|---|---|
| capsule `control/c1-critic-capsules/U1-PACKET-MANIFEST.json` | `f67c8fd6cc8a9f597a5500ab8462ba85af1a8a495f707bfe4b0112b59f2686ff` | same | yes |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` | same | yes |
| Stage 3 packet `control/C1-STAGE3-PACKET-MANIFEST.json` | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | same | yes |
| Stage 2 packet `control/C1-STAGE2-PACKET-MANIFEST.json` | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | same | yes |

- All 14 capsule members match their bytes and SHA-256. That includes `cycles/cycle-1/stage3/returns/U1/RETURN.md`
  (`2f74c265…a79f`, 36305 bytes), which also matches its Stage 3 manifest entry.
- The 13 Stage 4 dispatch members and the 36 Stage 3 members match with 0 mismatches.
- The Stage 2 manifest lists 1006 files and `SOURCE-DIGESTS.json` lists 981. Both counts are as U1 states.
- **Digests the return lists for its own artifacts.** The digests of the five scripts under `scratchpad/c1-U1/` match:
  - `cb_search.py`: `da4ba385…c3c3`
  - `cb_orbit.py`: `67697fe3…c50b`
  - `validate_orbit.py`: `21357e03…212c`
  - `final_flow.py`: `b4db42d6…d3ea`
  - `supermodularity_check.py`: `0c314f2d…4f5f`
- The "SHA-256 of the JSON result" `1f61dcb3…a235` is not a shipped file. It is the digest of the canonical JSON that
  `final_flow.py` prints, and my replay printed the same digest.
- The digests U1 cites for `CLAIM-IDENTITY.run-local.json`, `CLAIM-DISTINCTIONS.json`, `AUTHORIZATION.md` and
  `R30-CHARTER-PROMPT.md` refer to files outside my capsule. I did not check them.
- **Read-boundary disclosures.** `C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` records one U1 item: an oversized exploratory
  script was auto-backgrounded and stopped by a PID-scoped `TaskStop`. The return says the script produced no output and is
  cited nowhere. I checked that no number in the return depends on it: all five shipped scripts are self-contained, and
  every reported number reproduces from them.
- **Model disclosure.** U1 reports chartered Claude Sonnet 5, xhigh, runtime `claude-sonnet-5`. This matches the allocation
  ("routes Claude Sonnet 5 xhigh").

## Independent re-derivation

**Instrument.** I built my own instrument (`crit_instr.py` and the companions listed in the inventory). It uses only the
standard library and exact integers, and I wrote it from SEMANTIC-CONTRACT §1.1–1.2 without importing any seat code. It
works as follows:
- Every tree passes an acyclicity-and-connectivity test: `|E| = n − 1` plus a BFS connectivity check.
- The independence polynomial is computed two ways, tree DP and explicit bitmask enumeration of every independent set. The
  two are asserted equal at every rank.
- `x` is computed through rank `α`, including the terminal difference.
- `F_p` is taken from strict `Δ_p(T − v) < 0` on the original tree.
- `w_F` is literal: `v ∈ F ∩ B` counts iff `(B ∖ {v}) ∩ (N(s_v) ∖ {v}) ≠ ∅`.
- (D) ∪ (S) is literal: single deletions, plus `u ∉ B` with `|N(u) ∩ B| = 2`, giving `(B ∖ N(u)) ∪ {u}`.
- `S` is computed separately from `q_v(j) = i_j(H_v) − i_j(R_v)` using DP polynomials of `T − {v, s_v}` and `T − N[s_v]`.
- Before any other output, the code asserts `supply − capacity = S` and nonempty eligibility.
- Max-flow is exact-integer Dinic.

**Fixed points reproduced before trusting the instrument** (`fixed_points_out.txt`, `census_out.txt`). "arcs" counts
distinct related `(B, A)` pairs.

| graph | p | n | α | x | \|F\| | supply | capacity | S | flow | arcs |
|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 8 | 13 | 12 | 6 | 12 | 1980 | 3960 | −1980 | 1980 (saturates) | 1980 (deletions only) |
| path-star (2,3,4) | 7 | 15 | 11 | 5 | 10 | 1483 | 2701 | −1218 | 1483 | 2025 |
| path-star (2,2,4,3) | 8 | 18 | 13 | 6 | 12 | 8033 | 13467 | −5434 | 8033 | 11691 |

- Free-tree counts for orders 1–15 are 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, which is A000055. The
  canonical form is centre(s) plus the AHU parenthesis encoding, named as such.
- Eligible `(tree, p)` rows for orders 11–15 are 5, 34, 163, 313, 528. This matches the controller's erratum R30-E-a, and
  orders 2–10 give 0.
- `Δ_0 = n − 1` and `i_2 = C(n, 2) − (n − 1)` are asserted on every tree to order 15.
- The `CB(8, 92)` sector ratio also checks in closed form. `|R_j| = 2^j·C(736, j)` gives
  `|R_491|/|R_490| = 2·(736 − 490)/491 = 492/491`. U1 cites this ratio but does not recompute it.

**U1 §5.3, `CB(1, 7)` at `p = 10`, by brute force on the full labelled graph** (no quotient):

| graph | p | n | α | x | \|F\| | i_11 | i_10 | supply | capacity | S | mixed flow | deletion-only flow |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(1,7)` | 10 | 24 | 15 | 8 | 8 | 8673 | 22197 | 29190 | 58002 | −28812 | 29190 (saturates; 124593 arcs) | 29190 (saturates; 95403 arcs) |

- Every number U1 reports agrees.
- The brute-force sets fall into 57 and 90 classes under `S_7` branch permutation. I got these counts from my own
  canonical form (arm bits plus the sorted per-branch (choke, support, leaf) triples), and they match U1's orbit-state
  counts.
- Because the flow here comes from the original network, (HALL-COND) at this single `(T, p)` does not rest on (LIFT) or on
  U1's quotient builder. Grade: `bounded_computation`.

**U1 §5.1 "smallest eligible `CB(d, m)`".** U1 only scanned `d ≤ 4`, so the claim was not justified as stated. I checked
every `(d, m)` with `n = 3 + m(1 + 2d) ≤ 30` for all `d`. `CB(1, 7)` is the unique eligible `CB` with `n ≤ 24`; for
example, `CB(10, 1)` (`n = 24`), `CB(3, 3)` and `CB(9, 1)` have empty windows. The next eligible instances are `CB(1, 8)` at
`p = 11` (`n = 27`), `CB(2, 5)` at `p = 10` (`n = 28`) and `CB(1, 9)` at `p = 12` (`n = 30`). The claim is true.

**U1 §4, re-derived from the definitions.**
- **§4.2 (coverage submodularity).** `c(X) = Σ_A w(A)·[X ∩ R⁻¹(A) ≠ ∅]`. Each indicator is a coverage function, and
  coverage functions are submodular. A nonnegative combination of them is submodular. The proof uses `w ≥ 0` on targets
  and finiteness only.
- **§4.3 (φ supermodular).** The source part `Σ_X w` is modular. It needs no sign on source weights and no tree structure.
- **§4.4 (maximizers form a lattice).** If `φ(X) = φ(Y) = M`, supermodularity gives `φ(X∪Y) + φ(X∩Y) ≥ 2M`, and each term
  is at most `M`, so both equal `M`.
- **§4.5 (automorphism invariance).** For `γ ∈ Aut(T)`: `γ|_{V∖v}` is an isomorphism `T − v → T − γv`, so `F_p` is
  invariant. `γ(N(s_v) ∖ v) = N(s_{γv}) ∖ γv`, so `w_F ∘ γ = w_F`. (D) and (S) are defined purely by adjacency and
  cardinality, so `(B, A) ∈ R ⟺ (γB, γA) ∈ R`. I confirm every point.
- **§4.6 (invariant maximizer).**
  - `φ(γX) = φ(X)` uses `N(γX) = γN(X)`, which is exactly the relation's equivariance.
  - The finite intersection `⋂_γ γX₀` is a maximizer by iterating the pairwise closure `|Γ| − 1` times, which is valid
    because `Γ` is finite.
  - Invariance follows by reindexing `γ' = δγ`.
  - Nonemptiness does not need to be assumed: `φ(∅) = 0`, so a maximizer with value `M > 0` is automatically nonempty.
    When `M = 0`, `∅` is a maximizer and nothing is claimed.
- **§4.7 (reduction).**
  - U1 leaves one step implicit: the quotient neighbourhood of a set of orbits equals the orbits of `N(X)`. I fill it here.
    For an invariant `X`, `N(X)` is invariant. So a target orbit `O` meets `N(X)` iff `O ⊆ N(X)`. And `O` is joined in the
    quotient to some orbit of `X` iff some member pair is related, that is, iff `O` meets `N(X)`.
  - Hence for every union of orbits, the quotient Hall sums are literally `Σ_X w` and `Σ_{N(X)} w`.
  - Both directions then follow as U1 writes them.
- **Grade.** The mathematics of §4.2–4.7 is complete as statement-level mathematics, grade `proved_informal`. It needs an
  isolated second read before registration.

**Replays.** I copied all five U1 scripts into `scratchpad/c1-crit-U1-T/replay/` before running them.
- `final_flow.py` gives the same JSON and digest `1f61dc…a235`.
- `validate_orbit.py` gives `ALL CASES OK: True` on the six tiny `CB`.
- `supermodularity_check.py` gives 1,048,576 pairs, 0 violations, max φ = 2, and 256 maximizers.
- `cb_search.py` gives 144 candidates and smallest `CB(1, 7)`.
- **Import path.** `final_flow.py` and `validate_orbit.py` hard-code `sys.path.insert(0, …/scratchpad/c1-U1)`. Run as
  shipped, a "replay" imports the seat's originals, not the copied files. I repointed the path in my copies only, so the
  digests of those two replay copies differ from U1's. U1's claim that its own replay directory was self-contained is
  therefore overstated. There is no numeric consequence, because the imported modules are byte-identical to the originals.

## Attacks and findings

**A1. §6's weight-direction claim is false; the truth is the reverse (critic-derived lemma, proved).**

U1 says the support move `B ↦ B' = (B ∖ {v}) ∪ {s_v}` "can only weakly decrease the active weight". The reason given is
that `s_v` is never a tag, so "`|F ∩ B'|`, hence its active-weight, can only stay the same or drop". The inference is
invalid: active weight is not monotone in `|F ∩ B|`.

*Critic lemma (C-U1-T).* Let `T` be a finite tree with `n ≥ 3`, let `F` be a set of leaves, let `B` be independent, and let
`v ∈ F ∩ B`. Then:
- (i) `B'` is independent iff `v` is inactive in `B`.
- (ii) When `B'` is independent, `w_F(B') − w_F(B) = #{t ∈ F ∩ B, t ≠ v : t inactive in B, s_t ~ s_v} ≥ 0`.

*Proof.*
- (i) `v`'s only neighbour is `s_v`. So `B'` is independent iff `(B ∖ {v}) ∩ N(s_v) = ∅`, which is the definition of `v`
  being inactive.
- (ii), what is lost: `v` itself contributes 0, being inactive. `s_v` is not a leaf, since `n ≥ 3`.
- (ii), active tags stay active. Take `t ≠ v` active in `B` with witness `y ∈ B ∩ N(s_t)`, `y ≠ t`. If `y = v`, then
  `s_t = s_v`, so `t` is a sibling of `v`. Then `t ∈ (B ∖ {v}) ∩ N(s_v)`, which contradicts (i). So `y ∈ B'`.
- (ii), which inactive tags become active. An inactive `t` becomes active iff `s_v ∈ N(s_t)`. Here `s_t ≠ s_v`, because
  otherwise `t` would contradict (i). ∎

*Corroboration.* On all 202 eligible `(T, p)` of orders 11–13 with `F = F_p(T)`, I made 69,237 `(B, v)` checks:
- 0 failures of (i) or (ii);
- strict increases exist.

*Eligible witness* (`compress_out.json`):
- The tree has `n = 12` and edges 0–1, 0–2..6, 1–7, 1–8, 1–9, 7–10, 7–11. Here `α = 9`, `x = 4`, `p = 6`,
  `F = {2, 3, 4, 5, 6, 8, 9, 10, 11}` and `S = −322`.
- Take `B = {2, 3, 4, 5, 6, 9, 11}` and `v = 9`, so `s_v = 1`.
- Then `B' = {1, 2, 3, 4, 5, 6, 11}`, and `w(B) = 5`, `w(B') = 6`. Tag 11, whose support 7 is adjacent to 1, becomes active.

This also recasts U1's `CB(1, 3)` independence witness. The support move fails to be defined exactly on active tags. That
is the generic case, not a special configuration. In `CB(d, m)` specifically, no two supports are adjacent (`b_{ij}`'s
neighbours are `u_i` and `c_{ij}`; `u_i` is not a support). So on `CB` the move is exactly weight-preserving wherever it is
defined.

**A2. §6's "decisive disproof" does not show that compression fails for φ. The correct negative is below (critic-derived,
explicit witnesses).**

A compression lemma asks whether `φ(C(X)) ≥ φ(X)` for every `X`, where `C` is the standard shift: `C(B) = B'` if the move is
defined and `B' ∉ X`, else `B`. U1 showed only that the move is partial and argued the weight direction, which A1 shows is
reversed. Neither fact bears on `φ(C(X))`.

I tested three shifts on random `X` on all 202 eligible rows of orders 11–13, then searched exhaustively for the smallest
witnesses (`crit_shift_witness.py`, `shift_witness.json`):
- **Support shift `v → s_v`: `φ` can decrease.**
  - Take the `n = 12` tree of A1 at `p = 6`, move `8 → 1`, and `X = {{2, 3, 4, 5, 6, 8, 11}}`, which has weight 5.
  - Then `C(X) = {{1, 2, 3, 4, 5, 6, 11}}`, which has weight 6.
  - `N(X)` has 7 targets with total weight 36, and `N(C(X))` has 8 targets with total weight 40. (The 8th target comes from
    the switch inserting 7 and removing 1 and 11.)
  - So `φ(X) = −25` and `φ(C(X)) = −34`.
- **Cross-leaf shift `v → v'` with `s_{v'} ≠ s_v`: `φ` can decrease.**
  - Take the order-11 double broom (0–1, 0–2..7, 1–8..10) with `α = 9`, `x = 4`, `p = 6`, `|F| = 9`, `S = −261`, and the
    move `2 → 8`.
  - `X = {{2, 3, 4, 5, 6, 7, 10}}` has weight 6, and its image `{3, 4, 5, 6, 7, 8, 10}` has weight 7.
  - `N` weights: 36 → 45, so `φ`: −30 → −38.
- **Twin-leaf shift (same support): no decrease in 29,998 random tests.**
  - This shift is also subsumed by U1's own §4.6, which I prove here. The transposition `τ` of twin leaves is an
    automorphism, so an `Aut(T)`-invariant maximizer `X*` satisfies `τX* = X*`.
  - Then for every `B ∈ X*` with `v ∈ B`, `v' ∉ B`, the image `B − v + v'` already lies in `X*`, and the shift fixes `X*`.
  - So "some maximizer is twin-compressed" is already a corollary of §4.6 and adds nothing new.

Exact scope of the negative: neither the support shift nor the cross-leaf shift is φ-nondecreasing on all `X`. This does
not exclude that some maximizer is compressed in some other order. Grade: an explicit finite witness refuting a universal
monotonicity statement, exact integers, one instrument (mine).

**A3. The "generalization beyond `S_3≀S_m`" is not new; alias finding on the candidate key.**

The registered (LIFT) statement in `sources/authority/CLAIM-IDENTITY.json` reads: "Let a finite group act on two finite sets
U,V and preserve a relation R … nonnegative integer supplies … If this quotient network has an integral flow saturating
every source supply, then the original R network has an integral flow saturating every supply". Its scope is "Generic
finite invariant relation". So (LIFT) is already stated for an arbitrary finite group and an arbitrary finite relation.

- U1's direction (⇐), quotient Hall ⇒ original Hall, is mathematically equivalent to (LIFT). Max-flow/min-cut on both
  networks turns one into the other, so it is a second proof of a registered statement.
- The direction (⇒) is the "elementary converse" that SEMANTIC-CONTRACT §1.2 and Gate ruling 6 already name. The invariant
  deficient cut is the contract's own parenthetical.
- U1 reads "(LIFT) does NOT prove quotient feasibility" as a disclaimer of (⇒). That misreads it: the phrase disclaims only
  that (LIFT) settles any particular quotient.
- What is genuinely U1's:
  - the converse and the invariant-maximizer argument written out and proved on a face;
  - §4.5, the automatic admissibility of every `Γ ≤ Aut(T)` for this network (elementary, correct and useful).
- Scope note: nothing in §4 uses trees, eligibility or `F = F_p`. The theorem holds for any finite graph, any `p ≥ 1` and
  any `Γ`-invariant `F`. It holds in fact for any finite bipartite relation with invariant nonnegative integer weights.
  U1's stated scope ("every finite ordinary tree, every eligible `p`") is narrower than its proof.
- Minor: for `Γ = {e}` the theorem is a tautology (the quotient is the original network), not "vacuous".

**A4. Critic-derived strengthening (proved): a canonical invariant cut, with no choice of `Γ`.**

The intersection `X_min` of all maximizers of `φ` is a maximizer. This follows from §4.4 and finiteness.

`X_min` is fixed by every pair of bijections `(σ_U, σ_L)` that preserves `R` and both weight functions. The reason is that
such a pair permutes the maximizers. The same holds for the union of all maximizers. So one explicit canonical object,
determined by the network alone, is simultaneously invariant under `Aut(T)` and under any extra network symmetry not
induced by `T`. When `max φ > 0`, it is the least deficient cut of maximal deficiency.

This partly answers U1's remaining obligation 4, which asks for an explicit invariant witness. Toy corroboration: on U1's
`P6` network (`p = 1`, `F` = both leaves; not eligible), `max φ = 2` with 256 maximizers. `X_min` has 2 members and
`φ(X_min) = 2`, and both `X_min` and the union of all maximizers are invariant under the path reversal.

**A5. §5.3 does not exercise the switch exits it advertises.**

- My brute force shows `CB(1, 7)` at `p = 10` saturates with deletion arcs alone: flow 29190 over 95403 deletion arcs.
- I also computed the next two eligible `CB` exactly (critic-derived, `bounded_computation`, `cb_next_out.txt`):

| graph | p | n | α | x | \|F\| | i_{p+1} | i_p | supply | capacity | S | mixed flow | deletion-only flow |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(1,8)` | 11 | 27 | 17 | 9 | 9 | 50554 | 115528 | 177576 | 322112 | −144536 | saturates | saturates |
| `CB(2,5)` | 10 | 28 | 16 | 8 | 11 | 88506 | 185256 | 259980 | 396460 | −136480 | saturates | saturates |

- `CB(2, 5)` is the first eligible `d = 2` instance. Both saturate with deletion arcs only.
- So the small eligible `CB` instances carry no evidence about the two-for-one mechanism. The deletion-only shortfall that
  makes switches matter is recorded only at large `(d, m)` (`CB(8, 92)`).
- U1's sentence "a new, exactly-verified instance of (HALL) holding" is struck as worded. (HALL) is the universal key. The
  correct statement is: (HALL-COND) holds at the single `(CB(1, 7), 10)`, `bounded_computation`, and deletion-only already
  suffices there.

**A6. Obligation 5(d) (fixed points) is not met.** U1 cites the `T_m` rows and the `CB(8, 92)` sector ratio by attribution
only and runs its instrument on no recorded fixed point. The only validation is brute force on six tiny non-eligible `CB`,
which is sound as far as it goes. The fence against repeated `T_m` checks forbids using them as evidence. It does not
forbid reproducing a fixed point to trust an instrument. My brute force covers this gap for the `CB(1, 7)` numbers. U1's
general-`d` orbit builder, however, remains unvalidated at any eligible instance and at `d ≥ 4`.

**A7. The validator checks arcs, not weights.**
- `validate_orbit.py` compares, member by member, the set of target orbit-keys against `transitions()`. That is the
  correct object for "an orbit arc iff some member pair is related".
- It never compares `state_weight` against the literal active weight of members. The weights are checked only through the
  aggregate identity (WID) totals at `CB(1, 7)`.
- `state_weight` is nevertheless correct. `v` is active iff arm = RV (`W_v = {r}`), and `c_{ij}` is active iff choke `u_i`
  is present. My per-set brute force agrees on every total.

**Other checks, no finding.**
- Direction of every inequality in §4: correct.
- No natural-number subtraction enters §4.
- No circularity: §4 never assumes `S ≤ 0`.
- The quotient uses orbit-total supplies and capacities with "an arc iff some member pair is related", which is exactly
  (LIFT)'s quotient.
- The `CB(d, m)` states are exactly the `S_d ≀ S_m` orbits for `d = 1`. The arm path `r–s–v` is not isomorphic to a branch
  `r–u–b–c`, so `Aut(CB(1, 7)) = S_7`. My independent 57/90 count agrees.

## Mechanism-equivalence and fence check

- U1 proposes no transport mechanism. §4 is a structural fact about supermodular deficits and group actions. It is none of
  the ten refuted keys, nor the C6-F4 own-support rule, nor `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, nor
  `E993-R28-TREE-LEAF-SLOT-DOMINANCE`. §6's support move is not a transport relation and revives nothing.
- No closed region is re-proved. The `T_m` rows, the `CB(8, 92)` sector and the high tail are cited only and never used as
  proof steps.
- No census value enters a proof. There is no RTree wording.
- (LIFT) is not treated as supplying quotient feasibility: the `CB(1, 7)` quotient flow is computed, and my brute force
  makes (LIFT) unnecessary at that instance.
- (DCB) and `D, C ≥ 0` are not used.
- **Alias:** the candidate `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` overlaps (LIFT) in its (⇐) half (A3). It must not be
  registered as a new mechanism or with `novelty_claimed` covering (⇐).

**Registration text a second reader could confirm (proposed, narrowed):**
- Key: `E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL`, a companion or scope note of
  `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`.
- Statement:
  - Let `U`, `L` be finite sets, `R ⊆ U × L`, and let `s: U → ℕ`, `c: L → ℕ`.
  - Put `φ(X) = Σ_X s − Σ_{N(X)} c` for `X ⊆ U`.
  - (i) `φ` is supermodular. Its maximizers form a lattice. The least maximizer is fixed by every `(R, s, c)`-preserving
    pair of bijections.
  - (ii) For any finite group `Γ` preserving `R`, `s` and `c`: Hall holds for every `X ⊆ U` iff it holds for every union of
    `Γ`-orbits, iff the orbit-total quotient (arc iff some member pair is related) satisfies Hall.
  - (iii) For the r30 network of any finite simple graph `G`, any `p ≥ 1` and `F = F_p(G)`, every subgroup of `Aut(G)` is
    admissible.
- Scope: any finite bipartite relation, any finite invariant weights, any finite graph and any rank. No feasibility of any
  quotient is asserted, and no instance of (HALL) is decided.
- Grade: `proved_informal` (STATED, pending an isolated second read).
- Attribution:
  - Codex (C6-T5) for (LIFT) and the supermodular-maximizer argument on `T_m`;
  - U1 for the written converse, the automatic `Aut(T)` admissibility and the general statement;
  - C-U1-T for the canonical least-maximizer form and the scope widening.
- `novelty_claimed` is limited to (i)'s canonical form, the written (⇒) proof and (iii). The (⇐) half is (LIFT).

## Certification audit

| literal (return) | status |
|---|---|
| Stage 2 seal match; 1006 / 981 files | backed (recomputed) |
| five script digests | backed |
| JSON result digest `1f61dc…a235` | backed by replay (digest of the printed canonical JSON; no file shipped) |
| `n = 24, α = 15, x = 8, p = 10, \|F\| = 8, 29190 / 58002 / −28812`, "flow = 29190, saturates" | backed, independently by brute force |
| `8673 / 22197`, "57 / 90 orbit-states" | backed, independently |
| "144 (d, m) pairs" | backed by replay of U1's own script only (not independent) |
| "smallest eligible `CB(d, m)` is `CB(1, 7)`" | true (critic scan over all `d`, `n ≤ 30`); U1's `d ≤ 4` scan did not justify it |
| "1,048,576 pairs, 0 violations, max φ = 2, 256 maximizers" | backed by replay |
| "ALL CASES OK", "exhaustive over all members" | backed by replay, for arcs; weights not validated member-wise (A7) |
| "20 hits (listed in `scratchpad/c1-U1/` session transcript)" | **struck**: no transcript is in the inventory |
| "reproduced byte-for-byte / re-run from [the replay directory]" | **weakened**: two scripts hard-code the original directory on `sys.path`, so the copies import the originals |
| "two genuine bugs found and fixed" | self-report; not verifiable and not relied on |
| §5.3 "a new, exactly-verified instance of (HALL) holding" | **struck as worded**; replaced by "(HALL-COND) at one `(T, p)`, `bounded_computation`; deletion-only already saturates" |
| §6 "Grade: `proved`", "decisive disproof", "weight non-increasing" | **struck**; the weight claim is false (A1); `proved` is not a grade in SOLUTION-CONTRACT §4 |
| §4.7 "strict completion of (LIFT)", "generalized beyond `T_m`'s specific group" | **struck as novelty**: (LIFT) is registered for any finite group (A3) |
| route verdict "`proved`" | narrowed: §4 is `proved_informal`, STATED; §6 is withdrawn |
| cited `T_m` rows, `CB(8, 92)` values | citations of frozen sources, not U1 certifications; the sector ratio is re-checked in closed form |

**`## Remaining obligation` of the return, judged.**
- Item 1 (second read and registration) must carry the alias narrowing of A3.
- Item 2 (larger `CB`) is right, but must note A5: small `CB` never needs switches.
- Item 3 (leaf-only compression) is now answered in part by A2. Twin shifts are subsumed by §4.6, and cross-leaf shifts are
  not φ-monotone.
- Item 4 (explicit invariant witness) is answered in part by A4.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- **Retained.** §4.2–4.7 (supermodularity, the maximizer lattice, the invariant maximizer, and the biconditional between
  original and quotient Hall) is correct and complete at statement level. I agree with grade `proved_informal`, STATED,
  pending an isolated second read. It is narrowed to a companion of (LIFT) under A3, because its (⇐) half is (LIFT)'s
  content and the "arbitrary finite group" generalization is already in (LIFT)'s registered scope. The §5.3 numbers are
  retained as `bounded_computation`, confirmed by my independent brute force.
- **Withdrawn.** §6's weight-direction argument is false (A1) and its grade `proved` is struck. The honest negative is A2's:
  explicit witnesses that neither the support shift nor the cross-leaf shift is φ-nondecreasing.
- **Critic-derived advances, attributed to C-U1-T:**
  - the support-move weight lemma (A1, proved);
  - the canonical least-maximizer invariance (A4, proved);
  - the twin-shift subsumption (A2, proved);
  - explicit φ-decrease witnesses for two shifts (A2, exact);
  - exact saturating flows, mixed and deletion-only, on `CB(1, 8)` at `p = 11` and `CB(2, 5)` at `p = 10` (A5,
    `bounded_computation`).
- No statement here resolves (HALL). Model line: chartered opus/medium; transport-resolved model opus (explicit parameter);
  runtime-reported model id: claude-opus-5-5[1m].

## Remaining obligation

1. An isolated second read of the narrowed registration text above: (i) the canonical least-maximizer form, (ii) the Hall
   biconditional for any finite invariant relation, (iii) `Aut(G)` admissibility for the r30 network. Record the (⇐) half
   as (LIFT)'s content, not new. A second read of the critic lemma A1 (support-move weight formula) if the synthesis wants
   it on the record.
2. A compression or uncrossing order that is φ-nondecreasing for every `X` remains unfound. Support shifts and cross-leaf
   shifts fail (A2), and twin shifts add nothing beyond §4.6. A successor should look for a shift that is φ-monotone on the
   `CB` root-plus-arm sector specifically, where (A1) supports are never adjacent and the support move preserves weight.
   Alternatively, a successor should prove that no shift order can work.
3. Orbit-quotient flows at `(d, m)` where deletion-only Hall fails; small eligible `CB` never reach that regime (A5). U1's
   general-`d` builder must first be validated at an eligible instance and against brute force at `d ≥ 4` (A6), and its
   `state_weight` checked member-wise (A7).
4. (HALL) itself is untouched and OPEN. The primary aggregate is untouched.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-U1-T/`.
All scripts use the standard library only, run with `PYTHONDONTWRITEBYTECODE=1`, and started no background job.

| file | SHA-256 | role |
|---|---|---|
| `crit_instr.py` | `aa60cb50efa6dafae7186852d8e1c7cfc8bc791bd5e86ba0085a95d52d8cc8a2` | own instrument: tree test, DP + brute-force polynomial, `x` through `α`, `F_p`, literal `w_F`, (D) ∪ (S), `S` via `q_v`, (WID) assertion, Dinic; fixed points and `CB(1,7)` |
| `fixed_points_out.txt` | `7bda7843a7911123cc9a4dfc07bb17512d8bc7d9ab2b0d5eccbba59599406371` | fixed points plus `CB(1,7)` (mixed and deletion-only) |
| `crit_census.py` | `c255419ad76061a6d83afe78961dda52cd9ebb10925d76ce3002eb675e8fdb55` | free-tree generator (centre + AHU canonical form), A000055, eligible rows, `CB(d, m)` scan for `n ≤ 30` |
| `census_out.txt` | `6679dd99683300f51bd4a20a7e2ba5f208a037e3f171aa70dcec0dee1acdf5f5` | output (run with argument 15) |
| `crit_orbits_cb17.py` | `b5f525c908e17024ecfc47d61195512ce2d1df76f9688ae9f350109488767c6b` | `S_7` class counts of `CB(1,7)` layers |
| `orbits_cb17_out.txt` | `9ed540b2f7c847f9c93f6435b2f017827db0f7c18181ffd99eb73d67d0e5cfa7` | output (57, 90) |
| `crit_compress.py` | `94e1af999a2160d505e7f6ffae9a95439655d8ae5739f642abf98aa4516f1e9a` | A1 lemma check (69,237 cases) and random shift tests (seed 20260926) |
| `compress_out.json` | `eb089a3fbc0a005e971d575c12ad1d16132c2480bdc410bb4d1d50147971ca55` | output |
| `crit_shift_witness.py` | `1773cb2b4a8d5b151e1ec3d070ac468a854df908b184641e0d014fdfe07b5d65` | smallest explicit φ-decrease witnesses |
| `shift_witness.json` | `902dc49be7f10a23d235eea92232717a55126c66ca33436d1e283403a8acfec3` | output |
| `crit_supermod.py` | `ce838e3c747d5cd3259baed1415d995f973ad176ec572bfd663b540b4f82b7a9` | supermodularity corroboration (eligible, 20,000 random pairs, seed 993) and least-maximizer invariance toy |
| `supermod_out.txt` | `13a5859292b8feb5e56090ee3ac4bd3b593c198bb72f1b2a427a24e42f7fc6fa` | output |
| `crit_cb_next.py` | `1089521081413759e84669d04f9e428f27632ad260976deff12693f47e216b7f` | exact flows on `CB(1,8)` at `p = 11` and `CB(2,5)` at `p = 10` |
| `cb_next_out.txt` | `22537b572e3d5606970c5935e559b80d2b46576a6669fa52f8f16e819c015655` | output |

Files under `replay/` are copies of U1's scripts, copied out first.
- Unmodified, with digests equal to U1's: `cb_search.py`, `cb_orbit.py`, `supermodularity_check.py`.
- Modified: `final_flow.py` (`99f871eb44d0db03926d572890317aef3155221321f33d4c960933dc5a543c84`) and `validate_orbit.py`
  (`470f489d44a1eeb84022b49f260cc7fcc9efafd55aea771f2d1001d46390f083`). The only edit is to the hard-coded `sys.path` line,
  which now points at the replay directory.
- Outputs:
  - `final_flow_replay_out.txt`: `c884a6acf55049c2b6429ad1400143e956e93a3b5c32a54505cf403de968103c`
  - `validate_orbit_replay_out.txt`: `3ffb66e3c7ca37da09be440831b8204e19e5145ed2d77cd69b2bc9b044101534`
  - `supermod_replay_out.txt`: `b6630643d7764c726b35eca49c1512c26b2ec8f174e321b9927bda1b48db1cdc`
  - `cb_search_replay_out.txt`: `34736e2f35fc812df432d5b0af3ef1e35de5a121db1886081306c82985a40208`

Replay command for any critic script: `cd <scratch root> && PYTHONDONTWRITEBYTECODE=1 python3 <script>`. `crit_census.py`
takes the maximum order as its argument; `crit_cb_next.py` takes `d,m,p` triples.
