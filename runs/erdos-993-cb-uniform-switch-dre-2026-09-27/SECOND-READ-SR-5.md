# Second Read

Isolated second read **SR-5**, r31 Cycle 1 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): the Tier 1 assembly. It checks
eligibility and (HALL) on the literal network at `p* = (16m+4)/3` for `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)` (synthesis R-5).
Written 2026-09-28.

**Boot acknowledgment.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file.
- My first combined print failed on a zsh `=====` separator.
- The tool display truncated the middle of `verity.md`, and I first printed only lines 1–150 of the startup protocol.
- I read the remaining spans of both files before writing any finding.

Subsystems loaded: the constitution and the startup protocol only. The controller owns conversation logging and durable updates.
This read writes only this file and scratch under `scratchpad/c1-sr-SR-5/`.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C1-SECOND-READ-PROTOCOL.md`: SHA-256 `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`.
  **MATCH.** I checked it before reading the file.
- **Brief** `control/C1-SECOND-READ-BRIEF-SR-5.md`: SHA-256 `b2837d803c1d581b2dea3527f9956b328a86fce58d23282e113d6f53754bec03`.
  **MATCH.** I checked it before reading the file.
- **Capsule** `control/c1-second-read/SR-5-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-5`, 143 members.
  - I recomputed the seal as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with separators
    `(",", ":")` and no trailing newline:
    **`ce8c702c582616bfc2568d5d3cdb0bb024126828fde603a26e37afb0e007b356`. MATCH** with the dispatch value (`seal_check.py`).
  - **143/143** members match both byte count and SHA-256.
  - The file's own SHA-256 is `a2d654ab…7366`. That is a file digest, not the seal.
- **Sources.** All **65/65** capsule members under `sources/` match `sources/SOURCE-DIGESTS.json` (`sources_digest_check.txt`).
  - `sources/c1-stage7-sources/SOURCE-DIGESTS.json` is the only capsule member under that directory. I read no frozen instrument there,
    so no per-file check was due.
- **Registries.** The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and the frozen master
  `sources/authority/CLAIM-IDENTITY.json` are byte-identical: both SHA-256 `b4a339ef…470b`, 491 claims each. I ran the alias check
  against both anyway.
- **Stage 7 awards** (capsule members, read only): C1-LA1, C1-LA2 and C1-LA3.
  - Each `VERIFICATION-REPORT.md` reads `formally_verified`, with every check passed.
  - Each `RECEIPTS/kernel-verification.json` reads `verdict.code verified`, with axiom policy `propext`, `Classical.choice`,
    `Quot.sound`.
  - The receipts name an `EVIDENCE/axioms.txt` path, which is not a capsule member. I did not read it.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch them, did not use them,
     and wrote no conversation log, because the protocol confines my writes.
  2. The harness saved two oversized tool outputs to its own tool-results folder, outside the run root, and I read both back. Both
     held only capsule-member text:
     - my first print of the brief together with the manifest;
     - my print of `cycles/cycle-1/stage6/SYNTHESIS.md`.
  3. **Listings and globs outside the capsule.**
     - A shell glob `runs/lean-2026-09-28-c1-la*` expanded to the three capsule run directories, names only.
     - One `ls -1` of my own scratch, for the inventory.
     - One `ls -l /dev/null` (see item 4).
     - `mkdir -p` created `scratchpad/c1-sr-SR-5/` and `second-reads/SR-5/`.
     - A name-scoped `pgrep -fl c1-sr-SR-5` matched nothing.
  4. **Stray command.** One helper command line ended with `rm -f /dev/null 2>/dev/null`, a typing slip. It had no effect: the device
     is root-owned. I confirmed it intact with `ls -l /dev/null`. No file of the run or of the system was removed.
  5. I read no return, critique, scratch or other experiment root. The capsule holds the three Stage 5 adjudications, but the
     assembly needed none of them, so I did not read them.
  6. I made no Mathlib access, ran no `lake` or `lean`, used no network and installed nothing.
  7. Every computation was foreground `python3 -B`, standard library only, with exact integers and `Fraction`. No job ran in the
     background and I killed nothing.
- **Instruments.** All of them are my own and live in my scratch.
  - I used no seat code, no controller replay and no frozen census value as evidence.
  - The allocation of record was parsed from the formally verified C1-LA1 source (`cb8Bpb`, `cb8Bpc`, `cb8CGamma`).
    It was checked cell by cell against the 72 intercepts written on SR-1's registration face: equal.

## Statements read

Statement of record: `cycles/cycle-1/stage6/SYNTHESIS.md`, which I read in full, in particular:
- `## Exact established results`: S1–S9 and the imported keys;
- `## Registrations`: R-5;
- `## Refuted or narrowed mechanisms`;
- `## Headline verdicts`.

I also read:
- the four completed reads `second-reads/SR-{1,2,3,4}/SECOND-READ.md`: their verdicts, registration texts and findings, and their
  derivations where they discharge a hypothesis of the composition;
- `second-reads/SR-6/SECOND-READ.md`, for context only;
- the three Stage 7 awards: `THEOREM-CONTRACT.yaml` (C1-LA3 terminal), `VERIFICATION-REPORT.md`, `RECEIPTS/kernel-verification.json`,
  and the terminal and definition text of `LeanProject/LeanProof/Main.lean`;
- `cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`;
- the controller facts CF6-1..7 and the frozen notes snapshot (R31-N-1..9, R31-E-b, R31-E-c), as facts and rulings, never evidence;
- the lexical pre-screen, which is not my verdict;
- both contracts and r30's `SEMANTIC-CONTRACT.md` §1.1–1.2, for the definitions of `S`, `w_F`, (WID), (REL) and (HALL);
- the registry faces of the favorability key, the criterion key (with its scope notes, including CD-2 `[r30 C4; SR-C4-6]`), the r30
  row keys `…CB-8-M-95-TO-107…` and `…FIVE-CB…`, `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, the primary aggregate,
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` and `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`.

The three statements under read, with one verdict each:
- **SR-5a.** Every hypothesis of the composition is discharged. This asks for the dependency graph of (E) ∧ (H) with each node's
  grade and source, the conjunction's grade by the weakest-input rule, a ruling on R31-N-8's consequence, and whether (H) alone stands
  at `proved_informal` modulo the favorability key.
- **SR-5b.** A fresh-row end-to-end check at `m = 110` and `m = 113` with my own exact instruments.
- **SR-5c.** Naming and registration of R-5.

## Independent re-derivation

### SR-5a. The hypotheses of the composition and their discharge

The composition is the SR-3 key
`E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
(S3 as repaired). Its hypotheses are (a), (b)(i), (b)(ii) and (c), plus the inputs it imports. I re-read its face against the
contracts and took each hypothesis in turn.

**(H1) `F_{p*}(T) = leafSet(T)`.** Discharged by the favorability key
`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, and **only** by it. Its face gives:
- (i) `Δ_{p*}(T−v) < 0` for every `m ≥ 1`, with `d ≥ 6`;
- (ii) `Δ_{p*}(T−c) < 0` for every private leaf `c` when `dm ≢ 2 (mod 3)`;
- the leaf set `{v} ∪ C`.

Residue arithmetic, by hand:
- `d = 8 ≥ 6`.
- `m ≡ 2 (mod 3)` gives `8m ≡ 16 ≡ 1 (mod 3)`. So `dm ≢ 2` and (ii) applies. The key's own gloss agrees: "d = 8 with m ≢ 1 (mod 3)".
- `2dm + 4 = 16m + 4 ≡ m + 1 ≡ 0 (mod 3)`. So `⌊(2dm+4)/3⌋ = (16m+4)/3 = p*` and `ε = 0`.
- The paired block's margin is `p* − μ(Π) = (3 − 2ε)/6 = 1/2 > 0`. Directly: `(16m+4)/3 − (16m/3 + 5/6) = 1/2`.

Grade: `proved_informal` modulo Darroch (1964) and Newton's inequalities, both applied only to products of linear factors. This is
the **only** Darroch/Newton dependency anywhere in the assembled chain. The selector is derived, not assumed: the key proves the
strict descents that define `F_{p*}`.

Structural parts are formally verified in C1-LA2 (structure only; no favorability):
- `mem_leafSet_cbGraph_iff` and `cb_leafSet_card` (`8m+1` leaves);
- `favorableLeaves_eq_leafSet_of_all` (the reduction "every leaf favorable ⇒ `F = leafSet`").

**(H2) The criterion's condition (i), `r_q(p*−q) ≤ r_q(p*−q−1)` for every `q ∈ [1,m]`.**
- **Route of record: SR-2**, Darroch- and Newton-free, strict, at `p*` on the class, registered as the two `[r31 C1; SR-2]` scope
  notes on the criterion and threshold keys (`proved_informal`).
  - I re-checked the instance arithmetic: `a = 8q−1`, `b = 8(m−q)+1` and `t = p*−q−1` give `6t − (3a+4b) = 2q+1`, so
    `6t − (3a+4b+2) = 2q−1 ≥ 1`.
  - Also `(13m+1)/3 ≤ t ≤ (16m−2)/3 < 8m = a+b`.
- **Second route:** the threshold key with its `[r30 C6; SR-C6-1]` note. It is `proved_informal` modulo Darroch.
  - With `m = 3t'+2`: `μ_1 = (32m−7)/6 = 16t' + 19/2`, `⌈μ_1⌉ + 2 = 16t' + 12 = p*`. Exactly at the threshold.
  - The route of record does not use it.
- **Formal companion:** C1-LA3's `cb8_E1_conditionI_topRank` is compiled on the face of a `formally_verified` award. As a companion
  it has no grade of its own and is cited as corroborating only.

**(H2') The criterion's condition (ii), the type-path inequalities at `p*`.** Discharged by the criterion key's scope note CD-2
`[r30 C4; SR-C4-6]` (`proved_informal`, elementary, no import).
- CD-2 is stated for **all integers** `a ≥ 0`, `b ≥ 0` and `j`, and every `α ∈ [0,a]`.
- At `p*` on the class, `a_q = 8q−1 ≥ 7`, `b_q = 8(m−q)+1 ≥ 1` and `j = p*−q ∈ ℤ` fall inside it for every `q ∈ [1,m]`.
- **No gap.** Given CD-2, the criterion at `(8, m, p*)` is exactly condition (i).
- I also checked (ii) directly at `m = 107, 110, 113`, at every `q` and every `α`, 0 failures. This is bounded, not evidence.

**(H3) The allocation: nonnegativity, Out, In, Switch, Residual.** Discharged by SR-1's key
`E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`
(`proved_informal`, Darroch/Newton-free). It is also `formally_verified` at template scope as
`E993Transport.cb8_topRank_sectorTemplate_feasible` (award C1-LA1).

**Interface check.** The functions on SR-1's face, in C1-LA1's Lean text and in the composition's hypothesis (c) are the same:
- `Out(β,γ) = β·pb + γ·pc + [β=1, γ≥1]·σ(γ)`;
- `In(β,γ) = (8−β−γ)(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and 0 at `β+γ = 8`;
- quantification over every assignment `Fin m → State8` with leg total `K = (16m+1)/3 = p*−1` for Out and `K−1` for In;
- Switch `(8−γ)σ(γ) ≤ θγ` for `γ = 1..7`;
- Residual `θ ≤ 1 − r_1(K)/r_1(K−1)`, with `r_1(k) = Σ_{i≤min(7,k)} C(7,i)C(8m−7,k−i)2^{k−i}`. This is `1 − ρ_1` with
  `ρ_1 = r_1(p*−1)/r_1(p*−2)`, the criterion key's own `q = 1` ratio (`a_1 = 7`, `b_1 = 8m−7`, `j = p*−1`);
- nonnegativity of `pb` for `β ≥ 1`, of `pc` for `γ ≥ 1` (from `m ≥ 689/200`), and of `σ`.

No affine separation, LP optimality or `θ*` law enters, and the in-class scope is identical.

**Hypotheses SR-3 made explicit in repair, with their discharge:**
- `C ⊆ F` (the criterion key's hypothesis, and the capacity `w_F = γ` of a `u_i`-switch image) and `v ∈ F` (weight exactly 1 for
  sector sources and in-sector targets). Both follow from (H1).
- The tag witness sets `W_v = {r}` and `W_{c_ij} = {u_i}`. Structural, from the literal tree; formally verified as
  `mem_cb_tagWitnesses_v_iff` and `mem_cb_tagWitnesses_leaf_iff` (C1-LA2).
- The shared-capacity inequality at the only doubly-fed targets, the `u_i`-switch images of weight `γ ∈ [1,7]`:
  `ρ_1γ + (8−γ)σ(γ) ≤ (ρ_1+θ)γ ≤ γ`. By Switch and Residual (H3).
- The `8−γ` sector-preimage count and the in-sector preimage census, which make In the capacity bound. These are proof content of
  the composition, not hypotheses.

**Imported inside the composition:**
- the criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`; its proof
  uses neither Darroch nor Newton; its (BNM) side route is excluded on its face);
- the elementary summation "rational flow ⇒ (HALL-COND)", which has no key;
- "(HALL-COND) ⇒ integral saturating flow": the companion `exists_saturatingFlow_of_weightedHall` on the face of the formally
  verified `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`, or finite max-flow integrality.

**(E), eligibility.** Discharged by SR-4's key
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
(`computer_assisted`: one fixed degree-50 positivity certificate; Darroch- and Newton-free). (E) is not a hypothesis of the
composition. It is the other conjunct of Tier 1.

Its nodes:
- the block identity (`proved_informal`);
- the descent tool for blocks `j ≥ 6`, which is `formally_verified` as C1-LA3's terminal `cb8_block_descent_topRank` for every
  `5 ≤ j ≤ m`. That is a node, not the descent;
- the pooled positivity certificate (`computer_assisted`);
- `α = 9m+1` (`formally_verified`, C1-LA2 `cbGraph_indepNum_eq`);
- `3p* < 2α+1` (`formally_verified`, C1-LA2 `cb_lowWindow`);
- `x` is the least strict descent (`C5LA1.crossingIndex`), so a descent at index `p*−2` gives `x ≤ p*−2`.

**Dependency graph of Tier 1 = (E) ∧ (H).** Grades are the registered or registrable grades. "FV" means `formally_verified` at the
exact scope named.

```text
TIER 1  (E) ∧ (H) on CB(8,m), m ≥ 107, m ≡ 2 (mod 3), rank p* ........ computer_assisted  [weakest input: E3]
├─ (E) SR-4 key ........................................................ computer_assisted  (Darroch/Newton-free)
│   ├─ E1' block identity I = Σ C(m,j) x^j P_j + x(1+x)(1+2x)^{8m} ...... proved_informal    (T3; r30 closed forms)
│   ├─ E2 two-binomial descent tool, blocks j ≥ 6 ...................... proved_informal    (C-U3-T); node FV: C1-LA3 terminal (j ≥ 5)
│   ├─ E3 pooled degree-50 positivity certificate, j ≤ 5 plus tail ..... computer_assisted  (C-T3-F, C-T3-U, C-F3-T, C-F3-U; SR-4)
│   ├─ E4 α(T) = 9m+1 .................................................. proved_informal    ; FV: C1-LA2 cbGraph_indepNum_eq
│   └─ E5 3p* < 2α+1 ................................................... FV: C1-LA2 cb_lowWindow
└─ (H) SR-3 key (implication) ............................................ proved_informal    ⇒ (H) = proved_informal mod Darroch/Newton
    ├─ H1 F_{p*} = leafSet ........................................... proved_informal MODULO Darroch/Newton (favorability key, r30)
    │     structure: leafSet = {v} ∪ C, W_v = {r}, W_c = {u_i} ......... FV: C1-LA2 (structure only)
    ├─ H2 criterion (i), strict, every q ................................ proved_informal    (SR-2 notes; C-U3-T); companion compiled in C1-LA3 (no grade)
    │     alternative: threshold key at ⌈μ_1⌉+2 = p* .................... proved_informal mod Darroch (not used)
    ├─ H2' criterion (ii) ............................................... proved_informal    (CD-2 [r30 C4; SR-C4-6], identity)
    ├─ H3 allocation: nonneg, Out, In, Switch, Residual ................. proved_informal    (SR-1 key); FV at template scope: C1-LA1
    ├─ criterion key (non-sector deletion flow, loads ρ_q·w) ........... proved_informal    (r30)
    ├─ rational flow ⇒ (HALL-COND) ...................................... elementary (no key)
    └─ (HALL-COND) ⇒ integral saturating flow ........................... FV companion on E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE
```

**Weakest-input rule (SOLUTION-CONTRACT §4).**
- **(H) alone:** the weakest input is H1, so (H) stands at **`proved_informal` modulo Darroch/Newton, through the favorability key
  only**. Every other node of (H) is `proved_informal` or better and uses neither theorem. **Confirmed.**
- **(E):** `computer_assisted` through E3 (R31-N-8; SR-4 F-4).
- **Tier 1 = (E) ∧ (H):** **`computer_assisted`**, with the qualifier that the (H) conjunct depends on Darroch/Newton through the
  favorability key only. **R31-N-8's consequence is confirmed.**
  - E3 is a fixed machine-checked positivity certificate of one explicit degree-50 polynomial whose 51 shifted coefficients have 56 or more digits. It is the
    same kind of object as the per-block certificates that the synthesis itself graded `computer_assisted`.
  - `computer_assisted` is the grade that treats both alike.
  - The one contrary registry precedent (`E993-G1-ODD-BROOM-VANISHING-RELATIVE-GAP`) would, if adopted, have to be applied to every
    certificate of this kind. I do not dispute the ruling.
- **Nothing at Tier 1 is `formally_verified`.** The three awards are FV at their own scopes: template, structure, and one node.

### SR-5b. Fresh rows `m = 110` and `m = 113`, with the control row `m = 107`

All instruments are my own and built from the contracts (`sr5lib.py`, `sr5_row.py`, `sr5_lab.py`).
- **The tree.** Built literally from the frozen labels (`0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`,
  `c_ij = u_i+2+2j`) as an adjacency list. Tested by BFS for connectivity and by parent-tracking DFS for acyclicity, with
  `|E| = n−1`.
- **The DPs.** A generic rooted independence DP, with vertex forcing and exact path-update deletion (exact polynomial division by
  replaced child factors). A **set-based** active-tag weighted layer DP: at each support it counts `t·[#neighbours in B ≥ 2]`, and it
  never uses the per-tag decomposition.
- **Self-test.** Brute force on 17 small trees (5 CB trees and 12 random trees), with random `F`, random forcing and random deletion
  sets: 1,214 checks, 0 failures (`selftest_out.json`).

| Check | `m = 107` (control) | `m = 110` | `m = 113` |
|---|---|---|---|
| `n`, `α`, `x` (through `α`), `p*` | 1822, 964, 570, 572 | 1873, 991, 586, 588 | 1924, 1018, 602, 604 |
| `x + 2 ≤ p*`; `3p* < 2α+1`; `i_{p*−1} < i_{p*−2}` | yes; 1716 < 1929; yes | yes; 1764 < 1983; yes | yes; 1812 < 2037; yes |
| leaves (all derived favorable: `Δ_{p*}(T−w) < 0` literally) | 857/857 | 881/881 | 905/905 |
| (WID), side 1 (set-based DP) against side 2 (`Σ_F [q_w(p)−q_w(p−1)]` from `T−H_w`, `T−R_w`) | equal; `S < 0` (409 digits) | equal; `S < 0` (420 digits) | equal; `S < 0` (432 digits) |
| class decomposition (sector `= 2^{k−2}C(8m,k−2)`, sector weight = count, `r`-without-`v` weight 0, `r`-free weight `= Σ_q C(m,q)·8q·r_q(k−q−1)`) at `k = p*, p*+1` | all true | all true | all true |
| criterion (i) strict at every `q`; (ii) at every `q` and `α` | yes; yes | yes; yes | yes; yes |
| `ρ_1` (`= max_q ρ_q`) | `5150844596024699/5173467627355748` | `2027991913051965/2036655530990516` | `27820794945950193/27936482886870172` |
| `θ = 288/L`; margin `(1−ρ_1)/θ` | `96/766193`; 34.90 | `96/809675`; 35.88 | `96/854357`; 36.85 |
| allocation of record: nonnegative; Switch (tight at `γ = 1..6`); Residual | yes | yes | yes |
| exact DP over **every** assignment: `min Σ Out` (total `K`); `max Σ In` (total `K−1`) | 1; 1 | 1; 1 | 1; 1 |
| max switch-image load / capacity `(ρ_1γ + (8−γ)σ(γ))/γ` | 0.995752 | 0.995865 | 0.995971 |
| **total source weight** `Σ_{I_{p*+1}} w_F` | 411 digits | 422 digits, leading `68550815117381555571` | 434 digits, leading `22010031350895196087` |
| **composed flow value** (criterion part `Σ_q W_q(p*+1)` + sector part `|Sec(p*+1)|`) | **= total source weight** | **= total source weight** | **= total source weight** |

The control row reproduces SEMANTIC-CONTRACT §5's fixed points: `n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193`, margin 34.90.

**The max-flow.** The max-flow value is at most the total supply, and the composed flow attains it. So **max-flow = total source
weight** at both fresh rows (and at 107), and there is no deficient cut.

**Disclosure.** A literal augmenting-path max-flow over the whole network is infeasible here, since `|I_{589}|` has 421 digits and
`|I_{605}|` more. An orbit quotient under `S_8 ≀ S_m` is also far too large: multisets of `m` choke types from 54. The flow's
feasibility at targets I did not enumerate therefore rests on the composition's per-class reduction (`proved_informal`, SR-3). It is
corroborated, not replaced, by the class totals above and by the literal laboratory below.

**Sampled literal laboratory** (`lab_110.json`, `lab_113.json`; `ALL_PASS` at both rows, 0 failures). Arcs, weights and preimages
are all literal; the sector rule is the allocation of record.
- **40 sector sources per row.** The exact-DP argmin-Out profile twice, 30 uniform random, seven switch-heavy profiles (20 chokes at
  `(1,γ)`) and one mixed.
  - There are 24,396 literal arcs at `m = 110` and 25,035 at `m = 113`.
  - Every positive rule arc is literal, has a distinct target and lands on weight `≥ 1`.
  - The zero-rule arcs are exactly `D:r`, `D:v`, `S:s` and `S:u(1,0)`, and each lands on weight 0.
  - The literal outflow equals `Σ_i Out`, with minimum exactly 1.
  - 793 and 789 `u_i`-switch arcs carry flow.
- **22 in-sector targets per row** (the argmax-In profile twice, 20 random). There are 25,067 and 26,116 literal preimages.
  - The sector preimages are exactly `2 × #empty legs`.
  - The literal unscaled load equals `Σ_i In`, with maximum exactly 1.
  - There are no `r`-free deletion preimages.
- **48 switch images per row** (`γ = 0..7`).
  - The weight is literally `γ`: `r`-free, exactly one choke, `v` present, `s` absent.
  - The sector preimages number exactly `8−γ`, each an `S:u(1,γ)` arc of value `σ(γ)`.
  - The total `ρ_1γ` + scaled sector load is at most `γ`. The maximum ratio is 0.995865 at 110 and 0.995971 at 113.
  - `γ = 0` images receive 0.
- **16 other targets per row** (two or three chokes, one choke with `s`, `r` without `v`). They receive sector load 0, and `r`
  without `v` has weight 0.

This is a bounded corroboration at two fresh rows and one control row, not proof.

### SR-5c. Naming and alias check (`sr5_alias.py` → `alias.json`; `sr5_alias_rec.py` → `alias_recommended.json`)

- **The synthesis name** `E993-R31-CB-8-TOP-RANK-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL-ON-THE-RESIDUE-2-CLASS-FROM-107`.
  - 0 exact hits, 0 alias-string hits and 0 `alias_patterns` hits in both registries.
  - **But `TOP-RANK` occurs in four registered keys and means `p = α − 1` there:** `E993-R26-TOP-RANK-RESIDUAL-SIGN`,
    `E993-R26-TOP-RANK-N2-LE-M`, `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` and `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`. The last is
    `formally_verified` and concerns eligibility and sign at `α − 1`.
  - On `CB(8,m)`, `α − 1 = 9m ≠ p*`.
  - So "TOP-RANK-IS-ELIGIBLE" reads naturally as "`α − 1` is eligible", which is a different predicate. The contract's own term is
    "top **sector-deficient** rank", and the name drops the qualifier.
- **Repaired name** `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`.
  - 0 exact, 0 alias-string and 0 pattern hits in both registries. The name, the name with spaces and my statement probe
    (`stmt_probe.txt`) were all tested.
  - Nearest lexical neighbour: the r30 row key `…CB-8-M-95-TO-107-…-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
    (Jaccard 0.485). Distinction row below.
  - Among pending r31 names, the nearest is SR-4's key (0.645). It is a different predicate (eligibility only), and it is consumed
    here as the (E) conjunct. Distinction row below.
  - The naming follows SR-4's convention for the class and rank.
- **Whole-face pattern scan** (`sr5_alias_face.py` → `alias_face.txt`). Every field line of the registration text below was run
  against every `alias_patterns` regex of both registries. Every hit is a **citation by KEY** or fence boilerplate, not an alias:
  - STATEMENT, SCOPE and ATTRIBUTION hit the patterns of `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` and
    `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`. The spans run from the network's supply/capacity wording, or from the
    composition key's name, to the cited name `…IMPLIES-NONPOSITIVE-AGGREGATE`.
  - The statement asserts neither the weight identity nor the graph-generic implication. It cites the formally verified companion
    by KEY, as the naming rule requires.
  - FENCES hit `E993-TREE-REAL-ROOTED` (its own name, cited as REFUTED) and `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES` (the standard
    "FOREST … stay OPEN" boilerplate).
  - Distinction row D5 hits the R26/R29 top-rank patterns through its KEY field and its list of those keys, which is the purpose of
    that row.
  - To remove avoidable hits, I moved the FLOW ⇒ SIGN consequence from STATEMENT to SCOPE and wrote "binomial block decomposition"
    for "block identity".

## Findings and repairs

1. **Every hypothesis of the composition is discharged, and there is no gap.**
   - (H1) is discharged by the favorability key alone, with the residue arithmetic `8m ≡ 1 (mod 3)` checked, so its part (ii)
     applies.
   - (H2) is discharged by the SR-2 notes, Darroch/Newton-free.
   - (H2') is discharged by CD-2, which covers `p*` because it is an identity for all integers `a, b ≥ 0` and `j`.
   - (H3) is discharged by SR-1's key, which is also FV at template scope through C1-LA1, with identical Out/In/Switch/Residual
     definitions and quantification.
   - SR-3's repair hypotheses (`C ⊆ F`, `v ∈ F`, the witness sets, the shared capacity) follow from (H1), the structure and (H3).
   - (E) is SR-4's key.
2. **Grade repair to the synthesis.** Headline row "Tier 1 … `proved_informal` modulo Darroch/Newton through the carried favorability
   key only" and R-5's "`proved_informal` modulo Darroch/Newton via the favorability key" are **repaired to `computer_assisted`**.
   - The (E) conjunct is `computer_assisted` (R31-N-8; SR-4 F-4).
   - The Darroch/Newton qualifier stays and attaches to the (H) conjunct only.
   - (H) alone stands at `proved_informal` modulo Darroch/Newton, through the favorability key only.
3. **Label repairs carried from SR-3 and SR-4.**
   - "E1-R's criterion" is the homogeneous criterion key, named by KEY.
   - The `j ≥ 6` input of (E) is the two-binomial descent tool, not "Lemma B's certificates".
   - The block-sign lemma is a companion on SR-4's face, not an input.
   - No working label (S-numbers, Lemma A/B, E1, R-n, Row 5, `θ*` law) appears in the registration text below.
4. **Naming (R-5).** `TOP-RANK` is ambiguous in the registry, so the rank is named explicitly (see SR-5c). The synthesis name is kept
   only as an alias.
5. **Recommendation on SR-1's and SR-6's keys** (a recommendation only; I rename nothing). Both kept `TOP-RANK`, with the
   same ambiguity. Both faces define `p* = (16m+4)/3` explicitly, so the statements are unambiguous. I recommend that the controller
   add one explicit-rank alias to each. Both aliases are clear in both registries (`alias_recommended.json`: 0 exact, alias-string or
   pattern hits):
   - SR-1: `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY`;
   - SR-6: `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE`.

   I also recommend a one-line distinction against `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` on each, in the form of SR-4-DR4.
6. **SR-5b method.**
   - The brief's "max-flow on the literal network" is delivered as follows: an exhibited composed flow whose value equals the total
     source weight exactly, computed from literal class totals checked from two sides; per-class capacity checks; and a sampled
     literal laboratory.
   - A literal whole-network max-flow is infeasible at 421+-digit layer sizes.
   - This is bounded corroboration only, and it is recorded below as `bounded_computation`.
7. **Fences checked (SOLUTION-CONTRACT §3).**
   - 1: one rank, the class only; no status transfer.
   - 2: (WID) from independent sides on every row before anything else; `F` derived; `x` through `α`.
   - 3: Darroch/Newton only inside the favorability key, on products of linear factors.
   - 4: the template-to-network step is SR-3's proved reduction; no LP optimality; the `θ*` law is not a hypothesis.
   - 5: no asymptotics and no `M_0` beyond the class endpoint.
   - 6: nothing refuted is revived.
   - 7: census values are not evidence.
   - 8: no sealed member was edited.
   - 9: attribution travels (below).
8. **Outcome C.** No cut. The fresh rows show max-flow = source weight.
9. **Not decisive** (SOLUTION-CONTRACT §5). Tier 1 is not `formally_verified`. The open items toward decisive event (a), smallest
   first:
   - formalizing the pooled degree-50 certificate with the block identity (with C1-LA3's node, this lifts (E));
   - the composition instantiated on `cbGraph`, starting with the weight dichotomy over `cbGraph`;
   - the formal link from `indepSetCount (cbGraph m)` to the closed form;
   - a Darroch/Newton-free proof of favorability at `p*` on the class, which is the last classical dependency of (H).

## Registration text

Register after SR-1..SR-4 (all returned `confirmed` or `confirmed_with_repairs`), using their repaired key names verbatim. Distinction
rows go to `control/CLAIM-DISTINCTIONS.json`. The record is bounded and is never evidence.

```text
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let m >= 107 be an integer with m ≡ 2 (mod 3), let T = CB(8,m) be the tree with path r – s – v, m chokes u_1..u_m adjacent to r, 8 supports b_i1..b_i8 adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 17m + 3; leafSet(T) = {v} ∪ C with C the 8m private leaves), and put p* := (16m + 4)/3 (an integer exactly when m ≡ 2 (mod 3)) and K := p* − 1. Then (E) p* is eligible: x(T) + 2 <= p* and 3p* < 2α(T) + 1, where x(T) = C5LA1.crossingIndex is the least k with i_{k+1}(T) < i_k(T), computed in the integers through rank α(T), and α(T) = 9m + 1; and (H) with F = F_{p*}(T) the original strict favorable-leaf selector (the leaves w with Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0, on the original tree, fixed at rank p*), which equals leafSet(T), the literal active-tag weighted network at (T, F, p*) — sources I_{p*+1}(T) with supply w_F, targets I_{p*}(T) with capacity w_F, where w_F(B) counts the w ∈ F ∩ B for which B contains another neighbour of w's original support, and arcs the relation (D) ∪ (S) (deletion A = B ∖ {q}; two-for-one switch A = (B ∖ N(u)) ∪ {u} for u ∉ B with |N(u) ∩ B| = 2) — carries an integral flow that saturates every source and loads every target at most its capacity: (HALL) holds at (T, p*), equivalently Σ_{B ∈ X} w_F(B) <= Σ_{A ∈ N(X)} w_F(A) for every X ⊆ I_{p*+1}(T). Proof (an assembly of registered statements, each at its own grade). (E) is the statement of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE: the strict descent i_{p*−1}(T) < i_{p*−2}(T), proved from the binomial block decomposition of I(CB(8,m)), the two-binomial descent tool for the blocks j >= 6 and one fixed degree-50 polynomial positivity certificate pooling the blocks j <= 5 with the tail, gives x(T) <= p* − 2 because x is the least strict descent, and 3p* = 16m + 4 < 18m + 3 = 2α(T) + 1. (H) is the conclusion of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107, whose three hypotheses are discharged on the whole class as follows. (a) F_{p*}(T) = leafSet(T): by E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3 with d = 8 >= 6; since m ≡ 2 (mod 3), dm = 8m ≡ 1 (mod 3), so dm ≢ 2 (mod 3) and its part (ii) applies to every private leaf, its part (i) applies to v, and ⌊(2dm + 4)/3⌋ = (16m + 4)/3 = p* because 16m + 4 ≡ 0 (mod 3). (b) The criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL at (8, m, p*): condition (i), r_q(p* − q) < r_q(p* − q − 1) for every q ∈ [1, m] with r_q(k) = [y^k](1 + y)^{8q−1}(1 + 2y)^{8(m−q)+1}, by that key's [r31 C1; SR-2] scope note (the elementary recurrence, log-concavity and closing-step argument written on the face of the [r31 C1; SR-2] note on E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD, with 6(p* − q − 1) − (3(8q − 1) + 4(8(m − q) + 1)) = 2q + 1); condition (ii), the type-path inequalities, holds identically for all integers a, b >= 0 and j by that key's [r30 C4; SR-C4-6] scope note, hence at a = 8q − 1, b = 8(m − q) + 1, j = p* − q for every q ∈ [1, m]. (c) The allocation of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (θ = 288/(200m² + 82m + 5), σ(γ) = c_γ·θ with (c_1..c_7) = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2), pb and pc from the 72 intercepts of record on that key's face) is nonnegative and satisfies Out (Σ_i Out(β_i, γ_i) >= 1 over every assignment of states to the m chokes with leg total K), In (Σ_i In(β_i, γ_i) <= 1 over every assignment with leg total K − 1), Switch ((8 − γ)·σ(γ) <= θ·γ, γ = 1..7) and Residual (θ <= 1 − ρ_1, ρ_1 = r_1(p* − 1)/r_1(p* − 2)), with Out(β,γ) = β·pb(β,γ) + γ·pc(β,γ) + [β = 1, γ >= 1]·σ(γ) and In(β,γ) = (8 − β − γ)·(pb(β+1,γ) + pc(β,γ+1)) for β + γ <= 7, 0 at β + γ = 8 — the same functions, quantifiers and ρ_1 as in the composition key's hypothesis. The composed flow is the criterion key's deletion flow on the non-sector sources (loading each r-free target with q >= 1 chokes at ρ_q·w_F(A) <= w_F(A)) plus the allocation on the root-plus-arm sector {B : r, v ∈ B} (every member of weight exactly 1), scaled per source; the only targets fed by both parts are the u_i-switch images of weight γ ∈ [1, 7], loaded at most (ρ_1 + θ)·γ <= γ; (HALL-COND) follows by summation, and an integral saturating flow by the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (or finite max-flow integrality). No cutoff M_0 beyond the class endpoint, no omitted range and no asymptotic step.
SCOPE: One explicit tree family, CB(8,m) for every integer m >= 107 with m ≡ 2 (mod 3), at the single rank p* = (16m + 4)/3 per tree (the r31 contract's top sector-deficient rank; not the rank α − 1 of the R26/R29 top-rank keys, which on CB(8,m) is 9m). Consequence on these rows only: S(T, p*) <= 0 by the formally verified E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (FLOW ⇒ SIGN). Grade and dependencies (weakest-input rule): computer_assisted, through the (E) conjunct's single fixed degree-50 positivity certificate (controller grade ruling R31-N-8; isolated second read SR-4), the (E) conjunct being Darroch- and Newton-free; the (H) conjunct, taken by itself, is proved_informal modulo Darroch (1964) and Newton's inequalities applied to products of linear factors, and that dependency enters ONLY through hypothesis (a), i.e. through E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3; every other input of (H) (the composition key, the criterion key, its [r31 C1; SR-2] and [r30 C4; SR-C4-6] notes, the allocation key) is proved_informal and uses neither theorem. Dependency graph (each node at its grade): (E) ← the block identity (proved_informal), the two-binomial descent tool for blocks j >= 6 (proved_informal; the block descent for 5 <= j <= m is formally_verified as E993Transport.cb8_block_descent_topRank, r31 award C1-LA3, a node only), the pooled positivity certificate (computer_assisted), α(CB(8,m)) = 9m + 1 and 3p* < 2α + 1 (formally_verified as E993Transport.cbGraph_indepNum_eq and E993Transport.cb_lowWindow, r31 award C1-LA2); (H) ← the composition key (proved_informal) ← (a) the favorability key (proved_informal modulo Darroch and Newton; the leaf set, the tag witness sets W_v = {r}, W_c_ij = {u_i} and the reduction favorableLeaves = leafSet when every leaf is favorable are formally_verified structure, r31 award C1-LA2), (b) the criterion key with its two notes (proved_informal; condition (i) at p* is also compiled as the companion E993Transport.cb8_E1_conditionI_topRank on the face of award C1-LA3, no grade of its own), (c) the allocation key (proved_informal; formally_verified at template scope as E993Transport.cb8_topRank_sectorTemplate_feasible, r31 award C1-LA1), and the companion exists_saturatingFlow_of_weightedHall (formally_verified award companion). The alternative discharge of condition (i) through the threshold key at ⌈μ_1⌉ + 2 = p* ([r30 C6; SR-C6-1]) is proved_informal modulo Darroch and is not used. Bounded support (bounded_computation, never evidence): the end-to-end checks at CB(8,107)/572, CB(8,110)/588 and CB(8,113)/604 (record R31-C1-SR-5-CB8-110-113-END-TO-END); SR-3's composition test at CB(8,110)/588; the parent descent at every class row m ∈ [107, 2600].
ATTRIBUTION: The Tier 1 target, its class and rank: the r31 charter and contracts (Claude Opus 5.5 controller). The assembly (E) ∧ (H) and its registration proposal: the r31 Cycle 1 synthesis (Claude Opus 5.5); the assembly read, the rename, the grade and the fresh-row end-to-end checks: isolated second read SR-5 (Claude Opus 5.5). (E): as on the face of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE — T3 (Claude Sonnet 5; the block decomposition), C-T3-F, C-T3-U, C-F3-T, C-F3-U (Claude Opus 5.5; the pooled certificates), C-U3-T (Claude Opus 5.5; the descent tool), the r31 T and F adjudicators, the r31 Cycle 1 synthesis (the composition), SR-4 (Claude Opus 5.5); the closed forms and α of CB(d,m): r30 (T1, r30 Cycle 6, as registered on the favorability key). (H): as on the face of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 — U2 (Claude Sonnet 5; origin), C-U2-T and C-U2-F (Claude Opus 5.5; repairs), the r31 Cycle 1 U adjudicator, SR-3 (Claude Opus 5.5), with r30's structural argument and composition (r30 T2, Claude Sonnet 5; C-T2-F, C-T2-U and SR-C6-2, Claude Opus 5.5) and the choke-local sector certificate method (C-T1-U, r30 Cycle 4; its r30 Cycle 5 T2 generalization). The allocation: r31 T1 (Claude Sonnet 5; seat of origin), with the proof confirmed by C-T1-F, C-T1-U and the r31 T adjudicator and the Residual by C-T1-F, C-T1-U, C-F1-T, C-F2-T and C-F2-U (Claude Opus 5.5), and SR-1 (Claude Opus 5.5). Condition (i) at p*: C-U3-T (Claude Opus 5.5), U3 (Claude Sonnet 5; q = 1), C-U3-F (corroboration), the r31 U adjudicator, SR-2 (Claude Opus 5.5). The favorability key, the criterion key and its CD-2 note, the threshold key, r_q and ρ_q: r30 as registered on their faces (C-T1-F, C-T1-U, T1, the r30 adjudicators; SR-C3-3, SR-C4-6, SR-C5-4, SR-C6-1). E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE and its companion: its authors as on its face. Lean awards of r31 Cycle 1 (formally_verified at their own scopes, cited as nodes): C1-LA1 (c1-la1-formalizer-opus-20260928), C1-LA2 (c1-la2-formalizer-opus-20260928; with the r31 U1, C-U1-T and C-U1-F layer), C1-LA3 (c1-la3-formalizer-opus-20260928), all Claude Opus 5.5. The transport network, the active-tag weight, the relation (D) ∪ (S), (HALL) and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; the definition layer (C5LA1.crossingIndex and the counts): the first-interior run (Codex) and r24–r26. Classical: J. N. Darroch (1964) and Newton's inequalities, inside the favorability key only.
FENCES: Not decisive: nothing at this key's scope is formally_verified; the three r31 Cycle 1 awards are formally_verified only at their own scopes (template arithmetic, the CB(8,m) structural layer, one block-descent node), and this key's grade is computer_assisted with the (H) conjunct modulo Darroch and Newton through the favorability key. One rank per tree and the class only: nothing at any other rank of CB(8,m), at m ≡ 0 or 1 (mod 3), at m < 107, for d ≠ 8, for heterogeneous CB patterns or for arbitrary trees; never promoted to every eligible rank. No status transfer: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL ((HALL) at full scope) stays OPEN; E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta (E993-BETA-AGG) and Erdős #993 stay OPEN; S(T, p*) <= 0 is asserted on these rows only (FLOW ⇒ SIGN) and transfers to no aggregate key. Darroch's theorem and Newton's inequalities are applied only inside the favorability key and only to products of linear factors with positive coefficients, never to I(CB(8,m)), G, G^m or any forest polynomial; E993-TREE-REAL-ROOTED stays REFUTED and is not revived. No refuted mechanism is revived: literal (D) ∪ (S), literal w_F and the fixed original selector; not deletion-only (the root-plus-arm sector is deletion-deficient by p*/(p* − 1) and switch arcs carry load), not per-leaf injectivity, own-support unit capacity or occupancy domination, not the m-independent per-choke certificate. The template-to-network step is the composition key's proved reduction; the affine separation, LP optimality and the conjectured θ* law 288/(200m² + 82m + 5) as an LP optimum are not hypotheses (the allocation is one feasible table among at least three). Census values and the bounded rows are not evidence. Not an alias, edit, extension or upgrade of E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS or E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, whose sealed statements are unchanged (distinction rows). Nothing here is a cut or refutes anything. No RTree or governed-model assertion.
ALIASES: E993-R31-CB-8-TOP-RANK-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL-ON-THE-RESIDUE-2-CLASS-FROM-107; r31 Tier 1 on the residue-2 class from 107; CB(8,m) eligibility and weighted Hall at rank (16m+4)/3; r31 C1 R-5
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r31 C1; SR-5] At the single rank p* = (16m + 4)/3 of CB(8,m), for every integer m >= 107 with m ≡ 2 (mod 3), p* is eligible and (HALL) holds with the fixed original selector (every leaf): E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL, at grade computer_assisted (one fixed polynomial positivity certificate in the eligibility conjunct), with the Hall conjunct modulo Darroch and Newton through E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3. One rank per tree on one residue class of one family; nothing at other ranks of these trees or on any other tree. This key stays OPEN; its statement, status and fences are unchanged, and no status transfers.
```

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
TEXT: [r31 C1; SR-5] On CB(8,m), m >= 107, m ≡ 2 (mod 3) (dm = 8m ≡ 1 (mod 3), so part (ii) applies, and ⌊(2dm + 4)/3⌋ = (16m + 4)/3), this key is the sole input through which Darroch's theorem and Newton's inequalities enter E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL (it discharges the hypothesis F_{p*} = leafSet of the composition key); a Darroch- and Newton-free proof of this key's conclusions at p* on that class would leave the Hall conjunct of that key at proved_informal with no classical dependency. Bounded support (never evidence): every leaf derived favorable on the literal tree at CB(8,107)/572 (857 leaves), CB(8,110)/588 (881) and CB(8,113)/604 (905) by isolated second read SR-5; the r31 Cycle 1 F3 rows 107–2396 stay struck as evidence (wrong polynomials). This key's statement, grade (proved_informal modulo Darroch and Newton) and fences are unchanged; no status transfers.
```

```text
DISTINCTION ROW: R31-C1-SR-5-D1
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Overlap at one (T, p) only. The registered key is a finite certificate (computer_assisted) of (HALL) at the five named rows (CB(8,m), (16m+4)/3), m ∈ {95, 98, 101, 104, 107}, each with its own literal per-row data; the new key asserts eligibility and (HALL) uniformly at (CB(8,m), (16m+4)/3) for every m >= 107 with m ≡ 2 (mod 3), by an assembly of uniform statements (computer_assisted, the Hall conjunct modulo Darroch and Newton through the favorability key). The only shared (T, p) is (CB(8,107), 572), where both assert (HALL); the new key neither replaces nor upgrades that row's certificate, the registered key asserts nothing for m > 107, and no status transfers either way.
```

```text
DISTINCTION ROW: R31-C1-SR-5-D2
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: No shared (T, p). The registered key certifies (HALL) at (CB(8,86), 460), (CB(8,89), 476), (CB(8,92), 492), (CB(8,108), 577) and (CB(7,144), 673); the three CB(8,·) residue-2 rows have m < 107, CB(8,108) has m ≡ 0 (mod 3) and CB(7,144) has d = 7, so none lies in the new key's class. The new key says nothing below m = 107 (its eligibility certificate starts at m = 107). No status transfers.
```

```text
DISTINCTION ROW: R31-C1-SR-5-D3
KEY: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: That key is an implication (proved_informal) whose hypotheses (all leaves favorable, the mark-clone criterion, a feasible sector allocation) are assumed and discharged nowhere on its face, and it asserts no eligibility. The new key is unconditional on the class: it discharges each of those hypotheses by a registered statement at its grade and adds the eligibility conjunct. The new key's grade (computer_assisted) comes from its eligibility conjunct and from the favorability key's classical dependency, neither of which is an input of that key; that key's statement and grade are unchanged.
```

```text
DISTINCTION ROW: R31-C1-SR-5-D4
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE
TEXT: That key is the eligibility conjunct alone (a coefficient statement about I(CB(8,m)), with no network content). The new key consumes it verbatim as its (E) conjunct and adds the weighted Hall conjunct on the literal network at the same rank and class. The shared name tokens (the class, the rank, IS-ELIGIBLE) name that input; that key's statement, grade (computer_assisted) and fences are unchanged.
```

```text
DISTINCTION ROW: R31-C1-SR-5-D5
KEY: E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE
TEXT: A different rank. In the R26/R29 keys (E993-R26-TOP-RANK-RESIDUAL-SIGN, E993-R26-TOP-RANK-N2-LE-M, E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT and this key) "top rank" is p = α(T) − 1, which on CB(8,m) is 9m; the new key concerns p* = (16m + 4)/3, the r31 contract's top sector-deficient rank, interior to the eligible window for large m. The synthesis's name for the new key, which used "TOP-RANK", is kept only as an alias. No statement, rank or status is shared.
```

```text
RECORD: R31-C1-SR-5-CB8-110-113-END-TO-END
CLAIM: With SR-5's own exact instruments (literal CB(8,m) tree from the frozen labels, tested for connectivity and acyclicity; generic rooted independence DP with exact path-update deletions; set-based active-tag weighted layer DP; all validated by brute force on 17 small trees, 1,214 checks, 0 failures), at (CB(8,m), p*) for m = 107 (control), 110 and 113 (fresh): (n, α, x, p*) = (1822, 964, 570, 572), (1873, 991, 586, 588), (1924, 1018, 602, 604), x computed through rank α, p* eligible and i_{p*−1} < i_{p*−2}; every leaf derived favorable on the original tree (857, 881, 905 leaves); (WID) supply − capacity = S(T, p*) < 0 from two independent sides (the set-based layer DP against Σ_F [q_w(p*) − q_w(p* − 1)] from T − H_w and T − R_w); the class decomposition of source and target weight (sector count 2^{k−2}C(8m, k−2) with weight equal to count, r-without-v weight 0, r-free weight Σ_q C(m,q)·8q·r_q(k − q − 1)) at k = p*, p* + 1; the mark-clone criterion condition (i) strictly at every q and condition (ii) at every q and α, directly; ρ_1 = max_q ρ_q = 5150844596024699/5173467627355748, 2027991913051965/2036655530990516, 27820794945950193/27936482886870172; the allocation of record parsed from the formally verified C1-LA1 source and equal cell by cell to the 72 intercepts on SR-1's face: nonnegative, Switch (tight at γ = 1..6), Residual (margins (1 − ρ_1)/θ = 34.90, 35.88, 36.85), and by exact DP over every assignment min Σ Out = 1 (total K) and max Σ In = 1 (total K − 1); the composed flow (the criterion key's non-sector flow plus the scaled sector allocation) has value exactly equal to the total source weight (411, 422 and 434 digits; leading digits at m = 110: 68550815117381555571; at m = 113: 22010031350895196087), so the max-flow equals the total source weight and no deficient cut exists at these rows; switch-image load/capacity at most 0.995752, 0.995865, 0.995971. A sampled literal laboratory at m = 110 and 113 (40 sector sources with 24,396 and 25,035 literal arcs; 22 in-sector targets with 25,067 and 26,116 enumerated preimages; 48 switch images γ = 0..7; 16 other targets) has 0 failures. A literal whole-network augmenting-path max-flow is infeasible at these sizes; feasibility at non-enumerated targets rests on the composition key's reduction.
STATUS: bounded_computation
PROVENANCE: Isolated second read SR-5 (Claude Opus 5.5), own instruments under scratchpad/c1-sr-SR-5/: sr5lib.py (3091e26f442b62c07e597e4f6cd663ad92808f8f1695fdc204f61010f6d04420), sr5_row.py (c0fb103733108ee20d5ed549f1bcaa886db7d651da7fdc645f752086a4fb27bc; row_107.json 416cf03445fe908eeaf6a661a73639cd25b95cf14e2a0dc4657d5729ae554e38, row_110.json e787bbb11e4d7b114b6882a2bb09de4d229f02749add98782a4d74f7b68ca0b7, row_113.json 72754e345531ddb82305ea42082e4990cdd138ece0f7dda65c8e5efbf3ca9c9a), sr5_lab.py (10791b93a2472df445f66dd8c9c9f40a5e7f05cacc4eb9f86f25f3f6acb1c72d; lab_110.json cf02cfae700a08081708e36357274084bc4e4b6477957a7805ad635340127d93, lab_113.json d61d6968ae0045e094e582c0a7546d4a4148c3268062debdd8be4915a2591111), sr5_selftest.py (selftest_out.json 46987048c917758497b854d4c51b764f7b187485adb84b39cb74e13ca6058964). Support only, never evidence in a proof.
```

## Verdicts

verdict[SR-5a]: confirmed_with_repairs
verdict[SR-5b]: confirmed_with_repairs
verdict[SR-5c]: confirmed_with_repairs

- **SR-5a.** Every hypothesis of the composition is discharged on the whole class with no gap:
  - (H1) by the favorability key only; `8m ≡ 1 (mod 3)`, so its (ii) applies;
  - (H2) by the SR-2 notes, Darroch/Newton-free;
  - (H2') by CD-2, which covers `p*`;
  - (H3) by SR-1's key, which is also FV at template scope through C1-LA1, with identical interfaces;
  - SR-3's repair hypotheses follow from these;
  - (E) is given by SR-4's key.

  The repair is the grade: Tier 1 is **`computer_assisted`**, not `proved_informal`. R31-N-8 is confirmed. (H) alone stands at
  `proved_informal` modulo Darroch/Newton, through the favorability key only. The dependency graph is written above and on the key's
  face.
- **SR-5b.** At `m = 110` and `m = 113`, with the control row `m = 107`:
  - `x = p*−2` and `3p* < 2α+1`;
  - every leaf is favorable;
  - (WID) holds from two sides;
  - the composed flow's value equals the total source weight exactly, so max-flow = source weight and there is no cut;
  - the sampled literal laboratory has 0 failures.

  The repair is to method: the literal whole-network max-flow is replaced by exhibited-flow certification through the proved reduction
  plus the literal laboratory, because the network is too large. Bounded only.
- **SR-5c.** The key is renamed to name the rank explicitly:
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`.
  - It is alias-clear in both registries.
  - Grade `computer_assisted`, with the fences, the full attribution and five distinction rows on the face.
  - The synthesis name is an alias.
  - Recommendation: explicit-rank aliases for SR-1's and SR-6's keys.

Seal verified: `ce8c702c582616bfc2568d5d3cdb0bb024126828fde603a26e37afb0e007b356` (MATCH; 143/143 members).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-5/`. Everything
uses the Python standard library only and runs with `python3 -B` in the foreground. Replay by `cd`-ing into the root and running the
command in the Role column.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `e44b8135e137dade5e29773a1591237d5f88063e275122bb8a4fc275d42088cb` | Capsule seal and 143 member digests |
| `sources_digest_check.txt` | `02ef1ebbd56be84f57147db1cd871b8b27df86c47f3c32019e0b8723de4c25c4` | 65/65 `sources/` members against `sources/SOURCE-DIGESTS.json` |
| `keys_face.txt` | `5e81e4e410dbd834f08ffa0d85ea5a0ba3f93c3554586dfa2230e2d24b3c7392` | Registry faces of the favorability and criterion keys (extract) |
| `sr5lib.py` | `3091e26f442b62c07e597e4f6cd663ad92808f8f1695fdc204f61010f6d04420` | Literal CB builder and tree tests; independence DP with forcing; exact path-update deletions; set-based weighted DP; `r_q`; C1-LA1 table parser; SR-1 face parser; exact extremal-assignment DP |
| `sr5_selftest.py` | `0d0590079403e53fe6a09d16ad091d0a54905e55661a7f3b37ed6f93d358e91c` | Brute-force validation on 17 small trees. `python3 -B sr5_selftest.py` |
| `selftest_out.json` | `46987048c917758497b854d4c51b764f7b187485adb84b39cb74e13ca6058964` | 1,214 checks, 0 failures |
| `sr5_row.py` | `c0fb103733108ee20d5ed549f1bcaa886db7d651da7fdc645f752086a4fb27bc` | Row check. `python3 -B sr5_row.py 110` (about 16 s per row) |
| `row_107.json` / `.log` | `416cf03445fe908eeaf6a661a73639cd25b95cf14e2a0dc4657d5729ae554e38` / `d68fe502…b7fb` | Control row: fixed points reproduced; `all_checks_true` |
| `row_110.json` / `.log` | `e787bbb11e4d7b114b6882a2bb09de4d229f02749add98782a4d74f7b68ca0b7` / `8400497a…4394` | Fresh row 110: `all_checks_true` |
| `row_113.json` / `.log` | `72754e345531ddb82305ea42082e4990cdd138ece0f7dda65c8e5efbf3ca9c9a` / `60c8ae4e…c231` | Fresh row 113: `all_checks_true` |
| `extremal_{107,110,113}.json` | `7b872398…d368`, `bd3d6fd8…f33c`, `40ec3b26…a93a` | Argmin-Out and argmax-In assignments from the exact DP |
| `sr5_lab.py` | `10791b93a2472df445f66dd8c9c9f40a5e7f05cacc4eb9f86f25f3f6acb1c72d` | Sampled literal laboratory. `python3 -B sr5_lab.py 110` (about 2 min per row) |
| `lab_110.json` / `.log` | `cf02cfae700a08081708e36357274084bc4e4b6477957a7805ad635340127d93` / `699f879f…0ced` | `ALL_PASS` true, 0 failures |
| `lab_113.json` / `.log` | `d61d6968ae0045e094e582c0a7546d4a4148c3268062debdd8be4915a2591111` / `b692586f…81d4` | `ALL_PASS` true, 0 failures |
| `sr5_alias.py` | `a258d74a8d8e09992158e598f070bfda1baa17ae581004134f2e510370f4cc9d` | Own alias check against both registries and pending r31 names. `python3 -B sr5_alias.py stmt_probe.txt` |
| `stmt_probe.txt` | `97546885d612b7d112837a175f5e3063144dceb72c96df105033316970fd13bc` | Statement probe for the `alias_patterns` regexes |
| `alias.json` | `a88aff41fbafff6e93494f994d2f60ed5b75b52e2128bbe6313cd08663087a60` | No exact, alias-string or pattern hit for either name in either registry; `TOP-RANK` keys listed |
| `sr5_alias_rec.py` | `173528ee188e75d9624cd3325108010a052f75424b517624d15deeb4c32889c3` | Alias check of the recommended explicit-rank aliases for SR-1's and SR-6's keys |
| `sr5_alias_face.py` | `c3cf8d0a5503d9989014c618204c14e6cef80bd1ed654701703d29181104ecdb` | Whole-face scan of this read's registration text against every `alias_patterns` regex of both registries |
| `alias_face.txt` | `9b4436fdcc07ee32cc1554962fc53834a0a5d3f2f886891fe2cbe542a9081834` | 16 lines (8 per registry); every hit is a citation by KEY or fence boilerplate, none an alias |
| `alias_recommended.json` | `3c8a1bc948cf1f4aecd6416f5011d3dcffbdaf8705162da89f64de5434f1a688` | 0 hits for both, in both registries |

The only file written outside the scratch root is this `SECOND-READ.md`. No background job was started. A name-scoped `pgrep` before
the final write matched nothing.
