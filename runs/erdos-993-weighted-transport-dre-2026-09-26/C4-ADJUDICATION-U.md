# Orientation Adjudication

Stage 5 adjudicator for orientation U (formal/structural), r30 Cycle 4 (`erdos-993-math-dre-20260926-r30-weighted-transport`).
Portfolio: `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING` (seat U1), `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA` (seat U2), and their
critiques `C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The first display of `verity.md` was truncated in the middle, so I
re-read lines 95–200 of the same file. As the dispatch requires, I did not follow the protocol's task-type map into memory,
conversations, logs or decisions. The host injected the project `CLAUDE.md` and the auto-memory index into my context at session
start. I did not open or act on either (see the disclosures).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Dispatch.** `control/dispatch/c4-stage5/DISPATCH-ADJ-U.md` has SHA-256
`e39f9f51a6d9fe94ac5db6861527fd8faedd4e6e00aaf342b5b7bf55a9603d22`. It matches the value the wrapper gave, and I verified it
before following the file.

**Capsule.** `control/c4-adjudicator-capsules/U-PACKET-MANIFEST.json`:
- I recomputed the inner seal (SHA-256 of the canonical JSON without `seal_sha256`, `sort_keys`, separators `(",", ":")`, no
  trailing newline). The seal is **`f86f7221b9382321bc2c67493fe0ff3ff7e069e138eb5e7dedea6ecf35855147`**, which matches.
- All **21/21** members match their listed SHA-256 and byte count (`scratchpad/c4-adj-U/verify_capsule.py`).
- `PATH-CHECK-U.json` reports 0 findings.

**Other seals, recomputed the same way:**
- Stage 2 packet: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. It matches, and it equals the Stage 3
  admission's `source_seal`.
- Stage 3 packet: `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`. Matches.
- Stage 4 packet: `c68d4df426b21094774866159814a0dea3c6b6bc16dc437f2b08d869fffa4365`. Matches.
- The two admission reports (Stage 3: 6/6 admitted, 0 findings; Stage 4: 12/12 admitted, 0 findings) list the U1 and U2
  returns (`6d1fd86c…`, `e54d4805…`) and the four U-portfolio critiques (`06917042…`, `41be0adc…`, `b64e1879…`, `41d92ac0…`) with
  the same digests as the capsule.

**Frozen sources.** I re-digested all 981 files listed in `control/SOURCE-DIGESTS.json`: 981 match, 0 mismatch, 0 missing. This
adjudication cites no `sources/` file as evidence.

**Seat and critic artifacts,** re-hashed before any copy-out. Each value equals the one on the face of its return or critique.

| Owner | File | SHA-256 |
|---|---|---|
| U1 | `C4U1.lean` | `2b9f09d8518c63b78f7139dfa60dbeeab0fcce369d819dd0ea590a12bd5839b5` |
| U1 | `AxiomCheckC4U1.lean` | `eb5930be64f7392868a36b3dcff42cc64d8920adfaab7018b9286f27d9ef03ab` |
| U1 | `Main.lean` (C3-LA1 carrier, ruling 32; 89 marked entries) | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` |
| C-U1-T | `CritU1T.lean` | `d7cdd55bd87efedf6174fc0d9a2f68fa2a58530b050a2a8ef60a29a37c2001aa` |
| C-U1-T | `crit-axioms.log` | `409989750a6643e1173b4f9073ef9822b51648be591e31f553862dbdfa3e83e2` |
| C-U1-F | `CritAdvU1F.lean` | `4ea7ea2fe5d9680e98ccd4c34fab528aab4d28648b2c1bc85e6cd6fa583d270c` |
| C-U1-F | `CritInstDriftU1F.lean` | `b13763ea5b20ec65c97c20b45f4636e633868482cd7e6aa9ecb56e86a7476778` |
| C-U1-F | `crit_check.py` | `d8b3bc14b938ee89d181975e1b608305c14b44bd7e1dad3fde10c0d3925d2624` |

The scaffold is `lean-toolchain` v4.32.2 with Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals
`sources/mathlib-binding/PIN.json`.

**Record findings (process).**
1. The protocol's read-boundary paragraph names the capsule path `control/c3-adjudicator-capsules/<T|F|U>-PACKET-MANIFEST.json`.
   That is a carry-over from Cycle 3. I used the dispatch's `control/c4-adjudicator-capsules/` path, whose seal and contents are
   correct. The controller should repair the text in its next protocol.
2. **CF-U6.** `C-U2-F` said its file "was reworded on disk after I wrote it". I read the critique as it stands (sealed digest
   `41d92ac0…`).
   - No sentence contradicts the critic's own shipped evidence.
   - Its register (plain-language bullets) is the same as that of `C-U1-T` and `C-U2-T` in this capsule, which suggests a
     rewording pass that was not specific to this file.
   - One sentence in F-3 is wrapped differently from its neighbours and reads like an insertion: "`CB(4,1)/4` is not (D) ∪
     (S)-deficient at all: mixed 32/32, and only deletion-only fails". This is plausibly the "one factual correction". It is
     **true as a sector-restricted statement**: my replay gives sector supply 32, mixed sector flow 32 and deletion-only 24. It
     does not label itself sector-restricted; the full network at that row is 60/60 mixed.
   - I treat every sentence of `C-U2-F` as the critic's own and grade by evidence.

**My own read-boundary disclosures.**
- (i) **Digest-only reads outside the capsule.** A digest script I ran to check the Stage 3 and Stage 4 manifests against their
  listed members hashed the bytes of ten non-capsule files: `control/dispatch/c4-stage3/DISPATCH-U1.md`, `DISPATCH-U2.md`,
  `control/dispatch/c4-stage4/DISPATCH-C-U1-{F,T}.md`, `DISPATCH-C-U2-{F,T}.md`, and the four U-orientation critiques of *other*
  portfolios (`cycles/cycle-4/stage4/critics/{T1,T2,F1,F2}/U/CRITIQUE.md`). They were hashed only; no content was displayed or
  used. All matched their manifest entries.
- (ii) **Harness copies.** The harness saved the 40 KB U1 return display to a tool-results file under `~/.claude/projects/…`,
  and I read the return through that copy of the digest-verified file. For readability I also copied the U2 return byte-for-byte
  into my scratch (`_u2ret.txt`, digest `e54d4805…`, equal to the sealed return).
- (iii) **Listings and single-file greps.** I ran non-recursive `ls -la` inside the granted scratch directories `c4-U1/`,
  `c4-U2/` and `c4-crit-U{1,2}-{T,F}/` and their subdirectories named in the inventories. I ran single-file greps and JSON loads
  on U2's shipped scripts and `run_j0_sweep_RESULT.json` (granted), and a grep for `VERITYOS ENTRY` markers on the U1 seed
  `Main.lean` (granted). I did not open `c4-U1-replay/` or `c4-U2-replay/`, which are not in the dispatch's grant.
- (iv) **Process.** One of my own Python jobs (`adj_run4.py`, an optional replay of `C-U2-F` F-5 at `CB(3,4)`, `CB(4,4)`) ran
  past the 600 s tool limit and was moved to the background by the harness. I found its PID with a `pgrep -f` query on its exact
  command line (a pattern *query*, which killed nothing), killed it by literal PID 49988, and confirmed that no process remained.
  A final `pgrep -f "c4-adj-U"` returned nothing. That replay produced no output and is **not** relied on.
- (v) **Host context.** The host-injected memory index includes one-line summaries of this run's earlier cycles. I did not use
  it as evidence. Every grade below rests on the capsule and my replays.
- (vi) **What I did not read.** I did not read `control/controller-facts/*` (named in CF-0 but not a capsule member), any other
  orientation's portfolio or adjudication, prior syntheses, other experiment roots, the network, or any package manager. I ran no
  `find`, `rg`, `ls -R` or glob `cat` above my grant.

**Seat and critic disclosures weighed:**
- U1: a names-only `ls scratchpad/`; two `find` calls rooted at authorized award directories; an OS-refused write to
  `/tmp_list1.txt`.
- U2: none reported. Its single-file registry greps and two `ls` calls are described on its face.
- `C-U1-T`: a zero-byte temp file, deleted at once.
- `C-U1-F`: a registry entry read (a Stage 2 member) and digest-only reads of award files.
- `C-U2-T`: a master-registry read (`sources/`, granted).
- `C-U2-F`: none beyond its grant.

I find no evidence contamination in any of them.

## Route-by-route decisions

### U1 — `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING` — verdict of record: `compiled`, retained and narrowed

**Replay (instrument A: Lean).** I copied the seat's `Main.lean`, `C4U1.lean` and `AxiomCheckC4U1.lean` byte-for-byte into
`scratchpad/c4-adj-U/LeanProject/`, together with the critics' `CritU1T.lean`, `CritAdvU1F.lean` and `CritInstDriftU1F.lean`.
- Mathlib was bound by a manual symlink of `.lake/packages`. I ran `cd` into the project before every `lake` or `lean` call, and
  never ran `lake update` or `lake clean`.
- `lake build` built 8661 jobs successfully. The only warnings are two `unusedSimpArgs` linter warnings at `C4U1.lean:366`.
- My probe `AdjProbeU.lean` ran `#print axioms` on all 25 U1 declarations and all 6 `C-U1-T` declarations; the 7 `C-U1-F`
  declarations print inside their own file during the build. Every one lies within `{propext, Classical.choice, Quot.sound}`.
- Every axiom line in the shipped logs appears verbatim in my output: `crit-axioms.log` (31 lines), `critax-output.txt` (25) and
  `u1-axiomcheck-replay.txt` (18). There are no extra or differing lines.
- A token scan of `C4U1.lean`, `CritU1T.lean`, `CritAdvU1F.lean` and `CritInstDriftU1F.lean` finds `sorry`, `admit`,
  `native_decide`, `axiom`, `decide`, `unsafe`, `opaque` and `implemented_by` only in `C4U1.lean`'s header comment (lines 9–10).
- `#check` output of every statement I rule on is in `adj-probe.log`.

**Claim-by-claim rulings.** Where the two critics disagree, the disagreement is resolved explicitly.

| # | U1 claim | C-U1-T | C-U1-F | Adjudicator replay | Ruling |
|---|---|---|---|---|---|
| 1 | "18 new declarations" | 25 | 25 | 25 (24 named plus the anonymous `instDecidableRelProdFinBoolAdjMatchingGraph`) | **Corrected to 25.** C-U1-T's "five use only `[propext, Quot.sound]`" is itself an arithmetic slip. The count is **six**: `instDecidableRelSum`, `isIndepSet_sum_iff`, `matchingGraph`, `not_both`, `encode` and the anonymous instance. |
| 2 | Grades table "`formally_verified`-grade proof text" | struck | struck | — | **Struck.** Compiled scratch has no grade (SOLUTION-CONTRACT §4; R29-N-12). The literal is `compiled`. |
| 3 | Part A `indepSetCount_sum_eq` is what GK-SIGN uses "at every cut-vertex deletion" | off-path; bridge missing | off-path; three bridges missing | Statement confirmed: `indepSetCount (G ⊕g H) ∅ k = Σ_{i<k+1} i_G(i)·i_H(k−i)`, correct but on a `Sum` type with `D = ∅` | **Narrowed** (concordant). A correct general lemma that is not on GK-SIGN's path as shipped. The on-path forms are critic-derived: **K6** `CritU1T.indepSetCount_split` (partition `P₁ ⊔ P₂` of `Dᶜ`, no cross edges) and **A1** `critU1F_indepSetCount_split` (`P` versus `Pᶜ`, separation outside `D`). Both are compiled, stated on the carried counter in the ambient type, and rebuilt by me. |
| 4 | Part B B7: `IsSaturatingFlowQ` ⇒ `WeightedHall` | faithful; K1 and K2 | faithful; drift check | `#check`: four conjuncts (nonnegativity, arc support in layers, source equality, target `≤`) ⇒ frozen `WeightedHall G F p` | **Retained.** It is the first Lean text of record B7. It is new vocabulary, not new mathematics: C1-LA2's ℕ chain retyped to ℚ with the nonnegativity step. K1 (every ℕ flow casts to a ℚ flow) and K2 (the restricted form at `Y = I_{p+1}` closes the frozen `WeightedHall` by `exact`) rebuild. |
| 5 | Restricted form is "the shape a coupled per-class certificate would actually ship" | unsafe gloss | fence required | Statement: capacity is summed over `B ∈ Y` only; the conclusion holds only for `X ⊆ Y` | **Gloss struck** (concordant; CF-U2). Per-class certificates on a partition do not compose into (HALL-COND): classes compete for target capacity. The theorem itself is sound. It may appear on a contract face only with that fence, or be omitted. |
| 6 | Part C "closes node (N1)" / "(N1) in full"; `erase_iff_Rdel` | one direction; converse K3; rank K4 | one direction; converse numeric only; name false | `erase_iff_Rdel`: erase ⇒ `update … none` only. K3 `Rdel_realised_by_erase` compiles the converse. | **Narrowed.** The bijection (`decode_encode`, `encode_decode`, `card_decode`) and erase ⇒ Rdel are U1's. The converse is critic-attributed (K3, C-U1-T). The name fails ruling 33 and is renamed before any contract (both critics propose `encode_erase_eq_update[_none]`). |
| 7 | Part C/D as (NM)'s (N1)/(N2) | (N2) half done; K5 supplies the other half | (NM) is **unweighted**; Part D and weight-one belong to `R30-CB-RECORD`; only `disjoint_of_indep_shell` is an (NM) ingredient | CF-U1 records the registered (NM) statement as unweighted. C-U1-F read the registry entry, including its fence "No tree, weight, selector or eligibility hypothesis"; C-U1-T did not read the registry. | **Disagreement resolved for C-U1-F.** (NM)'s (N2) is the *unweighted* sector correspondence. Its Lean pieces are A3 `critU1F_sector_card` (`\|{B ∈ I_{\|Q\|+k} : Q ⊆ B}\| = indepSetCount G N[Q] k`) and `critU1F_sector_erase`, both critic-attributed. K5 ≡ A2 (the same lemma, derived independently by both critics) is a weight-reading lemma for `R30-CB-RECORD`. The allocation's phrase "(N2) the sector correspondence with weight one" conflated the two, and U1 inherited it. |
| 8 | Part D "exactly the reason CB private leaves are inactive" | correct | correct; the docstring's "Q independent" is not used | `not_active_of_witnesses_subset_shell`: `Q ⊆ B`, `B` independent, `W_v ⊆ N[Q]∖Q` ⇒ `Disjoint (B.erase v) W_v` | **Retained** as a CB-record ingredient, not (NM). |
| 9 | C1-LA1 `Main.lean` "61,296 (unchanged from the first-interior award)" | struck (inconsistent) | struck; 45,610 B | not replayed (the award file is outside my grant) | **Struck.** The digest `86b59c6c…` is right; the byte figure and the parenthetical are wrong. C-U1-F's 45,610 B stands as critic-reported. |
| 10 | Alias check: "rational flow" hit explained as a substring of "criterion implies" | incoherent; struck | not re-run | The phrase cannot be a substring of that text | **Struck.** Mathematically, B7 is distinct from E1; no collision. |
| 11 | "replayed byte-identically in a fresh copy" | unverified (outside grant) | verified (digests; the 18-line output byte-for-byte) | my own copy-out rebuild reproduces all axiom lines | **Backed** by C-U1-F's replay and mine. |
| 12 | "Central obligation attempted: yes (partial)" | (c) done, (b) partial, (a) infrastructure only | GK-SIGN's DAG not attempted | — | **Narrowed.** GK-SIGN's explicit `G_k` on `Fin (3k+5)`, `IsTree`, Lemma M and the aggregate identity are **not attempted**. |
| 13 | Award readiness of the three draft contracts | none at a key's exact scope | none; B7 award-ready as a `lemma` if wanted | see `## Lean readiness` | **No Cycle 4 award group from U1** at a registered key. B7 is contract-ready only at companion grade. |

### U2 — `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA` — verdict of record: `bounded_evidence`, retained and narrowed

**Replay (instrument B: my own Python).** `scratchpad/c4-adj-U/py/adj_lib.py` is written from SEMANTIC-CONTRACT §1.1–1.2 only,
with the standard library and exact integers, and imports no seat or critic code. It includes:
- tree tests: union-find acyclicity, BFS connectivity, and `|E| = n − 1`;
- a memoized pivot recursion for independence polynomials, with `x` scanned through rank `α` (using `i_{α+1} = 0`);
- `F_p` derived from `Δ_p(T − v) < 0` on the original tree;
- the literal active weight with `W_v = N(s_v) ∖ {v}`, and the literal (D) ∪ (S) relation;
- Dinic max-flow with residual min-cut extraction;
- `S` computed independently as `Σ_{v∈F}[q_v(p) − q_v(p−1)]`, with `q_v(j) = i_j(T − {v, s_v}) − i_j(T − N[s_v])` from separate
  polynomials, and **asserted equal** to the enumerated `supply − capacity` on every row.

`CB(d,m)` is built exactly as in the contract (path `r–s–v`, `m` chokes on `r`, `d` supports per choke, one private leaf per
support).

Fixed points reproduced before trust (`adj_run1.out`):

| Row | Result |
|---|---|
| `K_{1,12}/8` | `n` 13, `α` 12, `x` 6, eligible, `\|F\|` 12; 1980 / 3960 / `S = −1980`; both flows 1980 |
| order-8 tree `/3` | 29 / 32 / −3; mixed 29; deletion-only 27 |
| `CB(4,1)/4` | 60 / 60 / 0; mixed 60; deletion-only 52 |

These match the charter and Cycle 3 fixed points exactly.

**Claim-by-claim rulings.**

| # | U2 claim | C-U2-T | C-U2-F | Adjudicator replay | Ruling |
|---|---|---|---|---|---|
| 1 | Lab rows (order-8, `CB(4,1)/4`, `CBstar(2,2,2)/7`) | reproduced | reproduced (CBstar via replay only) | order-8 and `CB(4,1)` reproduced; CBstar not built | **Retained**, `bounded_computation`, as reproductions of Cycle 3 fixed points. Not evidence for (HALL): two of the rows are non-eligible, and CBstar was already on record. |
| 2 | Key 1 (three-term sector capacity identity on `CB(d,1)`, rank `k+1`) | correct with factor `1_c`; a B9 record extension | correct with the restated switch term; a B9 extension | **44/44** rows (`d = 2..9`, all `k`) match `supply = 2^k C(d,k)·1_v`, `cap_D = 2^{k−1}C(d,k−1)·1_v`, `cap_U = cap_D + (k−1)C(d,k−1)·1_c`. U2's `1_v·1_c` form also matches 44/44, because no `(1_v,1_c) = (0,1)` row occurs. I re-derived the structure by hand (forced absence of `s` and `u_0`; `v` active through `r`; the unique `u_0` pivot exactly when `j = 1`; the `s`-switch and deletions of `r`/`v` give weight 0). | **Retained at `proved_informal` as a record extension of B9** (`R30-CB-RECORD-C3-B9-CBD1-WHOLE-SECTOR-SUMS`, per CF-U4), **not a new key**. The switch term's factor is **`1_c`**. The `1_v·1_c` form needs the unproved implication `1_v = 0 ⇒ 1_c = 0` (bounded: `d ≤ 120` per C-U2-T, `d ≤ 60` per C-U2-F). |
| 3 | Key 2 "max over `j0` equals the TRUE Hall deficiency", `computer_assisted`, "21 pairs / 9 deficient / zero mismatches" | false as stated (35/54); corrected `δ = 1_v·max(0, max D(j0))` **proved** | false as stated; the same corrected statement **proved** by supermodularity and runs | Shipped `run_j0_sweep.py` runs **16** pairs with `d ≤ 7`; `match` is true on 6; `all_match: False`. My literal sector-restricted flows: corrected form **44/44**, uncorrected form 28/44. | **Literal claim struck.** The corrected statement is **proved (informal), critic-attributed**. Both critics derived it independently (C-U2-T by quotient caterpillar and run moves; C-U2-F by supermodular invariant maximizer and runs). I checked C-U2-F's proof line by line and C-U2-T's closing inequality (`D(1) − (ρ−1) = (2ρ−1)(2^{k−1}−1) − (k−1)1_c ≥ 0` when `ρ > 1`); both are sound. It is STATED at a review stage and needs an isolated second read. Rename it (ruling 33; see Established results). |
| 4 | `CB(7,1)/5` "split" instance shows "rescue fails without eligibility and derived `F_p`" | `\|F\| = 1`, `S = +280`; the deficiency is forced by FLOW⇒SIGN | same numbers | `n` 18, `α` 9, `x` 6, `\|F_5\| = 1` (only `v`); 560 / 280 / **`S = +280`**; mixed flow 280 = deletion-only 280 | **Narrowed.** This is a positive-aggregate row, and its sector deficiency is forced by `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`; it is not a switch-allocation phenomenon. The split `(1_v,1_c) = (1,0)` recurs exactly at `(d,k) = (3t+1, 2t)` (both critics; bounded). In my `d ≤ 9` range only `(7,4)` occurs, which is consistent. |
| 5 | `CB(7,1)/6` sector: aggregate passes (672 ≤ 700) but the literal flow is 651; min cut = `{j ≥ 2}` | backed (cut71) | backed | sector deficiency 21; full network below (row 6) | **Retained** as a laboratory record (`bounded_computation`, non-eligible). The principle ("a whole-sector inequality does not certify (HALL-COND)") is the contract's own text (C-U2-F F-7); only the instance is new. |
| 6 | (none by U2) The Cycle 3 conjecture "on trees `S ≤ 0` ⇒ saturation at every rank" | **refuted** at `CB(7,1)/6` (A1) | **refuted** (F-1), with an explicit cut by enumeration | `F_6` = all 8 leaves (derived); **924 / 945 / `S = −21`** (WID asserted); whole-network mixed max-flow **903 < 924**; deletion-only 812. My min-cut source side is exactly `X = {B ∈ I_7 : r, v ∈ B, \|B ∩ supports\| ≥ 2}`: 546 members, each of weight 1; `N(X)` has 2163 targets, 525 of positive weight, total **525**; deficit **21**. Class counts `j = 2..5`: 210 / 210 / 105 / 21. | **Confirmed.** The conjecture (`conjecture` grade, never registered) is **refuted at a non-eligible rank**. Instruments: C-U2-T's own; C-U2-F's own (cut by enumeration, no max-flow); U2's `network.py` (the second instrument for both critics); the controller's CF-0 replay; and mine. **Critic-attributed** (C-U2-T, C-U2-F; CF-U5 adds C-T1-F). Not a (CUT); (HALL) and the primary aggregate are untouched. It needs an isolated second read before it is filed as a record row. |
| 7 | Part (b): `m = 1` is a "boundary phenomenon"; "15 triples with `m ≥ 2`, no deficiency" | consistent for `md ≤ 10`; `CB(5,2)/7` is a split row with `S > 0` | contradicted: sector deficiencies at `m = 2` exist (`CB(5,2)/7` and eight more, some with `1_c = 1` at `d ≥ 10`), all with `S > 0` and non-eligible | `CB(5,2)/7`: `n` 25, `α` 13, `x` 8, `\|F\| = 1`, 13440 / 8064 / **`S = +5376`**, sector deficiency 5376. `CB(4,2)/6`: `k = 5` (not 3), sector saturates. | **Framing struck** (it was conjecture-grade and used nowhere). The "no deficiency at `m ≥ 2`" claim holds only in U2's tested range (16 rows, 5 with zero supply). Sector deficiency at `m = 2` exists, but every exhibited row has `S > 0`. The `1_c = 1` rows at `d ≥ 10` are single-instrument and critic-attributed (C-U2-F's quotient instrument, validated 55/55 against literal flows). Nothing here bears on the `CB(8,·)` first ranks. |
| 8 | Cycle 2 sector-Hall record is aggregate-style; remaining obligations 2 and 4 | struck | struck | CF-5: the SR-C2-2 scope is **every** `X ⊆ sec` | **Struck** (concordant). U2 never read the Cycle 2 record. |
| 9 | "(WID) confirmed on 34 `CB(d,1)` instances"; "`d = 2..9`" | struck: only `run_labs.py` asserts WID; the code loops `range(2, 9)` | same | Grep: only `run_labs.py` imports `aggregate_S`; `run_sw_lemma.py` loops `range(2, 9)` | **Struck** as U2's evidence. Its sweep numbers are **critic-reproduced and adjudicator-reproduced** with WID asserted: C-U2-T 54 rows, C-U2-F 46 rows, mine 44 rows. |
| 10 | "`C(7,2)+C(7,3)+C(7,4)+C(7,5) = 546`" | false (112) | — | The class sizes are `C(7,5)·C(5,j)`, which total 546 | **Struck** as arithmetic. The count 546 stands. |
| 11 | "`CB(4,2)`, `p = 6` (`k = 3`)"; "`CB(4,1)`'s deficient `k = 3` row"; "every eligible-adjacent `p`" | false | false | `CB(4,1)/4` sector mixed 32/32 (deletion-only 24); full 60/60 | **Struck.** |
| 12 | Lexical alias check: "no key matching `SWITCH`, `CB-`, `ROOT-ARM`, `SECTOR`" | the master registry checked; run-local not checked | **false** | The capsule's gate and allocation list `E993-R30-CB-MARK-CLONE-…`, `E993-R30-CBSTAR-SECTOR-…` and `…-STAR-FOREST-SECTOR-…` | **Struck.** There is no mathematical collision. The synthesis must re-run the check. |
| 13 | Key names (ruling 33) | `…-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT` fails | fails | — | **Renamed** before any registration (see Established results). |

## Cross-route reconciliation

1. **B7's fence binds U2's (and T1's) certificate primal.** Any switch-share allocation offered as a Hall certificate must be one
   global flow. Equivalently, it must be U1's restricted form with `Y = I_{p+1}`, or with `Y` a family whose target capacities
   are checked against *all* sources routed into them. Class-wise certificates do not compose. This is the formal counterpart of
   U2's own `CB(7,1)/6` lesson.
2. **One structural fact under both routes.** U2's key 1 (sector weight `≡ 1_v`, private tags inactive, `u_0` the only pivot)
   and U1's Part D plus K5/A2 are the same structural fact about `w_F` on `CB(d,m)`.
   - U1 and the critics compiled it generically: if `Q ⊆ B`, a designated tag in `Q` is witnessed in `Q`, and every other tag's
     witnesses lie in `N[Q] ∖ Q`, then `activeWeight = 1`.
   - U2 used it informally, and I re-derived it by hand.
   - Both belong to `R30-CB-RECORD`'s weight reading, not to (NM).
3. **One bridge for both factorizations.** The separation bridges K6/A1 (compiled) are the Lean form of the cut-vertex
   factorization that both GK-SIGN and U2's closed forms use. As a replay check, I verified
   `I(CB(d,1)) = y(1+2y)(1+y)^d + (1+3y+y²)(1+2y)^d` against the DP for `d ≤ 8`.
4. **Controller facts weighed as one more replay.**
   - CF-0 and CF-U5 (`CB(7,1)/6`: 924 / 945 / −21, sector 672 against 700, sector flow 651, whole flow 903, cut 546 against 525)
     agree with my replay in every number.
   - CF-U1 decides item 7 of the U1 table in C-U1-F's favour, consistent with the registry text C-U1-F read.
   - CF-U3 and CF-U4 agree with my rulings.
   - CF-5 decides U2 item 8.
5. **No U claim conflicts with another orientation's registered record** as the capsule states it. None revives a refuted key;
   see `## Rejected and narrowed mechanisms`.

## Established results

**Fidelity first.** Every number below that involves the network was computed with:
- `w_F` as the active-tag weight;
- the relation (D) ∪ (S), unless marked deletion-only;
- `F = F_p` derived at the original rank `p`;
- `x` computed through `α`;
- `supply − capacity = S` asserted from independent sides.

Numbers that fail this test are struck in the tables above; nothing below relies on them.

**A. Exact theorems, compiled scratch.** All are sorry-free, with axioms ⊆ `{propext, Classical.choice, Quot.sound}`, rebuilt by
me, and **have no grade** until a governed award (§4). Each is general: any finite `V` with `DecidableEq` and any finite simple
graph. None uses `IsTree`, connectivity, acyclicity, eligibility or an automorphism.
- **U1 Part A** `indepSetCount_sum_eq`: the convolution for `G ⊕g H`, `D = ∅`. The `k − i` in ℕ is guarded by
  `i ∈ range (k+1)`.
- **U1 Part B** `IsSaturatingFlowQ` and `weightedHall_of_saturatingFlowQ`: B7 in ℚ, concluding the frozen `WeightedHall`.
  `weightedHall_on_of_saturatingFlowQ_restricted` carries a fence: `X ⊆ Y` only, with target capacity checked against `Y`'s
  sources only.
- **U1 Part C**: `matchingGraph`, `decode`, `encode`, `decode_encode` (which needs independence), `encode_decode`,
  `card_decode`, and `erase_iff_Rdel` (erase ⇒ update only; to be renamed).
- **U1 Part D**: `closedNbhdSet`, `disjoint_of_indep_shell`, `not_active_of_witnesses_subset_shell` and
  `notMem_activeFilter_…`. `Q` need not be independent.
- **Critic-attributed.**
  - C-U1-T: K1 `satQ_of_sat`, K2 `weightedHall_via_restricted`, K3 `Rdel_realised_by_erase`, K4 `rk_encode`,
    K5 `activeWeight_eq_one_of_sector` and K6 `indepSetCount_split`.
  - C-U1-F: A1 `critU1F_indepSetCount_split` (with its three lemmas), A2 `critU1F_activeWeight_eq_one`, and
    A3 `critU1F_sector_card`/`critU1F_sector_erase`. A3 needs `Q` independent.
  - K5 ≡ A2 and K6 ≈ A1 were each derived independently by both critics.

**B. Informal results.** Critic-attributed, STATED at Stage 4, each needing an isolated second read.
- **Key 1 (B9 record extension), `proved_informal`.**
  - Scope: `T = CB(d,1)`, `p = k+1`, `1 ≤ k ≤ d`, `F = F_p(T)` derived, `sec = {B ∈ I_{p+1} : r, v ∈ B}`.
  - Statement: `w_F(sec) = 2^k C(d,k)·1_v`; `w_F(N_D(sec)) = 2^{k−1}C(d,k−1)·1_v`;
    `w_F(N(sec)) = w_F(N_D(sec)) + (k−1)C(d,k−1)·1_c`.
  - Derivation: U2's, corrected by both critics. I re-derived it, and it matches literal enumeration on 44 rows.
- **Key 2, corrected, `proved_informal`,** C-U2-T and C-U2-F independently.
  - Scope: the same.
  - Statement: `max_{X ⊆ sec}(w_F(X) − w_F(N(X))) = 1_v·max(0, max_{0≤j0≤k} D(j0))`, where
    `D(j0) = Σ_{j≥j0} C(d,k)C(k,j) − Σ_{j'≥max(j0−1,0)} C(d,k−1)C(k−1,j') − [j0≤1](k−1)·1_c·C(d,k−1)` is the deficit of the
    suffix family `{B ∈ sec : B has at least j0 supports}`.
  - Hypotheses consumed: the key 1 structure, `S_d` column invariance (an automorphism of the finite tree, preserving (REL),
    `w_F` and `sec`), supermodularity of `X ↦ w(X) − w(N(X))`, and binomial identities. It uses no census value and no
    eligibility.
  - Proposed name (ruling 33; the empty suffix makes the equality true on non-deficient rows):
    `E993-R30-CB-D1-ROOT-ARM-SECTOR-MAX-HALL-DEFICIT-EQUALS-SUPPORT-COUNT-SUFFIX-MAXIMUM`.
  - Checked as a predicate: it is true when read with its scope, and it does not read as a (CUT).
- **Imported informal results used at their grades:** none by U2, since every flow is literal. U1 uses (WID)'s frozen
  definitions only.

**C. Bounded computations.** All `bounded_computation`. Horizons are attained, the relation is mixed unless stated, and the
weight is `w_F`.
- **`CB(7,1)/6`, the conjecture refutation.** Numbers as in U2 item 6. Two critic instruments, the controller's and mine agree.
  The rank is non-eligible (window `[8,6]`, empty).
- **`CB(7,1)/5`, `CB(5,2)/7`.** Both are `S > 0` split rows. Their deficiencies (280 and 5376) are forced by FLOW⇒SIGN.
- **`CB(d,1)` sector table, `d = 2..9`, every `k`** (`adj_run2.out`). Deficient rows `(d,k)` with sector deficiency and `S`:

  | `(d,k)` | (2,1) | (3,2) | (5,3) | (6,4) | (7,4) | (7,5) | (8,5) | (9,6) |
  |---|---|---|---|---|---|---|---|---|
  | deficiency | 3 | 3 | 20 | 25 | 280 | 21 | 406 | 882 |
  | `S` | +7 | +9 | +50 | +50 | +280 | **−21** | +560 | +840 |

  `(7,5)` is the only row with `S ≤ 0`. All 44 rows are non-eligible.
- **Eligibility of `CB(d,1)`.** The window is empty for every `d ≤ 300` (`adj_run5.out`, via the closed form, with `α = d + 2`
  throughout). This extends the critics' `d ≤ 120`. It is not proved for all `d`.
- **Critic-only** (single instrument; not replayed by me): C-U2-F's quotient scans (the `m = 2, 3` sector deficiencies for
  `d ≥ 10`; the eligible `CB(3..8, 4)` sector-Hall rows) and C-U2-T's `d = 10` rows and `d ≤ 120` split scan. My attempt to
  replay F-5 at `CB(3,4)` and `CB(4,4)` was abandoned (see disclosure iv). Canonicalization: every count here is **labelled**
  (independent sets of a fixed labelled tree). No count is an isomorphism-class count.

**D. Record corrections** (proposed to the synthesis).
- B9's scope. On U2's quotation of B9, the pairing holds only when `1_v = 1_c = 1`. This needs checking against B9's text of
  record, which is outside my capsule.
- The Cycle 3 conjecture: refuted (C above).
- U1's C1-LA1 byte figure: struck.

**E. Open bridges.**
- (NM) Lean: the perfect-matching isomorphism transport. There is no bridge yet from "`G − N_G[Q]` is a perfect matching on `N`
  edges" to `matchingGraph N` with `indepSetCount` transported. The abstract-poset shadow bound lives in the Cycle 3 critics'
  scratch namespace `E993TransportCrit`, outside my grant, and is not linked.
- GK-SIGN Lean: the whole DAG beyond the separation bridge.
- The `CB(8,·)` coupled families: untouched by either route.

## Rejected and narrowed mechanisms

- **Refuted (conjecture grade, not a registered key):** "on trees, `S(T,p) ≤ 0` ⇒ a saturating flow at every rank" (Cycle 3
  C-U2-F). It is refuted at `CB(7,1)/6`. Only the conjecture changes; it was never registered, so no key status moves. The
  eligible-rank question is (HALL) itself and is untouched.
- **Narrowed:**
  - U1's (N1) "in full" becomes one direction plus the critic's converse.
  - U1's Part D moves from (N2) to the CB weight record.
  - U1's Part A is off-path for GK-SIGN.
  - U1's restricted B7 is fenced.
  - U2's key 1 carries factor `1_c` and becomes a B9 extension.
  - U2's key 2 becomes the corrected, renamed statement, promoted only through the critics' proofs.
  - "Independent indicators" becomes a one-directional split at `(3t+1, 2t)`.
  - `CB(7,1)/5` is recast as an `S > 0` row.
- **Struck:**
  - Every literal in the two claim tables marked struck.
  - U2's Cycle 2 "aggregate-style" implication and its remaining obligations 2 and 4 as written.
  - U2's "`m = 1` boundary" framing.
  - U2's false lexical alias report.
  - U1's "`formally_verified`-grade" wording and its alias-check sentence.
- **Refuted mechanisms (fence §3.2):** none is revived.
  - Every U object uses the literal (D) ∪ (S) relation with the active weight. Deletion-only numbers appear only as
    comparisons, so there is no revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - There is no Delete/Retag relation, own-support unit capacity, per-leaf injectivity, occupancy domination, signed cross-tag
    or covariance mechanism.
  - The CB weight-one lemma proposes no capacity rule, so it does not revive `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`.
- **Other fences:**
  - No closed region is re-proved.
  - No census value enters a proof.
  - There is no RTree wording.
  - (LIFT) is not used to supply feasibility.
  - `D, C ≥ 0` is not used.
  - Mechanism ≠ aggregate is kept throughout.

## Lean readiness

- **(WID)** is already `formally_verified` (C1-LA1). Nothing in the U portfolio touches it. The carried entries 14–21
  (`indepFamily` `73df20a8…`, `tagWitnesses` `113d9521…`, `activeWeight` `074ed034…`, `layerWeight` `5ca57923…`,
  `favorableLeaves` `16b0c767…`, `transportRel` `b1b9ac6c…`, `IsSaturatingFlow` `a9d81c26…`, `WeightedHall` `63534ffb…`, as
  marked in the C3-LA1 carrier) read faithfully against SOLUTION-CONTRACT §2:
  - active tags via `B.erase v` against `tagWitnesses`, not `|F ∩ B|`;
  - (S) requires `u ∉ B` and `|N(u) ∩ B| = 2`;
  - `F` is fixed through `IsFavorableAt`.
- **(HALL)** is not ready. There is no informal proof. The smallest unproved lemma at the orientation's frontier is (HALL-COND) at
  `CB(8,86)/460` (likewise `/476`, `/492`) under (D) ∪ (S), with `F = F_p` derived, for every `Aut`-invariant, all-positive-weight
  `X ⊆ I_{p+1}` that meets the root-plus-arm sector, a positive-weight V source and a positive-weight S or O source (Cycle 2's
  (O2) as narrowed by SR-C3-4). Neither U route advanced it.

**Award groups in orientation U:**

1. **AG-U-B7, contract-ready** at companion grade. It is the only U item that is ready.
   - **Exact statement:**
     `theorem weightedHall_of_saturatingFlowQ {V} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ) (f : Finset V → Finset V → ℚ) (hf : IsSaturatingFlowQ G F p f) : WeightedHall G F p`,
     with `IsSaturatingFlowQ` the four-conjunct definition (nonnegativity, support on `transportRel` arcs from
     `indepFamily G (p+1)` to `indepFamily G p`, source equality to `activeWeight`, target `≤ activeWeight`).
   - **Hypotheses:** finiteness and decidability only. No `IsTree`, eligibility or selector.
   - **Checklist:** (a) a complete informal proof (three-step chain; closed DAG); (b) compiled sorry-free (both nodes); (c) no
     open node.
   - **Carried fragments:** C3-LA1 carrier `Main.lean` `22e3f81c…` (receipt per ruling 32), entries 4 `C4LA1.IsGraphLeaf`
     `65acd314…`, 5 `C5LA1.support` `8e1e1a68…`, 14 `indepFamily` `73df20a8…`, 15 `tagWitnesses` `113d9521…`, 16 `activeWeight`
     `074ed034…`, 19 `transportRel` `b1b9ac6c…` and 21 `WeightedHall` `63534ffb…`, keyed by (origin award, entry, digest).
   - **New declarations:** `IsSaturatingFlowQ` and `weightedHall_of_saturatingFlowQ` (from `C4U1.lean` `2b9f09d8…`).
   - **Fences on the face:**
     - It is a certificate check, not (HALL) and not evidence for it.
     - The restricted form is either omitted or fenced to `X ⊆ Y` with capacity against `Y`'s sources only; it does not compose
       across classes.
     - It is conservative over the ℕ `IsSaturatingFlow` (K1).
   - **Recommendation.** B7 is already `proved_informal` on record. A standalone award upgrades a record with no key and does not
     meet ruling 30(d) by itself. Carry it as a `lemma` inside the first award that consumes a rational certificate, rather than
     spending a Stage 7 slot on it.
2. **(NM) Lean package: not ready.**
   - **Compiled nodes:** Part C (bijection, rank, erase ⇒ Rdel); K3 (converse) and K4; A3 (unweighted sector map and erase
     commutation); `disjoint_of_indep_shell`.
   - **Open nodes:**
     - **(N-iso)**, the smallest unproved lemma: from the registered hypothesis "`G − N_G[Q]` is a perfect matching on `N` edges",
       formalized as an equivalence `e : ↥(closedNbhdSet G Q)ᶜ ≃ Fin N × Bool` preserving adjacency, derive
       `indepSetsAvoiding G (closedNbhdSet G Q) k ≃ indepFamily (matchingGraph N) k`, commuting with `erase`.
     - Re-authoring (or carrying) the Cycle 3 abstract-poset `shadow_degree_bound` in `E993Transport`.
     - The terminal composition `k·|X| ≤ 2(N−k+1)·|∂_Q X|` for `X ⊆ S^Q_{|Q|+k}`.
     - (N3), the binder diff by a reader with registry access.
     - Renaming `erase_iff_Rdel`.
3. **GK-SIGN: not ready.**
   - **Compiled:** the separation bridge (K6/A1) only.
   - **Open:**
     - **the smallest unproved lemma:** a literal `G_k : SimpleGraph (Fin (3k+5))` with `IsTree` (connectivity and acyclicity
       proved separately);
     - `H_1`/`R_1` factorizations by iterating K6/A1;
     - Lemma M (`h(N) ≥ 2^N`, `g(N) ≥ 3^{N−1}`);
     - `favorableLeaves (G_k) (k+3)` = all leaves, derived;
     - `C5LA1.aggregate G_k (k+3) < −2` for every `k ≥ 1`.
   - An eligibility statement must carry first-interior entry 0014 (`crossingIndex`), which C1-LA1 did not carry (C-U1-F).
4. **CB weight-one lemma (K5 ≡ A2): not an award group.** It is a compiled record lemma for `R30-CB-RECORD`, carried as a
   companion by a future CB award.
5. **Component-product (Part A): not an award group.** It is correct, but it is not on any key's DAG.
6. **Keys 1 and 2 on `CB(d,1)`: not ready and not recommended.** Key 2 has a complete informal proof (verified), no compiled
   fragment, and every Lean node open. It is a non-eligible laboratory theorem.

A bounded result never qualifies, and none is proposed.

## Progress and plateau assessment

material_progress: no
orientation_plateau: yes

**Ruling 30 (pre-armed plateau test), letter by letter, for orientation U:**
- **(a)** A parameter-uniform restricted-scope (HALL) theorem on an infinite eligible family at `proved_informal` or better:
  **none.** The corrected key 2 is parameter-uniform and `proved_informal` (critic-attributed, STATED), but it fails (a) on two
  counts. It is sector-restricted (a deficiency formula, not whole-network (HALL)). And `CB(d,1)` has no eligible rank for
  `d ≤ 300` (bounded).
- **(b)** Full (HALL) with switch arcs load-bearing at an eligible switch-necessary row: **none.** U2's part (b) did not reach
  `CB(8,·)`.
- **(c)** A (CUT) candidate surviving two instruments: **none.** The `CB(7,1)/6` cut survives five instruments, but at a
  non-eligible rank. It refutes a conjecture, not (HALL).
- **(d)** A Lean award beyond U1's seeds together with one of (a)–(c): **none.** No U1 declaration matches a key at exact scope,
  and (a)–(c) are absent.

**Contract §5.** No node of (HALL) moved in this orientation. The orientation's non-(HALL) yield is:
- 25 plus 13 compiled scratch declarations, all ungraded;
- two critic-attributed `proved_informal` STATED lemmas on a non-eligible laboratory family;
- a B9 record extension;
- one adversarial finding against a conjecture-grade item.

Under §5's general definition, the STATED lemma and the conjecture refutation would count as "new lemma" and "new adversarial
finding" only after their isolated second reads, and neither bears on (HALL) at an eligible row. Ruling 30 is the binding test at
this close, and on it orientation U supplies none of (a)–(d). Hence `material_progress: no` (on (HALL) and on every ruling-30
letter) and `orientation_plateau: yes`.

The stop gate's decisive events are (HALL) `formally_verified` at Stage 7, or a confirmed deficient cut. Neither is touched by
this orientation.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation U's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: **still_open.** There is no proof and no deficient cut at an eligible
  rank. The `CB(7,1)/6` deficit is at a non-eligible rank.
- **(WID):** proved (`formally_verified`, C1-LA1, entering). This orientation neither re-proves nor weakens it.
- **Outcome-B candidates in this portfolio:**
  - (SW)-type key 1 on `CB(d,1)`: proved (informal), as a B9 record extension.
  - Corrected key 2: proved (informal, verified by me at its full stated scope; critic-attributed; pending an isolated second
    read). It is a laboratory theorem, not (HALL).
  - B7: proved (informal on record; compiled in Lean).
  - (NM) and GK-SIGN: `proved_informal` as registered; their Lean forms are still open.
  - The "`S ≤ 0` ⇒ saturation on trees" conjecture: refuted by replay, at a non-eligible rank.
- **The primary aggregate:** untouched.

## Next-route allocation

**Exact remaining obligation for orientation U.**
- **(i)** (HALL-COND) at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492` under (D) ∪ (S), `F = F_p` derived, for the
  `Aut`-invariant, all-positive-weight families that meet the sector, a V⁺ source and a positive-weight S or O source (the (O2)
  narrowing of SR-C3-4). By C2-LA1 and C3-LA1 this is a statement about invariant families and the orbit-quotient Hall
  inequality.
- **(ii)** Lean side: (N-iso) for (NM), and the literal `G_k` with `IsTree` for GK-SIGN.

**Route U-A. `CB-COUPLED-THRESHOLD-REDUCTION`** (structural; outcome-B (INV)/(SW) at a named scope). Lift the C-U2-F/C-U2-T
argument from `CB(d,1)`'s scalar `j` to `CB(d,m)`'s per-choke state vector `(j_0, …, j_{m−1})` under `S_d ≀ S_m`, with the V and
S/O sources included. The ingredients are:
- supermodularity, which gives an invariant maximizer (C2-LA1 formal);
- run-additivity along each choke's class chain;
- per-choke suffix extremality;
- the derived indicators `1_v, 1_c`.

The goal is to prove that some deficient invariant family, if any exists, has an explicit per-choke threshold form. Then compute
the deficits of the finitely many threshold families at the three first ranks exactly, by branch-type generating functions,
asserting (WID) on each row. In one cycle it could close either:
- a `proved_informal` reduction lemma plus `computer_assisted` full (HALL) at the three switch-necessary first ranks (ruling 30
  (b)); or
- an explicit deficient invariant family, handed to F for the two-instrument rule (ruling 30 (c)).

C-U2-F's F-3 warns that `m ≥ 2` alone does not exclude sector-type deficiency, so the extremality must be proved, not assumed.

**Route U-B. `LEAN-NM-AND-GK-PACKAGES`** (formal). In one cycle:
- Prove (N-iso).
- Re-author `shadow_degree_bound` in `E993Transport`.
- Compose Part C, K3/K4 and A3 into (NM) at its registered unweighted statement, with the (N3) binder diff.
- In parallel, build the literal `G_k` with `IsTree` and the K6/A1 factorizations, then Lemma M and GK-SIGN's aggregate bound.
- Carry B7 as a companion `lemma`.

This could close (NM), and possibly GK-SIGN, `formally_verified`. These are awards beyond the seeds, and they count toward ruling
30 (d) only together with an (a)–(c) item from U-A or another orientation.

If only one U seat is funded, U-A comes first: it is the only U route that bears on (HALL) itself.

## Artifact inventory

All adjudicator artifacts are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-adj-U/`. Nothing was written
elsewhere except this file.

| File | SHA-256 | Role |
|---|---|---|
| `verify_capsule.py` | `c6195d267a0496d8bc89e9f1922500cb23a81ae262278fb5cf108472999481e1` | capsule seal and 21-member digest check |
| `_u2ret.txt` | `e54d4805f9930148b65d3541567179ca3350eb6eaf0a4b809ab62e67f430af8e` | byte copy of the U2 return (equals the sealed member) |
| `LeanProject/` (scaffold copied from `c4-U1`; `.lake/packages` symlinked to the pinned shared Mathlib) | — | copy-out rebuild |
| `LeanProject/LeanProof.lean` | `7cf3029a3a3971934c92a1b832d7a547a50963a275a477c8670a9412c72f5a66` | imports Main, C4U1, CritU1T, CritAdvU1F, CritInstDriftU1F |
| `LeanProject/LeanProof/{Main,C4U1,AxiomCheckC4U1,CritU1T,CritAdvU1F,CritInstDriftU1F}.lean` | as in the seal audit (byte copies) | rebuilt sources |
| `LeanProject/LeanProof/AdjProbeU.lean` | `d5a2305dfcae9011f810126e0372e437b4ba3143eaed4df3d46f671af423625c` | 31 axiom probes and 13 `#check`s |
| `lake-build.log` | `7f1363574af42474b0f8b6fe23e5a2302c2a1916f18f64862c8b4bb4e6501a4a` | build: 8661 jobs, success |
| `adj-probe.log` | `2c31a36416d22aea79897b0a6ba0d3e94f4129dc6e160688d464624eaf5c2fbd` | probe output |
| `py/adj_lib.py` | `a54ce9d221054b0957e96cf503f56585a044056917990870c8a9631a41d8236f` | independent instrument |
| `py/adj_run1.py` / `.out` | `ab1e4a7d…6ab6` / `a134c028…409b` (inner `RESULT_SHA256 5b5e73f2…0a5d`) | fixed points; `CB(7,1)/5,6`; the explicit cut |
| `py/adj_run2.py` / `.out` | `4d885788…1ded` / `1ff273c2…4d5d` (inner `a6190c40…3341`) | `CB(d,1)` `d = 2..9`: key 1, key 2, WID, conjecture scan |
| `py/adj_run3.py` / `.out` | `14ffa487…903e` / `6674fa50…5621` (inner `0b87133b…161a`) | `CB(5,2)/7`, `CB(4,2)/6` |
| `py/adj_run4.py` / `.out` | `daeb3584…75ac` / empty | abandoned (killed by literal PID 49988); not relied on |
| `py/adj_run5.py` / `.out` | `1528c4c9…5ac1` / `546ffe55…70f5` (inner `fe9f3348…1faa`) | `CB(d,1)` windows `d ≤ 300`; closed form checked against the DP |

**Replay.**
- Lean: `cd <scratch>/LeanProject && lake build && lake env lean LeanProof/AdjProbeU.lean`
- Python: `cd <scratch>/py && python3 -B adj_run1.py && python3 -B adj_run2.py 9 && python3 -B adj_run3.py && python3 -B adj_run5.py`

**Background jobs.** The only background job was `adj_run4.py`, killed by literal PID 49988 before this write. `pgrep` confirms
that no adjudicator process remains. No `lake update`, `lake clean` or `elan` was used. There was no network access and no
installs.
