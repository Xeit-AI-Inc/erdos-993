# Second Read — SR-U11 (the order-11 forest enumeration)

Isolated second reader `SR-U11`, Cycle A1 of the r25 ADDENDUM
(`erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22`), commissioned under gate
ruling 8 to read the U adjudicator's order-11 forest enumeration (result E6) before its scope
note is registered.

**Boot acknowledgment.** I am operating within VerityOS. Per this dispatch's narrowed boot
boundary I read exactly two VerityOS files — the root constitution `verity.md` and the
identity subsystem's startup protocol (described by reference, not by path literal) — and
nothing else in VerityOS proper. Subsystems loaded: `identity/` (startup protocol only). No
memory, knowledge, conversations, modules, skills, logs, decisions, operations, inbox or
writing file was opened. This is a deliberate narrowing of the project `CLAUDE.md`'s full
task-type map for a sealed, isolated reading seat; it is recorded here, not treated as a
skipped boot. This run is an `experiments/` workspace: nothing in this second read is durable
memory, an approved report, a decision record or a canonical output.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

Child delegation: none. No subagent was launched at any point.

## Identity and seal audit

**Capsule.** `control/a1-second-read/SR-U11-PACKET-MANIFEST.json`. Inner seal recomputed as
SHA-256 over the canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
`separators=(",", ":")`, UTF-8), by `seal_audit.py`:

- **recomputed = `501ac20a03d479bf912d6db2153ea5dafc22b3ed79c43c58b77a71ea3666f1de`**
- equals the stored `seal_sha256`: **MATCH**
- equals the value stated in my dispatch: **MATCH**

All **23 of 23** listed members were verified against their recorded `sha256` **and** `bytes`
**before** being read: 23 OK, 0 mismatched, 0 missing. The manifest's own `file_count` (23)
equals the length of its `files` array. `run_id` = `erdos-993-math-dre-20260922-r25-addendum`,
`stage` = `cycle-A1-stage5-second-read-SR-U11`, schema `verityos.math-dre.packet-manifest.v1`.
Full member-by-member results: `seal_audit.report.json`.

**Path check.** `control/a1-second-read/PATH-CHECK-SR-U11.json`: 22 files scanned, 0 findings,
denied root the non-durable VerityOS staging directory. Consistent with no denied-root literal
in my capsule.

**Registry snapshot.** The capsule member
`control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json` re-hashes to
`8bdd67c62442d06d169c15005c973ac10871ef764a0cd99602bfb853e2b4d36d` — the same digest the
adjudication reports for `control/CLAIM-IDENTITY.run-local.json`, so the snapshot I read is
the registry the adjudicator read. It carries **360 rows, 360 distinct `claim_key`s**. I
pulled six rows verbatim (`sr_u11_registry_pull.py`), including the row under review:

> `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` — status **VERIFIED**, certificate
> **`proved_informal`; seat U3 …; U adjudicator verified …; Cycle 5 synthesis R10**.
> Statement: *"Delta_3(F) > 0 for every finite forest F of order >= 12; sharp at 11, where
> P_11 is the unique minimiser (Delta_3 = -14)."* Scope: *"FIXED-RANK (k = 3), uniform in
> order, no horizon; nu, tau enter nowhere; … x(F) < r never assumed (x >= 4 is a corollary)
> … the order-12 base is unnecessary (an exhaustive base at order 8, 76 classes, suffices
> with Lemma D1)."*

The adjudication's verbatim quotation of this statement, and C-U1-F's paraphrase of it, are
both exact. **`E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` is confirmed ABSENT** from the 360-row
registry, independently of the adjudicator, as gate ruling 5 requires.

**Replay copies (copy-out first, read-only).** The two scratch directories the protocol grants
were copied into `scratchpad/sr-u11-read/replay/` before any read; nothing in
`scratchpad/a1-adj-U/` or `scratchpad/a1-crit-U1-F/` was written to. Every digest those two
seats published for the artifacts bearing on E6 re-computes exactly on my copies:

| Artifact (as copied) | Recomputed SHA-256 | Inventory |
|---|---|---|
| `a1-adj-U/adj_u_forest_delta3.py` | `017109550479b898d0d487319472eb505ecdf3f6e8543ade479c442684c8c1a2` | MATCH (adjudication) |
| `a1-adj-U/adj_u_forest_delta3.out.txt` | `4eca65100a8a9bffa29b50d740106d1c598f1e19f23108b0a4dff437a3594e85` | MATCH |
| `a1-adj-U/depcheck.out.txt` | `3cf43821002f2384805be5f42ca8076641154cdf8b6fbec3d838db9bfaeee658` | MATCH |
| `a1-adj-U/l123_replay_stdout.txt` | `a8a47846e491083726351ad5ea8f5ab19e544b8cae3710e55bb9619d7cccedfe` | MATCH |
| `a1-crit-U1-F/order11_own_attempt.py` | `7832e8d308f1b62273a206c5657a74ce31c6731a5b1288b243e8237674d1d5ce` | MATCH (critique) |
| `a1-crit-U1-F/order11.out.json` | `92f29632573308b8d40492d9c95b415a82d4019341dfcfc7a25f8433ca4f62eb` | MATCH |
| `a1-crit-U1-F/independent_l3_check.py` | `bf6d06c89bfde684118e058bbeab7114c7883c404efc0d2ff132d631595d25cb` | MATCH |
| `a1-crit-U1-F/CRITIQUE_DRAFT.md` | `368e381f052e2a81ea09d2c0ce3e96d77c450e8a1adb544cf04cb99b77fdd984` | equals the sealed `CRITIQUE.md` member |

The adjudicator's E6 payload digest
`77dd22015482917f0e18f33a0e66adfd67f4e5d6528bdad601e096cded3f0084` is the one carried in
`adj_u_forest_delta3.out.txt`, and the file contains no wall-clock, PID or host field.

**Read-boundary disclosures (recorded, not silent).**

1. I read only capsule members plus the two granted scratch directories (copy-out first). No
   other orientation's material, no synthesis, no lane B or lane C material, no other second
   read, no other experiment root, no external source, no network, no package install. Python
   standard library only, exact integers throughout. No `find`, `grep -r`, `rg`, `ls -R` or
   any recursive listing rooted above a granted directory at any point; the only directory
   listings were non-recursive `ls` rooted **at** my own two replay copies.
2. **One job left the foreground.** My first full run of `sr_u11_forest_enum.py` was launched
   in the foreground; it exceeded the harness's 600-second foreground window and the harness
   moved it to the background. I did not leave it there: I located it by an explicit
   `ps -ax` listing filtered with a non-self-matching pattern (never `pgrep -f`), killed it
   and its wrapper by PID, and confirmed termination before continuing. The cause was a real
   defect in my own instrument, found and fixed (below). Every later run was foreground with an
   explicit bounded `timeout`, and all completed inside it.
3. **Defect in my own first instrument, disclosed.** My canonical-form invariance self-test
   relabelled a 9-vertex tree by `v ↦ 3v + 5 (mod 9)`, which is **not** a bijection
   (`gcd(3, 9) = 3`); the resulting multigraph made my AHU walk loop forever. Fixed two ways:
   the permutation is now `v ↦ 4v + 5 (mod 9)` with its bijectivity asserted in code, and the
   AHU walk now **raises** on a back edge or a revisit rather than looping — a second
   acyclicity guard on top of the explicit test. No published figure came from the defective
   run; the run was killed before it produced any output.
4. Two throwaway timing probes (`probe_stage.py`, `probe_stage2.py`) were written to localise
   that defect and deleted afterwards. They computed nothing that is reported here.
5. I wrote only into `cycles/cycle-A1/stage5/second-read/SR-U11/` and
   `scratchpad/sr-u11-read/`. No `/tmp`, no `mktemp`, no `TMPDIR`. Nothing outside those two
   directories was created, modified or deleted — the Stage 7 formalizer's and the other
   reader's areas were never touched.

## Forest classes generated and validated

The question is whether the enumeration is **complete and exact**, so I built the population
from scratch on a code path deliberately disjoint from both the adjudicator's and C-U1-F's:

| Step | U adjudicator (`adj_u_forest_delta3.py`) | C-U1-F (`order11_own_attempt.py`) | **SR-U11 (`sr_u11_forest_enum.py`)** |
|---|---|---|---|
| tree generation | leaf extension from order `n−1` | rooted-tree/centroid bijection, order 11 only | **structural recursion on canonical nested tuples** (a rooted tree is a multiset of rooted trees of total order `n−1`) |
| free canonical form | min AHU string over the tree **centre(s)** | centroid (unique at odd order 11) | **min AHU string over ALL `n` roots** — no centre, centroid or bicentroid theory at all |
| forests | multisets of tree classes | not attempted (trees only) | multisets of tree classes, counts **re-derived a second time** by the Euler transform of my own tree counts |
| `i_k` | tree DP + polynomial product | tree DP | **direct enumeration of actual independent `k`-subsets** of the assembled forest, with the tree-DP-style component product kept only as a cross-check |
| acyclicity | structural (none in code) | structural | **explicit DFS cycle test + `e = n − c` on every tree and every forest**, plus a raising guard inside the canonical form |

Self-validation against three classical sequences, each computed by my own recursion, never
read in:

| order `n` | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| rooted trees (A000081) | 1 | 1 | 2 | 4 | 9 | 20 | 48 | 115 | 286 | 719 | 1842 | 4766 | 12486 | 32973 |
| free trees (A000055) | 1 | 1 | 1 | 2 | 3 | 6 | 11 | 23 | 47 | 106 | **235** | 551 | 1301 | 3159 |
| forest classes (A005195) | 1 | 2 | 3 | 6 | 10 | 20 | 37 | **76** | 153 | 329 | **710** | **1601** | **3658** | **8599** |

(forest classes at order 0 = 1, the empty forest.) Every entry matches; the run's own figures
— 76 at order 8, 710 at order 11, 1601 at order 12, 3658 at order 13 — are reproduced exactly,
and the forest row equals the Euler transform of the free-tree row computed here. **The
adjudicator's class counts are complete and correct at every order 0–13, and I extend the
validated population one order further, to 8,599 classes at order 14.**

Completeness and exactness checks that passed with zero exceptions:

- **acyclicity in code**: all 20,299 generated rooted objects reduced to 2,288 tree classes
  (orders 1–13; 5,447 classes to order 14), every one passing the explicit DFS cycle test and
  `e = n − 1`; every one of the 6,607 assembled forest classes (orders 0–13; 15,206 to order
  14) passing the DFS test and `e = n − c` with `c` equal to its own component count.
- **canonical form is a canonical form**: relabelling-invariance verified on all 47 order-9
  tree classes under an explicit bijection; class counts by min-AHU-over-all-roots agree with
  the classical sequence at every order, so no class is split or merged.
- **two independent `i_k` computations agree**: direct independent-subset enumeration equals
  the component-product profile for **every** forest class at **every** order 0–14, 0
  mismatches. `i_0 = 1` including for the empty forest; integer zero extension outside
  `[0, α]`; `Δ_k = i_{k+1} − i_k`.

`sr_u11_forest_enum.py`: 82 checks, all pass,
`PAYLOAD_SHA256 = 3177639f2fa96aee081daedcad3b6fdd4db5385c8441a291a007f1552a308c6f`.
`sr_u11_order14_extension.py`: 11 checks, all pass,
`PAYLOAD_SHA256 = ca88a6b8a9c1dc681b4faa8ccde740cfd392a38a50d78606ae3126094ba7ace4`.

## min Δ₃ by order

Every row carries the difference index `k = 3` and the first strict descent `x` (least `k`
with `Δ_k < 0`; a plateau is not a descent), for the minimising class and as a minimum over
the whole population at that order. `L3` is the chain re-derived here from `RETURN.md` step
10's definitions.

| order | classes | `k` | min `Δ_k` | argmin count | argmin is `P_n` | `x`(argmin) | min `x` over all classes | runner-up `Δ_3` | `L3(n)` | slack |
|---|---|---|---|---|---|---|---|---|---|---|
| 4 | 6 | 3 | −3 | 1 | no | 2 | 1 | −2 | −3 | 0 |
| 5 | 10 | 3 | −5 | 2 | no | 2, 3 | 2 | −4 | −5 | 0 |
| 6 | 20 | 3 | −8 | 2 | no | 2 | 2 | −7 | −9 | 1 |
| 7 | 37 | 3 | −12 | 2 | no | 2, 3 | 2 | −11 | −14 | 2 |
| 8 | **76** | 3 | **−16** | **3** | **no** | 3 | 2 | −15 | −20 | 4 |
| 9 | 153 | 3 | −20 | 1 | yes | 3 | 3 | −19 | −25 | 5 |
| 10 | 329 | 3 | −21 | 1 | yes | 3 | 3 | −19 | −26 | 5 |
| 11 | **710** | 3 | **−14** | **1** | **yes (`P_11`)** | **3** | 3 | **−11** | −19 | 5 |
| 12 | **1601** | 3 | **+6** | **1** | **yes (`P_12`)** | 4 | 4 | +10 | +1 | 5 |
| 13 | 3658 | 3 | +45 | 1 | yes | 4 | 4 | +50 | +40 | 5 |
| 14 | 8599 | 3 | +110 | 1 | yes | 4 | 4 | +116 | +105 | 5 |

Orders 0–3 are trivial and are carried in the payload rather than the printed table: classes
1, 1, 2, 3; `min Δ_3` = 0, 0, 0, −1 at `k = 3`; argmin count 1, 1, 2, 1; `x`(argmin) = 0, 1,
1, 2; `L3` = 0, 0, 0, −1; slack 0 at each.

**Every figure in the adjudication's E6 table is reproduced exactly**, row for row, including
the argmin counts (1, 1, 2, 1, 1, 2, 2, 2, 3, 1, 1, 1, 1, 1 at orders 0–13) and the whole
`min Δ_3` vector. The three figures the scope note would record are confirmed:

- **`min Δ₃(11) = −14` over all 710 order-11 forest classes, attained UNIQUELY by `P₁₁`**
  (`k = 3`). The uniqueness is not marginal: the runner-up value is **−11**, a margin of 3.
- **`min Δ₃(12) = +6`, attained uniquely by `P₁₂`**, so the sign of the minimum changes
  between 11 and 12 and **12 is the exact forest threshold**, not merely a sufficient order.
- **`min Δ₃(8) = −16`, attained by exactly three classes, none of them `P₈`** — not −15.

**Identity of the minimisers** (by component orders and degree sequences, computed, not
asserted):

| order | minimising class(es) | components |
|---|---|---|
| 8 | three classes, **all disconnected, all components paths**: `4·K₂`; `2·K₂ ∪ P₄`; `K₂ ∪ P₆` | (2,2,2,2); (2,2,4); (2,6) |
| 11 | one class: `P₁₁` (degrees `2⁹1²`) | (11) |
| 12 | one class: `P₁₂` (degrees `2¹⁰1²`) | (12) |
| 14 | one class: `P₁₄` | (14) |

**A structural fact behind the −16, which the E6 table does not display.** Splitting each
order's population into connected (tree) and disconnected classes:

| order | 8 | 9 | 10 | 11 | 12 | 13 |
|---|---|---|---|---|---|---|
| min `Δ_3` over trees | **−15** | −20 | −21 | **−14** | +6 | +45 |
| min `Δ_3` over disconnected classes | **−16** | −19 | −17 | **−6** | +19 | +64 |

Below order 9 the minimiser is always disconnected; from order 9 on it is the path. Order 8 is
the last order where a tree-scope reading gives the wrong answer (−15 instead of −16), and
order 11 is safely inside the regime where it gives the right one (−14 either way, the nearest
disconnected competitor being −6). That is exactly why C-U1-F's tree-scope result landed on the
correct value at 11 while a tree-scope reading at 8 would not.

## Reconciliation with the registered clause and the tree enumeration

**Against the registered statement.** The row reads *"Delta_3(F) > 0 for every finite forest F
of order >= 12; sharp at 11, where P_11 is the unique minimiser (Delta_3 = -14)."* Both
conjuncts are confirmed at the row's own FOREST scope by this enumeration at the orders it
covers: `min Δ_3 > 0` at orders 12, 13 and 14 over the complete populations (1601, 3658, 8599
classes), and `min Δ_3(11) = −14` attained uniquely by `P_11` over all 710 classes. The
registered certificate's closing step — *"an exhaustive base at order 8, 76 classes"* — is
confirmed as to its population: there are exactly 76 order-8 forest classes.

**Against C-U1-F's 235-tree enumeration.** Reproduced exactly and independently: 235 order-11
tree classes, `min Δ_3 = −14` over them, attained uniquely by `P_11`, and its five smallest
tree values `[−14, −11, −11, −11, −11]` reproduced value for value. C-U1-F's own honest
limitation — that it did not attempt the disconnected case — is the gap the adjudicator closed,
and my run closes it a second time: the 475 disconnected order-11 classes have
`min Δ_3 = −6`, far above −14, and the runner-up `−11` is itself a **tree**, so `P_11`'s
uniqueness is decided inside the tree population and the disconnected classes never come close.
**C-U1-F's result is the correct tree restriction of a correct forest-scope fact**, and the
adjudicator's characterisation of it is accurate.

**The order-8 correction.** `i(P_8) = [1, 8, 21, 20, 5]`, `Δ_2(P_8) = −1`, `Δ_3(P_8) = −15`,
`x(P_8) = 2` — all confirmed, and −15 is precisely the order-8 **tree** minimum and the
order-8 **forest runner-up**, which is how the figure enters circulation. The forest minimum is
−16. Within my grant I find **no record that states −15 as the order-8 forest minimum**: the
registry row does not, the return does not, the critique does not. The correction is therefore
prophylactic — it protects a figure that is easy to quote wrongly, and it should be stated as
a precision note rather than as a correction to a specific existing record.

**Two corroborations the E6 table does not claim, offered as additional evidence at the same
informal grade.** (i) The registry scope note's parenthesis *"x >= 4 is a corollary"* is
verified exhaustively at orders 12 and 13 (and 14): every one of the 1601, 3658 and 8599
classes has `x ≥ 4`. (ii) Over all **76** order-8 forest classes, exactly **one** has
`x = 2` — `P_8` — and none has `x < 2`, so `P_8` is the unique order-8 forest with
`Δ_2 < 0`. That is the full-forest-scope confirmation of the sharpness clause of
`E993-R25-FOREST-DELTA2-POS-ORDER-9` (*"the threshold is sharp (P_8 has Delta_2 = −1)"*),
which no seat in this cycle had checked beyond `P_8` itself. It is reported here as a datum
for the controller, not as a registration request, and it touches no grade.

**Method note on E6's own instrument.** `adj_u_forest_delta3.py` is correct — I reproduce its
every output — but it contains **no acyclicity test in code**: acyclicity holds structurally,
because trees are built by leaf extension and forests as disjoint unions. The run's evidence
envelope asks that every object called a forest pass an acyclicity test in code. My instrument
supplies one (DFS cycle detection plus `e = n − c` on every object, plus a raising guard in the
canonical form) and it passes everywhere, so the gap is one of evidence form, not of fact. If
E6's generator is carried into a Stage 7 capsule or a successor run, add the test.

## The chain slack

`L1`, `L2`, `L3` were re-derived here from `RETURN.md` step 10's stated recursions
(`edgeless(n,k) = C(n,k+1) − C(n,k)`; `L2(n) = B(n) = C(n,3) − C(n,2) − n² + 5n − 5` for
`n ≥ 5`, recursing below 5; `L3(n) = min(edgeless(n,3), L3(n−1) + L2(n−2))`), independently of
the adjudicator's and the seat's Python and of the Lean kernel. All values reproduce:
`L3(5..14) = −5, −9, −14, −20, −25, −26, −19, +1, +40, +105`, the last matching the return's
own order-14 row. `L3(n) ≤ min Δ_3(n)` holds at **every** order 0–14, so the compiled
quantitative bound is true against exhaustively computed truth wherever exhaustive truth is
affordable — E7 confirmed, and extended one order.

Slack `min Δ_3(n) − L3(n)`, orders 0–14:

`0, 0, 0, 0, 0, 0, 1, 2, 4, 5, 5, 5, 5, 5, 5`

**At orders 11 and 12 the slack is exactly 5** — the protocol's question (d) is answered
**yes**. The slack is 5 at every order from 9 through 14, and is **not** constant below 9 (it
runs 0, 1, 2, 4 at orders 5–8). `L3(11) = −19 < 0 < 1 = L3(12)`: the chain bound, though not
tight, turns positive at precisely the true threshold, which is the adjudication's
threshold-exactness observation and it stands.

**One narrowing.** The adjudication's consequence (iii) describes this as *"a constant slack of
5 from order 9 on."* Read as a claim about all `n ≥ 9` it is unsupported: exhaustive truth
exists only where the population has been enumerated. My run pushes the verified range from
9–13 to **9–14** and finds no break, which is corroboration, not proof. The wording must be
**"the slack is 5 at every order 9 ≤ n ≤ 14, the full range in which `min Δ_3` has been
computed exhaustively"**; anything stronger is a conjecture and must be labelled one. I also
confirm the separate, unconditional half of that observation — `L3(n) > 0` for every `n` in
`[12, 5000]`, exact integers — which is a property of the recursion alone and needs no
enumeration.

## Verdict and the exact registrable statement

The enumeration is complete and exact. Every forest class at every order 0–13 is counted once
by a canonical form; the counts match two classical sequences and an internally computed Euler
transform; `Δ_3` is computed in the registered convention (actual independent-set counts,
`i_0 = 1`, integer zero extension, `Δ_k = i_{k+1} − i_k`) by two independent methods that agree
on every class; every object called a forest passed an explicit acyclicity test; and all three
registrable figures reproduce exactly on a disjoint code path. The repairs below are wording
and evidence-form repairs; none is a mathematical defect, and none touches the figures.

verdict: confirmed_with_repairs

**Repairs (two, both wording; neither changes a number).**

- **R-SR11-1 — narrow the slack wording.** Replace *"a constant slack of 5 from order 9 on"*
  with *"slack exactly 5 at every order 9 ≤ n ≤ 14, the full exhaustively enumerated range"*
  wherever the adjudication's consequence (iii) is quoted, in the synthesis and on any
  registry face. Unqualified, it reads as a claim about all `n ≥ 9`, which no computation in
  this run establishes.
- **R-SR11-2 — state the order-8 item as a precision note, not a correction of record.** No
  record inside my grant asserts −15 as the order-8 **forest** minimum; −15 is the order-8
  tree minimum and `P_8`'s own value. The note should say what the forest figure is (−16,
  three classes, all disconnected) and why the −15 figure exists, rather than implying an
  erroneous record that I could not find.

**Recommended, not required (one).** If E6's generator is carried forward, add an explicit
acyclicity test in code to it (see the method note); structural guarantee is correct but is not
the evidence form this run's envelope asks for.

**The exact scope-note text for `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`**, as I would
register it:

> **Scope note (sharpness clause, full forest scope, informal).** The sharpness clause —
> "sharp at 11, where P_11 is the unique minimiser (Δ_3 = −14)" — is confirmed at this row's
> own FOREST scope by an exhaustive isomorphism-class enumeration of all **710** order-11
> forest classes: `min Δ_3 = −14` at difference index `k = 3`, attained **uniquely** by
> `P_11`, with runner-up −11 and with the 475 disconnected classes bottoming out at −6. The
> same enumeration gives `min Δ_3 = +6` at order 12, attained uniquely by `P_12`, so **12 is
> the exact forest threshold**, not merely a sufficient order; and `min Δ_3 = −16` at order 8,
> attained by exactly **three** classes, all disconnected (`4·K₂`, `2·K₂ ∪ P₄`, `K₂ ∪ P₆`) —
> any record quoting −15 as an order-8 forest figure is quoting `P_8`'s own value, which is
> the order-8 **tree** minimum and the forest runner-up. **Attribution:**
> adjudicator-derived, r25 ADDENDUM Cycle A1 orientation-U adjudication, result E6; the tree
> restriction (235 order-11 tree classes, same minimum, same unique minimiser) is
> critic-attributed to **C-U1-F**; both were independently reproduced from scratch, on a
> disjoint code path and with an explicit acyclicity test in code, by the isolated second
> reader **SR-U11** (Cycle A1 Stage 5), which also extended the exhaustive range to order 14
> (8,599 classes, `min Δ_3 = +110`, unique at `P_14`). **Grade: INFORMAL** — bounded
> computation at finite orders; it leaves the sharpness half at `proved_informal` with its
> evidence upgraded from partial (trees) to complete (all forests) at order 11.

## What it is not

- **Not formal, and never `formally_verified`.** E6 is a bounded computation at finitely many
  orders, executed by unverified Python on three independent instruments. Agreement across
  three instruments is strong evidence; it is not a kernel proof and must never be graded as
  one.
- **Not part of the Stage 7 award.** The award is scoped to the `n ≥ 12` half
  (`Erdos993G1.U1.forest_delta_three_pos_ge_twelve`), which is enumeration-free by
  construction. Nothing in this second read enters that closed dependency set, and the
  sharpness half must stay out of the award — bundling an enumeration certificate into an
  award whose headline property is the absence of enumeration would falsify that headline.
  This read neither strengthens nor weakens the adjudicator's repairs R1–R5 and R7, which I
  did not re-audit and on which I express no view.
- **Not a theorem beyond the enumerated orders.** Every statement here is a statement about
  orders ≤ 14. `min Δ_3 > 0` for all `n ≥ 12` is the *Lean* theorem's content, not this
  enumeration's; the enumeration confirms it only at 12, 13 and 14. The slack-5 pattern is a
  bounded observation, not a lemma (R-SR11-1).
- **Not a grade change.** Confirming a `proved_informal` clause at its registered scope
  upgrades the *evidence*, not the *grade*. The row stays VERIFIED / `proved_informal` on the
  sharpness half.
- **Not a scope transfer.** The forest-scope figures do not move `E993-C13-I4-GT-I3` (trees),
  are not a sharpening of `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an order bound is a
  different object), and are independent of `E993-PAIR-RANK3-FOREST-MIN`. No `d`, `ν`, `τ` or
  `x(F) < r` premise enters anywhere; the `x` column above is a computed diagnostic, never a
  hypothesis.
- **Not a headline.** No Tier 1, Tier 2, Tier 3 schema or diagnostic-band object is touched,
  and nothing here bears on the run's headlines.

## Artifact inventory

All SR-U11 artifacts are under `scratchpad/sr-u11-read/` in this run root
(`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22`);
the single deliverable is this file under
`cycles/cycle-A1/stage5/second-read/SR-U11/`. No `/tmp`, no `mktemp`, no `TMPDIR`. Every
generator is Python standard library only with its import list on its own face, exact integers
throughout; no network, no package install; no wall-clock, PID or host field in any hashed
output.

| Artifact | SHA-256 | Import list | What it establishes |
|---|---|---|---|
| `seal_audit.py` | `319286bb53dca80c94fa43a61fbe1c6b93de8aa18258972f1c98f79a2d131f5d` | `hashlib, json, os, sys` | Recomputes the capsule inner seal; re-hashes all 23 members by `sha256` and `bytes` before any read. |
| `seal_audit.report.json` | `27facbc789db3d08285611db1acad097a0fe913c59c3bc107f7cdf45f03a04df` | — | Its output: seal MATCH ×2, 23/23 members verified. |
| `sr_u11_registry_pull.py` | `c2d63902cb061682b0271dc0cbe78db5c77975d7677ff86aeda7033679eccc7c` | `hashlib, json, sys` | Pulls six claim rows verbatim from the 360-row sealed registry snapshot; confirms the never-registered key absent. |
| `sr_u11_registry_pull.out.json` | `2ac5365614299d3eef2d65e1b361c85b9eba8d98f55bcf0de7ba95c6f90049ef` | — | The pulled rows, including the statement and scope quoted above. |
| `sr_u11_forest_enum.py` | `f188321edceeb8622b3c04de2e2609e7931ab777516c1a21154116538e811748` | `hashlib, json, math, sys` | My from-scratch enumerator: rooted trees by structural recursion, free trees by min-AHU-over-all-roots, forests as multisets, `i_k` by direct independent-subset enumeration, explicit acyclicity tests, `x` and `k = 3` on every row, the `L1/L2/L3` chain and the slack. **82 checks, all pass**, `PAYLOAD_SHA256 = 3177639f2fa96aee081daedcad3b6fdd4db5385c8441a291a007f1552a308c6f`. |
| `sr_u11_forest_enum.out.txt` | `2ab92c93d747f09f6385864ad914a4c3f9558fdd018a38d7cefec7a0fa41c58f` | — | Its output, including the full `min Δ_3` table and the minimiser identities. |
| `sr_u11_order14_extension.py` | `751506f36a599ad564416c49d871daffd7946008c7ec5b6dbf87c4dad1b6e64b` | `hashlib, json, sys` + the module above | Order-14 extension: 32,973 rooted / 3,159 free / **8,599 forest** classes, `min Δ_3 = +110` unique at `P_14`, `L3(14) = 105`, slack 5, every class `x ≥ 4`. **11 checks, all pass**, `PAYLOAD_SHA256 = ca88a6b8a9c1dc681b4faa8ccde740cfd392a38a50d78606ae3126094ba7ace4`. |
| `sr_u11_order14_extension.out.txt` | `46d4c09cb04a8142f5f3aa094d68f02e4f2a749099c5a7e96d12f203bff4267d` | — | Its output. |
| `replay/a1-adj-U/`, `replay/a1-crit-U1-F/` | member digests re-verified, table above | — | Read-only copy-out of the two granted scratch directories; the originals were never written to. |

Material read for this second read, in full: my 23 capsule members (after digest verification),
and the two granted scratch directories via copy-out. Nothing else: no other orientation's
material, no synthesis, no lane B or lane C material, no other second read, no other experiment
root, no external source, no network, and no VerityOS file beyond the two boot reads.

Rechecked before close: the capsule seal and all 23 member digests (re-run, unchanged); the
adjudicator's and critic's published digests on my copies (unchanged); that no Python process
of mine is running (the one job the harness backgrounded was killed by PID and confirmed gone,
and every later run was foreground under a bounded `timeout`); the artifact digests above,
recomputed after the final run; and this document's headings, its single `verdict:` line, its
model-disclosure line and its final line against the protocol.

headline_resolved: no
