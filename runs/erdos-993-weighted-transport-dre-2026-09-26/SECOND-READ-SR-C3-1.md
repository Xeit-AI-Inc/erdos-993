# Second Read

`SR-C3-1` — isolated second read, Cycle 3, run `erdos-993-math-dre-20260926-r30-weighted-transport` (Erdős #993; weighted
mixed-boundary transport). Subject: the (INV) binder diff for award C3-LA1 (pre-registration gate), the mathematics of the
terminal iff, and the equivalence of the two critic formalizations. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly the two boot files the protocol permits,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, and loaded
no other VerityOS subsystem (memory, decisions, logs, conversations, operations, modules, skills).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The runtime id is the one my runtime reports. I take the "explicit parameter" element from the charter; I cannot observe it
myself.)

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c3-second-read/SR-C3-1-PACKET-MANIFEST.json` (SHA-256 of the manifest's canonical JSON without `seal_sha256`: `sort_keys`, separators `(",", ":")`, no trailing newline) | `42ab732c26f73d6b3004bfba2c4d2328ea7120461566f97fa92a023b22fc1a88` | `42ab732c26f73d6b3004bfba2c4d2328ea7120461566f97fa92a023b22fc1a88` | **match** |
| The 29 listed members (SHA-256 and byte count each) | manifest | recomputed | **29/29 match**, 0 mismatches |
| Manifest `run_id` / `stage` | `erdos-993-math-dre-20260926-r30-weighted-transport` / `cycle-3-second-read-SR-C3-1` | — | as expected |
| `control/PATH-CHECK-c3-second-read-briefs.json` | — | read | 9 files scanned, 0 findings |
| `sources/c3-stage7-sources/SOURCE-DIGESTS.json` vs the manifest's digests for the 10 carry files it lists | per entry | compared | 10/10 agree (`U1-Main.lean` `f3b21020…b180`, `C-U1-T-CritAdv.lean` `8de15f02…b59b`, `C-U1-F-CriticQuot.lean` `63814f60…7935`, …) |

I verified the seal and every digest before reading any member. The replay is `sr_seal.py`, whose output is in `sr_seal_out.json`.

**Read-boundary disclosures.**
1. Session-start context: the host injected the project `CLAUDE.md` and the user auto-memory index. Beyond the two permitted
   boot files, I acted on neither. I did not create a conversation log under `conversations/`, because the protocol allows
   exactly one output file plus scratch (and the wrapper overrides nothing). Any session hook that captures the conversation
   is the host's doing, not mine.
2. Reads: only the 29 capsule members and the two boot files. I read the registry snapshot through a Python JSON filter, which
   covered the (INV) record, every record whose text matches `ORBIT-QUOTIENT` or `FIXED-SELECTOR`, a key-name and
   alias-pattern scan over all 443 claims, and the status and grade of six named keys. Single-file `grep`/`sed`/`awk` ran on
   capsule members only. No recursive search was rooted above a capsule member.
3. Names only, above the grant: one non-recursive `ls` of `<run root>/scratchpad/` and one of `<run root>/second-reads/`,
   to confirm my output locations. I read no file in either.
4. Lean: `ls` of the pinned shared project `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` and of its
   `lakefile.toml`, `lean-toolchain` and `README.md`. I ran four foreground `lake env lean <scratch file>` runs, three iterations of `SRC31Check.lean` and one of
   `SRC31Print.lean`, each with `cd` into that project first. I never ran `lake update`, `lake clean` or `lake build`, and I installed nothing. A later `ls -la` shows
   the project's top level, `.lake/build` and `.lake/config` timestamps unchanged, so nothing was written there. No Mathlib
   source was grepped.
5. A temporary name-reference extract was written to the session scratchpad and deleted there. It was `U1-Main.lean` lines
   1031–2486, the orbit block and `C-U1-T-CritAdv.lean`. No other file was written outside
   `scratchpad/c3-sr-SR-C3-1/` and this file.
6. Python `-B`, standard library, exact integers. No network. No background job, so none was running at the final write.
7. I read the controller facts and the allocation for context only. I cite neither as evidence.

## Statements read

**(A) The frozen C3-LA1 statement**, verbatim from `cycles/cycle-3/stage6/SYNTHESIS.md` (`## Lean awards`, C3-LA1), context
`namespace E993Transport`, `open SimpleGraph`, `open scoped Classical`, `variable {V : Type*} [Fintype V] [DecidableEq V]`:

```lean
theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

The token diff against the frozen `C-U1-T-CritAdv.lean` theorem header (`sr_stmt_diff.py`) has 77 tokens against 77 and exactly one
differing token, the name (`crit_weightedHall_iff_orbitQuotientHall` → `weightedHall_iff_autOrbitQuotientHall`). The whitespace-normalized
statement has SHA-256 `0eb71aa0ca3eaaf0f02bbbdb648b147963f9fc06473cb1e7558568b33381061a`. The file header context is identical: `open SimpleGraph`,
`open scoped Classical`, the same `variable` line.

The definitions it uses, all read in the frozen `U1-Main.lean`:
- `WeightedHall` (C1-LA1 entry 21): `∀ X ⊆ indepFamily G (p + 1), ∑ B ∈ X, activeWeight G F B ≤ ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A), activeWeight G F A`.
- `favorableLeaves` (entry 18), `indepFamily` (14) and `transportRel` (19, literal (D) ∪ (S)).
- `supply G F X := ∑ B ∈ X, activeWeight G F B` (C2-LA1 entry 25; it takes no `p`).
- U1's `orbitOf G j B := (indepFamily G j).filter (fun B' => ∃ γ : G ≃g G, B' = B.map γ.toEquiv.toEmbedding)`.

**(B) C-U1-F's named form**, verbatim from the frozen `C-U1-F-CriticQuot.lean`, section variable `(G : SimpleGraph V) [DecidableRel G.Adj]`:

```lean
noncomputable def orbits (j : ℕ) : Finset (Finset (Finset V)) :=
  (indepFamily G j).image (orbitOf G j)
def orbitArc (O O' : Finset (Finset V)) : Prop :=
  ∃ B ∈ O, ∃ A ∈ O', transportRel G B A
def QuotientHall (F : Finset V) (p : ℕ) : Prop :=
  ∀ 𝒳 ⊆ orbits G (p + 1),
    ∑ O ∈ 𝒳, supply G F O ≤
      ∑ O' ∈ (orbits G p).filter (fun O' => ∃ O ∈ 𝒳, orbitArc G O O'), supply G F O'
theorem weightedHall_iff_quotientHall (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔ QuotientHall G (favorableLeaves G p) p
```

**(C) The registered (INV) key**, `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, from the snapshot
`control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json` (443 claims). Status `VERIFIED`, `evidence_grade` `proved_informal`,
`formal_award` false. Aliases `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`, `E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL` and
`(INV)`; `alias_patterns` `invariant.*(deficient|cut).*reduction` and `orbit.quotient.*hall`. `statement`, verbatim:

```text
(INV) (i) Let U, L be finite sets, R ⊆ U × L, s : U → ℕ, c : L → ℕ; for X ⊆ U let N(X) = {A ∈ L : (B, A) ∈ R for some B ∈ X} and φ(X) = Σ_{B∈X} s(B) − Σ_{A∈N(X)} c(A) ∈ ℤ. Then φ is supermodular; its maximizers are closed under ∪ and ∩; X_min = ⋂{maximizers} and X_max = ⋃{maximizers} are maximizers and are fixed by every pair of bijections (σ_U, σ_L) with (B, A) ∈ R ⇔ (σ_U B, σ_L A) ∈ R, s∘σ_U = s and c∘σ_L = c; X_min = ∅ iff max φ = 0; every B ∈ X_min satisfies s(B) > Σ_{A ∈ N(B) ∖ N(X_min ∖ {B})} c(A) ≥ 0; and X_max = {B ∈ U : N(B) ⊆ N(X_max)}. (ii) If a finite group Γ acts on U and on L preserving R, s and c, the following are equivalent: (a) Σ_{B∈X} s(B) ≤ Σ_{A∈N(X)} c(A) for every X ⊆ U; (b) the same for every Γ-invariant X (every union of Γ-orbits); (c) the Γ-orbit network — supply Σ_{B∈O} s(B) at each U-orbit O, capacity Σ_{A∈O'} c(A) at each L-orbit O', an uncapacitated arc O → O' exactly when R meets O × O' — satisfies the same inequality for every set of source orbits. Equivalently (finite capacitated Hall theorem with integrality, on both networks): the original network has an integral flow saturating every supply and respecting every capacity iff the orbit network has one. (iii) For every finite simple graph G, every p ∈ ℕ and every set F of degree-one vertices (s_v the unique neighbour of v, W_v = N_G(s_v) ∖ {v}, w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}), every γ ∈ Aut(G) with γ(F) = F maps I_j(G) onto I_j(G), preserves the deletion/two-for-one relation (D) ∪ (S) from I_{p+1}(G) to I_p(G) in both directions, and satisfies w_F(γB) = w_F(B); and γ(F_p(G)) = F_p(G) for every γ ∈ Aut(G) and every p. Hence (i)–(ii) apply to the r30 transport network with Γ any subgroup of {γ ∈ Aut(G) : γF = F}; for F = F_p(G), with any Γ ≤ Aut(G), in particular Γ = Aut(G): WeightedHall(G, F_p(G), p) holds iff the Aut(G)-orbit quotient satisfies weighted Hall, and if WeightedHall(G, F_p(G), p) fails then X_min is a nonempty Aut(G)-invariant deficient family whose every member has w_F ≥ 1 and strictly out-supplies its private targets.
```

`scope`, verbatim:

```text
(i)–(ii) any finite bipartite relation with nonnegative integer weights (invariance of R, s, c required in (ii)); (iii) every finite simple graph, every rank p, every set of degree-one tags — no tree, eligibility or F = F_p hypothesis except where stated. A reduction, not a feasibility result: it decides no instance of E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL (OPEN), asserts the feasibility of no quotient, and is not a restricted-scope (HALL) theorem. The direction (c) ⇒ (a) of (ii), in flow form, is the registered E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT; (LIFT) never supplies quotient feasibility. Ordinary graphs only; no governed RTree assertion (bridge E993-G1-ORDINARY-RTREE-TRANSPORT OPEN). E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched. Fences: decides no (HALL) instance; supplies no quotient feasibility; not a transport mechanism and revives no refuted key (SOLUTION-CONTRACT §3.2); no RTree wording; primary aggregate untouched; bounded computations cited in support are bounded_computation and are not evidence for the proof. [r30 C2; SR-C2-5] Part (ii) is the orbit special case of E993-R30-EQUITABLE-PARTITION-FLOW-LIFT (b); parts (i) and (iii) are not contained in that key. The positive invariant deficient witness of part (iii) is X_min; X_max contains every tag-free source and so is not all-positive whenever a tag-free (p+1)-independent set exists. Status and grade unchanged. [r30 C2; C2-LA1] the invariant-family half (¬WeightedHall ⇒ an Aut(G)-invariant positive-weight deficient family, witness X_min) is formally_verified as E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY; the quotient clause (⇔ quotient Hall) remains proved_informal with no Lean text.
```

## Independent re-derivation

### SR-C3-1a — the binder diff

Here "the Lean statement" is (A) and "the registered text" is (C).

| Axis | Lean statement (A) | Registered text (C) | Diff |
|---|---|---|---|
| (1) Group | All of `G ≃g G`. `orbitOf` quantifies `∃ γ : G ≃g G`, and the (⇐) direction goes through `weightedHall_iff_invariant`, whose hypothesis is invariance under every `γ : G ≃g G`. No subgroup parameter exists. | (ii): any finite group `Γ` acting on `U` and on `L` (abstractly, not necessarily induced by vertex maps) and preserving `R, s, c`. (iii): `Γ` any subgroup of `{γ ∈ Aut(G) : γF = F}`, and for `F = F_p(G)` any `Γ ≤ Aut(G)`, "in particular `Γ = Aut(G)`". | **Registered is wider.** |
| (2) Tag set and weights | `F = favorableLeaves G p` only. Supplies and capacities are both `activeWeight G F`. | (i)–(ii): arbitrary `s, c : → ℕ`. (iii): any set `F` of degree-one vertices with `γF = F`. | **Registered is wider.** |
| (3) Graph scope | Any `SimpleGraph V` on a `Fintype V`, i.e. every finite simple graph. The binders `[DecidableEq V]`, `[DecidableRel G.Adj]` restrict nothing. No `IsTree`, eligibility or `p ≥ 1`; every `p : ℕ` including `0`. | (iii): every finite simple graph, every `p ∈ ℕ`. (i)–(ii): any finite bipartite relation, which is wider. | Equal at (iii). Registered is wider at (i)–(ii). |
| (4) Orbit totals | `supply G F O = ∑ B ∈ O, activeWeight G F B` on source orbits and target orbits alike. | "supply `Σ_{B∈O} s(B)`", "capacity `Σ_{A∈O'} c(A)`" with `s = c = w_F`. | **Identical.** |
| (5) Orbit arc | The filter `∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A`, with `O ⊆ I_{p+1}` and `O' ⊆ I_p`, so `transportRel` is applied only on `U × L`. | "an uncapacitated arc `O → O'` exactly when `R` meets `O × O'`"; `(c)` for every set of source orbits. | **Identical** (target orbits joined to some member of `𝒮`; each counted once, since the sum runs over a `Finset` of orbits). |
| (6) Invariant-family clause (b) | Not in the terminal statement. It is present in the DAG as C2-LA1's companion `weightedHall_iff_invariant` (entry 76, carried; a `lemma`, no certificate of its own, R29-N-12). | (ii)(b), for any `Γ`. | **Not covered** by the award, even at `Γ = Aut(G)`, `F = F_p`. |
| (7) Part (i), part (iii)'s admissibility facts and `X_min` clause, the flow form | Absent from the statement. Pieces exist in the carry only as uncertified companions: `phi_supermodular`, `isMaximizer_union_inter`, `canonMin_isMaximizer`, `canonMin_famMap`, `mem_indepFamily_map`, `transportRel_map_aut`, `activeWeight_map_of_invariant`, `favorableLeaves_map_aut`. There is no `X_max`, no private-target inequality, and no quotient-flow notion. | Present. | **Not covered.** |

Are there ℕ-subtractions in (A)? None. The statement has `p + 1` only. `favorableLeaves` compares an integer difference
(`vertexDeletionForwardDifference` casts to `ℤ` before subtracting), and `C5LA1.aggregate` with its `p - 1` is not referenced by
the statement or the DAG. Every `p : ℕ` is therefore meant literally, including `p = 0` (targets `{∅}`).

On fence 5: `open scoped Classical` supplies the `DecidablePred` for `orbitOf`'s filter (explicit print: `Classical.propDecidable
(∃ γ, …)`). The statement's outer filter is decided by nested `Finset.decidableExistsAndFinsetCoe` down to `transportRel`. The
`image`'s `DecidableEq (Finset (Finset V))` is the structural `Finset.decidableEq`. A `Finset.filter` denotes the same set for
every decidability instance (kernel-checked, SR-5 below), so these choices do not change the set denoted.

**Answer to the brief's question.** At the (ii)(a)⇔(c) clause with `Γ = Aut(G)` and `F = F_p(G)`, the registered statement
and (A) say the same thing. That clause is, verbatim, (iii)'s sentence "for F = F_p(G), with any Γ ≤ Aut(G), in particular Γ =
Aut(G): WeightedHall(G, F_p(G), p) holds iff the Aut(G)-orbit quotient satisfies weighted Hall", at `Γ = Aut(G)`. The
registered key as a whole is **wider** than (A) on axes (1), (2), (6) and (7), and on (3) at parts (i)–(ii). The upgrade route is
therefore closed. **The award registers as the separate key**, and (INV) receives a scope note. Registration waits for C3-LA1's
`VERIFICATION-REPORT.json` to report `formally_verified` for (A) unchanged except the recorded name.

**The proposed key name is a predicate that (A) satisfies.**
- `WEIGHTED-HALL`: the r30 active-weight (D) ∪ (S) Hall condition.
- `IFF`.
- `FULL-AUT`: `Γ` = all of `G ≃g G`.
- `ORBIT-QUOTIENT-HALL`: Hall on the orbit-total quotient with some-member-pair arcs.
- `AT-FIXED-SELECTOR`: `F = F_p(G)`, fixed at the original rank.

The name asserts no tree, flow, feasibility or subgroup content, so it is no wider than (A). The key is absent from the snapshot
(0 of 443), and no record mentions `FULL-AUT`. However, it matches (INV)'s alias pattern `orbit.quotient.*hall` under
case-insensitive matching (no match case-sensitively). A distinction row is therefore required (`## Registration text`).

### SR-C3-1b — the mathematics, re-proved

Notation:
- `U = I_{p+1}(G)` and `L = I_p(G)`.
- `F = F_p(G)` and `w = w_F`, with `w ≥ 0` on both layers.
- `B → A` means `transportRel G B A`, and `N(X) = {A ∈ L : ∃ B ∈ X, B → A}`.
- `Γ = Aut(G)` acts by `γ·B = γ(B)`.

Facts, each checked against its carried companion:
- (F1) `γ` maps `U` onto `U` and `L` onto `L` (independence and cardinality are preserved; `mem_indepFamily_map`).
- (F2) `B → A` iff `γB → γA`. For (D), `A = B ∖ {q}` iff `γA = γB ∖ {γq}`. For (S), `u ∉ B`, `|N(u) ∩ B| = 2` and
  `A = (B ∖ N(u)) ∪ {u}` hold iff the same holds at `γu`, because `γN(u) = N(γu)` (`transportRel_map_aut`).
- (F3) `γF_p = F_p`. `γ` preserves leaves, and `G − γv ≅ G − v`, so `Δ_p(G − γv) = Δ_p(G − v)` (`favorableLeaves_map_aut`).
- (F4) `w(γB) = w(B)`, because `s_{γv} = γ s_v` and `W_{γv} = γW_v` (`activeWeight_map_of_invariant`).

By (F1), for `B` in a layer the orbit `Γ·B` lies in the same layer, and `orbitOf G j B = Γ·B`. This is my own kernel check
`sr_mem_orbitOf_iff`. The orbits partition each layer.

**(a) ⇒ (c).** Let `𝒮` be a set of source orbits and `X = ⋃𝒮 ⊆ U`.
1. By (a), `Σ_X w ≤ Σ_{N(X)} w`.
2. Distinct orbits are disjoint, so `Σ_X w = Σ_{O∈𝒮} Σ_{B∈O} w(B)`.
3. Let `T` be the set of target orbits joined to `𝒮`. If `A ∈ N(X)`, some `B ∈ O ∈ 𝒮` has `B → A`, so `A`'s own orbit is in `T`.
   Hence `N(X) ⊆ ⋃T`.
4. Since `w ≥ 0`, `Σ_{N(X)} w ≤ Σ_{⋃T} w = Σ_{O'∈T} Σ_{A∈O'} w(A)`.

This direction uses no invariance of `w` or `R`. It needs only that orbits of layer members stay in the layer and are disjoint.

**(c) ⇒ (a).** By C2-LA1's `weightedHall_iff_invariant`, it suffices to prove Hall for every `Γ`-invariant `X ⊆ U`. For
completeness, that lemma's argument is:
- `φ(X) = Σ_X w − Σ_{N(X)} w` is supermodular, because `N(X ∪ Y) = N(X) ∪ N(Y)`, `N(X ∩ Y) ⊆ N(X) ∩ N(Y)` and `w ≥ 0`.
- Maximizers are closed under `∩`, so `X_min = ⋂{maximizers}` is a maximizer.
- `φ(γX) = φ(X)`, because `N(γX) = γN(X)` (F1, F2) and `w` is invariant (F3, F4). So `γ` permutes the maximizers and fixes `X_min`.
- If (a) fails, `max φ > 0`, so the invariant `X_min` is deficient.

Now let `X` be invariant, so `X = ⋃𝒮` with `𝒮 = {Γ·B : B ∈ X}`.
1. `Σ_X w = Σ_{O∈𝒮} supply(O)`.
2. By (c), this is at most `Σ_{O'∈T} supply(O')`.
3. **Claim: `⋃T ⊆ N(X)`.** If `O' ∈ T`, then some `B ∈ O ∈ 𝒮` and `A ∈ O'` have `B → A`. `B ∈ X` because `X` is a union of
   orbits, so `A ∈ N(X)`. `N(X)` is `Γ`-invariant: `γN(X) = N(γX) = N(X)` by (F1), (F2) and the invariance of `X`
   (`covered_famMap`, `covered_orbitUnion`). Therefore the whole orbit `O' = Γ·A ⊆ N(X)`.
4. Since `w ≥ 0`, `Σ_{O'∈T} supply(O') = Σ_{⋃T} w ≤ Σ_{N(X)} w`.

**The brief's "EXACTLY" question.** Each direction uses one inclusion, together with `w ≥ 0`:
- (⇒) uses `N(X) ⊆ ⋃T`, which is trivial.
- (⇐) uses `⋃T ⊆ N(X)`. That inclusion comes from the `Aut(G)`-equivariance of the layers and of (D) ∪ (S) (entries 61, 62,
  45 and `covered_orbitUnion`), and holds because `X` is invariant. The terminal proof's `hTsub` step is this inclusion.

For invariant `X`, both inclusions hold, so the covered set **equals** the union of the joined target orbits. My kernel check
`sr_covered_eq_joined` proves it (C-U1-F's `covered_biUnion` is the same fact). The proof itself needs only the two inclusions,
not the equality as a stated lemma. The synthesis's DAG wording ("a union of target orbits, containing every target orbit
joined to a source orbit") names exactly what (⇐) needs.

Where the hypotheses enter:
- `Γ = Aut(G)` enters through `orbitOf` and through `weightedHall_iff_invariant`'s quantifier.
- `F = F_p(G)` enters through (F3). The Lean companion is stated for `favorableLeaves` only, and (F3) is what makes `w`
  invariant under every automorphism.
- Nonnegativity of `w` (it is ℕ-valued) enters in both directions through `sum_le_sum_of_subset`.

**`orbitOf` needs no `Fintype (G ≃g G)`.** It filters the already finite layer by the proposition `∃ γ : G ≃g G, …`,
decided by `Classical.propDecidable` (explicit `#print`). At this pin `Fintype (G ≃g G)` does not synthesize: my
`fail_if_success` probe succeeds, agreeing with both critics' probes `C-U1-T-CritInst.lean` and `C-U1-F-CriticFintype.lean`, which
are expected to fail. `orbitOf` and the terminal theorem elaborate anyway.

**My instruments.**

*(I-1) Kernel re-check* (`SRC31Check.lean`, run as `lake env lean` from the pinned project; exit 0; 0 errors; no `sorry`). The file
is the frozen `U1-Main.lean`, followed by the frozen `C-U1-T-CritAdv.lean` and `C-U1-F-CriticQuot.lean` with import lines dropped,
followed by my tail. The tail proves:
- SR-1: (A)'s exact text as an `example`, discharged by `crit_weightedHall_iff_orbitQuotientHall G p` with no conversion.
- SR-2: `sr_quotient_forms_agree`, i.e. `QuotientHall G F p ↔` (the inline condition), for **every** `F`.
- SR-3: the two terminal statements are equivalent.
- SR-4: `sr_mem_orbitOf_iff`.
- SR-5: `Finset.filter` independence of the decidability instance.
- SR-6: `sr_covered_eq_joined`.
- SR-7: the `Fintype (G ≃g G)` probe fails.

`#print axioms` gives exactly `[propext, Classical.choice, Quot.sound]` for `crit_weightedHall_iff_orbitQuotientHall`,
`weightedHall_iff_quotientHall`, `weightedHall_iff_invariant` and my three named lemmas.

*(I-2) Brute force from the frozen definitions* (`sr_orbit_hall.py`; standard library; exact integers; no seat code). It covers
every labelled graph on `n ≤ 5` (1,099 graphs) and every tree up to isomorphism on `n ≤ 10` (201 trees), at every `p` with
`I_{p+1} ≠ ∅`. It computes `F_p` leaf by leaf from `Δ_p(G − v)`, the literal `w_F`, the literal (D) ∪ (S), the full `Aut(G)` by
backtracking, and the orbits by applying every automorphism.

Before anything else it asserts (WID), `Σ_{I_{p+1}} w_F − Σ_{I_p} w_F = Σ_{v∈F}[Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v)]`, on every
instance with `p ≥ 1`: **6,888/6,888 pass**. It then evaluates both sides of (A) by exhaustive search. The search is restricted to
positive-weight sources (resp. positive-supply orbits), which is sound because dropping a weight-0 member never decreases `φ`.
It also checks, on every union of source orbits, that `N(X)` equals the union of the joined target orbits. Results for
`F = F_p`, `Γ = Aut(G)`:

| Class | Instances | Decided both sides | Agree | Disagree | Hall fails (both) | Exact-cover checks / failures |
|---|---:|---:|---:|---:|---:|---|
| labelled `n ≤ 5` | 2,921 | 2,921 | 2,921 | 0 | 658 | 2,921 / 0 |
| trees `n ≤ 10` | 1,148 | 906 | 906 | 0 | 45 | 762 / 0 |

Instances were skipped only by the search caps (18 positive sources, 12 orbits for the exact-cover sweep). Two further sweeps are
context for the wider registered text only:
- `F` = all leaves, full `Aut`: 3,671 decided, 0 disagreements, 1,036 Hall failures.
- `F = F_p` with `Γ` a cyclic subgroup: 1,678 decided, 0 disagreements.

No row is eligible (every eligible tree has order ≥ 13), and no row is a (HALL) or sign row. This is `bounded_computation`
consistent with the proof, and it is not evidence for it.

### SR-C3-1c — the two formalizations

Unfolding (B):
- `orbits G j` is literally `(indepFamily G j).image (orbitOf G j)`.
- `orbitArc G O O'` is literally `∃ B ∈ O, ∃ A ∈ O', transportRel G B A`.
- `QuotientHall G F p` is literally (A)'s right-hand side with `F` for `favorableLeaves G p`.

The two terminal theorems therefore state the same proposition, `WeightedHall G (favorableLeaves G p) p ↔ …`. The only
elaborated difference is the decidability instance of the target-orbit filter. (B) decides `∃ O ∈ 𝒳, orbitArc G O O'`, where
`orbitArc` is opaque to instance search, while (A) decides the unfolded nesting. These instances are not syntactically equal.
`Iff.rfl` passed the elaborator but the kernel check timed out at default heartbeats. I saw this in my first two runs, whose output files were later overwritten by the final run. The rejected `rfl`/`exact` variants are recorded here, not in `lean_out.txt`.
The identity is therefore **propositional**: a kernel-checked iff (`sr_quotient_forms_agree`, for every `F`), with the filter's
denotation instance-independent (SR-5). It is not an `rfl`.

The U adjudicator's `adj_two_quotient_forms_agree` is not a capsule member, so I did not replay it. My proof is independent of
it and reaches the same conclusion.

**Exactly one new definition.** (A) mentions `WeightedHall`, `favorableLeaves`, `indepFamily`, `transportRel` (C1-LA1 entries
21, 18, 14, 19), `supply` (C2-LA1 entry 25) and `orbitOf`. Of these, only `orbitOf` is new. The DAG's other new declarations
(U1's orbit lemmas and the seven `crit_*` lemmas) are all `lemma`/`theorem`, not `def`. Choosing (B) instead would add four
definitions (`orbitOf`, `orbits`, `orbitArc`, `QuotientHall`).

A name-level scan of the DAG files (the C2-LA1 block of `U1-Main.lean`, the orbit block and `C-U1-T-CritAdv.lean`) finds no
reference to any declaration the synthesis excludes. The excluded declarations are:
- C1-LA1 entries 22–23 and 25–36, including `activeWeightAggregateIdentity`;
- C2-LA1 entry 77;
- `exists_transportRel_iff` and `regular_bipartite_shadow_bound`.

The exclusion list is therefore consistent. The Stage 7 build remains the binding check.

## Findings and repairs

1. **Seal and members: verified** (29/29).
2. **The registered (INV) key is wider than (A)** on the group, the tag set and weights, the invariant-family clause (b), part
   (i), part (iii)'s admissibility facts and `X_min` clause, the flow form, and (for (i)–(ii)) the abstract relation. (A) equals
   exactly the (ii)(a)⇔(c) clause at `Γ = Aut(G)`, `F = F_p(G)`, which is (iii)'s "in particular" sentence. **Ruling: separate
   key** `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (`formally_verified`), plus a scope note on
   (INV). No upgrade.
3. **Repair (registration): a distinction row is required.** The new key's name matches (INV)'s alias pattern
   `orbit.quotient.*hall` case-insensitively. Rows against (INV), the equitable-partition lift, (LIFT) and C2-LA1 are supplied
   below.
4. **Repair (record wording): struck.** `C3-ALLOCATION.md` item U1 says the orbit-quotient iff is "the whole (INV) key" and
   "could close: kernel-checked (INV) at its full registered statement". Both are struck. The kernel-checked result is one
   clause of (INV) at one instance.
5. **Repair (scope-note content).** In the scope note, the (a)⇔(b) clause at `Aut(G)`/`F_p` and part (iii)'s admissibility
   facts must be described as kernel-checked **companions without a certificate** (R29-N-12), not as formally verified. They
   stay `proved_informal`.
6. **Wording (no status effect).** The two quotient forms are propositionally, not definitionally, identical as elaborated
   (SR-C3-1c). The synthesis's "same proposition" stands in that sense.
7. **Confirmed on the award face.**
   - U1's "remaining gap" is struck: the capacity total is `supply ∘ covered` by `rfl`, per `C-U1-T-CritAx.lean`.
   - The axiom-driver count is ten: three inherited and seven new, per `U1-AxCheckFinal.lean`.
   - `orbitOf` needs no `Fintype (G ≃g G)`.
   - `hXsub` is unused in `orbitOf_subset_of_mem_invariant` and `covered_orbitUnion`. Neither lemma is in the terminal statement.
   - No ℕ-subtraction occurs.
   - The fences on the synthesis face (no quotient feasibility, not (HALL), no flow, nothing for a proper subgroup or another
     tag set, C2-LA1 not re-certified) are correct and complete for (A).
8. **Registry data (not my statement; recorded for the controller).** In the snapshot, the `aliases` field of
   `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` holds a single string containing a serialized list followed by `alias_patterns:
   [...]`, and its `alias_patterns` field is empty. Its pattern `equitable.*(partition|quotient).*(lift|hall)` is therefore inert.
9. **Conditionality.** Register the blocks below only if C3-LA1's `VERIFICATION-REPORT.json` reports `formally_verified` for
   (A) with only the recorded name change. If the Stage 7 statement differs in any other token, this read does not cover it.

## Registration text

New key (the award C3-LA1; registered instead of an upgrade of (INV)):

```text
KEY: E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR
STATUS: VERIFIED
GRADE: formally_verified
STATEMENT: Lean statement of record (award C3-LA1; namespace E993Transport; open SimpleGraph; open scoped Classical; variable {V : Type*} [Fintype V] [DecidableEq V]; definitions of record C1-LA1 Main.lean 86b59c6c… entries 1–21 and C2-LA1 Main.lean a9cf3b81… entries 22–30, carried byte-identically, supply = C2-LA1 entry 25; one new definition orbitOf G j B := (indepFamily G j).filter (fun B' => ∃ γ : G ≃g G, B' = B.map γ.toEquiv.toEmbedding)): theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) : WeightedHall G (favorableLeaves G p) p ↔ ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)), ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤ ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A), supply G (favorableLeaves G p) O'. In words: for every finite simple graph G and every p ∈ ℕ, with the fixed original strict selector F = F_p(G), the active-tag weight w_F on both layers and the literal deletion/two-for-one relation (D) ∪ (S) from I_{p+1}(G) to I_p(G), weighted Hall holds for every source family X ⊆ I_{p+1}(G) if and only if, for every set 𝒮 of Aut(G)-orbits of I_{p+1}(G), the orbit-total supply Σ_{O∈𝒮} Σ_{B∈O} w_F(B) is at most the orbit-total capacity Σ_{O'} Σ_{A∈O'} w_F(A) of the Aut(G)-orbits O' of I_p(G) joined to 𝒮, where O' is joined to 𝒮 iff some member of some O ∈ 𝒮 is related by (D) ∪ (S) to some member of O'; Aut(G) is the full automorphism group G ≃g G and the orbit of B is {γ(B) : γ ∈ Aut(G)}.
SCOPE: Γ = all of Aut(G) only; tag set F_p(G) only, supplies and capacities both w_{F_p(G)}; every finite simple graph and every p ∈ ℕ including p = 0; no tree, eligibility or p ≥ 1 hypothesis. It is exactly the (ii)(a)⇔(c) clause of E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL at Γ = Aut(G), F = F_p(G) (that key's (iii) sentence "in particular Γ = Aut(G): WeightedHall(G, F_p(G), p) holds iff the Aut(G)-orbit quotient satisfies weighted Hall") and nothing wider. An equivalence of two Hall conditions: a reduction, not a feasibility result. Companion lemmas on the award face (U1's orbit block, the crit_ partition and class-union lemmas, the carried *_map_aut lemmas, weightedHall_iff_invariant, weightedHall_iff_phi_nonpos) carry no certificate and register proved_informal only (R29-N-12). The isolated second read's small-graph check (every labelled graph n ≤ 5, every tree n ≤ 10; no eligible row) is bounded_computation and is not evidence for the theorem.
ATTRIBUTION: r30 Cycle 3 critic C-U1-T (Claude Opus 5.5; critic-derived): the orbit partition, the class-union identity and the terminal theorem (C-U1-T-CritAdv.lean 8de15f02…, crit_weightedHall_iff_orbitQuotientHall renamed, statement otherwise unchanged); r30 Cycle 3 critic C-U1-F (Claude Opus 5.5; critic-derived): the independent equivalent formalization weightedHall_iff_quotientHall (C-U1-F-CriticQuot.lean 63814f60…); r30 Cycle 3 U1 (Claude Sonnet 5): the orbit block (orbitOf, mem_orbitOf_self, orbitOf_subset_of_mem_invariant, invariant_iff_orbitOf_subset, covered_orbitUnion); r30 Cycle 3 U adjudicator (Claude Opus 5.5): rebuild and kernel equivalence check of the two forms; award C2-LA1 (r30 Cycle 2 U1, Claude Sonnet 5; critic C-U1-T, Claude Opus 5.5, critic-derived): the supermodularity/canonMin apparatus and weightedHall_iff_invariant; award C1-LA1: definitions of record (entries 1–13 the r24/r25/r26 definition layers and E993Interior.taggedFamily, carried from the first-interior award (Codex); entries 14–21 the E993Transport layer, r30 Cycle 1 U2, Claude Sonnet 5); (INV) informal proof: r30 Cycle 1 U1 (Claude Sonnet 5) and critics C-U1-T, C-U1-F (Claude Opus 5.5), second read SR-INV; Codex (GPT-6 Astra/Sol/Luna): the transport mechanism, the active-tag weight, the lower-region run, and (LIFT)'s orbit-quotient conventions and supermodular-maximizer argument; isolated second read SR-C3-1 (Claude Opus 5.5): binder diff and statement fidelity.
FENCES: decides no instance of E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL (OPEN) and is not a restricted-scope (HALL) theorem; supplies no quotient feasibility; constructs or implies no flow, and is not E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT nor its feasibility; nothing for a proper subgroup of Aut(G), an abstract group action, another tag set or another weight; not parts (i) or (iii) of (INV), not its (a)⇔(b) clause as a certified statement, not its flow form; C2-LA1's terminal content is not re-certified; no tree, eligibility or aggregate-sign content; nothing about the size or enumerability of orbit spaces; E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE and Erdős #993 untouched; ordinary graphs only, no governed RTree assertion (bridge E993-G1-ORDINARY-RTREE-TRANSPORT OPEN); not a transport mechanism and revives no refuted key (SOLUTION-CONTRACT §3.2).
ALIASES: C3-LA1; weightedHall_iff_autOrbitQuotientHall; full-Aut orbit-quotient weighted Hall at the fixed selector
```

Scope note on (INV) (in place of an upgrade):

```text
SCOPE NOTE ON: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL
TEXT: [r30 C3; C3-LA1; SR-C3-1] The (ii)(a)⇔(c) clause at Γ = Aut(G) (all of G ≃g G) and F = F_p(G), on every finite simple graph and every p ∈ ℕ, is formally_verified as E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR (award C3-LA1; terminal theorem E993Transport.weightedHall_iff_autOrbitQuotientHall; orbit-total supplies and capacities; an orbit arc iff some member pair is joined by (D) ∪ (S)); this is the sentence of (iii) "for F = F_p(G), … in particular Γ = Aut(G): WeightedHall(G, F_p(G), p) holds iff the Aut(G)-orbit quotient satisfies weighted Hall". Everything else in this key stays proved_informal: part (i); part (ii) for an arbitrary finite group Γ acting on U and L and arbitrary R, s, c, including the (a)⇔(b) clause (at Γ = Aut(G), F = F_p(G) kernel-checked only as C2-LA1's uncertified companion weightedHall_iff_invariant) and the integral-flow form; part (iii) for any subgroup Γ of {γ ∈ Aut(G) : γF = F} and any set F of degree-one tags, its admissibility facts (kernel-checked only as uncertified carried companions), and its X_min clause beyond the existential statement formally_verified as E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY. The earlier note that the quotient clause "remains proved_informal with no Lean text" is superseded at the Aut(G), F_p(G) instance only. Status VERIFIED and grade proved_informal unchanged; no quotient feasibility asserted; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL untouched.
```

Distinction rows (`control/CLAIM-DISTINCTIONS.json`):

```text
DISTINCTION ROW: R30-C3-LA1-VS-INV
KEY: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL
TEXT: Not an alias, although the new key's name matches (INV)'s alias pattern "orbit.quotient.*hall" case-insensitively. E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR is the single instance (ii)(a)⇔(c) of (INV) at Γ = Aut(G), F = F_p(G), stated and kernel-checked in Lean; (INV) is strictly wider (abstract relation and group, any Γ ≤ {γ ∈ Aut(G) : γF = F}, any degree-one tag set, parts (i) and (iii), the (a)⇔(b) clause, the flow form). Relation: new key ⊂ (INV). Grades differ (formally_verified vs proved_informal); no status or grade transfers across the containment in either direction.
```

```text
DISTINCTION ROW: R30-C3-LA1-VS-EQLIFT
KEY: E993-R30-EQUITABLE-PARTITION-FLOW-LIFT
TEXT: The new key is the Hall-form equivalence of the orbit-partition special case of that key's (b), restricted to the Aut(G)-orbit partition of the r30 transport network at F = F_p(G). It contains no flow lift (that key's (a)), no equitable partition other than the Aut(G)-orbits, and no class-union deficit identity as a certified statement (the class-union sums are companion lemmas). The equitable-partition key stays proved_informal; not an alias.
```

```text
DISTINCTION ROW: R30-C3-LA1-VS-LIFT
KEY: E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT
TEXT: (LIFT) is a flow statement (a saturating quotient flow lifts to a saturating original flow) for any finite group preserving R, s and c; the new key is an equivalence of Hall conditions with no flows, at Γ = Aut(G) and F = F_p(G). Relating them needs a finite capacitated Hall theorem on both networks, which the new key does not contain. Neither supplies quotient feasibility; (LIFT) keeps its grade; not an alias.
```

```text
DISTINCTION ROW: R30-C3-LA1-VS-C2-LA1
KEY: E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY
TEXT: C3-LA1's proof uses C2-LA1's companion weightedHall_iff_invariant (carried byte-identically with the canonMin apparatus) for its (⇐) direction. It does not re-certify C2-LA1's existential terminal statement, and C2-LA1 does not contain the orbit-quotient equivalence. Distinct keys; not aliases.
```

## Verdicts

verdict[SR-C3-1a]: confirmed_with_repairs
verdict[SR-C3-1b]: confirmed
verdict[SR-C3-1c]: confirmed

- **SR-C3-1a: confirmed_with_repairs.** The synthesis's reading is correct. The registered (INV) key is wider than (A), so the
  award registers as the separate key `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`
  (`formally_verified`), and (INV) gets a scope note. The repairs are Findings 3–5:
  - the distinction rows, required because of the alias-pattern match;
  - the allocation's "whole (INV) key" wording, struck;
  - the companion-grade wording in the scope note.
- **SR-C3-1b: confirmed.** I re-proved the terminal iff independently.
  - (⇒) uses `N(X) ⊆ ⋃T`. (⇐) uses `⋃T ⊆ N(X)`, which comes from the `Aut(G)`-invariance of `N(X)` for invariant `X`. Both
    directions use `w ≥ 0`, and equality holds (SR-6).
  - `orbitOf` needs no `Fintype (G ≃g G)`.
  - The result was kernel-rechecked with clean axioms. The bounded instrument shows 0 disagreements and 6,888 (WID) assertions
    passed.
- **SR-C3-1c: confirmed.** C-U1-T's inline form and C-U1-F's named form state the same proposition. The identity is
  propositional (a kernel-checked iff for every `F`), not `rfl`. Freezing the inline form adds exactly one new definition,
  `orbitOf`.

## Artifact inventory

All scratch is under `<run root>/scratchpad/c3-sr-SR-C3-1/`. Standard library only; `python3 -B`; exact integers. No
`__pycache__` remains, and no background job was started. Nothing was written under `sources/`, `control/`, `cycles/` or the
shared Lean project. The only deliverable is `second-reads/SR-C3-1/SECOND-READ.md` (this file; its own digest cannot appear
inside it).

| File | SHA-256 | Bytes | Purpose |
|---|---|---:|---|
| `sr_seal.py` | `3382df37c751efdbce93f763a566c37fda1b5bc7e2bb30be1adedd72f00638b3` | 925 | capsule seal and 29 member digests |
| `sr_seal_out.json` | `8a918fcbfb01e7ba514219f60bcb7b209a1c71de01ee75d1d13ca04b46e6a9e7` | 242 | its output |
| `sr_stmt_diff.py` | `98c85425c40915a23edd43c5a7ce29b0680da7f3c889f25b025a1f7072db54fa` | 1286 | token diff: frozen C3-LA1 statement vs C-U1-T theorem header |
| `sr_stmt_diff_out.json` | `75272ce9029e0a2a8f26199dee61c1854d6ad011efa1fbd9e93263d5e867fbb0` | 740 | its output |
| `sr_checks_tail.lean` | `efcdf0a3c5fccb47fb143714efb7953aea7e3f7735dc1f80df357d1bd74600a7` | 4601 | reader's Lean checks SR-1…SR-7 |
| `SRC31Check.lean` | `6730ae788d5c876279bcffae0920daa641de12df1264d2893ace6abee9a02c16` | 153369 | U1-Main + CritAdv + CriticQuot + tail (kernel re-check) |
| `lean_out.txt` | `61fb421a60ea46a9ebbf32f94fb19e1c916599a0e07ec7e9426e532886002e73` | 11241 | output of the final SRC31Check run (exit 0) |
| `sr_print_tail.lean` | `e76e90ab297c3e9c3655277003e61608d0c22feb2c66a5840aee425b2c23e283` | 248 | explicit-instance prints |
| `SRC31Print.lean` | `2f68b8b30f075e5430fe8f977e4d7b16ed837bb83ef4034186dedd5dd0792b1c` | 140479 | U1-Main + CritAdv + print tail |
| `lean_print_out.txt` | `c5d5d2b154b811c2a98d481b6da9b51106558dd9a011a21a42112d6e20cdbfec` | 15047 | its output (orbitOf and terminal statement, pp.explicit) |
| `sr_orbit_hall.py` | `e7d4c91e25490fe74820913c91b07fdb4e663c92e1647f79914891ea62dbb687` | 11774 | brute-force instrument (WID assertion; both sides of the iff; exact cover) |
| `sr_orbit_hall_out.json` | `a6100c1fa0f44c6729a0dc1a13b704df511a461360b883bd812ae59a232f8ed7` | 3238 | its stats and Hall-failure examples |
| `sr_orbit_hall_stdout.txt` | `d3c5f09b4b41cf05666606bb11c0d82e21a8490431804c83636cdd41911aef36` | 2289 | its stdout |
| `sr_orbit_hall_stderr.txt` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | 0 | its stderr (empty) |

Replay, from the run root, foreground:
- `python3 -B scratchpad/c3-sr-SR-C3-1/sr_seal.py` (seal and members);
- `python3 -B scratchpad/c3-sr-SR-C3-1/sr_stmt_diff.py` (statement token diff);
- `cd scratchpad/c3-sr-SR-C3-1 && python3 -B sr_orbit_hall.py` (about 50 s; writes `sr_orbit_hall_out.json`);
- `cd /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project && lake env lean <run root>/scratchpad/c3-sr-SR-C3-1/SRC31Check.lean`
  (about 30 s; exit 0). `SRC31Check.lean` is the concatenation of the frozen `U1-Main.lean`, `C-U1-T-CritAdv.lean` and
  `C-U1-F-CriticQuot.lean` (first line of each of the last two dropped) and `sr_checks_tail.lean`. `SRC31Print.lean` is the same
  without CriticQuot, with `sr_print_tail.lean` instead.
