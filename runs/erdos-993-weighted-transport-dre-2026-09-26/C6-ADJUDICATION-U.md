# Orientation Adjudication

**Adjudicator:** the isolated Stage 5 adjudicator for orientation U (formal / structural), r30 Cycle 6 (the sixth and last cycle). The portfolio is seat `U1` (`C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS`) and seat `U2` (`C6-U-02 COUPLED-CB-EXTREMAL-FAMILY`), each with its two cross-orientation critiques (`C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and I loaded no other VerityOS subsystem. The host placed the project `CLAUDE.md` and the user's auto-memory index in my context at session start. I did not act on either: I kept no conversation log and wrote no memory or inbox item, because the dispatch confines my writes to this file and to `scratchpad/c6-adj-U/`.

## Identity and seal audit

- **Dispatch.** `control/dispatch/c6-stage5/DISPATCH-ADJ-U.md` has SHA-256 `030a422c828a4063ef7002a31a4ac875e1ab59e78e23e3ee09179176fbe75129`. I checked it with `shasum -a 256` before following it, and it **matches**.
- **Capsule seal.** For `control/c6-adjudicator-capsules/U-PACKET-MANIFEST.json` I recomputed the seal as SHA-256 of the canonical JSON without `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline). The result is `d6dcf86ffa3ace6eb4cdd68930d096a50dab862b46a5ec556db400598954e076`, which **matches** the dispatch literal and the file's own field.
- **Capsule members.** All 21 members match their listed SHA-256 and byte counts: the protocol, both contracts, the allocation, the gate, `SOURCE-DIGESTS.json`, the Stage 2/3/4 manifests, the Stage 3/4 admissions and disclosures, `C6-STAGE5-CONTROLLER-FACTS-U.json`, `PATH-CHECK-U.json` (0 findings), the two returns and the four critiques.
- **Inner seals recomputed:**
  - Stage 2: `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`, match.
  - Stage 3: `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`, match.
  - Stage 4: `0e5fc7b47a1c90fb8ac25b800585321a8ef7f2d8a52e40654f85c3a45b70be5c`, match with the file's own field.
- **Returns and critiques.** Each is listed in the Stage 3/4 manifests with the digest the capsule gives:
  - `U1` `b3db2244…`, `U2` `2c7dfa48…`;
  - `C-U1-T` `b167bcaf…`, `C-U1-F` `a9104377…`, `C-U2-T` `29745049…`, `C-U2-F` `00b1accb…`.

  Both admissions are verdict `admit` with 0 findings. Every return and critique carries `headline_resolved: no`, and every critique verdict is `retained_narrowed`.
- **Model lines.** Both returns say "chartered sonnet/xhigh … `claude-sonnet-5`", which agrees with the allocation (routes are Sonnet 5 xhigh). All four critiques say "chartered opus/medium … claude-opus-5-5[1m]", which agrees with the allocation (critics are Opus 5.5 medium).
- **Inventoried scratch digests I re-verified copy-out-first:**
  - The seven U1 Lean and project files: `Carried 86b59c6c…`, `CrossingIndex 3fb2dbd6…`, `CarriedC4LA1 a0381495…`, `HookChain 91c85fa2…`, `Spider 18396be5…`, `SpiderDraft 8ae4f2f6…`, `LeanProof.lean a259e82d…`.
  - The U1 seed files: `lakefile.toml 45d0ca58…`, `lake-manifest.json 52a4d73c…`, `lean-toolchain 2bdc48ad…`.
  - The critic Lean files: C-U1-T `CarriedC4LA1Chain 1d90bcc6…` and `CriticIndepLB edf35df0…`; C-U1-F `CriticN2 0a0aac07…` and `CriticCompose 8d38f023…`.
  - All U2 scripts: `orbit_net ab8076bf…`, `solve 1fbb9a7a…`, `run_all ec2abfd9…`, `tree 39fc398c…`, `flow 10a870de…`, `validate 8541b816…`, `validate_flow 2c5ec816…`.
- **Disclosures weighed; no penalty to any seat.**
  - U1: two `ls | grep` calls whose underlying listing covered `control/` and `second-reads/`, and an authorized over-read of three Cycle 5 files.
  - U2: named-directory `ls` only.
  - `C-U1-T` read C1-LA1 and C4-LA1 award files under `runs/` beyond its capsule. This was load-bearing for its central finding. I corroborated that finding independently from an authorized frozen source (below).
  - `C-U2-F` recovered a PID with `lsof` on its own log and killed four jobs by literal PID.
  - The other items are names-only listings.
  - The controller facts CF-0…CF-U2 are weighed as one more replay, never as authority.

## Route-by-route decisions

### `U1` — `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS`

**Route verdict: `compiled`, retained_narrowed.**

**Obligation (a).** It was correctly found moot: C5-LA1 closed `formally_verified` before the cycle (CF-1).

**Obligation (b).** The spider `S(1,2,3^k)` Lean layer, resolved claim by claim.

1. **`spiderOneTwoThrees` / `spiderOneTwoThrees_isTree`: stands, grade `compiled`.**
   - I rebuilt cold in my own pinned copy (`scratchpad/c6-adj-U/LeanProject`: toolchain `v4.32.2`, Mathlib `905b9581…` bound by manual symlink, `cd` into the project, no `lake update`/`lake clean`). `lake build` completed successfully (8666 jobs).
   - `#print axioms` gives `[propext, Classical.choice, Quot.sound]`.
   - Both critics confirmed that the graph is the spider of record, from the Lean adjacency. My own literal instrument uses the same labelling and passes an edge-count, acyclicity and connectivity test for `k = 1…7`.
   - U1's grade "theorem" is struck; a scratch compile is `compiled` (R29-N-12). Both critics concur.
   - The docstrings cite "SEMANTIC-CONTRACT.md `E-1`", which does not exist (both critics), and call a scratch file "formally_verified". Both citations are struck and must be corrected before any carry.
2. **E-2/N4 carry (C4-LA1 entries 73–75): stands, byte-identical and graph-generic.** C-U1-T checked against the origin under `runs/`; C-U1-F checked self-consistency only. I resolved the gap with a third check, `adj_carry_check.py`:
   - All 3 entries hash to their header digests.
   - Each entry body, and its digest literal, occurs **byte-for-byte** in the authorized frozen source `sources/c5-stage7-sources/U1/LeanProject/LeanProof/Main.lean` (`05c24dda…`, a Stage 2 member).
   - The carried lemma is a companion inside a `formally_verified` award and carries no certificate of its own.
3. **`hookPred_injOn_rank` (two-factor N5): `compiled`, correct, and redundant.** It will not be carried to any award (see 4).
4. **"The finite-product iteration (N5 general) is NOT formalized; the single blocking step; the smallest open Lean lemma": STRUCK.**
   - This is the one real disagreement between the paired critics:
     - C-U1-T: already formalized, graph-generic, in C4-LA1 entries 25–37 and 55–72.
     - C-U1-F: still open. Its items (2a)–(2c) cover the N5 iteration, rank offsets and a product bridge.
   - C-U1-F did not read the C4-LA1 text, and it says so. The replay decides the question:
     - C-U1-T's `CarriedC4LA1Chain.lean` (31 entries) compiles in my rebuild with zero errors or warnings.
     - Every entry matches its header digest and is byte-contained, with its digest literal, in the frozen `05c24dda…` source (31/31).
     - All declarations are stated for `{V : Type*} [DecidableEq V]` with no `gkGraph` token.
     - `#print axioms` on entries 63 (`two_mul_chainSize_add_up_eq`), 65 (`exists_chainDownVertex_of_down_pos`), 68 (`eq_of_chainDownVertex_erase_eq`) and 70 gives the three permitted axioms.
   - The machinery works directly on `Finset V` blocks (`code`/`drop`/`chainDownUp`/`chainDownVertex`), so no grid-to-independent-set product bridge is needed.
   - **Resolved in favour of C-U1-T.** C-U1-F's (2a)–(2c) are superseded, and its "roughly nine Lean nodes" is re-sized below.
5. **"N2 blocked by N5; needs a generating function": STRUCK.**
   - C-U1-F compiled the equality `spiderOneTwoThrees_indepNum_eq : indepNum = 2k+2` by an explicit set and a cell partition.
   - C-U1-T compiled the lower bound `spiderOneTwoThrees_indepNum_ge` by a witness.
   - I rebuilt both; each has the three axioms only. They are concordant and complementary.
6. **N7 as drafted: not a terminal.** Both critics concur. The draft is a bare flow statement with no tree face and no eligibility face, and its stated dependency line (N1, N2, N3a) does not describe what it asserts. The corrected face is C-U1-F's compiled `spider_kPlus3_terminal_of_nodes`; I rebuilt it and it has the three axioms.
7. **N6 draft: narrowed.** Its injectivity clause ranges over inactive sources too, so it is stronger than entry 75's `hinj`. It composes only through an adapter. There is no tip-class draft. Both critics concur.
8. **N3b (`x ≥ k+1`, Newton): correct at SR-C5-2's scope.** It is **not needed** for the `p = k+3` terminal; both critics concur.

### `U2` — `C6-U-02 COUPLED-CB-EXTREMAL-FAMILY`

**Route verdict: `bounded_evidence`, retained_narrowed.**

1. **The instrument and the three laboratory maxima: retained (`bounded_computation`).**
   - The values are 22,458,436 at `CB(11,2)/16`, 86,940,920 at `CB(10,2)/14`, and 3,573,432,896 at `CB(12,2)/17` (new).
   - I replayed `run_all.py` copy-out-first. `run_all_RESULT.json` is byte-identical to the shipped file (`f28aa145…`), and `RESULT_SHA256 7d131453…` is reproduced.
   - Both critics reproduced all three values with their own instruments. The values therefore rest on three instruments, all orbit quotients at the laboratory sizes.
   - All three rows are **non-eligible** (CF-REPLAY-c6c; both critics). U2's window upper ends `[16,14]` and `[19,17]` are corrected to `[16,15]` and `[19,18]` (`⌊2α/3⌋`, `α = dm+m+1`).
2. **"Compression lemma CONFIRMED … strictly stronger … answers decisively": STRUCK.**
   - The paired critics agree completely. Each found, independently, the **same** counterexample to the all-families lemma "`c → b` column replacement does not decrease the deficit".
   - The counterexample is at the deficient laboratory row `CB(2,2)/4`. The singleton `{r, v, b_{0,0}, c_{1,0}, c_{1,1}}` has deficit −2. Its column shift `{r, v, b_{0,0}, b_{1,0}, c_{1,1}}` has deficit −3, because the shift creates a one-support choke and so enables the `u_1`-switch onto the positive V-arm target `{v, b_{0,0}, u_1, c_{1,1}}`.
   - **Replayed literally by me** (`adj_compress.py`): `|F| = 5`, `w = 1`, capacities 3 and 4, deficits −2 and −3.
   - U2's "membership in `X*` is closed under column moves" concerns one family and is incomparable with the lemma. What survives is the WLOG form: on the tested rows, a `c ↔ b`-closed maximizer exists (`bounded_computation`).
3. **The candidate claim ("the maximizer contains every positive RV/EMPTY/V source, S all-or-nothing"): narrowed.**
   - C-U2-T: false at every zero-deficit row. At `CB(3,4)/11` the maximizer is `∅`. The claim needs the hypothesis "max deficit > 0".
   - C-U2-F: false at `m = 1`. At `CB(7,1)/6` the unique maximizer consists of RV orbits with at least 2 supports only; it is non-unique at `CB(6,1)/5` and `CB(8,1)/6`.
   - The two narrowings are compatible. **I replayed `m = 1` literally** (`adj_cb.py`): at `CB(7,1)/6`, `S = −21`, max deficit 21, and the minimal maximizer is all RV (546 labelled sources). At `CB(10,1)/8` the maximizer is also all RV.
   - The claim survives as a **bounded record** for `m ≥ 2`, positive max deficit, and non-eligible rows only:
     - U2's 19 rows, of which only 5 are non-trivial and 2 are vacuous (`|F| = 1`, empty S class);
     - C-U2-T's 40 rows;
     - C-U2-F's 38 rows.
4. **Literals struck:**
   - `validate_RESULT.json` `da7d1d3d…`: the file is `07a7df30…` with internal `bb625789…`, and no file in `scratchpad/c6-U2/` contains `da7d1d3d`. I checked this myself.
   - "43 instances".
   - "eight data points (5/3)": the shipped data give 10, with 6 included and 4 excluded.
   - The range "`d = 1..9`, `m = 2..5`": it is `m ∈ {2,3,5}`.
   - "The RV half nearly free from CD-1": unsupported.
   - "(INV)/C2-LA1 gives the invariant maximum": true, but by the elementary supermodular-lattice argument, not by C2-LA1's predicate. Both critics concur.
   - The instrument's "verified CORRECT" is narrowed: its literal cross-checks cover small rows only, and **no literal laboratory reaches the switch-coupled regime** (max deficit > max(0, S), from `CB(9,2)/13`, `n = 41`) in any of the four instruments, mine included.
5. **Fidelity shortfall.** U2 asserts `supply − capacity = S` only on the three laboratory rows. This falls short of the every-instance rule. No number is struck, because both critics' and my instruments assert it on every row and agree.

## Cross-route reconciliation

- **U1 and U2 are independent.** U1 is Lean for an already-registered family scope. U2 is the structure of the CB extremal family. They share no load-bearing step.
- **Critic-derived content in each portfolio is concordant between the paired critics:**
  - For U1, both critics independently found the **same** root-split proof of `x ≤ k+1`: chain predecessor on root-free `(k+2)`-sets, `erase 3` on root-present ones, and the missed witness `{0,3} ∪ (one vertex from each of k−1 arms)`.
  - For U2, C-U2-T's A6 and C-U2-F's (A)–(C) are the same lemma in two notations. `L` equals `K_p`, since `[y^p]Ψ = dm·g_{p−2}`.
  - Neither pair's verdicts are averaged. Each item is resolved above on the replay.
- **CHAR scope.** C-U2-T stated CHAR, "max Hall deficiency = max(0, S, S − L)", for every `CB(d,m)` with `2 ≤ p ≤ dm − 1`. C-U2-T's sweeps contain no `m = 1` row. C-U2-F's literal `m = 1` rows refute it there, and my replay confirms (`CB(7,1)/6`: `max(0, S, S−L) = 14 ≠ 21`; `CB(10,1)/8`: `1020 ≠ 1170`).
  - **CHAR is a conjecture of record for `m ≥ 2` only.** On the tested `m ≥ 2` range there are no failures: C-U2-T's 701 quotient rows and 53 literal rows, C-U2-F's 38 deficient and 9 eligible rows, and my 38 small literal rows (of which the 34 with `m ≥ 2` pass).
  - The mechanism of the `m = 1` failure is C-U2-F's: mechanism 2 (V into RV with two U-state chokes) cannot fire with one choke, so the RV–V coupling is absent.
- **Bearing on the rest of the program.** U2's portfolio bears on T1/T2/F1 only as data. At four eligible switch-necessary rows, the canonical mixed family `X1` has deficit exactly `S − L ≈ −0.72·|S|`. I replayed this with a third instrument, closed forms I derived myself by conditioning on `r` and then on `u_i`, validated against my literal instrument on 38 rows with 0 mismatches:

  | Row | `(S−L)/|S|` |
  |---|---|
  | `CB(8,92)/492` | −0.721292 |
  | `CB(8,95)/508` | −0.720274 |
  | `CB(7,109)/510` | −0.731894 |
  | `CB(9,112)/673` | −0.718881 |

  So neither `X1` nor the whole positive layer is a (CUT) there. That is not a certificate of (HALL).

## Established results

Grades are those of SOLUTION-CONTRACT §4. "STATED" means the item was first made at a review stage and needs an isolated second read before registration.

1. **Compiled (scratch), sorry-free, three permitted axioms; replayed cold by me:**
   - `spiderOneTwoThrees`, `spiderOneTwoThrees_decAdj` (`@[reducible, instance] def`) and `spiderOneTwoThrees_isTree` (U1; `Spider.lean` `18396be5…`).
   - `spiderOneTwoThrees_indepNum_eq`, `spider_lowWindow_kPlus3` and `spider_kPlus3_terminal_of_nodes` (critic-attributed to C-U1-F; `CriticN2.lean` `0a0aac07…`, `CriticCompose.lean` `8d38f023…`). The last is a **conditional composition**. It takes as hypotheses (FLOW), "every `k`, every `p ≥ k+2`, every `F ⊆ leafSet`, a saturating flow", and (N3a), "`crossingIndex ≤ k+1` for `k ≥ 1`". From them it proves the `p = k+3` face for `k ≥ 5`. Neither hypothesis encodes the conclusion.
   - `spiderOneTwoThrees_indepNum_ge` and `spiderOneTwoThrees_low_at_kPlus3` (critic-attributed to C-U1-T; `CriticIndepLB.lean` `edf35df0…`).
   - `hookPred_injOn_rank` (U1; `HookChain.lean` `91c85fa2…`). Correct, but redundant.
2. **Carried byte-identically, compiled:** C4-LA1 entries 25–37, 55–72 and 73–75, graph-generic. I verified all 34 against a frozen authorized source. The full digests are in `scratchpad/c6-adj-U/adj_carried_entry_digests.txt`.
3. **`proved_informal`, STATED, critic-attributed to C-U1-T; I checked the proof on its face.** This is the **block assignment**. For a leaf tag `τ` of `S(1,2,3^k)`, the block list is `[β₁(τ), path(3,2,0), A_1, …, A_k]`, where:
   - `β₁` is `frozen({1},{1})` if `τ = 1`, and `single 1` otherwise;
   - `A_j` is `frozen({a_j,b_j,c_j},{a_j,c_j})` if `τ = c_j`, and `path(a_j,b_j,c_j)` otherwise.

   Through C4-LA1's entries 63, 65 and 68, this gives, for every `k ≥ 1`, every `p ≥ k+2` and every leaf `τ`, a single-deletion map on `τ`-active sources that is total, lands in `I_p`, keeps `τ` active, and is injective. The steps are:
   - the root is absent at `|B| ≥ k+3`;
   - `chainRank` is `2k+4` for `τ = 1` and `2k+5` for `τ = c_j`, so `down ≥ 1`;
   - `2` is a one-point chain, so it is never dropped;
   - for `τ = 1`, a witness-free image would force `|B| ≤ k+2`;
   - tag `3` has no active source.

   Entry 75 then gives a deletion-supported saturating flow for every `F ⊆ leafSet`. This is an **alternative proof** of the registered spider key's flow clause (`proved_informal` via SR-C5-2); it is not a new scope. It is Lean-shaped.

   **Bounded validation, three instruments.** C-U1-T ran `k = 5,6,7`. I ran my own literal port of the carried `code`/`drop`/`chainDownUp`/`chainDownVertex` (`adj_spider.py`) for `k = 1…7` at every `p ∈ [k+2, α−1]`. It asserts that each of the following holds on every row, and all pass:
   - partition and cover;
   - root absent;
   - `ChainValid`;
   - the entry-63 identity;
   - totality;
   - image in `I_p`;
   - activity;
   - per-tag injectivity;
   - the flow saturates every source and respects every capacity;
   - `supply − capacity = S` from `H_v`/`R_v`.

   The eligible rows are:

   | Row | `n` | `α` | `x` | `|F|` | Supply | Capacity | `S` | Flow |
   |---|---|---|---|---|---|---|---|---|
   | `k = 5, p = 8` | 19 | 12 | 6 | 7 | 3125 | 6100 | −2975 | 3125 |
   | `k = 6, p = 9` | 22 | 14 | 7 | 8 | 18900 | 33072 | −14172 | 18900 |
   | `k = 7, p = 10` | 25 | 16 | 8 | 9 | 109389 | 176918 | −67529 | 109389 |

   Every number here uses the literal `w_F`, the literal (D) ∪ (S) (the flow uses deletion arcs only), `F` derived at rank `p` on the original tree, and `x` computed through `α`.
4. **`proved_informal`, STATED, concordant between C-U1-T and C-U1-F; checked by me.** The **root split**: for every `k ≥ 1`, `i_{k+2} < i_{k+1}`, so `crossingIndex(S(1,2,3^k)) ≤ k+1`.
   - On root-free `(k+2)`-sets, take the chain predecessor for `[single 1, path(3,2,0), arms]`. Its `chainRank` is `2k+3`, so `down ≥ 1`.
   - A root-present `(k+2)`-set must contain `3` and one vertex of each arm. Map it by `erase 3`.
   - The images are disjoint by root membership.
   - The set `{0,3} ∪ (one vertex from each of k−1 arms)` is never hit.

   Validated for `k = 1…7` (mine) and `k = 1…8` (C-U1-T). This is an alternative, Newton-free proof of registered SR-C5-2 content.
5. **`proved_informal`, STATED, critic-attributed to C-U2-T (A6) and C-U2-F (A)–(C); the two are concordant, and I checked every step on its face.** This is the **CB mixed-family exactness lemma**. Take `T = CB(d,m)`, `F = F_p(T)` derived, `X2` = all positive-weight sources, and `X1` = the positive sources of arms RV, EMPTY and V.
   - (a) If `2 ≤ p ≤ dm − 1`, every positive target is a deletion image of a same-arm positive source (add a `c` in an empty column). Hence `deficit(X2) = S(T,p)`, by (WID).
   - (b) A positive S-arm target is joined only from S-arm sources. S-arm sources reach only S, EMPTY and weight-0 R targets.
   - (c) If `2 ≤ p ≤ dm − 1`, then `deficit(X1) = S − L`, with `L = 1_c·dm·(g_{p−2} − g_{p−3})` and `g = (1+y)^{d−1}·((1+2y)^d + y(1+y)^d)^{m−1}`. For every `p`, `deficit(X1) ≥ S − L` and `deficit(X2) ≥ S`, so the max deficit is at least `max(0, S, S − L)`.
   - (d) The S-part of any maximizer containing `X1` is a maximizer of the choke-forest network `Φ = m·S(2^d)` at rank `p − 1`, with private-leaf tags.
   - (e) Every maximizer containing `V⁺` contains `EMPTY⁺` (C-U2-F (B)).

   **Replayed literally by me** on 38 rows (`CB(2,2)`, `CB(3,2)`, `CB(1,3)`, `CB(2,3)`, `CB(4,2)` at every rank, plus the `m = 1` rows). The identities (a) and (c) hold on every row with `p ≤ dm − 1`. It is homogeneous CB only. It is not (HALL) and not a (CUT). It is a cut screen.
6. **Conditional reduction, proved on the face (C-U2-T).** On homogeneous `CB(d,m)` with `2 ≤ p ≤ dm − 1`: CHAR ∧ `S ≤ 0` ∧ `S ≤ L` ⇒ (HALL-COND) ⇒ a saturating flow (HALL⇒FLOW). Its premise CHAR is a **conjecture for `m ≥ 2`**, refuted at `m = 1`.
7. **`bounded_computation` records:**
   - The three coupled laboratory maxima (non-eligible; three instruments; quotient-only in the switch-coupled regime).
   - The arm-level maximizer characterization (`m ≥ 2`, positive deficit, non-eligible rows).
   - C-U2-T's closed-form screen: `S < 0`, `L < 0` and `S − L < 0` on 87,341 eligible rows with `d ≤ 13` and `m ≤ 150`. I re-evaluated only four rows of it, with my own closed forms.
   - C-U2-F's `m = 1` records.

   Counts are canonical as follows. "268 + 67 + 73" are orbit classes under `S_d ≀ S_m`. "223,706" counts labelled independent sets. My maximizer arm counts are labelled sets. "19 / 40 / 38 rows" count `(d,m,p)` rows.
8. **Refutation of a STATED lemma (not a registered key).** The all-families compression lemma "`c → b` column replacement does not decrease the deficit" is refuted at `CB(2,2)/4`. The finding is critic-attributed to both critics independently and replayed by me.

## Rejected and narrowed mechanisms

- **Struck from U1:**
  - the "theorem" grades (they are `compiled`);
  - "N5 general is not formalized / is the single blocking step / is the smallest open Lean lemma" (struck by replay: C4-LA1 entries 25–37 and 55–72);
  - "N2 is blocked by N5 / needs a generating function";
  - N7's dependency line, and N7 as a terminal;
  - N6's "matches E-2's hypothesis shape exactly … by `apply`";
  - every "SEMANTIC-CONTRACT.md `E-1`/`E-2`" citation (working labels, ruling 48);
  - "scratch `gkGraph_isTree` … `formally_verified`".

  `HookChain.lean` is retained as `compiled` but is not to be carried.
- **Narrowed from C-U1-F:** its Lean debt items (2a)–(2c), namely N5-general, rank offsets and the product bridge, are superseded by the carried generic machinery. What remains is listed under Lean readiness.
- **Struck or narrowed from U2:**
  - "compression CONFIRMED / strictly stronger / decisive";
  - the candidate claim's unrestricted wording (narrowed to `m ≥ 2`, positive max deficit and non-eligible rows);
  - `da7d1d3d…`, "43", "8 points (5/3)", "`m = 2..5`";
  - "RV half nearly free from CD-1";
  - the C2-LA1 citation for the invariant maximum;
  - the two window upper ends;
  - "instrument verified CORRECT", narrowed to the small literal rows.
- **Narrowed from C-U2-T:** CHAR "for every `CB(d,m)`" becomes `m ≥ 2` (refuted at `m = 1`: `CB(7,1)/6`, `CB(10,1)/8`, literal). The phrase "includes the 218 uncertified switch-necessary rows" is conditional on CHAR, and I did not check C-U2-T's side remark that every eligible row with `d ≥ 3` has `p ≤ dm − 1`. The four named rows do.
- **Fences hold throughout:**
  - The per-tag deletion mechanism is used only on the named family `S(1,2,3^k)`. That is family-scoped, and it does not revive `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`.
  - No deletion-only Hall is claimed universally, and no refuted key is revived.
  - The CB lemmas are exact decompositions of the literal network, not relaxed models.
  - No sector-only argument is presented as a reduction of (HALL).
  - No census value enters a proof.
  - There is no RTree wording.
  - No closed region is re-proved as a contribution. The spider flow proof is an alternative proof of registered content, offered for Lean, not a new scope.

## Lean readiness

**(WID).** It is already `formally_verified` (C1-LA1). Nothing in orientation U's portfolio changes it. Its definitions (C1-LA1 `Main.lean` `86b59c6c…`) are the carried definition layer of the award below.

**Award group U-A: CONTRACT-READY and fundable as a bounded terminal Stage 7 attempt.** It is the spider family `S(1,2,3^k)`: a tree, with (HALL) at the eligible rank `p = k+3`, for `k ≥ 5`.

- **Exact terminal statement.** This is C-U1-F's compiled face, in namespace `E993Transport`, with the instance `spiderOneTwoThrees_decAdj`:

  ```lean
  theorem spiderOneTwoThrees_treeWeightedHall_kPlus3 (k : ℕ) (hk : 5 ≤ k) :
      (spiderOneTwoThrees k).IsTree ∧
      C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧
      3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧
      ∃ f, IsSaturatingFlow (spiderOneTwoThrees k)
        (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f
  ```

  **Hypotheses consumed:**
  - `IsTree` is proved on the face: connectivity plus the edge-count bijection via `isTree_iff_connected_and_card`, with connectivity and the acyclicity-equivalent edge count proved separately.
  - Finiteness is `Fin (3k+4)`.
  - Eligibility is proved on the face: `x + 2 ≤ p` from N3a, and `3p < 2α+1` from `α = 2k+2` and `k ≥ 5`.
  - No quotient step is used.
- **Informal DAG: closed.**
  - FLOW, the per-tag deletion flow at every `p ≥ k+2` for every `F ⊆ leafSet`, is the registered spider key (`proved_informal`, SR-C5-2). C-U1-T's block assignment (result 3) is its Lean-shaped proof, which I verified.
  - N3a is registered SR-C5-2 content, with the root-split proof (result 4) Lean-shaped.
  - N1 and α are compiled.
  - The composition is compiled.
- **Compiled fragments covering DAG nodes:**
  - N1 `spiderOneTwoThrees_isTree` (U1, `Spider.lean` `18396be5…`);
  - α `spiderOneTwoThrees_indepNum_eq` (C-U1-F, `CriticN2.lean` `0a0aac07…`), or `_ge` (C-U1-T, `edf35df0…`);
  - the low window `spider_lowWindow_kPlus3`, and the composition pattern `spider_kPlus3_terminal_of_nodes` (C-U1-F, `CriticCompose.lean` `8d38f023…`).
- **Carried, keyed by (origin award, entry, digest):**
  - C1-LA1 `Main.lean` `86b59c6c…` (definition layer, including `indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`, `transportRel`, `IsSaturatingFlow`);
  - first-interior entry 14 `C5LA1.crossingIndex` `378868ab…`;
  - C4-LA1 entries 25–37 (`32ea0d8f…` through `27b6c75f…`), 55–72 (`fb9273d4…` through `ac4b9d82…`) and 73–75 (`d30c9ae0…`, `28327989…`, `72ae49fe…`).

  The full table is in `scratchpad/c6-adj-U/adj_carried_entry_digests.txt` (`7dcb0496…`). All of these are byte-contained in frozen `05c24dda…`.
- **Named open nodes.** All are transcription or engineering; no new combinatorics.
  - **FLOW-spider** `spiderOneTwoThrees_deletionFlow (k p) (hp : k+2 ≤ p) (F) (hF : F ⊆ C5LA1.leafSet (spiderOneTwoThrees k)) : ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q`. Its sub-nodes are:
    - (F0) **leaf classification**, added by this adjudication: `leafSet = {1, 3} ∪ {c_j}`, with `W_1 = {2} ∪ {a_j}`, `W_3 = {0}` and `W_{c_j} = {a_j}`. Neither critic listed it.
    - (F1) root absence at `|B| ≥ k+3`.
    - (F2) tag-3 vacuity.
    - (F3) `spiderTagFactors τ`, `ChainDisjoint`, and `chainVerts = univ`, so that `chainSize = card` by entry 70.
    - (F4) `ChainValid` on `τ`-active root-free sources.
    - (F5) `chainRank ≤ 2k+5`, hence `down ≥ 1` by entry 63, then totality by entry 65.
    - (F6) activity after the step: `c_j` is frozen; `τ = 1` by the cardinality argument, which replaces C4-LA1's box-top entry 107.
    - (F7) `φ` assembled by cases, injectivity by entry 68, and composition with entry 75.
  - **N3a** `spiderOneTwoThrees_crossingIndex_le (k) (hk : 1 ≤ k) : crossingIndex ≤ k+1`. Its sub-nodes are:
    - the root-free predecessor;
    - "root-present `(k+2)`-sets contain 3" and `erase 3`;
    - disjoint images;
    - the missed witness;
    - the bridge `indepSetCount G ∅ j = (indepFamily G j).card`, reused from C5-LA1 if its text has one, otherwise authored;
    - `forwardDifferenceDel < 0`, then `Nat.find_le`.

  **The smallest unproved Lean node is (F0)+(F3)–(F5) for a single tag class.** The rest is a copy of it.
- **Fences for the award:**
  - It is a restricted scope and a SEPARATE key from the `proved_informal` spider key. A suggested predicate name, which the synthesis names finally: `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5`. It must pass the alias check and must not contain the `4k`, `deletion injection` or `favorable-leaf aggregate` patterns.
  - It is not "every eligible rank". That form needs `x ≥ k+1` (N3b, whose Newton dependency is undischarged). An optional terminal strengthening "flow at every `p ≥ k+3` in the window" costs no extra node.
  - It is not (HALL) at full scope. Mechanism ≠ aggregate: the primary aggregate changes only by its own certificate.
  - There is no RTree wording.
  - Exactly one terminal `theorem`; companions are `lemma`s. Only the three permitted axioms. No `sorry`, `native_decide` or `decide` over an enumeration.
  - `HookChain.lean` and `SpiderDraft.lean` are **not** carried.
  - Every docstring citing "SEMANTIC-CONTRACT `E-1`/`E-2`" or a scratch file as `formally_verified` is corrected before seeding.
- **Grade path.** Registration comes only after the award closes and passes Stage 7 fidelity; the award itself is `formally_verified`. C-U1-T's and C-U1-F's informal nodes (results 3–4) are critic-attributed alternative proofs. The kernel check of the award supersedes them for the award, and they need a second read only if registered on their own.

**Not ready:**

- (HALL) at full scope.
- The U2 lemma (result 5). Its informal proof is complete, but it has no compiled fragments, and it would need a whole `CB(d,m)` definition and arm layer. It is not recommended for this Stage 7.
- CHAR (a conjecture).
- The every-eligible-rank spider form (Newton).

A bounded result never qualifies.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Basis.** No new (HALL) scope was established. The advances are these:

- A closed informal DAG with compiled companion nodes. This turns the registered `proved_informal` spider scope into a **fundable** `formally_verified` restricted-scope (HALL) award at `p = k+3`.
- A new exact structural lemma on `CB(d,m)` (result 5, `proved_informal` STATED, pending a second read). It is critic-attributed, and I checked its proof.
- An adversarial finding: the refutation of the STATED compression lemma, and CHAR's failure at `m = 1`.

The plateau definition fails on all three counts. The stop gate's decisive events are not triggered by U's portfolio: there is no formal (HALL) and no (CUT).

## Headline assessment

headline_resolved: no
status: still_open

**Per statement, at orientation U's evidence grade:**

- **(HALL) at full scope:** `still_open`. There is no complete proof and no replayed deficient cut.
- **(WID):** `formally_verified` (C1-LA1), unchanged.
- **The spider restricted scope:** proved at `proved_informal` (registered), and I verified an alternative Lean-shaped proof of it. Its formal award is pending Stage 7.
- **Outcome-B candidates:**
  - The CB mixed-family exactness lemma: proved (informal), critic-attributed, pending a second read.
  - CHAR: `still_open` for `m ≥ 2` (conjecture) and refuted at `m = 1`.
  - The all-families compression lemma: refuted.
  - The arm-level characterization: a bounded record, not a theorem.
- No (CUT) candidate exists in U's portfolio. At the four named eligible CB rows, `X1` and the whole positive layer have deficits `S − L` and `S`, both negative. That is a screen, not a certificate.

## Next-route allocation

**Exact remaining obligation (orientation U).**

- (i) The transcription nodes (F0)–(F7) and N3a for award group U-A.
- (ii) For the CB part of (HALL), CHAR on homogeneous `CB(d,m)` with `m ≥ 2` and `2 ≤ p ≤ dm − 1`. This is exactly:
  - (1a) the **RV–V core**, the smallest unproved lemma: "if the max deficit is positive and `p < dm`, the maximal maximizer contains `RV⁺ ∪ V⁺`";
  - (1b) the broom-forest dichotomy: "`N(Φ, p−1)` has Hall deficiency `max(0, L)`";
  - the two single-coefficient inequalities `S ≤ 0` and `S ≤ L` at eligible ranks.
- (iii) Heterogeneous orbit keys, which are untouched.

**Routes (up to two).**

1. **Terminal Stage 7 of this run, bounded attempt:** award group U-A at the exact statement above. **Could close in one attempt:** a `formally_verified` restricted-scope (HALL) on the infinite family `S(1,2,3^k)`, `k ≥ 5`, with the tree face certified. It would be the second infinite family at that grade after `G_k`. The attempt seeds byte-identically from the carries above; everything else is transcription of C4-LA1 entries 38–44, 76–105 and 108–110 onto the spider with C-U1-T's changes.
2. **Successor route (U with T), `CB-MIXED-FAMILY-CHAR`:** prove (1b) and the two scalar inequalities uniformly first, since they are single-coefficient and Lean-shaped; then (1a). Before any uniform claim, build a literal laboratory for the switch-coupled regime. `CB(9,2)/13` needs a literal network on a restricted sector, or an explicit acceptance of the two-quotient-instrument standard. **Could close in one cycle:** (1b) and the scalar inequalities at `proved_informal`, which would yield (HALL) at every eligible homogeneous CB row with `p ≤ dm − 1` **conditionally on (1a) alone**. The frontier of 214 or more uncertified switch-necessary rows would then reduce to one named structural lemma.

**What a successor inherits exactly:**

- U1's `Spider.lean`.
- `CriticN2.lean`, `CriticCompose.lean` and `CriticIndepLB.lean`.
- The C4-LA1 carries above.
- The block assignment and the root split (results 3–4).
- The CB exactness lemma (result 5).
- CHAR, scoped to `m ≥ 2`.
- The `m = 1` records.
- The compression refutation.
- The three laboratory maxima.
- U2's instrument, validated on small rows only.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-adj-U/`. It was produced with `python3 -B`, the standard library and exact integers. No `__pycache__` was produced.

**Lean project:**

- `LeanProject/` is my pinned copy: U1's seed and Lean files plus the four critic files, all digest-verified. `.lake/packages` is a manual symlink to the shared `mathlib-v4.32.2-project`.
- `build_all.log` `90522aaa…`: 8666 jobs, success; five `sorry` warnings, in `SpiderDraft` only.
- `AdjProbe.lean` `aad2fc0e…` and `adj_probe.out` `90ed33c1…`: `#print axioms` and signatures.

**Scripts and outputs:**

| Script | SHA-256 | Output | SHA-256 | What it checks |
|---|---|---|---|---|
| `adj_carry_check.py` | `9d863c9e…` | `adj_carry_check.out` | `7eeb11c9…` | 34/34 C4-LA1 entries self-consistent and contained in frozen `05c24dda…` |
| — | — | `adj_carried_entry_digests.txt` | `7dcb0496…` | full carried-entry digests |
| `adj_spider.py` | `c814d14f…` | `adj_spider.out` | `9a7ce9d9…` | block assignment and root split, `k = 1…7`; `RESULT_SHA256 79f16faf…` |
| `adj_cb.py` | `855dc436…` | `adj_cb.out` | `0194032f…` | literal CB instrument, 38 rows; `RESULT_SHA256 06ec109a…` |
| `adj_cb_closed.py` | `17d51d0e…` | `adj_cb_closed.out` | `81d3df7c…` | independently derived closed forms; 0 mismatches against literal; four eligible rows |
| `adj_compress.py` | `48dbb9ab…` | `adj_compress.out` | `9d397c65…` | the compression counterexample |

**Copies of others' files:**

- `crit_U1F_entry_digests.py` `adbfd4f3…` (C-U1-F's script, copied and not needed).
- `u2replay/`: U2's scripts copied out, with digests as listed in the seal audit. `run_all_RESULT.json` `f28aa145…` is byte-identical to the shipped file, and `run_all_REPLAY_OUT.txt` `092c7a1c…` records the replay.

**Read-boundary disclosures:**

- I read the dispatch, the boot pair, the protocol, the capsule and its 21 members.
- I made non-recursive `ls` listings of granted scratch directories: `c6-crit-U1-T/` (with `replay/`, `LeanProject/` and `LeanProof/`), `c6-crit-U1-F/` (with `LeanProof/`) and `c6-U2/`.
- I made a names-only `ls` of `sources/`.
- I read the authorized frozen source `sources/c5-stage7-sources/U1/LeanProject/LeanProof/Main.lean` (digest `05c24dda…`, matching the Stage 2 manifest), for byte containment only. I located it by parsing the Stage 2 manifest, a capsule member.
- I ran `grep -l da7d1d3d` over the files of `scratchpad/c6-U2/` (a granted directory, non-recursive).
- I ran an `ls` of `cycles/cycle-6/stage5/` before creating my output directory. It showed only `adjudicators`, and I opened no sibling.
- The harness saved two long tool outputs (U1's and U2's returns) to its own session files, and I read them back from there.
- I did not read any other orientation's portfolio or adjudication, any prior synthesis, `runs/`, any other experiment root, or any external source.
- I used no network and installed nothing.
- **No background job was started; every build and script ran in the foreground, so there was nothing to kill.** I ran no process listing.
