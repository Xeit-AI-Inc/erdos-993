# Orientation Adjudication

Stage 5 adjudicator for orientation U (formal / structural), Cycle 1 of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`),
2026-09-27. Portfolio: returns `U1`, `U2`, `U3` and their cross-orientation critiques `C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`,
`C-U3-T`, `C-U3-F`.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem (memory, conversations, modules, skills,
logs and decisions were not read).

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch.** `control/dispatch/c1-stage5/DISPATCH-ADJ-U.md` has SHA-256 `7df3c1b93deb820392b9914b8df22fccc696b4b678f27d56e7318f3e3ce91b5b`.
  I verified it before any other action, and it matches.
- **Capsule seal.** `control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json` has inner seal
  **`5a40d393a4d43dfa8576bc915434c839715a0d93b82e7ff42ab1028282362d16`**. I recomputed it over the canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline), and it **matches**. All 24 listed members match in both
  byte count and SHA-256.
- **Packet seals, recomputed by the same rule:**
  - Stage 2: `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`, matches.
  - Stage 3: `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`, matches.
  - Stage 4: `40f2e21645552e9929b17b28f7be262613bdc0d0f7dbd212997f783083f25fec`, matches.
- **Returns.** The three U returns match the Stage 3 manifest, the capsule and the Stage 3 admission record:
  - U1 `bed1e714…`;
  - U2 `5d7f812e…`;
  - U3 `5d7c62e4…`.
- **Admission.** Stage 3 admitted all 9 returns. Three format-only exceptions were applied to my orientation: the U2 and U3
  `headline_resolved` flag layout, and the expanded wording of U3's disclosure. Stage 4 admitted all 18 critiques, and every U
  critique's verdict is `retained_narrowed`.
- **Scratch digests (load-bearing artifacts), recomputed by me.** Every one equals the value cited on its face:
  - U1: `Main.lean` `c6d2279c…`, `cb_indepnum_check.py` `b68699d2…`;
  - U2: `LeanProof.lean` `7898640e…`, `carried_prefix.lean` `408d99e2…`, `compose_check.py` `773e40d3…`;
  - U3: `Basic.lean` `ff133398…`, `poly_explore.py` `6c496a3a…`;
  - C-U1-T: `CriticAdvance.lean` `c94ef3bd…`;
  - C-U1-F: `Audit.lean` `f285a9e1…`, `AuditBase.lean` `a6885f32…`;
  - C-U2-T: `LeanProof.lean` `404980cd…`, `reduction_lab.py` `adbf6cec…`;
  - C-U2-F: `CriticChain.lean` `8ae3b353…`, `exhaustive.py` `86ead32e…`, `cblit.py` `c54da765…`;
  - C-U3-T: `Critic.lean` `435eb4a1…`, `crit_e1_all_q.py` `aa00708c…`, `crit_block_fixed_a.py` `eb15db8f…`;
  - C-U3-F: `crit_q_poly.py` `60cc10eb…`, `crit_block_poly.py` `37507c37…`, `crit_q_poly_1_63.full` `35a279bc…`.
- **Model disclosures.** The returns were chartered Sonnet 5, high, with runtime id `claude-sonnet-5`. The critics were chartered
  Opus, medium, with runtime id `claude-opus-5-5`. All two-part lines are present.
- **Disclosure records** (`C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` and the Stage 4 record with its `stage3_addendum`):
  - **U2 INCIDENT.** A host-wide `ps aux | grep python3`, which the seat self-reported. Both of U2's critics find nothing from it
    used. I concur: every U2 number that matters was reproduced by instruments that never saw that output.
  - **U1's `ps aux`.** Omitted from the Stage 3 record, but found by both critics and now carried in the Stage 4 record's
    `stage3_addendum`. The record correction is complete, and nothing in U1 depends on it.
  - **U3.** None.
  - **Critics.** Harness injection, attack-brief over-print, names-only listings and name-scoped `pgrep`. None bears on evidence.
- **Controller facts** (`C1-STAGE5-CONTROLLER-FACTS-U.json`). I used these as facts, never authority:
  - **CF-U-1.** A cross-orientation STATED summary. It is not evidence at my grade, and I use it only in the conditional-assembly
    remark under `## Headline assessment`.
  - **CF-U-2.** Names the open disagreement, which I rule on below.
  - **CF-U-3.** A controller prior, not a capsule member and never evidence.
- **My own read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use either. I did
     not perform `CLAUDE.md`'s conversation-logging step, because the dispatch mandates exactly one deliverable plus scratch.
  2. My first boot command used a zsh `echo =====` separator, which errored. Both boot files were read in full before any
     judgement.
  3. Two long capsule members, the U2 and U3 returns, were saved by the harness to its own tool-results file, and I read them back
     from there. The content is the capsule member's own content.
  4. Within `sources/`, which is authorized, I read the following:
     - lines 14–62 of `sources/r30/records/SEMANTIC-CONTRACT.md`, for the (WID) aggregate of record;
     - a `grep` of that file, rooted inside `sources/`;
     - names-only listings of `sources/r30/lean/` and of the C1-LA2 award directory;
     - the C1-LA1, C1-LA2 and C6-LA2 `Snippets/` fragments and C1-LA2's `Main.lean`, for byte comparisons.
  5. Outside `sources/`, I made these listings and queries:
     - non-recursive `ls` of the inventoried scratch directories of my six seats and critics, which are within my replay grant;
     - one name-scoped `pgrep -f c1-adj-U` at the end, which matched nothing.
  6. The Stage 4 manifest (a capsule member) printed sibling orientations' critique paths. These were names only, and none was
     opened.
  7. I used no network, installed nothing, and ran no search rooted above a grant.

## Route-by-route decisions

### U1 — `C1-U-01 LEAN-CB-DEFINITION-LAYER` — **retained_narrowed** (both critics concordant; no disagreement to resolve)

**Replays (mine, copy-out-first, pinned toolchain, manual `.lake/packages` symlink, `cd` into the project first).**
- U1's `Main.lean` compiles with exit 0.
- `#print axioms`, using fully qualified names, gives `[propext, Classical.choice, Quot.sound]` for all six of:
  `cbGraph_isTree`, `cbGraph_indepNum_eq`, `mem_leafSet_cbGraph_iff`, `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`
  and `cb_lowWindow`.
- C-U1-T's `CriticAdvance.lean` compiles. C-U1-F's `Audit.lean` compiles, and its output log hashes to `6c2abf12…`, which is
  byte-identical to the critic's `audit_out.txt`.

**Claim-by-claim rulings.**

| Claim on U1's face | Critics | My ruling |
|---|---|---|
| CB(8,m) layer: `cbEdge`, `cbGraph`, computable `cbGraph_decAdj`, `IsTree` for every `m`, `α = 9m+1` both directions for `m ≥ 1`, `leafSet = {v} ∪ C`, `W_v = {r}`, `W_{c_ij} = {u_i}`, `cb_lowWindow` | Both backed; faithful to the contract tree (critic `#eval` edge lists; three α algorithms) | **Backed**. The mathematics is complete. The structural facts are the r30 CB record's content, so this is **not a new registrable claim**. The artifact is compiled scratch with no grade. |
| "carried byte-identically" (entries 4, 5, 6, 15, 123, 124) | Both: struck for 15, 123, 124 (comment and attribution lines stripped) | **Struck for 15, 123, 124**, confirmed by my byte comparison. Entries 4, 5 and 6 are verbatim. |
| axioms "all six … three standard axioms" | Both: the seat's shipped log contains only `Unknown constant` errors | **Struck as a seat literal** (I confirmed the shipped `leanout_axioms.txt` holds only errors). **Reinstated on my replay.** |
| "naive cell bound … overcounts by exactly 1" | Both: struck (a maximum-matching partition gives `n − ν = 9m+1`) | **Struck.** Not load-bearing. |
| α "at its proved_informal-modulo-Darroch/Newton grade" | Both: struck (α is structural; `SEMANTIC-CONTRACT` §3 grades the closed forms `proved_informal`, a node) | **Struck.** |
| Python "independent", "acyclicity" | Narrowed | **Narrowed.** It checks the labelling prose via connected plus `n−1` edges, not `cbEdge` itself. The critic `#eval` checks close that gap. |
| unused `hm` in `mem_cb_tagWitnesses_v_iff`; "five … six" count | Noted | Harmless. Record the correction only. |
| gate lines `not_advanced`/`not_advanced`/`none`; `headline_resolved: no` | Correct | **Correct.** |

**Critic-derived results (critic-attributed; compiled scratch; no grade), each replayed by me.**
- **C-U1-T:**
  - `cb_leafSet_card`: `|leafSet(CB(8,m))| = 8m+1`.
  - `cb8_topRank_of_descent_and_flow`: the SOLUTION-CONTRACT §2 terminal stated verbatim and reduced to conjuncts 2 and 4.
- **C-U1-F:**
  - `cbTerminal_of_conj2_conj4`, the same reduction.
  - `favorableLeaves_eq_leafSet_of_all`, the graph-generic interface through which the favorability key enters conjunct 4.
  - `mem_neighborFinset_choke_iff`, `mem_neighborFinset_root_iff` and `choke_degree` (`deg u_i = 9`).
- The two critics' concordant finding: the layer composes with the carried network definitions with no clash, and it discharges
  terminal conjuncts 1 and 3 for every `m ≥ 1`.

### U2 — `C1-U-02 SECTOR-CERTIFICATE-COMPOSITION-REDUCTION` — **retained_narrowed** (both critics concordant, claim by claim)

**Replays (mine).**
- U2's library builds: `Build completed successfully (8656 jobs)`.
- C-U2-F's `CriticChain.lean` compiles, and so does C-U2-T's self-contained chain. `#print axioms` gives the three standard axioms
  for `weightedHall_of_saturatingFlowQ`, `exists_saturatingFlow_of_saturatingFlowQ` and `exists_saturatingFlow_of_weightedHall`.
- The C1-LA2 block, `Main.lean` lines 797–956 (`dc9c43ff…`), and `Snippets/0030` (`e8c6b0d1…`) and `0031` (`ec521065…`) are
  present verbatim in the chain file.

**My own literal lab.** `scratchpad/c1-adj-U/adj_reduction.py` is exhaustive over every independent set of `CB(4,2)`, `CB(3,3)`,
`CB(8,1)`, `CB(5,2)` and `CB(2,5)`, at every rank with a nonempty sector (50 rank rows). It uses random positive rational `pb`, `pc`
and `σ`. Fidelity came first:
- the tree test and `α = m(d+1)+1`;
- `F_p` derived literally from `Δ_p(T − v) < 0`;
- (WID) from independent sides: layer weights against `Σ_{v∈F}[q_v(p) − q_v(p−1)]`, with `q_v` computed by a separate
  enumeration over `H_v` meeting `W_v`, for both `F = F_p` and `F = leafSet`.

It then checked:
- Lemma 0 on both layers;
- `Out(B)` equal to its per-state formula;
- every in-sector target's inflow equal to `Σ_i (d−β_i−γ_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1))`;
- every switch image: exactly `d − γ` sector preimages, load `(d−γ)σ(γ)`, weight `γ`;
- every other target: sector load 0.

**0 failures** (digest `dfee978d…`). Coverage was 95,834 switch images and 147,831 in-sector targets. This is `bounded_computation`:
identity checks only.

**Claim-by-claim rulings.**

| Claim on U2's face | C-U2-T | C-U2-F | My ruling |
|---|---|---|---|
| Lemma 3: "only the single sector source that performed this exact switch contributes" | Struck: `d − γ` preimages | Struck (F1): the same | **Struck.** Replaced by Lemma 3′: the sector load on a weight-`γ` image is exactly `(d−γ)σ(γ) ≤ θγ`, which is precisely the Switch constraint. The two critics and my lab agree. |
| The In reduction "aggregated" but not written out | Supplied Lemma 2′ | Supplied the same formula and the zero-arc census (F2) | **Narrowed. The face must carry:** Lemma 2′ (in-sector preimages are `A ∪ {b_ij}` and `A ∪ {c_ij}` over empty legs); the Out formula; and the census of sector arcs that carry zero (`B∖{r}`, `B∖{v}`, the `s`-switch, `(1,0)` switches). |
| (H1) "valid whenever E1's condition (i) holds" | Narrowed: criterion (ii) and E1-R's grade dropped | Narrowed (F3): the same, plus CD-2 [r30 C4; SR-C4-6] | **Narrowed.** E1-R needs (i) **and** (ii) at every `q`, with (ii) holding identically by the scope note CD-2 (`proved_informal`). |
| (H2) "by the exact DP of `certify.py`" | — | F3: restate as a quantified inequality | **Narrowed.** H2 quantifies over every assignment of choke states with `Σ(β_i+γ_i) = K` (sources) or `K − 1` (targets). |
| "reduces (H) **exactly** to …" | Narrowed | Struck (F4) to "sufficient, for the choke-local template form" | **Struck to "sufficient".** The lemma is one-directional and covers the template form of (L-S)_top only. |
| Scope: every `CB(d,m)`, every `p` | Narrowed (ruling 5) | Narrowed | **Narrowed** to `(CB(8,m), p*(m))`, `m ≥ 107`, `m ≡ 2 (mod 3)`. The generic Lean engine is a tool with no family claim. |
| Integral step cites C1-LA1 "entry 31" and "entry 33 … carried above" | Struck: both are C1-LA2 entries | Struck (F6) | **Struck** as provenance errors. **Repaired** by both critics' compiled chain, which I replayed. |
| Grade `formally_verified` (engine); `proved` (theorem and route) | Struck | Struck | **Struck.** A scratch compile has no grade, and `proved` is not on the §4 ladder. |
| `CB(8,1)/7` check "confirms the `ρ_1+θ≤1` arithmetic" | "only checkable in this corner": struck | F5: `θ = 0` there, so vacuous | **Struck.** The instance is not sector-deficient. The critics' labs, my lab, and C-U2-F's sampled laboratories at `m = 107, 110, 113` (fidelity asserted first) exercise the switch loads. |
| Alias check "no overlap" | Mathematical overlap with the r30 row keys' certificate paragraph | The same | **Narrowed.** Not an alias: those are finite `computer_assisted` rows, and this is a parametric implication. It is the row-free extraction of r30's structural argument, so attribution travels (§3.9). |

**The narrowed statement** (U2 origin; Lemmas 2′ and 3′ are critic-attributed):
- Let `m ≥ 107` with `m ≡ 2 (mod 3)`, `T = CB(8,m)`, `p = p*`, and suppose `F_{p*}(T) = leafSet(T)`.
- Suppose the E1-R flow exists: that is, the mark-clone criterion (i) and (ii) holds at every `q ∈ [1,m]`.
- Suppose nonnegative rationals `pb`, `pc`, `σ`, `θ` satisfy:
  - **Out:** `Σ_i Out ≥ 1` for every state assignment of total `K`;
  - **In:** `Σ_i In ≤ 1` for every state assignment of total `K − 1`;
  - **Switch:** `(8−γ)σ(γ) ≤ θγ`;
  - **Residual:** `θ ≤ 1 − ρ_1`.
- Then the literal network has a nonnegative rational flow that saturates every source within capacity. Hence (HALL) holds, and an
  integral `IsSaturatingFlow` exists.

Grade: a **`proved_informal` candidate, STATED**, which needs an isolated second read. Any use of it inherits E1-R's
`proved_informal` and the favorability key's Darroch/Newton dependency.

### U3 — `C1-U-03 ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE` — **retained_narrowed**; the one open critic disagreement is ruled here

**Replays (mine).**
- U3's `Basic.lean` compiles. `doubledCoeff_succ_mul` depends on `[propext]`; `doubledCoeff_diff_sign` on the three standard
  axioms.
- C-U3-T's `Critic.lean` compiles. `descent_of_recurrence_logconcave` and `r31_gap` each depend on the three standard axioms.
- My `adj_blocks.py` recomputes U3's `q = 1` sign polynomial independently. It normalizes by `G_0` with the full `∏D_k` and gets
  `−E_1(n) = 1040054400 + 13872986880 n + … + 85899345920 n^7`, which is coefficient-for-coefficient U3's `Diff(n)`. The true
  degree is 7.

**Claim-by-claim rulings on the return.**

| Claim on U3's face | C-U3-T | C-U3-F | My ruling |
|---|---|---|---|
| `r_1(p*−1) < r_1(p*−2)` for every class `m`, Darroch- and Newton-free (§5.2–5.4) | Backed; re-derived | Backed; re-derived by a different normalization | **Backed** (my recomputation agrees). Seat-attributed. It is a **`proved_informal` candidate at the class scope**, and it is now subsumed by Lemma A below. |
| Stated "for every `m ≥ 2`" | Narrowed (F4) | Narrowed (F-4) | **Narrowed** to `m ≥ 107`, `m ≡ 2 (mod 3)`. |
| "Immediate / free corollary / verbatim" for any fixed `Q_0` | Struck: negative coefficients at Q = 3, 4, 5 | Struck: negative coefficients for every q from 3 to 63 | **Struck.** My instrument reproduces 8, 16 and 20 wrong-signed coefficients at q = 3, 4 and 5 (31 at q = 8, 46 at q = 12). A Taylor shift to `n = 35` restores a uniform sign. |
| "q = 1 is the binding case … confirmed analytically" | Struck to an observation | Struck ("analytically") | **Struck to an observation.** My exact all-`q` scan puts the minimum relative margin at `q = 1` at `m = 107, 110, 113, 302` (`4.3729e−3`, `4.2538e−3`, `4.1411e−3`, `1.5512e−3`). This is census, not proof, and no step depends on it. |
| §5.6: blocks `j ∈ {0,1,2,3}` ascend and `j ≥ 4` descend; `O(m^3)` against `Θ(2^m)` | Struck (F1) | Struck (F-1, F-2) | **Struck.** My exact block scan gives ascending blocks `{0, 1, 2}` and an ascending tail at `m = 107, 110, 113, 302`. Block 3 descends. The masses concentrate near `j ≈ 4` and are not binomially spread. The inference was an unnamed mode-near-mean (Darroch-style) heuristic. |
| Fixed points "reproduced" (`n`, `α`) | Tautological (F5) | Replayed | **Narrowed.** `n` and `α` were formula values. `x = 570` is computed, from the closed form. The critics' literal-tree DPs reproduce all three. |
| Gate line `ELIG_top: advanced` | Struck (F7) | Struck for the return (F-1) | **Struck**; for U3 it reads `not_advanced`. |
| Lean atoms (scratch) | Backed; parameter-free Pascal facts, not progress by themselves | Backed | **Backed** as scratch. They are not on the Lemma A route. |
| Candidate key `…-PROVED-BY-ELEMENTARY-PASCAL-…-WITHOUT-DARROCH-OR-NEWTON` | — | Fails: names a method, and is an instance of the r30 threshold key (a) | **Not registrable as named.** It is a dependency reduction of the registered key's `q = 1` instance on the class. |

**CF-U-2: the disagreement, ruled.**
- **The two positions.** C-U3-T claims E1 condition (i) at `p*` for every `q ∈ [1, m]`, Darroch-free (its Lemma A). C-U3-F claims
  a Darroch-free certificate for `q ∈ [1, 63]` only, and says `q ≥ 64` rests on the registered key.
- **Both arguments were replayed.**
  - *Lemma A (C-U3-T).*
    - The recurrence (R): `(k+1) r(k+1) = (a+2b−3k) r(k) + 2(a+b−k+1) r(k−1)`, for `r(k) = [y^k](1+y)^a(1+2y)^b`. I derived it by
      hand from `(1+y)(1+2y) f′ = ((a+2b) + (2a+2b)y) f`. My `adj_lemmaA.py` checks it exactly at every `k` for all
      `0 ≤ a ≤ 12`, `1 ≤ b ≤ 12` (0 failures), and at `k = t` for every `q` at `m = 107, 110, 113, 302` (0 failures), comparing
      against direct convolution.
    - The elementary log-concavity induction on linear factors. I checked the expansion
      `z_k² − z_{k−1}z_{k+1} = LC_k + c²·LC_{k−1} + c(x_k x_{k−1} − x_{k−2}x_{k+1})` by hand. The last bracket is `≥ 0` by the ratio
      chain inside the contiguous support, and trivially outside it. Full LC holds on the small grid with 0 failures, and one-point
      LC holds at every target with 0 failures.
    - The closing step. `r(t+1) ≥ r(t)`, together with LC, gives `r(t−1) ≤ r(t)`. Then (R) gives `6t ≤ 3a+4b+1`. It compiles in
      Lean, and I replayed it.
    - The gap: `6t_q − (3a_q+4b_q) = 2q+1 ≥ 3`. It was checked at every `q` on four rows and compiled (`r31_gap`).
    - The side conditions hold: `a_q = 8q−1 ≥ 7`, `b_q ≥ 1`, and `1 ≤ t_q ≤ a_q+b_q`, so `r(t_q−1)` and `r(t_q)` are positive.
    - Strict descent held at every `q` at the four rows, with 0 failures.
    - Neither Darroch nor Newton is used, and `r_q` is in any case a real-rooted input.
  - *C-U3-F's certificates.* My own fixed-`q` polynomial code confirms that the `G_0`-normalized sign polynomial shifted to
    `n = 35` has all coefficients negative, that is, strict descent, at q = 1, 2, 3, 4, 5, 8 and 12. The identity was checked
    against direct sums. This agrees with C-U3-F's per-`q` method, whose full run to `q = 63` I did not replay (digest verified
    only).
- **Ruling.** There is no contradiction. C-U3-F's "`q ≥ 64` open" is a limit of its method, not a counter-claim, and Lemma A
  covers every `q`.
  - **E1's condition (i) at `p*` holds strictly for every `q ∈ [1, m]` and every `m` in the class, without Darroch or Newton.**
    This is critic-attributed to **C-U3-T**, as a **`proved_informal` candidate, STATED**, pending an isolated second read.
  - C-U3-F's `q ≤ 63` certificates are an independent, concordant second instrument on that sub-range, at `computer_assisted`,
    critic-attributed to C-U3-F. They are superseded as a proof route but kept as corroboration.
  - Scope note, from C-U3-T: Lemma A proves the registered threshold key's statement (a) only where `p − q − 1 ≥ μ_q + 1/3`. It
    does not replace that key in general, only its instance at `p*` on the class.

**Lemma B: the exact parent-descent block signs** (critic-attributed; concordant between C-U3-T for all `j` and C-U3-F for
`j ≤ 8` plus the tail).
- **Statement.** For every class `m`:
  - `B_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}` ascends at `t = p*−2−j` exactly for `j ∈ {0, 1, 2}`, and descends for every `j ≥ 3`;
  - the tail `x(1+x)(1+2x)^{8m}` ascends.
- **Proof structure.** The gap is `2j − 8`.
  - `j ≥ 5` descends by Lemma A's closing step.
  - `j ≤ 1` and the tail (gap −13) ascend by the mirror step, which I checked by hand: if `r(t+1) ≤ r(t)`, then LC and (R) at
    `k = t+1` force `6t ≥ 3a+4b−5`.
  - `j = 2, 3, 4` are settled by three exact Taylor-shift certificates at `n = 35`.
- **My replay** (`adj_blocks.py`, digest `e485ff2f…`):
  - the three certificates reproduce with a uniform sign after the shift (`+`, `−`, `−`), the side conditions hold, and each
    identity was checked against direct sums at `n = 35, 36, 37, 100`;
  - the literal block scan gives the pattern `+++---------` at `m = 107, 110, 113, 302`.
- **Grade.** The `j ∉ {2,3,4}` part and the tail are a `proved_informal` candidate. The three fixed certificates make the whole
  lemma **`computer_assisted` (universal on the class), STATED**, pending an isolated second read.
- **What it is not.** It is not (ELIG-top)(a). It is the corrected input to the cross-block domination.

## Cross-route reconciliation

- **The three U seats worked on disjoint links of the formal chain, and they compose.** My adjudicator integration probe
  `AdjIntegration.lean` (`fc288497…`, compiled with the three standard axioms, scratch, no grade) builds one file from:
  - the C6-LA2 entries 1–21, 35, 123 and 124, carried byte-for-byte;
  - U1's CB layer;
  - C-U1-T's terminal reduction;
  - C1-LA2 entries 30–31, byte-identical;
  - U2's ℚ engine;
  - C-U2-T's integral corollary;
  - a CB-instantiated wrapper, `cb8_flowConjunct_of_rationalFlow`, which turns a nonnegative rational flow on `cbGraph m` at `p*`
    (supported on `transportRel`, weakly saturating, within capacity) into terminal conjunct 4.

  C1-LA1 and C6-LA2 entries 1–21 are byte-identical (I checked all 21), so there is exactly one set of definitions of record.
- **No U result contradicts another U result.**
  - U2's reduction consumes E1-R, whose condition (i) at `p*` is now supplied Darroch-free by Lemma A, and the favorability key.
  - U1's layer and C-U1-F's `favorableLeaves_eq_leafSet_of_all` supply the interface. Favorability enters as the per-leaf
    integer statement `IsFavorableAt (cbGraph m) τ p*`.
- **U's side of the cross-orientation evidence.** CF-U-1 reports that the F critics' sampled literal laboratories found no target
  class over capacity. U's own counterpart is C-U2-F's fresh-row laboratory at `m = 107, 110, 113`. It asserted (WID) from
  independent sides, derived `F_{p*} =` all `8m+1` leaves, and computed `x = p* − 2` through `α` before checking the per-state
  identities. I did not re-run it (about 4 minutes per row). Its outputs' digests are inventoried, and my exhaustive small-instance
  lab is the second instrument on the same identities.
- **Recurring hygiene pattern across all three returns.**
  - Seat grade labels (`formally_verified` or `proved` on scratch) and seat-literal certifications (axiom logs, byte-carries,
    entry provenance) failed. In each case the mathematics survived.
  - All such literals are struck, with the underlying facts restored by critic and adjudicator replays.

## Established results

All labels follow SOLUTION-CONTRACT §4 and are kept separate: finite certificate, informal dependency, conditional result, governed
award. **Nothing below is `formally_verified`.** No governed award closed this cycle, and every compiled item is scratch with no
grade. "STATED" means first made at a review stage, so an isolated second read is required before registration.

1. **CB(8,m) structural layer.** Tree, `α = 9m+1` for `m ≥ 1`, `leafSet = {v} ∪ C` with `|leafSet| = 8m+1`, `W_v = {r}`,
   `W_{c_ij} = {u_i}`, and the low window `3p* < 2α+1` for `m ≥ 1`.
   - Mathematically these are the r30 CB record's content: not new, and not registrable.
   - Lean: compiled scratch, uniform in `m`, three standard axioms. Origin U1; card and terminal reduction C-U1-T; interface lemmas
     C-U1-F.
2. **Sector-certificate composition (narrowed; see U2 above).** A `proved_informal` candidate, STATED. Origin U2; Lemmas 2′ and 3′,
   the (ii) and CD-2 hypotheses and the scope are critic repairs (C-U2-T and C-U2-F). The structural argument's provenance is r30
   (C-T2-U, C-T2-F, T2), and the ℚ-flow principle is r30's "B7".
   - The generic chain *nonnegative ℚ-flow ⇒ WeightedHall ⇒ ∃ integral `IsSaturatingFlow`* is compiled scratch with three
     standard axioms. U2 wrote the engine; C-U2-T and C-U2-F composed it.
   - Literal identity checks are `bounded_computation`: C-U2-T at 11 instances; C-U2-F at 72 exhaustive rank rows plus sampled
     fresh rows at `m = 107, 110, 113`; mine at 50 exhaustive rank rows.
3. **E1 condition (i) at `p*`, every `q ∈ [1, m]`, every class `m`, Darroch- and Newton-free (Lemma A).** A `proved_informal`
   candidate, STATED, critic-attributed to C-U3-T. The closing step and gap identity are compiled scratch.
   - It subsumes U3's `q = 1` theorem, which is a seat-attributed `proved_informal` candidate at the class scope.
   - C-U3-F's per-`q` certificates for `q ≤ 63` are `computer_assisted` and concordant.
   - Effect: at `p*` on the class, E1's condition (i) no longer depends on Darroch, subject to the second read. E1-R itself stays
     `proved_informal`, with (ii) by CD-2.
4. **Parent-descent block signs (Lemma B).** `computer_assisted`, universal on the class (three exact certificates), STATED,
   critic-attributed to C-U3-T and C-U3-F.
5. **Census, `bounded_computation`, priors only.**
   - Eligibility with `x = p* − 2` exactly, and parent descent, at `m = 107, 110, 113`. Computed by C-U3-T, C-U3-F and C-U2-F with
     literal-tree DPs and `x` through `α`.
   - E1(i) at every `q` at `m = 107, 110, 113` (the critics) and 302 (mine).
   - `ρ_1` exact: `ρ_1(95) = 1354839571516225/1361543988640524` reproduces the contract fixed point, and
     `ρ_1(107) = 5150844596024699/5173467627355748` matches C-U2-F.

## Rejected and narrowed mechanisms

- **Rejected.**
  - U2's Lemma 3 reasoning ("a single preimage"). It would license the insufficient `σ(γ) ≤ θγ`.
  - U3's §5.6 mean-offset block threshold (`j ≥ 4`), and its `O(m^3)` against `Θ(2^m)` mass picture. This was an unnamed Darroch-
    style inference; a mean offset in `(−1, 1)` decides nothing.
  - U3's "immediate" extension to any fixed `q` (the unshifted sign fails from `q = 3` on).
  - U1's "exactly 1 overcount" cell-bound caution.
- **Template failures.** None reported in orientation U. U builds no allocation.
- **Cut candidates.** None. No U seat or critic searched for or reported one.
- **Narrowed.**
  - U2 to the class, "sufficient" in place of "exactly", with the E1-R criterion (i) and (ii) and CD-2 named and H2 quantified.
  - U3's `q = 1` theorem to the class.
  - Every seat grade label on scratch to "no grade".
  - U1's carry literal for entries 15, 123 and 124.
  - U1's axiom literal (now rests on replay).
  - U2's entry provenance, re-cited to C1-LA2 entries 31 and 33.
- **Record corrections for the controller.**
  1. The U1 `ps aux` item, now carried in the Stage 4 `stage3_addendum`.
  2. U2's "entry 31 / entry 33 carried above" are C1-LA2 entries, not C1-LA1.
  3. U3's §5.6 must never be used as an input.
  4. U3's polynomial degree is 7, not 8.
  5. U3's script table path label `c1-U3-replay/` should read `c1-U3/`. The bytes are identical.
- **Fences (§3).**
  - One rank per tree and the class only: restored everywhere by narrowing.
  - No status transfer: (HALL), the primary aggregate, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN, and
    `E993-TREE-REAL-ROOTED` stays REFUTED.
  - Darroch/Newton are never applied to `I`, `G` or `G^m`.
  - The `θ*` law is never a hypothesis.
  - Census values are never used as proof.

## Lean readiness

Criteria (protocol item 6): (a) a complete informal proof at statement granularity with a closed DAG; (b) sorry-free compiled
fragments covering named nodes; (c) named open nodes. A bounded result never qualifies. The toolchain is pinned throughout (Lean
v4.32.2, Mathlib `905b9581…`). Carried definitions are C6-LA2 `Snippets/` entries 1–21, 35, 123 and 124, byte-for-byte; entries 1–21
are identical to C1-LA1's.

**AG-U-A: the CB(8,m) definition layer. CONTRACT-READY** (an intermediate award; infrastructure, not Tier 2 progress).
- **(a) Complete.** **(b)** U1's NEW section plus C-U1-T's and C-U1-F's lemmas, all compiled (my replay). **(c)** No mathematical
  open node.
- **Exact statement set:**
  - `cbGraph_isTree (m : ℕ)`;
  - `cbGraph_indepNum_eq (m) (hm : 0 < m) : (cbGraph m).indepNum = 9*m+1`;
  - `mem_leafSet_cbGraph_iff`;
  - `cb_leafSet_card (m) (hm : 0 < m) : (C5LA1.leafSet (cbGraph m)).card = 8*m+1`;
  - `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`;
  - `cb_lowWindow (m) (hm : 0 < m)`;
  - `cb8_topRank_of_descent_and_flow`.
- **Hypotheses:** `0 < m` only where noted. The residue enters nothing.
- **Fences:** structural facts only. No rank claim, no (HALL), no favorability.
- **Carried:** C6-LA2 entries 1–21, 35, 123 and 124, byte-for-byte (verified in `CriticAdvance.lean` `c94ef3bd…`; U1's own file
  strips entries 15, 123 and 124 and must not be used as the carry source).
- **New declarations:** `cbEdge`, `cbGraph`, `cbGraph_decAdj`, `cbVertex`, `cbVertex_val`, `eq_cbVertex_iff`, the lemmas above,
  `favorableLeaves_eq_leafSet_of_all`, `mem_neighborFinset_choke_iff`, `mem_neighborFinset_root_iff` and `choke_degree`.
- **Preconditions of the award:**
  - freeze the labelling (`0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`);
  - ship an axiom log with fully qualified names;
  - drop the unused `hm` from `mem_cb_tagWitnesses_v_iff`.

**AG-U-B: the ℚ-flow ⇒ integral-flow chain. CONTRACT-READY as a companion tool, not as progress.**
- **Statement:** `exists_saturatingFlow_of_saturatingFlowQ` (generic `G`, `F`, `p`; the four hypotheses `hnonneg`, `hsupp`, `hsat`,
  `hcap`), plus `weightedHall_of_saturatingFlowQ`.
- **Carried:** C1-LA2 entries 30 and 31 byte-identical (`e8c6b0d1…`, `ec521065…`).
- **New:** U2's engine and C-U2-T's corollary. My CB wrapper `cb8_flowConjunct_of_rationalFlow` shows the instantiation typechecks
  over `cbGraph m`.
- **Fence:** this is r30's named "B7" principle. On an award face it is a companion lemma with no certificate of its own, and it is
  never funded as progress on (L-S)_top.

**AG-U-C: E1 condition (i) at `p*`, every `q`, Darroch-free. CONTRACT-READY, conditional on Lemma A's isolated second read.**
- **Draft statement:**
  `∀ m ≥ 107, m % 3 = 2, ∀ q, 1 ≤ q ≤ m →
   ((1+X)^(8q−1) * (1+2X)^(8(m−q)+1)).coeff ((16m+4)/3 − q) < ((1+X)^(8q−1) * (1+2X)^(8(m−q)+1)).coeff ((16m+4)/3 − q − 1)`
  in `ℕ` or `ℤ` coefficients.
- **(a) DAG:** (R) ← derivative identity; (LC) ← induction on linear factors; positivity on `[0, a+b]`; closing step; gap.
- **(b) Compiled:** `descent_of_recurrence_logconcave` and `r31_gap` (C-U3-T; my replay).
- **(c) Open nodes, smallest first:**
  1. (R) as a `Polynomial.coeff` identity for `(1+X)^a(1+2X)^b`. **This is the smallest unproved formal lemma.**
  2. Positivity of the coefficients on `[0, a+b]`.
  3. Log-concavity by induction on the factors `(1 + cX)`.
- **Fences:** the class, rank `p*`, `d = 8` only. It proves an instance of a registered key's (a) by a new method. It is a Tier 3
  dependency reduction, never Tier 2 progress.

**AG-U-D: the CB sector-composition instantiation. NOT contract-ready.**
- **(a)** Complete after the critic repairs, but STATED and not second-read.
- **(b)** Covers only the generic chain and the CB wrapper.
- **(c) Open nodes:**
  1. Lemma 0 over `cbGraph` (the weight dichotomy). **This is the smallest unproved formal lemma.**
  2. The choke-state extraction, and the Out sum over literal arcs.
  3. Lemma 2′, the in-sector preimage bijection.
  4. Lemma 3′, the switch image's `8 − γ` preimages.
  5. The target-class case split.
  6. The E1-R flow. As a Lean object it is either a hypothesis, which makes the award conditional, or a formalization of the
     mark-clone type-path transport; it is `proved_informal` only.
- **Draft statement shape:** with favorability, the E1 flow and the per-state inequalities (Out, In, Switch, Residual, quantified
  over state assignments) as hypotheses, conclude terminal conjunct 4 at `p*`.

**Not ready at all.**
- **(ELIG-top)(a)**, terminal conjunct 2 via parent descent. There is no complete informal proof in U. **Smallest unproved
  lemma:** the domination
  `Σ_{j≥3} C(m,j)(B_j(t_j) − B_j(t_j+1)) > Σ_{j≤2} C(m,j)(B_j(t_j+1) − B_j(t_j)) + (tail ascent)` for every class `m`, where
  `t_j = p*−2−j`. The step from parent descent to first descent is trivial (`Nat.find` minimality: `Δ_{p*−2} < 0 ⇒ x ≤ p*−2`).
- **(L-S)_top.** No allocation in U.
- **Favorability.** Still modulo Darroch/Newton; no U route addresses it. It enters Lean through `favorableLeaves_eq_leafSet_of_all`.
- **U3's Lean atoms.** Not on any award's DAG. Lemma A supersedes the fixed-`q` polynomial route.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- **Tier 1 and Tier 2 in orientation U.** Neither Tier 2 lemma was proved in U. (L-S)_top is untouched: U has no allocation.
  (ELIG-top)(a) has its corrected exact local input (Lemma B) but not the domination.
- **The progress is material to Tier 1's proof chain, for four reasons:**
  1. Fence 4's "PROVED reduction" from the template to the literal network was, entering the cycle, only r30's STATED structural
     argument. It now has a written, corrected, class-scoped proof: U2 plus C-U2-T and C-U2-F, a `proved_informal` candidate.
     Three independent literal instruments agree with it.
  2. E1 condition (i) at `p*` is Darroch-free for every `q` (Lemma A).
  3. The terminal is formally reduced to its conjuncts 2 and 4 over a compiled CB layer.
  4. The rational-to-integral flow chain compiles over the definitions of record, and I checked that it composes with the CB layer.
- **Plateau.** New `proved_informal` candidates exist (the composition lemma and Lemma A), so the orientation is not at a plateau.
  The stop gate is unarmed in Cycle 1. No decisive event bears: nothing is `formally_verified`, and no cut exists.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation U's evidence grade:
- **Tier 1** (E) ∧ (H) for every class `m`: **still_open.** No complete proof, and no cut.
  - (E) reduces exactly to (ELIG-top)(a), because the low window is compiled.
  - (H) is reduced by the narrowed composition lemma to (L-S)_top ∧ E1-R criterion (i) and (ii) at every `q` ∧ `F_{p*} = leafSet`.
- **(L-S)_top: still_open** in U. No U seat or critic built or verified a uniform allocation.
- **(ELIG-top)(a): still_open.** Lemma B gives the exact block signs. The cross-block domination is unproved in U.
  - The class's first row, `m = 107`, and `m = 110, 113` are census only.
  - `m = 107` is certified for (HALL) by the r30 row key at `computer_assisted`.
- **E1 condition (i) at `p*`** (Tier 3 input): proved, Darroch-free, at `proved_informal` candidate grade (Lemma A, C-U3-T,
  STATED).
- **Favorability** (Tier 3 input): unchanged, `proved_informal` modulo Darroch/Newton.
- **Conditional assembly** (not a claim at my grade). If the cross-orientation (L-S)_top and (ELIG-top)(a) proofs that CF-U-1 reports
  as STATED survive their own adjudications and second reads, then with the narrowed composition lemma and Lemma A, Tier 1 would
  stand at `proved_informal` modulo the favorability key's Darroch/Newton dependency and E1-R's grade. That would not be decisive
  under §5.

## Next-route allocation

**The exact remaining obligation (U).**
1. The isolated second reads of the narrowed composition lemma, Lemma A and Lemma B.
2. A formal Tier 1 needs, beyond AG-U-A and AG-U-B:
   - the CB instantiation of the composition (AG-U-D);
   - E1(i) formal (AG-U-C);
   - the E1-R flow, formalized or carried as an explicit hypothesis;
   - favorability as per-leaf `IsFavorableAt` statements;
   - (ELIG-top)(a);
   - (L-S)_top as a verified per-state system with closed forms. The per-state inequalities for all `m` are integer/rational
     statements a Lean award must also carry.

**Routes for Cycle 2** (at most three):
1. **`U-FORMAL-E1-CONDITION-I-AT-TOP-RANK` (AG-U-C).** Formalize (R) as a coefficient identity, positivity, and LC by linear-factor
   induction, then compose with the compiled closing step and gap.
   - *Could close in one cycle:* E1(i) at `p*` for every `q` on the class, as a governed award, which is the first formal CB
     coefficient fact.
   - Precondition: Lemma A's second read.
2. **`U-FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION` (AG-U-D, with AG-U-A and AG-U-B carried).** Formalize Lemma 0, the choke-state
   extraction, Out, Lemma 2′ and Lemma 3′, and the target case split over `cbGraph m`. State the E1 flow and the per-state
   inequalities as hypotheses, and conclude conjunct 4 through `exists_saturatingFlow_of_saturatingFlowQ` and
   `favorableLeaves_eq_leafSet_of_all`.
   - *Could close in one cycle:* at least Lemma 0 and Lemma 3′ compiled. Possibly the full conditional conjunct-4 theorem, which
     would make the terminal depend only on named hypotheses.
3. **`U-ELIG-TOP-INTEGER-BLOCK-DOMINATION`**, co-ordinated with T3 without reading its return. Use Lemma B and the recurrence (R)
   applied block-wise to bound `Σ_{j≤2}` plus the tail against the `j = 3..8` descending mass, with explicit ratios between
   neighbouring small-`j` blocks. Handle the finite range below any cutoff by exact integer certificates, and formalize the
   `Nat.find` step to conjunct 2.
   - *Could close in one cycle:* an informal integer proof of (ELIG-top)(a) with an explicit `M_0`, or the exact obstruction.

## Artifact inventory

All adjudicator scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-adj-U/`.
Python is standard library only, run with `python3 -B`, in exact integers and `Fraction`s. Lean ran with the pinned toolchain, with
`.lake/packages` a manual symlink to `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`, after
`cd` into each project. There was no `lake update` and no `lake clean`.

**Python instruments and outputs**

| Artifact | SHA-256 | Content |
|---|---|---|
| `adj_lemmaA.py` | `e3f8e11cd459b7741108df246fdbdb8a476d94d9a9cff52e1a45c6c07965fb8d` | (R) and LC exhaustive on a small grid; (R), one-point LC, gap and strict E1(i) at every `q` for `m = 107, 110, 113, 302`; `ρ_1` fixed points |
| `adj_lemmaA.out.json` | `8ed268526d3b849fa5165fb606d2e0ebd50852cf759f4017f47fab0cfbd4dea2` | result digest `eab194dfcec0e50eecb3fecec3bbfc7ab952579d79d2aa80c5a6052cc837bbd6`; 0 failures |
| `adj_blocks.py` | `1d4f30ff66deed831d2bf9d58ea697b9a82d63841311a228aab183c1d9642dad` | literal block signs, all `j`, at four rows; `j = 2, 3, 4` Taylor-shift certificates; fixed-`q` certificates `q ∈ {1,2,3,4,5,8,12}`; U3 `Diff` reproduction |
| `adj_blocks.out.json` | `479e684315fc7feaef24037945614ae7705b70e03ecbab3479b0cb4596f7e715` | result digest `e485ff2f02e3b8f98e31b55f56a6124e866d95ea42c8489e8bd8df87ffe46392` |
| `adj_reduction.py` | `3c53a9028f844fb0e25a12b99ac61ab48e34a1900767c929d9a28d8c4d3e0752` | exhaustive literal per-state reduction lab with fidelity first (tree, `α`, derived `F_p`, (WID) both sides) |
| `adj_reduction.out.json` | `0dd649aed303e042fe4b8368f63a0f85a0e4f5797f05d394b49969aac858304a` | result digest `dfee978d02d2fa1eef44d5ef75f6c346f0278e131e48a1e4c8632c46ebebafe8`; 50 rank rows; 0 failures |

**Lean replays** (the projects under `lean/{u1,u2t,u2f,u3t}/LeanProject` are copies of the seats' and critics' projects)

| Artifact | SHA-256 | Content |
|---|---|---|
| `lean/u1/LeanProject/LeanProof/MainAx.lean` | `f41e12ae900d427de44fde0718b58c45560f5e9eb7c88f5055be30cc840036d8` | U1 file plus a fully qualified axiom audit |
| `lean/u1_main_axioms.log` | `4aa9a92394151b541af0e7e87fa0e2eda60d79a4d0a8150cb53482d2b944fa6f` | exit 0; six results, three standard axioms |
| `lean/u1_criticadvance.log` | `3ecef02c768669d989f8f61280fbba363f180abd7c0056da81aed3ec50c1cd7e` | C-U1-T advance compiles |
| `lean/u1f_audit.log` | `6c2abf128654d742d6d24c50cbde4ff53de9af20784beba9548efd36dab6598e` | C-U1-F `Audit.lean`; byte-identical to the critic's log |
| `lean/u2t_chain.log` | `6a5ee00870eb1332e0d94237c19de990c4047703eb2124f23a241871ebdb09e4` | C-U2-T chain; three standard axioms for the engine, corollary and C1-LA2 entry 31 |
| `lean/u2f_chain.log` | `611e9d83aee868c61780be1bc879754b4f096efdd71fb4f78b41778b4aed3571` | U2 library build (8656 jobs) plus C-U2-F `CriticChain.lean` |
| `lean/u3_lean.log` | `ca65f056e970da7a6210501c7bd7c881c8db4b09c8a7bb571cec310d9ad0af72` | U3 atoms plus C-U3-T closing step and gap |
| `lean/u1/LeanProject/LeanProof/AdjIntegration.lean` | `fc288497596f6b59c1248ae8ec94699d05918251142f3241fca416a97b217c3d` | adjudicator integration probe (scratch, no grade) |
| `lean/adj_integration.log` | `1572c260153559fdabaa8598423473a91c96ca9921a984d3d9bb415e883dfaae` | exit 0; three standard axioms |

**Replay commands**

- Python: `cd …/scratchpad/c1-adj-U && python3 -B adj_lemmaA.py`, then `python3 -B adj_blocks.py`, then `python3 -B adj_reduction.py`.
  Each takes about 20–30 s.
- Lean: `cd …/scratchpad/c1-adj-U/lean/u1/LeanProject && lake env lean LeanProof/AdjIntegration.lean`.

**Jobs.** No background job was started. Every command ran in the foreground to completion. A name-scoped `pgrep -f c1-adj-U`
before the final write matched nothing.
