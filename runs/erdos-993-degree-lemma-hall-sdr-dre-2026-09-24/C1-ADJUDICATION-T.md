# Orientation Adjudication

Stage 5 adjudicator, orientation **T (prove)**, Cycle 1 of r28 (Erdős #993: the Hall/SDR route to a second,
structural proof of the forest degree lemma). The portfolio is the returns of seats `T1` (`C1-T-01
DOMINANCE-LEAF-SUPPORT-INDUCTION-PROOF`) and `T2` (`C1-T-02 DOMINANCE-NEAREST-BRANCH-ASSIGNMENT-PROOF`), and their
cross-orientation critiques `C-T1-U`, `C-T1-F`, `C-T2-U`, `C-T2-F`. The T orientation has two seats this run, not
three, so it has four critiques, not six.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md`
(15,020 B) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The terminal display of `verity.md` was
truncated in the middle, so I re-read the missing section with a line-range print of the same file. I made no other
VerityOS read outside the run root. The subsystem that governs this work is `experiments/`, under the run's sealed
control files. The host harness put the repository `CLAUDE.md` and the user auto-memory index into my context without
a read by me. I did not act on either, and neither enters any step below.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

- **Capsule.** `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json` has 21 members. I recomputed the SHA-256 of
  the canonical JSON: the manifest without `seal_sha256`, `sort_keys`, separators `(",",":")`, no trailing newline.
  - The result is **`59927abc6051607da91fd217f632ebbe5795b318b299fd956d3ccce5b1cf8faf`**, which equals the recorded
    seal and the dispatch literal.
  - All 21 members match on byte count and SHA-256. That includes both returns (`432df73f…b635`, 38,144 B;
    `660e2e45…7addf`, 48,311 B) and the four critiques (`47a2133e…`, `a5059389…`, `f551a9bd…`, `53346446…`).
- **Stage manifests.** Recomputed canonically, all three match their recorded seals:
  - Stage 2: `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b`.
  - Stage 3: `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5`.
  - Stage 4: `4f6545959854f69e59bfa1cba137e1a56d20d46ba453774b13c49fa40a6e84d7`.
  - Every Stage 2/3/4 entry that is also a capsule member has the same digest in both, with one documented exception.
    The Stage 3 manifest lists `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` at 2,634 B (`7677aab2…`). The capsule
    and the Stage 4 manifest list the corrected 2,906-byte version (`527ef730…`), which is the one on disk. The file
    records this itself: F1's two `ps aux` listings were "corrected here before the Stage 4 seal". It is a disclosed
    re-issue, not tampering.
- **`control/SOURCE-DIGESTS.json`.** All 62 entries under `sources/` recompute exactly (0 mismatches).
- **Scratch digests.** Every seat and critic artifact whose full digest a return or critique lists recomputes exactly.
  That covers T1's two generators; T2's generator `19bdb1fd…`; `C-T1-U`'s `crit_lib`/`crit_checks`/`crit_advance` and
  both reports; `C-T1-F`'s `crit_t1f.py`, its report and the ELD pair; `C-T2-U`'s `crit_instr.py`, `run_crit.py`,
  `crit_report_16.json`, `greedy.py`, `greedy16.txt`, `hubs.txt` and `pp_graphs.txt`; and `C-T2-F`'s
  `crit_instrument.py`, `run16.txt`, `dd_test.py` and `dd15.txt`.
- **Replays (copy-out-first into `scratchpad/c1-adj-T/replay-T1|replay-T2/`).** Both are byte-identical.
  - T1: `t1_dominance_check.py` reproduces report `26da6b14…0f48`.
  - T2: `hs_sdr_check.py 15` (19.5 s) reproduces report `91694350…1a27`; the file hash is `96e94c9c…`.
  - T2's one-shot leaf/support command was also replayed. It prints `1434843 0`, and 850,972 of those rows are
    non-trivial.
- **Admission.** Stage 3 admitted 6/6 and Stage 4 admitted 12/12, both with 0 findings. All four T critiques carry the
  verdict `retained_narrowed`.
- **Disclosures in the portfolio.** Neither seat's disclosure enters any mathematical step.
  - T1 filed none.
  - T2 disclosed one `ls experiments/`, one read of `skills/optimization-loop/skill.md`, and one `ps -u` listing. The
    controller ruled "no penalty", and every T2 number reproduces from the digested generator.
  - Critic disclosures (`C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json`) include `C-T1-U`'s over-printed attack-brief
    section and `C-T2-U`'s hash-only seal checks. I checked that no finding I adopt depends on them.
- **My own disclosures (read boundary and process).**
  1. I ran one inefficient counting one-liner in `scratchpad/c1-adj-T/`, with no output file. The harness moved it to
     the background after its 120 s timeout, and I stopped it with the harness stop tool by task id `b2s1yqedc`, not by
     literal PID. No result depends on it. No other background job was started, and none is running at the final write.
  2. For reading convenience I placed one copy of T2's `RETURN.md` in the session scratch directory outside the run
     root. It is a copy of a capsule member, and I deleted it before the write. The harness also persisted a
     tool-output copy of T1's return in its own results directory, which is a harness fact.
  3. I ran non-recursive `ls` of `scratchpad/c1-T1`, `c1-T2`, `c1-crit-T1-U`, `c1-crit-T1-F`, `c1-crit-T2-U` (and its
     `own/`), `c1-crit-T2-F` and `c1-adj-T`. All are inside the grant. I ran no `find`/`grep -r`/`rg`/recursive
     listing, no network and no install.
  4. **The controller facts record steered my counterexample search.** I read
     `control/C1-STAGE5-CONTROLLER-FACTS-T.json`, which states an order-22 counterexample with branch tree `K_{1,3}`,
     before I designed the family search below. The witness I report was found by exhaustive enumeration of that family
     with my own code; I did not copy it. It is still not a blind discovery. I did not read `C-F1-T` or any other part
     of the F or U portfolios.

## Route-by-route decisions

### T1 — `C1-T-01 DOMINANCE-LEAF-SUPPORT-INDUCTION-PROOF` (seat verdict `blocked`)

**Ruling: `retained_narrowed`. Route verdict `blocked` stands for its mechanism, and the mechanism's target is now false
(see Headline).** Claim-by-claim rulings on the two critiques:

| T1 claim | C-T1-U | C-T1-F | Adjudication |
|---|---|---|---|
| L1 leaf ≥ support (Part A); alias of `E993-PAIR-R-LE-G-POINTWISE` (i) | confirmed; alias correct | confirmed; alias correct | **Retained as a corroboration note** on the VERIFIED key. No new key. Holds on any finite simple graph. |
| REC leaf-deletion recurrence (Part B), "new" | correct; general form for any `G` and any deleted vertex `w`; "(both trees or empty)" struck; "distinct statement, classical content" | correct; any graph; no new key (a corollary under `E993-PAIR-GENERATION-THEOREM`); the Part 0 attribution of `c_v = i_{k−1}(T−N[v])` to the r27 key is wrong | **Concordant in substance.** No new key; the claim is recorded in C-T1-U's general form as a named lemma note under the generation law. Both scope strikes are adopted, and so is C-T1-F's attribution correction (the identity is a SEMANTIC-CONTRACT §1 fact of record). |
| Pendant-path stepwise monotonicity REFUTED, `S(3,1,1)`, `k = 3` (Part C) | confirmed by hand and census, minimal | confirmed, minimal; minimality is over `m ≥ 2` | **REFUTED, retained.** My brute force gives `c = (0,3,1,3,4,4)`. The key names the predicate, with status REFUTED; the `-REFUTED` suffix variant is struck (C-T1-U). "Found independently by two methods" is struck, since both scans share one `occ_all`. |
| L2 leaf dominates own pendant path: `bounded_computation`, with a named "obstruction" (Part D) | **proved** (critic-derived) by a shift-by-two induced embedding at all `i = 0..m`, any graph | **proved** (critic-derived): induced isomorphism for `1 ≤ i ≤ m−1` plus the polynomial identity at `i = 0` | **Concordant: L2 is `proved_informal`, critic-attributed, STATED** (second read owed). I re-derived both proofs line by line; see Established results. T1's "obstruction" is narrowed to the one-step peeling strategy only. |
| Part E starved hub (order 10) exists; "minimal"; "the whole local/peeling family is structurally insufficient" | exists; minimality proved (`n ≥ 1+3·3`); verdict for the own-direction mechanism stands | exists; minimality proved; the broad insufficiency claim is **narrowed** to the own-pendant rule, since a rooted-subtree rule held to order 15 | **Existence and minimality retained** (T1 witness; minimality critic-attributed). On the narrowing, C-T1-F prevails on the Stage 4 evidence: T1 proved only that the own-pendant rule fails. The point is now superseded: the rooted-subtree rule implies (HS-SDR), so the order-22 witness refutes it too, and no mechanism proves (HS) universally. |
| Grade of the fixed-point/A000055 validation as `proved_informal` | re-graded `bounded_computation` | same | **Re-graded `bounded_computation`** (fence 4). |
| Literals: "47 canonical trees of orders 3–8"; "49 violating instances"; "8-vertex example"; "thousands of checks per shape"; "families" | 46; 49 are `(path,k,i)` triples; 7 vertices; 1,071 checks in total | 46; 49 triples = **42** `(path,k)` instances; 7 vertices; 63–288 per shape; single trees | **All strikes adopted.** My replay of T1's report gives 49 triples over 42 distinct `(path, k)` pairs, which confirms C-T1-F's reconciliation. |

### T2 — `C1-T-02 DOMINANCE-NEAREST-BRANCH-ASSIGNMENT-PROOF` (seat verdict `bounded_evidence`)

**Ruling: `retained_narrowed`.** T2's core deliverable, the Hall-free sort-and-pair proof of the SDR ⟺ threshold
equivalence, is sound and survives the refutation of (HS) untouched, because it is a per-`(T,k)` equivalence.
Claim-by-claim:

| T2 claim | C-T2-U | C-T2-F | Adjudication |
|---|---|---|---|
| Lemma SAP: (HS) ⟺ (HS-SDR), both directions, explicit (Part 2) | correct; the `m ≤ |L|` input must be named at Direction 2 (tree slot count, or (HS) at `t = 0`); checking `t ∈ V` suffices "for trees" | correct; `m ≤ |L|` stated by T2 via the tree identity; checking `t ∈ V` suffices "for every graph"; modest novelty | **Retained `proved_informal` (seat-derived, T2).** The critics' "disagreement" on `t ∈ V` is only apparent. "HS at all `t ≥ 1` ⟺ HS at `t ∈ V`" holds for every slot/leaf system (C-T2-F's proof). "HS(`t ≥ 1`) ⇒ SDR" additionally needs `#slots ≤ #leaves`, the `t = 0` instance, which is C-T2-U's caveat and holds on trees with `n ≥ 2`. Both are correct. **Ruling:** the Stage 7 statement quantifies over all `t : ℕ` and then needs no tree hypothesis (see Lean readiness). |
| Lemma LS; "pendant-path chain open"; "Lemma DM does not extend past distance 1" (Part 1) | chain TRUE (Lemma PP, critic-derived); T2's claim that DM does not extend is **struck** (re-embedding, not identity) | endpoint form TRUE with an exact identity (PPD); the stepwise form T2 tried is **FALSE** (order 6, `k = 3`) | **Concordant.** The endpoint form is `proved_informal` (critic-attributed). The stepwise form is REFUTED; the witness is `S(3,1,1)`, the same object as T1's Part C, and my canonical-form check confirms it. |
| Theorem ES, narrow form (length-1 pendant directions) | superseded by BTP's corollary; fold, do not register | a special case of LS, do not register | **Not registered;** superseded by Theorem BTP. |
| Naive local assignment fails first at order 10 (Part 3); minimality `bounded_computation` | minimality and **uniqueness** proved | minimality and uniqueness proved; exact "iff branch tree has a vertex of degree ≥ 3" | **Upgraded to `proved_informal`** (critic-attributed). T1's Part E hub and T2's H10 are the **same tree**: my canonical forms are equal. Register ONE record. |
| Two-level hub, order 22, (HS) holds at all `k` (Part 4) | backed (recomputed) | backed; "one tree, not a family" | **Backed as a single-tree computation.** It is not the counterexample: that has spokes of length 1 and legs of length 3, while T2's double hub has depth-2 hubs and length-1 legs. It folds into `E993-R28-DOMINANCE-CENSUS`; no separate key. |
| Census to order 15, three "independent" methods; "matching form strictly stronger"; "≈ 9×"; H10 "`α = 6`" | 13,187 trees / 117,393 instances reproduced independently and extended to 16; "three independent" struck (one shared `c` routine); "9×" struck; `α = 7` | reproduced and extended to 16; "strictly stronger" and "stronger prior than order 18" struck (the forms are equivalent by SAP); `α = 7`; the 1,434,843 count includes trivial rows | **All strikes adopted.** On the 1,434,843 row, C-T2-F says the outcome is not in the digested report, while C-T2-U replayed it. I replayed it too: `1434843 0`, of which 850,972 are non-trivial rows. The replay outweighs: backed, with "including trivial `k` rows" added. |
| Candidates 4 and 5 as new keys | — | fold into `E993-R28-DOMINANCE-CENSUS` | **Adopted.** |

## Cross-route reconciliation

- **Same objects, found on both routes.** T1's Part C witness and C-T2-F's stepwise-chain witness are `S(3,1,1)`,
  `k = 3`. T1's starved hub and T2's H10 are one tree. L2 (T1, C-T1-U, C-T1-F) and Lemma PP/PPD (C-T2-U, C-T2-F) are
  one lemma. **Four critics proved it independently by two proof shapes:** the induced-subgraph re-embedding (all four
  use it for `1 ≤ i ≤ m−1`) and the path-polynomial identity at the base vertex. **Register ONE canonical key,
  `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`.** I prefer C-T2-F's exact identity
  `Σ_k (c_ℓ(k) − c_u(k)) x^{k−1} = P_{d−2}·(Z(Q) − Z(Q − N_Q(u)))` as the canonical statement. It covers every
  position at once, and C-T1-U's shift-by-two embedding is its combinatorial proof.
- **The per-direction refutation**, "every branch-tree direction of a deficient vertex carries a leaf with `c ≥ c_v`",
  was found by all four critics under different names: C-T1-U F3, C-T1-F ELD, C-T2-F DD, C-T2-U F4. All four report
  the same order-12 tree at `k = 6`, with `c_0 = 20` against 18 in the bad direction (C-T2-U's labelling is isomorphic).
  My brute force reproduces `c = (20,8,1,1,11,11,26,26,26,26,18,18)` and finds that (HS) holds there. The failure counts
  (409 / 349 / 102 and 237 / first-failing-trees 1, 5, 20) are under incompatible conventions and are **not
  reconciled**. They are not load-bearing; the witness is.
- **The reductions RH (C-T1-U), R-SDR (C-T1-F), LFR (C-T2-F) and REC/greedy export (C-T2-U).**
  - All four say: local service by own pendant leaves (valid by PP), then match the deficit into a pool of one spare leaf
    per branch-tree leaf. RH, R-SDR and LFR are the same condition. REC is the rooted, induction-ready strengthening.
  - All four reported the same census: 46,977 deficient instances to order 16, 0 failures. My own instrument reproduces
    the 46,977 and 0 for LFR.
  - **Each implies (HS-SDR), hence (HS).** So each is refuted by the order-22 witness below, as are C-T1-F's
    rooted-subtree rule (for every root) and the controller-named "surviving sufficient conjecture".
- **Surplus identity and BTP.** C-T2-F's surplus identity `Σ_{Br}(p(v) − (deg v − 2)) = 2` and C-T2-U's Theorem BTP
  are two faces of one argument: a vertex with `d_B ≤ 2` is self-sufficient by PP, and deficits sit exactly at
  `d_B ≥ 3`. They are concordant. C-T1-U's and C-T1-F's counting (total deficit = number of branch-tree leaves − 2) is
  the same identity.
- **Controller facts record (weighed as one more replay, not as authority).**
  - Its T-relevant facts agree with my replays: PP proved by four critics, the (PW) witness correction, BTP and the
    surplus identity, the order-12 local-rule refutation, and the order-22 counterexample.
  - One wording is inaccurate. It lists "46,977 instances to order 16" as support for "own leaves first, then one spare
    leaf per extremal branch vertex". That number is the count of *deficient* instances, and it matches my recount.
    There is no discrepancy.

## Established results

Grades follow `SOLUTION-CONTRACT.md` §4. "STATED" means first made at a review stage, so an isolated second read is
owed before registration. Hypotheses are listed as consumed.

**Exact theorems (informal, closed proofs checked by me):**

1. **`E993-R28-PENDANT-PATH-LEAF-DOMINANCE` (PP/L2/PPD). `proved_informal`, critic-attributed (C-T1-U, C-T1-F, C-T2-U,
   C-T2-F), STATED.**
   - *Statement.* Let `G` be any finite simple graph with a path of distinct vertices `u_0 – u_1 – … – u_m = ℓ`,
     `m ≥ 1`, `deg u_i = 2` for `1 ≤ i ≤ m−1`, and `deg ℓ = 1` (`u_0` arbitrary). Then `c_{u_i}(k) ≤ c_ℓ(k)` for every
     `i ∈ {0,…,m}` and every `k ∈ ℕ`, and coefficientwise `Z(G − N[u_i]) ≤ Z(G − N[ℓ])`.
   - *Hypotheses consumed.* Finiteness and the degree pattern of the path. **No `IsTree`** (neither connectivity nor
     acyclicity), no `n ≥ 2`, and `k = 0` is trivial.
   - *My check of the proof.* For `1 ≤ i ≤ m−1`, `G − N[u_i]` ≅ `(G − N[ℓ]) − u_{i−1}`: identity off the tail, tail
     shifted two steps. `u_i`'s only other neighbour is absent from the image, and the edge cases `i = 1` and
     `i = m−1` check. For `i = 0`, `m ≥ 2`, with `A = R − N_R[u_0]` and `B = R − u_0`:
     `Z(G−N[ℓ]) − Z(G−N[u_0]) = (Z(B) − Z(A))·P_{m−2}` using `P_{−1} = P_0 = 1`, which is `≥ 0` coefficientwise.
     `m = 1` is L1.
   - *My census.* 5,645,355 checks on every free tree to order 16 (every leaf, every vertex of its pendant path
     including the end vertex, `k = 0..n`), 0 failures. This equals C-T2-U's count exactly.
   - (PW) is not involved: a vertex is compared only with the leaf at the end of its own pendant path.
2. **`E993-R28-HS-BRANCH-TREE-MAX-DEGREE-2` (Theorem BTP). `proved_informal`, critic-attributed (C-T2-U, with C-T2-F's
   F2 as the concordant second derivation), STATED.**
   - *Statement.* For every finite tree `T` in which every branch vertex `v` has at most two neighbours whose direction
     (component of `T − v`) contains a branch vertex, and every `k` and every `t`: (HS-SDR) holds via each `v`'s own
     pendant leaves, and hence (HS) holds.
   - The class contains every caterpillar and every spider.
   - *Hypotheses consumed.* `IsTree`. Connectivity makes every non-branch direction a pendant path ending at a leaf;
     acyclicity makes the own-leaf sets of distinct branch vertices disjoint and the directions well defined.
     Finiteness is used. `n ≥ 2` is not needed: `Br ≠ ∅` forces `n ≥ 4`, and `Br = ∅` is vacuous. PP is consumed at
     position `u_0`, and SAP Direction 1 turns the injection into (HS).
   - *My census.* 262,555 BTP-class instances to order 16, 0 local-assignment failures.
   - **Sharp:** the order-22 counterexample's branch tree is `K_{1,3}`, the smallest branch tree outside the class.
3. **`E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`. `proved_informal`, critic-attributed (C-T2-F; C-T1-U and C-T1-F
   concordant), STATED.**
   - *Statement.* For a finite tree with `Br ≠ ∅`: `Σ_{v∈Br}(p(v) − (deg v − 2)) = 2`, where `p(v)` is the number of
     `v`'s pendant directions.
   - *Corollaries.* The own-pendant ("naive local") assignment is count-feasible iff the branch tree has maximum degree
     ≤ 2. The smallest tree where it is infeasible has order 10 and is unique: H10 (T1's Part E hub = T2's Part 3 tree).
   - *Hypotheses consumed.* Connectivity (`Σ p = |L|`); acyclicity and connectivity (the branch tree is a tree).
   - *Replays.* My census gives 0 identity failures to order 16 and count-deficient trees by order 10:1, 11:4, 12:19,
     13:77, 14:287, 15:1002, 16:3365, which equals both T2 critics.
   - This key absorbs T1's `…BRANCH-VERTEX-OWN-DIRECTIONS-INSUFFICIENT` (existence, T1-derived) and T2's
     `…LOCAL-ASSIGNMENT-MINIMAL-FAILURE-ORDER-10` (T2-derived construction; minimality and uniqueness
     critic-attributed).
4. **`E993-R28-SDR-THRESHOLD-EQUIVALENCE` (Lemma SAP). `proved_informal`, seat-derived (T2).**
   - *Statement.* For every finite simple graph `G` and every `k`, the following are equivalent:
     - (i) there is an injection from the slot multiset (`deg v − 2` copies of each `v` with `deg v ≥ 3`) to `L` with
       `c_ℓ(k) ≥ c_v(k)` on every pair;
     - (ii) `slots_{≥t}(k) ≤ leaves_{≥t}(k)` for every `t ∈ ℕ` **including `t = 0`**.
   - For a tree with `n ≥ 2`, the `t = 0` instance is automatic (`|L| − 2 ≤ |L|`), so (ii) may be taken over `t ≥ 1`.
   - *My check.* Direction 1 restricts the injection to `S_t`. Direction 2 sorts both sides descending and pairs by
     position. The `i`-th leaf exists by `t = 0`, and `μ(ℓ_i) ≥ τ(x_i)` follows by counting at `t = τ(x_i)`. Ties are
     harmless.
   - The replays confirm T2's three checks agree on 117,393 instances. That agreement is by theorem, so it tests code,
     not mathematics.
5. **The leaf-deletion / vertex-deletion recurrence.**
   - For any finite simple graph `G`, any vertex `w`, and `v ≠ w`:
     - `c_v^G(k) = c_v^{G−w}(k)` if `v ~ w`;
     - otherwise `c_v^G(k) = c_v^{G−w}(k) + c_v^{G−N[w]}(k−1)`.
   - `proved_informal`, classical content; T1-derived in the leaf case, general form by C-T1-U. **No key**: record it as
     a note under `E993-PAIR-GENERATION-THEOREM` / `E993-PAIR-EDGE-JOIN-COMPOSITION`.
6. **L1, leaf ≥ support.** This is the registered VERIFIED `E993-PAIR-R-LE-G-POINTWISE` (i). T1's and T2's
   re-derivations are corroboration notes only. It is the `m = 1` case of item 1.

**Bounded computations (never a grade for (HS)):**

- **(HS) census.** 0 failures on every free tree to order 16, both forms: 32,507 trees and 309,532 `(T,k)` instances
  with `Br ≠ ∅`, `1 ≤ k ≤ α`.
  - Attained by C-T2-U (centroid generator, rooted DP, BFS matcher), by C-T2-F (centroid canonical form, rooted DP,
    greedy matcher), and by my instrument (leaf extension, min-over-rootings canonical form, rooted `f0`/`f1` DP,
    bitmask brute force to order 12 with 0 mismatches). All three give 309,532 and 0.
  - T2 attained order 15 (13,187 / 117,393). C-T1-U and C-T1-F attained order 15 and 16 on their own conventions.
  - Counts equal A000055 to order 16 on every instrument.
  - This is consistent with the counterexample at order 22. The census horizon now belongs to the
    `E993-R28-DOMINANCE-CENSUS` record, which the F adjudicator rules on.
- **My exhaustive branch-tree-`K_{1,3}` family search** (hub of degree `3 + h`, `h ≤ 2` own legs, three spokes to
  extremal branch vertices each carrying ≥ 2 pendant legs).
  - It finds **0 failures of (HS) at orders 10–21**: 1, 4, 17, 61, 193, 552, 1,468, 3,629, 10,163, 23,106, 50,321 and
    105,408 family members.
  - At order 22 it finds **exactly 1 failure among 213,490 members**.
  - The arm-polynomial fast path was validated against the generic DP on 15,583 instances, with 0 mismatches.
  - This does not certify minimality over all trees. Orders 19–21 outside this family are untested by me; the
    controller's order-18 prior covers all trees only to 18.

**Record corrections adopted (none edits sealed text):**

- The (PW) witness of record: C-T1-U and C-T1-F concordant; controller erratum R28-E-b.
  - The order-5 witness compares two leaves.
  - The branch-vs-leaf form of (PW) is false with smallest witness order 9, edges `01,02,03,14,15,26,37,48`, `k = 5`.
    My brute force gives `c = (2,0,0,0,1,2,2,2,1)`: `c_0 = 2 > c_8 = 1`.
  - The fence is unchanged.
- H10 has `α = 7`, not 6.
- The fixed-point/census grade is `bounded_computation`.
- All T1/T2 literal strikes listed in the route tables.

## Rejected and narrowed mechanisms

1. **(HS) itself, the Tier 1 universal statement: REFUTED** (see Headline). The SDR route to a second proof of (DL)
   **is closed at the universal statement.** (DL) stays formally verified by r27's injection route. (HS) is strictly
   stronger than (DL) and false; (DL) is its `t`-summed (layer-cake) form.
2. **Every sufficient condition proposed for (HS) in this portfolio is refuted by the same witness, by implication**
   (each ⇒ (HS-SDR) ⇒ (HS)):
   - RH / R-SDR / LFR, "own leaves first, then one spare leaf per extremal branch vertex";
   - REC, the rooted-export conjecture, and its bottom-up greedy;
   - C-T1-F's rooted-subtree local rule, for every root.

   Their order-15/16 supports are superseded.
3. **Pendant-path stepwise monotonicity: REFUTED.** Order 6, `S(3,1,1)`, `k = 3`: `c_{u_1} = 3 > c_{u_2} = 1` (T1; C-T2-F
   independently). Smallest over pendant paths with `m ≥ 2`; `m = 1` is L1.
4. **Per-direction domination (one dominating leaf per branch-tree direction of a deficient vertex): REFUTED.** Order 12,
   `k = 6`, found by four critics. (HS) holds there.
5. **(PW), branch-vs-leaf form: REFUTED,** order 9, `k = 5` (item above). It remains a fence, never a premise.
6. **Narrowed statements.**
   - T1's Part D "obstruction" is narrowed to the one-step peeling strategy.
   - T1's "the whole local/peeling family is structurally insufficient" is narrowed to the own-pendant rule at Stage 4
     evidence, and is now moot.
   - T2's "no per-edge or per-pendant-direction rule can work" is struck: it works on the whole BTP class.
   - T2's "Lemma DM does not extend past distance 1" is struck.
   - T2's "matching form strictly stronger" is struck.
   - T1's REC novelty is withdrawn.

## Lean readiness

No T seat compiled Lean, and no T critique shipped a Lean build. So **no `#print axioms` output exists in this portfolio
to confirm, and no certification of a compiled fragment is made here.** The Lean fragments of this cycle are U's. The
rulings below concern contract-readiness of the mathematics.

- **`tree_leaf_slot_dominance` (HS, Tier 1): NOT READY — FALSE.** It must be withdrawn as a Stage 7 target. A sorry-free
  proof is impossible: the order-22 tree below falsifies it at `k = 11`, `t = 141`. If a formal refutation is wanted,
  it is a finite computation on one explicit 22-vertex tree. This is a *counterexample* instance, not a *universal*
  step, so the contract's ban on `decide` over an enumeration for a universal step does not apply to it. The contract must still say
  whether a kernel-evaluated finite check is admissible for a refutation record. That is Stage 6's call, not mine.
- **`sdr_iff_threshold` (Tier 2): CONTRACT-READY.**
  - (a) The informal proof is complete at statement level with a closed DAG: Direction 1 is restriction plus
    injectivity; Direction 2 is sort-and-pair plus a counting lemma at `t = τ(x_i)` and at `t = 0`.
  - (b) No compiled fragment exists in my portfolio.
  - (c) There are no open nodes.
  - *Exact recommended statement* (graph-general, no `IsTree`):
    `∀ (G) [Fintype X] [DecidableEq X] [DecidableRel G.Adj] (k : ℕ), (∃ f : Slot G → X, Function.Injective f ∧ ∀ s, G.degree (f s) = 1 ∧ occ G s.1 k ≤ occ G (f s) k) ↔ ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`,
    with `Slot G := Σ v : {v // 3 ≤ G.degree v}, Fin (G.degree v − 2)` and the contract's `occ`, `slotsAtLeast`,
    `leavesAtLeast`.
  - A tree-restricted variant quantifying `t ≥ 1` additionally takes `hT : G.IsTree` and uses the r27 slot count; that
    is erratum R28-E-a's quantifier choice.
  - *Fences.* Per `(G,k)`. It transfers no status to (HS) or to any fenced key. SAP (T2) and Mathlib Hall
    (`Finset.all_card_le_biUnion_card_iff_exists_injective`) are both admissible proof routes; the choice is the
    formalizer's.
- **`E993-R28-PENDANT-PATH-LEAF-DOMINANCE` (Tier 3 structural lemma): CONTRACT-READY after its second read.**
  - The informal DAG is closed: an induced embedding and independent-set monotonicity for `1 ≤ i ≤ m−1`; the
    path-polynomial identity or the same shift-embedding for `i = 0`; L1 for `m = 1`.
  - Nothing is compiled, and there are no open nodes.
  - *Exact statement:*
    `∀ (G : SimpleGraph X) [Fintype X] [DecidableEq X] [DecidableRel G.Adj] (m : ℕ) (u : Fin (m+2) → X), Function.Injective u → (∀ i : Fin (m+1), G.Adj (u i.castSucc) (u i.succ)) → (∀ i : Fin (m+2), 0 < i.val → i.val < m+1 → G.degree (u i) = 2) → G.degree (u (Fin.last (m+1))) = 1 → ∀ (i : Fin (m+2)) (k : ℕ), occ G (u i) k ≤ occ G (u (Fin.last (m+1))) k`.
  - *Hypotheses.* No `IsTree`.
  - *Fences.* Not (PW); no status transfer.
  - The simplest formal proof is probably a direct injection on independent `k`-sets: `J ∋ u_i ↦ φ(J ∖ {u_i}) ∪ {ℓ}`
    with the two-step shift `φ`, rather than the polynomial identity.
- **`E993-R28-HS-BRANCH-TREE-MAX-DEGREE-2` (BTP): informally complete; Lean-ready only after its second read, and
  multi-lemma.**
  - Its hypothesis needs a Lean phrasing without "branch tree": for every `v` with `3 ≤ deg v`, the number of neighbours
    `w` such that the component of `G.induce {v}ᶜ` containing `w` has a vertex of degree ≥ 3 is ≤ 2.
  - It depends on pendant-direction lemmas that are not yet written at statement level: every direction without a
    branch vertex is a pendant path ending at a leaf, and own-leaf sets are pairwise disjoint.
  - Not a Cycle-2 Stage-7 priority. Composed with (LC) it gives a structural second proof of (DL) *on the BTP class
    only*. That is an alias-distinct scope note at best, never a (DL) key.
- **(LC) `dominance_implies_degree_lemma` and (FC).** These are U's portfolio, and I make no readiness ruling on their
  compiled state. From T's side: (LC) remains a true implication and a valid Lean target, but it can no longer compose
  with a universal (HS). Its value is now the per-`(T,k)` implication (e.g. with BTP), and errata R28-E-a and R28-E-c
  govern its statement.
- **Smallest unproved lemma in my orientation's remaining scope.** The characterization of the (HS)-failure set beyond
  BTP. First instance: prove that `H(1; a, b)` (hub of degree 3, three spokes of length 1, each `B_j` carrying legs of
  lengths `a` and `b`) violates (HS) for all odd `a, b ≥ 3`. My bounded evidence: violations at `(3,3)` n = 22,
  `(5,3)` n = 28, `(5,5)` n = 34, `(7,3)` n = 34, `(7,5)` n = 40, each at 2–3 values of `k` near `α`. In every case the
  hub's `c` exceeds every leaf's `c`.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

The orientation produced these proved statements:
- **The pendant-path leaf-dominance lemma**, graph-general, proved four ways (critic-attributed).
- **Theorem BTP**: (HS) on every tree whose branch tree is a path; critic-attributed.
- **The surplus identity**, with the exact characterization and uniqueness of the order-10 local failure.
- **The Hall-free SDR ⟺ threshold equivalence** (seat-derived, T2), whose graph-general form is contract-ready.

It also refuted four local mechanisms with minimal witnesses. Its mechanism mapped the obstruction exactly to branch
trees of maximum degree ≥ 3, which is where the order-22 counterexample lives. That is material progress on a
refutation, not a plateau.

**Stop gate.**
- Event (a) is impossible: (HS) is false.
- Event (b), an in-scope counterexample confirmed by two independent instruments and an isolated second read, is
  **supported by my evidence up to the second read**. The witness is confirmed by four sources:
  - my DP;
  - my bitmask brute force;
  - a third, naive `itertools.combinations` enumeration with no DP;
  - the controller's reproduction of the F-side instrument (weighed as a replay).

  Only the isolated second read is outstanding. If Stage 6 obtains it, the run ENDS under §5(b), with the refutation
  registered and the weakest surviving matching-type strengthening recorded (see Next-route allocation).

## Headline assessment

headline_resolved: no
status: refuted

**Status basis.** I verified the counterexample to (HS) myself, with exact integers.

- **The tree.** The tree is `H(1;3,3)`, order 22. Hub `0` is adjacent to `B_1 = 1`, `B_2 = 8`, `B_3 = 15`, and each
  `B_j` carries two pendant paths of length 3.
  - Edges: `0–1,0–8,0–15,1–2,2–3,3–4,1–5,5–6,6–7,8–9,9–10,10–11,8–12,12–13,13–14,15–16,16–17,17–18,15–19,19–20,20–21`.
  - `Br = {0,1,8,15}`, all of degree 3, so there are 4 slots. `L = {4,7,11,14,18,21}`.
  - `i_k = 1,22,210,1144,3933,8907,13470,13529,8856,3691,975,171,19,1`, so `α = 13`.
- **Failure at `k = 11`.** Here `c_0 = 141`, `c_{B_j} = 4`, and every leaf has `c = 136`. At `t = 141` (every
  `t ∈ (136,141]`), `slots_{≥t} = 1 > 0 = leaves_{≥t}`.
  - Hand check: `c_0(11) = [x^{10}](1+3x+x^2)^6 = C(6,5) + C(6,4)·3^2 = 6 + 135 = 141`, since `T − N[0]` is six
    disjoint `P_3`.
- **Failure at `k = 12`.** Here `c_0 = 18` and every leaf has `c = 17`. At `t = 18`, `slots = 1 > 0 = leaves`.
- **Agreement.** Three code paths agree exactly: rooted DP, bitmask brute force, and naive enumeration. The naive
  enumeration also confirms `Σ_v c_v(k) = k·i_k` at `k = 10, 11, 12`.
- **Scope.** It is in scope: a finite tree, `k = 11`, `t = 141 ≥ 1`. The counterexample fails the threshold form at
  `t ≥ 1` exactly as `SOLUTION-CONTRACT.md` §2 states it. It is consistent with (DL): at `k = 11`,
  `Σ_L c − Σ_{Br}(deg−2)c = 816 − 153 = 663 ≥ 0`.
- **Attribution.** The first discovery is **critic `C-F1-T`'s** (per the controller facts record; I did not read it).
  My exhaustive `K_{1,3}`-family search rediscovered it independently, steered by the controller's description (see
  Identity and seal audit, disclosure 4). The grade is critic-attributed REFUTED at adjudication. Registration awaits
  the isolated second read (Stage 6).
- **Fence.** Nothing transfers to (DL), which stays formally verified. Nothing transfers to any no-recovery claim, the
  aggregate, TREE, FOREST or Erdős #993. `headline_resolved: no`, because no governed formal award or registered
  refutation exists at Stage 5.

## Next-route allocation

The exact remaining obligation for T, conditional on Stage 6:
- **If gate (b) fires** (second read confirms), the run ends. The T residue goes to the close record:
  - register PP, BTP, the surplus identity and SAP at their grades, after second reads for the critic-stated ones;
  - record the weakest surviving matching-type strengthening of (DL), which the contract's refutation record requires.
    This cycle's T evidence gives **(HS) on the BTP class** (proved) as the surviving strengthening. Whether any
    strengthening survives on all trees is open.
- **If the run continues** (e.g. the second read is delayed), the two Cycle 2 T routes should be:

1. **`C2-T-01 HS-FAILURE-CLASS-THEOREM` (prove).** Prove that `H(1; a, b)` violates (HS) for all odd `a, b ≥ 3`,
   turning the counterexample into an infinite family with the violating `k` and the hub-over-every-leaf inequality
   derived from path polynomials.
   - The arm products make this a finite polynomial-inequality argument. The tool is the leg recursions
     `P_j = P_{j−1} + x P_{j−2}`.
   - Also extend BTP's class, e.g. hubs with an own pendant leg, or even legs.
   - **Could close in one cycle:** the family theorem (`proved_informal`) and a sharpened class boundary.
2. **`C2-T-02 WEAKEST-SURVIVING-MATCHING-STRENGTHENING` (prove).** Find and prove the strongest matching-type
   statement between (HS) (false) and (DL) (true). Candidates to test and then prove:
   - (HS) restricted to `k ≤ k_0(T)` (the failures sit near `α`);
   - (HS) with the deficit slot of a `d_B ≥ 3` vertex allowed to be served by a non-leaf `c`-dominating vertex
     (e.g. a degree-2 vertex);
   - a `b`-matching / fractional SDR weaker than (HS) but stronger than the layer-cake sum.
   - **Could close in one cycle:** a stated candidate with census support on two instruments, plus a proof on the BTP
     class. This is exactly the contract's Tier 3 refutation-record obligation.
3. *(Optional, if a third slot exists; otherwise to U.)* **`C2-T-03 SDR-PARTIAL-THEORY-FORMAL`.** Formalize
   `sdr_iff_threshold` in the graph-general form above and PP as an induced embedding.
   - **Could close in one cycle:** both sorry-free, as a formal record of the SDR theory that survives the refutation.

Recommended pair: routes 1 and 2.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-adj-T/`
(SHA-256). Standard library only, exact integers, foreground runs.

| File | SHA-256 | Role |
|---|---|---|
| `adj_instr.py` | `6c4bf68d6cbb66020668fca3be807f1f0977d808cde79ca94c209bff7a5e638c` | Own instrument: leaf-extension free trees with a min-over-rootings canonical form; tree test (DFS connectivity + union-find acyclicity); rooted `f0`/`f1` DP for `c_v(k)`; bitmask brute force; HS threshold; PP; BTP; surplus; LFR. `python3 adj_instr.py 16 12` (33 s). |
| `adj_census_16.json` / `run16.txt` | `1b075b3f1ba63ff3341fb0a11fe5ce127720634f0596c17bef20c72f9b036cb3` / `6223cc0c432a88c79e7d7dc92253ca11ca8756dee02a66754f8adf48d2c8d6ca` | Order-16 census: counts equal A000055; 309,532 HS instances, 0 failures; PP 5,645,355 checks, 0; BTP 262,555, 0; LFR 46,977, 0; brute 987 trees, 0 mismatches; surplus 0 failures. |
| `adj_census_12.json` | `dc270ab13ce9bded1f4aeea9fa0712ef1d758ae49e062c21a77d1ef529811adf` | Order-12 run (6,884 instances, equal to C-T2-U's own-convention count). |
| `hub_search.py` | `568b07924f0e0976db385fe8fbf06ac0d6fa753ad3214b8e54ad3e758b368443` | Exhaustive branch-tree-`K_{1,3}` family search (arm polynomials); every hit re-checked by the full threshold test and brute force. `python3 hub_search.py 18 22 2` (22 s). |
| `hub_validate.py` | `469e2d5eb16b412132dcec35f84621e2f65adbb01b5f6cf10a3eb3656e76ac16` | Validates the arm-polynomial path against the generic DP: 15,583 instances, 0 mismatches. |
| `hub_search_10_17_1.json` / `hub_search_18_22_2.json` / `hub_18_22.txt` | `212a11f768f922765a167fad4af06fb1a72454ab438dc00889bdec5e2541bf9d` / `f78e34781498df3c5aed79ace4a87d17156dd7af508bdee7330daf580d18639c` / `8cf44091f3c5071df02348d5979db71321bb2738fed29d08a37799c60209473f` | 0 hits at orders 10–21; 1 hit at order 22 (`H(1;3,3)`, `k = 11, 12`), with the full `c` row and `i_k`. |
| `naive_witness.py` / `naive_witness.json` | `6dffd0544ff8752cea95fc5df69c7315383b6900fe4c6f6b86dbc420f1fe2602` / `7bef060197c2b42e5ad5252be168f2f9d69c6977e22b5338b4da3c202e55aac3` | Third code path: `itertools.combinations` enumeration of the witness at `k = 10, 11, 12`; violations `[141,1,0]` and `[18,1,0]`. |
| `hub_family.py` / `hub_family.json` | `11434f3c6c3d2fada5e2b5938f40b8df9fb89163dd83efa3b81148d21a28e05d` / `9effee847840821dd7c32c29f0ee89742c39782e5459a11878f015815fde04ee` | Symmetric hubs `H(s;a,b)`: failures exactly at odd `a, b ≥ 3`, `s = 1`, within `n ≤ 40`. |
| `witnesses.py` / `witnesses.json` | `6da17a9e2ca75baddf91d7c60e0f751b06e87625b2519aa2534c2d987261d41e` / `432abfae5796713ef54f653e8a83054386c1653cbae0104fddc98c4374d22f3d` | Brute-force replays: T1 hub ≅ T2 H10; H10 `i_k` and `α = 7`; `S(3,1,1)` at `k = 3`; (PW) order 9, `k = 5`; per-direction order 12, `k = 6`; slack-1 order 14, `k = 7`. |
| `replay-T1/` | report `26da6b14c76e470e67e9d0b0050b7d1248ab7f22d65f30401013a2fcbd210f48` | Copy-out-first replay of T1, byte-identical. |
| `replay-T2/` | report file `96e94c9ce25372c34cd04f4a6d63c3d4250a828024304cd3985c5b75de00ba74` (canonical `91694350…1a27`) | Copy-out-first replay of T2, byte-identical; the one-shot leaf/support replay printed `1434843 0` (850,972 non-trivial rows). |

The only background job was the harness-backgrounded counting one-liner, stopped by task id (disclosed above). No job
is running at this write. This adjudication was reread before close.
