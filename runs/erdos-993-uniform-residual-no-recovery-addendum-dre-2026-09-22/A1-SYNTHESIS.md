# Cycle A1 Neutral Synthesis

Neutral Stage 6 synthesis of Cycle A1 of the r25 ADDENDUM (Erdős #993 uniform residual
no-recovery), run id `erdos-993-math-dre-20260922-r25-addendum`. Cycle A1 is the
addendum's ONLY cycle and is a seating-design cycle: by Ashton's design of 2026-09-22
routes AND critics were seated on Claude Sonnet 5 (xhigh in-prompt), with adjudicators,
this synthesis and the Stage 7 reviewers on Claude Opus 5 (high). I write no next-cycle
portfolio.

**VerityOS boot acknowledgment.** I am operating within VerityOS. Per this dispatch's
narrowed boot boundary I read **exactly two** files at the VerityOS root and nothing else
in VerityOS proper: the root constitution and the identity subsystem's startup protocol
(described by reference, never quoted, since they lie outside this run root). No
`memory/`, `knowledge/`, `conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`,
`operations/`, `projects/`, `inbox/` or `writing/` file was opened; the startup
protocol's own task-type map was deliberately not followed, by the dispatch's explicit
instruction — the controller has booted for this run. Subsystem loaded: `experiments/`
only, and within it only this run root and the paths my capsule enumerates. Nothing in
this synthesis is durable memory, an approved report, a decision record or a canonical
output; it is an experiment artifact.

**Child delegation:** forbidden and honoured. No `Agent`/Task tool was invoked at any
point in this synthesis.

**Model disclosure.**
chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Dispatch capsule inner seal, recomputed.** I recomputed the inner seal of
`control/A1-STAGE6-DISPATCH-MANIFEST.json` as SHA-256 over the canonical JSON of the
manifest with its `seal_sha256` field removed (`json.dumps(..., sort_keys=True,
separators=(",", ":"))`, UTF-8), with my own instrument
`scratchpad/S-A1/verify_seal.py`:

```
declared   : 0185b6128fbc6aecd7ed28756c87a48321cb6462dabd4bccc8ac4fd7fc908344
recomputed : 0185b6128fbc6aecd7ed28756c87a48321cb6462dabd4bccc8ac4fd7fc908344
dispatch   : 0185b6128fbc6aecd7ed28756c87a48321cb6462dabd4bccc8ac4fd7fc908344
MATCH      : True
```

**The Stage 6 dispatch capsule seal is
`0185b6128fbc6aecd7ed28756c87a48321cb6462dabd4bccc8ac4fd7fc908344`.** The manifest
declares `file_count: 28` and its `files` array has exactly 28 entries; `run_id`
`erdos-993-math-dre-20260922-r25-addendum`; `stage` `cycle-A1-stage6-dispatch`;
`schema_version` `verityos.math-dre.packet-manifest.v1`. **Every one of the 28 members
was hashed against the live file on both `sha256` and `bytes` before I read anything:
28 of 28 match, zero mismatches, zero missing.**

**Stage 5 packet manifest, recomputed by the same canonical rule.**

```
declared   : 43ab0dbdccbd2994221ea71329248ad332b6a94563cb9f36ee391a166deac102
recomputed : 43ab0dbdccbd2994221ea71329248ad332b6a94563cb9f36ee391a166deac102
dispatch   : 43ab0dbdccbd2994221ea71329248ad332b6a94563cb9f36ee391a166deac102
MATCH      : True
```

It declares `file_count: 14` with 14 entries; **14 of 14 members verified on `sha256`
and `bytes`, zero failures.**

**Stage 2 / 3 / 4 seals, on controller-facts authority and independently
re-confirmed.** The Stage 6 controller facts record carries Stage 2
`d5a7418473f8b15041f3a8c3002657eb66b9c43a4c735476e191e0246707cc06`, Stage 3
`02406d843befc2942b5b34b348ac80c310e46243f6a6b97af0f3d82aa1c141e3`, Stage 4
`1a58def9639d07ba3c2bad05ec3877acf656135a1756142236d096ee91edabf1`. **All three
adjudicators independently recomputed all three to exactly these values** (T with
`verify_seals.py`, F with `verify_capsule.py`, U with `verify_seals.py`), each also
recomputing its own orientation capsule seal — T
`cfb4be2a0ead045a3df84bc76858116a518a52ff4150309014d6f0bded6b674d`, F
`adfd55bb8ba56fa0e3ff8ee1cb47eb62c75b485872c031602f3c776722c5d28b`, U
`e0edb3f7ed57512930f7ecab1a837486ac0d436e4ac9db6eccca34d92f41f3a4` — each **18/18**
members verified before reading. With my two recomputations above this is a four-way
independent agreement on the seal chain from Stage 2 to Stage 6.

**Document identity.** The three admitted adjudications carry the digests the Stage 6
controller facts record states and my capsule verifies, byte for byte and at full 64-hex
length: T `cf84309a4fd46c727198f9e30dfd8199f4826c1099ffc0e3076e0ca2a28d4074`;
F `180fc74996d5656090a6b862dd897e5dc71610a1e2c8f69bf4da5d0121ea271e`; U
`bc01ad5b6388ff4d2b5eb5f6ec569ba867f59a5347febfa1371b2949348de598`. Each adjudication
independently confirms its own route return and both paired critiques against the Stage
3 and Stage 4 manifests and against the controller-facts `critic_verdicts` digests, with
zero drift: T1's return `715f1cb69e98feac8b024021667f4e42b437e83999e0280cfb3e8b8f0c4dbd69`,
F1's `993904f9cf4304dba0e1d6aabe1cd0b379993e2a46744674bfaf4750668f6f1f` (byte-identical
to its own inventoried `RETURN-draft.md`, so no edit occurred between drafting, the
Stage 3 seal and the capsule), U1's
`b445709c733ceeca98ce9104c643064490e517fced94b73b63921884c4cb8e99`. All six critique
digests match the three Stage 5 controller-facts records. Stage 3 admission: 3 expected,
3 observed, 3 admitted, zero findings, one verdict marker per return. Path checks: T 17
files scanned / 0 findings, F 17 / 0, U 17 / 0.

**Post-seal drift on two live ledgers — recorded, not a defect in any A1 artifact, and
one genuine difference of reading between two adjudicators, resolved here.** The F
adjudicator (its Finding S1) found `control/A1-STAGE3-AGENTS.json` at 4,472 bytes on
disk against 3,774 sealed, and **referred it to the controller as a process item** under
the gate's §3 sealed-member-immutability rule. The U adjudicator found the same drift,
independently and with the identical digest, **plus** a second on
`control/A1-STAGE4-AGENTS.json` (2,068 on disk against 1,663 sealed), and ruled it
**"not a capsule defect and not a mathematical finding"**, reading gate §3 as permitting
post-seal status to move to the notes or an unsealed addendum. The T adjudicator did not
examine either file; neither is a member of its capsule and its own orientation's digests
are unbroken.

I resolve this **not by majority** (only two adjudicators ruled) but on the gate text and
the controller's own record. The Stage 6 controller facts already carry erratum
**A1-E-d**: the Stage 3 and Stage 4 agents records were edited after their seals, **status
strings only**, and are listed as *expected drifts in the integrity sweep*; the record
names the F adjudicator's S1 explicitly. That settles the question of fact. On the
question of rule, **both readings are correct about different objects and neither
impeaches anything**: the manifest *documents* recompute exactly and no member of any
capsule drifted (U), and a live append-only ledger should not have been listed as a
sealed member in the first place (F). The repair they converge on is the same and it is
U's, and I carry it as a controller process item: r25's Cycle 5 process change already
snapshots living members (registry, ledger) under `control/snapshots/` at each seal
precisely so member digests stay verifiable — **either give the stage agents ledgers the
same treatment at each seal, or stop listing a live ledger as a sealed member.** I did
not open either file; I computed no digest of either, and no figure anywhere in this
synthesis depends on either.

**Controller-directed edit on U1's flag — upheld.** U1 wrote `headline_resolved: yes` for
its ROUTE object; the flag denotes the RUN's headlines; a headline resolution fails
automatic admission under the gate; the controller inspected by hand and directed the
correction of the flag and the sentence beneath it before the Stage 3 seal; the diff is
exactly two hunks (lines 378, 380), with the pre-edit copy and the hygiene-edit record
sealed as Stage 3 members. Neither sealed member is in my capsule and I did not read
either. **Upheld on controller authority plus positive evidence**, independently and
along two lines: the U adjudicator verified the admitted return's flag section is
internally coherent and that the admission report counts exactly one verdict marker, and
**the substance is independently correct** — A1-U-01's object is a fixed-rank (`k = 3`)
unconditional threshold in the order alone, and the U adjudicator established from the
kernel's own closed dependency set that `Erdos993G1.firstDescent` does not occur in it
at all, so `x(F) < r` cannot enter. No mathematical content changed. Critic C-U1-T
flagged the edit as unverifiable under its own grant, which was the right call for a
critic and is discharged here to the extent the Stage 6 grant allows.

**Errata and lane facts, taken as controller facts and ruled.** Four errata against r25
stand at this close — A1-E-a (the r25 F adjudication's Ruling 34 sign clause, FALSE on
`0 ≤ b ≤ j−2`), A1-E-b (the d = 5 band's formal-input count over-stated as three before
lane B; also present in two sealed A1 Stage 2 members), A1-E-c (S-U-1's "19 failures at
`r ≤ 14`" does not reproduce; 14), A1-E-d (the agents-ledger edits above). The T and U
adjudicators each rule explicitly that none of A1-E-a/b/c bears on their orientation and
that no status transfers from any of them; the F adjudicator's orientation is likewise
untouched by them. **I rule the same at the run level: no grade, status or scope moves
across from any erratum, and sealed records are never edited — every correction goes on a
registry face at the close.** Note for the Stage 5 record: three errata were named in the
Stage 5 controller-facts records and a fourth (A1-E-d) was added at Stage 6, so an
adjudication naming "three errata" is complete as written at its stage.

Lane B and lane C are **not routes and not mine to fund or count**. I take as controller
facts that lane B closed `formally_verified` on 2026-09-22 on the terminal declaration
`ErdosR25AddBdTail.bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0` over C-U2-F's
integer-rank ranged object, kernel within the three standard axioms, informal audit
passed (the auditor also serving as the gate-ruling-8 isolated reader and ruling the
assembled composition sound on one frame), fidelity match — registry effect
`E993-R25-BD-TAIL-NEGATIVE → formally_verified` for the `r ≥ 6` half, sharpness half
informal; and that lane C returned four isolated Opus second reads, all
`confirmed_with_repairs` (SR-H, SR-RES, SR-S1, SR-S2). I cite lane B once in the band
ledger and once as a grading precedent, and I re-read no lane material.

**My read-boundary disclosure, filed rather than omitted.** Read in full: the two boot
files described by reference; `control/A1-SYNTHESIS-PROTOCOL.md` (first, binding in
full); the dispatch manifest; `SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`;
`control/A1-STAGE6-CONTROLLER-FACTS.json`; `control/A1-STAGE1-GATE.md`;
`control/A1-ALLOCATION.md`; the three Stage 5 controller-facts records; the three
admitted adjudications; `control/A1-STAGE5-PACKET-MANIFEST.json`;
`control/C4-CONTROLLER-ERRATA.json`; `control/C5-CONTROLLER-ERRATA.json`; and under
`sources/r25-terminal/` the Cycle 6 cycle-close, the controller review, the Lean gate
closeout, and three sections of the Cycle 6 synthesis (`## Headline verdicts`,
`## Progress and stop-gate ruling`, `## Successor-run recommendations`) read by line
offset. **Members verified but deliberately not opened**, because nothing I rule on
required them: `control/C2-REFUTATION-WITNESSES.json`,
`control/C3-CENSUS-CONVENTION-RECONCILIATION.json`, `control/C3-CENSUS-ERRATA.json`,
`control/A1-STAGE2-PATH-LITERAL-QUOTATION-RECORD.json`,
`control/PATH-CHECK-a1-stage6-dispatch.json`, the three r25 Cycle 6 adjudications, and
`sources/r25-terminal/C6-CONTROLLER-NOTES.snapshot.json`. I did **not** open
`control/CLAIM-IDENTITY.run-local.json`, which my grant authorizes: every registry fact
I carry is an adjudicator's direct query, and I say so on its face rather than
re-querying and presenting the result as my own. **One search disclosure:** a single
`grep -n '^## '` restricted to the one named capsule member
`sources/r25-terminal/C6-SYNTHESIS.md`, to locate that file's section offsets — rooted at
a named file, never above a directory, no recursion, no glob. No `find`, `rg`, `ls -R`,
`cat` with a glob, or recursive listing was run anywhere. No raw return, no critique, no
scratch, no lane B or lane C material, no `second-reads/`, `runs/` or `scratchpad/lane-*`
directory, no other experiment root, no repository state and no external source was read.
No network, no package installs, Python standard library only, exact integers and
`Fraction` throughout; every generator ships with its import list. All my scratch is
under `scratchpad/S-A1/`; never `/tmp`, `mktemp`, `TMPDIR` or a session scratchpad. Every
job ran in the foreground; no background job was started, so none needed killing before
this write.

**Adjudicator and critic disclosures, recorded and not re-ruled.** The Stage 6 controller
facts direct that this cycle's hygiene species are recorded for the close and that I rule
on none, and I do not: U1's four `find` invocations rooted AT (not above) granted r25
scratch directories; F1's nohup-launched PID-polled sweeps and a harness cwd anomaly; two
critics' full-file reads of the attack briefs; C-U1-F's hashing of out-of-grant files
during seal verification; the F adjudicator's seal script digesting every listed file
(its Disclosure D1); the F adjudicator's grant omitting the critics' `-replay`
directories (its Disclosure D2, the `C4-E-a` species); the U adjudicator's equivalent
broad re-hashing pass (its disclosure 1). Each was disclosed by its own author, each was
ruled on at the level competent to rule on it, and each author states that no content
entered its work. **One consequence is evidentiary rather than hygienic and I carry it
forward:** because the F adjudicator's grant did not name the sibling `-replay`
directory, critic C-F1-U's `h = 10` replay, its full-histogram regeneration and its
`h = 8` extension are graded **on their results, which the adjudicator reproduced
independently by replay, not on their shipped scripts.** That is the correct grading and
it is why the F census survives the gap.

**Route identity against contract.** T1 `A1-T-01 REGION-II-PRE-ABSORPTION-STRIP` (S-T-1)
against `SOLUTION-CONTRACT.md` §1 Tier 3a; F1 `A1-F-01 TAU-12-IN-WINDOW-DECISION-COMPLETE`
(S-F-1), Tier 1 adjacent; U1 `A1-U-01 FOREST-DELTA3-HEADLINE-ENUMERATION-FREE` (S-U-4).
All three are the r25 terminal synthesis's top successor route per orientation, adopted
without substitution as `control/A1-ALLOCATION.md` requires. No route restates its
target schema; each cites it.

---

## Reconciliation

I reconcile the three adjudications claim by claim and **never by majority vote**, and I
resolve nothing by consulting a lower tier: where an adjudication resolved its two
critics, I check that the resolution is internally consistent and consistent with the
other orientations, and I do not re-litigate it from material outside my boundary.
Every figure I carry below was either re-added by my own instrument
(`scratchpad/S-A1/synth_checks.py`, 51 checks, 51 pass, `PAYLOAD_SHA256 =
e790cf7cb8b9bb30bbefa512e45367870a12af7a49142962c7e6d861b616fd4a`) or is named on its
author's face as that author's.

### Where all three agree

1. **The seal chain.** Three independent recomputations of the Stage 2/3/4 seals agree
   with each other, with the controller facts and with my own recomputation of the Stage
   5 and Stage 6 seals. Upheld.
2. **The typed verdicts.** All three return `still_open`, with material progress
   affirmed and orientation plateau declined. No adjudicator found a decisive event.
3. **The route/headline fence.** All three hold that a route object is not a run
   headline, and each verifies it positively rather than by assertion — T because its
   object is a rational-valued certificate recursion with no graph carrier, F because its
   object is a finite class of thin trees at one fixed cover number, U because the
   award's closed dependency set computed inside the kernel contains no `firstDescent`
   and no G1 guard object.
4. **The plateau logic**, with a difference of emphasis I record rather than resolve.
   All three hold that a plateau requires *evidence of no material progress*, never the
   absence of a headline proof. T reasons that this cycle shows material progress so the
   two-cycle condition is not met; F and U reason additionally that a two-cycle test
   cannot be run from a single cycle at all. Same conclusion by two routes; both are
   sound and the protocol's own formulation (r25's six cycles each made material
   progress, so a plateau needs Cycle A1 itself to show none) is satisfied on either.
5. **No status transfers, and nothing bears on Erdős #993.** Each says so for its own
   orientation and each declines to carry a grade across a claim key.
6. **The Lean gate test was applied uniformly.** All three apply the protocol's check 6
   — stable statement, closed dependency DAG at the exact scope, sufficient materiality —
   and two of three return "none" against their own orientation's best candidate. No
   adjudicator lowered the bar for its own route.

### The three routes are mathematically disjoint, confirmed three ways

T1 carries `d`, `α`, `j` and a band functional and constructs no graph; F1 carries `τ`
and `r` on thin trees; U1 carries no `d`, no `ν`, no `τ` and no rank parameter at all.
Each adjudication verifies the disjointness from its own side, and two verify it against
the other's object specifically: **F rules that U1's `Δ₃ > 0` fact, though uniform in the
order and logically covering rank 3 of every forest F1 sweeps, is far below every `x` in
its band** (the `x` values run 7–11 at order 26 and 11 at order 35) **and lies outside
the window by construction, so no status transfers either way**; **U rules that lane B's
`Bd` tail is a cover-branch band input, and T independently rules that it does not bear
on Region II.** No cross-route dependency exists anywhere in the cycle, and no result
of one orientation is load-bearing for any result of another.

### Where they differ, and how I resolve it

**(i) The agents-ledger drift — a genuine difference of reading between F and U.**
Resolved in `## Identity and seal audit` above: a question of fact settled by the
controller's own erratum A1-E-d, a question of rule on which both are right about
different objects, and one shared repair carried to the controller. No A1 artifact is
impeached and no figure depends on either file.

**(ii) The two F critics' extensions of the same residue.** C-F1-T pushed `h = 7`/`h = 8`
at orders 27–32 to 97.10 %/94.55 %; C-F1-U independently built the same resumption and
pushed `h = 8` **at order 27 only** to 69.76 %. The F adjudicator resolved this **by
replay, not by arithmetic**: re-running `h = 8`, order 27, indices 69,182…81,248
reproduces C-F1-U's 4,489,714 accepted instances to the unit and leaves its stated
remainder of 35,220 exactly, and a separate replay of C-F1-T's whole `h = 7` window at
order 30 reproduces 976,643 to the unit. **C-F1-U's window is a strict sub-window of
C-F1-T's, so its 4,489,714 instances are real, attributable and independently built but
add no coverage.** I re-added the index arithmetic (`81,248 − 69,182 = 12,066`;
`116,468 − 81,248 = 35,220`) and it closes. Upheld, and the nesting is carried onto the
registration face so the two extensions are never summed.

**(iii) The two U critics' strikes.** C-U1-T struck the "grep for `decide`…finds none"
literal and C-U1-F did not address it; C-U1-F struck the "34 checks" literal and C-U1-T
did not address it. **These are additive, not opposed**, and the U adjudicator upheld
both on its own replays (four `decide` occurrences, all in `L123Chain.lean` at lines 77,
82, 85, 90, and zero elsewhere; the shipped generator prints 39 `PASS` lines with the
payload digest the return claims). The adjudicator then found a third literal neither
critic caught — "both are attributed on the face of `PendantIdentity.lean`", false
because that file is byte-identical to C-U3-F's own `Crit.lean` and therefore cannot name
C-U3-T. All three strikes are certification defects; none touches mathematics; all three
become mandatory Stage 7 repairs.

**(iv) The two T critics on the α-profile.** C-T1-F retained without narrowing; C-T1-U
narrowed the trend to even `d`. The T adjudicator established this is **not a
disagreement of fact but a difference in what each critic swept** — C-T1-F's exhaustive
checks fell at `d = 4, 10, 20`, all in the even, well-behaved family — resolved in favour
of C-T1-U on the fact, and then **corrected C-T1-U's own scope sentence**, which
over-simplifies in the other direction (`d = 6` is even and band-top-minimized; `d = 8`
is even and sits at `r = d+4`). The adjudicator's ruled scope sentence, which I adopt
verbatim into the registry recommendation, is in `## Exact established results`. C-T1-F
is not faulted: its sweeps are exhaustive and correct within the range it ran.

**(v) The three seating readings do not compose into one verdict, and I say so rather
than averaging them.** T records that its two critics between them contributed more new
content by volume than the return while the seat contributed the only new theorem, and
that **no grade moved at all** on its route so there is no grade-moving step to
attribute. F records **every grade-moving step as seat-derived**, with both critics'
advances genuine and non-grade-moving. U records the grade-moving **mathematics** as
critic-derived — but from r25's Cycle 5 and Cycle 6 critics, seated on Opus 5, not from
this cycle's critics — and the grade-moving **formalization** as seat-derived, while
warning that its route left no mathematical gap for a critic to advance and therefore
cannot distinguish inability from absence of opportunity. These three are not in
conflict; they describe three different route shapes. The comparison is drawn, with its
limits, in `## Seating finding`.

**(vi) One asymmetry between two critics of the same seat, which is a capsule-design
artifact and not a fault of either.** C-T1-F could not check the return's registry claims
at all — the run-local registry is granted to the route seat's Stage 2 packet but not to
the critic capsules — and honestly graded them source-unverifiable; C-T1-U, with the same
nominal capsule, did read the registry and confirmed them. The T adjudicator discharged
the item by direct re-query (18 keys under case-insensitive normalization, 13
case-sensitively). Carried to the controller as a capsule-design item: **a critic asked
to audit a registry sweep should be granted the registry.**

### The controller's explicit reconciliation questions, each ruled

- *T: does the sub-multiplicative lemma deserve a scope line, the seat having declined a
  key?* The T adjudicator ruled **yes to the scope line, and the seat is right to decline
  a key** — unconditional, uniform in `d`, independently reproduced four times over,
  duplicating no registered claim, but an immediate corollary that closes nothing, and
  the run's own convention already folds `ID1`/`ID2` and the refuted multiplicative route
  into that same claim's scope. **Upheld**; it becomes REG-3.
- *T: do the odd-`d` band-top minima change the r25 reading that the band top has slack?*
  **No**, on a measurement neither critic made: at every `d` whose argmin sits at the band
  top the safety ratio **at that top cell** is at least 1.93 (5.2101 at `d = 5`, 1.9368 at
  `d = 6`, 3.1599 at `d = 7`, 3.4506 at `d = 17`), nearly twice the critical value 1. What
  the odd-`d` data falsifies is the *relative location* claim, never the *absolute slack*
  reading. **Upheld**, and it sharpens rather than contradicts the registered gloss, which
  is stated for C-T1-F's **margin** functional under the reciprocal-`ρ` fence — a
  different quantity, exactly as the fence requires.
- *F: what could an honest `τ ≤ 12` successor key carry?* Answered as REG-1/REG-2 with
  three limits on the face.
- *F: no in-window failure and no recovery anywhere?* **Confirmed over the complete band**
  — 0 in-window log-concavity failures and 0 recoveries at any rank in 539,470,990
  accepted instances — and *the standing in-window minimum `τ = 21` is unchanged*,
  reproduced under the adjudicator's own third instrument.
- *U: is `Erdos993G1.U1.forest_delta_three_pos_ge_twelve` contract-ready, and what must a
  formalizer repair?* **Yes, scoped to the `n ≥ 12` half, subject to R1–R5 and R7.** Ruled
  in `## Lean awards`.

---

## Exact established results

Grades are the run's own: `formally_verified` only through the governed
`lean-proof-workflow`; informal exact theorems are `proved_informal` with dependencies
named; computation is bounded evidence at its stated finite horizon and never universal
proof; a null census is insufficient for any tier; counts name their population; horizons
are the attained ones; critic- and adjudicator-derived advances are named as such. **A
compiled fragment is not a theorem until the governed workflow verifies it.** For every
result I state where `d`, `ν`, `τ` and `x(F) < r` enter.

### Orientation T (route `A1-T-01`, Tier 3a)

**E-T-1. The Region-II sub-multiplicative upper bound. Theorem, uniform in `d`,
unconditional, no horizon. Seat-derived.** For every `d`, every rank `r` in the band
`d < r < K(d)`, and every `j` in Region II (`j > boundary(d) = floor((K+1)/2)`) in rank
`r`'s window: `φ_j(r) ≤ B(j,r)·φ_{j−1}(r)`. Proof from three premises, each verified
pointwise without exception: `E_j ≤ 0` on Region II (true by the region's definition),
`φ_{j−1}(r) ≥ 0` (from the clamp `σ_j = min(1, ·)`), and `B(j,r) = C_j(r)·j` (`ID1`'s
second half, an identity); then monotonicity of `max(0,·)`. Closed dependency DAG:
{closed-form recursion definitions, `ID1`, the Region I/II threshold characterization,
non-negativity of `φ`}. Computationally re-confirmed four times independently (seat, both
critics, adjudicator) at 26,071 checks, 26,071 holding, zero violations at `d ≤ 60`.
*Parameters:* `d` enters only through `m(d)`, `K(d)`, `boundary(d)`, with no case split,
parity condition or horizon; `ν` enters once, as the fixed threshold `ν = m(d)` pinning
the band; **`τ` enters nowhere; `x(F) < r` enters nowhere** — there is no graph and no
first descent in the object, and every reported sign carries its stratum index `j`.

**E-T-2. Three majorization strategies for the leak identity, refuted with exact
witnesses. Refuted (exact), not a horizon claim. Seat-derived.** S1 (blanket `φ ≤ 1`,
zero seed) fails at `(d,α,j) = (4,1,4)` with `L_4 = −1/4`; S2 (exact seed, unclamped
telescoped `B`-product) at `(5,1,6)` with `L_6 = −59/3360`; S3 (exact seed, self-clamped
product) at `(5,1,7)` with `L_7 = −17/80`. Population **48 rows (16 `d` × 3 strategies),
43 recording a first failure, every one at exactly `α = 1`, the literal band top**; the
five non-failing rows are `{S1,S2,S3}×{d=3}` (no Region-II pair exists there at all —
absence of data, not survival) and `{S2,S3}×{d=4}` (real data, surviving one stratum
longer). I re-added the population: `16 × 3 = 48` and `43 + 5 = 48`. The structural
finding is a genuine explanation and not a restatement: once `B(j,r) > 1`, generic near
the Region I/II boundary at every `d` tested, the next multiplication amplifies any
accumulated deficit rather than damping it. The adjudicator confirms these refute the
*strategies* and not domination — at S1's witness cell `Δ_4 = 19/32 − 1/2 = 3/32 > 0`.
*Parameters:* as E-T-1; the witnesses are exact at specific `(d,α,j)`, so no horizon
attaches to the refutations themselves.

**E-T-3. The `α`-indexed exact safety-ratio profile with its parity structure. Bounded
computation, parameterized in `(d,α)`, attained horizon `d ≤ 400`. Seat-derived; the
parity structure critic-derived (C-T1-U) and extended by the T adjudicator.** The
registered global-minimum witness re-confirmed exactly from scratch by four instruments:
at `d = 200, r = 203, j = 202` (`m = 299`, `K = 398`, `boundary = 199`, `α = 195`),
`Δ_201(203) = 951515251/135957389568`, `leak_202 = 2051625/120804992`,
`B(202,203) = 101/28`, **safety ratio `951515251/640107000`**. I recomputed that ratio
from the three exact inputs with `Fraction` and it closes to the stated fraction, and it
exceeds 1. The profile is **160 rows = 153 carrying a value + 7 with a null minimum**
(`d=3` at `α=1`; `d=5` at `α=2,3`; `d=7` at `α=4,5`; `d=9` at `α=6,7`, being cells with
no Region-II pre-absorption instance at all). The true argmin in `α` is located exactly,
by exhaustive non-sampled sweep, for every `d` in 3..40 plus seventeen larger `d` of both
parities, and at every `d` where a comparison is defined **the seat's sampled argmin
coincides with the true argmin**, which raises §5's six displayed rows from sampled to
exhaustive correctness at their `d`. The **ruled scope sentence**, which supersedes both
the return's and C-T1-U's wording and which any successor must carry:

> For even `d` with `10 ≤ d ≤ 400`, the true argmin of the leak-identity safety ratio in
> `α` sits at `r = d+2` or `r = d+3`, a few cells inside the band bottom. At even `d = 8`
> it sits at `r = d+4`; at `d = 4` the band is a single cell; at `d = 6` and at odd
> `d = 5, 7, 17` it sits **at the band top**; at the remaining odd `d ≤ 39` it is
> irregular and non-monotone, and for odd `d ≥ 99` it converges to `r = d+8` (verified to
> `d = 399`). The sampled-grid claim must never be cited as parity-independent.

**The binding family is even `d`, a few cells inside the band bottom**, where the minimum
decreases from 1.9368 at `d = 6` to 1.6614 at `d = 20`, 1.6410 at `d = 40`, 1.5984 at
`d = 100`, 1.4865 at `d = 200` and 1.4405 at `d = 400`, while odd `d` carries two to
three times more slack; **the band top retains absolute slack (`≥ 1.93`) at every `d`
swept.** That is sharper than either critic reached and is the operative guidance for a
successor. *Parameters:* `d` and `α` parameterize the statement explicitly and the
horizon `d ≤ 400` travels with it; `ν = m(d)` fixed; `τ` and `x(F) < r` enter nowhere.
**This is evidence, not a theorem, and it proves no universal statement.**

**Critic-attributed, bounded computation or symbolic derivation at attained horizons.**
C-T1-F: symbolic proofs of `ID1`, `ID2` and the leak identity, which the return only
cites (the adjudicator confirms the algebra independently: `B = C·j` by construction,
`1 − A = i_r/s`, `1 − A − B = C·E_j` via `2u − j = 2m + 2 − 3j = E_j`, and
`C_j(r−1) ≤ C_j(r) ⟺ 2j ≤ K + 1`, exactly the coded boundary); an exhaustive sweep of the
literal chartered target at `d ∈ [2,40]`, **722 checks, 0 failures**, which the
adjudicator confirms is the *complete* one-step population of that range — I re-derived
the count independently (even `d` gives `d−3` pairs, odd `d` gives `d−2`, totalling
`19² + 19² = 722`), so the sweep is genuinely exhaustive and not a sample; and a pointwise
domination sweep through Region II at `d ≤ 80`, **60,801 checks, 0 violations**. C-T1-U:
a direct termwise domination sweep at `d ≤ 100`, **120,001 checks, 0 violations, 30,631
strict, minimum exactly 0 at the absorption point `(d,r,j) = (5,8,7)`**; and the fourth
refuted strategy S4 (see `## Refuted or narrowed mechanisms`). **`ID1` at 61,103 checks
and `ID2` at 60,233 checks, 0 failures, at `d ≤ 60`**, reproduced by the adjudicator to
the digit.

**Re-confirmations, named first and claiming nothing new.**
`E993-R25-MATCHING-BAND-REGION-DOMINATION` (VERIFIED, `proved_informal`) — Region I
strict domination, `H3`, the exact `E_j`/boundary characterization and the `d = 3`
one-step theorem: **re-confirmed, not newly proved.**
`E993-R25-MATCHING-BAND-ABSORBING-RESIDUE` (VERIFIED, bounded computation at `d ≤ 400`):
the absorption structure and ordering re-confirmed freshly to `d ≤ 60`; **the registered
horizon is unchanged and is not extended by anything here.** Fixed points reproduced: at
`d = 2` the band `[2,1]` is empty and no claim is made; at `d = 3`,
`β_cell(3,1) = 7/12 < 3/4 = β_cell(3,2)`, strict; `m(5) = 7`, `K(5) = 9`. I independently
re-derived the boundary identity `floor((K+1)/2) = K − d + 1` at both parities for every
`d` in 2..400.

### Orientation F (route `A1-F-01`, Tier 1 adjacent)

**E-F-1. The `τ = 12` thin band is closed exhaustively at every order it occupies.
Bounded computation at complete-census grade. Layered attribution.**

> *Statement.* Let `T` be a thin tree — a tree in which each vertex of the minimum vertex
> cover carries at most one pendant leaf — with `τ(T) = 12` (equivalently, by König on a
> bipartite graph, `ν(T) = τ(T) = 12`) and `26 ≤ |V(T)| ≤ 35`, i.e. excess
> `d = |V(T)| − 2τ ∈ [2, 11]`. Then `T` has **no log-concavity failure at any rank `k`
> with `x(T) < k ≤ ⌊(|V(T)| − 2)/2⌋`** and **no recovery at any rank** — there is no `r`
> with `x(T) < r` and `Δ_r(T) > 0`. Exactly two ranks in the entire band carry a
> log-concavity failure at all, both at order 26 and both at rank 13, which exceeds
> `r_max = 12` and is therefore out of window: `T(3,4,4)` with margin
> `i₁₃² − i₁₂·i₁₄ = −378` at difference index `k = 13`, and `W2` with the same index and
> margin `−68`. Both are pre-registered.

*Evidence.* **539,470,990 accepted `(skeleton, D)` instances** over the **1,721,756**
canonical-form `τ = 12` skeleton classes, at **every reachable `(order, h)` cell** for
orders 26–35 and `h = 0..11`, verified cell by cell to equal the stratum population in
all **55** reachable cells, with `h = 0, 1` vacuous by the exact algebra
`|D| = 2τ + h − n`. **124,073 end-to-end spot checks** (materialise the literal final
tree, re-test acyclicity, recompute the polynomial, assert equality with the fast path),
**0 mismatches**. Exact Python `int` arithmetic; no floating point in any reported
number. My own re-additions all close: the per-order instance vector
`189,012,829 / 167,330,526 / 106,967,555 / 51,245,794 / 18,621,942 / 5,103,517 /
1,029,876 / 145,458 / 12,942 / 551` at orders 26…35 sums to 539,470,990; the `τ = 12`
per-`h` histogram sums to 1,721,756, its `h ≥ 2` tail to the 1,713,485 classes of order
26, and its `h = 6,7,8` cells to the chartered residue of 764,513 exactly; the `τ = 11`
histogram sums to 336,219; the spot checks split 89,521 + 26,674 + 7,878 = 124,073; and
the reachability algebra independently reproduces 55 reachable cells with order 35
reachable only from `h = 11`.

*Where the parameters enter.* **`τ = 12` is fixed, not a uniformity parameter**, entering
as the size of the cover `C` in the skeleton decomposition and as the cardinality
constraint the acceptance predicate enforces. `ν` enters only through `ν = τ` (König;
forests are bipartite) and nowhere independently. **`d` enters as a finite enumerated
set** `d = n − 2τ ∈ {2,…,11}`; it is not a parameter the argument is uniform in.
**`x(F) < r` enters as the hypothesis of both tested predicates** — a log-concavity
failure at `k` is in-window exactly when `x < k ≤ r_max`, and a recovery at `r` is exactly
`x < r` together with `Δ_r > 0`; the recovery predicate was evaluated directly on every
instance and never inferred from the failure predicate, so the two are independent
cross-checks of the same arithmetic. `Δ_{−1} = 1` and the integer zero extension are the
`SEMANTIC-CONTRACT.md` conventions throughout, and every reported sign carries its
difference index `k`.

*Named dependency, on the face.* **Completeness of the census over the class, as opposed
to over the construction, rests on Lemmas A–C** (a thin tree of cover number `τ` is a
skeleton on `C ∪ H` with one pendant leaf on each vertex of `A = C ∖ D`, where `D ⊆ C` is
matchable into `H` through the skeleton's own edges), cited at the r25 record's informal
grade, independently reimplemented but **not re-proved** by the seat, either critic or
the adjudicator. Three facts make the dependency load-tested rather than merely assumed:
the generator reproduces the established `τ = 6..12` class counts including both full
per-`h` histograms and matches A000055 exactly to order 17; the acceptance predicate's
structural meaning was checked by C-F1-T with a *different* invariant computed by a
*different* algorithm (75 materialised samples, `τ(T) = 12` exactly in every case),
corroborated by the adjudicator's separate cover DP; and the family provably contains the
two known witnesses, since the sweep rediscovered `T(3,4,4)` and `W2` live in its own
`h = 3` and `h = 4` strata with the exact registered margins.

*Attribution, layered and never summed across nested windows.* Seat `F1`: 447,626,015
instances — order 26 in its entirety at every hub count including the chartered
`h ∈ {6,7,8}` residue (764,513 classes / 141,263,643 instances), orders 33 and 34, and
the prefixes of orders 27–32. Critic `C-F1-T` (**critic-attributed**): 80,025,642 — the
`h = 7`/`h = 8` narrowing from 61.85 %/59.40 % to 97.10 %/94.55 %. Critic `C-F1-U`
(**critic-attributed**): 4,489,714 at `h = 8`, order 27 only, **nested inside C-F1-T's
window and therefore not additional coverage**. The **F adjudicator**: 11,819,333 — the
final `h = 7` suffix (7,447 classes / 4,314,152 instances), the two `h = 8` suffixes
(6,074 + 277 classes / 7,140,647 + 363,983 instances) and the top order 35. I re-added
the split: the adjudicator's suffixes total 11,818,782, plus order 35's 551 gives
11,819,333, and `447,626,015 + 80,025,642 + 11,819,333 = 539,470,990`; the residue
standing at the Stage 4 close was `7,447 + 6,351 = 13,798` classes and is now zero.

**E-F-2. Seventeen fixed points and controls reproduce under a third, independently
authored instrument** (union-find + BFS acyclicity, materialised-pendant DP, and a
structurally separate minimum-vertex-cover DP): `P_8` (`x = 2`, `Δ₃ = −15`); `T(3,4,4)`
and `W2` at order 26 with `τ = 12`, `x = 8` and failures `(13, −378)`/`(13, −68)`,
including `W2`'s full fifteen-term sequence digit for digit; `T(3,4,5)`, `T(3,5,5)`,
`T(3,5,6)`, `T(3,6,6)` at failure ranks 14/15/16/17 with margins
−982/−3345/−6539/−16836; `T(4,4,4,4,4)` (order 46, `α = 25`, `τ = 21`, `x = 14`,
`r_max = 22`, in-window failure `(22, −674,077,990)`, no recovery at any rank); the six
Galvin fixtures; the registered `(7,7)` order-23 witness (`x = 7`, `Δ₇ = −192`) and the
`(6,6)` order-24 witness (`x = 8`, `Δ₈ = −78`); and the fenced comparator. Every `Δ_k`
for `k ≥ x` is strictly negative on both order-26 witnesses: **neither ever recovers.**
The positive control `T_{5,5,1}` (order 56, `τ = 26`, `x = 17`, `r_max = 27`) fires a
genuine in-window failure at rank 27 with margin −332,324,762,280, so the in-window
machinery is demonstrably not vacuously silent.

**E-F-3. The decisive lever is correct against materialised ground truth.** The analytic
`(1 + z)` pendant fold — an elementary specialisation of `SEMANTIC-CONTRACT.md`'s own
leaf-deletion identity `I(F;z) = I(F−v;z) + z·I(F−N[v];z)`, re-derived by hand by the
adjudicator — agrees bit for bit with full materialisation over three independently coded
instruments and at least **2,260,458** instances of direct comparison (C-F1-T 121,220;
C-F1-U 2,139,238; the adjudicator 121,220 recomputed from scratch plus 7,878 further spot
checks), with zero discrepancies anywhere.

**E-F-4. The population census is exact in every cell**, regenerated in full and not
sampled: `τ = 12` total 1,721,756 with its complete twelve-value per-`h` histogram,
`τ = 11` total 336,219 with its eleven-value histogram, and free-tree counts matching
A000055 exactly at every order 1–17.

**E-F-5. The standing in-window minimum `τ = 21` is unchanged.** The band is `τ = 12` and
contains zero in-window failures, so it supplies no candidate below 21; the control
`T(4,4,4,4,4)` reproduces exactly under the adjudicator's own instrument.

**Two populations, named so they are never interchanged.** Skeleton **CLASSES**
(colour-aware centroid-rooted AHU canonical form) and accepted **INSTANCES** (one per
`(skeleton, D)` pair, a construction count). The sweep is deliberately orbit-free, so a
given final tree may arise from more than one pair — and **the logical direction is
favourable**: duplication never causes an omission, so a null result over the instances
is a null result over the classes. The instance counts are construction counts and are
nowhere claimed to be counts of isomorphism classes of final trees.

### Orientation U (route `A1-U-01`)

**U1. The compiled headline. Compiled, `sorry`-free, axiom-clean Lean fragment,
independently rebuilt from clean copy-outs by both critics and by the adjudicator — and
NOT `formally_verified`, which requires the governed workflow.**

```
@Erdos993G1.U1.forest_delta_three_pos_ge_twelve : ∀ {X : Type u_1} [Finite X] (F : SimpleGraph X),
  F.IsAcyclic → 12 ≤ Nat.card X → 0 < Erdos993G1.delta F 3
```

Three independent rebuilds reach `Build completed successfully (8662 jobs)` at Lean
`leanprover/lean4:v4.32.2` with Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, axioms
exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`, and the terminal type
character for character. `Erdos993G1.delta`, `coeff` and `indepCount` are byte-identical
to the frozen G1 source (`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`,
re-verified by the adjudicator) and to `SEMANTIC-CONTRACT.md`'s verbatim quotation.
**`SimpleGraph.IsAcyclic` is used throughout, never `SimpleGraph.IsTree`**, and frozen
ENTRY 150's own proof works per connected component, so **disconnected forests are
genuinely covered.** Statement-exact match to the first conjunct of registered
`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` (VERIFIED, certificate `proved_informal`,
seat U3, closing step an exhaustive order-8 base of 76 classes).

**U2. `forest_delta_three_lower` — the quantitative lower bound. Exact theorem, uniform
in the order, compiled. The route's real content**; U1 is one `linarith` from it and U3.
**U3. `L3_pos_of_ge_twelve : ∀ n, 12 ≤ n → 0 < L3 n`. Exact theorem in `n`, compiled**,
traced by hand in the source by the adjudicator: no vacuous-hypothesis trick, no numeral
table, no upper bound. **U4. Supporting exact theorems, the seat's own, compiled**:
`delta_zero_exact` (`Δ_0(F) = |V| − 1` for any finite simple graph, no acyclicity),
`edgeless_delta_eq`, `card_deleteVerts_singleton`, `closedNeighborhood_leaf_eq`,
`card_ambientA_leaf`, `no_edge_of_card_le_one`, `exists_adj_of_card_edgeSet_ne_zero`,
`scaledChooseFour`, `edgeless_three_pos_of_ge_eight`, `B_pos_of_ge_nine`, and the two
intermediate inductions `forest_delta_one_lower`, `forest_delta_two_lower_general`.
**U5. Imported, critic-derived, in the closure**: `Erdos993G1.CritUC503F.pendant_delta`
and `pendant_identity` (r25 Cycle 5 critic C-U3-F); `Erdos993G1.ForestDelta2.forest_delta_two_lower`
(award C6-LA1); `Erdos993G1.U1Transcribed.forest_leaf_of_edge` (frozen ENTRY 150) and
`indepCount_edgeless` (frozen ENTRY 100), both read side by side against the frozen source
and confirmed statement- and proof-text-identical, renamespaced only; and
`ErdosR25.CriticUC604FChain.{edgeless,B,L1,L2,L3,B_six,L3_twelve_pos}` (r25 Cycle 6 critic
C-U4-F).

*Where the parameters enter — established, not asserted.* The award's closed dependency
set, computed by the adjudicator **inside the kernel's own environment**, contains **no**
`Erdos993G1.firstDescent`, no `ordinaryG1Guards`, no `residual`, no `residualOrder`, no
`vertexDegree` and no `ambientH` — zero occurrences of each. `ambientA` is present,
**used exclusively as "delete a leaf's closed neighbourhood," never as a G1 tuple object
under guards.** So `d`, `ν`, `τ` and `x(F) < r` enter nowhere, and the hypotheses are
exactly acyclicity and the order threshold: no connectivity, no rank, no excess.

**U6 and U7 — adjudicator-derived, INFORMAL, and STATED rather than registered.** An
exhaustive isomorphism-class enumeration of **all forests of order 0–13** by free-tree
generation (leaf extension plus AHU canonical form under the tree centre) and multiset
assembly, with exact-integer independence polynomials, self-validated against two
classical sequences the generator computes itself (free trees 1,1,1,2,3,6,11,23,47,106,
235,551,1301 at orders 1–13; forest classes 1,1,2,3,6,10,20,37,76,153,329,710,1601,3658
at orders 0–13, the 76 at order 8 being exactly the population the registered informal
certificate's base cites). Every row carries its difference index `k = 3`: minimum `Δ_3`
is −16 at order 8 (three argmins), −20 at 9, −21 at 10, **−14 at order 11 over all 710
forest classes, attained uniquely by `P_11`**, **+6 at order 12**, +45 at order 13. Four
consequences: the registered sharpness clause is confirmed **at its registered forest
scope**, closing the exact item C-U1-F left open (its own from-scratch enumeration reached
the 235 **trees** of order 11 and explicitly did not attempt disconnected forests — I
re-derived the 475-class difference); **the threshold 12 is the true threshold for
forests**, the sign of `min Δ_3` changing between orders 11 and 12; the enumeration-free
chain is **threshold-exact** (`L3(11) = −19 < 0`, `L3(12) = 1 > 0`, a constant slack of 5
from order 9 on, yet closing at precisely the true threshold), which is a stronger
statement about the method than the route itself claims; and a precision correction —
**the order-8 forest minimum is −16, attained three times, not −15**, which is `P_8`'s own
value. U7 cross-validates U2 against that ground truth: `L3(n) ≤ min Δ_3(F)` over the
complete forest population at **every** order 0–13. **Both are adjudicator-derived
compositions and neither is registered without an isolated second read** (gate ruling 8);
neither is part of the Stage 7 award.

### Fixed-point controls reproduced by this synthesis

To hold the conventions honestly I recomputed three `SOLUTION-CONTRACT.md` §3 controls
myself, each by **two independent methods** — the `SEMANTIC-CONTRACT.md` leaf identity
`I(F;z) = I(F−v;z) + z·I(F−N[v];z)` and, separately, brute-force subset enumeration —
with `Δ_k = i_{k+1} − i_k` under integer zero extension and `x(F)` the first strict
descent: `i(P_8) = [1, 8, 21, 20, 5]`, `Δ_2(P_8) = −1`, **`Δ_3(P_8) = −15`**, `x(P_8) = 2`;
`i(P_11) = [1, 11, 45, 84, 70, 21, 1]`, **`Δ_3(P_11) = −14`**, `x(P_11) = 3`; and the
fenced comparator `6K₂ ∪ (2r−7)K₁` at `r = 21`, which lands at order 47 with
**`x = 22 = r + 1`** and **`Δ₂₁ = 6,552,954,840 > 0`**, so it never reaches the `x < r`
hypothesis — exactly as the fence requires, and reproducing the F adjudicator's figure to
the digit under an instrument written from the contract rather than from its prose. Both
methods agree on both paths. `Δ_{−1} = 1` holds by the integer zero extension.

---

## Refuted or narrowed mechanisms

**Refuted this cycle, with exact witnesses — do not re-attempt in these forms.**

1. **S1** — blanket `φ ≤ 1` majorant with zero seed. Refuted, witness `(d,α,j) = (4,1,4)`,
   `L_4 = −1/4`. Seat-derived.
2. **S2** — exact seed with the unclamped telescoped `B`-product. Refuted, `(5,1,6)`,
   `L_6 = −59/3360`. The unclamped product overshoots 1 within a couple of Region-II steps
   whenever `B(k,r−1) > 1`, which is generic. Seat-derived.
3. **S3** — exact seed with the self-clamped telescoped product. Refuted, `(5,1,7)`,
   `L_7 = −17/80`. Clamping delays failure by exactly one stratum at `d = 5` and does not
   prevent it. Seat-derived.
4. **S4** — the ratio-based two-sided monovariant `r_j := φ_j(r−1)/φ_j(r)` termwise
   non-increasing across `j` in Region II. **Refuted: 6,988 violations of 25,878 checks at
   the attained horizon `d ≤ 100`**, first violation `(d,r,j) = (10,14,11)`.
   **Critic-attributed (C-T1-U)**; the horizon was omitted by the critique and recovered
   by the T adjudicator, which reproduced the figures exactly and re-derived the
   intermediate horizons (1,581 of 6,215 at `d ≤ 60`; 3,612 of 13,950 at `d ≤ 80`).
   **Counts name their population and a successor must carry the horizon.**

These join the already-refuted multiplicative route `Q ≥ ρ_j P` (661 witnesses), which
was **not** re-attempted: S1/S2/S3 each track a differenced quantity `L_j` built from the
leak identity and are structurally distinct from the multiplicative shortcut. **The
durable content of this cycle on the T side, which I adopt as the ruled lesson:** no
one-sided majorization of the leak identity's subtracted term — however carefully built
from already-proved auxiliary bounds — survives even one full Region-II stratum's
compounding once `B(j,r) > 1`; and the one ratio-based two-sided candidate tried so far
fails as well. **A successor needs an argument, not a sweep and not a fourth majorant of
the same shape.**

**Narrowed, struck or canonicalized (no grade moves on any of these).**

- **T §5's trend claim** — narrowed from `d ∈ {3,…,400}` to the parity-explicit scope
  sentence in `## Exact established results`. The shipped generator's large-`d` list is
  exclusively even (`[3,4,5,6,7,8,9,10,20,40,80,100,150,200,300,400]`, no odd `d` above
  9), while the prose claimed to map the trend for `d ∈ {3,…,400}`. C-T1-U's charge
  **sustained on fact**; C-T1-U's own sentence corrected, since `d = 6` is even and
  band-top-minimized and `d = 8` sits at `r = d+4`.
- **T §5's `r = d+2`/`d+3` universal quantifier** over the six displayed rows —
  **struck** and narrowed to the five non-degenerate rows (`d = 10, 20, 100, 200, 400`).
  The `d = 4` row has `r = 5 = d+1`, simultaneously the literal bottom rank and the band
  top because `d = 4`'s band is a single cell, so the universal is false on the return's
  own displayed data. **Adjudicator-found; both critics reproduced the numbers but
  neither checked the quantifier.** A quantifier defect, not a fabrication.
- **"All sixteen match"** in T's Stage 2 section — **struck**, corrected to **fifteen**;
  every one of the fifteen is individually correct. Sustained from C-T1-F.
- **"18 records"** — upheld, with the normalization note that the sweep is
  **case-insensitive over `statement`+`scope`+`aliases`**; case-sensitively the same
  filter returns 13. A successor must carry the normalization with the count. I re-added
  the partition: `2 shown + 15 listed + 1 schema = 18` and `13 + 5 = 18`.
- **"160 rows"** — upheld, canonicalized as **153 valued + 7 null**.
- **"A completely separate DIRECT dense DP"** in F's step 6(b) — **struck**
  (critic-attributed to C-F1-U, sustained on a line-by-line read of the shipped code:
  `sweep.py::_direct_polynomial` calls `poly.independence_polynomial` with an empty
  `a_set`, so it shares the whole `_conv`/`_add`/`_shift1`/post-order machinery). Accurate
  wording: *the same DP function, invoked without the pendant-substitution branch, over
  the materialised graph.* **No figure changes**, and the evidentiary gap the phrase
  papered over is independently closed three ways by three separately authored
  instruments (C-F1-T over the whole `h = 11` order-26 stratum, C-F1-U over `h = 10` plus
  `h = 11`, and the adjudicator's own recomputation of `h = 11` order 26 at 121,220
  instances with `x` histogram `{7: 10, 8: 121,064, 9: 146}`). C-F1-T explicitly reported
  finding nothing to strike; on this point C-F1-U was right and C-F1-T was not.
- **F's own residue limits — SUPERSEDED favourably.** The return's `38.1 %`/`40.6 %`
  uncovered residue at orders 27–32, and C-F1-T's updated `7,447 + 6,351 = 13,798`
  skeletons, were both correct when written; **the residue is now zero.** A successor must
  cite the closure, not either residue figure.
- **Orders 24–25 at `τ = 12` — a boundary, not a defect.** The construction reaches orders
  `n = 24 + h − |D|`, so `τ = 12` thin trees of order 24 and 25 exist (`d = 0` and `d = 1`)
  and were swept by nobody; the chartered residue named orders 26–34 only, and those
  orders sit below the `d ≥ 2` region Tier 1 is about. Named on the registration face;
  cheap to complete.
- **"Grep for `decide`/`native_decide`/enumeration constructs finds none"** in U —
  **struck** (C-U1-T's finding, upheld and sharpened). Four `decide` occurrences exist in
  the shipped, hashed `L123Chain.lean`; zero `native_decide`; zero `sorry`/`sorryAx`/
  `admit` in proof position. The substantive claim survives and is restated exactly in
  `## Lean awards`.
- **"34 checks"** in U — **struck** (C-U1-F's finding, upheld); the shipped generator
  prints **39** `PASS` lines with the payload digest the return claims.
- **"Both are attributed on the face of `PendantIdentity.lean`"** — **struck**
  (adjudicator-found, missed by both critics). The token `C-U3-T` occurs nowhere in that
  file, which names C-U3-F four times and cannot name C-U3-T because it is byte-identical
  to C-U3-F's own `Crit.lean`. The substance survives; the attribution belongs on the
  award contract's face.
- **C-U1-F's "all 12 entries"** for the compiled-fragment table — corrected to **11**;
  immaterial. And the return quotes eleven lines of `AxiomCheck.lean` output where the
  shipped driver emits thirteen; the two omitted lines corroborate, and the governed
  award's receipt must ship the full output.

**Errata against the r25 record, carried onto registry faces at the close (sealed records
are never edited).** **A1-E-a**: the r25 F adjudication's Ruling 34 sign clause is FALSE
on `0 ≤ b ≤ j−2`; Lemma H's uniqueness half is a theorem for every natural `j`, attaining
set `{2j−1, 2j} ∩ ℕ`, a singleton at `j = 0`. **A1-E-b**: the `d = 5` band had **two**
formally verified inputs of eight at the r25 close, not three (the card-5 award is the
finite part of input 2 at top rank); with lane B it now has **three** (inputs 3, 6, 7);
the over-count also sits in two sealed A1 Stage 2 members, so a successor must not read
the figure out of them. **A1-E-c**: the S-U-1 warning "19 failures at `r ≤ 14`" does not
reproduce — **14**. **A1-E-d**: the Stage 3 and Stage 4 agents records were edited after
their seals, status strings only.

**No mechanism was refuted in orientation U**: the route is a construction, not a
falsification. **No new refutation was produced in orientation F**; the refutations
reproduced there are registered ones. **No registered-refuted mechanism was invoked
anywhere in the cycle**, on three independent end-to-end reads rather than on any
author's `grep`: in T the fenced mechanisms are *structurally inapplicable* because no
graph carrier exists for them to attach to; in F the polynomial is computed exactly by
dense DP and never via the comparator `(1+2z)^m(1+z)^{n−2m}`, there is no
pointwise-addability, every-vertex-SR2, edge-addition-monotonicity or factor-two premise,
and **log-concavity is tested for on every instance and never assumed**; in U there is no
generating variable `z` at all, no cover-3 prehistory, no log-concavity or TRS2 premise,
no convolution closure, and no forest unimodality imported as a premise. **The gate
ruling 5 key `E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` was confirmed ABSENT from the
360-row run-local registry independently by both the F and U adjudicators, and must never
be registered.**

---

## Headline verdicts

Exact evidence-grade verdicts at this close. **No status transfers between any two of
these, in either direction.**

**Tier 1 — `E993-R25-UNR-FOREST-WIDE` (for every finite forest `F` and `r ≥ 1` with
`|V(F)| ≥ 2r+2` and `x(F) < r`: `Δ_r(F) ≤ 0`): OPEN, unchanged by every Cycle A1 route.**
No Cycle A1 object is a no-recovery statement: T1 carries no graph, F1's object is a
finite class of thin trees at one fixed cover number, and U1's has `x(F) < r` entering
nowhere and is a positivity statement of the opposite sign. What moved is evidence
**around** it: the tree side of the `τ = 12` in-window question is discharged at orders
26–35 by complete census (bounded computation, with Lemmas A–C named on its face), with
**zero in-window log-concavity failures and zero recoveries at any rank in 539,470,990
accepted instances**; the **standing in-window minimum `τ = 21` is unchanged**, so
nothing lowers it and the frontier question becomes `τ ≥ 13`; and the remaining region is
still the excesses `d ≥ 6`. The forest side of the `τ ≤ 12` statement is **not** settled —
it needs the convolved-sequence window instrument, which no route in r25 or in this
addendum has built. **An order bound is not a no-recovery statement, and a null census
over a finite class proves no universal statement.**

**Tier 2 — `E993-G1WIDE-NO-SIZE-CAP`: OPEN, and untouched.** **No Cycle A1 route has a G1
tuple in it**, established positively rather than asserted: the U award's kernel-computed
dependency closure contains no `ordinaryG1Guards`, no `residual`, no `residualOrder` and
no `ambientH`; T's generator constructs no graph at all; F invokes no G1 tuple object.
The residue a successor inherits is exactly what the r25 close left: every `d′ ≥ 6` plus
the single cell `(d′,p) = (3,6)`, with nothing bounding `d′` above. **Cycle A1 neither
narrowed nor widened it.**

**Tier 3a — `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`: OPEN.** The chartered one-step lemma
`β_cell(d,α+1) > β_cell(d,α)` is **not discharged on Region II at any `α`**. Top-cell
attainment, the band `d < r < K(d)`, the live cell `(3,4)` and the `d′ = 3` slice's last
rank all remain exactly as inherited. What this cycle adds is one new unconditional
theorem uniform in `d` (E-T-1), four closed-off mechanism families with a stated
structural reason, an exact parity localization of the binding family, and **four
independent exhaustive sweeps of the target inequality itself with zero counterexamples**
(722 one-step pairs at `d ≤ 40`; 60,801 and 120,001 pointwise instances at `d ≤ 80` and
`d ≤ 100`; plus the adjudicator's re-runs) — which materially raises confidence that the
obstruction is **proof-technical and not a hidden counterexample**, and which is why
further sweeping adds no information. **The exact remaining obligation is verbatim what
it was at the r25 terminal close.**

**Tier 3b — `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY`: OPEN, and untouched by Cycle
A1.** No route attacked it. `c(d) = min(d,5)` stays informal, the diagonal stays REFUTED
for `d ≥ 6`, the census stays 45 closed / 28 refuted / 0 undetermined, and nothing raises
`c` above 5 anywhere. Lane C's second reads bear on the `Γ`-route residue's presentation
(SR-RES, SR-S1) and are the controller's to register; they move no threshold function.

**Tier 3c — the window reduction: UNCHANGED.** With `m(d) = ⌈3d/2⌉ − 1` and
`c(d) = min(d,5)`, every counterexample to Tier 1 has `ν(F) ∈ [c(d)+1, m(d)−1]` together
with `x(F) < r`, of width `⌈3d/2⌉ − 7` for `d ≥ 5` and exactly `{6,7}` at `d = 6`.
**Neither endpoint moved in Cycle A1**, and no further reduction from the ambient G1
guards was proved. **The honest statement: the reduced class is explicitly characterized
but is not strictly smaller at this close than it was at the r25 terminal close.** This is
the finding that decides the stop gate's "verified reduction" limb.

**Diagnostic band — `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` /
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`: VERIFIED, `proved_informal`, fixed-band `d = 5`, every
`r`, graded at its weakest link.** Cycle A1 touches it only through lane B, which is not a
route and not mine to count: with lane B's `Bd` tail the band has **three** formally
verified inputs of eight, correcting the r25 close's figure of three to **two** before
lane B (erratum A1-E-b). **Its grade does not change** — the general half of `c(5) = 5`
and Corollary F at `d = 5` remain informal, and **a count of formal inputs is not a
grade.** I re-added the ledger: eight inputs, two formal before lane B, three after, five
informal.

**And separately, with no status transfer:**

- **`E993-TGT-FOREST` (every finite forest has a weakly unimodal independence sequence):
  OPEN.** Untouched. Tier 1 is a proper subclaim of it and Tier 1 is open.
- **`E993-TGT-TREE`: OPEN.** Untouched. **`E993-UNIV-TREE-TRS2` remains REFUTED**
  (Kadrawi–Levit, order 26) and never regresses to OPEN; Galvin's non-log-concave trees
  stand and no log-concavity premise was imported anywhere in Cycle A1. In F1
  log-concavity is the **conclusion under test**, and both order-26 counterexamples were
  reproduced live inside the route's own `h = 3` and `h = 4` strata, with the exact
  registered margins, **before any null was reported**.
- **`E993-TGT-TRANSFER`: OPEN.** Untouched. `E993-TRANSFER-TO-FOREST` remains
  CONDITIONAL and is cited in F only as what the route does **not** attempt; no
  convolution closure of unimodal sequences is used anywhere, and the forest form of the
  `τ ≤ 12` statement is explicitly *not* claimed for exactly that reason.
- **Erdős #993: untouched.** No claim registered, advanced or refuted in Cycle A1 bears on
  it. **Closing G1 alone does not solve Erdős #993**, and nothing in this synthesis, in
  any adjudication, in lane B or in lane C may be read as suggesting otherwise.

**No counterexample to any tier was produced by any instrument, on any route, at any order
or rank, in Cycle A1.** All three returns, all six critiques and all three adjudications
return the negative call, and I concur with each on my own evidence. **The headline is
unresolved at this close; the typed line is carried once, under `## Continuation
ruling`.**

---

## Lean awards

The test is `SOLUTION-CONTRACT.md` §4 and the protocol's duty 4: a stable statement, a
closed dependency DAG at the exact scope, sufficient materiality; a uniform theorem, a
parameterized theorem with explicit threshold functions, or a reduction theorem in honest
conditional form qualifies; a fixed-band or fixed-rank result qualifies **only if named as
such**. **I fund exactly one award group.** Per the gate, the Stage 7 formalizer is
Sonnet 5 and the informal auditor and fidelity reviewer are Opus 5; repair limit 2 per
candidate.

**Lane B's `Bd` tail is NOT funded or counted here.** It ran in parallel under its own
protocol, closed `formally_verified` on 2026-09-22, and is cited in this synthesis only as
a band-ledger fact and as a grading precedent. It is not a Cycle A1 award.

### U-A1-1 — `FOREST-DELTA3-THRESHOLD-ORDER-12`, the `n ≥ 12` half. CONTRACT-READY.

**Exact statement**, reproduced character for character in three independent rebuilds:

```
@Erdos993G1.U1.forest_delta_three_pos_ge_twelve : ∀ {X : Type u_1} [Finite X] (F : SimpleGraph X),
  F.IsAcyclic → 12 ≤ Nat.card X → 0 < Erdos993G1.delta F 3
```

**Hypotheses:** exactly `F.IsAcyclic` and `12 ≤ Nat.card X`. `[Finite X]` alone is the
instance burden; `X` implicit. No connectivity, no rank, no excess. `IsAcyclic` throughout
and never `IsTree`, with ENTRY 150's per-component proof read directly, so **disconnected
forests are genuinely covered.**

**Scope.** The `n ≥ 12` half of `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` **only**. The
registered statement is a conjunction and the Lean theorem proves its first conjunct.

**Closed dependency DAG**, computed inside the kernel's own environment by the U
adjudicator's audit driver rather than inferred from any DAG table: **11,742 constants
total, 163 in this project's own namespaces** (auto-generated `._proof_*`, `._simp_*`,
`.match_*`, `._f`, `.eq_*` companions included); **`sorryAx` is NOT in the closure**,
independently of and more strongly than the `#print axioms` sweep;
`CritUC503F.pendant_delta` and `pendant_identity` **are** in it;
`ForestDelta2.forest_delta_two_lower` **is** in it while
`forest_delta_two_pos_ge_nine` **is not**; and **of the four `decide` calls exactly one is
in the closure**, `ErdosR25.CriticUC604FChain.L3_twelve_pos : 0 < L3 12`, with `L2_table`,
`L3_table` and `L3_thirteen_fourteen_pos` outside it as corroborating numerals nothing
depends on. **No open node.**

**Materiality.** A fixed-rank threshold theorem, uniform in the order with no horizon and
an explicit threshold — a parameterized theorem with an explicit threshold in the sense of
duty 4, **named as fixed-rank and never as a band result**. Not a repackaged identity
(the quantitative bound is new content, cross-validated against exhaustively computed
truth at every order 0–13) and not a null search. Its registry effect is a real grade
change on a registered VERIFIED claim, mirroring what C6-LA1 did at rank 2.

**Attribution, to go on the award's face exactly.**
- The **pendant identity in `Δ` form** is **critic-derived, r25 Cycle 5 critic C-U3-F**
  (`Crit.lean`, `Erdos993G1.CritUC503F.pendant_delta`), closing the step r25 Cycle 5
  **seat** U3 left as `pendant_identity_draft`, `sorry`. `PendantIdentity.lean` is
  byte-identical to C-U3-F's `Crit.lean`
  (`d8aae69d35b0539097275bd940490a5a5c88e1b2f075a4e4320049842b95a85e`, recomputed).
  **Independently and equivalently proved** by r25 Cycle 5 critic **C-U3-T**
  (`CriticPendant.lean`, `CriticUC503.pendant_delta_identity`), which states the identical
  theorem with the same binders and casts by a different proof —
  **corroboration, not the compiled dependency.**
- The **arithmetic chain** `ErdosR25.CriticUC604FChain` is **critic-derived, r25 Cycle 6
  critic C-U4-F**, whose own file header records that Cycle 6 **seat** U4 had concluded an
  enumerated 76-class order-8 base was necessary and that the critic found the base-free
  route instead.
- The imported **`forest_delta_two_lower`** is award **C6-LA1**, itself critic-attributed
  jointly to **C-U4-T** (contract form, quantitative cubic) and **C-U4-F**
  (component-corrected bound, ENTRY-176 instance), with seat U4 framing the question. Both
  declarations are byte-identical to the award source in statement **and** proof text
  (`5d8ab1f8…` over 33 lines, `798c6ef9…` over 5 lines, on both sides).
- **The seat's own** (this cycle's seat U1): the three strong inductions threading the
  pendant identity, the C6-LA1 import and the chain into one order-uniform argument, with
  the pendant identity invoked at `j = 0, 1, 2` and acyclicity re-derived at all six call
  sites via ENTRY 38; the exact `Δ_0` identity and the leaf cardinality bookkeeping,
  proved rather than assumed; `scaledChooseFour`, `edgeless_three_pos_of_ge_eight`,
  `B_pos_of_ge_nine` and `L3_pos_of_ge_twelve`, which make the chain's positivity **general
  in `n`** rather than the three numerals the kernel checks; and the assembly and
  compilation.

**Every excluded conclusion.**

1. **The sharpness half is EXCLUDED and is not carried for trees.** The registered
   statement's second conjunct — *sharp at 11, where `P_11` is the unique minimiser,
   `Δ_3 = −14`* — **stays `proved_informal`.** Three reasons, any one sufficient: the
   registered clause quantifies over **forests**, and C-U1-F's enumeration is **tree**
   scope, so carrying it against a forest-scope clause is exactly the FOREST/TREE transfer
   the fences forbid (C-U1-F says so itself, naming the disconnected case as genuinely
   open); the Lean object proves nothing at order 11, and formalizing the half would
   require a **verified isomorphism-complete enumeration of the 710 order-11 forest
   classes** — an enumeration object this method excludes by construction, so bundling the
   halves would make the award's own headline property false; and the half is now
   independently confirmed at **full forest scope, informally**, by the U adjudicator's own
   census, so no successor needs the tree result to stand in for it.
2. **No enumeration claim beyond this exact wording**, which replaces the struck
   certification and is the only form the award face may carry:
   > No enumeration over graphs, trees, forests or isomorphism classes occurs at any
   > order, and no `native_decide` occurs anywhere. No `Finset`- or `SimpleGraph`-typed
   > object is enumerated over a graph-indexed domain in any declaration of the closure.
   > The single kernel-evaluated numeral fact inside the closed dependency set is
   > `ErdosR25.CriticUC604FChain.L3_twelve_pos : 0 < L3 12` — a closed evaluation, in `ℤ`
   > arithmetic with no graph type in scope, of a recursive integer function at one
   > numeral, discharged by `decide` within the three standard axioms. The graph-theoretic
   > content is carried entirely by `forest_delta_three_lower`, which is proved for every
   > order by strong induction with no base case and no enumerated input.

   **Never "no `decide`", which is false.** This distinction from the registered informal
   proof — whose closing step *is* an exhaustive 76-class order-8 base — is the award's
   whole point, so it must be stated precisely or not at all.
3. **No tier, band, G1 tuple or headline moves.** `d`, `ν`, `τ` and `x(F) < r` enter
   nowhere. `Δ₃ > 0` is a **positivity** statement, the opposite sign from a no-recovery
   statement.
4. **It is never described as sharpening `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`** (an
   order bound is a different object, and the registry row says so), **never as "the run's
   first unconditional forest theorem"** (C6-LA1 holds that ground at rank 2), and **never
   translated into a `d`-band result** (the excess reading is a translation of a
   fixed-rank fact). It is independent of `E993-PAIR-RANK3-FOREST-MIN`.
5. **It does not move `E993-C13-I4-GT-I3`** (trees, order ≥ 12, `proved_informal`, Lean
   formalization open). The forest theorem strictly generalises it logically — every tree
   is a forest — but **a grade does not transfer across claim keys**, and that row stays
   where it is unless the controller runs a separate registration with its own
   specialization corollary, ruled separately.
6. **The order-11 add-on is not part of the award.** The seat assessed and **deferred** it;
   the adjudicator's 710-class census is adjudicator-derived, informal, and STATED not
   registered (see `## Successor-run recommendations` (e)).
7. **The internal theorems are not separately funded** unless the controller elects R8.

**Mandatory repairs (R1–R5 and R7; all are wording, scoping and capsule-contents repairs
— none is a mathematical gap).**

- **R1 — Scope the award and the registry row to the `n ≥ 12` half**, explicitly, on both
  faces, or the award over-claims a conjunction it proves half of.
- **R2 — Replace the enumeration certification with the exact wording above**, carry the
  closure fact that justifies it (one load-bearing `decide`, on `0 < L3 12`; three
  non-load-bearing), and **strike the false "grep … finds none" sentence wherever it is
  quoted.**
- **R3 — Fix the attribution faces.** Strike "both are attributed on the face of
  `PendantIdentity.lean`". Carry the four attributions above verbatim. **Neither
  `PendantIdentity.lean` nor `L123Chain.lean` names its run or cycle on its face — add the
  run id and cycle number to both file headers before the Stage 7 capsule is sealed**, so
  the attribution survives detachment from this run root.
- **R4 — State the import of record precisely.** Name
  `Erdos993G1.ForestDelta2.forest_delta_two_lower` as the **load-bearing** C6-LA1 import
  and record `forest_delta_two_pos_ge_nine` as **present-but-unused**; ship the
  byte-identity evidence (`5d8ab1f8…`, `798c6ef9…` on both sides).
- **R5 — Close the `L123Chain.lean` provenance link inside the capsule.** The claim "no
  statement or proof text changed relative to `CriticUC604FChain.lean`" is **unverified,
  not false**: the original lives under a route-only, directory-level grant at the r25
  root, and it was un-closable by **three** independent reviewers for that one reason. The
  Stage 7 capsule must carry the original **by exact path and full digest** so the
  formalizer and the independent auditor can run the byte-diff. **This is the one open
  provenance link in the whole award.** Mitigation already in hand: the mathematics the
  file encodes is re-derived four ways with no shared code path (the seat's generator,
  C-U1-T's hand computation, C-U1-F's instrument to order 2,000, the adjudicator's to
  order 5,000).
- **R7 — Correct the "34 checks" literal to 39** wherever the evidence section is quoted.
  The generator is a cross-check and not load-bearing to the compiled theorem, but a
  certification literal that contradicts its own shipped output must not reach an award
  face.

**Recommended before dispatch, the controller's to decide (R6, R8).** **R6 — rename the
seat-labelled namespace.** `Erdos993G1.U1.*` embeds a seat token and the terminal
declaration will be cited by fully qualified name in the registry forever; the parallel to
C6-LA1's content namespace is `Erdos993G1.ForestDelta3`, reported free in the computed
closure. **Rename before the award, never after**, checked against the frozen project
first: erratum `C5-E-h` records a real collision of this kind and gate ruling 5 freezes
`Erdos993G1.ThirdWide.cover_rank_bound`. **R8 — decide whether the award carries a
quantitative lemma.** C6-LA1 registered its quantitative bound as a lemma beside the
terminal theorem; the parallel here is `forest_delta_three_lower`. Note the asymmetry:
C6-LA1's lemma is a self-contained closed-form cubic, whereas `L3` has **no closed form**,
so registering it would put the recursive definition on the registry face. Either carry it
with that definition stated, or register the terminal theorem alone. **Ship the full
thirteen-line `AxiomCheck.lean` output in the receipt, not the eleven-line excerpt.**

**Registry effect, exactly.** `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`:
`proved_informal → formally_verified` **on the `n ≥ 12` half only**, contingent on the
group closing; the sharpness clause stays `proved_informal`. **This is the same split lane
B's `Bd` tail took this cycle (`r ≥ 6` formal, sharpness informal), and it is the
precedent to apply verbatim.** If the group does not close, the grade does not move — an
intention is not a grade. Repair risk judged low: the fragment already compiles clean from
three independent copy-outs at 8,662 jobs with identical axiom sets.

### Orientation T — `no award attempted`

**Reason, on three grounds any one of which is sufficient.** (i) **Materiality**: E-T-1,
the only candidate clearing stability and DAG closure, is a four-line immediate corollary
of `max(0,·)` monotonicity, `E_j ≤ 0` and an identity; both critics independently judge it
closer to an immediate corollary than to independent new mathematics; the seat declines to
register it; and **the return's own §6 shows the lemma is insufficient for the use it was
built for** — S2 and S3 are exactly its telescoped application and both are refuted. A
lemma whose only known application is refuted does not carry award-grade materiality.
(ii) **No carrier exists**: `SOLUTION-CONTRACT.md` §4 binds `formally_verified` to the
governed workflow over the G1 Lean definitions on `SimpleGraph` carriers, and this
orientation's object is a rational-valued certificate recursion with **no graph carrier at
all**; formalizing it would first require defining the entire clamped-greedy certificate
recursion in Lean and proving its equivalence to the registered `(P,Q,α,i)` recursion — a
large prerequisite no frozen contract funds and no seat has begun. (iii) **Gate ruling 6
is not met**: the return ships no Lean file, no theorem contract, no compiled fragment and
no import list against the G1 definitions; its artifacts are Python generators. **Nothing
here disturbs the run's existing formal state.**

### Orientation F — `no award attempted`

**Reason.** **E-F-1 is a null search over a finite class** — a very large, exhaustive,
carefully instrumented one whose horizon is the entire band, which is a real achievement,
and still not a statement the gate formalises. Three independent reasons: `SOLUTION-
CONTRACT.md` §4 states outright that **a null census is insufficient for any tier**; the
statement is **not uniform** in `τ`, in `d` or in the order (`τ = 12` fixed, ten order
values), and it does not even qualify as a "fixed-band result named as such", because a
fixed-band result of that kind is still a *theorem* about a band whereas this is an
enumeration of one; and **the dependency DAG is not closed** — completeness over the class
rests on Lemmas A–C at the r25 record's informal grade, and formalizing the census would
require formalizing that decomposition first, which would be the real theorem and is not
what this route produced. **The nearest formalisable object this orientation touched is
Lemma A–C itself** — the thin-tree skeleton decomposition, independently reimplemented six
times across r25 and this addendum and never written as a frozen contract. It is named as
a successor candidate, not funded here.

---

## Progress and stop-gate ruling

**The stop gate is armed.** A decisive event is a verified Tier 1 or Tier 2 theorem, a
verified reduction strictly shrinking the remaining class, or an exact counterexample. A
plateau requires **evidence of no material progress**; r25's six cycles each made material
progress, so a plateau needs **Cycle A1 itself** to show none.

**No decisive event.** No Tier 1 or Tier 2 theorem was verified — no Cycle A1 object even
carries `x(F) < r` or a G1 guard. **No reduction strictly shrinking the remaining class
was proved**: the window `[c(d)+1, m(d)−1]` is exactly where the r25 close left it, both
endpoints unmoved, and no further reduction from the ambient G1 guards was proved. **No
exact counterexample was found** — and this is the sharpest form of the finding available,
because the one route that could have produced one did the search exhaustively: a thin
tree with `τ ≤ 12` in the window would have been a decisive event, and the complete census
of the band returned **zero in-window log-concavity failures and zero recoveries at any
rank over 539,470,990 accepted instances**. The negative is now a complete-census negative
over that band rather than a partial one.

**Material progress: affirmed**, on all three orientations' independent assessments and on
mine. Six items, each new against the r25 terminal close and **none a horizon extension**:

1. **A candidate ready for the Lean gate**, contract-ready at this close rather than
   deferred — `SOLUTION-CONTRACT.md` §6(c) satisfied — and by a **different method** than
   the registered informal certificate, enumeration-free where that certificate closes on
   an exhaustive 76-class order-8 base.
2. **A chartered residue with a known cost taken to zero.** The `τ = 12` band went from
   44.40 % of order 26 open plus eight untouched orders, to **complete at every reachable
   cell of orders 26–35**, with the top order closed under this run's own instrument
   rather than by citation. No figure was overturned and no grade inflated.
3. **One new unconditional theorem uniform in `d`** (E-T-1), plus a fourth refuted
   strategy and — more valuable than the refutations themselves — **a stated structural
   reason** for why the whole family fails, rather than a bare "did not work."
4. **An exact parity localization of the binding family** on the matching band, replacing
   a single-point reading ("the minimum sits at the band bottom") with an exhaustively
   verified argmin at both parities, the binding family named (even `d` at `r = d+2`/`d+3`,
   minimum decreasing to 1.4405 at `d = 400`) and the band top shown to retain absolute
   slack `≥ 1.93` everywhere swept.
5. **The registered sharpness clause of the `Δ₃` threshold moved from partially checked to
   fully checked at its registered scope** — from 235 trees to all 710 order-11 forest
   classes with the unique minimiser `P_11` — adjudicator-derived, and STATED not
   registered pending a second read.
6. **Three certification defects found and struck**, two by critics and one by an
   adjudicator, none of which touches any mathematics.

**The honest counterweight, stated because material progress is not headline progress.**
**Not one of these advances touches the uniform residual no-recovery question.** T1's
object is a band-margin lemma still open on the whole Region II pre-absorption strip; F1's
is a null census over a finite class of thin trees at one fixed cover number, and a
complete census of a finite band is exactly as strong as a complete census of a finite
band; U1's is a fixed-rank positivity statement of the opposite sign in which `x(F) < r`
enters nowhere. **The run's headline position at this close is exactly r25's.** Two of the
three routes closed the object they were chartered to close, and neither closure was a
headline; the third hit the same mathematical wall r25 named, now named more precisely.

**Plateau: declined.** The condition requires evidence of no material progress and the
evidence is of progress, on four independent assessments. Cycle A1 is also the addendum's
only cycle, so the two-consecutive-cycles form of the test cannot be run here at all —
but I do not rest the ruling on that, because the substantive limb fails on its own.

**I name the plateau risk precisely, because it is real, and I adopt the T adjudicator's
test verbatim as the successor's signal.** Four consecutive closure attempts of the same
shape (S1, S2, S3 and the critic's S4) have now failed, and the Tier 3a obligation is
verbatim what it was at the r25 terminal close. **If a successor again returns only
refuted majorization variants and larger sweeps — no two-sided induction constructed, no
new potential function, no parity-split argument attempted — that is the plateau signal,
and it should be called then.** Evidence, however voluminous, is not progress toward that
obligation; only an argument is.

---

## Successor-run recommendations

Cycle A1 is the addendum's ONLY cycle. Everything below is written as **what a successor
run inherits**; nothing here is deferred Cycle A1 work. The addendum closeout (with lanes
B and C) and Ashton's pre-authorized scoped publication follow this close and are **not**
routes.

### (a) Whether this cycle changed the r25 terminal ruling on the charter's four outcomes

**It did not. The r25 terminal ruling stands, unchanged and unqualified:**

> **The experiment achieved ANOTHER FIXED-BAND RESULT, together with REFUTATIONS that
> fence the method. It did not achieve a uniform advance in the charter's sense, and it
> did not achieve a proved structural reduction of the remaining class.**

The ruling stands unless a Tier 1 or Tier 2 theorem or a proved reduction landed in Cycle
A1, and **neither did** — I say that plainly rather than by implication. No Cycle A1
object carries `x(F) < r` or a G1 guard, so no Tier 1 or Tier 2 statement could have
moved; and both window endpoints are exactly where the r25 close left them, so no proved
reduction strictly shrinking the remaining class occurred. The one grade change in
prospect — the `Δ₃` threshold's `n ≥ 12` half — is a **fixed-rank forest positivity
theorem uniform in the order**, which is neither a no-recovery statement nor a band
result, so it does not alter the outcome classification. Lane B's `Bd` tail gives the
`d = 5` band a **third** formally verified input of eight (correcting the r25 close's
count of three to two, erratum A1-E-b) and **the band's grade is unchanged at
`proved_informal` at its weakest link**: a count of formal inputs is not a grade. Cycle A1
adds refutations that further fence the method (S1–S4 and the structural reason) and one
complete-census negative, which is more of the same category the r25 ruling already names.

**And, stated because the publication packet depends on it: closing G1 alone does not
solve Erdős #993.** G1 is one wrapper configuration in one program; Tier 2 is a statement
about that wrapper; Tier 1 is a proper subclaim of forest unimodality below half the
order; forest unimodality is itself a subclaim of the open targets `E993-TGT-FOREST` /
`E993-TGT-TREE`; and **no claim in this run or this addendum bears on Erdős #993 itself.**

### (b) The exact remaining obligation of each route's object, as a successor inherits it

**T — `A1-T-01`, Tier 3a.** **ONE lemma, on Region II only**: a *lower* bound on
`Δ_j = φ_j(r) − φ_j(r−1)` propagating through every Region-II stratum of the
pre-absorption strip, equivalently `β_cell(d, α+1) > β_cell(d, α)` for every `(d, α)`.
Region I is a theorem; the absorbed cells are a theorem; **the pre-absorption strip of
Region II is the whole of what is missing**, and it is verbatim what r25 left. It must be
closed **by an argument**: the target inequality now has zero counterexamples across four
independent exhaustive sweeps, so further sweeping adds no information, and extending the
`d ≤ 400` horizon is explicitly not a route. Available as a proved building block: E-T-1,
**with the standing warning that it is not sufficient alone** — S2 and S3 are exactly its
telescoped application and both are refuted. **Do not attempt** `Q ≥ ρ_j P`, S1, S2, S3 or
S4. **Carry forward:** the parity-explicit scope sentence; the binding family (even `d`,
`r = d+2`/`d+3`); and the fact that the band top retains absolute slack `≥ 1.93` at every
`d` swept, so only the relative-location reading failed, never the absolute-slack one.

**F — `A1-F-01`, Tier 1 adjacent.** **The tree-side `τ ≤ 12` in-window decision is
DISCHARGED for orders 26–35.** What remains owed — and was named "also owed" by the r25
terminal synthesis — is **the forest side: a window instrument on the convolved
independence sequence of a multi-component forest with a `τ = 12` component.** It is
unbuilt by the seat, by both critics and by the adjudicator. **It is not a detail**:
`r_max` is a property of the whole forest's order, not of any one component, and
convolution moves ranks, so no amount of single-component evidence settles it. The only
prior evidence on the record is narrow and must be quoted as such — padding the **two
known witnesses** with isolated vertices to `m ≤ 3000`, with `K₂` blocks, or with each
other yields no in-window failure. **That is two trees, not a class.** Two smaller items:
orders **24–25** at `τ = 12` (`d ≤ 1`) lie outside the census and are minutes of the same
machinery; and the **standing in-window minimum `τ = 21` is unchanged**, so the live
frontier question is whether it sits at `τ ≥ 13`.

**U — `A1-U-01`.** **Nothing mathematical is owed.** The obligation is a governed
`lean-proof-workflow` run over exactly `Erdos993G1.U1.forest_delta_three_pos_ge_twelve`
and its closed dependency set — frozen theorem contract, independent informal audit,
kernel/axiom receipt, independent fidelity attestation, canonical close — with the Stage 7
capsule carrying the original `CriticUC604FChain.lean` **by exact path and digest** (R5),
and with the award face carrying the scoping (R1), the corrected enumeration wording (R2)
and the corrected attributions (R3). The provenance link in R5 is the single open item in
the whole award and it is a capsule-contents matter, not mathematics.

### (c) At most one successor route per orientation

**T — `S-T-A1-1 THE TWO-SIDED (SANDWICH) INDUCTION ON THE COUPLED PAIR.** Track
`φ_j(r−1)` and `φ_j(r)` **jointly** through Region II, maintaining simultaneously a lower
bound on `Δ_j` and an upper bound on `φ_j(r−1)`, with an explicit cross-term capturing
*how close the two trajectories already are* — which is precisely what every one-sided
majorization discards and precisely why S1–S4 fail. *What it could close in one cycle:*
the one-step lemma on Region II for every `(d,α)`, and with it — in one further step, by
the reduction and strictness pieces already unconditional in the record — top-cell
attainment, the band `d < r < K(d)`, the live cell `(3,4)` and the `d′ = 3` slice's last
rank. This is the T adjudicator's own first-ranked route and the one both critics'
evidence points at. *First step, cheap and not yet done by anyone:* the exhaustive
non-sampled `α`-sweep at both parities to `d = 400`, so the even/odd boundary is pinned
before the argument is built. *Noted but not carried, under the one-route cap:* the
adjudicator's parity-split alternative, which would prove the odd-`d` half first and
attack the even-`d` bottom cells as the residual; it is a genuinely different shape of
argument and would itself be a decisive event if it landed as a proved reduction.

**F — `S-F-A1-1 THIN-FOREST-CONVOLVED-WINDOW.** Build the convolved-sequence window
instrument and decide the forest form of the `τ ≤ 12` statement. Mechanism: for
`F = ⋃ F_i`, `I(F;z) = ∏ I(F_i;z)`, so `i_k(F)` is the convolution of the components'
sequences and `r_max(F) = ⌊(Σ|V(F_i)| − 2)/2⌋`; the instrument must compute `x(F)` and the
window **on the convolved sequence** and **must not import any unimodality or
log-concavity closure premise** — both are registered-refuted. Inputs now available that
were not before: this band's complete order-26–35 `τ = 12` component census, and the closed
`τ ≤ 11` bands. *What it could close in one cycle:* the forest half of the `τ ≤ 12`
statement, which is the only thing standing between the tree result established here and a
registrable forest statement at this cover number. *Cost:* the component polynomials are
already computable at roughly 14,000 instances/second on this host; the new work is the
convolution layer and the component-multiset enumeration, not the per-component DP. *Named
alternative, if a successor controller can afford only one F seat and prefers
decisive-event potential over closing an owed obligation:* the adjudicator's
`TAU-13-IN-WINDOW-FRONTIER` (orders 28–38, roughly 9–10 million classes, about 5–6× this
band's load), where **a thin tree with `τ ≤ 13` in the window would be an exact
counterexample** and would lower the standing minimum for the first time since r25 Cycle
4. I rank the convolved window first, consistently with the adjudicator, because it
discharges the chartered debt and unlocks a registration; the choice is the successor
controller's.

**U — `S-A1-U-1 FOREST-DELTA-K THRESHOLD, UNIFORM IN THE RANK.** Lift the
enumeration-free chain from `k = 3` to general `k`: prove `0 < Δ_k(F)` for every forest of
order `≥ n(k)` with `n(k)` explicit, by the same leaf recursion with a general-rank chain
`L_k(n) = min(edgeless(n,k), L_k(n−1) + L_{k−1}(n−2))`. The pendant identity is already
general in `j`, so it transfers unchanged and the induction glue is structurally
identical. *What it could close in one cycle:* the first **rank-uniform** forest positivity
theorem, an object of a different kind from everything this orientation has produced. *The
resisting point, named in advance:* `forest_delta_two_lower` is a rank-2-specific cubic
obtained by carrying ENTRY 176's argument symbolically, and a general-`k` chain needs its
own uniform quantitative bound at the bottom — that is where the route will resist. *Two
facts to start from:* the true thresholds are 9 at `k = 2` and 12 at `k = 3`, while
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` gives `n(k) ≤ (k+1)²` (10 and 16 at those
ranks), so the target is the gap between the chain's threshold and `(k+1)²`; and the
`k = 3` chain is **threshold-exact**, which is evidence the method is not merely
sufficient. **Fence: a rank-uniform forest positivity theorem is still not Tier 1** —
Tier 1 is conditional on `x(F) < r` and concerns the opposite sign. The U adjudicator's
second candidate, the threshold/sharpness registry split, is a registry-shape decision
rather than a mathematical route and I carry it under (e) instead, which keeps the
one-route cap clean and is consistent with the adjudicator.

### (d) The Stage 7 funding at this close

**Exactly one award group is contract-ready and I fund exactly one: `U-A1-1`, the terminal
declaration `Erdos993G1.U1.forest_delta_three_pos_ge_twelve` with its closed dependency
set (163 project constants), scoped to the `n ≥ 12` half of
`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`, subject to repairs R1–R5 and R7.**
`## Lean awards` above is the funding instrument: it carries the exact statement, the
hypotheses, the fences, the full attribution and every excluded conclusion, and a
formalizer is bound by that section in full. **Orientations T and F: `no award attempted`,
for the reasons recorded there.** **Lane B's `Bd` tail is not mine to fund and is not
counted as a Cycle A1 award**; it ran in parallel under its own protocol and closed
`formally_verified` on its own evidence.

### (e) Registrations and scope updates the controller should make at the addendum close

Each carries its **grade and attribution on its face**. Only the governed
`lean-proof-workflow` may write `formally_verified`. **I register nothing**; these are
recommendations, and the final keys are the controller's.

**REG-1 — `E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-12`, NEW.** Grade **`bounded_computation`
(complete census)** — not VERIFIED, not CONDITIONAL. *Face:* every thin tree of cover
number `τ = 12` and order 26–35 is free of in-window log-concavity failures at every rank;
the only two log-concavity failures in the band, `T(3,4,4)` (−378) and `W2` (−68), are
both at order 26, rank 13, out of window (`r_max = 12`), and both pre-registered. Complete
census of **539,470,990 accepted `(skeleton, D)` instances** over all **1,721,756**
`τ = 12` canonical-form skeleton classes and all **55** reachable `(order, h)` cells;
**124,073** materialised spot checks, **0** mismatches; exact integers; instance counts are
construction counts and are nowhere counts of isomorphism classes of final trees.
**Three limits on the face:** (i) orders 24–25 (`d ≤ 1`) are outside the census;
(ii) completeness over the *class*, as opposed to over the *construction*, rests on Lemmas
A–C at the r25 record's informal grade; (iii) **the forest form requires the
convolved-sequence window instrument, which is unbuilt.** *Attribution, layered and never
summed across nested windows:* seat F1 447,626,015 instances; critic **C-F1-T**
80,025,642 (critic-attributed); critic **C-F1-U** 4,489,714, **nested inside C-F1-T's
window and therefore not additional coverage**; the F adjudicator 11,819,333
(adjudicator-derived).

**REG-2 — `E993-R25-THIN-FOREST-NO-RECOVERY-TAU-LE-12`, NEW.** Same grade, same census,
same attribution: **no recovery at any rank anywhere in the band** — no `r` with
`x(T) < r` and `Δ_r(T) > 0`, evaluated directly on every instance and never inferred from
the failure predicate. **This key must carry limit (iii) on its face and must never be
read as covering multi-component forests.** Both keys were confirmed absent from the
360-row run-local registry by the F adjudicator's direct query by exact key.

**REG-3 — a SCOPE LINE on `E993-R25-MATCHING-BAND-REGION-DOMINATION`. No grade change, no
new key** (the seat declines one and the T adjudicator concurs). It carries: (i) **E-T-1**,
the Region-II sub-multiplicative upper bound, as a proved unconditional lemma uniform in
`d`, seat-derived; (ii) **S1/S2/S3** with their exact first-failure witnesses `(4,1,4)`,
`(5,1,6)`, `(5,1,7)` and **C-T1-U's S4** with its `d ≤ 100` horizon and first violation
`(10,14,11)` — all four named **refuted and not to be re-attempted in these forms**; and
(iii) **the parity-explicit scope sentence** ruled in the T adjudication, so no successor
cites the `α`-profile trend as parity-independent.

**REG-4 — three corrected literals on the same face.** *Fifteen* (not sixteen) manifest
rows; *160 rows = 153 valued + 7 null*; *18 records under case-insensitive normalization
over `statement`+`scope`+`aliases`* (case-sensitively, 13). No grade change.

**REG-5 — the four errata onto the registry faces**, sealed records never edited: A1-E-a,
A1-E-b, A1-E-c, A1-E-d. In particular the `d = 5` band's input ledger must read **two
formal of eight at the r25 close and three with lane B, grade unchanged
`proved_informal`** at the weakest link (input 2's general half, input 5) — and because
A1-E-b's over-count also sits in **two sealed A1 Stage 2 members**, the face must warn
that the figure is not to be read out of them.

**REG-6 — the U award's registry effect, CONTINGENT on the Stage 7 group closing.**
`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`: `proved_informal → formally_verified` **on
the `n ≥ 12` half ONLY**, with R1–R5/R7 discharged and R3's attributions on the face; the
sharpness clause stays `proved_informal`. **If the group does not close, the grade does
not move.**

**REG-7 — a scope update on that same row recording that the sharpness clause now has an
independent confirmation at its registered forest scope — but ONLY after the isolated
second read named below.** Until then it is STATED, not registered.

**REG-8 — the threshold/sharpness registry-split decision.** Decide once how a threshold
claim whose registered statement bundles a positivity half and a sharpness half is graded.
The pattern now has **three instances**: this award, lane B's `E993-R25-BD-TAIL-NEGATIVE`
(`r ≥ 6` formal / sharpness informal), and `E993-R25-FOREST-DELTA2-POS-ORDER-9`. Either
formalize sharpness halves as their own award groups, explicitly named as
bounded-computation certificates and kept out of enumeration-free awards, or rule them
permanently informal and split the rows so the grades never have to be bundled. Not a
grade change; a registry-shape decision that blocks a recurring grade-transfer hazard.

**REG-9 — the R6 namespace rename, before the award and never after.**
`Erdos993G1.U1.*` embeds a seat token in a name the registry will cite forever; rename to
`Erdos993G1.ForestDelta3` (reported free in the computed closure), checked against the
frozen project first — `C5-E-h` records a real collision of this kind and gate ruling 5
freezes `Erdos993G1.ThirdWide.cover_rank_bound`.

**Controller process items, not registrations.** (i) Snapshot the stage agents ledgers at
each seal, as r25 Cycle 5 already does for the registry and ledger, **or stop listing a
live ledger as a sealed member** (F Finding S1, U's drift finding, erratum A1-E-d).
(ii) **Widen the critic grant, or ship the digest in the critic capsule, for any file a
route may locate under a directory-level grant** — the `L123Chain.lean` provenance gap was
un-closable by three independent reviewers for that one reason. (iii) Grant wording: say
"rooted at or above" if that is what is meant. (iv) **Separate the reseal duty from the
member-verification duty in adjudicator dispatches** — conflating them drove two
adjudicators' and one critic's disclosures. (v) **Grant the run-local registry to any
critic asked to audit a registry sweep**; C-T1-F could not check the return's registry
claims at all while C-T1-U, with the same nominal capsule, did. (vi) Name the exact
directory holding each granted artifact, including `-replay` siblings (the `C4-E-a`
species, recurring).

**Lane B and lane C registrations are the controller's and are not mine.** Named only so
the ledger is complete: `E993-R25-BD-TAIL-NEGATIVE → formally_verified` for the `r ≥ 6`
half; and lane C's two new keys and two scope updates from the four `confirmed_with_repairs`
second reads (SR-H, SR-RES, SR-S1, SR-S2). I re-read none of it.

**Which adjudicator-stated compositions need an isolated second read before registration
(gate ruling 8) — my ruling.**

1. **The U adjudicator's full-forest order-11 enumeration** — 710 forest classes,
   `min Δ_3 = −14` attained uniquely at `P_11`, order-12 minimum +6, order-8 forest
   minimum −16 (attained three times, correcting anyone quoting −15, which is `P_8`'s own
   value), together with the `L3(n) ≤ min Δ_3` cross-validation at every order 0–13.
   **Adjudicator-derived: YES, it needs an isolated second read before REG-7 is made.** It
   is **not** part of the Stage 7 award (R1 excludes sharpness), so the second read does
   not gate the award and the two can proceed in parallel.
2. **The F adjudicator's completion of the census** — its own closure of the 13,798
   remaining classes at orders 27–32 and of order 35 (551 classes), i.e. the
   adjudicator-derived 11,819,333 instances inside REG-1 and REG-2. **YES, it needs one**,
   and specifically **REG-1 and REG-2 must not be registered with "complete census" on
   their face until it is done.** A concrete alternative the controller may prefer:
   register both keys now at the **Stage 4 horizon** — seat plus C-F1-T, i.e. 97.10 % and
   94.55 % of the two expensive strata at orders 27–32, with order 35 carried by citation
   to the r25 `t(12) = 551` record — and **upgrade the face to "complete" after the second
   read lands.** That keeps the registry honest at every moment and costs one Opus seat.
3. **The T adjudicator's own strengthening** — the exhaustive argmin sweep across
   `d = 3..40` plus seventeen larger `d` of both parities, and the band-top safety-ratio
   measurement (`≥ 1.93` at every band-top-minimized `d`). These are adjudicator-derived
   bounded computation. **If the controller puts them on the registry face as findings of
   record, they take a second read; if they appear only as the narrowing of a seat claim
   already on that face, they do not.** The rest of REG-3 does not need one: E-T-1 is
   seat-derived and independently reproduced four times, and S1–S4's witnesses are seat-
   and critic-derived and reproduced exactly by the adjudicator.
4. **Nothing in this synthesis is a composition of my own.** My arithmetic re-adds figures
   the adjudications establish and recomputes three contract fixed points from the
   contract's own identities; it states no new mathematical claim and registers nothing,
   so gate ruling 8 has no subject here from me.

---

## Seating finding

**This is the cycle's design deliverable, and I state it whatever it shows.** The design:
by Ashton's ruling of 2026-09-22 this cycle seated **routes AND critics on Claude Sonnet 5
(xhigh)**, with adjudicators, this synthesis and the Stage 7 reviewers on Claude Opus 5
(high) — the reverse of r25's standing ruling, which seated routes on Sonnet 5 and critics
on Opus 5. The r25 record against which it is compared is **seven consecutive recordings
that every advance moving a grade came from critic or adjudicator stages**: eleven of
twelve Cycle 6 routes carried critic-attributed advances; four of the six terminal awards
were critic-attributed in whole or in their load-bearing step; the band carry step was
proved in Lean by both F3 critics after the seat stopped at three `sorry`s; the general-`j`
positivity was proved by both U1 critics after the seat declared an obstruction that did
not exist; the uniform `Δ₂` lemma was compiled by both U4 critics after the seat concluded
a 76-class base was necessary. The r25 controller review named the confound itself: the
record cannot separate "the critic charter is where the work is placed" from "the seat
model is the limiting factor," because the charter never seated Opus on routes after Cycle
3 — and it recommended deciding the question by design, which is what this cycle is.

### Route by route

**T (`A1-T-01`) — a NULL recording, and this is the honest headline for this route.** **No
grade moved at all.** `E993-R25-MATCHING-BAND-REGION-DOMINATION` and
`-MATCHING-BAND-ABSORBING-RESIDUE` stay VERIFIED (re-confirmed, not newly proved);
`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays OPEN; the seat proposes no new registration
and the adjudicator endorses that. **There is therefore no grade-moving step on this route
to attribute to a seat or to a critic**, and the adjudicator says plainly that this is a
structurally different recording from r25's seven — where grades *did* move and the
question was who moved them — and that it must not be treated as a seventh comparable data
point without noting the difference. I adopt that. On the next-best axis, explicitly
labelled as such — **attribution of genuinely new content** — the two Sonnet critics
between them contributed more new content by volume than the return: symbolic proofs of
`ID1`, `ID2` and the leak identity (which the return only cites), four exhaustive sweeps of
the target inequality itself at horizons the seat never reached, the fourth refuted
strategy S4, and the cycle's one narrowing (the parity split, the single most consequential
critic finding on the route). **The seat contributed the only new theorem** (E-T-1), the
three refutations with their exact witnesses, the profile, and the discipline choices — one
`ρ`, one functional, never mixed — which the adjudicator verified by reading the whole
generator. **Every critic contribution was bounded computational or symbolic evidence;
none was an argument. Neither seat nor critic closed the open step.**

**F (`A1-F-01`) — the grade-moving step was SEAT-DERIVED.** The step that changes the
record is the exhaustive closure of order 26 at `τ = 12`, including the chartered
`h ∈ {6,7,8}` residue (764,513 classes, 141,263,643 instances), plus orders 33–34. It was
designed, implemented and executed **entirely by the seat before Stage 4 opened** — the
sealed Stage 3 return carries the complete order-26 table with `stratum_complete: true` in
every payload, and its digest is byte-identical in the Stage 3 manifest, the admission
record and the adjudicator's capsule. **Both critics re-verified the census and full strata
from scratch and found nothing to fix in it**, and the adjudicator's own independent replay
reproduced the seat's figures in every cell. **Both critics produced genuine, attributable
advances and neither was grade-moving**: two independently built extensions of an
already-disclosed partial residue (one strictly nested in the other) and one correction to
a single phrase of certification wording that altered no number. The **mechanism choice was
inherited** — specified by the r25 Cycle 6 F-adjudication and carried verbatim into this
cycle's allocation — so it is neither seat- nor critic-derived this cycle. The critic work
was strongest where it was **verificatory** (three from-scratch instruments, a
full-stratum ground-truth replay, a different-invariant cover check, a from-first-principles
re-derivation of the payload-digest rule) and, in one case, **forensic** (reading the
spot-check function rather than trusting its description). The seat's most valuable
non-mathematical contribution was the **precision of its partial reporting** — exact resume
indices, exact residue counts, deterministic enumeration order, `stopped_early_on_deadline`
shipped in the payloads themselves — which is what made both critic extensions and the
adjudicator's closure possible at all.

**U (`A1-U-01`) — SPLIT, and the split does not test this cycle's seating.** The
grade-moving **mathematics** is critic-derived and the grade-moving **formalization** is
seat-derived — **but the critics are r25's, not this cycle's.** All three imported
load-bearing pieces trace to critics: the pendant identity to r25 Cycle 5 critic C-U3-F,
closing the step Cycle 5 **seat** U3 left as `sorry`; the base-free chain to r25 Cycle 6
critic C-U4-F, after Cycle 6 **seat** U4 concluded an enumerated 76-class base was
necessary; and `forest_delta_two_lower` to award C6-LA1, critic-attributed jointly to
C-U4-T and C-U4-F. **Two of the three trace to critics closing a step the corresponding
seat had concluded it could not close.** This cycle's seat contributed the induction glue,
the general-in-`n` positivity work, the bookkeeping theorems proved rather than assumed,
and the assembly and compilation — real work, and the adjudicator found no place where the
return overclaims. **This cycle's critics supplied no mathematics the proof needed** — and
the adjudicator's own caution is decisive: **the route left no mathematical gap to advance,
so this route cannot distinguish "the critics could not advance it" from "there was nothing
to advance."** The one place a critic reached past the return is C-U1-F's deferred add-on —
a from-scratch enumeration of the 235 free trees of order 11 confirming
`min Δ_3 = −14` uniquely at `P_11`, with the disconnected case honestly left open — and it
landed short of the registered claim's forest scope, which the adjudicator then closed
itself.

### The comparison, and its limits

**What the comparison supports.**

- **On the one route where a grade moved by work done *this cycle* (F), the grade-moving
  step was seat-derived**, and both critics — on the same model as the seat — produced only
  non-grade-moving extensions of an already-disclosed residue and one wording correction.
  **That is a break in the r25 pattern, and it is the cycle's one clean data point.**
- **U does not test this cycle's seating at all.** Its grade-moving mathematics is again
  critic-derived, but from r25 critics seated on Opus 5 in earlier cycles. What U tests is
  whether a Sonnet seat, **pre-granted the right prior-critic assets by the controller**,
  can assemble and formalize them into a compiling, axiom-clean theorem — and it can,
  cleanly, with three independent rebuilds agreeing. That is a finding about **controller
  routing**, not about critic seating, and it is a useful one: the assets r25 never granted
  were the whole of what the route needed.
- **T is a null**, and a null is not a seventh-style data point in either direction.

**What the comparison cannot separate, stated so nobody over-reads it.**

- **Three routes is a small sample**, and only one of them (F) is a same-model
  seat-versus-critic comparison on a grade that actually moved this cycle.
- **The critic charter still says "attempt the open step," unchanged.** A shift in where
  advances come from could be a charter effect, a route-shape effect or a model effect, and
  this cycle changes **one** of those three variables. The r25 controller review named the
  same confound in the other direction; changing the model without changing the charter
  does not resolve it.
- **Route shape dominates the recording, and this is the most informative thing the cycle
  offers.** F's route was a bounded computation with a known cost and a *disclosed partial
  residue* — exactly the shape where a critic's marginal contribution is extending a sweep
  rather than finding a proof. U's route **arrived complete**, with no gap for a critic to
  fill. T's route was the one genuine open-argument problem, and there **neither seat nor
  critic closed it**, with both critics on the same model as the seat producing evidence
  and never an argument. **r25's seven recordings were made largely on open-argument
  routes; Cycle A1 supplies exactly one of those, and on it the r25 finding is neither
  confirmed nor refuted, because nobody closed anything.**
- **Model and effort cannot be separated here either**: routes and critics were chartered
  Sonnet 5 xhigh and adjudicators and synthesis Opus 5 high, and **no seat can self-inspect
  its runtime model or effort.**
- **One cross-cycle observation cuts against reading F as a general break**, and I record
  it because the U adjudicator raised it against its own route's convenience: this cycle's
  shape on the `Δ₃` theorem — a well-resourced seat, pre-granted the right assets,
  executing a multi-source assembly without live critic intervention — differs from r25
  Cycle 5's shape **on the very same theorem**, where the seat left a `sorry` and a critic
  supplied it. **In both shapes the single hardest mathematical insight traces to a critic
  rather than a seat.**
- **One capsule-design artifact affects what a critic can contribute independently of the
  model**: C-T1-F could not audit the return's registry claims at all because the run-local
  registry is not in the critic capsules, while C-T1-U, with the same nominal capsule, read
  it. Any future seating comparison must control for grant symmetry.

**The finding, stated as it falls and overclaimed in neither direction.** **Cycle A1
neither reproduces r25's seven recordings nor refutes them.** It supplies one clean
counter-instance (F: same-model critics, seat-derived grade-moving step), one route that
tests controller routing rather than seating (U), and one null (T). The design question the
r25 controller review posed — whether the critic charter or the seat model is the limiting
factor — **remains open on this evidence**. The single most useful thing the cycle shows is
structural rather than model-theoretic: **on this evidence, what determines whether a
critic moves a grade is whether the route left an open step of the kind a critic is
chartered to attempt.** A successor that wants to settle the seating question should
therefore design the **route shape** and not only the model — seat the same open-argument
route on both models in one cycle, or charter one cycle's critics with the "attempt the
open step" duty struck and compare — because a cycle of closed or computational routes
cannot answer it however the seats are seated.

---

## Continuation ruling

The stop gate found **no decisive event** — no verified Tier 1 or Tier 2 theorem, no
verified reduction strictly shrinking the remaining class (both window endpoints are
exactly where the r25 close left them), and no exact counterexample (the one search that
could have produced one returned a complete-census null over 539,470,990 accepted
instances) — and **no plateau**, since Cycle A1 made material progress on all three
orientations' independent assessments and on mine, and a plateau requires evidence of no
material progress.

**Had the authorization allowed another cycle, the portfolio would have warranted one**,
and I would name `S-T-A1-1` (the two-sided induction on the coupled pair), `S-F-A1-1` (the
thin-forest convolved window) and `S-A1-U-1` (the rank-uniform forest threshold) as its
three seats — one structural, one falsifying, one formal, each with its target named
exactly, its resisting point named in advance and its cost measured. **The addendum's
authorization is one cycle. The addendum closes at this close either way**, and what
follows is the addendum closeout with lanes B and C and Ashton's pre-authorized scoped
publication, neither of which is a route.

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

Model disclosure (restated per protocol, on one line):

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Artifact inventory

All paths are relative to the addendum run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22`.
**No path outside this run root is quoted anywhere in this document**; the two VerityOS
boot files and the r25 root are described by reference only. All arithmetic is exact
(`int` and `fractions.Fraction`); **no float enters any judgement**. **Standard library
only; no network; no package installs.** No hashed payload carries a wall-clock, PID or
host field. No graph object is constructed by me beyond the three contract controls, each
of which is an explicit acyclic or edge-disjoint construction verified by two independent
methods; **no isomorphism-class population is computed or claimed by this synthesis**, so
no distinct-count-up-to-isomorphism claim arises from me. Every generator ships with its
import list on its own face.

| Artifact | SHA-256 | Role |
|---|---|---|
| `scratchpad/S-A1/verify_seal.py` | `949db904f1db0020c400a379513b03120780647eda9902f2b0e0ec89cf7edb04` | **Shipped digested generator (1/2).** Imports `hashlib`, `json`, `os`. Recomputes the Stage 6 dispatch capsule's inner seal over canonical JSON minus `seal_sha256`; verifies all 28 members on `sha256` and `bytes`; recomputes the Stage 5 packet manifest seal and verifies its 14 members. |
| `scratchpad/S-A1/verify_seal.out.txt` | `c801655925e616abbd2e71318d0414611e3d8fdadfc1b8e4394a46fb9335a4a0` | Its output: inner seal MATCH; 28/28 members; Stage 5 seal MATCH; 14/14 members; zero failures. |
| `scratchpad/S-A1/synth_checks.py` | `80fc4519f339bc5a93bac2d00c60f05080e9297686b5d061439173048bb7bde4` | **Shipped digested generator (2/2).** Imports `fractions.Fraction`, `hashlib`, `json`, `itertools`. Every numeric claim this synthesis makes: the F attribution split and per-order/per-`h` reconciliations, the reachability algebra (55 cells), the T populations and the `(200,203,202)` safety ratio from its three exact inputs, the boundary identity at both parities to `d = 400`, the band input ledger, and the `SOLUTION-CONTRACT.md` §3 fixed-point controls by two independent methods each. |
| `scratchpad/S-A1/synth_checks.out.txt` | `94a2a41d26f646101146507b6daa55d3daade956922ca98192fb7998a935ceaa` | Its output: **51 checks, 51 pass, 0 fail**; internal `PAYLOAD_SHA256 = e790cf7cb8b9bb30bbefa512e45367870a12af7a49142962c7e6d861b616fd4a`. |

**Replay commands** (foreground; each completes in seconds on this host; never detached,
never backgrounded, never polled by PID):

```
cd <run root>/scratchpad/S-A1 && python3 verify_seal.py
cd <run root>/scratchpad/S-A1 && python3 synth_checks.py
```

**Verified before reading.** The 28 members of the Stage 6 dispatch capsule (28/28 on
`sha256` and `bytes`) and the 14 members of the Stage 5 packet manifest (14/14). Of the 28,
I read 20 in whole or in part and deliberately left 8 unopened, each named in
`## Identity and seal audit`; a member verified but not read is recorded as such rather
than implied to have been consulted.

**Read for this synthesis.** The two VerityOS boot files, by reference. The synthesis
protocol (read first, binding in full). The dispatch manifest and the Stage 5 packet
manifest. `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`. The Stage 6 controller-facts
record, the three Stage 5 controller-facts records, the Stage 1 gate and the allocation.
The three admitted adjudications, in full. `control/C4-CONTROLLER-ERRATA.json` and
`control/C5-CONTROLLER-ERRATA.json`. Under `sources/r25-terminal/`: the Cycle 6 cycle-close,
the terminal controller review, the Lean gate closeout, and three sections of the Cycle 6
synthesis by line offset. **Nothing else** — no raw return, no critique, no seat's or
critic's scratch, no `second-reads/`, no `runs/` directory, no `scratchpad/lane-*`, no lane
B or lane C material, no other adjudication, no other experiment root, no repository state,
no external source, and no VerityOS file beyond the two boot reads. `control/CLAIM-IDENTITY.run-local.json`
was within my grant and was **not** opened.

**Hygiene.** All computation under `scratchpad/S-A1/`; never `/tmp`, `mktemp`, `TMPDIR` or
a session scratchpad. No `find`, `rg`, `ls -R`, `cat` with a glob, or recursive listing was
run anywhere; the one `grep` invocation was restricted to a single named capsule member and
is disclosed. Every job ran in the foreground; no background job was started, so none
needed killing before this write. No sealed member was edited, and no file under any seat's,
critic's or adjudicator's scratch was modified. No Lean file was read, edited or touched and
no `lake` command was run. No file outside `scratchpad/S-A1/` and this `SYNTHESIS.md` was
created or modified. Child delegation forbidden and honoured.

**Rechecked before close**, as the protocol requires: the dispatch capsule seal and all 28
member digests (unchanged); the Stage 5 packet seal and its 14 members (unchanged); this
document's twelve headings against the protocol's list, in order and verbatim; the four
typed lines, exactly one occurrence of each; and the model-disclosure line, character for
character.
