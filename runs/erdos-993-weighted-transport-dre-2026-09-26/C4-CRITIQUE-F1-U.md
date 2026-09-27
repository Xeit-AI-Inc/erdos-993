# Critique

Critic `C-F1-U` (orientation U, formal/structural) of the Cycle 4 Stage 3 return of seat `F1`, route
`C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH` (orientation F). Run
`erdos-993-math-dre-20260926-r30-weighted-transport`. Object: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]`

**Boot acknowledgment.** Operating within VerityOS. Booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, per the dispatch's restricted boot. No other VerityOS subsystem
(memory, conversations, operations, logs, decisions) was opened. The host injected the repository `CLAUDE.md` and the memory
index into context at session start. I did not open or act on either.

**Read-boundary disclosure.** (1) I ran one non-recursive `ls -la` on `scratchpad/c4-F1/` (granted) and on
`scratchpad/c4-F1-replay/`, and one `diff -rq` between the two. The replay directory is the byte-identical copy that the return
names, but the dispatch grants only `scratchpad/c4-F1/`. I used the diff only to test the return's parity literal. (2) The
harness saved the full text of `RETURN.md`, a capsule member, to a tool-results file under `~/.claude/projects/…`, and I read it
there. The bytes are the digest-verified capsule member. (3) From `control/C4-CRITIC-ATTACK-BRIEFS.md` I read the common preamble
(lines 1–19) and the F1 section only. (4) I ran single-file `grep`s on `C4-CRITIC-ATTACK-BRIEFS.md` and `C4-ALLOCATION.md` (both
granted) and a `grep` inside my own replay copy. I ran no `find`, `rg`, recursive listing or glob above the grant. I used no
network and installed nothing. Every script ran in the foreground with `python3 -B`. I started no background job, so none remains.

## Identity and seal audit

- **Dispatch file** `control/dispatch/c4-stage4/DISPATCH-C-F1-U.md`: SHA-256 recomputed as
  `e6ec1a85ae7b0fc3852144bcfb6ff0c86e3bad47034e4ae69db392c8ff1a27cf`. **Match.**
- **Capsule seal** (`control/c4-critic-capsules/F1-PACKET-MANIFEST.json`). I recomputed SHA-256 over compact key-sorted JSON
  without `seal_sha256` and with no trailing newline, and got `2cf863de5d64a1745052514b8347dfa5eb794bbed6e668b6a3d8ce4a642cae6b`.
  **Match.** All 14 members match on SHA-256 and byte count, including `RETURN.md` (`2b4adde7…`, 37002 bytes).
- **Stage 4 dispatch manifest seal** recomputed as `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`. **Match.**
- **Stage 3 packet manifest seal** recomputed as `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`. **Match.**
- **Stage 2 seal** recomputed as `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. **Match.**
- **Return-listed digests.** I checked the SHA-256 of the copy-out replay of `scratchpad/c4-F1/`. `micro.py` `0f46eaa3…`,
  `validate5.py` `6329972d…`, `run_rows2.py` `97b7549c…`, `run_rows.py` `5d01d185…`, `coarse_check.py` `28c280f8…`,
  `rows_output2.json` `6d910653…` and `rows_output.json` `3ca09377…` **all match**. `diff -rq` between `c4-F1/` and
  `c4-F1-replay/` finds no differences.
- **Uninventoried artifacts.** `scratchpad/c4-F1/` also holds `run_rows_strict.py` (`3c768de1…`) and `rows_output_strict.json`
  (`0a36677d…`), which the return never mentions. They hold a STRICT run of the older `bigrun.py` model with the q-increasing
  switch arc omitted. That run does **not** saturate at `CB(8,86)/460`, and its min-cut is the two sector classes. This is the
  known sector deletion deficit, not a cut. It does show that switch arcs carry load in the model. The return should have
  inventoried the file. The files `bigrun.py`, `classnet.py`, `validate.py`, `validate2.py`, `classify.py` and
  `verify_manifest_seal.py` are present and only partly inventoried.
- **Timestamps.** `bigrun2.py` (mtime 01:57) is newer than `rows_output2.json` (01:56). My replay of `run_rows2.py` with the
  shipped code reproduced every row field exactly except `time_s`: supply, flow, `saturating` and `num_classes`. The late edit
  therefore changed no reported value.
- **Claim identity.** Keys touched: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, untouched). (WID)
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (`formally_verified`, used as the identity). C2-LA1
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (cited only, not used as a step).
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (`computer_assisted`, distinct). The return
  registers no new key, which is correct. `control/CLAIM-IDENTITY.run-local.json` is not a capsule member, so I did not alias-check
  it myself. The synthesis must do that if it registers anything (see Verdict).

## Independent re-derivation

**Instrument.** Everything under `scratchpad/c4-crit-F1-U/own/` is written from SEMANTIC-CONTRACT §1.1–1.2 and shares no code
with F1. It has four parts:
- brute-force independent-set enumeration;
- literal `w_F` (active tags, `B ∩ N(s_v) ∖ {v} ≠ ∅`) and literal (D) ∪ (S);
- a generic forest DP for `i_k(T)`, `i_k(T − ℓ)`, `i_k(H_v)` and `i_k(R_v)`;
- `x` scanned through rank `α`, and `F_p` derived from `Δ_p(T − ℓ) < 0` on the original tree.

Every tree is tested for connectivity, acyclicity and `|E| = n − 1`. Every instance asserts `supply − capacity = S`, using two
different computations for the two sides.

**Fixed points reproduced exactly** (`own/fixed.py`):
- `K_{1,12}/8`: `n = 13`, `α = 12`, `x = 6`, 12 favorable; `1980/3960`, `S = −1980`; flow 1980; 1980 arcs, all deletions.
- Path-star `(2,3,4)/7`: `1483/2701`, `S = −1218`, flow 1483, 2025 arcs.
- Path-star `(2,2,4,3)/8`: `8033/13467`, `S = −5434`, flow 8033, 11691 arcs.

**Fidelity of the return.** F1's weight is the active-tag weight. Its §2.2 derivation is correct for this shape: `W_{c_ij} =
{u_i}`, `W_v = {r}`, and out-branches carry no weight. The relation is literal (D) ∪ (S). `F` is fixed at the original rank `p`.
`x` is computed through rank `α`. **Fidelity passes.**

**Table 0, re-derived** (`own/table0.py`, `table0_rows.json` `2655debc…`). Side A is my own closed-form active-weight layer
generating function. Side B is the generic forest DP of `H_v`/`R_v`, with `F_p` derived per leaf orbit. At all six rows I get
exactly the return's `n`, `α`, `x`, eligibility and `F_p` = all leaves, plus WID from the two sides:

| Row | `n` | `α` | `x` | `p` | `\|F_p\|` |
|---|---|---|---|---|---|
| `CB(8,86)` | 1465 | 775 | 458 | 460 | 689 |
| `CB(8,89)` | 1516 | 802 | 474 | 476 | 713 |
| `CB(8,92)` | 1567 | 829 | 490 | 492 | 737 |
| `CB(8,108)` | 1839 | 973 | 575 | 577 | 865 |
| `CB(7,144)` | 2163 | 1153 | 671 | 673 | 1009 |
| `G(8^82,7^2)` | 1427 | 755 | 446 | 448 | 671 |

`S < 0` on every row. My supply, capacity and `S` equal F1's `rows_output.json` digit for digit on all six rows. My `S` at
`CB(8,86)/460` begins `−74235140843389047729457826493` and has 328 digits, as the return states. My supply equals the class
model's `total_supply` on all six rows. My code shares nothing with F1, so these are two independent paths (gate ruling 31).

**Micro-rules.** I re-derived S-at-u, S-at-b, S-at-r, S-at-s, D-u and D-b from §1.2 myself and agree with the return's rules.
Examples: S-at-u needs `|N(u_i) ∩ B| = 2`, which means either `r ∈ B` and `n_b = 1`, or `r ∉ B` and `n_b = 2`. S-at-b needs
`u_i, c_ij ∈ B`. S-at-r needs `[s ∈ B] + q = 2`. Replaying `micro.py` gives `TOTAL_CHECKED 11892 TOTAL_MISMATCH 0`. The
"776 mismatches before the fix" is a self-report with no shipped pre-fix artifact.

**Sector cross-check** (`own/sector.py`, brute-validated on 3 small rows). The whole-sector mixed-neighbourhood ratios at the
three `CB(8,·)` first ranks are `14.3213`, `14.7859` and `15.2506`. At 492 the switch image alone gives `14.2526`. These
reproduce SR-C3-6's figures as quoted in the attack brief.

## Attacks and findings

**F-1: the logical direction of "saturates" (the main finding).** `bigrun2.run_cut_search2` builds a class-contracted network:
- each refined class is one source node (summed supply) and one target node (summed capacity);
- an arc runs between classes wherever the rule table allows one.

Its saturation is exactly this statement: for every union `X` of refined source classes, `Σ_X w ≤ Σ` (full capacity of every
target class the model joins to `X`). That is **not** literal Hall for class unions, for two reasons.
- (a) **Target aggregation.** A literal `N(X)` can meet a target class only partly. My instrument measures this on four eligible
  small rows (`own/classslack.py`). At `(1,1,2,2,2)/9` the single class `(S,2,01,EinNoBm)` has `w(C) = 2` and a literal `N`
  weight of 22. The exact class quotient credits it 2350, and F1's model credits 7624. The other three rows give 10 vs 226 vs 676,
  30 vs 1014 vs 5493, and 90 vs 417 vs 1029. On every row, 32–63 of the 40–63 positive classes are over-credited even by the exact
  quotient.
- (b) **Spurious arcs.** See F-2.

The only valid direction is this one: a deficit in a model that never omits a literal arc would prove a literal deficient
class union. The model found no deficit. So "no class-union cut found" certifies only that **this relaxed model exhibits no
deficit**. It does **not** certify that no class-union cut of the refined partition exists in the literal network.

**F-2: "EXACT arcs", "0 extra", and "extras confined to two places" are false.** Replaying `validate5.py` prints
`VALIDATE5_ISSUES` with 878, 986, 733 and 1094 extra class arcs on its four trees. The docstrings of `bigrun2.py` and
`validate5.py` both claim "0 missing, 0 extra". Many of these extras come from empty classes, but not all. Restricted to classes
with positive supply and capacity at an eligible rank, F1's model has 82–195 arcs per row that no literal member realises. They
are overwhelmingly the **general q-decreasing arc**, which §7 grades "proved":

| Row | q-decreasing spurious arcs | all spurious arcs |
|---|---|---|
| `(1,1,1,4)/8` | 78 | 82 |
| `(1,2,2,2)/8` | 83 | 101 |
| `(1,1,1,2,3)/9` | 189 | 195 |
| `(1,1,2,2,2)/9` | 158 | 185 |

The S-at-r bridges contribute only 4–5 per row.

The cause: D-u and S-at-b turn one in-branch into an out-branch with `n_b ∈ {0,1}` and leave every other out-branch untouched.
The target's `(hasA, hasB)` is therefore exactly `(1, hasB(source))`. The model allows both `10` and `11` from every source.
Literal data show zero violations of the corrected rule on four eligible rows (`own/missing.py`). No literal class arc is missing
from F1's model, so the safe direction holds.

**F-3: the "hasA merge" claim is false.** §2.4 says the `n_b = 0` and `n_b = 1` sub-cases are "reachability-equivalent at the
class level (proved in 2.5)". They are not. S-at-u-with-r needs `n_b = 1` exactly, and D-b cannot fire at `n_b = 0`. §2.5 itself
gives `hasA` only as a *necessary* gate. The merge is one more source of relaxation, not a proved equivalence.

**F-4: the max-flow "exact match" validation cannot detect over-permissiveness.** In all 14 of `validate5.py`'s `(tree, p)`
instances, the literal flow equals `min(supply, capacity)` (`own/compare.py`, which reproduces their numbers exactly). Any
relaxation would pass such a test. Under rulings 17/24 the test is struck as evidence of model exactness. It remains a
consistency check.

**F-5: obligation (b) is not answered.** §6 says Table 1 "certifies … that no deficient `X` exists among unions of `sec`'s
`hasA/hasB` sub-classes … in particular no deficient `X ⊆ sec` was found". The search contains four sector sub-classes, so it
tests at most 15 sector subfamilies, and only inside the relaxation. Arbitrary `X ⊆ sec` are never examined. The retraction of the
Aut-collapse argument is complete: no number depends on it, and the `G` row's Table 1 value comes from the same replay-backed
search. But sector Hall under (D) ∪ (S) for every `X ⊆ sec` at `G(8^82,7^2)/448` stays **OPEN**, and the "certifies" sentence is
struck.

**F-6: numbers and the sentinel.** My replay of `run_rows2.py` reproduces Table 1 exactly: 3116, 3224, 3332, 3908, 5204 and 3044
classes, with `total_supply == max_flow` on every row. The shipped `bigrun2.py` (line 263), `bigrun.py` (line 270) and
`coarse_check.py` (line 53) all use the fixed sentinel `10·supply + 10`. Every reported max-flow was therefore computed with the
fix. `coarse_check.py` replays and saturates at the three `CB(8,·)` rows. It checks tooling against a sealed record, not
independent evidence, and it uses the older `bigrun.py` model rather than `bigrun2.py`.

**F-7: comparison with Cycle 3.** The return reports no whole-layer fraction, so nothing can be compared against C-F1-T's exact
fractions. C-F1-T's critique is not a capsule member for me. My independent sector ratios match SR-C3-6's quoted values (see
Independent re-derivation).

**Critic-derived advance A1 (`proved_informal`, elementary; attributed to C-F1-U).** For the refined `(τ, q, hasA, hasB,
inflag)` classes, every q-decreasing same-`τ` arc (D-u, S-at-b) and every S-at-r bridge obeys two rules:
- the target has `(hasA, hasB) = (1, hasB(source))`;
- the target's `inflag` is no greater than the source's, in the order `NA < NoEin < EinNoBm < Bm`.

Proof: the move converts in-branches to out-branches with `n_b ∈ {0,1}` and touches no other out-branch. It only removes
in-branches, so the maximum absent-leaf count cannot rise. `own/tight.py check` confirms that the tightened model loses no literal
arc at any size on 7 trees, including heterogeneous ones.

**Critic-derived advance A2 (`bounded_computation`; attributed to C-F1-U).** With the A1 rules, the model at `G(8^82,7^2)/448`
drops from 20342 to 13254 positive arcs. The tightened relaxation **still saturates at all six rows** (`own/tight_rows.json`
`e17f0535…`, 187 s). It is still a relaxation, for the target-aggregation reason in F-1. The record gets sharper, but it is still
no certificate.

**Critic-derived advance A3 (toward obligation (b); family-level `bounded_computation` plus an elementary obstruction;
attributed to C-F1-U).** At `G(8^82,7^2)/448`:
- **Sector structure.** The sector (`r, v ∈ B`) is the product of 670 two-atom stars. Every member has weight exactly 1.
  Positive-weight exits are of two kinds: deletions inside the sector (weight 1), and S-at-`u_i` when branch `i` has exactly one
  support, with target weight `n_c(i)`. Every other exit has weight 0. I validated this reduction against brute force on 3 rows.
- **Whole sector.** The deletion-only ratio is exactly `447/448`. The mixed ratio `w(N(sec))/|sec|` is `14.1052`.
- **Switch-free family.** `X_sf` is the set of sector members with no branch having `n_b = 1, n_c ≥ 1`. Its size is
  `3.94·10⁻⁷ |sec|`, and `w(∂X_sf)/|X_sf| = 16.2865`.
- **Obstruction.** Some sector targets have all 448 parents without a useful switch exit: every branch is empty, all-leaf, or has
  `n_b ≥ 2`. They make up a fraction `2.44·10⁻⁹` of sector targets (`4.60·10⁻¹⁰` at `CB(8,92)/492`), and the count matches brute
  force on 3 small rows (`own/badtargets.py`). **Consequence:** the natural uniform fractional flow cannot prove sector Hall. That
  flow sends `1/448` of each source's unit through switches and the rest spread evenly over its 447 deletion children, and at
  these targets the load is `448/447 > 1`. A sector certificate must route switch-free sources non-uniformly.

A3 checks two families. It is not (HALL-COND) for every `X ⊆ sec`.

## Mechanism-equivalence and fence check

- F1 proposes no transport mechanism. It is a bounded search on six named trees. It uses the switch arcs (S) and the active
  weight, so it is not deletion-only Hall. It revives none of the ten refuted keys: not Delete/Retag, not own-support unit
  capacity, not per-leaf injectivity, not occupancy domination, not signed cross-tag, not covariance.
- It re-proves no closed region. The six rows lie in the lower region. The Cycle 3 record is used as a tooling sanity check, not
  as a contribution.
- No census value enters a proof. There is no RTree wording. (LIFT) is not used for quotient feasibility, and `D, C ≥ 0` is not
  used as a budget.
- C2-LA1 is cited, but its orbit collapse is not invoked, and the heterogeneous-arity Aut error was retracted.
- The only fence-adjacent problem is epistemic, not a mechanism revival: F1 treats a class-contracted relaxation's saturation as
  if it covered class-union families of the literal network (F-1, F-5). Sector weight one, the `447/448` deletion ratio and the
  `CB(8,92)` fixed points all come out of my instrument.

## Certification audit

Struck. Each item below is unbacked or false against the shipped evidence.
1. `bigrun2.py` docstring: "EXACT arcs (no over/under approximation needed anywhere)". `validate5.py` docstring: "EXACT (0
   missing, 0 extra)". False: replay prints `VALIDATE5_ISSUES` (F-2).
2. §2.6: "a small number of 'extra' edges … confined to two places". False: 733–1094 extras per validation tree, and at eligible
   ranks the spurious positive arcs are mostly general q-decreasing arcs (F-2).
3. §2.4: "the two sub-cases are reachability-equivalent at the class level (proved in 2.5)". False (F-3).
4. §7: "exact reachability rules for the two GENERAL q-changing arcs: **proved**". Narrowed. The necessary gates are proved. The
   q-decreasing target rule as implemented is not exact; A1 gives the exact rule.
5. §2.6: "the model's exact-integer max-flow value EQUALS the literal … max-flow" offered as validation of the model. The
   equality is replay-backed but non-discriminating (F-4), so it is struck as evidence of exactness.
6. §6: "it certifies … that no deficient `X` exists among unions of `sec`'s `hasA/hasB` sub-classes … in particular no deficient
   `X ⊆ sec` was found". Struck (F-1, F-5).
7. Remaining obligation 1: closing the bridges "converts Table 1 … into a genuine Hall CERTIFICATE for every union of these
   refined classes". False. Target aggregation and the q-decreasing extras remain (F-1, A2).
8. Remaining obligation 2b: the residual is a "vanishing fraction … `q ≤ 2` sliver". No computation backs this, and the main
   residual is not at `q ≤ 2` at all.
9. §4: `rows_output2.json`'s internal `PAYLOAD_SHA256` is "the same value" as the file SHA-256 (`6d910653…`). False. The internal
   field is `73b46ebd…`, as the return's own Replay section states. The payload hash also includes `time_s`, so it does not
   reproduce: my replay gave `14dfde60…` for identical row values.
10. §2.3: "ten named transition types". Twelve are named. §2.3's "fixing two bugs" and §7's "one caught bug" conflict. The "776
    mismatches before the fix" has no artifact behind it.
11. §2.6: "6 small trees". The validation uses 4 arc-check trees and 2 max-flow trees, 5 of them distinct.

Backed by replay or by my own re-derivation:
- Table 0 in full;
- Table 1's class counts and `supply == max_flow` inside F1's model;
- `micro.py` 11,892/0;
- `validate5.py` 0 missing arcs;
- the 328-digit `S` prefix;
- the directory parity;
- the listed digests;
- the sentinel fix being present in every shipped runner.

## Verdict

F1's genuine contributions stand. The six-row Table 0 is exact and independently reproduced, at `bounded_computation`. The micro
transition rules stand at `proved_informal`. A relaxed refined-class model saturates at all six switch-necessary rows, at
`bounded_computation`, and still does after the critic's tightening A2. The return's own grades, `bounded_evidence` and "(HALL)
unresolved", are honest in outline.

The return overstates what its search certifies (F-1, F-2, F-5): its claims of exactness and certification are struck, and
obligation (b) remains open. If the synthesis registers the record, the key name must be a predicate of the relaxation (ruling
33), for example `E993-R30-SIX-SWITCH-NECESSARY-ROWS-RELAXED-REFINED-CLASS-MODEL-SATURATES` at `bounded_computation`. It must never
say "class-union Hall". It must be alias-checked against `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` and
`E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`.

Ruling 30 plateau test: this return supplies none of items (a)–(d). It found no (CUT) and issues no conjecture.

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

F1's `## Remaining obligation` is not exact: item 1 promises a certificate that closing the bridges cannot give, and item 2b is
unbacked. The exact remaining obligations are:
1. **Obligation (b), OPEN.** Sector Hall under (D) ∪ (S) for EVERY `X ⊆ sec` at `G(8^82,7^2)/448`. Per A3, the sector is a product
   of 670 two-atom stars, every member has weight 1, and the positive exits are sector deletions and S-at-`u_i` with weight
   `n_c(i)`. The deletion ratio is `447/448`. Targets whose parents are all switch-free exist, so a certificate needs a
   non-uniform sector flow, or a normalized-matching argument combined with a switch-capacity bound.
2. **A class-union certificate at the six rows, not supplied.** A literal Hall statement for unions of refined classes needs
   target-side exactness. That means either an equitable partition satisfying the hypotheses of
   `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`, or the full Aut-orbit quotient (C3-LA1). No relaxed class model can supply it.
3. **(CUT) at the six rows, neither exhibited nor excluded.** No relaxed model has shown a deficit. The tightened A1 model is the
   sharpest relaxation on record, and any deficit it found would be a literal deficient class union.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-F1-U/`.

- `replay/`: copy-out of `scratchpad/c4-F1/`, 25 files, digests as listed there.
- `replay/run2/rows_output2.json` `285c9c95212a9ba95076e2fb8795246eb0da1763ebd2cb67f95c9f36f46818b0`: `run_rows2.py` replay; row
  values identical to the shipped output.
- `own/inst.py` `6b415553afa9b63af1b7b8534b0a190e46abee59d64ab848c168c578073044cf`: own brute-force instrument (tree test,
  independent sets, literal `w_F`, literal (D) ∪ (S), Dinic, F1-class labeller).
- `own/fixed.py` `e6277bce1f0222be654d291df2fa4b4d2a70849df8e28a0fc2842f3ea527a7ef`: fixed points.
- `own/scan.py` `7d26a9e0f0d0a7ff5a33448fffcd9ef5fd4fc4188c982285ae9f173114490783`: eligible small CB-shape rows (`n ≤ 30`).
- `own/table0.py` `fdda1582d58491dd6a42d47bfd360cc50a8f7045d71430f3c0efe32c79cc7635`: Table 0 re-derivation.
  - `own/table0_rows.json` `2655debcd93c4b319bb04434ff6a596d52c846e571d973dd8cbc1843f76789e6`
  - `own/table0_small.json` `0efed5fdd05fef4c001cd874424c1263efb436e42283684dc1ef99359e0df034`
- `own/compare.py` `433b16015a41bfbf9eea272d9ae9e4cc86e0521349f6ebde4caeaa5265d797e6`: literal, class-union-exact,
  class-quotient and F1-model flows.
- `own/classslack.py` `f56d53e97a9836c5e83c876806796ef8ec2b3fc4bd4bf31310e34c214ad12e2f`: per-class neighbourhood credit and
  spurious-arc census.
- `own/missing.py` `33633753abd035f720f9424dfab1930f3d095892f52cdc455fd79bc3e648b591`: missing-arc check and A1 rule check.
- `own/tight.py` `e283a443cc89583a3bc625ef03172701c2f96f1dec8973a8d779ec921236d26e`: A1/A2. It imports F1's class generating
  functions as the object under test; their totals equal my independent supply on all six rows.
  - `own/tight_rows.json` `e17f05353a6ee4a4728bfbf85b34c77bdff7b08379223db818971a89d3ee8662`
- `own/sector.py` `819916b4e5482b0a579ed58a81f437fcfa67ad659e68963ea6a3806ea0bff236`: sector families, SR-C3-6 ratios.
- `own/badtargets.py` `70957bd585ce10638938e41428e92e3e3833b77284c7ac6ceda8747c3f7eff5f`: A3 obstruction count.

`compare.py`, `classslack.py`, `missing.py` and `tight.py` import F1's `bigrun2.py` from `replay/` only as the object under test.
No evidence claimed here rests on F1 code alone. No bytecode was written. No background job was started or remains.
