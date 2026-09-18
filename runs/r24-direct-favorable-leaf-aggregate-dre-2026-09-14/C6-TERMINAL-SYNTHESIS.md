# Cycle 6 Neutral Synthesis

Neutral synthesis seat `S-C6`, Cycle 6 (**terminal cycle**), Stage 6. Run
`erdos-993-math-dre-20260914-r24-direct-favorable-leaf-aggregate`.
Governing protocol: `control/C6-SYNTHESIS-PROTOCOL.md` (sealed capsule member).

**VerityOS boot.** This seat is operating within VerityOS. Before substantive
work it read the root constitution `verity.md` and `identity/startup-protocol.md`
(VerityOS root; absolute paths outside this run root are deliberately not quoted,
per the write boundary in my dispatch). Under the startup protocol's task-type →
subsystem map this is experiment work, so the subsystem loaded is `experiments/`
and, within it, this run root's sealed control plane and run-root authority
(`SOLUTION-CONTRACT.md`, `SEMANTIC-CONTRACT.md`, `sources/`). No other VerityOS
subsystem was loaded. Nothing here is promoted to memory, knowledge, decisions,
logs, projects, or reports: this synthesis and its scratch are experiment-local
artifacts, and any durable promotion would route through `inbox/` under Ashton's
approval.

**Model disclosure.** chartered opus/high; transport-resolved model opus
(explicit parameter); the seat cannot self-inspect its runtime model/effort —
stated on dispatch-record authority.

**Child delegation:** forbidden and not used. Every verification reported below
was performed by this seat, in this session, under `scratchpad/S-C6/`.
**Transport:** no unrelated content-safety refusal occurred at any step, so no
step required re-issue.

## Identity and seal audit

**Dispatch seal (reported as duty 1 requires):**

> `baa06f14ac20d42c6ff4e18a9c64b8ea4df0032d369f3d25ef0d4754a7969bce`

Recomputed by this seat's own instrument (`scratchpad/S-C6/verify_seal.py`,
written from the canonical rule in my dispatch and importing nothing from the
run's tooling): remove only `seal_sha256`, serialize the remainder with
`json.dumps(sort_keys=True, separators=(",", ":"))`, no trailing newline,
SHA-256. The recomputed value is **identical** to the declared seal and to the
value my dispatch requires. `file_count` 12 equals the length of `files`. All
**12/12** declared members re-digested against disk: every byte count and every
SHA-256 matched, none missing.

| Member | Bytes | SHA-256 | Result |
|---|---:|---|---|
| `control/C5-F1-STATEMENT-CAPSULE.md` | 5845 | `4672d421…1970` | match |
| `control/C6-FROZEN-DEFINITIONS-CAPSULE.md` | 8175 | `55b7aa9a…59e5` | match |
| `control/C6-SEALED-MEMBER-DRIFT-RECORD-2.md` | 2324 | `3583e220…5025` | match |
| `control/C6-STAGE5-CONTROLLER-MEMO.md` | 6740 | `679060be…ba59` | match |
| `control/C6-STAGE5-PACKET-MANIFEST.json` | 3300 | `c828cb84…41c1` | match |
| `control/C6-SYNTHESIS-PROTOCOL.md` | 3559 | `9a9be4bc…5112` | match |
| `control/PATH-CHECK-c6-stage6-dispatch.json` | 624 | `a0f8191d…cca7` | match |
| `cycles/cycle-5/stage6/SYNTHESIS.md` | 59219 | `1964a308…e74d` | match |
| `cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md` | 6703 | `fc70d3b1…05de` | match |
| `cycles/cycle-6/stage5/adjudicators/F/ADJUDICATION.md` | 128288 | `52d52493…bec5` | match |
| `cycles/cycle-6/stage5/adjudicators/T/ADJUDICATION.md` | 76953 | `c200c7c6…1695` | match |
| `cycles/cycle-6/stage5/adjudicators/U/ADJUDICATION.md` | 109743 | `de3f8f7b…77fa` | match |

**Stage 5 packet seal, independently verified:**

> `b4f8b34200390ee43950ee42720c0bb5806f0150071bf61988fd006817dac0cb`

`control/C6-STAGE5-PACKET-MANIFEST.json` recomputes by the same canonical rule to
exactly that value, matching its declared seal and the value my dispatch
requires. `file_count` 17 equals the length of `files`; all **17/17** members
re-digested clean. The three admitted adjudications appear in **both** manifests
at **identical digests** (`52d52493…`, `c200c7c6…`, `de3f8f7b…`), so the
adjudications I reconcile bind to the sealed Stage 5 state and to the Stage 6
dispatch without drift. Verifier output captured at
`scratchpad/S-C6/verify_seal.out`, verdict `CLEAN` on both manifests.

Instrument digests: `verify_seal.py`
`a10e15f52701b4374159526067cbc6bdc3536ff2d58b0ab78d337cfa5b54a8d2`;
`verify_seal.out`
`0466e1e198da8f0a1177c0b302af2e7a214b11114f87acb0ece4ce60c256958a`.

**Path evidence.** `control/PATH-CHECK-c6-stage6-dispatch.json`: run root
correct, 11 files scanned, 0 files with findings, 0 findings, no pruned roots,
the non-durable VerityOS scratch root denied. Clean.

**Seal-chain corroboration at this tier.** Each adjudicator reported its own
orientation capsule seal and each independently recomputed the Stage 4 packet
manifest to the same value:

| Seat | Capsule seal (self-reported) | Members | Stage 4 packet recomputed |
|---|---|---:|---|
| T | `7f6e2155a63a41b9b608da5b20f4b006aab1d15ec5f3ae40f7e56112eb41b803` | 19/19 | `f761599e45636297574ff3f509df9bd40180f11a9b2e5834490cdf2e211f75ce` |
| F | `85f37bd01bdc1eddc864aa4d19b2de4afe9af59e576d9d4273d46de24ff6fb8f` | 18/18 | same value |
| U | `f01c28d13aac594fa09d7f6b98e44014f0a09622d536667a93adf6b1c4ea9433` | 18/18 | same value |

Those three capsule manifests are themselves digest-bound members of the Stage 5
packet I verified above (`0657c64e…`, `d079117a…`, `6e6bc3d6…`), so the bytes
each seat sealed are the bytes I re-digested. I did **not** open the capsule
manifests' contents — they are outside my read boundary — so the seal values are
carried on the seats' authority, corroborated at digest level and by three
independent recomputations of one Stage 4 seal agreeing exactly. Three
independent recomputations agreeing is stronger evidence than any single seat's
report.

**Sealed-member drift.** Three controller-caused post-seal edits of sealed
members are on the record (`RUN-STATE.json`, `AUTHORIZATION.md`, and
`control/C6-STAGE2-RUN-STATE-DRIFT-RECORD.md` — the last committed on the very
file whose rule forbids it, and detected mid-Stage-4 by two critics). Each sealed
version is reconstructed byte-exactly and preserved; seals were not re-issued.
The F adjudicator verified on disk that the drift record has been restored to its
sealed digest `dfaaf87a…` with the appended text relocated to
`control/C6-SEALED-MEMBER-DRIFT-RECORD-2.md` (`3583e220…`), and I re-digested
that relocated file myself as a dispatch-capsule member: match. Per controller
memo item 3, none of the three is chargeable to any seat; all three are carried
as controller process debt at TD-35. The grading rule the U adjudicator adopted
is correct and I adopt it for the record: a return that said "22 of 23" before
`AUTHORIZATION.md` drifted was correct when written; a return that said "23 of
23" after `RUN-STATE.json` had already drifted was not.

**Controller findings I am obliged to carry.** (i) `C-T3-U`'s claim that the
charter-quoted Stage 3 seal diverges from the manifest in 4 of 64 hex characters
is **FALSE** (memo item 2) and is struck; it must not be carried forward as a
live finding. (ii) `sel_star` exists nowhere in `sources/` or the contracts, so
the frozen-definitions capsule's "both selector predicates per row" clause is
unsatisfiable in scope and is **struck**, the clause read as satisfied by the
marked-leaf selector `d_s(p) < 0` alone (memo item 4a). All three adjudicators
applied this identically. (iii) `REL_ORDER_LIMIT` is a Cycle 5 seat's code token
with no definition in any Cycle 6 read-scope file (memo item 4b). (iv)
`C6-CRITIC-PROTOCOL.md` duty 4 and this synthesis protocol's own read-boundary
paragraph name `control/C6-F1-STATEMENT-CAPSULE.md`, a clone artifact that does
not exist; the sealed file is `control/C5-F1-STATEMENT-CAPSULE.md` at digest
`4672d421…1970`, to which every critic and every adjudicator correctly bound, and
to which this synthesis binds (memo item 4c).

**Two protocol-text defects in my own governing document, recorded and
overridden by the dispatch.** `control/C6-SYNTHESIS-PROTOCOL.md` carries Cycle 5
residue in two places: its read-boundary paragraph says "prior synthesis beyond
the sealed **Cycle 4** synthesis" where the sealed member and my dispatch both
say Cycle 5, and its duty 5 names the comparison window "**Cycles 4–5**" where
its own required-output section and my dispatch both say Cycles 5–6. In both
cases the dispatch and the protocol's own later text agree, and I follow them:
the prior synthesis I read is the sealed **Cycle 5** synthesis, and the stop gate
is applied over **Cycles 5–6**. Recorded as controller process debt at TD-35(d).

**Read boundary.** Read: the sealed dispatch capsule and its twelve members
(above); run-root authority `SOLUTION-CONTRACT.md` and `SEMANTIC-CONTRACT.md`.
**Not read:** any Stage 3 return, any Stage 4 critique, any adjudicator or critic
or worker scratch, any failed or superseded lineage, any late or post-seal
artifact, any synthesis other than the sealed Cycle 5 synthesis, any manuscript,
repository state, conversation record, or external source. I wrote only
`cycles/cycle-6/stage6/SYNTHESIS.md` and `scratchpad/S-C6/`. No file outside
those two paths was created or modified. No delegation, no child agent, no
network access, no `lake` invocation.

**Verdict mix admitted at Stage 5.** Three adjudications, one per origin
orientation, all admitted at their sealed digests. Stage 4 delivered 18/18
critiques: 17 `retained_narrowed` and 1 `rejected` (`C-T3-U`), a genuine paired
split the T adjudicator resolved claim by claim rather than by averaging. All 18
critiques and all three adjudications report `headline_resolved: no`.

## Reconciliation

The three adjudications are reconciled **claim by claim, by scope and proof
status**. No verdict is averaged and no disagreement is settled by counting
seats. Where two or three seats reach the same result from independent
instruments I record that as corroboration and name the instruments; where one
seat holds exclusive jurisdiction I record the others' abstention as abstention,
not assent; where the seats genuinely diverge I surface the divergence and
resolve it only from the adjudications' own content and run-root authority —
never by consulting a lower tier.

### Claims on which all three concur, from read-isolated portfolios

**1. The headline is unresolved and `AGG_literal` is `still_open`.** T, F and U
each reach it independently, on their own instruments, and each verifies that no
route or critique in its portfolio leaks a contrary claim. **Reconciled.**

**2. Material progress `yes`, orientation plateau `no`, in all three
portfolios.** Independently reasoned, not merely concurrent; I weigh the
reasoning in the stop-gate section rather than the count.

**3. No statement in any orientation qualifies for a governed Lean award this
cycle.** T rules zero; F rules zero "explicitly and without qualification"; U
rules three candidates stable with closed DAGs and all three failing materiality.
**Reconciled** — and I rule on each candidate individually under `## Lean awards`
rather than inheriting the conclusion.

**4. No `(RC)` claim is asserted, reconstructed, or advanced anywhere, and the
unqualified `(RC)` equivalence remains FALSE at `K_{1,2}`.** T records the
`K_{1,2}` fence (`S = +2`, `α = 2 < x+3`, never eligible) as exactly what makes
T1's eligibility hypothesis load-bearing; U records it at `C5-LA1`'s silence at
`α = 2`; F re-derives it with the scoping correction that `K_{1,2}` at `p = 1`
has `x+2 = 3 > 1` and is therefore **ineligible**, as is `path_graph(6)` at
`p = 2` (`x+2 = 4 > 2`). Both refute only the *unqualified* `(RC)`; the
eligibility hypothesis is load-bearing and neither is a falsifier.
**Reconciled.**

**5. Every standing fence holds.** No status transfers from literal
ordinary-tree scope to governed `RTree`, to `E993-BETA-AGG`, or to Erdős #993;
`SEMANTIC-CONTRACT.md` face 3 (transport) is untouched by every route, every
critic and every adjudicator. `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT` and
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` remain **REFUTED**, neither
reopened nor renamed — the T adjudicator ruled explicitly on the one live risk
(T3's relation work) on four independent grounds and found no reopening.
`C4-LA2` and `C4-LA3` remain **blocked** and are not reopened. `C5-LA1` is
**certified, not re-awarded**. **Reconciled.**

**6. The mandatory controls reproduce exactly, across all three orientations and
on instruments sharing no code with the frozen evaluator.**

```text
T22  order 91, alpha 68, x 32, p 34 (= x+2, the lower eligibility boundary)
     67 favorable original leaves
     S = -498754180547001418536
     marked summand +212336130412243110   (the UNIQUE positive summand in the row)
     66 star summands, each -7560098737536570631;  66*star + marked = S exactly

T60  order 243, alpha 182, x 87, p 90
     181 favorable original leaves
     S = -1058142362147652597702654588268394677176033202323316960380
     marked summand +2935177632783649903488454322226807645411570590073000  (unique)
     180 star summands, each -5878584985140474340847544870681760577687103410521705741

top rank:  S(T22, 67) = -4487      S(T60, 181) = -32759
T60 full interior window [89,181]: 93 rows, all <= 0, maximum -32759 uniquely at
p = 181, minimum -1876033682824641480391410332802785469699082479841155258000
(58 digits, not 61).
```

**Reconciled.** Both controls carry exactly one strictly positive individual
mechanism value inside a strictly negative complete aggregate. That is precisely
why pointwise and strict per-part arguments keep failing, and
`SOLUTION-CONTRACT.md` fences it: "A positive local summand, positive support
fibre, or deficient proper Hall cut is not a counterexample to the headline."

**7. `T_m` top-rank closed form — the strongest-corroborated new result in the
run.** Reached independently in **two orientations** and confirmed on six
instruments: `C-U3-F` (from U3's own §4 closed forms), `C-T1-U` (as `2 − ℓ²`
with `ℓ = 3m+1`), `C-U1-T` (values at `m = 22, 60` while running the U1
controls), the controller (memo item 7, at `m = 1, 22, 31, 38, 40, 60, 100`), the
T adjudicator (third instrument), and the U adjudicator (explicit-graph
instrument, every leaf's summand from the r23 literals, `m = 1…12`). The two
closed forms are algebraically identical:
`2 − (3m+1)² = −9m² − 6m + 1`. **Reconciled: exact, universal over the family,
parity-free, critic-attributed.**

**8. Census agreement across orientations on independently written
instruments.** T's orders-4–17 census (81,134 trees; 16,424 eligible residual;
per-order residual series `7:4, 8:5, 9:17, 10:39, 11:80, 12:167, 13:365, 14:792,
15:1775, 16:4003, 17:9177`) agrees cell-for-cell with `C-F3-T`'s canonical-
augmentation reproduction inside the F portfolio, and its orders 15 and 16
residual counts (1,775 and 4,003) agree exactly with `F-C6-01`'s exhaustive
orders-15/16 census, which itself partitions correctly (1775+5966 = 7741;
4003+15317 = 19320). Two read-isolated orientations, four instruments, identical
integers. **Reconciled: this is the cycle's cleanest cross-orientation
computational corroboration, and no single adjudicator could observe it.**

**9. The `T_m` band record correction.** U (route discovery, exact form per memo
item 8) and F (via `C-F3-T` and `C-F3-U`, with the width-2 correction at
`m = 38` found independently by F3's own stress test) reach the identical
corrected statement, each verified to `m = 400` on its own instrument, and the F
adjudicator's third instrument validates its closed form against an explicit tree
DP for `m = 0…6` first. **Reconciled**, and carried verbatim below.

**10. The `sel_star` clause is struck in all three portfolios** (memo item 4a),
with the consequences graded identically: `F-C6-02`'s status
`NOT_SUPPLIED_IN_AUTHORIZED_SCOPE`, reported on all 21,067 support entries with
no fallback formula anywhere, is correct discipline; `F-C6-01`'s
substitution of `a_v` is a proxy with **no mathematical consequence**, because
`I(T−v;z) = H_s(z) + z·R_s(z)` makes `a_v` and `d_s(p)` the *same integer*;
`U-C6-02` is charged with failing to report the one surviving predicate; no T
route met the clause. **Reconciled.**

### Claims held by one orientation under exclusive jurisdiction

The capsules are read-isolated by orientation, so several duties fall to exactly
one seat. I record these as jurisdictional and record the other seats' silence as
abstention, not assent.

| Claim | Ruling seat | Others |
|---|---|---|
| `C5-LA1` certified (kernel, axioms, fidelity, byte-stability, rejected closes) | U: **certified, no defect in the award** | T and F never opened the Lean run |
| `C4-LA2` / `C4-LA3` bridges supplied? | U: **neither supplies what the block review named**; neither is closer to reopenable | T: builds no bridge, rules nothing; F: no F route proposes one |
| `hTree` / `hEligible` removability | U: **removable, kernel-demonstrated in critic scratch, ungoverned** | outside T's and F's boundaries |
| Standing of the recovered `c6-T3` scratch | T: **out-of-run-root write, not fabricated**; 7/7 digests match; no packet standing | not in F's or U's boundary |
| `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` not reopened by T3 | T: **ruled explicitly on four grounds** | not in F's or U's boundary |
| The eight `F-C6-03` result digests | F: **void by construction** (wall-clock fields); the three script digests are sound | not in T's or U's boundary |
| The `F-C6-03` plateau invocation | F: **struck as budget avoidance**; both censuses discharged in 6.8 s and 50 s | not in T's or U's boundary |

Two deserve comment. First, on `C4-LA2`/`C4-LA3`: no seat opposes U's ruling and
no seat is in a position to, so U's ruling stands as the run's ruling — and it
**blocks rather than reopens**, consistent with my dispatch's instruction that
neither is reopened. Second, on `C5-LA1`: T and F each *cited* `(RI)` as formally
verified without the citation path, and each abstained on the Lean record itself;
U audited it end to end and certified it. Convergent use from abstaining seats
corroborates the citation and is exactly what controller memo item 5 rules — a
correct citation to a Stage 2 member with the path missing, not a false
certification.

### Genuine divergences, surfaced

**(a) Are the audited `T_m` rows "in-band"? — a real conflict between the F and
U adjudications, resolved as an index-convention divergence.**

F rules Cycle 5 synthesis result 8's clause "both audited rows are in-band"
**false as written**: with `x_22 = 32` the band is `{32}` against an audited row
`p = 34`, and with `x_60 = 87` the band is `{87,88,89}` against `p = 90`; both
audited rows satisfy `q ≥ ⌊3m/2⌋`. U rules the opposite in `E18`: "T22 and T60
reproduce the sealed fixtures exactly and **are themselves in-band rows**."

Neither seat's arithmetic is in dispute. The divergence is entirely about whether
the band index `q` is identified with the rank `p`. U's own portfolio fixes the
relation explicitly — `C-U3-T`'s exact reduction is stated as
`S(T_m, q+2) = w_{q+1} − w_q`, and `g_marked(q+2) = C(3m,q+1) − C(3m,q)` — so
**`p = q + 2`**. The sealed Cycle 5 synthesis, a member of my own capsule, states
the same binding in its Cycle 6 route portfolio: "run T22 (`m=22, q=32`) and T60
(`m=60, q=88`) as the in-band controls they are." And the band's lower endpoint
`q = x_m` then corresponds to `p = x_m + 2`, which is exactly the bottom of the
eligible window `p ≥ x(T)+2` — confirming the offset independently, since
`x(T22) = 32` and `x(T60) = 87` are the same integers all three orientations
report.

> **Ruling.** Under the run's own index relation `p = q + 2`, the audited rows
> `p = 34` and `p = 90` are `q = 32` and `q = 88`, and **both are in-band**
> (`{32}` at `m = 22`; `{87,88,89}` at `m = 60`). Cycle 5 result 8's locational
> clause is **true under the run's stated convention** and **false under the
> identification `q ≡ p`**. The F adjudicator, read-isolated from the U
> portfolio, could not see the reduction that fixes the convention, and its own
> ruling names the remedy conditionally — "correct the clause **or** disambiguate
> `q` from `p` explicitly"; `C-F3-U` recorded it as an unresolved ambiguity for
> exactly this reason. **The terminal record disambiguates rather than corrects:
> the `T_m` band is indexed in `q`, the rank is `p = q + 2`, and every future
> statement of the band must say which index it uses.** The adjudication the
> clause supports — Cycle 5's rejection of U1's T22/T60 exemption — is unaffected
> either way, and both adjudicators say so: it rests on the band-independent
> ground that T22 and T60 *are* `T_m` instances and the mandatory-control
> obligation is band-independent. Carried as a record correction and as debt item
> TD-35(h).

**(b) Where do T22 and T60 live? — two different classifications, not a
conflict.** U (route U2) rules both **non-terminal** in the PSC sense (the root
has 23 and 61 core-leaf neighbours with degree 23 and 61, satisfying Source A's
exclusion clause), hence outside the PSC-terminal stratum entirely. T rules both
**non-flat members of the eligible top-rank residual class** at `p = α−1`
(`(★)` holds, `|D| = 1`, eligibility `34 ≤ 67 < 68` and `89 ≤ 181 < 182`). Both
are exact and both are right: PSC-terminality and top-rank residual membership
are different predicates, and the two trees fall outside the first and inside the
second. **Reconciled, and the terminal record must state both**, because the
consequence is load-bearing: the two flagship controls lie **outside every
stratum orientation U closed** and **inside the class orientation T left open**.

**(c) Is the `T_m` family a live source of counterexamples?** U rules it now
**excluded** at the top rank by the closed form (B1), a genuine narrowing of the
search space. T rules T22 and T60 "two exact large instances of the open
obligation", correctly noting that two instances prove nothing universal.
**Reconciled: the two statements are about different objects.** The closed form
is universal in `m` at the single rank `p = α−1`, so the family is excluded
*there*; T's point is that the family's members are non-flat residual trees,
so the *flat* theorem does not cover them, and the general obligation at other
ranks and off the family is untouched. Both hold simultaneously.

**(d) The weight of critic attribution.** U flags that "the two results that
matter most (E7, E13) were produced in Stage 4, not by the routes"; T records
that two of its three routes' central claims were narrowed or rejected at route
level and the third delivered registered prior art; F records that its only
plateau invocation collapsed on inspection. All three still rule material
progress. **Reconciled: critic work is run work**, and I carry the attribution
explicitly throughout so no terminal text can misstate where this run's
productive capacity sat in its final cycle.

**(e) One paired-critic split inside a portfolio, resolved by its own
adjudicator and not disturbed here.** `C-T3-F` `retained_narrowed` against
`C-T3-U` `rejected` on `T-C6-03`. The T adjudicator resolved claim by claim:
five of `C-T3-U`'s substantive grounds upheld (registered r23 left-totality, the
inert `|W_v| = 1` hypothesis, the non-injective map, the undisclosed
Hall-counterexample control row, the misgraded debt bullet) and two overturned
(the false seal-transcription finding, and the "evidence layer void" charge,
overturned by 7/7 matching recovered digests). That resolution is within T's
exclusive jurisdiction, is reasoned rather than averaged, and I carry it.

**(f) Attribution of the non-strict stratum sign.** U upgrades it in
truth-status (bounded computation → theorem) and simultaneously narrows it in
attribution (the theorem is `C-U2-T`'s, not route `U-C6-02`'s), and separately
rejects the route's "strict support" sufficiency argument **as reasoning from the
route's own evidence** while holding the conclusion true on critic and
adjudicator evidence. No other orientation touches it. **Reconciled and carried
with that exact split.**

## Exact established results

Nothing below is promoted. Bounded computation, conditional antecedents,
target-equivalent rewrites and mechanism refutations remain what they are.
Grades: **exact theorem** (unconditional, proved at its stated scope); **exact
identity**; **conditional reduction** (exact, resting on a named unproved
hypothesis); **bounded computation** (exact-integer verification over a finite
range — bounded evidence, never a universal proof); **kernel-checked scratch**
(Lean-verified without a governed award's contract, receipts and reviews).
Attribution is stated for every item.

### A. Route-attributed (Cycle 6 Stage 3 routes)

**A1 — Flat residual sign law** (`T-C6-01`). Let `T` be a finite ordinary tree
(`IsTree`, `2 ≤ α(T)`) whose leaf-pruned core satisfies
`D = V(T) ∖ (L ∪ S*) = ∅` with every support multiplicity `q_s ≥ 2`. Put
`ℓ = |L|`, `k₂ = #{s : q_s = 2}`. Then `(★)` holds (every leaf in every maximum
independent set), `M = i_α(T) = 1`, `α(T) = ℓ`, and

```text
S(T, alpha(T)-1) = -ell*(ell-2) - k2*(ell-4).
```

*Corollary (sharp).* If additionally `α(T) ≥ x(T)+3` then `ℓ ≥ 5` and
`S(T, α−1) ≤ −16 < 0`, attained uniquely by the order-7 double star `DS(2,3)`.
*Grade:* **exact theorem, informal**, derived from `(RI)` = `C5-LA1` plus a
finite count; verified without exception on 290 census members (three
instruments), 3,069 fresh adversarial flat instances to order 60, and 50 flat
trees eligible and ineligible alike. The return's `≤ −3` with `ℓ ≥ 3` is
**struck** and replaced by the sharp bound; its `ℓ = 3` witness discussion is
struck as vacuous. **Its dependency DAG is not closed as written** — `IsTree` and
`2 ≤ α` are inherited silently through `C5-LA1` and must be stated as consumed,
and `D = ∅` must be separated from `(★)` and from eligibility (TD-19).

**A2 — Residual-class structural characterization** (`T-C6-01`). *Lemma A:* a
leaf lies in every maximum independent set iff its support lies in none (general
graphs, no tree hypothesis). *Lemma B:* under `(★)`, `α(T) = |L| + α(T[D])`,
every maximum independent set is `L ∪ J` with `J` a maximum independent set of
`T[D]`, and `M = i_{α(T[D])}(T[D])`. *Grade:* **exact, proved, informal.** Lemma
A is confirmed computationally by dual-criterion census agreement over all 81,134
trees. **Lemma B is narrowed**: it evaluates `M` exactly and leaves the
near-maximum sum over `I_{α−1}(T)` — the whole difficulty — untouched; "Lemma B
characterizes every member" and "reduces the general case" are struck.

**A3 — Exact census of the eligible top-rank residual class, orders 4–17**
(`T-C6-01`). 81,134 non-isomorphic trees; **16,424** eligible residual members;
290 flat; 16,134 non-flat; **0** sign violations; 0 closed-form mismatches.
Non-empty from order 7; per-order residual series as in Reconciliation item 8.
Density **declines monotonically** from 36.79% (order 10) to 18.87% (order 17);
flat share declines from 50% (order 7) to 1.09% (order 17). *Grade:* **bounded
computation**, replayed byte-identically by both critics and reproduced
cell-for-cell on a third independent instrument in 25.5 s — which independently
retires any "infeasible" grading of this census.

**A4 — Universal upper-guard failure for leaf-deleting rank-preserving
reductions** (`T-C6-02`). On the eligible top-rank residual class
(`p = α(T)−1 ≥ x(T)+2`, every leaf in every maximum independent set), **no
rank-preserving induced-subgraph reduction that deletes a residual-class leaf**
— with or without its support, including pendant-edge contraction at that leaf,
and for every `D ∋ v` — can satisfy the reduced upper guard `p < α(T′)`.
Hypotheses: finite simple graph (Lemmas 1–2 need no tree hypothesis; the tree
enters only through the class definition). *Grade:* **exact, proved**; a
corollary of the class definition plus induced-subgraph monotonicity of `α`.
Confirmed on 0 of 1,899 leaf-rows passing the guard across 312 residual trees,
on all 265 shipped rows (both critics, byte-identical replay), and by exhaustive
enumeration of every `D ∋ v` over all 26 residual rows at orders ≤ 9.

**A5 — Exhaustive orders-15/16 census** (`F-C6-01`). 27,061 pairwise
non-isomorphic trees, complete against A000055 by two independently implemented
enumerators and verified equal **as sets of isomorphism classes**; every eligible
row evaluated: **71,075 distinct (isomorphism class, rank) rows**, 27,061 of them
top-of-window; **every complete aggregate strictly negative; zero positive and
zero zero-valued aggregates**; maxima **−35** (order 15) and **−36** (order 16),
each attained on exactly one row, both at `p = α−1`. Residual refinement: 1,775
of 7,741 and 4,003 of 19,320. *Grade:* **bounded computation, exhaustive over the
stated region, re-derived end to end by a critic instrument sharing no code with
the return's or with the frozen evaluator.*

**A6 — The proper family-(b) bounded null at the corrected census**
(`F-C6-02`). Over all-parameter `K2` cores (`r,s ∈ [1,18]`, `r ≤ s`), `P3` cores
under exceptional clause (B) (`q_center = 0`, `r,s ∈ [1,18]`, `r ≤ s`), and 558
isomorphism classes of symmetric-endpoint path-shaped condition-(A) cores
(`k ∈ {4,5,6}`, interiors in `{0,1,2,3}`, endpoints in `{1,2,3}`): **900 distinct
trees and 4,435 distinct eligible rows, zero sign violations, every complete
aggregate strictly negative, global maximum exactly −12** at the `P3` clause-(B)
tree `r = s = 2`, `p = 4`. *Grade:* **bounded computation over exactly stated
finite ranges**, generator and output digests exact, replayed byte-identically by
both critics and re-derived on two independent capsule-object instruments.
The route substituted nothing where the capsule failed to define (`sel_star`
reported `NOT_SUPPLIED` on all 21,067 support entries) — correct discipline, and
the best thing in that return.

**A7 — Closed-form reduction and the `q_s = 1` zero locus** (`U-C6-02`). At a
support `s` that is a **core leaf** with `q_s > 0` and single core-neighbour `u`:
`H_s(z) = (1+z)^{q_s−1}·P_{s,u}(z)`, `R_s(z) = Q_{s,u}(z)`, with the resulting
three-term binomial forms for `g_s(p)` on `K2` and exceptional-`P3` cores, and
these re-derive the Cycle 5 synthesis's `I(T;z)` rather than assuming it. For a
double star with endpoint multiplicities `q1, q2 ≥ 1`, at the support of
multiplicity 1, `g_s(p) = [p{=}1] − [p{=}2]`, hence **`g_s(p) = 0` identically
across the entire eligible window**. *Grade:* **exact identity / exact theorem.**
The section's stated scope is narrowed to core-leaf supports (a support need not
be a core leaf).

**A8 — Orders 1 and 2 are vacuous** (`U-C6-02`). No eligible window exists at
either order, under the frozen evaluator's working convention and the binding
contract definition alike. *Grade:* **exact.** Narrowed: the primary statement
rests on the evaluator's working definition with the binding definition in a
parenthesis (inert for eligible-row determination); and "the order-1 core
`C = T − L(T)` is empty" is **struck** — under r23's degree-**exactly-one**
convention the order-1 vertex has degree 0, is not an original leaf, and the
order-1 core is the singleton `{v}` with `q_v = 0`. Vacuity is undisturbed.

**A9 — T22 and T60 are non-terminal** (`U-C6-02`). Root with 23 (resp. 61)
core-leaf neighbours at degree 23 (resp. 61) — Source A's exclusion clause
exactly. *Grade:* **exact**, reproduced by both critics and by the U
adjudicator. The route shows its mandatory controls out of scope rather than
silently claiming compliance.

**A10 — `tm_alpha_and_whole_arm`** (`U-C6-03`; the route obligation's mandatory
fifth lemma, delivered as a theorem). For every `m ≥ 1`,
`I(T_m;x) = (1+2x)·branch(x)^m + x(1+x)^{3m+1}` with `branch(x) = (1+x)^3 + x`;
`α(T_m) = 3m+2`; the maximum independent set is **unique** and equals
`{root, marked leaf} ∪ (all 3m branch leaves)`; consequently **every leaf of
`T_m` lies in it, so `T_m` is in the top-rank residual class**, and every branch
arm contributes its whole leaf triple with no branch centre ever in a maximum
independent set. *Grade:* **exact theorem**, parity-free, re-derived by both
critics and by the U adjudicator on an explicit-graph instrument.

**A11 — The band scan** (`U-C6-03`). `m = 1…400`: **4,137** distinct `(m,q)`
band rows across 375 `m`-values with a non-empty band; **0** rows failing
both-orbit favorability, **0** with `g_star ≥ 0`, **0** with `g_marked ≤ 0`, **0**
with `S ≥ 0`. Widths at checkpoints `22→1, 38→2, 40→2, 60→3, 110→6, 240→13,
380→21, 400→22`, and 88 at `m = 1600` (ratio exactly 0.055000). *Grade:*
**bounded computation**, typed as such without hedging, reproduced row-for-row by
both critics and by the U adjudicator. Contains a **disclosed 20-`m`, 418-row
(10.1%) overrun** past the certified `m ≤ 380` ceiling, with zero violations
found there; the route's own bullet denying the extension is struck and replaced
by the fact.

**A12 — The `T_m` band record correction** (`U-C6-03` discovery; `F-C6-03`
independently on the `m = 38` half). The band is empty **exactly** for `m ≤ 21`
and `m ∈ {23,25,27,29}`, and **non-empty for every `m ≥ 30` of either parity**.
*Grade:* **exact** (finite classification, verified to `m = 400` by three
independent instruments across two orientations). It is a genuine falsifier of a
standing implicit pattern; the route found it, reported it, and correctly
declined to promote it to a classification. Carried verbatim in the terminal debt
register as record correction RC-1 (item TD-29).

**A13 — `C5-LA1` verification audit** (`U-C6-01`). `C5LA1.topRankResidualIdentity`
is **kernel-valid** on the pinned toolchain (`lake build`, 8,657 jobs, exit 0),
axioms exactly `[propext, Classical.choice, Quot.sound]`, no `sorry`/`admit`/
`native_decide`, source byte-stable (`Main.lean` `0933211d…` before and after),
statement faithful to F1's `(RI)` term for term **including the subtractive
`λ(s)` term with F1's orientation**, non-conclusions list correct and complete,
both preserved rejected closes pipeline/lineage-only with zero mathematical
content change. *Grade:* **exact (verification)**, independently reproduced by
both critics and by the U adjudicator, which rebuilt in place on the pinned
toolchain. **`C5-LA1` is certified, not re-awarded.**

**A14 — Diagnosis: the Cycle 5 "six undefined sources" were an artifact**
(`T-C6-03`, half-reached in §4(a) and completed by its adjudicator). The six
zero-degree sources reported at `t_family(2), p = 6` were an artifact of the
Cycle 5 minimum-witness-deletion construction, not a property of the frozen
relation; under the frozen `Delete` every source on that row has out-degree
`≥ p−1 = 5`. *Grade:* **exact, confirmed on three instruments.** This **retires a
phantom ledger item** rather than establishing a new one.

### B. Critic-attributed (Cycle 6 Stage 4)

**B1 — `T_m` top-rank closed form** (`C-U3-F` and `C-T1-U`, independently).

```text
S(T_m, alpha(T_m)-1) = -9m^2 - 6m + 1  <  0   for every m >= 1,
equivalently 2 - ell^2 with ell = 3m+1,
with all 3m+1 leaves favorable at p = alpha-1 (Delta_p(T_m - v) = -i_p(T_m - v) < 0).
```

*Grade:* **exact universal family theorem** at literal ordinary-tree scope;
unconditional, parity-free, **not** bounded computation. Six independent
confirmations (Reconciliation item 7). It covers both standing controls
(`−4487`, `−32759`) and is a **non-flat** closed form. By `(RI)`, `S(T,α−1) ≤ 0`
*is* `(RC)` at that tree, so this is **the top-rank `(RC)` on the `T_m`
family**, established strictly and universally in `m` — and it removes no
quantifier from `(RC)` itself (see `## Lean awards`).

**B2 — `K2` / exceptional-`P3` non-strict stratum sign** (`C-U2-T`).

```text
Hypotheses.  T a finite ordinary tree whose leaf-pruned core C = T - L(T) is either
  (a) K2 -- equivalently T is a double star with endpoint multiplicities q1,q2 >= 1; or
  (b) the exceptional P3 of clause (B): C = P3, q_c = 0 at the centre, arbitrary
      positive endpoint multiplicities q1,q2 >= 1.
  p eligible: x(T)+2 <= p < alpha(T), with x and alpha the r23 literals.
  g_s, d_s the frozen capsule forms, strict selector boundary.
Conclusion.  g_s(p) <= 0 at every support s, hence
  S(T,p) = sum_{s: q_s>0} q_s * 1[d_s(p)<0] * g_s(p) <= 0.
Proof (two exact steps).
  1. Delta_k(T) >= 0 whenever 2k+4 <= alpha(T); hence x(T) >= ceil((alpha(T)-3)/2),
     so every eligible p obeys 2p >= alpha(T)+1.
  2. 2p >= alpha(T)+1 implies g_s(p) <= 0, by a binomial-ratio argument reducing
     to 2(p-1) >= alpha(T)-1.
```

*Grade:* **exact theorem** at literal ordinary-tree scope, both steps
machine-checked by the U adjudicator (Step 1: zero violations over all
`q1,q2 ≤ 80` on both families; Step 2 in isolation: 1,040,000 tested
configurations, zero counterexamples). It **discharges** the route's named
missing lemma for the two families and shows the route **overstated its
difficulty** — what is needed is `2p ≥ α+1`, not domination of a unimodality
threshold. It is **tight**: on exceptional `P3` at `q1 = 1` the zero of the
binomial difference sits exactly one rank below the eligible window's left edge.
And it **provably cannot reach condition-(A) cores of core order ≥ 4**, where
`H_s` and `R_s` become products and the ratio step has no analogue — so the
"single missing lemma" framing is narrowed to `K2` and exceptional `P3`, and the
obligation splits into two.

**B3 — Whole-class three-family expansion** (`C-T1-U`). Under `(★)` with
`α = ℓ + α_D`, `α_D = α(T[D])`, `M = i_{α_D}(T[D])`, and `A = B∩C = A_S ⊎ A_D`:

```text
(I)   |A_D| = alpha_D,     every s in A_S has q_s = 1  -> (ell - |A_S|) sets, weight ell-1-2|A_S|
(II)  |A_D| = alpha_D,     one s in A_S has q_s = 2    -> 1 set,             weight ell-2-2|A_S|
(III) |A_D| = alpha_D - 1, every s in A_S has q_s = 1  -> 1 set,             weight ell-2|A_S|
S(T, alpha-1) = ell*M - sum over the three families.
```

*Grade:* **exact identity, informal**, verified on all 3,244 eligible top-rank
residual trees of orders 7–15 and independently on all 312 of orders 7–12 (0
mismatches). Setting `D = ∅` kills family (III) and forces the flat theorem as
the degenerate branch — so the return's stated reason for stopping at `D = ∅`
("Lemma C's strict inequality uses `D=∅` essentially") is **rejected**. The
expansion is **exact but not term-wise signed**: family (I)'s weight
`ℓ−1−2|A_S|` flips once `|A_S| > (ℓ−1)/2`, a regime realized by **1,420** eligible
residual trees of orders 7–16, first at order 9. This is the sharpest available
statement of the residual obligation.

**B4 — Support-only deletion preserves `α` on the residual class** (`C-T2-F`
Counter-Lemma F and `C-T2-U` Axis B′, independently). Every leaf lies in every
maximum independent set, hence every support lies in **none**, hence every
maximum independent set survives in `T−s` and `α(T−s) = α(T) = p+1 > p`: **the
reduced upper guard holds on the whole class**, and `|V|` decreases by 1.
*Grade:* **exact, proved**; confirmed on 953/953 support-rows over 312 residual
trees, 23/23 supports of T22, 61/61 of T60, 57/57 census support-rows. *What it
does not supply:* any relation between `S(T,p)` and `S(T−s,p)` once the `q_s`
leaves at `s` become isolated and leave the original-leaf set. That relation
exists nowhere in the sealed evidence and may not be guessed (r23 naming rule).

**B5 — Rank-shifted reductions are live** (`C-T2-U`). Since `α(T−v) = p` exactly
on the class, the guard `p−1 < α(T−v)` **holds**; `(T−v, p−1)` is eligible for
67/67 leaves of T22, 181/181 of T60, 11/11 of `T(3,4,4)`, and for **278 of 312**
eligible residual trees of orders 7–12. *Grade:* **exact on the guard half;
open on the lower guard and the sign of `D_d`.* Consequently `T-C6-02`'s
rank-free universal exclusion sentence is **false as written** and is struck;
*rank-preserving* must be inserted.

**B6 — Exact reduction of the `T_m` domination question** (`C-U3-T`; an
equivalent identity independently by `C-U3-F`).

```text
W(x) = (3m+1)(1+x)^{3m} + 3m(x+2)(2x+1)*branch(x)^{m-1},   w_k = [x^k] W.
Then, exactly and for every q,   S(T_m, q+2) = w_{q+1} - w_q.
Hence in-band domination  <=>  w strictly decreasing on [x_m, floor(3m/2)).
```

*Grade:* **exact identity**, adjudicator-verified at 969 `(m,q)` pairs over
twelve `m`-values across `0 ≤ q < 3m`, zero mismatches. This is the formulation
any general proof must take. **It is also the statement that fixes the run's band
index convention `p = q + 2`** (divergence (a)).

**B7 — The sufficient chain and its three named lemmas** (`C-U3-T`). In-band
domination closes modulo **(P1)** `x_m ≥ mode(branch(x)^{m−1}) + 2`; **(P2)** a
uniform gap `1 − ρ ≥ c/m` at the band bottom, where `ρ = b_{q−1}/b_{q−2}`; and
**(P3)** a nonasymptotic lower bound on `[x^k]branch(x)^{m−1}` at `k ≈ 3m/2` with
rate `> 8` and an explicit `m₀`. *Grade:* **conditional reduction**; the chain is
verified exactly in rational arithmetic at 590 band rows for `m = 22…160`, zero
failures, margins rising from 7.65 at `m = 22` to `7.9×10^18` at `m = 400`.
(P1) is verified for every `m = 2…240` and is **tight**, with equality at
`m = 22, 40, 60, 100, 200`. (P2)'s `Θ(1/m)` decay is exactly cancelled by the
`3m` prefactor, which is why the chain survives at all; `branch` is log-concave
but **not real-rooted**, so Newton/Pólya–Schur machinery is unavailable. (P3)'s
elementary single-term bound is rigorous, reaches `8.981` asymptotically, but
measures `8.020` at `m = 60` and `8.787` at `m = 400`, so it does not separate
from 8 below `m ≈ 60`.

**B8 — Width law** (`C-U3-T`). `x_m = ⌊13m/9⌋ + 1` for **every `m ≥ 30`**, hence
`width(m) = ⌊3m/2⌋ − ⌊13m/9⌋ − 1` and asymptotic ratio `3/2 − 13/9 = 1/18`;
mechanism identified (`13/9` is the mean of the `branch` weight vector
`(1,4,3,1)/9`, and `mode(branch^n) = ⌊13n/9⌋`). *Grade:* **bounded computation**,
verified to `m = 600` with exceptions **only** at `m ∈ {2,4,6,11,13,20,29}`, all
below 30; and confirmed independently over `30…400` inside the F portfolio. It
is **exactly equivalent to the unproved (P1)**. Complementary finding upheld
(`C-U3-F`): the width is neither monotone nor parity-uniform
(`w(37)=1, w(38)=2, w(39)=1`; `w(379)=20, w(380)=21, w(381)=20`), and the
"≈ 0.055·m" reading is an asymptotic **even-`m`** reading — at `m = 31` the true
ratio is 0.0323, off by 40%.

**B9 — Parity of the base block immediately above the band** (`C-U3-F`,
`C-U3-T`). At `q = ⌊3m/2⌋`, `g_marked` is **strictly negative for even `m`** and
**exactly zero for odd `m`**. *Grade:* **exact**, adjudicator-verified at
`m = 22,31,33,38,40,60,61,101,399,400` (e.g. `C(93,47) − C(93,46) = 0` at
`m = 31`). The route's sharpness clause "equality `2q+1−3m = −1` attained exactly
at the band's top point" is **struck for every odd `m`**, where the value is −2.

**B10 — Hypothesis-reduced `C5-LA1`** (`C-U1-F`). The identity holds with
**`hTree` and `hEligible` deleted**: for every finite simple graph with decidable
adjacency, `hAlpha ∧ hResidual` suffice, on the same three axioms, with the
shipped four-hypothesis award an immediate corollary. *Grade:* **kernel-checked
scratch** (probe `734e21e00894fb71f454bae35d29166f80ee78867e439a9e85f3d48193d4d8f6`,
replayed by the U adjudicator at exit 0 with `#print axioms` reporting exactly
the three permitted axioms) — **not a governed award**: no theorem contract, no
registered fragment ledger, no kernel-verification receipt, no independent
informal audit, no fidelity review, no run identity. The route's debt item
"removability … remains formally open" is **struck**.

**B11 — `hAlpha` is redundant and the award is silent at `α = 2`** (`C-U1-F`,
`C-U1-T`). `hEligible` forces `α ≥ 3` (in fact `α ≥ 4` on the eligible regime),
so `hAlpha` adds nothing to the declaration's scope though it is load-bearing in
the proof. Consequently `C5-LA1` says nothing at `α = 2`, including at
`K_{1,2}` — residual, at top rank, `S = +2 > 0` — which is precisely the instance
refuting unqualified `(RC)` and precisely why `hEligible` is a mandatory scope
fence even though the proof never consumes it. *Grade:* **exact.**

**B12 — `C5-LA1` is non-vacuous** (`C-U1-F`). 312 of the 987 free trees of order
≤ 12 satisfy all four hypotheses and all 312 satisfy the identity; likewise 1,897
labeled instances on `n ≤ 7`. *Grade:* **bounded computation.** Established by
the critic, **not** by the route: the audit's own in-scope coverage is **4 rows**
(the designed stars `K_{1,6..9}`, `LHS = RHS = −24, −35, −48, −63`), of 102
eligible rows in a 19,792-row census, with **zero** in-scope rows in its
exhaustive `n ≤ 6` component.

**B13 — Condition-(A) core census up to isomorphism** (`C-U2-F`). Core orders
1–8 give `1, 1, 0, 1, 1, 2, 3, 6`. **Order 3 has none** — which is exactly why
clause (B) exists for the exceptional `P3` — and **order 4 has exactly one, the
path `P4`**, so `U-C6-02`'s decorated `c1–c2–c3–c4` stress test is **exhaustive
up to isomorphism at core order 4** and the route understates its own coverage.
*Grade:* **exact.** With the Cycle 4 singleton-core theorem and B2, the
non-strict sign now holds on **every PSC-terminal tree whose core has order at
most two, plus the whole clause-(B) exceptional family**, and the smallest
genuinely uncovered shape is the decorated `P4` core.

**B14 — The `q_s = 1` zero locus as a biconditional** (`C-U2-F`).
`g_s(p) = 0 ⟺ q_s = 1` on `K2` cores, verified to `q ≤ 120` over 1,691,538
eligible rows with zero counterexamples in either direction. *Grade:* forward
direction exact (route, A7); **converse half bounded computation,
critic-attributed.**

**B15 — Strict aggregate negativity on the named strata, with the selector
actually evaluated** (`C-U2-T`, `C-U2-F`). No generator of `U-C6-02` computes
`d_s(p)` anywhere; the critics supplied it over both families to `q ≤ 160` and
over ~4.9 million independently computed eligible rows to `q ≤ 120`, with extreme
asymmetry to `q2 = 2000` and every condition-(A) core of order 1–7 — zero rows
with no selected support, zero rows with `S ≥ 0`, and (adjudicator replay to
`q ≤ 40`) zero strictly-negative-but-unselected supports. *Grade:* **bounded
computation, critic- and adjudicator-attributed.**

**B16 — The star-family closed form and the falsifier's trapped domain**
(`C-F1-U`). The `F-C6-01` broom filter forces `α = order − 1`, which holds iff
the tree is a star; all 87 admitted rows are `K_{1,m}`, naming 56 distinct
isomorphism classes, ten of them already inside F1's own census, and

```text
For K_{1,m} at p = alpha-1 = m-1:  a_v = -1, b_v = 2-m, B_v = 0, g_v = 2-m,
S(K_{1,m}, m-1) = -m(m-2);  all 87 rows satisfy g_s = -(order-3) and
aggregate = -(order-1)(order-3) exactly.
```

*Grade:* **exact identity on a family**, obtainable without any search, and
already carried in the sealed record by Source A's universal genuine
singleton-core sign theorem. The construction's billing as fresh adversarial
coverage is **struck**: it probes cancellation for exactly zero non-star
topologies.

**B17 — The mechanism inequality is tight, not strict** (surfaced by `C-F1-T`,
`C-F1-U`, `C-F2-T` from the routes' own shipped artifacts and recomputed by the
F adjudicator). Over the 71,075 exhaustive census rows the **maximum individual
summand is exactly 0**, with equality attained on **7,350 rows (10.3%)**, 4,781
of them at `p = α−1`; over the 55,486 designed-family rows, maximum exactly 0
with equality on 15,964 (28.8%); over `F-C6-02`'s 21,067 favorable supports,
maximum `g_s` exactly 0 with equality on 367. *Grade:* **exact integer fact over
bounded exhaustive regions.* So the sharp statement the F evidence supports is
**`g_v ≤ 0` with equality attained, stably from order 8 upward and in every
family scanned** — a qualitatively different datum from "no positive summand
found", and the real answer to the falsifier's own question at four orders of
magnitude more breadth than the falsifier achieved.

**B18 — The near-miss trend turns at order 10 and recedes** (`C-F1-U`). Maximum
complete aggregate by order 7–16: `−12, −20, −18, −15, −18, −22, −24, −29, −35,
−36`. The best approach to zero anywhere scanned is **−15 at order 10**; the new
orders-15/16 coverage moves **away** from the boundary. *Grade:* **exact integer
fact over a bounded exhaustive region.*

**B19 — Frozen-definition correspondences** (`C-F1-T`, `C-F1-U`, `C-F2-T`,
`C-F2-U`). `a_v(T,p) = d_s(p)` **as integers**, from Source A's
`I(T−v;z) = H_s(z) + zR_s(z)`; the capsule's per-support aggregate
`S(T,p) = Σ_{s: q_s>0} q_s·1[d_s(p)<0]·g_s(p)` equals Source B's leafwise
`S = Σ_{v∈F}(b_v − B_v)` on **38,634 rows with zero mismatches**; the capsule's
product forms equal the deletion graphs `H_s = T−{v,s}`, `R_s = T−N[s]`; and the
capsule's global eligibility polynomial holds on every sampled row. *Grade:*
**verified at critic grade, not at route grade.** The charter's condition — "both
constructions acceptable if they agree; verify they agree" — **is met, by the
critics**.

**B20 — Critic extensions of the family-(b) null** (`C-F2-T`, `C-F2-U`).
Condition-(A) path cores with **asymmetric** endpoints (`k = 4,5`), path cores at
`k = 7,8`, **spider cores with legs of length ≥ 2** (3 and 4 arms, orders 10–23,
every one confirmed condition-(A)), a branching caterpillar core of order 7 with
a pendant path, and `K2`/`P3` clause (B) extended to `r,s ≤ 30`: **9,627 trees /
32,776 rows outside every range the return states**, maximum −15, and the
`K2`/`P3` maximum remaining **exactly −12** as multiplicities grow — the
aggregate does not drift toward zero. *Grade:* **bounded computation at critic
grade**, covering precisely the two shapes `F-C6-02` named as its own debt.

**B21 — The orders-1–14 and orders-4–17 censuses, discharged from debt**
(`C-F3-T`). Orders 1–14 complete: tree counts `1,1,1,2,3,6,11,23,47,106,235,551,
1301,3159` (= A000055), eligible rows `{7:4, 8:6, 9:32, 10:116, 11:294, 12:805,
13:2528, 14:6835}`, total **10,620**, zero positive aggregates, zero zero-valued
aggregates, zero rows with any positive summand, maximum **−12** at order 7.
Orders 4–17 eligible residual: **16,424**, per-order series as above. *Grade:*
**reproduced from the frozen definitions with no evaluator in the mathematical
loop, in 6.8 s and 50 s respectively** — by canonical augmentation, using the AHU
canonicalizer `F-C6-03` had already written and used only as a filter.

**B22 — The `(RI)` census** (`C-F3-T`, `C-F3-U`). Over labelled trees `n = 3..8`:
**280,391** trees (closed form `Σ_{n=3}^{8} n^{n−2}`), **87,833** residual,
**192,558** non-residual, **8,345** eligible residual; `(RI)` holds on 100% of
residual and fails on 100% of non-residual instances, both sides re-derived from
the C5-F1 capsule including the subtractive `λ(s)` term. *Grade:* **bounded
computation, reproduced independently by both critics.* **Narrowed:** the
non-residual half is a clean hypothesis separator, **not** evidence of sharp
necessity — `(RI)` is stated only under the residual hypothesis, so off-hypothesis
disagreement is expected.

**B23 — Registered r23 prior art: universal eligible-row left-totality of
`Gamma_actual`** (`C-T3-U` located the registration; `C-T3-F` reached the same
mathematics without it). No source of `Gamma_actual(T,p)` has out-degree zero, at
any eligible rank, in any ordinary tree, **for any witness size**. *Grade:*
**`proved_informal`, registered in r23** (`sources/r23/SYNTHESIS.md` line 169,
`R23-ACTUAL-CONSTRUCTION`; `sources/authority/LEDGER.md` retained proof package).
`T-C6-03`'s §3 is the `|W_v| = 1` special case and **adds nothing to it**;
credited to r23, not to Cycle 6. At `t_family(2), p = 6` every one of the 54
sources has strictly positive `Delete` out-degree (minimum 5 = `p−1`);
zero-degree sources of any witness size: **0**. The chartered obligation
presupposed a non-empty class of zero-degree singleton-witness sources; **that
class is empty, universally.**

**B24 — The `T-C6-03` map is non-injective and its control row is the registered
Hall counterexample** (`C-T3-F`, `C-T3-U`). At `t_family(2), p = 6`:
`|P| = 54`, `|N| = 171`, `|P| − |N| = −117 = S(T,6)`, 7 favorable leaves, and **6
singleton-witness sources tagged by leaf 2 mapping to only 5 distinct images —
one collision, on the route's own chartered row**; the rule is additionally
non-canonical (`z* = min(A ∖ {r})` depends on a chosen vertex order). And
`sources/authority/LEDGER.md` records
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` REFUTED **on precisely `T22,
p = 34`** — the row the return elevates as its structural control — by a
center-free cut with deficit `14226520737620288370`. *Grade:* **exact.** So on
one row left-totality holds universally while Hall fails by a deficit of order
`1.4 × 10^19`: out-degree positivity carries **zero** force toward Hall. "Payment"
is struck from the typed claim; what is proved is **definedness**.

**B25 — Corrected census literals** (`C-U1-T`/`C-U1-F`, `C-U2-T`/`C-U2-F`,
`C-F1-T`/`C-F1-U`, `C-F2-T`/`C-F2-U`, `C-T1-F`/`C-T1-U`, `C-T3-F`/`C-T3-U`).
Carried in full as record corrections RC-2 … RC-9 below. *Grade:* **exact
recounts**, each reproduced by at least two instruments and, where the two
critics differed, reconciled by the adjudicator rather than averaged.

### C. Explicitly NOT established, by any orientation, this cycle

`(RC)` on the general eligible top-rank residual class; `S(T,α−1) ≤ 0` for
`D ≠ ∅`; the reduced lower guard; the sign of `D_d`; any admissible reduction
with **both** guards proved; the general in-band `T_m` domination theorem;
condition-(A) cores of core order ≥ 4; strictness on any stratum as a theorem;
global Hall or injectivity for `Gamma_actual`; a payment (injective,
selector-faithful, sign-independent assignment) for any source class;
literal-to-governed transport; governed `E993-BETA-AGG`; Erdős #993.

## Refuted or narrowed mechanisms

### Refuted in the mathematical sense (by proof, universal over a class)

1. **Rank-preserving induced-subgraph reduction that deletes a residual-class
   leaf** — plain leaf deletion, leaf-with-support deletion `H_v`, pendant-edge
   contraction at that leaf, and every `D ∋ v` — is **refuted** as a route to
   `(RL+)` on the eligible top-rank residual class (A4). Universal over the
   class, by proof, not by search.
2. **The `K2`/`P3exc` proof method provably cannot reach condition-(A) cores of
   core order ≥ 4** (B2/B13): `H_s` and `R_s` become products
   `(1+z)^{q_s−1}∏_u P_{s,u}` and `∏_u Q_{s,u}`, and the binomial-ratio step has
   no analogue. This is a proved limitation of a method, not a refutation of the
   statement; that family needs a product-form argument and is a distinct open
   problem.
3. **The chartered class of `T-C6-03` is empty** (B23): no source of
   `Gamma_actual` is zero-degree at any eligible rank for any witness size, and
   that emptiness is registered r23 prior art. The obstruction the route was
   built to remove does not exist; the surviving obstruction is **collision, not
   definedness**, and it is not confined to singleton-witness sources.

**Nothing else was refuted this cycle.** Every falsification attempt across all
three orientations returned zero counterexamples: `C-U1-F` across 973,960 labeled
graphs and 987 free trees; `C-U2-F` across ~4.9M eligible rows and all
condition-(A) cores to order 7; `C-U2-T` across all non-isomorphic trees to order
16; `C-U3-T`/`C-U3-F` across the full band and the full eligible range; the three
F censuses and seven critic extension sweeps. Per `SEMANTIC-CONTRACT.md` and
every adjudicator's own ruling, **a null search is bounded evidence of nothing**,
and a wider null is still a null.

### Route-level verdicts rejected or narrowed by their adjudicators

- **`T-C6-02`'s route-level label `refuted` is rejected** and replaced by an
  honest split: `refuted` for the leaf-deleting rank-preserving class (universal,
  by proof); `still_open` for **support-only deletion** (B4) and for
  **rank-shifted reductions** (B5). A route cannot be labelled `refuted` while
  its own terminal debt concedes an avenue inside its own fingerprint is open.
  Its closure state is the third of the three the charter names — the debt named
  with its exact failing class — and it lands there well.
- **`T-C6-03`'s typed verdict `proved` is rejected.** Its typed claim is against
  an obligation whose premise is false in run-root authority, and its central
  mechanism duplicates a registered `proved_informal` result it never cites. The
  mathematical statement is **retained as the `|W_v| = 1` special case of r23's
  retained eligible-row left-totality**, carrying no new establishment and no
  award. Struck: "payment", "closes the chartered obligation", "outside the
  witness-deletion class" (unbacked — no definition of the refuted one-witness
  family exists in scope), "13 distinct rows" (correct: **19**), the artifact
  grade for §4, and terminal-debt bullet 2.
- **`U-C6-02`'s "strict support" sufficiency argument is rejected as reasoning
  from the route's own evidence** (the route never computed `d_s(p)`), while its
  conclusion is **true** on critic and adjudicator evidence (B15). The route's
  "single missing lemma" framing is narrowed to `K2` and exceptional `P3`.
- **`U-C6-03`'s second "theorem" is narrowed** from an independent universal
  theorem to an **equivalence with the chartered band's own definition**
  (`{q : g_marked(q+2) > 0} = {q : q < ⌊3m/2⌋}` exactly, both parities), with its
  sharpness clause struck for odd `m` (B9). `C-U3-F`'s free strengthening — the
  chartered band is *optimal* for the domination framing, not merely sufficient —
  is credited to that critic.
- **`U-C6-01`'s census as coverage of the theorem is narrowed** from 19,800
  instances to **4 in-scope rows**; non-vacuity is established by `C-U1-F`, not by
  the route. Its T22/T60 skip is **rejected as reasoned** (the fixtures are in the
  authorized `sources/` tree and run-root authority binds every seat); the valid
  ground — the fixtures are tabulated at interior ranks where a top-rank statement
  does not apply — was never given; both controls pass at top rank.
- **`F-C6-01`'s broom falsifier is retained as arithmetic and rejected as fresh
  adversarial construction** (B16); its mandatory T60 control was **substituted,
  not performed** at the contracted rank `p = 90` on a factually wrong
  jurisdictional ground — the contracted row passes, supplied three times over by
  `C-F1-T`, `F-C6-02` and `F-C6-03`, but not by `F-C6-01`.
- **`F-C6-02`'s `capsule_identity_holds` cross-check is struck as a check**: the
  `supports` dictionary is built from the evaluator's own summand list, so every
  listed support already satisfies `d_s(p) < 0` (0 of 21,067 with `d_s ≥ 0`), the
  indicator is vacuous, `q_s` counts *favorable* rather than all leaves at `s`,
  and the "identity" is an algebraic regrouping that **cannot fail**. The
  correspondence itself is retained **at critic grade** (B19).
- **`F-C6-03`'s plateau invocation is struck as budget avoidance**; the regions it
  declined had never been scanned by that route, and both were discharged by a
  critic in 6.8 s and 50 s (B21). Its eight result-digest bindings are **void by
  construction** (wall-clock fields); its three script digests are sound and
  bindable. Its instrument-independence self-description is struck
  (`aggregate_row` **is** `S(T,p)`; `leaf_data` **is** `g_v`).
- **`F-C6-02`'s `b = 0` categorical claim is narrowed**: true for the
  endpoint-multiplicity reading at `r ≥ 1` (the surviving core is the singleton
  star core, `T = K_{1,r+1}`) and false at `r = s = 0` (the core is **empty**);
  under the `P3`-parameter reading a `P3` endpoint of multiplicity 0 with
  `q_center = 0` yields a **terminal `K2` core of order 2**, so the sub-family is
  non-empty; under the only authorized reading of the symbol
  (`b_v = Δ_{p−1}(H_v) = 0`) it is empty here (0 of 2,687 supports). **`b` is
  undefined in scope and was proxied** — the same discipline the same return
  correctly refused for `sel_star`.
- **`T-C6-01`'s stated reason the method cannot generalize is rejected** — it does
  generalize, to B3 — and its non-thinness certification is **narrowed on trend**
  (below).

### Standing fences, verified preserved

No status transfers literal → governed anywhere. `E993-BETA-TARGET`,
`E993-BETA-AGG-SUPPORT` and `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`
remain **REFUTED**, neither reopened, reasserted nor renamed — ruled explicitly
on four independent grounds for the one live risk. `C4-LA2` and `C4-LA3` remain
**blocked**. `C5-LA1` is **certified, not re-awarded**. The unqualified `(RC)`
equivalence remains **FALSE** at `K_{1,2}`. The r23 naming rule is respected by
every route that met a missing definition: each named the absence rather than
substituting a proxy — `T-C6-02`, `T-C6-03`, `F-C6-01` (on `REL_ORDER_LIMIT`),
`F-C6-02` (on `sel_star`) — which is correct discipline and is credited.

## Headline verdicts

Exact evidence grades. **No status transfers from the literal face to the
governed face, and none is asserted anywhere in this cycle.** Per
`SEMANTIC-CONTRACT.md`, no status moves from face 1 to face 2 without face 3, and
face 3 is `not_established`.

| Face | Verdict | Exact evidence grade and scope |
|---|---|---|
| **Literal interior-window favorable-original-leaf aggregate** (`AGG_literal`: `S(T,p) ≤ 0` for every eligible `x(T)+2 ≤ p < α(T)`) | **`still_open`** | Four new exact universal theorems at literal ordinary-tree scope this cycle — the flat residual sign law with its sharp bound `≤ −16` (route A1), the universal upper-guard failure corollary (route A4), the `K2`/exceptional-`P3` non-strict stratum sign (critic B2), and the `T_m` top-rank closed form `−9m²−6m+1 < 0` (critic B1) — plus two exact identities that relocate the obligation (critic B3, critic B6), one exact structural counter-lemma (critic B4), an exact census fixing the condition-(A) frontier (critic B13), and bounded computation over 71,075 exhaustive orders-15/16 rows, 16,424 eligible residual rows to order 17, 10,620 rows to order 14, 4,435 family-(b) rows and ~4.9M stratum rows, with **zero positive complete eligible aggregates anywhere**. **No universal proof. No fully guarded positive complete aggregate.** Every positive object exhibited anywhere in this cycle is a positive *summand* inside a negative aggregate (T22's `+212336130412243110`, T60's `+2935177632783649903488454322226807645411570590073000`, each the unique positive summand in its row), a *zero-valued* summand (`double_star(1,5)`; 7,350 census rows; 367 family-(b) supports), or a positive row *outside the live window* (`K_{1,2}`, `path_graph(6)`, both ineligible). `SOLUTION-CONTRACT.md` fences all three. |
| **Governed `RTree` aggregate** | **`still_open`** | **No Cycle 6 content whatever.** No governed universal theorem was established, attempted or claimed by any route, critic or adjudicator in any orientation. Literal results do not transfer automatically. |
| **Semantic literal-to-governed transport** (`TRANSPORT_literal_to_governed`) | **`not_established`** | **No Cycle 6 content.** No authenticated, directionally adequate, summand-preserving transport theorem or decoder exists or was attempted; no decoder was built. `SEMANTIC-CONTRACT.md` face 3 is untouched by every U route, every F route and every T route, verified independently by all three adjudicators. The run has **never** had such a theorem. |
| **Governed `E993-BETA-AGG`** | **`still_open`** | Neither the literal theorem, nor a governed theorem, nor the required transport is closed. **No lower-scope result is promoted.** |
| **Erdős #993** | **`unresolved`** | The sealed Cycle 6 evidence supplies no theorem and no counterexample at the full problem scope. |

Unchanged from Cycle 5 on every face. The change is in the **map**, not in the
status.

headline_resolved: no

## Lean awards

Protocol duty 4 permits an award only for a **stable statement** with a **closed
dependency DAG at its exact auxiliary scope** and **sufficient materiality**.
`SEMANTIC-CONTRACT.md` is explicit: "Equivalent restatements, bounded negative
searches, and family-only formulas are supporting results **unless they remove a
named central obstruction**." I rule on every proposed and flagged candidate.

**What was proposed.** `T-C6-01/02/03` propose **none**; the T adjudicator rules
explicitly that nothing in orientation T qualifies. `F-C6-01/02/03` propose
**none**; the F adjudicator rules zero "explicitly and without qualification".
`U-C6-01/02/03` propose none as route results; the U adjudicator rules on the
three named candidates and finds all three fail materiality. Controller memo item
7 flags four critic-derived results as possible award material. I rule on each.

**Candidate 1 — `S(T_m, α−1) = −9m² − 6m + 1 < 0` (B1).** *(a) Stable
statement:* **yes** — a closed-form equality with a strict inequality corollary
over one explicit parameter, parity-free, no hidden convention. *(b) Closed DAG
at literal scope:* **yes** — the `T_m` construction (fixed by the frozen
evaluator's own constructor and both sealed fixtures), the rooted-forest
independence recursion, `α(T_m) = 3m+2` with a unique maximum independent set
(A10, proved), the observation that every leaf is favorable at `p = α−1`, and two
coefficient extractions; nothing in that chain is open. *(c) Materiality:*
**no — and this is the decisive ruling.** By `(RI)`, `S(T,α−1) ≤ 0` is *exactly*
`(RC)` at that tree, so this **is** the top-rank `(RC)` on the `T_m` family,
established strictly and universally in `m`. That is real and non-trivial. But
`(RC)` — the named central obstruction — is quantified over **every** tree in the
top-rank residual class, and `T_m` is one parametric family inside it.
Establishing `(RC)` on one family **removes no quantifier**: it does not narrow
the class, supplies no reduction from the class to the family, and excludes no
positive top-rank residual row outside it. Nor is it awardable "at its exact
family scope" — every family-only formula is universal at its own family scope,
so that reading would empty the contract's clause of content; materiality is
judged against the run's named obstructions, not against the statement's own
domain. **Ruling: family-only supporting result. NOT AWARDED. Recorded** as an
exact universal family theorem at literal ordinary-tree scope, with its
`(RC)`-on-`T_m` reading stated explicitly and its non-generality stated just as
explicitly. Both the T and U adjudicators reach the same disposition
independently ("name it; do not award it").

**Candidate 2 — the `K2` / exceptional-`P3` non-strict stratum sign (B2).**
*(a)* **yes**, at the statement displayed above, with hypotheses bound to the
frozen-definitions capsule and the r23 literals. *(b)* **yes, at the stratum's
own scope, and only if stated through the core-incidence characterization** —
the frozen guarded PSC **move relation** does not exist in scope as an object
with its own authority, so a hypothesis naming terminality via the move relation
would leave the DAG open at the definitional level, while the capsule licenses
the core-incidence condition as what routes may use. *(c) Materiality:* **no,
this cycle.** It is a stratum result on PSC-terminal trees of core order ≤ 2; the
smallest uncovered condition-(A) shape (the decorated `P4`) is **provably out of
the proof's reach**; and it touches neither `(RC)`, nor the reduced lower guard,
nor universal qualifying deletion, nor transport. Decisively for a terminal
cycle: it was **first written in a Stage 4 critique**, has never been through a
route's own falsification pass, and its two steps have been machine-checked but
**not independently re-proved by a second mathematical reviewer** — and no Stage 7
formalization cycle remains. A governed award on that basis would be exactly the
failure mode the protocol's own check names. **Ruling: NOT AWARDED. Recorded as
the strongest new theorem in the run's terminal cycle, critic-attributed, with
the core-incidence statement of its hypothesis, and named the highest-value Lean
target should the run ever resume.**

**Candidate 3 — a hypothesis-reduced `C5-LA1` (B10).** *(a)* **yes** — the
shipped declaration with two binders deleted; the probe carries the exact text.
*(b)* **yes, and unusually strongly** — it reuses the audited run's own
definitions and lemmas verbatim, and the kernel has already checked it on the
three permitted axioms. *(c) Materiality:* **no.** `C5-LA1` is already formally
verified and **is not re-awarded** (my dispatch and the protocol both say so), and
a hypothesis-reduced restatement of an already-awarded identity is the paradigm
case of a **repackaged identity**: it generalizes the award's *domain* (trees →
all finite simple graphs) without changing what the identity says or removing any
obstruction. The sign of `S` is untouched; `(RC)` is untouched; transport is
untouched. **Ruling: NOT AWARDED.** Its standing is **kernel-checked scratch, not
a governed award** — it carries none of the six things that distinguish `C5-LA1`
from a probe (theorem contract, registered fragment ledger, kernel-verification
receipt, independent informal audit, independent fidelity review, run identity).
The award of record remains the fenced four-hypothesis declaration; the
removability finding is carried as terminal debt at that grade (TD-24).

**Candidate 4 — the exact `T_m` reduction `S(T_m,q+2) = w_{q+1} − w_q` and the
width law `x_m = ⌊13m/9⌋ + 1` (B6, B8).** The reduction has a stable statement
and a closed DAG but is a **conditional reduction's scaffolding**, not a theorem
about the object of interest: it converts an open domination question into an
equally open monotonicity question. No materiality. The width law has a stable
statement but its **DAG is not closed** — it is verified to `m = 600`, not
proved, and is *exactly equivalent* to the unproved (P1). **Ruling: NEITHER
QUALIFIES. NOT AWARDED.**

**Further statements ruled on, none awarded.**

- **A1, the flat residual sign law.** Stable once `IsTree` and `2 ≤ α` are stated
  as consumed via `C5-LA1` and `D = ∅` is separated from `(★)`; **as written its
  DAG is not closed**, so it is not packageable in its return form. Even
  repaired it is a family/subclass-only formula covering **290 of 16,424**
  enumerated members (1.77%, falling to 1.09% at order 17) and removes no named
  central obstruction. **Supporting result; not award material.**
- **A4, the universal upper-guard failure.** Stable, DAG closed — but an
  equivalent restatement of the residual-class definition plus induced-subgraph
  monotonicity of `α`. Under `SEMANTIC-CONTRACT.md`'s admissibility rule an
  equivalent restatement is a supporting result unless it removes a named central
  obstruction, and it does not remove `(RC)` — it re-describes it. **Supporting
  result; not award material.**
- **B3, the whole-class three-family expansion.** Stable **conditional on the
  same restatement A1 needs**; exact and independently verified; **not term-wise
  signed**; it removes no obstruction — it relocates one. **Named as the sharpest
  available statement of the residual obligation; not awarded.**
- **B16, `S(K_{1,m}, m−1) = −m(m−2)`.** A repackaging of the singleton-core base
  family already carried in the sealed record by Source A's universal genuine
  singleton-core sign theorem. **Repackaged identity; not awarded.**
- **B23/A14 (orientation T's `Gamma_actual` work).** Registered r23 prior art at
  `proved_informal`, plus a diagnosis that retires a phantom item. **Nothing to
  award.**
- **Every bounded null**, however clean — the orders-15/16 census, the
  orders-1–14 and orders-4–17 censuses, the family-(b) scan and its seven critic
  extensions, the band scans to `m = 400`, the ~4.9M-row stratum sweeps.
  **Expressly excluded.**

**`(RC)`.** No `(RC)` claim qualifies, per the protocol, and none is offered. I
record for the record, as my dispatch directs, that `S(T_m, α−1) < 0` **is** the
top-rank `(RC)` on the `T_m` family — and that this does not make it an `(RC)`
claim in the protocol's sense, because the protocol's bar is the statement
quantified over the residual class, which no route and no critic approached.

**`C4-LA2` and `C4-LA3`.** Neither is reopened by this synthesis, and neither is
closer to reopenable on this cycle's evidence. The bridges built this cycle
(`U-C6-01`, `U-C6-02`) do **not** supply what the Cycle 4 block reviews named:
`U-C6-01` audits an award that already exists and adds no new formal object (its
only new formal content is a critic's ungoverned scratch probe), and `U-C6-02`'s
stratum theorem depends on the PSC-terminal hypothesis whose **move relation** has
no source authority in scope. No T route and no F route builds any bridge toward
either. Both remain **blocked**.

**`C5-LA1`.** Certified by `U-C6-01` (A13) and **not re-awarded**. Its citation
path must be supplied wherever `T-C6-01` and `T-C6-02` cite `(RI)` as formally
verified: per controller memo item 5 those are **correct citations to a Stage 2
member with the citation path missing, not false certifications**, and the
underlying mathematics is unaffected. Both cited literals are struck **as
written** and regraded on that rule.

### Ruling

> **`no award attempted`.**
>
> **Reason.** No statement produced in Cycle 6 by any route or critic in any
> orientation satisfies all three of stability, a closed dependency DAG at its
> exact auxiliary scope, and materiality against a named central obstruction.
> Three statements (B1, B2 as core-incidence-stated, B10) have a stable statement
> and a closed DAG at literal scope and **all three fail materiality**, each for
> a different and independently sufficient reason — family-only scope, stratum-only
> scope with a provably out-of-reach next case, and repackaging of an existing
> award. Two further statements (A1, B3) fail on an **unclosed DAG as written**
> and would remain supporting results if repaired. A4 and B16 are an equivalent
> restatement and a repackaged identity respectively. No `(RC)` claim qualifies;
> `C4-LA2` and `C4-LA3` are not reopened; `C5-LA1` is not re-awarded. All three
> adjudicators reach the same conclusion from read-isolated portfolios.
>
> **Excluded conclusions, stated in full so no Stage 7 or downstream text may
> assert or inherit them:** `(RC)` in any form; the unqualified `(RC)`
> equivalence; any sign or nonpositivity claim about `S` beyond the exact scopes
> recorded above; the reduced lower guard; universal qualifying deletion; any
> `Γ`/Hall reformulation, injectivity, matching or payment claim; strictness on
> any stratum; general in-band `T_m` domination; the width law as a proved law;
> condition-(A) cores of core order ≥ 4; literal-to-governed transport; governed
> `E993-BETA-AGG`; Erdős #993. `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT` and
> `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` remain REFUTED and are neither
> reopened nor renamed.
>
> **Named for the record, not awarded, in priority order should the run ever
> resume:** (1) the `K2`/exceptional-`P3` non-strict stratum sign (B2), stated
> through the core-incidence characterization, after an independent mathematical
> re-proof; (2) the `T_m` top-rank closed form (B1); (3) the whole-class
> three-family expansion (B3), after the A1/B3 hypothesis restatement.

## Progress and stop-gate ruling

The armed stop gate is applied over the **Cycles 5–6 comparison window**. A
plateau requires **evidence of no material progress across the window**; the
absence of a headline proof is expressly insufficient. A verified proof, an
authenticated positive complete aggregate, or a central structural theorem
closing the named obstruction is decisive.

**No decisive event occurred.** No verified proof of `AGG_literal`; no positive
complete aggregate satisfying every guard anywhere in nine routes, eighteen
critiques and three adjudications; no central structural theorem closing the
named obstruction. Every positive object found is a positive summand inside a
negative aggregate, a zero-valued summand, or a row outside the live window.

**Material progress across the window is established, by change to the proof
state rather than by additional nulls.** All three adjudicators returned
`material_progress: yes` and `orientation_plateau: no`; I do not take that as a
vote. Weighing the reasoning and the replays, the following are real, are
established by replay on instruments independent of the returns, and did not
exist at the Cycle 5 close — which itself recorded, in its own words, that "no
new universal theorem, no new exact identity, and no new conditional reduction
toward the headline sign was established by any orientation this cycle":

1. **Four new exact universal theorems at literal ordinary-tree scope** where
   Cycle 5 produced none: A1 (a nonempty universal subclass of the residual class
   given an unconditional every-order closed form and a sharp bound), A4 (the
   Cycle 5 *empirical* observation that the reducer fails through the upper guard
   converted into an exact structural explanation for its leaf-deleting half),
   B2 (a **stratum of the load-bearing obligation closed exactly**, with the
   route's own named obstruction shown to be weaker than believed), and B1 (an
   exact universal family theorem at the top rank, on the run's own hardest
   literal witnesses).
2. **Two new exact identities that relocate the obligation.** B3 moves the
   residual obligation from "find an identity for the `D`-dependence" to "sign a
   known three-family sum whose family-(I) weights flip" — with that flipping
   regime shown to be **common rather than exceptional** (1,420 trees, first at
   order 9). B6 converts the `T_m` domination question into an exact monotonicity
   question about one explicit polynomial, and B7/B8 localize it to **three named
   lemmas** about one fixed polynomial plus an explicit width law with an
   identified mechanism. A future attacker inherits concrete statements, not a
   diffuse obligation.
3. **Two concretely live reductions surfaced where Cycle 5 had none** (B4, B5),
   one of them provably passing the upper guard on the **entire** class, with the
   exact reason it is not yet a reducer named.
4. **The geography of what remains was mapped exactly.** B13 shows core order 3
   is empty and core order 4 is a single shape, so the frontier is a **named
   object** (the decorated `P4`) rather than an unbounded family, and the reason
   the current proof cannot cross it is identified precisely. A3 and B21 give the
   residual class an exact census to order 17 with the honest trend.
5. **New exhaustive coverage the record did not carry**: orders 15 and 16
   complete (A5, 71,075 rows, verified by set equality of isomorphism classes
   against an independently implemented enumerator), plus B17's qualitatively new
   structural datum — `g_v ≤ 0` is **tight, not strict**, with equality attained
   on 10.3% of census rows and 28.8% of designed-family rows, stably from order 8
   upward. That constrains any future proof attempt.
6. **Two debts discharged and one phantom retired.** The orders-10–14 and
   orders-4–17 censuses were graded infeasible/unverifiable and are reproduced in
   6.8 s and 50 s (B21); the Cycle 5 "six undefined sources" item is retired as an
   artifact (A14).
7. **Two record corrections with real consequence** (A12, and the index
   disambiguation at divergence (a)), the first of which roughly **doubles the
   stated open region** for the `T_m` band and was carried into the statement of
   what remains to be proved.
8. **The Cycle 5 award was independently re-verified end to end** (A13), a
   hypothesis question the record left ambiguous was settled in the kernel (B10),
   and the award's non-vacuity was established for the first time (B12).

**The honest debits, recorded plainly.** `(RC)` is **exactly as unproved as
Cycle 4 left it**. The reduced lower guard, universal qualifying deletion, and
transport are untouched. The proved subclass of the residual class is **290 of
16,424 = 1.77%** and its share **declines monotonically** to 1.09% at order 17 —
so the unproved part is ~98% of the class and rising, and the class itself is a
**bulk phenomenon** (~18.9% of all order-17 trees), not a corner case. Strictness
on the named strata is still bounded computation. Condition-(A) cores of order
≥ 4 are unproved and now demonstrably out of the current proof's reach. T22 and
T60 — the two mandatory controls — are non-terminal and lie entirely **outside
every stratum orientation U closed**. Two of orientation T's three routes had
their central claims narrowed or rejected at route level and the third delivered
registered prior art. The weight of the new mathematics is **critic-attributed**
(B1, B2, B3, B6 are all Stage 4 products), which says something about where this
run's productive capacity sat in its terminal cycle — though critic work is run
work. And the portfolio generated a large volume of certification failure: **36
struck or narrowed literals in orientation F alone**, and comparable lists in T
and U.

**Two sub-strategies are exhausted, and the record must say so without
mistaking them for the whole.** First, **the bounded-null-census sub-strategy over
the near-`α` window has plateaued**: Cycle 5 warned against a fourth bounded null
census, Cycle 6 ran three more plus seven critic extension sweeps, every one was
null, the *fresh* adversarial construction attempted was provably trapped in the
star family with a two-line closed form and a sign already in the sealed record,
and the near-miss trend **recedes** with order (−15 at order 10, monotonically
away through −36 at order 16). Marginal return on further such censuses is nil.
Second, **the injection route to `(RC)` was certified unachievable as posed in
Cycle 5** and nothing this cycle disturbs that. Against both, a **named region
with a known instance of the hunted phenomenon has never been searched by any F
route**: the only positive individual mechanism values anywhere in the sealed
record sit at the **bottom** of the interior window (T22 at `p = 34` in `[34,67]`,
T60 at `p = 90` in `[89,181]`), each cancelled by 66 and 180 negative summands —
cancellation as the actual structure of both flagship controls — and the ungated
per-support mechanism census (supports with `g_s > 0` but `d_s(p) ≥ 0`) has never
been computed anywhere.

**Ruling.** The window contains, in its Cycle 6 half alone, four new exact
universal theorems at the load-bearing scope, two exact identities that relocate
the obligation, an exact localization to three named lemmas, an exact census
fixing the frontier, two discharged debts and two record corrections — every one
established by replay on instruments independent of the returns, and several
corroborated across read-isolated orientations. The Cycle 5 half of the window
was itself ruled non-plateaued on evidence that nothing this cycle withdraws. The
plateau condition — evidence that the surviving routes made *no* material
progress — is **not met**, and I decline to rule a plateau. I record the two
sub-strategy exhaustions explicitly so the terminal close is not misled in the
other direction, and I record with equal plainness that **the headline did not
move, and on this cycle's evidence there is no route from the progress above to
the headline obligation** — every path from stratum or family to the quantified
statement is blocked by an identified mechanism.

material_progress: yes

plateau: no

## Terminal debt register

Every obligation that remains unproved at the end of this, the last authorized
cycle. One exact statement per item, with its **evidence grade** (what is
actually shipped today) and its **earliest honest resume point** (the first thing
a future attacker could do without redoing settled work). These are debts for the
record, **not allocations**: Cycle 6 is terminal. The register consolidates the
three adjudicators' debt lists, the pre-named permanent debt, the critics'
record corrections, and the controller's process debt. **35 items.**

### A. Permanent debt (pre-named by the record; not resumable inside this run)

**TD-1 — The frozen guarded PSC *move relation*.** No source-authoritative
definition of the relation whose absence of a legal move defines terminality
exists anywhere in scope; only Source A's **core-incidence characterization** is
licensed, and no proof of equivalence exists. Every result about PSC-terminal
strata in this run is therefore a result about the core-incidence condition.
*Grade:* **absence, formally recorded** (routes named it rather than proxying it,
which is exactly what the capsule asked for). *Earliest honest resume:* not a
mathematical step but an **authority step** — someone with standing over the r23
source supplies the relation, or the run permanently adopts the core-incidence
condition **under a new name** (the r23 rule forbids calling a changed relation
the frozen PSC relation).

**TD-2 — A canonical literal-tree representation with orders 1 and 2 stated
separately.** No source authority exists; Cycle 5's proposed convention was ruled
without authority and is excluded. *Grade:* **absence, formally recorded**;
conclusion (both orders vacuous) verified under both readings, with the order-1
core correctly the singleton `{v}`, not `∅`. `F-C6-02` never stated the two orders
at all — a stated capsule requirement left undischarged. *Earliest honest
resume:* as TD-1, an authority step; the terminal statement itself is one line.

**TD-3 — `(RC)` in eligibility-qualified form.** Prove or refute
`Σ_{B∈I_{α−1}(T)}(|B∩L| − Σ_{s∈B}λ(s)) ≥ ℓ·i_α(T)` for every tree with
`α(T) ≥ x(T)+3` in which every leaf lies in every maximum independent set.
*Grade:* **open.** `(RI)` converts the top-rank sign question into exactly this
and no further; `(RI)` is formally verified (`C5-LA1`); `(RC)` has no proof and no
counterexample; the **unqualified** form is FALSE at `K_{1,2}`. It is
**target-equivalent** — proving it is proving the headline's top-rank case — and
no non-target-equivalent route to it exists (Cycle 5 certification, undisturbed).
It must never be asserted in a Stage 7 contract. *Earliest honest resume:* TD-5.

**TD-4 — Literal-to-governed transport.** An explicit theorem showing the data
and every summand used by `AGG_literal` are preserved by the governed encoding.
*Grade:* **open; `not_established`; no content in Cycles 5 or 6, and the run has
never had one.** Nonexistence of a decoder is likewise unproved; aggregate
equality alone does not recover typed support data. *Earliest honest resume:*
only after the literal theorem closes; any later transport must be authenticated,
directionally adequate and summand-preserving.

### B. The load-bearing interior-window obligation

**TD-5 — `AGG_literal`, the universal literal statement.** Prove `S(T,p) ≤ 0`
for every eligible literal row `x(T)+2 ≤ p < α(T)`, or exhibit a fully guarded
exact positive complete aggregate with the complete tree, exact eligibility
proof, every favorable original leaf, every summand, and a positive total.
*Grade:* **open; not dischargeable by anything in this run's portfolios —
bounded computation is the ceiling and finite search never discharges it.*
*Earliest honest resume:* a structural argument in one of
`SEMANTIC-CONTRACT.md`'s admissible proof forms; not more enumeration.

**TD-6 — `(RC)` on the eligible top-rank residual class with `D ≠ ∅`.**
Sharpest available form (B3): under `(★)` with `α = ℓ + α_D` and
`M = i_{α_D}(T[D])`, prove
`ℓM ≤ Σ_{(I)}(ℓ−|A_S|)(ℓ−1−2|A_S|) + Σ_{(II)}(ℓ−2−2|A_S|) + Σ_{(III)}(ℓ−2|A_S|)`
over independent `A = A_S ⊎ A_D ⊆ C = S* ⊎ D` in the three families.
*Grade:* **open; bounded negative evidence only** — 0 counterexamples in 16,134
exhaustively enumerated members (orders 4–17, three instruments), 35 constructed
members (orders 7–71), 532 random members (orders 18–45), 2,770 members from four
fresh adversarial families, and a family with `M = 2^m ≤ 256` in which the margin
**widens** rather than closes. *Residue:* **98.23% of the certified class and
rising.* *Earliest honest resume:* B3, which is exact and verified but **not
term-wise signed** — family (I)'s weight `ℓ−1−2|A_S|` flips once
`|A_S| > (ℓ−1)/2`, realized by 1,420 residual trees of orders 7–16, first at
order 9. Any proof must bound the multiplicity-1 support count against `ℓ` inside
the class, or pair family-(I) terms against `ℓM` and family (III) rather than sign
them individually. **Do not resume from Lemma B; it evaluates `M` and nothing
else.** A second parametric family inside the residual class — the `T_m` family
being now **excluded** as a counterexample source at the top rank by B1 — is the
next honest object.

**TD-7 — The reduced lower guard and the sign of `D_d`, in general.** F1's exact
remaining obligation, unchanged: prove that every putative minimum-order positive
literal row `(T,p)` has a leaf `d` with `x(T−d)+2 ≤ p < α(T−d)` and
`S(T,p) ≤ S(T−d,p)`, with `F(T−d,p)`, all supports and all summands recomputed in
`T−d`; or produce an exact positive eligible row of minimum order where every leaf
fails a reduced guard or has `D_d > 0`. *Grade:* **entirely unaddressed this
cycle**; `T-C6-02` declined both on the ground that the upper guard already kills
its two candidates — sound for those candidates, and the reason its `refuted`
label is narrowed. *Earliest honest resume:* only together with TD-8 or TD-9; at
fixed rank on the residual class the question is vacuous, because no leaf-deleting
reduction gets past the upper guard at all (A4).

**TD-8 — Support-only deletion: the missing summand correspondence.** On the
eligible top-rank residual class `α(T−s) = α(T)` for every support `s` (B4,
proved) and `|V|` decreases, so the reduced upper guard and the well-founded
measure are both satisfied. Missing: (i) the reduced lower guard `x(T−s)+2 ≤ p`
in general, and (ii) — the real obstruction — **any relation between `S(T,p)` and
`S(T−s,p)`** once the `q_s` leaves at `s` become isolated vertices of degree 0 in
`T−s` and leave the original-leaf set entirely. *Grade:* **open; the guard half
proved universally** (953/953 support-rows over 312 residual trees, 23/23 supports
of T22, 61/61 of T60, 57/57 census support-rows); the correspondence half has **no
canonical relation anywhere in the sealed evidence and none may be guessed**.
*Earliest honest resume:* **blocked** on a canonical definition in source
authority.

**TD-9 — Rank-shifted reductions.** Whether `(RL+)` can be discharged on the
residual class by an induction on `|V(T)|` that does not preserve the rank — in
particular via `(T−v, p−1)`, for which the reduced upper guard `p−1 < α(T−v) = p`
**holds**. Open parts: the reduced lower guard and the sign of `D_d` on the
shifted row. *Grade:* **open, untested by the route**; shifted-row eligibility
confirmed for 67/67 leaves of T22, 181/181 of T60, 11/11 of `T(3,4,4)`, and for
278 of 312 eligible residual trees of orders 7–12. *Earliest honest resume:*
**immediately** — the guard is already verified and the two missing quantities are
computable on the same instrument that produced the 265-row table. Note `(RL+)`'s
minimality is over `|V(T)|` across all positive eligible rows, not over rows at a
fixed rank, so a rank-shifted induction is legitimate.

**TD-10 — Contraction of an edge not incident to the distinguished leaf.**
Whether such a contraction can be built into a valid reduction. *Grade:*
**neither proved nor refuted; blocked on a missing canonical definition** — no
source-authoritative relation between such a contraction and `S(T,p)` (a sum
indexed by *original* leaves) exists in the sealed evidence. *Earliest honest
resume:* blocked, as TD-8. The route's refusal to guess one is correct and is
credited.

**TD-11 — Condition-(A) decorated cores of core order ≥ 4.** No proof, partial or
general. *Grade:* **bounded computation only, at large scale** — order 4 is the
single decorated `P4` (exhaustively stress-tested, 210 distinct shapes, zero
violations), orders 5, 6, 7 have 1, 2, 3 core shapes, all exhaustively swept
(~1.13M further rows, zero violations), plus 9,627 trees / 32,776 rows of critic
extension in the F portfolio (spiders, asymmetric endpoints, `k = 7,8`, a
branching caterpillar), all null — **together with the explicit finding that the
`K2`/`P3exc` proof cannot reach it**. Unscanned: non-path cores above order 7,
spiders with longer legs, mixed caterpillars, arbitrary condition-(A) shapes.
*Earliest honest resume:* a **product-form argument** over
`∏_u P_{s,u}` / `∏_u Q_{s,u}`, attacked first at the decorated `P4` — a
well-posed, small, concrete problem.

**TD-12 — Strictness on the `K2` and exceptional-`P3` strata.** B2 gives
`S(T,p) ≤ 0`, not `< 0`. Strict negativity needs a support with `d_s(p) < 0`
**and** `g_s(p) < 0`. *Grade:* **bounded computation, critic-attributed** (to
`q ≤ 160` and all trees to order 16; ~4.9M rows; adjudicator-replayed to
`q ≤ 40`). *Earliest honest resume:* the zero locus is already characterized on
`K2` (exactly `q_s = 1`, with the biconditional verified to `q ≤ 120`); prove the
biconditional's converse and the absence of a zero locus on exceptional `P3`, and
strictness follows from B2 on both families. **This is the closest-to-closing item
in the register.**

**TD-13 — The interior window away from the named strata.** `AGG_literal` is open
on every tree that is not PSC-terminal with core order ≤ 2 or clause-(B)
exceptional. T22 and T60 are **non-terminal** and lie entirely outside every
stratum closed this cycle. *Grade:* **open.** *Earliest honest resume:* TD-11
first; the non-terminal case is not reachable from anything in these portfolios.

**TD-14 — The lower interior window is unsearched by every F route, and the
ungated per-support mechanism census has never been computed.** Positive
individual mechanism values are known to exist there — T22 at `p = 34` in
`[34,67]`, T60 at `p = 90` in `[89,181]`, each cancelled by 66 and 180 negative
summands. Every region the F routes searched (`p = α−1` and the rank below, plus
full windows only at orders ≤ 17) is a region where this demonstrably does not
occur, and aggregates shrink in magnitude toward `α−1`, making the top of the
window the *least* promising locus for the cancellation structure the falsifier
was built to expose. A support with `g_s > 0` and `d_s(p) ≥ 0` is never computed
or recorded anywhere in the run. *Grade:* **named region with a known instance of
the hunted phenomenon; zero coverage.* *Earliest honest resume:* **immediately —
the single most valuable unexecuted task in the record**, and it must search the
lower interior window in trees with several distinct-sign supports.

**TD-15 — Orders ≥ 17 unscanned at full graph level** (every eligible row's exact
aggregate, not merely residual-class membership). Order 17's eligible-residual
count is known (9,177, inside the 16,424 census); its full window is not.
*Grade:* **genuine coverage gap; feasible, not infeasible** — the infeasibility
grade for this class of task is struck (B21). *Earliest honest resume:*
immediately, by canonical augmentation.

**TD-16 — The `t_family` tail is sampled, not exhaustive.**
`m ∈ {1..120, 150, 180, 220, 260, 300}` at the top two ranks plus `m = 400` at the
top rank; `m = 500` was started and abandoned; `m = 750, 1000` never started; the
gaps `121..149, 151..179, 181..219, 221..259, 261..299, 301..399` were never
evaluated. *Grade:* **incomplete; "`m ≤ 400` exact" struck and replaced by
"sampled".* *Earliest honest resume:* immediately and cheaply, using the closed
form `I(T_m;z) = (1+2z)(1+4z+3z²+z³)^m + z(1+z)^{3m+1}` rather than the frozen
evaluator's leaf-deletion DP.

**TD-17 — A payment (injective, selector-faithful, sign-independent assignment)
for `Gamma_actual`.** An injective assignment covering all of
`P = ⊔_{v∈F}{v} × C_p(v)` into `N` on an arbitrary eligible row, incorporating the
tie-break-removable collisions Cycle 5 identified. *Grade:* **open, and the
premise must be corrected at the close** — the surviving obstruction is
**collision, not definedness**, and it is not confined to singleton-witness
sources; the class chartered to be paid is **empty** (B23); the proposed rule is
non-injective on its own chartered row (6 sources → 5 images) and non-canonical;
and the Cycle 5 open ledger's qualifier **selector-faithful** was dropped without
comment and never addressed. *Earliest honest resume:* **blocked twice over** —
by the absence of any definition of the refuted one-witness payment family (TD-18)
and by the registered **inertness of left-totality toward Hall**, demonstrated
exactly at `T22, p = 34` where left-totality holds and Hall fails by a deficit of
`14226520737620288370`.

**TD-18 — A definition of the refuted one-witness payment family.** Without it no
route can certify itself "outside" that class, and `T-C6-03`'s classification to
that effect is unbacked and struck. *Grade:* **absence; the same defect as TD-1.*
*Earliest honest resume:* an authority step.

### C. Statement repair, and the `T_m` domination obligation

**TD-19 — Hypothesis and DAG repair before any packaging of A1 or B3.** Restate
the flat sign law with `IsTree` and `2 ≤ α(T)` explicitly declared as consumed via
`C5-LA1`, with the leaf-saturation predicate `D = ∅` separated from `(★)` and from
eligibility (as written, "flat" presupposes `(★)` and the strictness lemma
degenerates), and with the corollary at the sharp `ℓ ≥ 5`, `S ≤ −16`; B3 inherits
the same two hypotheses through `(RI)` and needs the same statement. *Grade:*
**repairable by restatement; no mathematics at risk.* *Earliest honest resume:*
immediately; it is a precondition for either statement being nameable at all.

**TD-20 — The general in-band `T_m` domination theorem.** Exactly:
`w_{q+1} < w_q` for `x_m ≤ q < ⌊3m/2⌋`, with
`W(x) = (3m+1)(1+x)^{3m} + 3m(x+2)(2x+1)·branch(x)^{m−1}`. *Grade:* **bounded
computation** — 4,137 band rows to `m = 400` (including the disclosed 418-row
overrun past `m = 380`), 11,220 full-eligibility rows to `m = 120`, bounded edge
probes to `m = 1600`, all zero-violation, independently reproduced three times;
the **reduction** (B6) is exact. *Earliest honest resume:* the three lemmas below;
the sufficient chain closing the theorem modulo them is verified at 590 rows with
super-exponentially growing margins.

**TD-21 — (P1) `x_m ≥ mode(branch(x)^{m−1}) + 2`**, equivalently the closed form
`x_m = ⌊13m/9⌋ + 1` for `m ≥ 30`. *Grade:* **bounded computation**, verified to
`m = 600` with exceptions only at `m ∈ {2,4,6,11,13,20,29}`, and **tight**
(equality at `m = 22, 40, 60, 100, 200`; the band bottom sits exactly at the mode
of `branch^{m−1}`, one index from failure). *Earliest honest resume:* a
mode-location argument for `branch(x)^{m−1}` against the first strict descent of
`(1+2x)branch^m + x(1+x)^{3m+1}`; the mechanism (`13/9` = the mean of the weight
vector `(1,4,3,1)/9`) is identified.

**TD-22 — (P2) a uniform gap `1 − b_{q−1}/b_{q−2} ≥ c/m` across the band, and
(P3) a nonasymptotic lower bound on `[x^k]branch(x)^{m−1}` at `k ≈ 3m/2` with
rate `> 8` and explicit `m₀`.** *Grade:* (P2) **open** — its `Θ(1/m)` decay is
exactly cancelled by the `3m` prefactor, which is why domination survives at all;
`branch` is log-concave but **not real-rooted**, so Newton/Pólya–Schur machinery
is unavailable. (P3) **partial** — the single-term bound
`max_j C(m−1,j)C(3(m−1−j), k−j)` is rigorous and reaches `8.981` asymptotically
but measures `8.020` at `m = 60` and `8.787` at `m = 400`, so it does not separate
from 8 below `m ≈ 60`. *Earliest honest resume:* a local-limit or saddle-point
estimate for (P2); a multi-term or entropy bound plus explicit finite verification
below `m₀` for (P3).

**TD-23 — The out-of-band eligible range `⌊3m/2⌋ ≤ q < 3m`, plus both-orbit
favorability and `g_star < 0` inside the band for all `m`, plus the width law's
parity structure, plus `Δ_N(−1) = −1`.** (i) The band is only **~2–3% of the
eligible range** (1 of 34 eligible ranks at `m = 22`; 5 of 155 at `m = 100`), so
**even a complete in-band proof leaves ~97% open for this one family**; the
out-of-band range is null on critic and adjudicator evidence (11,220 rows to
`m = 120`) but was unexamined and unnamed by the route. (ii) In-band favorability
and `g_star < 0` are bounded computation to `m ≤ 400`, zero exceptions.
(iii) The width is neither monotone nor parity-uniform and the "≈ 0.055·m" reading
is an even-`m` asymptotic (at `m = 31` the true ratio is 0.0323); any future
statement must carry odd-`m` checkpoints. (iv) **`Δ_N(−1) = −1` is undischarged**:
the route substituted the zero-extension convention, under which
`Δ_{−1}(G) = i_0 − i_{−1} = +1` for every graph, so the literal is not the
statement verified. *Grade:* (i)–(iii) **bounded computation / exact but
unrecorded**; (iv) **undischarged** (the convention actually used is harmless and
no row's sign depends on it). *Earliest honest resume:* (i) is the same open
question as TD-20 restated on ~97% of the range — **any future statement of "`T_m`
domination" must name which range it covers**; (ii) follows from the same
coefficient estimates as TD-22; (iii) follows from TD-21 once proved; (iv) the
controller supplies the definition of `Δ_N` under which the literal holds, or the
record states its absence — which is what the route was required to do and did
not.

### D. `C5-LA1` and the Lean record

**TD-24 — `hTree` and `hEligible` are removable; kernel-demonstrated,
ungoverned.** The identity holds for every finite simple graph with decidable
adjacency under `hAlpha ∧ hResidual`, on the three permitted axioms, with the
shipped award an immediate corollary. *Grade:* **kernel-checked scratch** — not a
governed award (no theorem contract, registered fragment ledger,
kernel-verification receipt, informal audit, fidelity review, or run identity).
*Earliest honest resume:* a Stage 7 formalization cycle promoting the reduced
statement **if and only if** the run resumes and materiality is re-argued, which
this synthesis rules it currently lacks.

**TD-25 — `hAlpha` is redundant given `hEligible`, and the award is silent at
`α = 2`,** including at `K_{1,2}` — residual, at top rank, `S = +2 > 0`, the very
instance that refutes unqualified `(RC)`. *Grade:* **exact; unrecorded by the
route.* *Earliest honest resume:* a wording correction at the terminal close; no
mathematics needed.

**TD-26 — `THEOREM-CONTRACT.yaml` wording hazard.** Line 12 asserts all four
hypotheses are "load-bearing in the terminal declaration" while line 15 and
`hyp-eligible`'s own canonical string record that it is "not used by the proof".
Reconcilable as "mandatory in the declaration"; irreconcilable as "used by the
proof". *Grade:* **exact (a contradiction in the record's own wording).*
*Earliest honest resume:* a contract-text correction at the terminal close.

**TD-27 — `C4-LA2` and `C4-LA3` remain `blocked`.** The bridges built this cycle
do not supply what the block reviews named, and neither award is closer to
reopenable. *Grade:* **exact (ruled above).* *Earliest honest resume:* TD-1
first, then TD-11.

**TD-28 — Citation-path repair for two `(RI)` gradings.** `T-C6-01`'s "formally
verified identity `C5-LA1`" and `T-C6-02`'s "already Lean-verified" `α(H_v) = p`
are correct citations to `cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md` (a Stage 2
member) with the path missing, **not false certifications** (memo item 5).
*Grade:* **bookkeeping.* *Earliest honest resume:* immediately.

### E. Record corrections established by the critics (carried verbatim)

**TD-29 — Record correction RC-1: the `T_m` band statement.** Cycle 5 synthesis
result 13 and its forward-obligation restatement ("empty for every `m ≤ 21` and every odd `m`
checked"; "non-empty only for even `m ≥ 22`") are **STRUCK** and replaced by the
following, carried verbatim from `C-F3-U` and consistent with controller memo
item 8:

```text
The T_m homogeneous lower band x_m <= q < floor(3m/2) is empty exactly for
m <= 21 and for odd m <= 29; it is first non-empty at m = 22.  Over
22 <= m <= 64 its width is 1 at m in {22,24,26,28,30,31,32,33,34,35,36,37,
39,41,43,45}, 2 at m = 38 and at m in {40,42,44,46,...,55,57,59,61,63}, and
3 at m in {56,58,60,62,64}.  In particular the widths at m = 40 and m = 60
are 2 and 3 as previously stated, but the claim that the width is 1
throughout m = 22..39 is FALSE at m = 38, and the claim that the band is
empty at every odd m FAILS from m = 31 onward.
```

Equivalently, in the controller memo's form: **the band is empty exactly for
`m ≤ 21` and `m ∈ {23,25,27,29}` and non-empty for every `m ≥ 30` of either
parity; width 2 at `m = 38`.** *Grade:* **exact, reproduced by three independent
instruments across two read-isolated orientations** (a closed form to `m = 64`
with spot points at 110, 240, 1600; a hand-derived closed form to `m = 400`; and a
closed form validated against an explicit tree DP for `m = 0..6` then run to
`m = 400`), with non-emptiness for every `m ≥ 30` of either parity verified to
`m = 400`. **The consequence is not cosmetic: the superseded sentence appears in
the statement of what remains to be proved, and a terminal close carrying it
understates the open region by roughly half.** The sealed in-band row-count sums
**948** (`m ≤ 199`), **1417** (`m ≤ 240`) and **3719** (`m ≤ 380`) reproduce
exactly under the corrected band, confirming the Cycle 5 **scans** were right and
only the prose summary was wrong. Also struck: the row-5b certification headed
"width at **every** `m` in `22..41`", which lists twelve of twenty values and
drops exactly the eight (`23,25,27,29,31,33,35,37`) that expose the parity error.

**TD-30 — Corrected census figures.** Each must replace its predecessor wherever
cited; none of the struck values may propagate into any downstream text.

| # | Struck literal | Route | Correct value |
|---|---|---|---|
| RC-2 | "16,424 of **84,875** trees of order 4–17" | `T-C6-01` | **81,134** trees (= `Σ A000055(4..17)`, and what the return's own table, its own distinct-row section and its own scan artifact all say); 16,424 eligible residual; 290 flat |
| RC-3 | flat corollary "`S ≤ −3` with `ℓ ≥ 3`" | `T-C6-01` | **`S ≤ −16` with `ℓ ≥ 5`**, attained uniquely at `DS(2,3)`; the `ℓ = 3`/`ℓ = 4` boundary discussion is vacuous |
| RC-4 | "**13** distinct `(m,p)` rows" | `T-C6-03` | **19** (`t_family(1..5)` → 1+2+4+5+7), in the body and in the consolidated ledger |
| RC-5 | "**19,800 distinct** labeled instances after dedup by `(n, edge set)`" | `U-C6-01` | **19,792** distinct (7 keys carrying 8 repeated rows); the exhaustive census alone is 19,776; exactly **102** eligible rows and exactly **4** rows satisfying all four hypotheses (`K_{1,6..9}`, `LHS = RHS = −24,−35,−48,−63`); **0** in-scope rows in the `n ≤ 6` census |
| RC-6 | "Total distinct support-level rows verified across this route: **69,724**" | `U-C6-02` | Struck; the displayed addends sum to **129,330**. The object count is **64,257** distinct eligible-window support-level rows **up to tree isomorphism** (30,670 + 31,544 + 2,043 over 820 + 820 + 210 distinct objects); the generator-level count is **125,280** ordered-pair rows (59,858 + 61,528 + 3,894). **Both critic figures are correct at their own quotient and neither supersedes the other**; the disagreement is nominal, not substantive. Both correctly exclude the 4,050 formula-versus-evaluator comparisons (agreement counts over a parameter range already inside the sweeps, mostly at ineligible ranks). **The terminal record carries 64,257 as the object count and 125,280 as the generator-level count, each with its quotient named**; zero-row counts follow the same quotient (342 distinct `K2` zero rows, not 684; 43 distinct condition-(A) zero rows, not 84). **Reporting either figure without naming its quotient is what produced the original error.** |
| RC-7 | "Total distinct eligible rows evaluated by this route: **126,649**", under a heading asserting these are distinct-row counts and not evaluation counts | `F-C6-01` | **126,649 row *evaluations* over 93,753–93,755 distinct (isomorphism class, rank) rows** — an overcount of ≈26.0%. **Carry the interval, not a point value**: the two canonicalizers were independently written, agree to 2 rows in ~93,754 (0.002%), agree **exactly** on the 71,075-row census component, and differ only in cross-source overlap bookkeeping in the deduplicated tail (one merged all six designed families, the other five plus `t_family` held apart). The ±2 is unresolved and confined to that accounting. |
| RC-8 | "Distinct trees: **1,008**" (condition-(A)); "Distinct trees scanned: **1,350**"; "Distinct `(T,p)` rows: **5,858**" | `F-C6-02` | The condition-(A) family is counted **labeled**: 1,008 tuples name **558 isomorphism classes** (450 duplicates; verified analytically as `3·(4²+4)/2 + 3·(4³+4²)/2 + 3·(4⁴+4²)/2`). Corrected totals **900 distinct trees / 4,435 distinct rows**. Rewrite as "1,008 labeled parameter tuples (558 isomorphism classes)". |
| RC-9 | "min a **61-digit** negative integer" (T60 window minimum) | `F-C6-01` | **58 digits**: `−1876033682824641480391410332802785469699082479841155258000` |

Conventions the terminal record must state alongside these: **5446 counts orders
2–14; orders 1–14 is 5447**; and **16,424 is over non-isomorphic trees while
8,345 is over labelled trees** — different universes, never a common series
(over non-isomorphic trees the orders-4–8 subtotal is 9). And the `C5-LA1`
fragment tallies are **not** a contradiction (memo item 6): the synthesis's "six
reused + seven new definition nodes" counts **pre-formalization DAG nodes** while
the closeout's "8 reused F7 fragments + 10 new definitions" counts **registered
Lean fragments** — the 8 reused F7 fragments being 4 definitions + 3 lemmas + 1
theorem, and the contract carrying 6 reused + 8 new definition nodes including the
controller-ruled `def-crossing-index`. **The terminal record states both tallies
with their referents.**

**TD-31 — Struck literals and mis-certifications that must not propagate.**
Beyond TD-29 and TD-30, the following are struck or narrowed at adjudication and
may appear in no synthesis, contract, terminal manifest or downstream citation:
"no positive summand … was found anywhere" (contradicted by the run's own sealed
fixtures; correct restricted form: no row in that route's own 71,075 census rows
or 55,486 family rows carries a positive summand, the maximum individual summand
there being exactly 0); "Controls (mandatory) … reproduced exactly" (T22 exact,
T60's contracted row `p = 90` **not performed**); "the single most exposed,
cancellation-free configuration this route could construct" (the star family, by
construction); "`m ≤ 400` is the exact verified range" (sampled); "runs at
`m = 500, 750, 1000` were started" (only `m = 500`); "checked bit-for-bit … 142
trees" (a counter artifact; ≈18,384); "`all_selector_predicates_agree: true` …
zero disagreements" (a tautology, additionally one-sided as implemented);
"mechanism value **and** complete aggregate computed on every row" (`g_s` computed
only for supports already gated by `d_s(p) < 0`); "termwise positivity of
individual summands was observed on scattered rows" (**0 of 21,067** favorable
supports have `g_s > 0`; maximum exactly 0 on 367); "`[1,1,0,1,1]`" (the artifact
records `[0,1,0,1,0]`); "`capsule_identity_holds` … a correctness check on the
evaluator/capsule correspondence itself" (an algebraic regrouping that cannot
fail); "Families scanned, exactly as specified" / "condition-(A) decorated cores
**in general**" (path-shaped cores only, three lengths, **endpoints forced
equal**, on a false generator rationale — an asymmetric pair is not a symmetric
copy, so a sub-family was **excluded, not deduplicated**); "re-verified against
`run_controls.py`'s expected values" (constants hardcoded inline; correct but the
procedure claim overstates the artifact); the non-terminality tests using **core
degree** where the capsule's predicate is "at least two neighbours that are leaves
of `C`" with `deg_T(c) ≥ 3`; "there is no `b = 0` sub-family" as a categorical
claim; "importing only low-level primitives" and "independently re-deriving both
sides of `(RI)`" (`aggregate_row` **is** `S(T,p)`, `leaf_data` **is** `g_v`; only
the right-hand side is re-derived); the eight `F-C6-03` result-digest bindings
(**void by construction**; the three script digests are sound); "Orders 10–14 …
infeasible" and "16,424 … unverifiable in budget" (**discharged**, 6.8 s and
50 s); "the closeout's note that `hTree` is not used by the derivation" (a
misquotation; the closeout says "used only through the F7 reuse", and the shipped
proof term does consume it); "whether `hTree` and `hEligible` are removable
remains formally open" (**struck**; both removable, kernel-demonstrated);
"T22/T60 … outside this route's authorized read scope" (struck as reasoning);
"reconcile or re-seal the manifest" (**stale**: the drift record rules the Stage 2
seal is *not* re-issued); "no defect found" as a scope claim (narrowed to the
award); "All 23 listed file digests matched" (**21 of 23** at that return's
timestamp); "with equality `2q+1−3m = −1` attained exactly at the band's top
point" (**struck for every odd `m`**, where the value is −2); "the scan was not
extended" (**struck**: extended by 20 `m`-values and 418 rows, zero violations
there); "verified byte-for-byte against the two sealed literal fixtures" (no byte
comparison was performed; the construction was correctly *inferred*); a fenced
`python` block presented as the evaluator's "literal constructor" (a paraphrase
formatted as a quotation from a digest-bound source — a defect in its own right in
a run whose discipline is verbatim quotation); "reproducing Cycle 5's cited
`0.0550`" (the fourth value is `0.0553`); "57 distinct `(m,p)` rows … zero
mismatches" (true, but 28 rows are at ineligible ranks and only 6 are in-band, all
at band **tops**, so the band **bottom** — the edge the route was chartered to
probe — is evaluator-validated at exactly one `m`); "`(RI)` fails on 100% of
non-residual instances" **as evidence of necessity** (a hypothesis separator, not
sharp necessity); and `C-T3-U`'s seal-transcription finding (**false**, memo
item 2).
*Grade:* **all struck at adjudication.* *Earliest honest resume:* n/a — this item
is a propagation fence, not work.

**TD-32 — Attribution must survive into the terminal record.** The two most
valuable new theorems (B1, B2) and the two most valuable narrowings (B3, B6) are
**critic-attributed**, as is every other item in section B of `## Exact
established results` (B4–B5, B7–B25). Any terminal text reporting
them as route results would misstate where this run's productive capacity actually
was in its final cycle. *Grade:* **exact.* *Earliest honest resume:* n/a.

### F. Certification, seat and controller process debt

**TD-33 — Distinct-row accounting must be canonicalized before certification.**
Two scanning routes certified evaluation counts as distinct-row counts; a third
certified ordered parameter sweeps as distinct trees. AHU canonicalization is
cheap and was applied for orders 15/16 and for `K2`/`P3` (`r ≤ s`) and **nowhere
else** — the inconsistency being internal to single returns. *Grade:* **corrected
at critic grade; the ±2 in RC-7 unresolved.* *Earliest honest resume:*
immediately; one canonical recount over the shipped artifacts would close the ±2.
**Do not certify "distinct" again without it.**

**TD-34 — Seat process debt.** (a) `T-C6-03` wrote its inventoried evidence
**outside the run root** (a relative path resolved against the wrong base), so its
declared artifacts were absent at Stage 4 and copy-out-first replay was impossible
as shipped; all seven recovered digests match its inventory **byte-for-byte**, so
the inventory is honest and no fabrication is found, but the recovered files are
**not** Stage 3 packet members and carry **no packet standing** — the figures
stand at **critic-instrument grade**, not artifact grade. That route also did not
discharge its duty on its own controls (neither favorable count nor aggregate
reported for T22 or T60); both critics and its adjudicator supplied them.
(b) `U-C6-01`'s shipped replay commands are **unsafe** — one writes into the run
root, the other overwrites the inventoried evidence file in place; both critics and
the adjudicator replayed copy-out-first. (c) `F-C6-01`'s generators hardcode their
output directory, so a faithful replay overwrites the return's own evidence in
place, and its replay table omits the working directory and a dependency; no
evidence was lost. (d) `F-C6-02` never stated orders 1 and 2 separately though the
capsule requires it (vacuous in consequence, undischarged as a requirement).
(e) `SOLUTION-CONTRACT.md`'s convention "the empty favorable set has aggregate
zero and is reported separately" is **not observed in any F artifact** (formal;
nothing concealed — no empty-favorable row occurs at orders 15/16 and no family
row is nonnegative). (f) The strict selector boundary (`d_s(p) < 0` included,
`= 0` excluded) is **never exercised**: `d_s(p) = 0` occurs in 0 of 21,067
favorable supports and 0 of 2,687 triples, so no evidence in the run establishes
that the frozen strict-boundary convention was correctly implemented — which
requires constructing a family where `d_s(p) = 0` occurs, attempted by no route.
*Grade:* **process defects, no evidentiary fraud found anywhere.* *Earliest honest
resume:* (a)–(e) immediately and trivially; (f) is real work.

**TD-35 — Controller process debt (not chargeable to any seat).** (a) **Three
post-seal edits of sealed packet members** — `RUN-STATE.json`, `AUTHORIZATION.md`,
and `control/C6-STAGE2-RUN-STATE-DRIFT-RECORD.md`, the last committed on the very
file that forbids it and detected mid-Stage-4 by two critics; each sealed version
is reconstructed byte-exactly and preserved, and the restoration is verified here.
(b) **`sel_star`** is named as a binding requirement but exists nowhere in
`sources/` or the contracts — the clause is unsatisfiable in scope and is struck;
the residual obligation is one-directional, because the Cycle 5 return is the
**only** in-record origin of the predicate, so retiring that scan before lifting
the formula into a digest-bound capsule would convert a recoverable capsule gap
into **unrecoverable** debt (its *definitional* half is superseded and may be
retired; its *evidential* half may not). (c) **`REL_ORDER_LIMIT`** is a Cycle 5
seat's code token with no definition in any Cycle 6 read-scope file; the route that
met it reported it unmet and uncapped, which is exactly correct. (d) **Stale and
dangling paths**: `C6-CRITIC-PROTOCOL.md` duty 4 and this synthesis protocol's own
read-boundary paragraph name the non-existent `control/C6-F1-STATEMENT-CAPSULE.md`;
this protocol additionally carries Cycle 5 residue naming the Cycle 4 synthesis and
the Cycles 4–5 window where the dispatch and its own later text say Cycle 5 and
Cycles 5–6. (e) **Stage 3 sealing covers no scratch artifact for any seat**, so
return inventories carry digests that nothing preserves — the structural cause of
TD-34(a). (f) A **transitive digest gap** at `control/C5-CONTROLLER-NOTES.json`
reaching the Cycle 5 Stage 4–7 packet manifests with no preserved snapshot
(reported by a critic, outside every adjudicator's verification scope and outside
mine). (g) **Certification-audit coverage debt**: zero audit rows against the
Lean-gate closeout (~28 literals) and the Cycle 5 close (~14), of which five
closeout digests were discharged at critic grade (synthesis `1964a308…`, award
capsule seal `bf8fc6c0…`, theorem contract `750bc81b…`, Lean source `0933211d…`,
verification report `1af6188a…`) and the remainder — the other closeout digests,
fragment and check counts, the axiom list, the Lean pin and Mathlib commit, the
seven Cycle 5 stage seals, the admission tallies, the topology, and the three
Cycle 5 ruling words — remain **named certification debt, not audited**; together
with the enumerated omissions from the Cycle 5 synthesis (results 8, 9, 10, 11,
16, 17 and 20 omitted in full, every literal in its Lean-awards section, and the
headline-verdict faces carried forward unaudited — result 16 being the only place
`Δ_N(−1) = −1` is load-bearing, and exercised by no instrument in the run).
(h) **The `q` versus `p` index convention** must be stated wherever the `T_m` band
is cited (divergence (a)). *Grade:* **documented; every sealed byte-state
reconstructed and preserved; seals not re-issued.* *Earliest honest resume:* the
terminal close's controller-side process-debt list; (g) is immediate and cheap,
three of the five files already verified being Stage 2 packet members.

## Continuation ruling

Cycle 6 is closed. The stop gate found **no decisive event** and **no
evidence-backed plateau**, so it does not fire in either direction.

**Cycle 6 is the terminal cycle by Ashton's boundary of 2026-09-17.** Therefore
`continue: no` **records that boundary and nothing else**. It is **not** a plateau
ruling, it is not a finding that the mathematics is exhausted, and it must never
be read as either: my independent mathematical judgment over the Cycles 5–6
comparison window is `plateau: no`, justified on the evidence set out above, and
the two rulings are separate objects. The run stops because its authorized cycle
count ends here, with the controller's independent check and evaluation of the
whole run to follow.

**Exact earliest honest continuation obligations, carried forward unchanged in
substance and sharper in form, should the work ever resume under a new
authorization:**

1. **Prove `S(T,p) ≤ 0` for every eligible literal row `x(T)+2 ≤ p < α(T)`, or
   exhibit a fully guarded exact positive complete aggregate** (TD-5). The live
   fronts are now: the eligible top-rank residual class with `D ≠ ∅` (TD-6, ~98%
   of the class and rising, with B3 the sharpest available form and the `T_m`
   family **excluded** as a counterexample source at the top rank); condition-(A)
   decorated cores of core order ≥ 4, beginning at the single decorated `P4`
   (TD-11); the non-terminal case, where both mandatory controls live (TD-13); and
   the **lower interior window**, the one named region where the hunted
   cancellation structure is known to occur and which no route ever searched
   (TD-14).
2. **`(RC)` in eligibility-qualified form is open and target-equivalent** (TD-3).
   It may be proved only as the top-rank case of the headline itself; no
   non-target-equivalent route to it exists; it must never be asserted in a
   Stage 7 contract.
3. **The frozen guarded PSC move relation, the canonical literal-tree
   representation, and a definition of the refuted one-witness payment family
   require source authority that does not exist in scope** (TD-1, TD-2, TD-18).
   They are named as **permanent debt** at this terminal close rather than
   pursued. Every result in this run about PSC-terminal strata is a result about
   the **core-incidence characterization**, and any changed relation must receive
   a new name.
4. **Literal-to-governed transport is to be treated only after the literal
   theorem closes** (TD-4). Any later transport must be authenticated,
   directionally adequate and summand-preserving. Governed `E993-BETA-AGG` and
   Erdős #993 remain separate obligations and receive nothing from this cycle.
5. **No further bounded null census over the near-`α` window.** That sub-strategy
   is exhausted on this cycle's evidence and running it again would be a plateau
   rather than work. The closest-to-closing mathematical item in the register is
   **TD-12** (strictness on the `K2`/exceptional-`P3` strata); the highest-value
   Lean target, after an independent mathematical re-proof, is **B2**.
6. **Reporting discipline remains a first-class obligation.** Canonicalize before
   certifying distinct-row counts; ship generators, digests **without wall-clock
   fields**, and copy-out-first replay commands; write inventoried evidence inside
   the run root; run the contracted control rows, not substitutes; name the
   quotient of every census figure and the index of every band statement; and
   never strengthen a certification without strengthening its evidence.

continue: no

## Artifact inventory

**Written by this seat, and only these:**

| Path | Role |
|---|---|
| `cycles/cycle-6/stage6/SYNTHESIS.md` | this file — the sole synthesis output |
| `scratchpad/S-C6/verify_seal.py` | `a10e15f52701b4374159526067cbc6bdc3536ff2d58b0ab78d337cfa5b54a8d2` — independent canonical seal recomputation and per-member re-digest for both manifests, written from the canonical rule, importing nothing from the run's tooling |
| `scratchpad/S-C6/verify_seal.out` | `0466e1e198da8f0a1177c0b302af2e7a214b11114f87acb0ece4ce60c256958a` — captured output, verdict `CLEAN` on both manifests |

No file outside those three paths was created or modified. No source, control,
manifest, protocol, return, critique, adjudication or prior synthesis was
touched. No delegation and no child agent was used; no network access; no `lake`
invocation; no background job outstanding.

**Read — the sealed dispatch capsule and its twelve members, all digest-verified:**
`control/C6-STAGE6-DISPATCH-MANIFEST.json` (seal
`baa06f14ac20d42c6ff4e18a9c64b8ea4df0032d369f3d25ef0d4754a7969bce`, recomputed
MATCH), `control/C6-SYNTHESIS-PROTOCOL.md`,
`control/C6-STAGE5-PACKET-MANIFEST.json` (seal
`b4f8b34200390ee43950ee42720c0bb5806f0150071bf61988fd006817dac0cb`, recomputed
MATCH, 17/17 members re-digested clean), `control/C5-F1-STATEMENT-CAPSULE.md`,
`control/C6-FROZEN-DEFINITIONS-CAPSULE.md`,
`control/C6-STAGE5-CONTROLLER-MEMO.md`,
`control/C6-SEALED-MEMBER-DRIFT-RECORD-2.md`,
`control/PATH-CHECK-c6-stage6-dispatch.json`,
`cycles/cycle-6/stage5/adjudicators/T/ADJUDICATION.md`,
`cycles/cycle-6/stage5/adjudicators/F/ADJUDICATION.md`,
`cycles/cycle-6/stage5/adjudicators/U/ADJUDICATION.md`,
`cycles/cycle-5/stage6/SYNTHESIS.md`,
`cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md`.

**Read — run-root authority (authorized):** `SOLUTION-CONTRACT.md`,
`SEMANTIC-CONTRACT.md`.

**Read — VerityOS boot authorities:** the root constitution `verity.md` and
`identity/startup-protocol.md` (VerityOS root; absolute paths outside this run
root are not quoted, per the write boundary).

**Not read:** any Stage 3 return, any Stage 4 critique, any worker, critic or
adjudicator scratch, any failed or superseded lineage, any late or post-seal
artifact, any synthesis other than the sealed Cycle 5 synthesis, any Cycle 4
artifact, any Lean project or run directory, any manuscript, repository state,
conversation record or external source.

**Seal values reported (protocol duty 1):** Stage 6 dispatch
`baa06f14ac20d42c6ff4e18a9c64b8ea4df0032d369f3d25ef0d4754a7969bce`; Stage 5
packet `b4f8b34200390ee43950ee42720c0bb5806f0150071bf61988fd006817dac0cb`;
Stage 4 packet `f761599e45636297574ff3f509df9bd40180f11a9b2e5834490cdf2e211f75ce`
(three independent adjudicator recomputations agreeing, corroborated at digest
level here); orientation capsules T
`7f6e2155a63a41b9b608da5b20f4b006aab1d15ec5f3ae40f7e56112eb41b803`, F
`85f37bd01bdc1eddc864aa4d19b2de4afe9af59e576d9d4273d46de24ff6fb8f`, U
`f01c28d13aac594fa09d7f6b98e44014f0a09622d536667a93adf6b1c4ea9433` (reported on
the seats' authority, their manifests re-digested here as Stage 5 members).

Reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat
cannot self-inspect its runtime model/effort — stated on dispatch-record
authority.
