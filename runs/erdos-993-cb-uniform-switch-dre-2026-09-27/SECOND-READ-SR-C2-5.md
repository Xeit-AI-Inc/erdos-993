# Second Read

Isolated second read **SR-C2-5**, r31 Cycle 2 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`). This is the Tier 1 re-read with the
Cycle 2 inputs, for `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, at the single rank `p* = (16m+4)/3` (`n = 17m+3`, `α = 9m+1`).
Written 2026-09-28, 04:49–05:11 EDT by the clock.

**Boot acknowledgment.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file.
- My first combined print failed on a zsh `=====` separator.
- The tool display truncated the middle of `verity.md`, and I first printed only lines 1–150 of the startup protocol.
- I read the remaining spans of both files before writing any finding.

Subsystems loaded: the constitution and the startup protocol only. The controller owns conversation logging and durable updates. This read
writes only this file and scratch under `scratchpad/c2-sr-SR-C2-5/`.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C2-SECOND-READ-PROTOCOL.md`: SHA-256 `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82`.
  **MATCH**, checked before reading the file.
- **Brief** `control/C2-SECOND-READ-BRIEF-SR-C2-5.md`: SHA-256 `e07f71bd6cec17ca4f4e2bfe567235948522e9146bca59adcfa5cc8d37e9a4ec`.
  **MATCH**, checked before reading the file.
- **Capsule** `control/c2-second-read/SR-C2-5-PACKET-MANIFEST.json`, stage `cycle-2-second-read-SR-C2-5`, 1,837 members.
  - I recomputed the seal as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with separators
    `(",", ":")` and no trailing newline: **`e45c58113bb0b65234abfa84cd175781d6e5c68e629952e7503cf9bbe863b970`. MATCH** with the dispatch
    value (`seal_check.py`).
  - **1,837/1,837** members match both byte count and SHA-256. None is missing.
  - The manifest file's own SHA-256 is `03885c0839ada6c6d58c24124fda68365ce6b18da28aa34694cbcc9683dfe966`. That is a file digest, not the seal.
- **Sources.** Every capsule member under `sources/` matches its entry in the `SOURCE-DIGESTS.json` of `sources/`, `sources/c1-results/`,
  `sources/c2-results/`, `sources/c2-stage7-sources/` and `sources/concurrent/`: 0 mismatches and 0 members absent from every table
  (`srcdig_check.py`).
  - `sources/c2-stage7-sources/SOURCE-DIGESTS.json` is the only capsule member under that directory. I read no frozen instrument and no
    controller replay.
- **Registries.**
  - Run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json`: 497 claims.
  - Frozen master `sources/authority/CLAIM-IDENTITY.json`: 491 claims.
  - Concurrent master `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`: 494 claims.
- **Closed Cycle 2 awards** (capsule members, read only):
  - **C2-LA1** (`runs/lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree`).
    - `VERIFICATION-REPORT.md`/`.json`: verdict `formally_verified`, with no blocking finding. All seven receipts are present with passing
      verdicts. The formalization receipt reads `FORMALIZATION_PREPARED_NOT_KERNEL_VERIFIED` by design; the kernel receipt carries the
      verification.
    - `RECEIPTS/kernel-verification.json`: `verdict.code verified`. Its `source_sha256_after` is `986b5257…0c9d`, which equals my own
      SHA-256 of the frozen `LeanProject/LeanProof/Main.lean` (11,597 lines).
    - `EVIDENCE/axioms.txt`: the terminal depends on `[propext, Classical.choice, Quot.sound]`.
    - `EVIDENCE/terminal-statement-check.json`: `expected_statement_equals_source_text: true`, and the only change is the namespace prefix.
    - Fidelity receipt: 54 passed, 0 failed.
    - My own token scan of the frozen `Main.lean`, with comments stripped (`lean_token_scan.py`), finds 0 `sorry`, `admit`,
      `native_decide`, `decide` or `axiom` tokens. The two raw `sorry` matches are "sorry-free" in comments. C2-LA2's source also scans clean.
  - **C2-LA2** (`runs/lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent`).
    - Verdict `formally_verified`, and the receipt reads `verified`.
    - Its source digest `e75c66b2…faae` equals my SHA-256 of its frozen `Main.lean`.
    - The terminal depends on the three standard axioms only.
- **Carry note (C2-LA1).**
  - Two origin terminals are carried with the keyword `theorem` changed to `lemma`: C1-LA3 entry 21 (run entry 57) and C1-LA2 entry 78 (run
    entry 105).
  - The formalizer recorded this for a controller ruling. The fidelity receipt cites ruling R31-N-15 and confirms that the reverse
    substitution reproduces the origin digests byte for byte.
  - The ruling text is not a capsule member. The rekey does not touch the terminal statement, and I take it as recorded.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail address into my context before my first
     tool call. I did not open or use them. I wrote no conversation log, because the protocol confines my writes.
  2. Two shell prints failed on a zsh `=====` separator. This was cosmetic and had no effect.
  3. The harness saved two oversized tool outputs to its own tool-results folder outside the run root: my print of the brief together with
     the manifest, and my print of C2-LA1's contract with its verification report. I did not read either saved copy. I re-read the
     brief with the file reader and printed the contract field by field.
  4. **Non-member exposure.** Two `grep` commands used the glob `second-reads/*/SECOND-READ.md`, which also expanded to the non-member
     `second-reads/SR-C2-6/SECOND-READ.md`.
     - The first printed nothing from it.
     - The second printed one line of it (its line 157, a Residual-margin inequality).
     - This exposed that the read exists and that one line. I used neither. Every later command named member paths explicitly.
  5. **Listings.**
     - A non-recursive `ls RECEIPTS EVIDENCE` inside the C2-LA1 run, names only. These are directories of capsule members.
     - `ls -1` of my own scratch, for the inventory.
     - `mkdir -p` created `scratchpad/c2-sr-SR-C2-5/` and `second-reads/SR-C2-5/`.
     - Every `grep` was of named member files.
     - I removed my own smoke-test output `row_5.json` from my scratch.
  6. All 44 files I opened are capsule members (checked by script against the manifest).
     - I did not open the three Stage 5 adjudications, the r30 records or the Cycle 1 runs beyond C1-LA1's `Main.lean`, because the
       assembly needed none of them.
     - The brief mentions "Stage 5 facts files in the capsule", but no such file is a member. Only `control/C2-STAGE6-CONTROLLER-FACTS.json`
       is. I read it as facts only.
  7. I made no Mathlib access, ran no `lake` or `lean`, used no network, installed nothing, started no child agent and killed nothing.
     Every computation ran in the foreground as `python3 -B`, standard library only, with exact `int` and `Fraction`. No background job
     was started.
- **Instruments.** Every instrument is my own and lives in my scratch. I used no seat code, no controller replay and no frozen census value
  as evidence.
  - The allocation of record is parsed from the formally verified C1-LA1 source (`cb8Bpb`, `cb8Bpc`, `cb8CGamma`): 36 + 36 + 7 cells.
  - SR-5's and SR-C2-2's recorded values appear below only as concordance.

## Statements read

Statement of record: `cycles/cycle-2/stage6/SYNTHESIS.md`, read in full: R-1..R-8, `## Exact established results` (X-1..X-13 and B-1),
`## Refuted or narrowed mechanisms`, `## Headline verdicts`, `## Lean awards` (C2-LA1..3), `## Progress and stop-gate ruling`,
`## Registrations` (G-1, G-2) and the SR-C2-5 funding line.

I also read:
- both contracts;
- the Cycle 1 Tier 1 read `sources/c1-results/second-reads/SR-5/SECOND-READ.md` (its DAG, grade ruling and registration text);
- the verdicts, findings and registration texts of the four Cycle 2 reads `second-reads/SR-C2-{1,2,3,4}/SECOND-READ.md`, taken as
  confirmed inputs;
- the C2-LA1 terminal, its definitions of record and its link lemmas in the frozen `Main.lean`, with its contract, receipts,
  formalizer report and fidelity review;
- C2-LA2's contract, report and receipts;
- C1-LA1's allocation definitions and terminal;
- the controller facts CF6-2-1..6, read as facts only;
- the registry faces of the Tier 1, eligibility, composition, allocation, block-descent, criterion, threshold, favorability, FLOW ⇒ SIGN,
  (HALL) and primary-aggregate keys, all in the snapshot.

The three statements under read, one verdict each:
- **SR-C2-5a.** The dependency graph of Tier 1 = (E) ∧ (H) with the Cycle 2 inputs, each node's grade and source; that C2-LA1's terminal
  is (E); the conjunction's grade by the weakest-input rule; whether any node still depends on Darroch or Newton; the move to
  `proved_informal` (G-2); non-decisiveness.
- **SR-C2-5b.** A fresh-row corroboration at `m = 128` (and `m = 125`) with my own exact instruments.
- **SR-C2-5c.** The exact updates of the Tier 1 key and the eligibility key.

Index of record throughout: favorability of `w` at rank `p` means `Δ_p(T − w) = i_{p+1}(T − w) − i_p(T − w) < 0`. Nothing below uses the
index `p* − 1`.

## Independent re-derivation

### SR-C2-5a. C2-LA1's terminal against (E), and the dependency graph

**C2-LA1's terminal is (E), plus the parent descent, on the literal tree.** I read the terminal and each definition it uses in the frozen,
kernel-verified `Main.lean`:

```text
theorem E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) < C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
```

- **The tree.** `cbGraph m = SimpleGraph.fromRel (cbEdge m)` on `Fin (17m+3)`.
  - `cbEdge` (carried C1-LA2 entry 23) is exactly the pairs `(0,1)`, `(1,2)`, `(0, 3+17i)`, `(3+17i, 3+17i+1+2j)` and
    `(3+17i+1+2j, 3+17i+2+2j)` for `i < m`, `j < 8`. That is the frozen labelling `r, s, v, u_i, b_ij, c_ij`.
  - My instrument builds the same tree from the same labels.
  - `IsTree` is the carried `cbGraph_isTree` (C1-LA2 entry 56).
- **The parent descent.** `indepSetCount G ∅ k` is the cardinality of the independent `k`-subsets of the vertex type (entries 9–10).
  That is the literal `i_k(T)`.
  - The conjunct is `i_{p*−1} < i_{p*−2}`, i.e. the strict descent at index `p* − 2`.
  - Both ℕ-subtractions are exact, since `p* ≥ 572`.
  - It is proved as `critU3T_cb_indepSetCount_eq_coeff` (count = coefficient of the ℕ closed form), then the cast bridge
    `AdjU.cb8I_coeff_cast`, then `CriticU1T.cb8_elig_top_a`.
- **The first descent.** `C5LA1.crossingIndex G = Nat.find (fun k => forwardDifferenceDel G ∅ k < 0)`, where
  `forwardDifferenceDel G ∅ k = (i_{k+1} : ℤ) − i_k`.
  - Its existence is witnessed at `k = indepNum`, because `i_{α+1} = 0 < i_α`.
  - This is the actual first strict descent, computed in ℤ, with counts vanishing above `α` because those families are empty.
  - The link `critU3T_cb_crossingIndex_le_of_coeff` applies `Nat.find_le` at `q = p* − 2` to the strict descent there. This is the
    correct direction: a descent at `q` bounds the least descent by `q`.
- **The low window.** It uses Mathlib's `indepNum`, through the carried `cb_lowWindow` and `cbGraph_indepNum_eq : indepNum = 9m + 1`
  (C1-LA2 entries 71 and 66).
- **Hypotheses.** Exactly `107 ≤ m` and `m % 3 = 2`.
  - `107 ≤ m` enters through the certificate's parametrization `m = 3u + 107` and the carried block descent's `5 ≤ j ≤ m`.
  - The residue enters through the exactness of `p*` and that parametrization.

So the terminal is (E) (conjuncts 1–3 of the SOLUTION-CONTRACT §2 terminal) together with (a), for every class `m`.
- It covers the eligibility key's full statement: the descent at index `p* − 2` on the tree, and eligibility.
- The only clause of that statement it does not conclude is the **companion** block-sign clause, which the key itself marks as "not an
  input". Its `j ≥ 5` part is the formally verified block-descent key. Its `j = 2, 3, 4` parts rest on fixed certificates, and its
  `j ≤ 1` and tail parts are `proved_informal`.
- Repair, in the text below: the face must fence that companion out of the formal grade.

**Dependency graph of Tier 1 with the Cycle 2 inputs.** "FV" means `formally_verified` at the exact scope named. Grades are the
registered grades, or the registrable grades given the four confirmed Cycle 2 reads.

```text
TIER 1  (E) ∧ (H) on CB(8,m), m ≥ 107, m ≡ 2 (mod 3), rank p* ......... proved_informal   [weakest inputs: H, H-a, H-b]; no Darroch, no Newton
├─ (E) = ELIG key ........................................................ FV via C2-LA1 (terminal above) [was computer_assisted]
│   ├─ ℕ closed form of I(cbGraph m), count = coefficient, cast bridge .... kernel-checked in C2-LA1 (companion; SR-C2-4-R2 proved_informal)
│   ├─ block + difference identities; S_5 > 0 via Poly(u), 51 coefficients  kernel-checked in C2-LA1 (SR-C2-4-R1: same certificate as SR-4's)
│   ├─ block descent 6 ≤ j ≤ m ......................................... FV: BLOCK-DESCENT key (C1-LA3 terminal, carried)
│   ├─ tree, α = 9m+1, low window, crossingIndex ......................... FV: C1-LA2 layer (carried, kernel-checked)
│   └─ Darroch/Newton ................................................... none (axioms propext, Classical.choice, Quot.sound)
└─ (H) COMPOSITION key (sector certificate + criterion + all leaves favorable ⇒ (HALL)) ..... proved_informal (SR-3; written case split + tightness: [r31 C2; SR-C2-3])
    ├─ H-a  F_{p*} = leafSet ............ proved_informal, Darroch/Newton-FREE: [r31 C2; SR-C2-1] note on the FAVORABILITY key
    │        inputs: the key's closed-form node (proved_informal) + two-binomial descent lemma (kernel-checked companion of C1-LA3)
    │        closed-form inequalities (both leaf classes) ... FV over ℤ[X]: C2-LA2 (not a cbGraph statement)
    │        graph link: v compiled in scratch (C-U3-T); c_ij open (C2-LA3 running; not an input)
    │        structure: leafSet = {v} ∪ C, W_v = {r}, W_c = {u_i}, favorableLeaves = leafSet if all favorable ... FV: C1-LA2
    │        NOT USED: the favorability key's full-scope proof (modulo Darroch/Newton)
    ├─ H-b  criterion key at (8, m, p*) ..... proved_informal
    │        (i) strict, every q: [r31 C1; SR-2] note, elementary (companion cb8_E1_conditionI_topRank, C1-LA3, no grade)
    │        (ii) type-path inequalities: [r30 C4; SR-C4-6] note (identity; written out on [r31 C2; SR-C2-2])
    │        explicit arc values: [r31 C2; SR-C2-2] note
    │        NOT USED: the threshold-key route ([r30 C6; SR-C6-1], modulo Darroch)
    ├─ H-c  ALLOCATION key ................... FV at template scope (C1-LA1); used through the composition key's proved reduction
    ├─ rational flow ⇒ (HALL-COND) ........... elementary (no key)
    └─ (HALL-COND) ⇒ integral saturating flow  FV companion exists_saturatingFlow_of_weightedHall on the FLOW ⇒ SIGN key
```

**Darroch/Newton audit, node by node.**
- (E): none. The award uses the three standard axioms, and its informal route (SR-4's steps (1)–(4); SR-C2-4) is Darroch- and
  Newton-free by its face.
- H-a: none on the SR-C2-1 route. Every polynomial fed to the descent lemma or the recurrence is a monomial times
  `(1+x)^a(1+2x)^b`. The lemma is proved by induction on linear factors, and no real-rootedness is used (SR-C2-1's note, confirmed).
- H-b: none.
  - The criterion key's proof of record uses neither theorem, per SR-5 and its face. Its only Darroch mention is the
    `[r30 C5; SR-C5-4]` threshold-domain note, which is not used here.
  - `[r31 C1; SR-2]` is elementary.
  - The type-path inequalities rest on the log-concavity of `C(a,t)` and `C(b,t)2^t` (term ratios), not on Newton.
- H-c and the composition key: their faces state "No Darroch, no Newton". The companion `exists_saturatingFlow_of_weightedHall` is a
  kernel-checked graph-generic statement with no analytic input.

**No node depends on Darroch or Newton**, provided H-a is discharged through the `[r31 C2; SR-C2-1]` note and not through the favorability
key's full-scope proof.
- Two dependent routes exist, and neither is used: that full-scope proof, and the threshold key.
- Two faces still describe the dependent route: the criterion key's `[r31 C1; SR-2]` note ("F ⊇ C … supplied only by [the favorability
  key] … keeps that dependency") and the composition key's scope ("(a) through [the favorability key] carries that key's Darroch/Newton
  dependency").
  - Both remain true of that route.
  - On this class and rank both are superseded by the SR-C2-1 note.
  - The Tier 1 face below says so. Sealed text is not edited.

**Hypotheses, subtractions and endpoint.** `m ≥ 107` enters (E) through the certificate and the carried block descent. It enters (H)
through the allocation key: its Residual certificate is from `m = 107`, and `pc ≥ 0` needs `m ≥ 689/200`.
- `m ≡ 2 (mod 3)` enters through:
  - `p*` integral;
  - `K = p* − 1 = (16m+1)/3`;
  - `8m ≡ 1 (mod 3)`, the favorability residue, so `⌊(2dm+4)/3⌋ = p*`;
  - `6(p* − q − 1) − (3a_q + 4b_q) = 2q + 1` for condition (i);
  - `3p* = 16m + 4`, which makes the favorability margins exact.
- ℕ-subtractions `p* − 1`, `p* − 2`, `K − 1`, `8 − γ` (`γ ≤ 7`), `8m − 1`, `m − 1`, `8q − 1`, `8(m − q) + 1` (`1 ≤ q ≤ m`): all exact on the class.
- No cutoff `M_0` beyond 107, no omitted range and no asymptotic step appear anywhere.

**Weakest-input rule (SOLUTION-CONTRACT §4).**
- (E) is `formally_verified`.
- (H) is `proved_informal`: the composition key, the criterion key with its notes, and H-a through the closed-form node are its weakest
  inputs. H-c is formal at template scope, but it enters only through the composition key.
- **Tier 1 = `proved_informal`, with no Darroch/Newton qualifier.** This confirms G-2 and the synthesis headline ("the Tier 1 key's
  weakest input becomes `proved_informal` (the composition, the criterion key and favorability)").
- The Cycle 1 grade `computer_assisted` was carried by the eligibility certificate (R31-N-8), which is now kernel-checked inside C2-LA1.
- Sequencing: the Tier 1 update presupposes that the eligibility update (G-1) and the `[r31 C2; SR-C2-1]` note are registered. SR-C2-2's
  and SR-C2-3's notes are cited but carry no grade move.

**Not decisive (SOLUTION-CONTRACT §5).** Decisive event (a) needs the §2 terminal `formally_verified` at full scope.
- Conjuncts 1–3 are now formal (C2-LA1).
- The companion `AdjU.cb8_topRank_of_flow` on C2-LA1's face derives the whole terminal from conjunct 4 alone, but carries no grade.
- Conjunct 4 (`∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves …) p* f`) is not formally verified. It needs the formal composition on
  `cbGraph m`: U-B's arc-sum bridges, the E1 flow on `cbGraph m`, and the graph-level favorability link for the private leaves.
- Closing C2-LA3 would not change this. "Tier 1 at `proved_informal` … is NOT decisive": the run continues. No eligible deficient cut
  exists or was proposed, so decisive event (b) is also absent.

### SR-C2-5b. Fresh rows `m = 128` and `m = 125`, with the control row `m = 107`

All instruments are my own (`sr25lib.py`, `sr25_row.py`, `sr25_lab.py`):
- **The tree.** Built literally from the frozen labels as adjacency lists and tested for connectivity, acyclicity and `|E| = n − 1`.
- **Independence counts.** A rooted independence DP with forced-in and forced-out vertices.
- **Leaf deletions.** For every leaf `w`, `I(T − w)`, `I(T − H_w)` and `I(T − R_w)` are computed by an exact path update at the root.
  - The root's product is divided exactly by the old factor of the child that owns the deleted set, and multiplied by the new local
    factor.
  - The results are cross-checked against full literal DPs and against the closed forms of `I(T − v)` and `I(T − c_ij)` at four leaves
    per row.
- **Weights.** A **set-based** active-tag weighted layer DP. At each support vertex, a tag child in `B` counts iff the support's parent,
  or a second child, is in `B`. It never uses the per-tag decomposition.
- **Self-test.** Brute force on 22 small trees (8 CB trees, 14 random trees) with random forcing and random `F`: 975 checks, 0 failures.
  A four-mutant run detects every mutant (`selftest_out.json`, `mutant_out.json`).

| Check | `m = 107` (control) | `m = 125` (fresh) | `m = 128` (fresh) |
|---|---|---|---|
| `n`, `α`, `x` (scanned through `α`), `p*` | 1822, 964, 570, 572 | 2128, 1126, 666, 668 | 2179, 1153, 682, 684 |
| `x + 2 ≤ p*`; `3p* < 2α+1`; `i_{p*−1} < i_{p*−2}` | yes; 1716 < 1929; yes | yes; 2004 < 2253; yes | yes; 2052 < 2307; yes |
| `I(T)` = closed form; path updates = full DPs = closed forms (4 leaves) | yes; yes | yes; yes | yes; yes |
| leaves derived favorable at the index of record | 857/857 | 1001/1001 | 1025/1025 |
| (WID): set-based supply − capacity = `Σ_F [q_w(p*) − q_w(p*−1)]`; also supply = `Σ_F q_w(p*)`, capacity = `Σ_F q_w(p*−1)` | equal; `S < 0` (409 digits) | equal; `S < 0` (478 digits) | equal; `S < 0` (489 digits) |
| class decomposition at `k = p*, p*+1` (sector count `2^{k−2}C(8m,k−2)` = sector weight; `r`-without-`v` weight ≡ 0; `r`-free weight `Σ_q 8q·C(m,q)·r_q(k−q−1)`; the parts sum to the total) | all true | all true | all true |
| condition (i) strict at every `q`; `ρ_q` strictly decreasing; `ρ_1 = max` | yes | yes | yes |
| `ρ_1` | `5150844596024699/5173467627355748` | `125082229581739/125552319952916` | `25247668247805897/25340326629755188` |
| `θ`; margin `(1 − ρ_1)/θ` | `96/766193`; 34.90 | `96/1045085`; 40.76 | `96/1095767`; 41.74 |
| allocation of record: nonnegative; Switch (tight at `γ = 1..6`); Residual | yes | yes | yes |
| exact DP over every assignment: `min Σ Out` (leg total `K`); `max Σ In` (total `K − 1`) | 1; 1 | 1; 1 | 1; 1 |
| max switch-image load/capacity `(ρ_1γ + (8−γ)σ(γ))/γ` | 0.995752 | 0.996348 | 0.996431 |
| **total source weight** `Σ_{I_{p*+1}} w_F` | 411 digits | 480 digits, leading `23312513260142754019` | 491 digits, leading `74730846855903638945` |
| **composed flow value** (criterion part `Σ_q 8q·C(m,q)·r_q(p*−q)` + sector part `2^{p*−1}C(8m, p*−1)`) | **= total** | **= total** | **= total** |

- **The control row.** It reproduces SEMANTIC-CONTRACT §5's fixed points: `n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193`, margin 34.90.
  It also reproduces SR-5's `ρ_1` and switch ratio at 107.
- **Concordance.** At 125 and 128, my `ρ_1` equals SR-C2-2's recorded values. That is concordance only.
- **E1 total load.** At every row the E1 total target load `Σ_q ρ_q·W_q(p*)` equals the criterion part of the source weight exactly.
- **The max-flow.** The max-flow value is at most the total supply, and the exhibited composed flow attains it. So **max-flow = total
  source weight** at both fresh rows, and there is no deficient cut.

**Disclosure.** A literal augmenting-path max-flow over the whole network is infeasible, since the layers have 480+ digits. Feasibility at
targets I did not enumerate therefore rests on the composition key's per-class reduction. The laboratory below corroborates it but does
not replace it.

**Sampled literal laboratory** (`lab_128.json`, `lab_125.json`; `ALL_PASS` at both rows, 0 failures). Arcs, weights and preimages are all
generated literally from the adjacency. `F = leafSet`, since every leaf was derived favorable at these rows. The sector rule is the
allocation of record.
- **30 sector sources per row** (24 uniform random, 6 switch-heavy with 30 chokes at `(1, γ)`), with 21,331 and 20,825 literal arcs.
  - Each arc count is `K + 3 + #{β_i = 1}`, and the targets are pairwise distinct.
  - The zero-rule arcs are exactly the deletions of `r` and `v`, the switch at `s` and the `u_i`-switches at `(1, 0)`. Each lands on
    weight 0.
  - Every positive rule arc lands on weight at least 1. A `u_i`-switch image has weight `γ_i`: 744 and 721 positive switch arcs.
  - The literal outflow equals `Σ_i Out` and is at least 1.
- **9 in-sector targets per row**, with 6,236 and 6,070 enumerated preimages.
  - The (D) preimages are exactly `2 × #empty legs` and are all sector sources.
  - No sector source is an (S) preimage.
  - The maximum load after scaling is 1. The profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` has `Σ In = 1` and load **exactly 1** after
    scaling, which is SR-C2-3's tightness at two fresh rows.
- **24 switch images per row** (`γ = 0..7`).
  - The weight is literally `γ`.
  - There are exactly `8 − γ` sector preimages, all through the switch at `u_i`.
  - `ρ_1γ` plus the scaled sector load is at most `γ`, with maximum ratio 0.996431 at 128 and 0.996348 at 125.
  - `γ = 0` images receive no sector flow.
- **6 other targets per row** (two chokes; one choke with `s`; `r` without `v`) receive sector load 0. The `r`-without-`v` targets have
  weight 0.

This is a bounded corroboration at two fresh rows and one control row, not proof.

### SR-C2-5c. Keys, predicates and aliases (`sr25_alias.py` → `alias.json`, `alias_face.txt`)

- **Predicates.** Both keys are existing keys, and their statements are unchanged, so each key is still a predicate its statement
  satisfies.
  - The eligibility key: the coefficient `i_k` strictly descends at index `(16m−2)/3 = p* − 2`, and `p*` is eligible, on the named class.
  - The Tier 1 key: rank `(16m+4)/3` is eligible and the literal network satisfies weighted Hall there.
  - Neither name is a working label.
- **Registry hits.**
  - Run-local snapshot (497): exactly one hit each (the key itself), 0 alias-string hits and 0 `alias_patterns` hits.
  - Frozen master (491) and concurrent master (494): 0 exact, 0 alias-string and 0 pattern hits, as expected for run-local keys.
  - Nearest lexical neighbours: each other (Jaccard 0.645; distinction row R31-C1-SR-5-D4 exists) and the r30 row key
    `…CB-8-M-95-TO-107-…` (0.485 and 0.389; distinction rows R31-C1-SR-5-D1 and SR-4's exist).
  - The new record id and the note tag `[r31 C2; SR-C2-5]` occur nowhere in the three registries.
- **Whole-face scan.** Every field line of the registration text below was run against every `alias_patterns` regex of all three
  registries: 18 hits, 6 per registry, all of the same kinds SR-5 found.
  - Citations by KEY of `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`.
  - The verbatim registered statement's weight wording, which hits `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`.
  - `E993-TREE-REAL-ROOTED`, cited as REFUTED.
  - The "FOREST … stay OPEN" boilerplate, which hits `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`.
  - None is an alias.
- **Naming rules.**
  - r30 content is named by KEY.
  - The only award labels on the face are r31's (C1-LA1..3, C2-LA1, C2-LA2), as on the existing faces.
  - No "FOR-EVERY-M" and no new key.
  - The global conjecture stays OPEN.

## Findings and repairs

1. **C2-LA1's terminal is (E), and it covers the eligibility key's statement.**
   - It asserts the tree, the literal descent `i_{p*−1} < i_{p*−2}`, `crossingIndex + 2 ≤ p*` with the carried first-descent definition,
     and the low window with Mathlib's `indepNum`. It holds on the literal `cbGraph m` under exactly the class hypotheses.
   - `α = 9m + 1` is the carried kernel-checked `cbGraph_indepNum_eq`.
   - **Repair (eligibility face):** the companion block-sign clause at the end of the key's statement is not a conclusion of C2-LA1. The
     new scope fences it at its own grades. Its `j ≥ 5` part is the formally verified block-descent key; its `j = 2, 3, 4` parts are
     `computer_assisted`; its `j ≤ 1` and tail parts are `proved_informal`.
   - The old scope sentences "Grade qualifier: `computer_assisted`…" and "Any composition that uses this key inherits `computer_assisted`
     at best" are superseded. The full new SCOPE is given, and the statement is copied verbatim.
2. **Tier 1 moves to `proved_informal` with no Darroch/Newton node.** G-2 is confirmed.
   - The weakest inputs are the composition key, the criterion key with its notes, and favorability through the closed-form node.
   - The Cycle 1 qualifier "the (H) conjunct modulo Darroch and Newton through the favorability key" is removed. This depends on H-a being
     discharged by the `[r31 C2; SR-C2-1]` note, so the Tier 1 update is sequenced after that note and after G-1.
3. **Not decisive.** Conjunct 4 of the §2 terminal is not formal. The terminal's reduction to conjunct 4 exists only as the ungraded
   companion `AdjU.cb8_topRank_of_flow`. Stated on the face.
4. **Stale notes (consequential repair).** Two registered `[r31 C1; SR-5]` notes state the Cycle 1 grade:
   - on `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: "`computer_assisted` … Hall conjunct modulo Darroch and Newton";
   - on the favorability key: "the sole input through which Darroch's theorem and Newton's inequalities enter".

   Notes are records and are never edited. I give two short superseding notes below. They change no statement, status or grade of
   either key.
5. **G-2's attribution is repaired to an explicit list.** The synthesis wrote "as registered (SR-5) plus G-1 and G-3 attributions".
   - The repaired list keeps the registered text verbatim.
   - It adds the C2-LA1 and C2-LA2 panels and origins, the favorability origins, the SR-C2-2/SR-C2-3 inputs and their origins, the
     synthesis and this read.
   - Seats are qualified by run and cycle, because r30 and r31 seat names collide (SR-C2-1 Finding 4).
6. **Face precision.** The eligibility SCOPE records the formal route and the award's identity (governed run, receipt digest, axioms).
   - The award run id cannot go in a `formal_award` field: the grammar has no such field.
   - The controller should set the registry's `formal_award`/`terminal_evidence` for the eligibility key to the C2-LA1 run when
     registering, as it did for C1-LA1 and C1-LA3.
7. **C2-LA1 carry rekey (R31-N-15).** Two carried origin terminals appear as `lemma`. The fidelity receipt confirms that the reverse
   substitution reproduces the origin digests. This has no effect on the terminal or on this read.
8. **Brief vs capsule.** The brief refers to "the Stage 5 facts files in the capsule", but none is a member. Nothing in this read needed
   them.
9. **Fresh rows.** `m = 125` and `128` had been used before only for criterion-level class checks (SR-C2-2), never for a Tier 1
   end-to-end check. Every check passes, and no cut or template failure appeared.
10. **Fences (SOLUTION-CONTRACT §3), checked.**
    - 1: one rank, the class only, no status transfer.
    - 2: (WID) was asserted from independent sides at every row, and no row result is interpreted unless it passes; `F` is derived; `x`
      is scanned through `α`.
    - 3: Darroch and Newton are used nowhere.
    - 4: the template-to-network step is the composition key's reduction; no LP optimality and no `θ*` law.
    - 5: no asymptotics and no `M_0`.
    - 6: nothing refuted is revived, and (G′) stays refuted.
    - 7: census values are not evidence.
    - 8: no sealed member was edited.
    - 9: attribution travels (below).

    The global conjecture, (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER and governed beta stay OPEN.

## Registration text

Register in this order.
1. The eligibility update. Preconditions: C2-LA1 closed `formally_verified` (verified above), and SR-C2-4 concordant (it is).
2. The `[r31 C2; SR-C2-1]` note on the favorability key (SR-C2-1's text, a confirmed input).
3. The Tier 1 update.
4. The two superseding notes.
5. The record.

Each registered statement below is copied verbatim from the frozen run-local snapshot by `sr25_regtext.py`, and is unchanged. The record is
bounded and is never evidence.

```text
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE
STATUS: VERIFIED
GRADE: formally_verified
STATEMENT: Let m ≥ 107 be an integer with m ≡ 2 (mod 3), and let T = CB(8,m) be the tree with path r – s – v, m chokes u_1..u_m adjacent to r, 8 supports b_i1..b_i8 adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 17m + 3). Put p* := (16m+4)/3 (an integer exactly when m ≡ 2 (mod 3)) and L := p* − 2 = (16m − 2)/3, and let i_k := i_k(T) be the number of independent k-sets (zero for k < 0 and above α(T)). Then (a) i_{p*−1} < i_{p*−2}, that is, Δ_L(T) = i_{L+1} − i_L < 0 in ℤ; and (E) the first strict descent x(T) = C5LA1.crossingIndex (the least k with i_{k+1} < i_k, computed in ℤ through rank α) satisfies x(T) ≤ p* − 2, α(T) = 9m + 1, and 3p* = 16m + 4 < 18m + 3 = 2α(T) + 1, so p* is eligible (x(T) + 2 ≤ p* and 3p* < 2α(T) + 1); eligibility uses no favorability, selector, weight or E1 hypothesis. Proof. (1) Closed form and block identity (elementary): splitting on whether r is chosen, then on each u_i, I(T) = (1+2x)G^m + x(1+x)(1+2x)^{8m} with G = (1+2x)^8 + x(1+x)^8, and the binomial theorem gives I(T) = Σ_{j=0}^{m} C(m,j) x^j P_j(x) + x(1+x)(1+2x)^{8m} with P_j := (1+x)^{8j}(1+2x)^{8(m−j)+1}; with a_j(l) := [x^l]P_j, g_j := a_j(L−j) − a_j(L−j+1) and τ := 2^{L−2}C(8m, L−2) − 2^L C(8m, L) (the tail difference), i_{p*−2} − i_{p*−1} = Σ_{j=0}^{m} C(m,j) g_j + τ in ℤ; for 0 ≤ j ≤ m, 1 ≤ L − j and L − j + 1 ≤ 8m + 1 because L − m = (13m − 2)/3 ≥ 1; deg I = 9m + 1 (leading term 2x^{9m+1} from (1+2x)G^m; the tail has degree 8m + 2), so α(T) = 9m + 1. (2) Two-binomial descent tool: for r(k) = [y^k](1+y)^a(1+2y)^b with a, b ≥ 0, (R) (k+1)r(k+1) = (a+2b−3k)r(k) + 2(a+b−k+1)r(k−1), from (1+y)(1+2y)f′ = ((a+2b) + (2a+2b)y)f; (LC) r is positive on [0, a+b] and log-concave, by induction on linear factors (z_k = x_k + c x_{k−1} with c > 0 gives z_k² − z_{k−1}z_{k+1} = LC_k + c²LC_{k−1} + c(x_k x_{k−1} − x_{k−2}x_{k+1}) ≥ 0), with neither Newton's inequalities nor Darroch's theorem; hence, if 1 ≤ t ≤ a+b and 6t ≥ 3a+4b+2, then r(t+1) < r(t) (if r(t+1) ≥ r(t), log-concavity gives r(t) ≥ r(t−1), and (R) gives (t+1)r(t) ≤ (3a+4b−5t+2)r(t), so 6t ≤ 3a+4b+1). For P_j take a = 8j, b = 8(m−j)+1, t = L − j; 3p* = 16m + 4 gives 6t − (3a+4b) = 2j − 8, so g_j > 0 for every j with 5 ≤ j ≤ m. (3) Pooled certificate: put m = 3t + 2 (t ≥ 35 ⟺ m ≥ 107 on the class), B = 8m+1 = 24t+17, M = B − L = 8t+7 and R := C(B,L)2^L > 0; every term C(B−a, L−c)2^{L−c} of S_5 := Σ_{j=0}^{5} C(m,j) g_j + τ equals R·2^{−c}·ff(L,c)·[M!/(M−a+c)!]/ff(B,a), with ff the falling factorial and ff(L,−1) = 1/(L+1) (block terms a = 8j, c = j + i − e, 0 ≤ i ≤ 8j, e ∈ {0,1}; tail terms (a,c) = (1,2), (1,0); all factorial arguments nonnegative for t ≥ 4); hence S_5/R = N_5(t)/D_5(t) with D_5(t) = Π_{q=0}^{39}(24t+17−q)·(16t+11)·Π_{q=1}^{5}(8t+7+q) > 0 for t ≥ 1 and N_5 an explicit rational polynomial of degree 50, and all 51 coefficients of N_5(35+u) are strictly positive, so S_5 > 0 for every real t ≥ 35. The pool sets the ascending blocks j = 0, 1, 2 and the ascending tail against the descending blocks j = 3, 4, 5; the pool j ≤ 4 does not suffice (S_4 < 0 at t = 35..44). (4) Composition: i_{p*−2} − i_{p*−1} = S_5 + Σ_{j=6}^{m} C(m,j) g_j > 0 by (3) and (2). No Darroch, no Newton, no M_0 beyond the class endpoint m = 107, and no omitted range. (E) follows from (a) because x is the least strict descent, together with α(T) = 9m + 1 from (1). Companion (face content, not an input): the exact block signs. g_j < 0 (P_j ascends at L − j) exactly for j ∈ {0,1,2}; g_j > 0 for every 3 ≤ j ≤ m; and τ < 0 (the tail ascends). These follow from the tool for j ≥ 5; from its mirror (0 ≤ t, t+1 ≤ a+b and 6t ≤ 3a+4b−6 imply r(t+1) > r(t)) for j = 0, 1 (gaps −8, −6) and the tail (a = 1, b = 8m, t = L − 1, gap −13); and from fixed Taylor-shift certificates of the same construction at t = 35 for j = 2 (all shifted coefficients negative), j = 3 and j = 4 (all positive).
SCOPE: One explicit tree family CB(8,m), m ≥ 107, m ≡ 2 (mod 3), at one rank per tree, p* = (16m+4)/3 (the r31 contract's top sector-deficient rank, not the rank α − 1 of the R26/R29 top-rank keys), and one coefficient pair (indices p* − 2, p* − 1) of I(CB(8,m)). Formal verification [r31 C2; SR-C2-5]: the statement's conclusions (a) and (E) are formally_verified at exactly this scope by r31 award C2-LA1 (governed run lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree; verification report formally_verified; kernel receipt verdict verified on Lean v4.32.2 with Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c, source Main.lean SHA-256 986b525702a5a0d03f205da6ffbe6faf675ef4841473a498b33ef27e70190c9d; axioms exactly propext, Classical.choice and Quot.sound; no sorry, admit, native_decide or decide over an enumeration; informal audit and fidelity audit passed), terminal theorem E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) : (cbGraph m).IsTree ∧ C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) < C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧ C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧ 3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1. Its second conjunct is (a) as the literal strict descent at index p* − 2 of the independent-set counts of the literal tree cbGraph m (the r31 CB(8,m) of record on Fin (17m + 3), labels 0 = r, 1 = s, 2 = v, u_i = 3 + 17i, b_ij = u_i + 1 + 2j, c_ij = u_i + 2 + 2j); its third and fourth conjuncts are eligibility with the carried first-descent definition C5LA1.crossingIndex (the least k with i_{k+1} < i_k, in ℤ) and Mathlib's independence number; α(T) = 9m + 1 enters the formal proof as the carried, kernel-checked lemma E993Transport.cbGraph_indepNum_eq of r31 award C1-LA2. The ℕ-subtractions (16m + 4)/3 − 1 and (16m + 4)/3 − 2 are exact on the class (p* ≥ 572). Formal route: the ℕ closed form I(cbGraph m) = (1+2X)G^m + X(1+X)(1+2X)^{8m} with count = coefficient at every k (vertex split at r, product over the m gadgets), a ring-hom cast to ℤ[X], the block and difference identities of proof step (1), the carried block descent E993Transport.cb8_block_descent_topRank (the terminal of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M) for the blocks 6 ≤ j ≤ m, and proof step (3)'s fixed certificate kernel-checked by positivity over 51 explicit positive integer coefficients after a denominator-free factorial normalization, 2^45·120·L1!·K1!·S_5 = 2^{16u+570}·N0!·Poly(u) with m = 3u + 107 and Poly(u) = 3·2^43·N_5(35 + u), the same certificate as step (3) (isolated second read SR-C2-4, records SR-C2-4-R1 and SR-C2-4-R2). Not covered by the formal grade: the companion block-sign clause at the end of the statement is not a conclusion of that award; it stays a companion, not an input, at its own grades: its part j ≥ 5 is the formally_verified terminal of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M, its parts j = 2, 3, 4 are computer_assisted (fixed certificates), and its parts j ≤ 1 and the tail are proved_informal. The award's face companions (the coefficient form of (a) for the closed-form polynomial, the ℕ closed form with count = coefficient, and the reduction of the SOLUTION-CONTRACT §2 terminal to its fourth conjunct) carry no grade of their own. Hypotheses consumed: m ≡ 2 (mod 3) (integrality of p*, the gap 2j − 8 through 3p* = 16m + 4, and the parametrization m = 3t + 2); m ≥ 107 (in the informal proof only through the certificate endpoint t ≥ 35; in the formal route also through the parametrization m = 3u + 107 and the carried block-descent theorem's hypotheses; the proof says nothing below 107 even though the parent descent holds at the bounded rows m ∈ [86, 104], per this key's [r31 C2; SR-C2-4] note); and the literal CB(8,m). Nothing is asserted at any other rank, for m ≢ 2 (mod 3), for m < 107, for d ≠ 8, for heterogeneous CB patterns or for arbitrary trees, and nothing is asserted about favorability, the weight, the relation, flows or (HALL). Bounded support (bounded_computation, never evidence): the parent descent exact at every class row m ∈ [107, 2600] (C-F3-U, 832 rows; F3, 69 rows beyond 2395; T3, 160 rows to 584; the r30 record to 2395); the block identity against literal-tree dynamic programs at m = 95, 107, 110, 113 (several critics; isolated second read SR-4); the certificate reproduced by C-T3-F, C-T3-U, C-F3-T and C-F3-U (J = 5 and J = 10), by the r31 T and F adjudicators, and by SR-4's own construction (Sturm count 0 on (35, ∞); N_5 proportional to C-T3-F's); the literal descent, x = p* − 2 and 3p* < 2α + 1 at CB(8,125)/668 and CB(8,128)/684 (record R31-C2-SR-C2-5-CB8-125-128-END-TO-END). A composition that uses this key receives this conjunct at formally_verified.
ATTRIBUTION: The block decomposition of the carried closed form and the reduction steps (the block identity, l_j − μ_j = (j − 4)/3, the j = 0 fact): T3 (Claude Sonnet 5; r31 Cycle 1 route C1-T-03). The closed forms of I(CB(d,m)) and α(CB(d,m)) = m(d+1) + 1: r30 (T1, r30 Cycle 6, re-derived by C-T1-F, as registered on the face of E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3). The pooled S_5 / J certificates: C-T3-F and C-T3-U, found independently, and C-F3-T and C-F3-U, found independently (Claude Opus 5.5; r31 Cycle 1 critics), replayed by the r31 T and F adjudicators (Claude Opus 5.5). The two-binomial descent tool (recurrence (R), elementary log-concavity, the closing step) and the block-sign lemma: C-U3-T (Claude Opus 5.5), with the block signs for j ≤ 8 and the tail concordant from C-U3-F (Claude Opus 5.5). The composition (the tool for j ≥ 6 with the pooled S_5): the r31 Cycle 1 synthesis (Claude Opus 5.5). Isolated second read SR-4 (Claude Opus 5.5): own literal-tree DP, own certificate construction with a Sturm cross-check, the rename and the grade. The CB family and the lower-region transport context: Codex (GPT-6), the lower-region run. The first-descent definition C5LA1.crossingIndex: the r30 / first-interior definition layer. Formal verification [r31 C2; SR-C2-5]: r31 award C2-LA1 — formalizer c2-la1-formalizer-opus-20260928, informal reviewer c2-la1-opus-informal-20260928 and fidelity reviewer c2-la1-opus-fidelity-20260928 (all Claude Opus 5.5) — re-authored under attribution from: r31 Cycle 2 route U1 (Claude Sonnet 5, seat C2-U-01; the S_5 object, the block and difference identities and the conditional composition); critic C-U1-T (Claude Opus 5.5; the denominator-free factorial normalization, the positivity certificate and its generator); r31 Cycle 2 route U3 (Claude Sonnet 5, seat C2-U-03; the vertex split); critic C-U3-T (Claude Opus 5.5; the closed-form link, count = coefficient and the crossing-index link); the r31 Cycle 2 U adjudicator (Claude Opus 5.5; the cast bridge and the composition); critic C-U1-F (Claude Opus 5.5; an independent symbolic N_5, not in the proof); the added descent conjunct and the frozen terminal: the r31 Cycle 2 synthesis (Claude Opus 5.5); carried layers: r31 awards C1-LA2 and C1-LA3; isolated second read SR-C2-4 (Claude Opus 5.5; the informal inputs of the award); the grade update: isolated second read SR-C2-5 (Claude Opus 5.5).
FENCES: Grade: formally_verified at exactly the scope above, through the governed award named there; the earlier grade computer_assisted (r31 Cycle 1; ruling R31-N-8; isolated second read SR-4) is superseded, and the informal proof of record (steps (1)–(4)) is unchanged and Darroch- and Newton-free. Newton's inequalities and Darroch's theorem are used nowhere in the proof or in the formal route; they are never applied to I(CB(8,m)), G, G^m or any forest polynomial; E993-TREE-REAL-ROOTED stays REFUTED and is not revived. Census rows are bounded_computation and are not evidence. One rank per tree and the class only. Not (HALL), not a restricted-scope (HALL) theorem, not favorability and not E1: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN, as do TREE, FOREST, TRANSFER, governed beta and Erdős #993, and no status transfers to or from any registered key. The formal grade covers this key's statement only: it transfers to no key that consumes it beyond that conjunct. Struck items are never evidence (T3's tautological identity check and its float "exactly", F3's favorability evidence and mass-ratio labels, U3 §5.6, and every favorability computation at the index p* − 1).
ALIASES: E993-R31-CB-8-TOP-RANK-PARENT-DESCENT-HOLDS-AND-TOP-RANK-IS-ELIGIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107; E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-1; E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3; E993-R31-CB-8-EVERY-M-GE-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-2; E993-R31-CB8-CLASS-PARENT-DESCENT-HOLDS-AT-PSTAR-MINUS-2; r31 C1 (ELIG-top)(a) on the class; CB(8,m) parent descent at rank (16m+4)/3
```

```text
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let m >= 107 be an integer with m ≡ 2 (mod 3), let T = CB(8,m) be the tree with path r – s – v, m chokes u_1..u_m adjacent to r, 8 supports b_i1..b_i8 adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 17m + 3; leafSet(T) = {v} ∪ C with C the 8m private leaves), and put p* := (16m + 4)/3 (an integer exactly when m ≡ 2 (mod 3)) and K := p* − 1. Then (E) p* is eligible: x(T) + 2 <= p* and 3p* < 2α(T) + 1, where x(T) = C5LA1.crossingIndex is the least k with i_{k+1}(T) < i_k(T), computed in the integers through rank α(T), and α(T) = 9m + 1; and (H) with F = F_{p*}(T) the original strict favorable-leaf selector (the leaves w with Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0, on the original tree, fixed at rank p*), which equals leafSet(T), the literal active-tag weighted network at (T, F, p*) — sources I_{p*+1}(T) with supply w_F, targets I_{p*}(T) with capacity w_F, where w_F(B) counts the w ∈ F ∩ B for which B contains another neighbour of w's original support, and arcs the relation (D) ∪ (S) (deletion A = B ∖ {q}; two-for-one switch A = (B ∖ N(u)) ∪ {u} for u ∉ B with |N(u) ∩ B| = 2) — carries an integral flow that saturates every source and loads every target at most its capacity: (HALL) holds at (T, p*), equivalently Σ_{B ∈ X} w_F(B) <= Σ_{A ∈ N(X)} w_F(A) for every X ⊆ I_{p*+1}(T). Proof (an assembly of registered statements, each at its own grade). (E) is the statement of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE: the strict descent i_{p*−1}(T) < i_{p*−2}(T), proved from the binomial block decomposition of I(CB(8,m)), the two-binomial descent tool for the blocks j >= 6 and one fixed degree-50 polynomial positivity certificate pooling the blocks j <= 5 with the tail, gives x(T) <= p* − 2 because x is the least strict descent, and 3p* = 16m + 4 < 18m + 3 = 2α(T) + 1. (H) is the conclusion of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107, whose three hypotheses are discharged on the whole class as follows. (a) F_{p*}(T) = leafSet(T): by E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3 with d = 8 >= 6; since m ≡ 2 (mod 3), dm = 8m ≡ 1 (mod 3), so dm ≢ 2 (mod 3) and its part (ii) applies to every private leaf, its part (i) applies to v, and ⌊(2dm + 4)/3⌋ = (16m + 4)/3 = p* because 16m + 4 ≡ 0 (mod 3). (b) The criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL at (8, m, p*): condition (i), r_q(p* − q) < r_q(p* − q − 1) for every q ∈ [1, m] with r_q(k) = [y^k](1 + y)^{8q−1}(1 + 2y)^{8(m−q)+1}, by that key's [r31 C1; SR-2] scope note (the elementary recurrence, log-concavity and closing-step argument written on the face of the [r31 C1; SR-2] note on E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD, with 6(p* − q − 1) − (3(8q − 1) + 4(8(m − q) + 1)) = 2q + 1); condition (ii), the type-path inequalities, holds identically for all integers a, b >= 0 and j by that key's [r30 C4; SR-C4-6] scope note, hence at a = 8q − 1, b = 8(m − q) + 1, j = p* − q for every q ∈ [1, m]. (c) The allocation of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (θ = 288/(200m² + 82m + 5), σ(γ) = c_γ·θ with (c_1..c_7) = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2), pb and pc from the 72 intercepts of record on that key's face) is nonnegative and satisfies Out (Σ_i Out(β_i, γ_i) >= 1 over every assignment of states to the m chokes with leg total K), In (Σ_i In(β_i, γ_i) <= 1 over every assignment with leg total K − 1), Switch ((8 − γ)·σ(γ) <= θ·γ, γ = 1..7) and Residual (θ <= 1 − ρ_1, ρ_1 = r_1(p* − 1)/r_1(p* − 2)), with Out(β,γ) = β·pb(β,γ) + γ·pc(β,γ) + [β = 1, γ >= 1]·σ(γ) and In(β,γ) = (8 − β − γ)·(pb(β+1,γ) + pc(β,γ+1)) for β + γ <= 7, 0 at β + γ = 8 — the same functions, quantifiers and ρ_1 as in the composition key's hypothesis. The composed flow is the criterion key's deletion flow on the non-sector sources (loading each r-free target with q >= 1 chokes at ρ_q·w_F(A) <= w_F(A)) plus the allocation on the root-plus-arm sector {B : r, v ∈ B} (every member of weight exactly 1), scaled per source; the only targets fed by both parts are the u_i-switch images of weight γ ∈ [1, 7], loaded at most (ρ_1 + θ)·γ <= γ; (HALL-COND) follows by summation, and an integral saturating flow by the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (or finite max-flow integrality). No cutoff M_0 beyond the class endpoint, no omitted range and no asymptotic step.
SCOPE: One explicit tree family, CB(8,m) for every integer m >= 107 with m ≡ 2 (mod 3), at the single rank p* = (16m + 4)/3 per tree (the r31 contract's top sector-deficient rank; not the rank α − 1 of the R26/R29 top-rank keys, which on CB(8,m) is 9m). Consequence on these rows only: S(T, p*) <= 0 by the formally verified E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (FLOW ⇒ SIGN). Grade and dependencies [r31 C2; SR-C2-5] (weakest-input rule; supersedes the r31 Cycle 1 grade computer_assisted and its Darroch/Newton qualifier): proved_informal, with Darroch's theorem and Newton's inequalities used at no node. (E) is formally_verified: it is the statement of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE, formally_verified by r31 award C2-LA1 (governed run lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree; verification report formally_verified; kernel receipt verdict verified on Lean v4.32.2 with Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c, source Main.lean SHA-256 986b525702a5a0d03f205da6ffbe6faf675ef4841473a498b33ef27e70190c9d; axioms exactly propext, Classical.choice and Quot.sound; no sorry, admit, native_decide or decide over an enumeration; informal audit and fidelity audit passed), whose terminal asserts, for every m >= 107 with m % 3 = 2 on the literal tree cbGraph m, that it is a tree, that i_{p*−1} < i_{p*−2}, that C5LA1.crossingIndex (cbGraph m) + 2 <= p*, and that 3p* < 2·indepNum + 1 — exactly (E); the fixed degree-50 positivity certificate that carried the Cycle 1 grade computer_assisted is kernel-checked inside that award. (H) is proved_informal and Darroch- and Newton-free: it is the conclusion of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 (proved_informal), whose three hypotheses are discharged on the whole class as follows. (a) F_{p*}(T) = leafSet(T): by the [r31 C2; SR-C2-1] note on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3 (proved_informal; a second proof of that key's conclusions (i) and (ii) at p* on this class with neither Darroch's theorem nor Newton's inequalities, from that key's closed-form node for I(T − v) and I(T − c_ij) and the kernel-checked two-binomial descent lemma E993Transport.twoBinom_coeff_strictAnti_of_gap), not through that key's full-scope proof. (b) The criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL at (8, m, p*): condition (i) strictly by its [r31 C1; SR-2] note (elementary, Darroch- and Newton-free), condition (ii) by its [r30 C4; SR-C4-6] note; the explicit arc values of its flow at (8, m, p*) are written on its [r31 C2; SR-C2-2] note. (c) The allocation of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (formally_verified at template scope, r31 award C1-LA1), composed with the literal network through the composition key, whose target case split and in-sector tightness are written on its [r31 C2; SR-C2-3] note. The weakest inputs are proved_informal: the composition key, the criterion key with its notes, and hypothesis (a) through the favorability key's closed-form node. Dependency graph (each node at its grade): (E) ← E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE (formally_verified; r31 award C2-LA1, carrying r31 award C1-LA2 for the tree, α(CB(8,m)) = 9m + 1, the low window and C5LA1.crossingIndex, and r31 award C1-LA3 for the block descent 5 <= j <= m); (H) ← the composition key (proved_informal) ← (a) favorability of every leaf at p* on the class (proved_informal, Darroch/Newton-free, [r31 C2; SR-C2-1]; its two closed-form coefficient inequalities over ℤ[X] are formally_verified by r31 award C2-LA2, terminal E993Transport.cb8_leafDeletion_closedForms_descent_topRank, governed run lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent, which is not a statement about cbGraph m; the graph-level link for the private leaves is not formally verified; the leaf set, the tag witness sets W_v = {r}, W_c_ij = {u_i} and the reduction favorableLeaves = leafSet when every leaf is favorable are formally_verified structure, r31 award C1-LA2), (b) the criterion key with its notes (proved_informal; condition (i) at p* is also compiled as the companion E993Transport.cb8_E1_conditionI_topRank of r31 award C1-LA3, no grade of its own), (c) the allocation key (formally_verified at template scope, r31 award C1-LA1), and the companion exists_saturatingFlow_of_weightedHall (formally_verified award companion). Routes not used: the favorability key's full-scope proof (modulo Darroch and Newton) and the discharge of condition (i) through E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD at ⌈μ_1⌉ + 2 = p* ([r30 C6; SR-C6-1], modulo Darroch). Formal status of the SOLUTION-CONTRACT §2 terminal on cbGraph m: its conjuncts 1–3 are formally_verified (r31 award C2-LA1); the kernel-checked companion E993Transport.AdjU.cb8_topRank_of_flow on that award's face (no grade of its own) derives the whole terminal from its fourth conjunct, the saturating flow on cbGraph m, which is not formally verified. Bounded support (bounded_computation, never evidence): the end-to-end checks at CB(8,107)/572, CB(8,110)/588 and CB(8,113)/604 (record R31-C1-SR-5-CB8-110-113-END-TO-END) and at CB(8,125)/668 and CB(8,128)/684 (record R31-C2-SR-C2-5-CB8-125-128-END-TO-END); SR-3's composition test at CB(8,110)/588; the parent descent at every class row m ∈ [107, 2600].
ATTRIBUTION: The Tier 1 target, its class and rank: the r31 charter and contracts (Claude Opus 5.5 controller). The assembly (E) ∧ (H) and its registration proposal: the r31 Cycle 1 synthesis (Claude Opus 5.5); the assembly read, the rename, the grade and the fresh-row end-to-end checks: isolated second read SR-5 (Claude Opus 5.5). (E): as on the face of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE — T3 (Claude Sonnet 5; the block decomposition), C-T3-F, C-T3-U, C-F3-T, C-F3-U (Claude Opus 5.5; the pooled certificates), C-U3-T (Claude Opus 5.5; the descent tool), the r31 T and F adjudicators, the r31 Cycle 1 synthesis (the composition), SR-4 (Claude Opus 5.5); the closed forms and α of CB(d,m): r30 (T1, r30 Cycle 6, as registered on the favorability key). (H): as on the face of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 — U2 (Claude Sonnet 5; origin), C-U2-T and C-U2-F (Claude Opus 5.5; repairs), the r31 Cycle 1 U adjudicator, SR-3 (Claude Opus 5.5), with r30's structural argument and composition (r30 T2, Claude Sonnet 5; C-T2-F, C-T2-U and SR-C6-2, Claude Opus 5.5) and the choke-local sector certificate method (C-T1-U, r30 Cycle 4; its r30 Cycle 5 T2 generalization). The allocation: r31 T1 (Claude Sonnet 5; seat of origin), with the proof confirmed by C-T1-F, C-T1-U and the r31 T adjudicator and the Residual by C-T1-F, C-T1-U, C-F1-T, C-F2-T and C-F2-U (Claude Opus 5.5), and SR-1 (Claude Opus 5.5). Condition (i) at p*: C-U3-T (Claude Opus 5.5), U3 (Claude Sonnet 5; q = 1), C-U3-F (corroboration), the r31 U adjudicator, SR-2 (Claude Opus 5.5). The favorability key, the criterion key and its CD-2 note, the threshold key, r_q and ρ_q: r30 as registered on their faces (C-T1-F, C-T1-U, T1, the r30 adjudicators; SR-C3-3, SR-C4-6, SR-C5-4, SR-C6-1). E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE and its companion: its authors as on its face. Lean awards of r31 Cycle 1 (formally_verified at their own scopes, cited as nodes): C1-LA1 (c1-la1-formalizer-opus-20260928), C1-LA2 (c1-la2-formalizer-opus-20260928; with the r31 U1, C-U1-T and C-U1-F layer), C1-LA3 (c1-la3-formalizer-opus-20260928), all Claude Opus 5.5. The transport network, the active-tag weight, the relation (D) ∪ (S), (HALL) and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; the definition layer (C5LA1.crossingIndex and the counts): the first-interior run (Codex) and r24–r26. Classical: J. N. Darroch (1964) and Newton's inequalities, inside the favorability key only. Cycle 2 additions [r31 C2; SR-C2-5]: (E) formally — r31 award C2-LA1 (formalizer c2-la1-formalizer-opus-20260928, informal reviewer c2-la1-opus-informal-20260928, fidelity reviewer c2-la1-opus-fidelity-20260928, all Claude Opus 5.5), from r31 Cycle 2 route U1 (Claude Sonnet 5, seat C2-U-01), critic C-U1-T (Claude Opus 5.5; the factorial normalization), r31 Cycle 2 route U3 (Claude Sonnet 5, seat C2-U-03; the vertex split), critic C-U3-T (Claude Opus 5.5; the closed-form link), the r31 Cycle 2 U adjudicator (Claude Opus 5.5; the cast bridge and composition) and critic C-U1-F (Claude Opus 5.5; an independent N_5), with isolated second read SR-C2-4; the Darroch/Newton-free favorability at p* — r31 Cycle 2 route T1 (Claude Sonnet 5; the arm leaf) and r31 Cycle 2 critics C-F2-U, C-T2-F, C-T2-U and C-F2-T (Claude Opus 5.5; the private leaf), with compiled closed-form scratch by r31 Cycle 2 critics C-T1-F, C-T1-U and C-F2-U, the formal closed-form award r31 C2-LA2 (formalizer c2-la2-formalizer-opus-20260928, informal reviewer c2-la2-opus-informal-20260928, fidelity reviewer c2-la2-opus-fidelity-20260928, all Claude Opus 5.5) and isolated second read SR-C2-1; the explicit arc values of the criterion flow — r31 Cycle 2 route T3 (Claude Sonnet 5), critics C-T3-F, C-T3-U, C-F3-T and C-F3-U and the r31 Cycle 2 T adjudicator (Claude Opus 5.5), with isolated second read SR-C2-2; the written target case split and in-sector tightness — critics C-F3-U, C-F3-T and C-F1-T and the r31 Cycle 2 F adjudicator (Claude Opus 5.5), with isolated second read SR-C2-3; the Cycle 2 assembly and grade proposal — the r31 Cycle 2 synthesis (Claude Opus 5.5); the assembly re-read, the grade and the fresh-row checks at m = 125 and 128 — isolated second read SR-C2-5 (Claude Opus 5.5).
FENCES: Not decisive (SOLUTION-CONTRACT §5): this key is proved_informal, and decisive event (a) needs the whole terminal formally_verified, whose fourth conjunct is not; the r31 awards C1-LA1, C1-LA2, C1-LA3, C2-LA1 and C2-LA2 are formally_verified only at their own scopes (template arithmetic, the CB(8,m) structural layer, one block-descent node, (E) on the literal tree, and two closed-form coefficient inequalities over ℤ[X]). One rank per tree and the class only: nothing at any other rank of CB(8,m), at m ≡ 0 or 1 (mod 3), at m < 107, for d ≠ 8, for heterogeneous CB patterns or for arbitrary trees; never promoted to every eligible rank. No status transfer: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL ((HALL) at full scope) stays OPEN; E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta (E993-BETA-AGG) and Erdős #993 stay OPEN; S(T, p*) <= 0 is asserted on these rows only (FLOW ⇒ SIGN) and transfers to no aggregate key. The grade of E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3 at its full scope (proved_informal modulo Darroch and Newton) is unchanged; nothing here upgrades it. Darroch's theorem and Newton's inequalities are used at no node of this key and are never applied to I(CB(8,m)), G, G^m or any forest polynomial; E993-TREE-REAL-ROOTED stays REFUTED and is not revived. No refuted mechanism is revived: literal (D) ∪ (S), literal w_F and the fixed original selector; not deletion-only (the root-plus-arm sector is deletion-deficient by p*/(p* − 1) and switch arcs carry load), not per-leaf injectivity, own-support unit capacity or occupancy domination, not the m-independent per-choke certificate. The template-to-network step is the composition key's proved reduction; the affine separation, LP optimality and the conjectured θ* law 288/(200m² + 82m + 5) as an LP optimum are not hypotheses (the allocation is one feasible table among at least three). Census values, the bounded rows and every favorability computation at the index p* − 1 are not evidence. Not an alias, edit, extension or upgrade of E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS or E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, whose sealed statements are unchanged (distinction rows). Nothing here is a cut or refutes anything. No RTree or governed-model assertion.
ALIASES: E993-R31-CB-8-TOP-RANK-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL-ON-THE-RESIDUE-2-CLASS-FROM-107; r31 Tier 1 on the residue-2 class from 107; CB(8,m) eligibility and weighted Hall at rank (16m+4)/3; r31 C1 R-5
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r31 C2; SR-C2-5] At the single rank p* = (16m + 4)/3 of CB(8,m), for every integer m >= 107 with m ≡ 2 (mod 3): E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL now stands at proved_informal with no dependency on Darroch's theorem or Newton's inequalities, its eligibility conjunct formally_verified (r31 award C2-LA1) and its Hall conjunct proved_informal; this supersedes the grade stated in this key's [r31 C1; SR-5] note (computer_assisted, with the Hall conjunct modulo Darroch and Newton). One rank per tree on one residue class of one family; nothing at other ranks of these trees or on any other tree. This key stays OPEN; its statement, status and fences are unchanged, and no status transfers.
```

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
TEXT: [r31 C2; SR-C2-5] E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL now discharges its hypothesis F_{p*} = leafSet on CB(8,m), m >= 107, m ≡ 2 (mod 3), through this key's [r31 C2; SR-C2-1] note (Darroch- and Newton-free, proved_informal), not through this key's full-scope proof; the statement of this key's [r31 C1; SR-5] note that this key is the sole input through which Darroch's theorem and Newton's inequalities enter that key is therefore superseded: no such dependency remains in it. This key's statement, grade at full scope (proved_informal modulo Darroch and Newton) and fences are unchanged; nothing transfers to other ranks, residues, values of d or any other key.
```

```text
RECORD: R31-C2-SR-C2-5-CB8-125-128-END-TO-END
CLAIM: With SR-C2-5's own exact instruments (the literal CB(8,m) tree from the frozen labels, tested for connectivity, acyclicity and |E| = n − 1; a rooted independence DP with forcing; exact path-update deletions at the root, cross-checked against full literal DPs and the closed forms of I(T − v), I(T − c_ij) at four leaves per row; a set-based active-tag weighted layer DP that never uses the per-tag decomposition; all validated by brute force on 22 small trees, 975 checks, 0 failures, and by a four-mutant run, every mutant detected), at (CB(8,m), p*): CB(8,128)/684: (n, α, x) = (2179, 1153, 682), 3p* = 2052 < 2307 = 2α + 1, i_{p*−1} < i_{p*−2}; all 1025 leaves derived favorable (Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0; 488 digits); (WID) supply − capacity = S(T, p*) < 0 (489 digits) from the set-based weighted DP against Σ_F [q_w(p*) − q_w(p* − 1)], with supply = Σ_F q_w(p*) and capacity = Σ_F q_w(p* − 1); ρ_1 = 25247668247805897/25340326629755188 = max_q ρ_q; θ = 96/1095767, margin (1 − ρ_1)/θ = 41.74; min Σ Out = 1, max Σ In = 1; switch-image load/capacity at most 0.996431; composed flow value = total source weight = 491 digits, leading 74730846855903638945; CB(8,125)/668: (n, α, x) = (2128, 1126, 666), 3p* = 2004 < 2253 = 2α + 1, i_{p*−1} < i_{p*−2}; all 1001 leaves derived favorable (Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0; 477 digits); (WID) supply − capacity = S(T, p*) < 0 (478 digits) from the set-based weighted DP against Σ_F [q_w(p*) − q_w(p* − 1)], with supply = Σ_F q_w(p*) and capacity = Σ_F q_w(p* − 1); ρ_1 = 125082229581739/125552319952916 = max_q ρ_q; θ = 96/1045085, margin (1 − ρ_1)/θ = 40.76; min Σ Out = 1, max Σ In = 1; switch-image load/capacity at most 0.996348; composed flow value = total source weight = 480 digits, leading 23312513260142754019; control CB(8,107)/572: (n, α, x) = (1822, 964, 570), 3p* = 1716 < 1929 = 2α + 1, i_{p*−1} < i_{p*−2}; all 857 leaves derived favorable (Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0; 408 digits); (WID) supply − capacity = S(T, p*) < 0 (409 digits) from the set-based weighted DP against Σ_F [q_w(p*) − q_w(p* − 1)], with supply = Σ_F q_w(p*) and capacity = Σ_F q_w(p* − 1); ρ_1 = 5150844596024699/5173467627355748 = max_q ρ_q; θ = 96/766193, margin (1 − ρ_1)/θ = 34.90; min Σ Out = 1, max Σ In = 1; switch-image load/capacity at most 0.995752; composed flow value = total source weight = 411 digits, leading 21342359875496580466 (the contract's fixed points reproduced). At each row: I(T) equals the closed form; the class decomposition of source and target weight at k = p*, p* + 1 (sector count 2^{k−2}C(8m, k−2) with weight equal to count, r-without-v weight identically 0, r-free weight Σ_q 8q·C(m,q)·r_q(k − q − 1)); the criterion's condition (i) strict at every q with ρ_q strictly decreasing; the allocation of record parsed from the formally verified C1-LA1 source: nonnegative, Switch tight at γ = 1..6, Residual; the composed flow (the criterion key's non-sector flow plus the scaled sector allocation) has value exactly equal to the total source weight, so max-flow = total source weight and there is no deficient cut. Sampled literal laboratory at m = 128 and 125 (30 sector sources with 21331 and 20825 literal arcs; 9 in-sector targets with 6236 and 6070 enumerated preimages, including the profile (1,4)^{(2m+2)/3}(1,5)^{(m−2)/3} with load exactly 1 after scaling; 24 switch images γ = 0..7 with exactly 8 − γ sector preimages each; 6 other targets with sector load 0): 0 failures. A literal whole-network max-flow is infeasible at these sizes; feasibility at non-enumerated targets rests on the composition key's reduction.
STATUS: bounded_computation
PROVENANCE: Isolated second read SR-C2-5 (Claude Opus 5.5), own instruments under scratchpad/c2-sr-SR-C2-5/: sr25lib.py (b7cc332c62e5bfe892f73c67a67db4a3dcd140bb66b3c03418e0c3bf8cb553b2), sr25_selftest.py (9b51fb87bfb94823fcc2255982c4744c8215e4050bb194e1268f770e9b10aa0b; selftest_out.json b2792ed13e751e2a818d62ebf43a56065618056f5e42afa82640f34255bff881), mutant_check.py (726c01d5dd452f961b6b801fc7f9125cc2560c2de39b0df3881aa2840139baa2; mutant_out.json 00b768b064fb648f12bf225fc90e1469b50440e3eeefe4f652781af0785b45f7), sr25_row.py (76e0165ba73ea44b6c62b0dec2d9aa95a6789110d17008310d07b2adfb9a58d3; row_107.json 2b622311f59283a2546bf56e9fad97af70e250f5e6fbdea964514720f03ae3b1, row_125.json 41c53affe5b01060fa36e73b84bff1d88a94edd0ab678fec0cdeb249b4438205, row_128.json 6b8a8eb9a5a6d05f5a5ed7692ae9ec97b5b2b9bf1dd6aac950faae6d902bf2fd), sr25_lab.py (6e95bb45ea4d3f468acc4ed7ff1057744cabacd1aa2fef694db8072400fedddd; lab_125.json fcb2961f0e9aa55a5335d470e3992647f975a0149adc10c16c28cd0331c679c1, lab_128.json 7adfc85b4f114499292c8f0dd38482abe665737e6c701a45c1b17b3104370cca); Python standard library, exact integers and Fraction. Support only, never evidence in a proof.
```

No distinction row is needed: no new key is proposed. The existing rows R31-C1-SR-5-D1..D5 and SR-4's rows remain accurate. Only the
grades they quote are superseded, and the updated faces carry the new grades.

## Verdicts

verdict[SR-C2-5a]: confirmed_with_repairs
verdict[SR-C2-5b]: confirmed
verdict[SR-C2-5c]: confirmed_with_repairs

- **SR-C2-5a.** C2-LA1's terminal is (E) plus the parent descent on the literal tree, so (E) is `formally_verified`.
  - (H) is `proved_informal` through the composition key. Its hypotheses are discharged by the `[r31 C2; SR-C2-1]` favorability note, the
    criterion key with its `[r31 C1; SR-2]` and `[r30 C4; SR-C4-6]` notes, and the allocation key (FV at template scope).
  - No node depends on Darroch or Newton.
  - Tier 1 moves from `computer_assisted` to **`proved_informal`** (G-2 confirmed). It is **not decisive**: conjunct 4 is not formal.
  - The repairs are the sequencing (after G-1 and the SR-C2-1 note), the explicit DAG on the face, and the two superseded Cycle 1 notes.
- **SR-C2-5b.** At `m = 128` and `m = 125`, with control `m = 107`:
  - `x = p* − 2` and `3p* < 2α+1`;
  - every leaf is favorable at the index of record;
  - (WID) holds from two sides;
  - the composed flow's value equals the total source weight exactly, so max-flow = source weight and there is no cut;
  - the sampled literal laboratory has 0 failures.

  Bounded only.
- **SR-C2-5c.** Both updates are given verbatim above.
  - Eligibility key: `formally_verified` via C2-LA1, statement unchanged. The block-sign companion is fenced out of the formal grade, and
    the formal route and award identity are on the face.
  - Tier 1 key: `proved_informal`, statement unchanged, with the new DAG and the added attribution. The fences say not decisive, and that
    (HALL) at full scope, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN.
  - Both keys are alias-clear in all three registries.

Seal verified: `e45c58113bb0b65234abfa84cd175781d6e5c68e629952e7503cf9bbe863b970` (MATCH; 1,837/1,837 members).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-sr-SR-C2-5/`. Everything uses
the Python standard library only and runs in the foreground as `python3 -B`. To replay, `cd` into the scratch root and run the command in
the Role column.

| File | SHA-256 | Role |
|---|---|---|
| `alias.json` | `ca08bbbbef9e899bfa62219568b7c984855e104650ae777f6c6d19ebc8734020` | 0 alias-string or pattern hits; the exact hits are the keys themselves (run-local only) |
| `alias_face.txt` | `d2dbe1f838ca98e404cf50480295b0c69c98bd07c0ae60f5466a4b5276cf009c` | 18 face hits (6 per registry); every one is a citation by KEY or fence boilerplate |
| `assemble.py` | `3d746ec80fbddd91cf8b154fbac9c9287c9429bc6de65894fe525f4a1bca9d78` | Assembles this file from the template and `reg_texts.txt`. `python3 -B assemble.py` |
| `dag_keys.json` | `fd8a90096ad156e191847645d2e617e89fba778c1e1fa75a861bc2f6717daa5b` | Output of `sr25_dag_keys.py` |
| `keys_face.txt` | `2204309eda915a9d477e66ea1587edfd9b64aac964695022d1854cb969b10f8c` | Registry faces of the eligibility and Tier 1 keys (extract from the snapshot) |
| `lab_125.json` | `fcb2961f0e9aa55a5335d470e3992647f975a0149adc10c16c28cd0331c679c1` | `ALL_PASS` true, 0 failures |
| `lab_125.log` | `fd9c0cd67475e03c77de3a5056029465265879c83f0d767b708df7ffbf52efb0` | stdout of the 125 lab |
| `lab_128.json` | `7adfc85b4f114499292c8f0dd38482abe665737e6c701a45c1b17b3104370cca` | `ALL_PASS` true, 0 failures |
| `lab_128.log` | `9aa7930760b43a95a2f15eb03fa6a53f2f309888753667578ed4791d329f3362` | stdout of the 128 lab |
| `lean_token_scan.json` | `02d2c3ec8d18bf12b2ab6e6b34880d79b8cedddc10a06b1d2e565a4a584cfcd3` | 0 `sorry`/`admit`/`native_decide`/`decide`/`axiom` tokens in either source |
| `lean_token_scan.py` | `66721cfb3d352003889243e0a698018c110526fe522e5b0ae0e7301929018839` | Token scan (comments stripped) of the C2-LA1 and C2-LA2 sources. `python3 -B lean_token_scan.py` |
| `mutant_check.py` | `726c01d5dd452f961b6b801fc7f9125cc2560c2de39b0df3881aa2840139baa2` | Four mutants of `sr25lib.py`, each detected. `python3 -B mutant_check.py` |
| `mutant_out.json` | `00b768b064fb648f12bf225fc90e1469b50440e3eeefe4f652781af0785b45f7` | All four mutants detected |
| `reg_texts.txt` | `605976098326891a68c3f40726e2c92a316c4cc239ee3b73a3dae4c30079385d` | The registration blocks and record claim (the source of `## Registration text`) |
| `row_107.json` | `2b622311f59283a2546bf56e9fad97af70e250f5e6fbdea964514720f03ae3b1` | Control row: fixed points reproduced; `all_checks_true` |
| `row_107.log` | `f00a6416f7ca63ea0cdd1d7c64903f75bda08869a826e25ab655892bdc6daa56` | stdout of the 107 run |
| `row_125.json` | `41c53affe5b01060fa36e73b84bff1d88a94edd0ab678fec0cdeb249b4438205` | Fresh row 125: `all_checks_true` |
| `row_125.log` | `9da62a099d68b0f5381e183fe33600eb5d6f963b82f9881fcfe1e6b8e0c8648d` | stdout of the 125 run |
| `row_128.json` | `6b8a8eb9a5a6d05f5a5ed7692ae9ec97b5b2b9bf1dd6aac950faae6d902bf2fd` | Fresh row 128: `all_checks_true` |
| `row_128.log` | `13d20d32d6d0d05fbf95b5826e428648c19343ea2939668f03a26c5ea8e26865` | stdout of the 128 run |
| `seal_check.py` | `80f21136cca478b3e464cc4b50dfe5e28e30fc4a5980da07ce4996be5ea18728` | Capsule seal and 1,837 member digests. `python3 -B seal_check.py` (run from the run root) |
| `second_read_template.md` | `4b048f86bca357d0b95d8ed43d1e575c11648b32a2ff4bf859c50b04ebe21739` | Template of this file |
| `selftest_out.json` | `b2792ed13e751e2a818d62ebf43a56065618056f5e42afa82640f34255bff881` | 975 checks, 0 failures |
| `sr25_alias.py` | `30f8a800c3302e78f1c2f02e33d3d04a09d1941b90cf3a94d67ca90cef151c72` | Alias check of both keys in all three registries, plus a whole-face `alias_patterns` scan. `python3 -B sr25_alias.py` |
| `sr25_dag_keys.py` | `cfa51b822f569bd11403f8943e94f1736cf9658cfdd6bd349730bf1010a3083e` | Grades, status and Darroch/Newton mention counts of every DAG node key. `python3 -B scratchpad/c2-sr-SR-C2-5/sr25_dag_keys.py` (from the run root) |
| `sr25_lab.py` | `6e95bb45ea4d3f468acc4ed7ff1057744cabacd1aa2fef694db8072400fedddd` | Sampled literal laboratory. `python3 -B sr25_lab.py 128` (about 9 s per row) |
| `sr25_regtext.py` | `9f31d9c645a4d2c06182ea091ca63f870dc1a4cf8bbf96b7cf8c98b1d9d19727` | Composes the registration blocks, copying registered statements verbatim from the snapshot. `python3 -B sr25_regtext.py` |
| `sr25_row.py` | `76e0165ba73ea44b6c62b0dec2d9aa95a6789110d17008310d07b2adfb9a58d3` | Row check. `python3 -B sr25_row.py 128` (about 11 s per row) |
| `sr25_selftest.py` | `9b51fb87bfb94823fcc2255982c4744c8215e4050bb194e1268f770e9b10aa0b` | Brute-force validation on 22 small trees. `python3 -B sr25_selftest.py` |
| `sr25lib.py` | `b7cc332c62e5bfe892f73c67a67db4a3dcd140bb66b3c03418e0c3bf8cb553b2` | Literal CB builder and tree tests; independence DP with forcing; exact division; set-based weighted DP; closed forms; `r_q`; C1-LA1 allocation parser; exact extremal-assignment DP |
| `srcdig_check.py` | `912ee101a93d63d6f5708c688791681b4f24ba0b124311caf685d5d973e27e4d` | Every `sources/` member against its directory's `SOURCE-DIGESTS.json`: 0 mismatches |

The only file written outside the scratch root is this `SECOND-READ.md`. No background job was started. This file was reread before close.
