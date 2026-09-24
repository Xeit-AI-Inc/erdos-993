# Cycle 1 Stage 7 — Lean gate closeout (r27, 2026-09-24)

Controller: Claude Fable 5.1. Four awards funded by the admitted synthesis (Decision 2), four closed
`formally_verified` through the governed lean-proof-workflow (Lean 4.32.2 / Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`; permitted axioms `propext`, `Classical.choice`, `Quot.sound`;
no `sorry`/`admit`/`native_decide`/`axiom`/`decide`). Every declaration authored in-run; no external Lean text
(Gate ruling 3). G1 definitions of record carried byte-identically from the r25 award source
(`736eb9df…`). Reviewer seats: two independent Opus 5 high reviewers per award (informal proof-integrity
auditor; statement-fidelity reviewer), assignments immutable, canonical fidelity inputs by the controller's
projection.

## Digests

| Award | Terminal declaration | Main.lean | kernel receipt | VERIFICATION-REPORT | informal audit | fidelity receipt |
|---|---|---|---|---|---|---|
| C1-LA1 | `Erdos993G1.forest_extension_inequality` | `b49ea82a33edc55f…` | `c721cf7958918390…` | `28bc7d1aa0536790…` | `595731fad2a16b58…` | `7f19fa3e6a90a98d…` |
| C1-LA2 | `Erdos993G1.e_ge_sub` | `24e8764fbf99bca8…` | `a4acda11494133ce…` | `73d21e93f64ae8ec…` | `792ad30ea7a3aa0e…` | `fc12cd1d309537d4…` |
| C1-LA3 | `Erdos993G1.degree_lemma_implies_chain` | `23d9a1633c9d8f84…` (round 1; round 0 `cae93961…`) | `d3c85ead997c3eba…` | `163d64e288b31273…` | `7eca7d28671a2049…` | `154d8b63e29e1e2f…` |
| C1-LA4 | `Erdos993G1.forest_descent_restriction` | `dcecb681d019a29c…` | `2e4965968b77c925…` | `8ee1e413587a694f…` | `1747cf0aca295681…` | `6f7bb4e32fc409ea…` |

Full digests in `control/C1-STAGE7-AGENTS.json` and each run's `VERIFICATION-REPORT.md`.

## What each award states

- **C1-LA1** (`runs/lean-2026-09-25-c1-la1-forest-degree-extension`, 55 declarations): (DL)
  `forest_degree_lemma` — `Σ_{J∈I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k` on every finite forest, every `k` — as a
  `lemma`, and (EX) `forest_extension_inequality` — `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k` — as the terminal
  theorem, both byte-identical to `SOLUTION-CONTRACT.md` §2. Proof of record: the injection route
  (root-corrected lemma `D_k + 2·#rootPairs ≤ 2·(k·i_k)`; rooting API with `par_par_ne` supplying the
  third use of acyclicity found by second read SR-RC; two-sided grandparent invariant; additive assembly).
  The switch point to the two-potential fallback was never reached.
- **C1-LA2** (`…-c1-la2-extension-counting-core`, 19 declarations): the graph-general counting core —
  `double_count` (`(k+1)·i_{k+1} = Σ_J e(J)`) and the terminal `e_ge_sub` (`e(J) ≥ n − k − Σ deg`), NO
  acyclicity binder.
- **C1-LA3** (`…-c1-la3-degree-lemma-implication-chain`, 39 declarations): `DlHyp → ExHyp ∧ LbHyp ∧ R5Hyp ∧
  XrHyp` with each hypothesis definitionally the §2 statement (one shared universe parameter); the
  implication is the award. Closed after ONE bounded repair round (record defects only; comment-stripped
  sources byte-identical across rounds).
- **C1-LA4** (`…-c1-la4-descent-order-bounds`, 81 declarations / 71 entries): the unconditional (LB)
  `forest_descent_linear_bound` (`Δ_k < 0 ⇒ n ≤ 4k`), (R5) `forest_rank5_ceiling_20` (`21 ≤ n ⇒ 0 ≤ Δ_5`),
  and the terminal (XR) `forest_descent_restriction` (`firstDescent G < r ⇒ n ≤ 4r − 4`), composed with
  C1-LA1's 55 entries (54 byte-identical, 1 keyword-only) and C1-LA3's hypothesis/`firstDescent` layer
  (direct route: LA3's conditional `forest_extension_inequality` collides by name with LA1's
  unconditional theorem and was not carried).

## Recorded deviations and reviewer notes (none affects a statement)

- LA1: `firstDescent` absent (an LA4 object; a `def` depending on a lemma cannot precede the lemma layer
  in the registrar); seven carried U3 bodies `theorem → lemma` (keyword only); the "ℕ↔ℤ bridge used
  exactly twice" gloss undercounts by one; "acyclicity consumed only at `rootPath_unique`" is off by one
  declaration (`par_or` applies `IsAcyclic.eq_snd_of_adj_start` directly); §9's external-slice
  identifier non-coincidence claim is unverifiable inside the Gate-ruling-3 boundary.
- LA2: INFORMAL-PROOF §6 item 1 and the contract's conclusion text claim no ℕ-subtraction anywhere in the
  development — false as written (one truncation-free `(k+1) − 1` via `Finset.card_erase_of_mem` at
  `Main.lean:183`; `omega` models it faithfully; no conclusion affected); `firstDescent` in sInf form
  (extensionally, not definitionally, the `Nat.find` object of record; nothing depends on it);
  `double_count`'s axiom line rests on `axioms-all-declarations.txt` (the receipt probes the terminal).
- LA3: round-0 false provenance sentence ("U1's file is not a capsule member") on three faces — repaired
  in round 1 with the true reason and U1-Main.lean's digest; contract scope attribution and two fences
  added; "U1's file" paraphrase for "U1's five sorry'd targets" in four places; round-0 INFORMAL-PROOF.md
  not preserved beside the other round-0 artifacts; LA3's conditional `forest_extension_inequality`
  shares the §2 name with LA1's theorem (alias distinction on the registration face).
- LA4: terminal docstring overstates provenance (the minimality lemma is not in the project; never
  consumed); `CAPSULE-VERIFICATION.json` `entries_not_carried` omits LA3 entry 13 (prose correct);
  `axioms.txt` rewritten by the verifier per its own contract (same set); contract scope attribution
  incomplete (complete on the faces); the capsule's three drifted members are LA2's close-time files.
- Controller-side: reviewer briefs cloned from r26 carried C5-LA1/`sources/r24` residue (R27-E-d,
  corrected before any reviewer read them); brief numbering (R27-E-f); the SR-JOIN instance-count
  attribution (R27-E-g); the SR-EXX grade gloss (R27-E-e).

## Reviewer seats

Per award: informal auditor `c1-laN-fable-informal-20260925`, fidelity reviewer
`c1-laN-fable-fidelity-20260925` (Claude Opus 5, high, on dispatch-record authority); agent ids in
`control/C1-STAGE7-AGENTS.json`. LA3's two reviewers were resumed (never re-spawned) for round 2.

## Ruling

Stop-gate (a) of `SOLUTION-CONTRACT.md` §5 is MET: (DL) and (EX) formally verified at §2; (LB), (R5),
(XR) checked formally (C1-LA4); the rank-5 residue closed out dependency by dependency
(`records/R27-RANK5-RESIDUE-CLOSEOUT.md`, second read SR-REC). Under Gate ruling 9 the run ENDS at the
Cycle 1 close. Every registration carries its grade and attribution on its face; no status transfers
across fence §3.1.
