# Second Read

Read `SR-C4-7`, r30 Cycle 4 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Isolated second reader: Claude Opus 5.5,
effort high. Operating within VerityOS: booted from `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` only. Governing texts: `control/C4-SECOND-READ-PROTOCOL.md` and
`control/C4-SECOND-READ-BRIEF-SR-C4-7.md`. This is a light read, not decisive for ruling 30.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- Capsule: `control/c4-second-read/SR-C4-7-PACKET-MANIFEST.json`, stage `cycle-4-second-read-SR-C4-7`, schema
  `verityos.math-dre.packet-manifest.v1`, `file_count` 29.
- Inner seal: I took the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no trailing newline.
  - Recorded: `9e0195f87ec268be0380aec21245093a7dd9f2a47b78fc21eafaca1163df57da`.
  - Computed: `9e0195f87ec268be0380aec21245093a7dd9f2a47b78fc21eafaca1163df57da`.
  - **MATCH.**
- Members: 29 of 29 match on both SHA-256 and byte count (`scratchpad/c4-sr-SR-C4-7/seal_audit.py`). Nothing mismatched.
- Registry: the run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c4-stage2.json` has 448 claims, as the brief states.
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is `OPEN` (`open_successor_proposal`), in the snapshot and in the frozen authority
    registry (434 claims).
  - No entry mentions `CB(7,1)`, `CB71` or `SATURATION-FAILURE`.
  - No entry carries the conjecture. The Cycle 3 close (§4) lists it as "not registered (by ruling) … conjecture grade only".
  - The proposed record id is therefore new.
- The frozen reference instruments under `sources/c4-stage7-sources/` are not capsule members, so I did not open them. Only their
  `SOURCE-DIGESTS.json` is a member, and its digest verified. My numbers come from my own instrument only.

## Statements read

- **SR-C4-7a.** `CB(7,1)` is the path `r–s–v`, one choke `u` on `r`, and seven supports `b_j` on `u`, each with a private leaf
  `c_j`. It has `n = 18`, `α = 9`, `x = 6`, and an empty eligible window.
  - At `p = 6`, with `F_6` = all 8 leaves (derived): supply 924, capacity 945, `S = −21`, with (WID) checked from both sides.
  - The whole-network exact max-flow under (D) ∪ (S) is 903 < 924.
  - A deficient family is the sector's `j ≥ 2` support-count suffix: 546 sources of weight 1 against a neighbourhood of weight 525.
- **SR-C4-7b.** The consequence and its fences.
  - The Cycle 3 conjecture (C-U2-F, `conjecture` grade, never registered) "on trees `S(T,p) ≤ 0` ⇒ a saturating flow at every rank"
    is FALSE.
  - The rank is NON-eligible, so this is not a (CUT).
  - (HALL) is untouched, no registered key changes status, and no refuted mechanism key is revived.
- Statement of record: `cycles/cycle-4/stage6/SYNTHESIS.md` at R-11 (l. 170), EST-12 (l. 295), `## Refuted or narrowed mechanisms`
  (l. 331), `## Headline verdicts` (HALL) note (iii) (l. 414), and `## Registrations` item 11 (l. 836).
- Origins read in the capsule:
  - the Cycle 4 critics: C-U2-F F-1 (l. 118–136), C-U2-T A1 (l. 111–114) and C-T1-F (l. 130–133);
  - the U adjudication, row 6 (l. 173), and the F adjudication (l. 157, 291–294, 320);
  - the controller replays `CF-REPLAY-c4a.json` and `CF-REPLAY-c4b.json`, and the Stage 6 controller facts at l. 14, 98 and 122;
  - U2's return (l. 329–356);
  - the conjecture's origin, the Cycle 3 C-U2-F critique, item 2 (l. 296–327).

## Independent re-derivation

I wrote my own instrument, `scratchpad/c4-sr-SR-C4-7/sr7_cb71.py`. It uses only the standard library and exact integers, run as
`python3 -B`, with no dependence on any seat or controller code. It enumerates all `2^18` vertex subsets literally.

- **Tree.** 18 vertices and 17 edges, with a BFS connectivity check, so it is a tree. Leaves `{v, c_1..c_7}`, 8 in all.
  `support(v) = s` and `support(c_j) = b_j`.
- **Independence polynomial.** `i = (1, 18, 136, 581, 1561, 2737, 3115, 2193, 847, 130)`, so `α = 9`.
  - `x`, computed through rank `α` with the terminal zero extension: `Δ_5 = +378` and `Δ_6 = 2193 − 3115 < 0`, so `x = 6`.
  - Eligible window: `x + 2 = 8 ≤ p ≤ ⌊2α/3⌋ = 6` is **empty**. I cross-checked this against the literal predicate
    `x + 2 ≤ p ∧ 3p < 2α + 1`.
  - At `p = 6`, `3p = 18 < 19 = 2α + 1` holds but `x + 2 ≤ p` fails, so `p = 6` is non-eligible because it lies below the window.
    `CB(7,1)` has no eligible rank at all.
- **Selector.** `F_6` is computed from `Δ_6(T − v) < 0` on the ORIGINAL tree.
  - For `v`: `i_7 = 1052 < i_6 = 1848`.
  - For each `c_j`: `i_7 = 1277 < i_6 = 1988`.
  - So `F_6` = all 8 leaves (**derived**, not hard-coded).
- **Weights.** `w_F(B)` is computed literally: tag `v ∈ F ∩ B` is active iff `(B ∖ {v}) ∩ W_v ≠ ∅`, with `W_v = N(s_v) ∖ {v}`.
  A second coding (`w2` in `sr7_extras.py`, explicit witness loop) agrees on all 2193 + 3115 sets.
- **(WID), both sides.**
  - Supply `Σ_{I_7} w_F = 924` and capacity `Σ_{I_6} w_F = 945`, so supply − capacity = **−21**.
  - `S(T,6)` from the definition `Σ_{v∈F} [Δ_5(T − H_v) − Δ_5(T − R_v)]` (deletion sets `H_v = {v, s_v}`, `R_v = N[s_v]`) is
    **−21**. The equality is asserted in the code.
  - The general identity `Σ_{I_j} w_F = Σ_{v∈F} q_v(j − 1)` also holds at every `j = 1..10`.
  - ℕ-subtraction: the only one is `p − 1 = 5`, guarded by `p = 6 ≥ 1`.
- **Relation.** (D) ∪ (S) is taken literally: every single deletion, plus every `u ∉ B` with `|N(u) ∩ B| = 2` giving
  `(B ∖ N(u)) ∪ {u}`.
  - Each image is asserted independent, of size 6, and a member of `I_6`.
  - There are 16674 arcs in all, 1323 of them switch arcs.
  - A second coding of the relation (`rel2`) agrees on every source.
- **Whole-network exact max-flow.** Dinic gives **903**, and Edmonds–Karp in the companion script gives **903**. Both are below 924,
  so the shortfall is 21 and no saturating flow exists.
  - Deletion-only max-flow is 812.
  - The sector-restricted max-flow is 651, with sector supply 672 and sector neighbourhood capacity 700.
- **The deficient family.** `X = {B ∈ I_7 : r, v ∈ B, |B ∩ {b_1..b_7}| ≥ 2}`.
  - `|X| = 546`. Every sector member has weight exactly 1: the arm tag `v` is active through `r`, and each private tag is inactive
    because `u ∉ B`. So `Σ_X w_F = 546`.
  - Class counts by support number 2/3/4/5 are 210/210/105/21, which is `C(7,5)·C(5,j)` summed to 546. The closed form
    `C(7,5)·2^5 − C(7,5) − 5·C(7,5) = 546` agrees.
  - `N(X)`, computed literally, has 2163 targets. Of these, 525 have weight 1 and 1638 have weight 0, so `Σ_{N(X)} w_F = 525`.
    The 546 switch-only targets all have weight 0.
  - Deficit `546 − 525 = 21 = supply − max-flow`.
  - The residual-reachable source side of the minimum cut, taken over positive-weight sources, is **exactly** `X` as a set, so `X`
    attains the maximum Hall deficiency.
- **Suffix scan.** For the sector families with at least `j0` supports, the deficits at `j0 = 0..5` are −28, −49, **+21**, −49, −49
  and −14. Only the `j ≥ 2` suffix is deficient.

Every number in SR-C4-7a is reproduced literally. It also agrees with the capsule's secondary figures: the sector figures
672/700/651 and the class counts in `CF-REPLAY-c4a`, the whole-network figures 903/21 in `CF-REPLAY-c4b`, the deletion-only 812 of
the U and F adjudications, and the 2163 targets of C-U2-F and C-U2-T.

## Findings and repairs

1. **SR-C4-7a: no repair.** All figures reproduce exactly. The derivation of `F_6`, the (WID) assertion, the literal relation and
   the explicit cut satisfy fence 3 of SOLUTION-CONTRACT §3 (weight and relation fidelity).
2. **SR-C4-7b: the substance is correct.**
   - (CUT) (SEMANTIC-CONTRACT §1.2) requires `p` eligible. `p = 6` is not eligible, and neither is any rank of `CB(7,1)`, so this is
     not a (CUT).
   - (HALL) quantifies over eligible `p` only, so it is untouched. It stays OPEN in the snapshot.
   - The primary aggregate is untouched (fence 1). Here `S = −21 ≤ 0` in any case.
   - No key changes status: the conjecture was never registered.
   - The record proposes no mechanism, so none of the refuted keys of §3.2 is revived.
   - The record gives no proof, no RTree wording and no census input to a proof (fences 4 and 6).
3. **Repair (precision of the refuted statement).**
   - At its origin (Cycle 3 C-U2-F, item 2), the conjecture is a BICONDITIONAL: "on trees, (HALL-COND) at rank `p` ⟺ `S(T,p) ≤ 0`".
     It was stated after a census of every rank through order 15.
   - The phrasing "`S ≤ 0` ⇒ saturation at every rank" (Cycle 3 close, controller facts, synthesis R-11) is its ⇐ direction.
   - The ⇒ direction is (FLOW⇒SIGN), which holds on every finite simple graph, so it is not refuted.
   - The record should say that the ⇐ direction is the one refuted, so that the biconditional's fall is never read as a failure of
     (FLOW⇒SIGN).
   - The quantifier "at rank `p`, every rank" covers non-eligible ranks, so a non-eligible counterexample does refute it.
4. **Repair (attribution disambiguation).** The seat label `C-U2-F` names two different critics: the conjecture's Cycle 3 author and
   one of the Cycle 4 finders. The record text qualifies each by its cycle.
5. **Provenance note, not a defect.** Synthesis R-11 and Registrations item 11 cite a replay by the T adjudicator. The T adjudication
   is not in my capsule, so I cannot confirm it. The U and F adjudicator replays and both controller replays are in the capsule and
   agree. The registration text below cites T's replay "as recorded in the Cycle 4 synthesis R-11".
6. **Strengthening, carried on the face.** `CB(7,1)` has no eligible rank at all (window `[8, 6]` empty), not merely a non-eligible
   `p = 6`.
7. **Key predicate check.**
   - `R30-CB-RECORD-C4-CB71-RANK6-NON-ELIGIBLE-SATURATION-FAILURE` is a record-row id. Read as a predicate, it says that at `CB(7,1)`,
     rank 6, which is non-eligible, a saturating flow fails to exist. The statement satisfies this, and the name asserts nothing more:
     it does not say "cut", "Hall" or "refuted".
   - The scope note on `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` changes no status.

## Registration text

```text
RECORD: R30-CB-RECORD-C4-CB71-RANK6-NON-ELIGIBLE-SATURATION-FAILURE
CLAIM: On the finite ordinary tree CB(7,1) (path r–s–v; one choke u adjacent to r; seven supports b_1..b_7 adjacent to u, each with one private leaf c_j; n = 18, α = 9, x = 6 computed through rank α; eligible window [8, 6] empty, so CB(7,1) has no eligible rank), at the non-eligible rank p = 6 (p < x + 2) with F = F_6(T) = all 8 original leaves (derived from Δ_6(T − v) < 0 on the original tree) and the active-tag weight w_F: total source supply Σ_{I_7} w_F = 924, total target capacity Σ_{I_6} w_F = 945, S(T, 6) = −21 from both sides of (WID); the exact maximum flow of the whole (D) ∪ (S) network is 903 < 924 (deletion-only 812), so no saturating integral flow exists; an explicit deficient family is X = {B ∈ I_7 : r, v ∈ B, |B ∩ {b_1..b_7}| ≥ 2} (the root-plus-arm sector's support-count suffix j ≥ 2; 546 members, each of active weight 1; 210/210/105/21 at support number 2/3/4/5), whose literal neighbourhood N(X) has 2163 targets of total weight 525, a deficit of 21 = supply − max-flow, X being the source side of a minimum cut. Consequently the ⇐ direction of the Cycle 3 conjecture of C-U2-F (Cycle 3 critic; conjecture grade; never registered) "on trees, (HALL-COND) at rank p ⟺ S(T, p) ≤ 0" — recorded at the Cycle 3 close as "on trees S ≤ 0 ⇒ saturation at every rank" — is FALSE; its ⇒ direction is (FLOW⇒SIGN) and is unaffected.
STATUS: bounded_computation
PROVENANCE: Found independently by the Cycle 4 critics C-U2-F (cut by enumeration without max-flow, c2_cut_cert.py; U2's network.py as second instrument), C-U2-T (cb71.py, cut71.py; U2's network.py and wid.py) and C-T1-F (cut71.py); replayed by the U adjudicator and the F adjudicator (own literal replay, R6), and by the T adjudicator as recorded in the Cycle 4 synthesis R-11; controller replays CF-REPLAY-c4a.json and CF-REPLAY-c4b.json (CF-0; generators cf_replay_c4a.py, cf_replay_c4b.py); confirmed by isolated second read SR-C4-7 (Claude Opus 5.5, own instrument). Conjecture origin: C-U2-F of Cycle 3 (cycles/cycle-3/stage4/critics/U2/F/CRITIQUE.md, item 2; conjecture grade). Transport network, active-tag weight and relation: Codex (GPT-6 Astra/Sol/Luna), the lower-region run; CB(d,m) family and sector facts: r30 seats of record. Fences: not a (CUT) — (CUT) requires an eligible rank and CB(7,1) has none; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL untouched (OPEN); E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE untouched; no registered key changes status; no refuted mechanism key revived; bounded_computation, never proof.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: The conjecture-grade statement "on trees, S(T, p) ≤ 0 ⇒ a saturating flow at rank p" (the ⇐ direction of the Cycle 3 C-U2-F conjecture "(HALL-COND) at rank p ⟺ S(T, p) ≤ 0"; never registered) fails at the non-eligible CB(7,1), p = 6: S = −21, whole-network (D) ∪ (S) max-flow 903 of 924, a deficient family of 546 root-plus-arm sector members of active weight 1 against a neighbourhood of weight 525 (record R30-CB-RECORD-C4-CB71-RANK6-NON-ELIGIBLE-SATURATION-FAILURE; bounded_computation). CB(7,1) has no eligible rank (window [8, 6] empty), so this is not a (CUT); (HALL), which quantifies over eligible ranks only, is untouched and stays OPEN. Attribution: Cycle 4 critics C-U2-F, C-U2-T and C-T1-F (found independently); the adjudicator replays and controller replays c4a/c4b; isolated second read SR-C4-7.
```

## Verdicts

verdict[SR-C4-7a]: confirmed
verdict[SR-C4-7b]: confirmed_with_repairs

The SR-C4-7b repairs are in the registration text above:

- the refuted statement is named as the ⇐ direction of the original biconditional, with (FLOW⇒SIGN) unaffected;
- `C-U2-F` is qualified by its cycle;
- the T adjudicator's replay is cited through the synthesis;
- "no eligible rank at all" is carried on the face.

The fences are confirmed as the synthesis states them.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All scratch files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-7/`.

| File | Bytes | SHA-256 | Role |
|---|---|---|---|
| `seal_audit.py` | 721 | `8ba1ceaddba63b4fc7d6b78177823acb178ae389b0fcd70199e515a787969338` | inner seal plus the 29 member digests and byte counts |
| `sr7_cb71.py` | 7211 | `177312633cbe5ff1d7a6ba83372189c8d1b0cb06ad3270dc3f6216fae9169444` | own instrument: tree, `x`, window, `F_6`, `w_F`, (WID) both sides, literal (D) ∪ (S), Dinic, min cut, `X`, `N(X)`, suffix scan |
| `sr7_cb71_out.json` | 1739 | `b491009f44ac6508eda4d82f30594acd55fbeeee78d18bd6884dd879fa648eef` | its output |
| `sr7_extras.py` | 2895 | `e46cb175f752fe3301cc630eaf9147824fe443a4138a3d46df3d11563ee53045` | Edmonds–Karp (whole, deletion-only, sector), class counts, second codings of the relation and the weight |
| `sr7_extras_out.json` | 380 | `11e26370ae4c04c503e0d258d5d706ce8290098f05a203b5481d440063df2588` | its output |

**Read-boundary deviations.**

1. I read `control/C4-SECOND-READ-PROTOCOL.md` together with the manifest before recomputing the seal, as the launch instruction
   ordered. The protocol is a capsule member, and its digest verified immediately afterwards.
2. The harness injected the project `CLAUDE.md` and the user memory index into context at session start. I did not read them as
   files and used nothing from them. The boot reads were exactly `verity.md` and `identity/startup-protocol.md`.
3. There are no other deviations.
   - Every other read was a capsule member. I used `grep`/`sed` on individual member files only.
   - I did not open the `sources/c4-stage7-sources/` instruments or anything outside the capsule.
   - I ran no controller or seat generator.
   - I used no network, no installs and no Lean, and started no background jobs or child agents.
   - I wrote only this file and my own scratch directory.
   - I made no conversation log: the protocol limits writes to one file plus scratch.
