# Critique

**Critic:** `C-U1-T`, cross-orientation critic, orientation T (prove), of seat `U1`, route `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS` (orientation U), r30 Cycle 6 Stage 4.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and loaded no other VerityOS subsystem. The host put the project `CLAUDE.md` and the user's auto-memory index into my context at session start. I did not act on either beyond this boot statement: the dispatch governs this seat, and I kept no conversation log.

**Bottom line.** U1's Lean text is real and reproduces cold. `spiderOneTwoThrees_isTree` and `hookPred_injOn_rank` compile without `sorry`, use only the three permitted axioms, and are what they claim to be. The return's central structural claim is wrong, though. It says "the general finite-product (iterated) hook construction is NOT formalized and is the single blocking step". In fact the iterated two-chain (de Bruijn–Tengbergen–Kruyswijk) decomposition and its chain-predecessor injection already exist, graph-generic and `formally_verified`, in C4-LA1's text of record: entries 25–37 and 55–72, in the same `Snippets/` directory from which U1 carried entries 73–75. With that machinery, and an assignment of blocks to the spider that I derive and validate below, the whole spider DAG for a terminal at `p = k+3` closes informally without N2, N3b, Newton or any new chain combinatorics. I also compiled one of the replacement nodes myself.

## Identity and seal audit

- **Dispatch.** `DISPATCH-C-U1-T.md` gives SHA-256 `a50b4a99c7034b55ae1b68880d62cb9dbc009de695c9cc93b9970ef877874269` by `shasum -a 256`, which matches.
- **Seals.** I recomputed each seal as SHA-256 of the compact key-sorted JSON without `seal_sha256`, with no trailing newline (`scratchpad/c6-crit-U1-T/seal.py`):
  - capsule `U1-PACKET-MANIFEST.json`: `355e287d06398d1a40cfa07f55c871edda4e1f2b80d62ae0a4ab2221b4a09032`, which matches;
  - Stage 4 dispatch manifest: `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`, which matches;
  - Stage 3 manifest: `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`, which matches;
  - Stage 2 manifest: `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`, which matches the protocol literal.
- **Capsule members.** All 14 members match their listed SHA-256 and byte counts. This includes `RETURN.md` (`b3db2244…`) and `C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, which is present because U1 filed disclosures.
- **Return inventory.** I copied every inventoried artifact out into `scratchpad/c6-crit-U1-T/replay/` and digested it. All match the return's table:
  - `verify_seal.py` `ba5e5dfa…`
  - `Carried.lean` `86b59c6c…`
  - `CrossingIndex.lean` `3fb2dbd6…`
  - `CarriedC4LA1.lean` `a0381495…`
  - `HookChain.lean` `91c85fa2…`
  - `Spider.lean` `18396be5…`
  - `SpiderDraft.lean` `8ae4f2f6…`
  - `LeanProof.lean` `a259e82d…`
  - `lakefile.toml` `45d0ca58…`
  - `lake-manifest.json` `52a4d73c…`
  - `lean-toolchain` `2bdc48ad…`
- **Carries, byte-level** (`carrycheck.py`, `carrycheck2.py`):
  - `Carried.lean` is `cmp`-identical to `runs/lean-2026-09-26-c1-la1-…/LeanProject/LeanProof/Main.lean` (`86b59c6c…`).
  - `CrossingIndex.lean` contains the first-interior fragment `0014-definition-C5LA1-crossingIndex` (`378868ab…`) byte-for-byte.
  - `CarriedC4LA1.lean` contains C4-LA1's fragments byte-for-byte. The origin `Main.lean` is `66db6c73ad8f…`, which matches ruling 47. The three fragments are:
    - entry 73, `mem_indepFamily_iff`, `d30c9ae0…`;
    - entry 74, `erase_mem_indepFamily`, `28327989…`;
    - entry 75, `saturatingFlow_of_perTag_deletionInjections`, `72ae49fe…`.
  - All three are graph-generic: they are stated for `{V : Type*}` with any `G`, and contain no `gk` token.
  - C4-LA1's definition entries 1–21 and 45–51 are byte-contained in `Carried.lean`, so the carried lemmas sit on the same definitions of record.
  - I did not check the return's "matches the `C5-STAGE7-FORMALIZER-BRIEF-LA1.md` entry table", because that brief is not in my capsule. The digests stand on my direct check against C4-LA1's `Snippets/` instead.
- **Registry keys touched:**
  - `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` is the Lean target. It is `proved_informal` and unchanged.
  - `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` is `formally_verified` per the attack brief's controller facts and unchanged. U1's obligation (a) is correctly found already discharged.
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` stays OPEN at full scope.
  - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` is used only as carried definitions.
  - The primary aggregate is untouched.
  - No new key is proposed by U1, and none by me. My Lean identifiers are scratch names, not key candidates, and none reuses a ruling-48 working label.

## Independent re-derivation

I built my own instrument, `crit_u1t.py`, using the standard library and exact integers, with `python3 -B`. It is based on SEMANTIC-CONTRACT §1.2 and the literal Lean `spiderEdge`. U1 shipped no mathematical script, so nothing was reused. Every assertion passed (`run1.log`).

1. **Fixed points (instrument trust).**
   - `K_{1,12}/8`: `n=13, α=12, x=6, |F|=12`, supply 1980, capacity 3960, `S=−1980`.
   - Path-star `(2,3,4)/7`: `n=15, α=11, x=5, |F|=10`, 1483 / 2701, `S=−1218`.
   - In both, `supply − capacity = S` is asserted with `S` computed separately from `q_v(j) = i_j(H_v) − i_j(R_v)` on the deleted graphs. `x` is computed through rank `α`. The tree is checked by BFS connectivity plus union-find acyclicity.
2. **Is `spiderOneTwoThrees` the spider of record?** I transcribed `spiderEdge` literally, as `fromRel`: `u ≠ v` and `(r u v ∨ r v u)`.
   - For `k = 0…6` it is a tree with `3k+3` edges.
   - Its literal independence polynomial equals `(1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k` coefficient by coefficient. Total counts for `k = 0…6` are 8, 36, 168, 804, 3912, 19236, 95208.
   - The labelling is root 0, pendant leaf 1, path `0–2–3`, and arms `0–a_i–b_i–c_i` with `a_i = 4+3i`. **Yes, it is the spider.**
3. **α, x, eligibility** (closed form, `k ≤ 80`):
   - `α = 2k+2`.
   - `x = k+1` for `5 ≤ k ≤ 80`. In fact `x = k+1` for every `k ≤ 12` printed, including `k = 0…4`.
   - `i_{k+2} < i_{k+1}` for `1 ≤ k ≤ 80`.
   - The eligible window is the single rank `p = k+3` for `k = 5, 6, 7`, and `[k+3, ⌊(4k+4)/3⌋]` thereafter (for example `k = 8`: `p ∈ {11, 12}`).
   - I checked U1's stated descent identity `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1}`, with `e_{k+2} = e_{k−2} ≤ e_k` and `e_{k+1} = e_{k−1}`, exactly for `k = 1…60` (`identity_check.py`).
4. **Hook lemma** (`HookChain.lean`), checked exhaustively for `h, L ≤ 9`:
   - The partition is the one SR-C5-2 describes, as the attack brief quotes it: `(i, j) ∈ C_j` if `i + j ≤ h`, else `C_{h−i}`. So chain `C_t` runs `(0,t)…(h−t,t),(h−t,t+1)…(h−t,L)`, a symmetric chain about `(h+L)/2`.
   - `hookPred` is injective on every rank with no guard, and lands in the grid one rank down.
   - It is total at rank `r+1` **iff** `r+1 > min(h, L)`.
   - The guard `h + L + 1 ≤ 2(r+1)` is exactly `r+1 ≥ c + ½` with `c = (h+L)/2`, the step-down condition of the informal proof. It is sufficient everywhere and sharp when `h = L`.
   - I found 475 guarded ranks, all total, and 285 unguarded totality failures, all at `r+1 ≤ min(h, L)`.
5. **Lean rebuild, cold, in my own pinned copy.**
   - Setup: `lean-toolchain` is `v4.32.2`, and Mathlib `905b9581…` matches `sources/mathlib-binding/PIN.json` and the shared manifest. `.lake/packages` is bound by manual symlink, I `cd` into the project, and I never ran `lake update` or `lake clean`.
   - `lake build LeanProof` completed successfully (8661 jobs).
   - `lake build LeanProof.SpiderDraft` succeeded with exactly five `declaration uses 'sorry'` warnings.
   - `#print axioms` on every new or carried declaration gives `[propext, Classical.choice, Quot.sound]` or fewer, with no `sorryAx`. That covers `spiderOneTwoThrees`, `_decAdj`, `_isTree`, `spiderChildEdge_range`, `hookChainIndex`, `hookPred`, the three hook lemmas, `hookPred_injOn_rank`, entries 73–75 and `crossingIndex`.
   - `sorryAx` appears on all five drafts: N2, N3a, N3b, N6 and N7. The return checked only two of these.
   - `grep` finds no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in the five library files.
   - Linter note: `hi : i ≤ h` is unused in `hookPred_isSome_of_rank_ge`. That is harmless, and consistent with the return's statement that totality uses only `j ≤ L`.

## Attacks and findings

**F1 (decisive; strikes the return's gap statement).** C4-LA1 already formalizes the iterated product. Its entries 25–37 are all `{V : Type*} [DecidableEq V]` and contain no `gkGraph`:

- `ChainFactor` has blocks `single v`, `path x y z` with chains `∅<{x}<{x,z}`, `{y}` and `{z}`, and `frozen vs s`.
- Alongside it are `code`, `drop`, `rk`, `Valid`, `chainDownUp`, `chainDownVertex`, `chainSize`, `chainRank`, `ChainValid` and `ChainDisjoint`. The source comment on entry 31 reads "the two-chain split `L_i` of `[0..m] × [0..n]` … iterated block by block".

Entries 55–72 prove the facts the spider needs:

- the rank identity `2·chainSize + up = chainRank + down` (entry 63);
- existence of the predecessor when `down > 0` (entry 65);
- **injectivity of the chain-predecessor deletion** from `ChainDisjoint` and `ChainValid` alone (entry 68, `eq_of_chainDownVertex_erase_eq`).

This is N5 in its general, finite-product form, stated directly on `Finset V` with a deleted vertex. It is not in grid coordinates, which would still need a bridge to independent sets. I carried entries 25–37 and 55–72 (31 entries) byte-identically into `CarriedC4LA1Chain.lean` and compiled them against U1's `Carried.lean`, with zero errors and zero warnings.

So the return's claims fail:

- "the finite-product iteration … is NOT formalized",
- "the single blocking step",
- "smallest open Lean lemma".

The iteration is not open anywhere in the program's Lean record. U1 carried entries 73–75 from the same directory. The allocation also said "reuse C4-LA1's machinery where it is literally the same", and here it is literally the same generic lemma. `HookChain.lean` is a correct but redundant coordinate re-proof of a two-block special case. No terminal award should build on it.

**F2 (critic-derived advance; attributed to me, C-U1-T).** Every per-tag injection on the spider comes from C4-LA1's generic entries, given a spider block assignment:

> For a leaf tag `τ` of `S_k`, let `𝓑_τ` be the list
> `[β₁(τ), path(3,2,0), A_1 … A_k]`, where:
> - `β₁ = frozen({1},{1})` if `τ = 1`, and `single 1` otherwise;
> - `A_j = frozen({a_j,b_j,c_j},{a_j,c_j})` if `τ = c_j`, and `path(a_j,b_j,c_j)` otherwise.
>
> Set `φ_τ(B) = B ∖ {chainDownVertex(𝓑_τ, B)}`.

**Claim (`proved_informal` on this face, STATED; it needs an isolated second read).** For every `k ≥ 1`, every `p ≥ k+2` and every leaf `τ`, `φ_τ` restricted to the `τ`-active `B ∈ I_{p+1}` has these properties:

- it is defined;
- it is a single deletion;
- it lands in `I_p`;
- it keeps `τ` active;
- it is injective.

Entry 75 therefore gives a deletion-supported saturating flow for every `F ⊆ leafSet`.

*Proof.*

1. **Root absent.** If `0 ∈ B`, then `B ∖ {0} ⊆ {3} ∪ ⋃_j {b_j, c_j}`, which holds at most one vertex per arm. So `|B| ≤ k+2 < p+1`.
2. **Blocks and validity.**
   - The blocks partition `V`. Here `path(3,2,0)` is a genuine path of `S_k`, with the root as its `z`-vertex; this carries the `2–3` edge that `ChainFactor` has no constructor for.
   - `Valid` holds on every independent `B`.
   - For `τ = c_j`, activity forces `a_j ∈ B` and `b_j ∉ B`, so the frozen arm is valid.
   - Tag `3` has `W_3 = {0}`, so by step 1 it has no active source.
3. **Totality.**
   - `chainRank(𝓑_1) = 2 + 2 + 2k = 2k+4` and `chainRank(𝓑_{c_j}) = 1 + 2 + 2(k−1) + 4 = 2k+5`.
   - `chainSize = |B| = p+1`, so entry 63 gives `down ≥ 2p + 2 − (2k+5) ≥ 1` for `p ≥ k+2`.
   - Entry 65 then gives the vertex `q`.
4. **Injectivity.** This is entry 68.
5. **Activity.**
   - For `τ = c_j`: a frozen block never drops, so `a_j` and `c_j` survive.
   - For `τ = 1`: `2` is the `y` of `path(3,2,0)` and is never dropped. `q = a_j` only when `c_j ∉ B`. If `B ∖ {q}` then had no witness, `B ⊆ {1, 3, a_j} ∪ (one vertex per other arm)`, so `|B| ≤ k+2`, a contradiction.
   - This argument is not C4-LA1's box-top lemma (entry 107). That lemma fails for the spider at `p = k+2`, because `path(3,2,0)` at `{3}` is not at its top. The plain cardinality bound covers every `p ≥ k+2`. ∎

**Validation** (bounded, never proof). I ported C4-LA1's `code`, `drop`, `chainDownUp` and `chainDownVertex` literally to Python and applied them with `𝓑_τ` for every leaf tag at every `p ∈ [k+2, 2k+1]` for `k = 5, 6, 7`. Each run asserts the following on the literal network:

- blocks partition `V`;
- the root is absent;
- `ChainValid` holds;
- entry 63's identity holds;
- the predecessor is total;
- the image lies in `I_p`;
- activity is kept;
- the map is injective per tag;
- tag 3 has zero active sources;
- the assembled flow meets every target capacity and sends every source's full weight;
- `supply − capacity = S` from independent sides.

For example, `k = 5, p = 8` (eligible) gives `|F| = 7`, supply 3125, capacity 6100, `S = −2975`, flow 3125. `k = 7, p = 10` (eligible) gives `|F| = 9`, 109389 / 176918, `S = −67529`, flow 109389. There are 18 rows in all, listed in `run1.log`.

**F3 (critic-derived: the terminal at `p = k+3` needs neither N2 nor N3b nor Newton).** Eligibility at `p = k+3` has two halves.

- **(low)** `3(k+3) < 2α + 1` needs only the lower bound `α ≥ 2k+2`, not the equality N2. **I proved this in Lean.** `spiderOneTwoThrees_indepNum_ge : ∀ k, 2*k+2 ≤ (spiderOneTwoThrees k).indepNum` uses an explicit witness: labels `≠ 0` and `≢ 2 (mod 3)`, since every `spiderEdge` has an endpoint labelled `0`, `2` or `5+3i`. The card is proved by induction over `Finset.range`. From it, `spiderOneTwoThrees_low_at_kPlus3 (k) (hk : 5 ≤ k) : 3*(k+3) < 2*indepNum + 1`. The file `CriticIndepLB.lean` is `edf35df0…`. It builds as a module, `#print axioms` gives `[propext, Classical.choice, Quot.sound]`, and it has no `sorry`, `decide` or `native_decide`; the `k = 0` base case is `rfl`. Grade: `compiled`.
- **(x)** `x ≤ k+1`, which is N3a, has a proof with no generating function and no Newton. The map `I_{k+2} → I_{k+1}` is:
  - on root-absent sets, the chain predecessor for `[single 1, path(3,2,0), arms]`. The rank is `2k+3`, so `down ≥ 1`, and entry 68 gives injectivity.
  - on root-present sets, `B ↦ B ∖ {3}`. A root-present `(k+2)`-set must contain `3` and one vertex from each arm.

  The map preserves root membership, so it is injective. It misses `{0,3} ∪ (one vertex from each of k−1 arms)` when `k ≥ 1`. Hence `i_{k+2} < i_{k+1}`, so `Δ_{k+1} < 0`, and `crossingIndex ≤ k+1` by `Nat.find_le`. I validated this literally for `k = 1…8`. For example `k = 8` gives `|I_{10}| = 443054 < |I_9| = 483665`.

**F4 (draft statements).**

- **N7 as drafted** (`∃ f, IsSaturatingFlow … (k+3) f`, `k ≥ 5`) asserts no tree face and no eligibility. As stated it follows from the per-tag flow for every `p ≥ k+2` and depends on neither N2 nor N3a. The return's DAG line "assembled from N1, N2, N3a (⇒ eligibility)" does not describe the statement it drafted. The terminal must carry the conjuncts, as C5-LA1 carried the tree face:

  ```lean
  (spiderOneTwoThrees k).IsTree ∧ C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧
    3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f
  ```

  for `k ≥ 5`. Its inputs are N1 (compiled), my lower bound (compiled), the root-split N3a (informal, closed) and F2 (informal, closed).
- **An "every eligible rank" statement** needs `x ≥ k`, that is `Δ_j ≥ 0` for `j < k`. That is N3b-type content and is where Newton enters. For `k ∈ {5, 6, 7}` the window is only `{k+3}`.
- **N6 as drafted** covers leaf `1` only. Its injectivity clause ranges over every `B ∋ 1`, not only active `B`. That is stronger than entry 75's `hinj`: it is satisfiable and implies `hinj`, but "matching E-2's hypothesis shape exactly" is inaccurate, and composing it needs an adapter and a case split on `τ`.
- **No tip-class statement is drafted**, although N7 needs one.
- **N3a's hypothesis `1 ≤ k`** is correct and not too strong (`x = k+1` holds numerically for every `k ≤ 12`).
- **N3b** (`k ≥ 5`, `x ≥ k+1`) is the right statement at SR-C5-2's scope. It is not needed for the `p = k+3` terminal.

**F5 (citations).** SEMANTIC-CONTRACT.md contains no `E-1`, no `E-2` and no spider statement. The return's repeated "SEMANTIC-CONTRACT.md's `E-1`" is misattributed. The spider statement lives on the spider key's face and SR-C5-2, and `E-1` and `E-2` are working labels (ruling 48). The gkGraph template is cited as "`scratchpad/c5-U1/…Main.lean`, itself `formally_verified` via C5-LA1". A scratch file has no grade. I confirmed only that `gkGraph_isTree` occurs in C5-LA1's `Main.lean` (3 matches). I did not byte-compare the two.

**Other checks.**

- Natural-number subtraction: `hookChainIndex`'s `h − i` sits behind `i ≤ h` in every lemma, and the `(n−4)/3` steps in `Spider.lean` are guarded by `omega` from hypotheses in context.
- No hypothesis encodes a conclusion.
- `IsTree` comes via `isTree_iff_connected_and_card`, with connectivity plus a child–parent edge bijection. That is the acyclicity-and-connectivity test.
- There is no circularity.
- Fidelity: U1 reports no numbers. The carried `activeWeight` counts `F ∩ B` filtered by `¬Disjoint (B.erase v) (tagWitnesses G v)`, which is active tags, and `transportRel` is (D)∪(S) literally (C1-LA1 carry). The draft N7 uses `favorableLeaves` at the original rank `k+3`.

## Mechanism-equivalence and fence check

The mechanism is the per-tag deletion matching on **one named family**, `S(1,2,3^k)`, feeding the registered spider key. Per the allocation, family-scoped use of the per-tag shadow is not a revival of `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. Using it universally would be a revival, and neither U1 nor I do so. The route does not revive deletion-only Hall universally: it is scoped to one family where the key already records deletion-arc saturation. It does not revive Delete/Retag, own-support unit capacity, occupancy, signed cross-tag or covariance. It re-proves no closed region. The spider key is `proved_informal`, and its Lean formalization is the chartered object, not a re-proof as a contribution. No census value is used in any proof: my bounded rows are labelled validation. There is no RTree wording, no (LIFT) or quotient step, and no `D, C ≥ 0` budget use.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "Build completed successfully"; five `sorry` warnings | reproduced cold (8661 jobs; 5 warnings) | stands |
| `#print axioms` `[propext, Classical.choice, Quot.sound]` on three declarations | reproduced; also on every new declaration | stands |
| file digests (7 Lean + 4 seed + script) | reproduced | stands |
| "byte-identical" carries (`Carried`, `CrossingIndex` body, `CarriedC4LA1` bodies) | reproduced by `cmp` and substring check against origins | stands |
| "no gkGraph-specific text was pulled in" | reproduced | stands |
| Grade column "**theorem**" for N1, N5-two-factor, E-2 | a scratch compile is `compiled` (R29-N-12); a carried companion is `proved_informal` at registration | **struck**: read `compiled` (N1, hook lemma); carried within the C4-LA1 kernel receipt (E-2) |
| "N5 general finite-product case … NOT formalized", "the single blocking step", "smallest open Lean lemma" | contradicted by C4-LA1 entries 25–37 and 55–72 (F1) | **struck** |
| "matches `C5-STAGE7-FORMALIZER-BRIEF-LA1.md` entry table" | outside my capsule; no table shipped | not checked (digests verified directly instead) |
| "only entries 1–36 were needed" | `Carried.lean` is C1-LA1's whole `Main.lean`; entry numbering unchecked; the fragments compile | numbering unbacked; compile stands |
| "the tree of SEMANTIC-CONTRACT.md's `E-1`" | no such text in the contract | **struck** (tree identity confirmed independently, Independent re-derivation item 2) |
| "N6 … matching E-2's hypothesis shape exactly … by `apply`" | the injectivity clause is stronger and the `φ` type differs | **struck** ("implies, via an adapter") |
| `gkGraph_isTree` scratch "itself `formally_verified`" | a scratch file has no grade | **struck** (the declaration occurs in C5-LA1; not byte-compared) |
| "`#print axioms` on two of them reports `sorryAx`" | true; I found it on all five | stands |

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What stands.**

- N1 (`spiderOneTwoThrees_isTree`) is `compiled`, and the spider is correct.
- The two-factor hook lemma is `compiled`, but it is redundant with C4-LA1 entries 31, 32, 63, 65 and 68, and no award should carry it.
- The E-2 carry is byte-identical and graph-generic.
- Obligation (a) is correctly found already discharged.

**What is narrowed.**

- The gap statement, the "theorem" grades and the misattributed citations are struck.
- The DAG is corrected per F2–F4.

**Toward the run's letters.** On gate ruling 30's (a)–(d) (not in my capsule; stated by content): U1 supplies no restricted (HALL) at a new scope and no (CUT). Its contribution is Lean-ready material for the already-registered spider scope. With this critique, the spider's `p = k+3` terminal has a closed informal DAG whose open Lean nodes are transcription only.

**What a successor inherits.**

- U1's `Spider.lean`.
- My `CriticIndepLB.lean`.
- C4-LA1 entries 25–37 and 55–72 (carried byte-identically, compiled here).
- The block assignment `𝓑_τ` and its proof (F2).
- The root-split proof of N3a (F3).

I judge the statement's mathematics complete at `proved_informal` for the `p = k+3` terminal and for the flow at every `p ≥ k+2`, subject to an isolated second read of F2 and F3.

## Remaining obligation

These are exact, with no new combinatorics, for a bounded terminal Stage 7 award on `S(1,2,3^k)` at `p = k+3`, `k ≥ 5`, with the statement in F4:

1. **Carry.** Carry C4-LA1 entries 25–37 and 55–75 byte-identically, keyed by (C4-LA1, entry, digest).
2. **Spider block layer.** This transcribes C4-LA1 entries 38–44 and 76–105, 108–110 onto `spiderVertex` with the changes of F2:
   - define `spiderTagFactors`, with `path(3,2,0)` in place of `path(3,2,4)` and no cherry-frozen branch;
   - `ChainDisjoint`, `ChainValid` and `chainSize = |B|`;
   - `chainRank ≤ 2k+5`;
   - root absent at `|B| ≥ k+3`;
   - tag-3 vacuity;
   - the active-iff lemmas for tags `1` and `c_j`.
3. **Leaf-1 activity after the step** at `p ≥ k+2`, by the cardinality argument of F2(5). This replaces entry 107.
4. **Per-tag injection and flow.** Transcribe `…TagDown_injOn` and `…_erase_keeps_tag_active`, then compose with entry 75 for `F = favorableLeaves (k+3)`.
5. **N3a via the root split (F3).**
   - The root-absent predecessor for `[single 1, path(3,2,0), arms]`.
   - The root-present `erase 3`.
   - Disjointness of the two images, the missed witness, then `Nat.find_le`.
6. **Composition.** Combine N1 (U1) with `spiderOneTwoThrees_low_at_kPlus3` (mine) and steps 2–5.

N2 (the equality) and N3b are needed only for an "every eligible rank" theorem at `k ≥ 8`. That version additionally needs `x ≥ k`, the one non-engineering node, whose informal proof is SR-C5-2's and uses Newton as a named undischarged dependency.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-U1-T/` (SHA-256):

- `seal.py` `55f1a2f78a510a23b0be74855c4d0a0100fec8bef986fda7dd2ec4e8e34b0c86`: seals and capsule members.
- `carrycheck.py` `a0d9d896106b15293e2f498e09d12c9b34761f743dce67f8fe38ed34a2aee5d2`; `carrycheck2.py` `1b9f7fe56856472d85b163879859cb7221211e51548ededcb4f20b375c3a235f`: byte carries.
- `crit_u1t.py` `b9edaf86974df84e0525fe0600906af07aa35cc57717529d2a2ba892e1c047dc`: the instrument, parts A–F. Its output is `run1.log` `28690d12031aea5011e49fdae1e1dc3dea8d9dbe335eec5ee452d17ef958bfcb`.
- `identity_check.py` `93234ba8df0b224c101ba2e20833e2d00c008c914a879acbbd20806b54fec36a`.
- `replay/`: U1's inventory copied out (digests as listed above). It also holds:
  - `replay/LeanProject/LeanProof/CarriedC4LA1Chain.lean` `1d90bcc690411646315622f6dfa863b56d8f42b847a77bdd04464a98e63fd7ae` (31 C4-LA1 entries, byte-identical);
  - `replay/LeanProject/LeanProof/CriticIndepLB.lean` `edf35df004d772f1e9afe6cbe28d62c26cc587062e2fe9185c63a48c77e8c4e4` (critic-derived, `compiled`);
  - `replay/Probe.lean` `5dfefbdf…` and `replay/Probe2.lean` `ce513f28…` (axiom probes);
  - `replay/build_lib.log` `41292984…`, `replay/build_draft.log` `edc5eb08…` and `replay/chain_compile.log` (empty: no errors or warnings).
- Replay: `cd <scratch> && python3 -B crit_u1t.py` (about 100 s) and `python3 -B identity_check.py`; `cd <scratch>/replay/LeanProject && lake build LeanProof LeanProof.SpiderDraft LeanProof.CriticIndepLB`.

**Process and read-boundary disclosures.**

1. **Files under `runs/` read beyond the capsule list.** I relied on the common brief's standing that the governed awards under `runs/` are readable Cycle 6 sources of record, and I needed them for the attack brief's carry questions:
   - C1-LA1 `Main.lean` (compared);
   - C4-LA1 `Main.lean` (digest and substring checks);
   - a listing of `runs/` and of C4-LA1's `Snippets/`;
   - C4-LA1 fragments 0001–0075 for byte containment, with 0022, 0025–0044, 0063, 0065, 0068, 0072, 0106, 0107, 0109 and 0113 read in text;
   - `grep -c gkGraph_isTree` on C5-LA1's `Main.lean`.
2. **Other reads:**
   - non-recursive `ls -la` of `scratchpad/c6-U1/`, `LeanProject/`, `LeanProject/LeanProof/` and `LeanProject/.lake/` (replay grant);
   - `grep -n` on `control/SOURCE-DIGESTS.json` (capsule member);
   - `sources/mathlib-binding/PIN.json`;
   - the shared Mathlib project's `lake-manifest.json` (pin check).
3. **Not read:** `scratchpad/c6-U1-replay/`, any other return or critique, and the Cycle 5 records.
4. **No search above my grant.** The only `find` was rooted at my own scratch directory, `-maxdepth 2`, looking for bytecode; none was found.
5. **No network, installs or bytecode.** There was no network access and no package install. No bytecode was written.
6. **No background jobs.** All builds and scripts ran in the foreground, so nothing needed killing. I did not run a process listing.
