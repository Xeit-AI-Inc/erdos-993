# Cycle 5 Neutral Synthesis

Neutral synthesis seat `S-C5`, Cycle 5, Stage 6. Run
`erdos-993-math-dre-20260914-r24-direct-favorable-leaf-aggregate`.
Governing protocol: `control/C5-SYNTHESIS-PROTOCOL.md`.

## Identity and seal audit

**Dispatch seal (reported as duty 1 requires):**

> `74ee86666b94c3e688dd68761f6e8f2e7d46dde1dbd4bba7cfd8da66fb05e1c0`

Recomputed canonically from `control/C5-STAGE6-DISPATCH-MANIFEST.json` by my own
instrument (`scratchpad/S-C5/verify_seal.py`), method cross-read against
`control/seal_packet.py`: remove only `seal_sha256`, serialize the remaining
payload with `json.dumps(sort_keys=True, separators=(",", ":"))`, no trailing
newline, SHA-256. The recomputed value is **identical** to the declared seal and
to the value required by my dispatch. `file_count` 7 equals the length of
`files`. All **7/7** declared members were re-digested against disk; every byte
count and every SHA-256 matched, none missing.

| Path | Bytes | SHA-256 | Result |
|---|---:|---|---|
| `control/C5-F1-STATEMENT-CAPSULE.md` | 5845 | `4672d421…31970` | match |
| `control/C5-STAGE5-PACKET-MANIFEST.json` | 2595 | `2ed324f9…f653d` | match |
| `control/C5-SYNTHESIS-PROTOCOL.md` | 3358 | `b19a606e…83ccd` | match |
| `control/PATH-CHECK-c5-stage6-dispatch.json` | 623 | `260e0382…1f167` | match |
| `cycles/cycle-5/stage5/adjudicators/F/ADJUDICATION.md` | 38975 | `00ee5106…c07d5` | match |
| `cycles/cycle-5/stage5/adjudicators/T/ADJUDICATION.md` | 21095 | `34f9f6e0…d8d7c` | match |
| `cycles/cycle-5/stage5/adjudicators/U/ADJUDICATION.md` | 46252 | `3f28c503…6e904` | match |

**Stage 5 packet seal, independently verified:**

> `7152b42d65c2a345ea3a8f1ab5df0b6d40955f2c7e1daa03f29e1f013c19d10d`

`control/C5-STAGE5-PACKET-MANIFEST.json` recomputes by the same canonical rule to
exactly that value, matching its declared seal and the value required by my
dispatch. `file_count` 13 equals the length of `files`; all **13/13** members
re-digested clean. The three admitted adjudications appear in **both** manifests
at **identical digests** (`00ee5106…`, `34f9f6e0…`, `3f28c503…`), so the
adjudications I reconcile bind to the sealed Stage 5 state and to the Stage 6
dispatch without drift. Verifier output captured at
`scratchpad/S-C5/verify_seal.out`, verdict `CLEAN` on both manifests.

Instrument digests: `verify_seal.py`
`9a0691a7dca512f4282f9fa77fc19d400ba460cfe90e6a06fd1a767db9388585`;
`verify_seal.out`
`264f60482fecc63df6b3683595697e335c5cf19c7888895cccb29cd0b769c7f9`.

**Path evidence.** `control/PATH-CHECK-c5-stage6-dispatch.json` reports 6 files
scanned, 0 files with findings, 0 findings, no pruned roots, run root correct,
and the checker's non-durable scratch root denied.

**Seal-chain note.** Each adjudicator reported its own capsule seal, and each
recomputed the Stage 4 packet to
`a7f41dabee2fff1557cbb4ec3e75b930bff7a568009b493c94a077b62163c178`
independently: T `39960e69…7cf11e` (15/15 members), F `74790b5c…b90470d`
(15/15), U `5a5dc309…5a6f4588` (15/15). Those capsule manifests are themselves
digest-bound members of the Stage 5 packet I verified above
(`d0cc1277…`, `a53225ff…`, `2903c4d3…`), so the three seats' self-reported seal
chain is corroborated at this tier without my reading any capsule member. Three
independent recomputations of one Stage 4 seal agreeing is stronger evidence than
any single seat's report.

**Read set (boundary compliance).** Mandatory boot authorities `verity.md` and
`identity/startup-protocol.md`; the sealed dispatch manifest and its seven
enumerated files; the run-root `SOLUTION-CONTRACT.md` and `SEMANTIC-CONTRACT.md`;
the sealed Cycle 4 synthesis `cycles/cycle-4/stage6/SYNTHESIS.md`; and
`control/seal_packet.py`, read solely to execute the canonical seal rule.
Nothing else. I opened **no** Stage 3 return, **no** Stage 4 critique, no failed
lineage (`control/failed-stage6-dispatch-1/`, `failed-stage5-dispatch-*`,
`failed-stage3-F3-attempt-1`), no late or post-seal artifact
(`control/late-post-seal-F2/`), no worker, critic, or adjudicator scratch, no
synthesis other than Cycle 4's, no manuscript, no repository state, and no
external source. I wrote only this file and `scratchpad/S-C5/`. No delegation
and no child agent was used.

**Stage 3 admission exception, recorded not relitigated.** The single exception
(`MISSING_SOURCE_SEAL`, seat T2) was weighed by the T adjudicator, which holds
jurisdiction: exception **affirmed**, binding **unique** to Stage 2 seal
`834f61b2…` because the operative packet carries 14 members while the superseded
36-route packet carries 13. F and U each recorded that no claim in their
portfolios depends on T2. The exception is a citation-format deviation and admits
no content beyond T2's own route. I take this on the T adjudicator's record; I
did not and could not re-verify it within my boundary.

## Reconciliation

The three adjudications are reconciled claim by claim, by scope and proof status.
**No verdict is averaged and no disagreement is settled by counting seats.** Where
two or three seats reach the same result from independent instruments, I record
that as corroboration and say which instruments; where one seat holds exclusive
jurisdiction, I record the other seats' abstention as abstention, not as assent;
and where the seats genuinely diverge, I surface the divergence rather than
resolve it downward.

### Claims on which all three concur, from independent instruments

**1. `(RI)` is exact at its stated scope, and it is a Cycle 4 product.** Every
seat verified the capsule's verbatim top-rank residual identity with an
instrument it built itself and found zero failures: T on 1486 residual rows
(orders 4–14, exhaustive over non-isomorphic free trees); F on 163
residual-class instances (orders 3–11); U on 280,391 labelled trees (`n = 3..8`,
87,833 residual instances holding), with its critics adding all 3,262
non-isomorphic residual trees `n ≤ 15` and 4,447 leaf-instances of equation (1).
Three seats, three evaluators, none importing the frozen r23 evaluator, zero
mismatches. All three also state plainly that `(RI)` is F1's Cycle 4 result, not
a Cycle 5 product. **Reconciled: retained as exact; attribution Cycle 4.**

**2. The residual hypothesis in `(RI)` is necessary, not decorative.** U's replay
found `(RI)` fails in **all 192,558** non-residual instances of its census. No
seat contests this. **Reconciled: necessary.**

**3. `(RC) ⟺ S(T, α(T)−1) ≤ 0` on the eligible residual class — a
reformulation, not a reduction.** T derives it in one line from `(RI)`
(`S = ell·M − W`, `(RC)` is `W ≥ ell·M`) and rules it unconditional on that
class; F reaches the identical conclusion independently inside its own portfolio
("`RC_holds` is a RESTATEMENT of `S_top ≤ 0`", zero `(RC)` ⟺ `S ≤ 0` mismatches
over 163 instances); U records the same disposition in its narrowed list. T
verified zero disagreements on 1486 rows, F on 163, and T's critics on 3261 and
694 rows. **Reconciled: exact, and target-equivalent by the Solution Contract's
own test ("Rewriting `S ≤ 0` … is only a representation").**

**4. The capsule's *unqualified* `(RC)` equivalence is FALSE.** All three seats
independently exhibit the same witness: `K_{1,2} = P_3` at `p = 1 = α−1`, a
top-rank residual row with `ell = 2`, `M = 1`, `W = 0`, `S = +2 > 0`, excluded
**only** by eligibility (`x(T) = 1`, so `x(T)+2 = 3 > 1 = p`; the live window
`[3,2)` is empty). T verified it in `ri_boundary.py`; F found it as the **unique**
positive residual-class row over orders 3–11; U reproduced it directly and
through C-U3-F. `(RI)` itself is unaffected. This is a **correction to a
controller capsule**, reached three times over from three read-isolated
portfolios, and I record it as the cycle's most robust single finding.
**Reconciled: the unqualified equivalence is false; the live-window eligibility
hypothesis `p ≥ x(T)+2` is load-bearing and mandatory in any downstream
statement.**

**5. No `(RC)` claim qualifies for an award, and none is asserted anywhere.**
T rules it explicitly; F confirms none is made in its portfolio; U's candidate is
`(RC)`-independent by construction. **Reconciled.**

**6. The mandatory controls reproduce exactly.** T22 at `p = 34`: order 91,
`α = 68`, `x = 32`, 67 favorable original leaves,
`S = −498754180547001418536`, marked summand `+212336130412243110`. T60 at
`p = 90`: order 243, `α = 182`, `x = 87`, 181 favorable,
`S = −1058142362147652597702654588268394677176033202323316960380`. Reproduced by
all three adjudicators' own instruments and by every critic that ran them.
**Reconciled: exact bounded controls, confirming positive marked summands inside
negative complete aggregates — which is precisely why pointwise and strict
per-part arguments keep failing.**

**7. No status transfers from literal ordinary-tree scope to governed scope.**
T ("no status transfers to governed `RTree`, `E993-BETA-AGG`, transport, or
Erdős #993"), F (transport-dormancy guard confirmed accurate and extended across
the whole orientation; T12 epistemic dormancy unchanged; no decoder attempted),
U ("no transport is asserted"). **Reconciled: transport dormant, unchanged.**

**8. No standing fence or refuted ledger claim was reopened or renamed.**
`E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, and
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` remain REFUTED; pointwise beta,
per-support beta, literal all-cut Hall, and the whole Cycle 4 refuted/narrowed
list are intact. T ruled specifically on the one live risk: T1's
`(RC)_reconstructed` reinstated the REFUTED `…FIXED-GAMMA-HALL` claim restricted
to top rank, under F1's open name; T rejected it under that name and admitted
its censuses only as bounded computation about a narrowed restriction of a
refuted claim, conferring no status. **Reconciled: no regression to OPEN.**

**9. Every seat returns the headline unresolved, `still_open`, with material
progress and no orientation plateau.** Concurrent but independently reasoned; see
the stop-gate section, where I weigh the reasoning rather than the count.

### Claims held by one seat under exclusive jurisdiction, with the others abstaining

The Cycle 5 capsules are read-isolated by orientation, so several duties fall to
exactly one seat. I record these as **jurisdictional**, and I record the other
seats' explicit refusals to rule as **abstention, not assent**.

| Claim | Ruling seat | Other seats |
|---|---|---|
| `C4-LA2` bridge supplied? | U: **NOT supplied** | T: "the U1/U2 bridges lie outside this capsule and I rule nothing"; F: "I decline to rule rather than rule without the evidence" |
| `C4-LA3` bridge supplied? | U: **partially — two of four named absences discharged, two stand** | T and F abstain as above |
| `TOP-RANK-RESIDUAL-IDENTITY` candidate | U: **candidate ready**, exact statement given | T: belongs to U-C5-03, "I rule nothing on it beyond the binding constraint"; F: "I neither award nor block it" |
| T2 admission exception | T: **affirmed**, unique binding | F and U record it as touching no claim of theirs |
| U1's named failure point (base vs branch numerator) | U: **rejected and corrected** | not in T's or F's boundary |
| `HasFrozenGuardedPSCMove` non-circularity | U: **rejected as circular** | not in T's or F's boundary |
| Post-seal F2 `m = 110` extension | F: **no standing**, four independent grounds | U noted the same event via C-U3-F, did not act |
| T1 `(RC)_reconstructed` alias defect | T: **rejected under that name** | not in F's or U's boundary |

Two of these deserve comment. First, on the `(RI)` contract, T and F abstained on
jurisdiction **and then each independently imposed the two fences U's contract
already carries** — the eligibility hypothesis, and no inheritance of the
unqualified `(RC)` equivalence. Convergent constraint from abstaining seats is
materially stronger than silence, and I weigh it that way in the award below.
Second, on `C4-LA2` and `C4-LA3`, no seat opposes U's ruling and no seat is in a
position to; U's ruling therefore stands as the run's ruling, and it blocks
rather than reopens.

### Genuine divergences, surfaced

**(a) Is `(RC)` "open" or is its route "retired"?** T rules route T-C5-01
**retired as unachievable as posed**: since any proof of `(RC)` is a proof of the
headline top-rank case, the charter's demand for a *non-target-equivalent*
injection cannot be met. U lists "`(RC)` in eligibility-qualified form" among
claims **explicitly left open**. F rules `(RC)` "neither proved nor refuted".

These are not in conflict, and the appearance of conflict must not survive into
the terminal cycle. They concern **different objects**. The *statement* `(RC)`,
eligibility-qualified, is **open** — and is exactly co-extensive with the
top-rank case of the headline, so proving it is proving that case. The
*Cycle 4 handoff item 3 route* — prove `(RC)` by a non-target-equivalent shadow
or injection argument — is **retired**, because its defining adjective is
unsatisfiable by construction. **Reconciled: `(RC)` open and target-equivalent;
the injection route closed as unachievable as posed; Cycle 4 handoff item 3 is
discharged not by proof but by a certified impossibility of its stated method.**

**(b) Where does the surviving obligation live?** T rules that all three of its
chartered obligations collapse onto the eligible top-rank residual class, and
that the **upper** guard, not the chartered lower guard, is the binding
constraint on the minimum-positive-row reducer (C-T2-F's sweep: the reduced lower
guard never failed for every leaf, and all 677 rows lacking an eligible leaf sit
at `p = α−1`). F, from the adversarial side and with no sight of T's portfolio,
localizes the **unprobed** region to the near-`α` end of the interior window,
quantifying the blind spot as T22's `−4487` at `p = α−1 = 67` against
`−4.99e20` at `p = x+2 = 34` — seventeen orders of magnitude across one window.
U keeps **three** live fronts: the `T_m` lower band, the non-singleton terminal
stratum, and the top-rank residual class.

T and F converge on the top rank from opposite directions — proof side and
falsifier side — which is the strongest structural signal the cycle produced and
which neither seat could have observed alone. U's broader front list is not a
contradiction: T's ruling is about *which guard fails in the reducer*, while U's
lower band is about *completing U8's family sign theorem*. Different objects,
both live. **Reconciled: the consolidated obstruction is the eligible top-rank
residual class; U's two other fronts survive as genuine but subordinate, and
U itself rules the `T_m` band's honest terminal outcome may be named debt.**

**(c) The grade of U2's leaf-to-support binding.** U's own critics split:
C-U2-T calls it "exact, genuinely new, genuinely C4-LA3 item 2"; C-U2-F calls it
"trivial under one reading, false under the other." U resolved by disambiguation
rather than by splitting the difference, and I adopt that resolution: the
formula is **exact under the original-leaf reading of `q_s`** and **false under
the decoration reading**, with the exact witness `double_star(0,5)` at `p = 5`
giving `−20` against the true complete aggregate `−24`, because the degenerate
`c_1` is itself an original leaf the decoration count misses. U's own grading —
exact, but of **grouping strength** — is the honest one and I retain it.
**Reconciled: exact under one reading, rejected under the other; grouping
strength; not award-grade.**

**(d) Evidence-weight discipline.** All three seats independently downgraded
work: T struck a sign-inverted conclusion, a false verbatim quotation, and a
spliced collision certification; F withdrew a census literal, a dual-selector
certification, family labels, a "deterministic replay" grade, both digest
literals, and a T60 universal; U admitted nothing of U1 on the route's own
authority after its scratch directory proved absent, and rejected U1's T22/T60
disclaimer as a **false certification** — the two mandatory controls being
precisely in scope, since T22 and T60 *are* `T_m` instances (`m = 22`, `m = 60`)
whose audited rows lie **inside** U1's own band. F names the pattern explicitly:
across all three of its routes "the mathematics survived and the certification
did not," and rules it a property of the run's reporting discipline rather than
of any seat. I record this as a **cross-orientation finding**, since three
read-isolated seats reached it independently. It is the strongest argument for
ADJ-F's proposed `F-C6-03` terminal certification audit.

**(e) One factual corroboration across the seal boundary.** C-U3-F reported
member `cycles/cycle-5/stage3/returns/F2/RETURN.md` drifted on disk; F
adjudicated the same event as the already-reverted post-seal F2 mutation, with
the sealed bytes `463113ea…` restored and both critics re-verifying against the
sealed hash. U noted it and correctly declined to act, the member being outside
its capsule. **Reconciled: one event, correctly handled, no standing for the
unsealed version, no residue.**

## Exact established results

Nothing below is promoted. Bounded computation, conditional antecedents,
target-equivalent rewrites, and mechanism refutations remain what they are.

### Exact universal statements at literal ordinary-tree scope (new this cycle)

1. **Leaf-to-support binding (aggregate authority).** For any finite tree and any
   eligible rank, `R_v = R_{s_v}` literally; and for leaves `v, v'` sharing a
   support `s`, the transposition `(v v')` is an automorphism of `T` fixing `s`,
   so `T − v ≅ T − v'` and `H_v ≅ H_{v'}`. Hence `a_v`, `b_v`, `B_v` are
   support-uniform and
   `S(T,p) = Σ_s q_s · 1[d_s(p) < 0] · g_s(p)` **with `q_s` the number of
   original leaves at `s`**. Proved by automorphism, not computation; verified by
   the U adjudicator on 366 support fibres (124 multi-leaf, zero non-uniform) and
   on T22 at `p = 34` (23 fibres, zero non-uniform). *Exact; grouping strength;
   closes C4-LA3 item 2 mathematically, which Cycle 4 recorded as absent.* The
   decoration reading of `q_s` is **false** and is rejected.

2. **`(RC) ⟺ S(T, α(T)−1) ≤ 0` on the eligible top-rank residual class.**
   Immediate from `(RI)`. Universal on that class, established by two seats
   independently. *A reformulation, not a reduction; target-equivalent by the
   Solution Contract's own test.*

### Exact identity retained at its stated scope (Cycle 4 product, re-verified)

3. **`(RI)`, the compulsory-leaf top-rank residual identity**, at the F1
   capsule's verbatim form. For a finite tree with `α(T) ≥ 2` in the top-rank
   residual class (every leaf in every maximum independent set),
   `S(T, α−1) = ell·M − Σ_{B ∈ I_{α−1}(T)} ( |B ∩ L| − Σ_{s ∈ B} λ(s) )`.
   Residual hypothesis **necessary**. Triply re-verified this cycle with zero
   failures. *Attribution: Cycle 4 route F1, not a Cycle 5 result.*

### Exact closed forms at fixed-family scope

4. `K_2`-core (double star), `q_1, q_2 ≥ 1`:
   `I(T;z) = (1+z)^{q_1+q_2} + z(1+z)^{q_1} + z(1+z)^{q_2}`.
5. `P_3`-core exceptional (`q_c = 0`):
   `I(T;z) = (1+z)^{q_1+q_2+1} + z(1+z)^{q_1} + z(1+z)^{q_2} + z^2`.
   Both reproved independently by two critics and verified by the U adjudicator
   for all `q_1, q_2 ≤ 8`.

### Exact witnesses and refutations

6. **`K_{1,2}` refutes the unqualified `(RC)` equivalence.** `ell = 2`, `M = 1`,
   `S = +2 > 0`, residual, excluded only by eligibility. Triply independent.
7. **`double_star(1,5)` at `p = 5` refutes strict per-support negativity for
   `K_2` cores.** Eligible (`x = 3`, `α = 6`, `x+2 = 5 ≤ 5 < 6`); the `q_s = 1`
   support gives `(a_v, b_v, B_v, g_v) = (−5, −4, −4, 0)`, complete aggregate
   `−35 < 0`. The U11 singleton method does not transplant; **the failure is of
   strictness, not of sign**. The `g_s = 0` locus is localized at `q_s = 1`,
   where the sign-indefinite term cancels exactly and never dominates
   (max `g_s = 0` across 1,691,538 `K_2` summands).
8. **T22 = `T_22` and T60 = `T_60`**, both `T_m` instances with audited rows
   inside U1's lower band; U1's exemption disclaimer is a false certification.
9. **`path_graph(6)` at `p = α−1 = 2`** has `α(T−d) = α` at both leaves:
   ineligible **and** outside the residual class, inside F1's successful
   upper-guard split. Not a falsifier of `(RC)`.
10. **Under F1's convention, T2's own T22 `p = 34` data gives `D_d ≤ 0`** with
    `Elig_d` holding (`34 ≤ 34 < 67`): `D_d = −107037219527712428500` and
    `−129239254277177428167`. Vacuous for `(RL+)`, since `S(T22,34) < 0` is not a
    positive row. T2 refutes nothing.
11. **At `t_family(2)`, `p = 6`**: `b_v − B_v = |C_p(v)| − |C_{p−1}(v)|`
    leafwise, aggregate `−117`; 48 same-tag images, **0 cross-tag images**, 6
    undefined sources, all 6 tagged by the singleton-witness leaf 2; the 6
    collisions are same-tag and tie-break-removable (maximum matching 48/54; Hall
    holds on the full-deletion class).

### Bounded computation (exact integers, no universal content)

12. **The order ≤ 14 region is closed exactly**: 5446 non-isomorphic trees,
    10620 eligible rows, **zero positive complete aggregates**, **zero rows
    carrying any positive summand**, maximum aggregate **−12** at the order-7 row
    `x=2, α=5, p=4, favorable=4`. Field-for-field identical across F1, C-F1-U,
    and the F adjudicator's own instrument. Rows by order
    `{7:4, 8:6, 9:32, 10:116, 11:294, 12:805, 13:2528, 14:6835}`.
    **Binding restatement:** the exhaustive component is 5446 trees / 10620 rows;
    the figures "6262 trees / 16561 rows" are **run-wide totals** across sweeps
    (a)–(e). No downstream artifact may cite "6262 trees of order ≤ 14".
13. **The `T_m` homogeneous lower band `x_m ≤ q < ⌊3m/2⌋` is empty for every
    `m ≤ 21` and every odd `m` checked; first non-empty at `m = 22`; widths 1
    (`m = 22..39` even), 2 (`m = 40`), 3 (`m = 60`).** Verified independently by
    both the F and U adjudicators.
14. **That band is non-vacuous and infinite, of width ≈ 0.055·m** (ratios 0.0500,
    0.0545, 0.0542, 0.0550 at `m = 40, 110, 240, 1600`; 88 rows at `m = 1600`).
    *Cycle 4 handoff item 1 covers a genuinely infinite region and cannot be
    approached by extending the present scans.*
15. Zero in-band sign violations to `m = 240` (1360 rows beyond F2's 57, C-F2-U),
    to `m = 199` (948 pairs, C-U1-T), and to `m = 380` (3,719 pairs, C-U1-F),
    **with no zero rows**, so the strict `> 0` test cannot have silently passed a
    boundary case.
16. All-index `T_m` block identity with `Δ_N(−1) = −1` retained and load-bearing:
    2,652 pairs (C-U1-T) and 3,315 pairs to `m ≤ 39` (C-U1-F), zero failures.
17. Marked-leaf summand of `T_m` strictly positive **at the bottom eligible rank
    only** (`p = x(T_m)+2`) for `m ∈ {22,24,26,28,30}` and every `m` in `31..34`
    checked; zero at odd `m ∈ 15..29`; negative for `m ≤ 14`. In **every** such
    row the complete aggregate is strictly negative. At `m = 22`, exactly **1 of
    34** window rows has `g > 0`.
18. Decorated-core census: **2,332 distinct** eligible rows (not 2,415 — that is
    an evaluation count; overlap is exactly 83 rows over 36 parameter pairs),
    zero positive and zero zero-valued complete aggregates; plus 1,963,488
    (C-U2-F) and 7,430 (C-U2-T) further rows, none positive.
19. `(RI)`/`(RC)` censuses, zero failures throughout: 280,391 labelled trees
    `n = 3..8` (87,833 residual hold, 192,558 non-residual fail, **8,345 eligible
    residual — the class is non-vacuous**, none positive); 3,262 non-isomorphic
    residual trees `n ≤ 15`; 1486 residual rows orders 4–14; 163 residual-class
    instances orders 3–11; 80,993 eligible top-rank and 16,424 eligible residual
    rows to order 17; 3261 and 694 rows on the `Wsum − ell·M = −S` identity.
20. Orders 2–13 eligible-row census, 2287 trees / 3785 rows, zero positive;
    correctly scoped, this establishes only that a positive eligible row requires
    order **≥ 14**.

**No new universal theorem, no new exact identity, and no new conditional
reduction toward the headline sign was established by any orientation this
cycle.** The two new exact universal statements above are a regrouping and a
reformulation. That is the honest summary, and all three seats say a version of
it in their own words.

## Refuted or narrowed mechanisms

Consolidated across the three portfolios. Every item below is a narrowing of a
*mechanism*; none narrows the headline, and none is promoted.

**Rejected under their proposed names or attributions.**

- `(RC)_reconstructed` **rejected as F1's `(RC)`**: it is a `Γ_actual(T,p)` Hall
  condition with `λ(s)`, `L`, `ell`, `i_α` and the residual hypothesis all
  absent, and it reinstates the REFUTED ledger claim
  `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` restricted to top rank, under
  an open name. Admitted only as bounded computation under its own narrowed
  description; confers no status; **no regression to OPEN**.
- **The shadow/injection proof route for `(RC)` is retired**, target-equivalent by
  construction. See divergence (a).
- **U1's T22/T60 exemption rejected as a false certification**; both are `T_m`
  instances and both audited rows are in-band; the route's mandatory-control
  obligation is **unmet**.
- **U1's named failure point rejected and corrected**: the base block numerator
  `2q+1−3m ≤ −1` is negative at *every* in-band point; branch numerators are
  non-negative at the band's top (where the band first becomes non-empty) and go
  negative only strictly below it, first at `m = 40, q = 58`, and at
  `m = 60, q = 87`. The diagnosis was wrong in both directions.
- **U1's unshipped evidence rejected as evidence**: `scratchpad/c5-U1/` absent,
  no digest resolves, nothing admitted on the route's own authority.
- **`HasFrozenGuardedPSCMove` rejected as a non-circular frozen relation**: it is
  the bare existence of the configuration to be classified, carrying the guard
  the C4-LA3 block review already named insufficient.
- **The decoration reading of the aggregate-authority formula rejected**:
  `double_star(0,5)`, `p = 5`, `−20` against the true `−24`.
- **The unqualified `(RC)` equivalence rejected as FALSE**, at `K_{1,2}`.
- **T1's `path_graph(6)` falsifier rejected as out of class**; "18 trees" (step 2
  ships 20) and "exhaustive eligible-window" (top rank only) corrected.
- **T2's Work item 3 conclusion struck as sign-inverted**, and its "Obligation
  (verbatim)" struck as a false literal appearing in no sealed member.
- **T3's cited collision struck as a spliced false certification** (the true
  partner of `(4,{0,2,6,8,9,10})` is `(4,{2,5,6,8,9,10})`, not the cited source);
  the cross-tag coincidence story rejected — **the cross-tag branch never fires**;
  "recurs at every arm of every `T_m`, `m ≥ 1`" rejected.
- **F1's census literal rejected as attributed** (see result 12).
- **F3's "deterministic replay" grade and both digest literals withdrawn**
  (`fbfa5ccd…` unreproducible by construction via a wall-clock `elapsed_seconds`
  field; `b1088fd2…` is the digest of the text without its written trailing
  newline, the file being `520d10c4…`). Computation retained at
  replayed-by-critic grade only.
- **F3's T60 universal withdrawn**: the interior window is 93 rows, 8 were
  checked, and attempt 1's "sampled" label was dropped in v2 — the certification
  strengthened while the evidence did not. Narrowed to the 8 rows. The omitted
  rows contain **stronger** instances of F3's own finding (`p = 89` and `p = 91`
  are further capacity violations, `p = 89` the largest).
- **F2's dual-selector certification withdrawn for family (b)**, where 927 of
  1287 rows carry no mechanism value — precisely the family the obligation aimed
  at.
- **F2's family (b) labels withdrawn**: it is pendant-decorated `K_2`-dumbbell
  and `P_3`-tripod proxies at the scanned ranges and **nothing more**. It may not
  be called condition-(A), terminal, or decorated-core in the U11 sense;
  condition-(A) is **untested**; 156 "P3" rows have `K_2` cores; "decorations
  1..6" misstates the tripod. **Cycle 4 handoff item 2 is untouched on its
  adversarial side.**
- **The post-seal F2 `m = 110` extension ruled to have no standing**, on four
  independent grounds (sealed bytes govern; no critic replay; immaterial;
  strictly subsumed by C-F2-U's `m = 240` extension). Cited nowhere.
- **F3's payment-capacity finding fenced and non-elevated**: a total-capacity
  comparison already fenced as target-equivalent, and dimensionally trivial —
  each violating row has **exactly one** positive `g_v`, the marked leaf, so a
  coefficient magnitude is being compared against a cardinality cap. "VIOLATED"
  overreads; no new fence.
- **Census literals corrected**: "2,415 eligible rows" is an evaluation count
  (2,332 distinct); "2,535 pairs" conceals an undeclared `3m+5` window (honest
  counts 2,652 and 3,315).

**Narrowed, with the successor target named.**

- **The U11 singleton-core method** fails on `K_2` cores by *strictness*, not by
  sign. Surviving target: `g_s ≤ 0` for all-parameter `K_2`, exceptional `P_3`,
  and condition-(A) cores, **plus at least one strict support per eligible row**,
  which suffices for strict aggregate negativity.
- **Termwise block positivity in the `T_m` lower band** was already refuted in
  Cycle 4 and is re-confirmed. Surviving target: **joint non-strict** signed
  domination of the negative base block. Two seats reached the same structural
  reading from opposite sides — *the available arguments prove strict statements
  and the truth is non-strict* — and I record that as the cycle's sharpest
  cross-route synthesis.
- **U1's `T_m` bridge narrowed to informal, four-of-five lemmas
  (`tm_alpha_and_whole_arm` omitted), and conditional** on both-orbit
  favorability, which is proved only for `q ≥ ⌊3m/2⌋` — U8's already-awarded
  upper half, i.e. **outside the band the route exists to attack**.
- **T3's `refuted` verdict narrowed** to same-tag minimum-witness deletion only,
  itself largely covered by the Cycle 4 one-witness payment fence. The
  irreducible residue is undefinedness on the 6 zero-degree sources tagged by a
  singleton-witness marked leaf (`W_v = {root}`).
- **The chartered lower guard displaced by the upper guard** as the binding
  constraint on the minimum-positive-row reducer.
- **F2's `T_m` symmetry literal repaired and restored**, not withdrawn: proved
  exactly by automorphism by C-F2-U after resting on two spot checks.

**Explicitly not refuted, and left open.** The literal interior-window aggregate;
the `T_m` lower-band sign; all-parameter `K_2`/`P_3`/condition-(A) core signs;
the PSC move relation; `(RC)` in eligibility-qualified form; the reduced lower
guard; universal qualifying deletion; a selector-faithful sign-independent
payment rule; literal-to-governed transport; `E993-BETA-AGG`; Erdős #993.

## Headline verdicts

Exact evidence grades. **No status transfers from the literal face to the
governed face, and none is asserted anywhere in this cycle.**

| Face | Verdict | Exact evidence grade and scope |
|---|---|---|
| **Literal interior-window favorable-original-leaf aggregate** (`AGG_literal`: `S(T,p) ≤ 0` for every eligible `x(T)+2 ≤ p < α(T)`) | **`still_open`** | Two new exact universal literal statements this cycle — the leaf-to-support binding (grouping strength) and `(RC) ⟺ S(T,α−1) ≤ 0` on the eligible residual class (target-equivalent) — plus the Cycle 4 identity `(RI)` re-verified exactly by three independent instruments, three exact mechanism refutations with named witnesses (`K_{1,2}`, `double_star(1,5)`, singleton-witness sources), and bounded computation closing orders ≤ 14 exactly. **No universal proof. No fully guarded positive complete aggregate.** Every positive object exhibited anywhere this cycle is a positive *summand* inside a negative aggregate (T22's `+212336130412243110`), a *zero-valued* summand (`double_star(1,5)`), or a positive row *outside the live window* (`K_{1,2}`, excluded by eligibility). |
| **Governed `RTree` aggregate** | **`still_open`** | **No Cycle 5 content whatever.** No governed universal theorem was established, attempted, or claimed by any route in any orientation. Literal results do not transfer automatically. |
| **Semantic literal-to-governed transport** (`TRANSPORT_literal_to_governed`) | **`not_established`** | **No Cycle 5 content.** No authenticated, directionally adequate, summand-preserving transport theorem or decoder exists or was attempted; no decoder was built. T12 epistemic dormancy stands unchanged. The transport-dormancy guard was independently confirmed accurate by all three orientations. Nonexistence of a decoder remains unproved; aggregate equality alone does not recover typed support data. |
| **Governed `E993-BETA-AGG`** | **`still_open`** | Neither the literal theorem, nor a governed theorem, nor the required transport is closed. **No lower-scope result is promoted.** Per `SEMANTIC-CONTRACT.md`, no status moves from face 1 to face 2 without face 3, and face 3 is `not_established`. |
| **Erdős #993** | **`unresolved`** | The sealed Cycle 5 evidence supplies no theorem and no counterexample at the full problem scope. |

Unchanged from Cycle 4 on every face. The change is in the *map*, not in the
status: see the stop-gate section.

headline_resolved: no

## Lean awards

### Ruling on the new candidate: **AWARDED**

**Award: `TOP-RANK-RESIDUAL-IDENTITY` (F7 collapse ∘ `(RI)`), literal
ordinary-tree scope.**

The U adjudicator ruled it a ready candidate; T and F abstained on jurisdiction
and each independently imposed exactly the two hypothesis fences the candidate
already carries. No seat opposes it. I award it at the exact statement below,
and only at that statement.

**Exact statement.** For a finite simple graph `G` on a finite vertex type with
decidable equality and decidable adjacency, assume:

```text
hyp-tree      :  G.IsTree
hyp-alpha     :  2 <= G.indepNum
hyp-eligible  :  x(T) + 2 <= G.indepNum - 1
hyp-residual  :  every leaf of G belongs to every maximum independent set of G
```

Then, with `p = G.indepNum - 1`, `L` the leaf set, `ell = |L|`,
`M = i_{G.indepNum}(G)`, and `lambda(s)` the number of leaf neighbours of `s`
extended by zero off supports:

```text
S(G, p) = ell*M - sum_{B in I_p(G)} ( |B ∩ L| - sum_{s in B} lambda(s) )
```

**Hypotheses, each load-bearing.** `hyp-tree` is retained; the one attempt to
drop it survived only on a tree census, so removability is **unproved**.
`hyp-alpha` is restored from F7's own Lean binder
(`(hAlpha : 2 ≤ G.indepNum)`), which U3's prose citation had dropped.
`hyp-eligible` is **mandatory**: without it the statement reads as licensing the
capsule's unqualified `(RC)` equivalence, which is **false** at `K_{1,2}`; it
costs nothing, 8,345 eligible residual instances remaining in the census.
`hyp-residual` is **necessary, not decorative**: 192,558 of 192,558 non-residual
instances fail `(RI)`, so omitting it yields a false theorem.

**Why it qualifies.**

- **Stable statement.** Frozen verbatim from the F1 capsule's `(RI)`, with two
  hypothesis corrections forced by adversarial attack — one of them a correction
  to a controller capsule's own wording, reached independently by all three
  orientations.
- **Closed dependency DAG at its exact auxiliary scope.** Three F7 domain nodes,
  six reused digest-bound F7 definition nodes, and seven new definition nodes
  (`def-support`, `def-leaf-set`, `def-leaf-degree`, `def-H`, `def-R`,
  `def-indep-sets-card`, `def-aggregate`), with hypotheses `hyp-tree`,
  `hyp-alpha`, `hyp-eligible`, `hyp-residual`. **F7 discharges exactly the
  `F = leafSet` step**, so the favorable set never enters as an assumption — the
  composition is what makes the DAG close.
- **The base award is verified, and its receipts were re-digested.**
  `THEOREM-CONTRACT.yaml` `9faa81ad73f1dec562b84a8c9a3173ff2b1565ff4b3f80c350d6f297d3358090`;
  `LeanProject/LeanProof/Main.lean`
  `e2bc48690fe44b769687461ac8bfad867b6710cca93c6de81bd1ac7ad05d253a`;
  kernel receipt
  `760881ace78c6f74ae1c2f1252bbc9c3f4887c4c5360cd92ea445d5c9310644c`;
  fidelity receipt
  `9f5b6985e797d5a2046d4c72683b0cff6b4da96f2ea4395d19baeecf679c8f2f`.
  Axioms exactly `[propext, Classical.choice, Quot.sound]`; no `sorry`, `admit`,
  or `native_decide`.
- **Materiality.** It is not a repackaged identity in the excluded sense. Its
  conclusion is an **equality**; it does not restate `S ≤ 0`; and it replaces a
  sum of deletion differences over an *a priori unknown* favorable set by a
  closed statistic over `I_{α−1}(G)` across the entire top-rank slice. That is a
  strict reduction in the data the obligation requires, and it composes with an
  award already formally verified.
- **`(RC)`-independence.** No `(RC)` node, no inequality, no sign. The protocol's
  "no `(RC)` claim qualifies" is respected by construction, not by exclusion.
- **Corroboration this synthesis can add that no single seat could.** `(RI)` was
  verified to zero failures by three read-isolated seats with three independently
  written evaluators, none importing the frozen r23 evaluator, over disjoint and
  overlapping census ranges. That is the strongest empirical support any
  statement carries in this run.

**Fences the Stage 7 package must carry, and excluded conclusions.** The
conclusion is an **equality** and must never be stated as, weakened to, or
accompanied by an inequality. All four hypotheses must appear explicitly.
Nothing in the package may assert or inherit: `(RC)` in any form; the unqualified
`(RC)` equivalence; the reduced lower guard; universal qualifying deletion; any
sign or nonpositivity claim about `S`; any `Γ`/Hall reformulation; literal-to-
governed transport; `E993-BETA-AGG`; or Erdős #993. The award is at **literal
ordinary-tree scope only** and transfers nothing to governed `RTree` scope.
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-BETA-TARGET`, and
`E993-BETA-AGG-SUPPORT` remain REFUTED and are neither reopened nor renamed.

### Ruling on the Cycle 4 blocked awards: **neither reopened; both remain blocked**

**`C4-LA2` — bridge NOT supplied.** The block review required a formal,
hash-bound bridge from the literal `T_m` graph to its coefficients, deletion
polynomials, tagged original-leaf orbits, selectors, and complete aggregate. U1
delivered an **informal** bridge, missing one of five lemmas
(`tm_alpha_and_whole_arm`), **conditional** on a selector hypothesis proved only
outside the target band, with **no shipped artifact and no resolvable digest**,
and accompanied by a **false certification** about the two mandatory controls. An
award whose bridge cannot be replayed is exactly the failure the block exists to
prevent. **A new digest-bound capsule could bind nothing of it in Cycle 6**,
because no digest resolves.

**`C4-LA3` — partially supplied; not enough.** Of the four named absences, **two
are discharged and two stand**. Discharged: the exact original-leaf
tagged-summand and complete-aggregate binding (item 2), supplied mathematically,
proved by automorphism and independently verified; and the frozen first-descent
convention, bound verbatim to r23 and acceptable. **Not supplied:** the complete
frozen guarded PSC relation (the
offered predicate is circular on the block review's own test), and the canonical
literal-tree representation (a route-proposed convention with no source
authority, orders 1 and 2 not stated separately, and a leaf definition wider than
r23's degree-exactly-one original leaf at order 1). It is also **not supplied
procedurally**: no hash, no replay command, no control run, and the route's
pre-fix evaluator failed T22 (`−318622202487856989596` against
`−498754180547001418536`), the bug being caught by a critic rather than by the
controls the route never ran. **Ruling on bindability:** item 2's *mathematics*
is self-contained and could be bound by a new digest-bound capsule in Cycle 6 **as
a lemma**; item 2's *route artifact* could not, being unhashed and uncontrolled;
and the **award** could not, two of four named absences standing and neither
reachable from source authority in scope. `C4-LA3` stays blocked.

### Everything else excluded from the award set

No T-orientation award and no F-orientation award this cycle — neither
orientation proposed one, and both ruled explicitly that nothing in their
portfolios qualifies. Specifically excluded: every bounded null search however
clean (the order ≤ 14 census, the band scans to `m = 380`, the 2,332-row
decorated-core census, the 1.96M-row extension); `(RC) ⟺ S ≤ 0`, a
target-equivalent reformulation; F3's `RC_holds`, a repackaged identity; F3's
payment-capacity finding, target-equivalent and already fenced; U1's `T_m`
bridge, informal, incomplete, conditional, and unshipped; U2's leaf-to-support
binding, exact but of grouping strength with unmet controls and unhashed
evidence; U2's closed forms, fixed-family identities; `HasFrozenGuardedPSCMove`,
circular; and every mechanism refutation, boundary example, corrected sign, and
struck certification recorded above. `(RI)` alone is not awarded as a Cycle 5
result — it is Cycle 4's; what is awarded is the composed, hypothesis-corrected,
`(RC)`-independent contract named above.

## Progress and stop-gate ruling

The armed stop gate is applied to the **Cycle 4–5 comparison window**. Per the
Solution Contract and the synthesis protocol, a plateau requires **evidence of no
material progress across the window**; absence of a headline proof is
insufficient. A decisive event is a verified proof, an authenticated positive
complete aggregate, or a central structural theorem closing the named
obstruction.

**No decisive event occurred.** No verified proof of `AGG_literal`; no positive
complete aggregate satisfying every guard anywhere in nine routes, eighteen
critiques, and three adjudications; no central structural theorem closing the
obstruction. Every positive object found is a positive summand inside a negative
aggregate, a zero-valued summand, or a row outside the live window.

**Material progress across the window is established, by change to the proof
state rather than by additional nulls.** All three seats returned material
progress `yes` and orientation plateau `no`; I do not take that as a vote but
weigh the reasoning, and I find the following changes are real, are established
by replay rather than self-report, and did not exist at Cycle 4 close:

1. **Three obligations became one.** Cycle 4 handed T three distinct bridges
   (handoff items 3, 4, 5). Item 3 is the headline top-rank case restated,
   exactly, from `(RI)`. Item 4's binding constraint is the **upper** guard, whose
   failure class is that same residual class. Item 5's candidate rule fails at
   singleton-witness sources, its collisions tie-break-removable and its chartered
   cross-tag branch never fired. **The T orientation now carries one obligation
   where it carried three.**
2. **A chartered route was certified unachievable as posed**, not merely
   unfinished: no non-target-equivalent proof of `(RC)` can exist, because `(RC)`
   *is* the top-rank case. That is a permanent constraint on the route space.
3. **Cycle 4 handoff item 1 was certified non-vacuous and infinite**
   (width ≈ 0.055·m, 88 rows at `m = 1600`). It might have been empty; it is now
   known to be genuine **and** known to be unreachable by extending the present
   scans. That changes what the surviving routes must do.
4. **The order ≤ 14 region is closed exactly**, triply replicated. Small-order
   counterexample hunting is finished.
5. **A new exact universal literal statement was proved by automorphism** — the
   leaf-to-support binding — closing C4-LA3 item 2 mathematically, which Cycle 4
   recorded as absent.
6. **A proof method was eliminated with an exact witness and its successor
   named**: `double_star(1,5)`, `g_s = 0`; the U11 singleton method fails on
   *strictness*, not sign; the successor is `g_s ≤ 0` plus one strict support.
   The same strict-versus-non-strict diagnosis independently emerged for the
   `T_m` band. Cycle 4 listed these as simply open; the cycle now explains **why**
   the obvious attack fails and **what** replaces it.
7. **A controller capsule was corrected**, three times independently: the
   unqualified `(RC)` equivalence is false, and eligibility is load-bearing.
8. **A Lean award candidate went from unstateable to awarded.** Cycle 4 expressly
   held F1 outside the award set; a `(RC)`-independent fragment of it is now
   awarded with a closed DAG composing onto a formally verified theorem.
9. **The unprobed region was localized and quantified**: the near-`α` end of the
   interior window, with the `−4487` versus `−4.99e20` gap at T22 making the
   magnitude of the blind spot explicit. Cycle 4 did not know where the
   adversarial effort was missing; Cycle 5 does.

**The honest debits, recorded plainly.** The load-bearing interior-window
obligation is **no closer to proof** than at Cycle 4 close. No orientation proved
a theorem toward the sign. The cycle's two new universal statements are a
regrouping and a reformulation. U1 shipped nothing and its scratch directory does
not exist; U2 ran neither mandatory control and shipped a bug fix the controls
would have caught; all three F routes had certification literals narrowed or
withdrawn, and F3's flagship universal collapsed to 8 of 93 rows. Reporting
quality regressed even as the map improved, uniformly enough across nine seats
that it is a property of the run's discipline rather than of any seat.

**Two warnings, independently arrived at, that bind the terminal cycle.** The T
seat records that this is the last cycle in which a no-plateau ruling is
available to it on eliminative progress alone. The F seat records that a fourth
bounded null census over the same regions **would** be a plateau and should be
recognized as one rather than run. I adopt both as standing constraints on
Cycle 6 route design and reproduce them in the portfolio below.

**Ruling.** The progress above is change to the proof state — exact arguments,
exact witnesses, a certified impossibility, a structural resizing, and an awarded
contract — not additional null searches. The plateau condition, which requires
evidence that the surviving routes made *no* material progress, is not met.

material_progress: yes

plateau: no

## Cycle 6 route portfolio

**Cycle 6 is the terminal cycle** (Ashton, 2026-09-17). Every route below must
close, or name its debt honestly, within one cycle; none is a speculative
program, none reopens a fence or a blocked award, none claims `(RC)`, and none
touches governed scope. The portfolio is consistent with the three adjudicators'
next-route allocations and preserves their orientation boundaries.

**Consolidation observed.** Five of the nine routes below target the top-rank /
near-`α` region from three directions — proof (T), falsification (F), and
formalization (U). That convergence is the run's clearest structural signal and
was not visible to any single seat.

### Orientation T — prove the surviving obligation

1. **`T-C6-01 RESIDUAL-CLASS-CLASSIFICATION`.** Attack the single surviving T
   obligation structurally rather than by injection: characterize the **eligible**
   top-rank residual class (`p = α−1 ≥ x(T)+2`, every leaf in every maximum
   independent set) and prove `S(T,α−1) ≤ 0` on it by classification, in the
   manner of U11's terminal classification, or delimit the largest subclass on
   which it is provable. *Closes as* a scoped universal theorem on a named
   subclass, **or** a certified statement that the class is not thin, with exact
   growth counts across orders 4–17 (16,424 eligible residual rows are already
   inventoried, and 8,345 eligible residual instances are known at `n ≤ 8`), the
   obligation named as debt.
2. **`T-C6-02 UPPER-GUARD-ADMISSIBLE-REDUCTION`.** The minimum-positive-row
   reducer fails **only** through the upper guard `p < α(T−d)`. Replace leaf
   deletion with a reduction that cannot drop `α` — leaf-with-support deletion, or
   a contraction — and prove both reduced guards and a well-founded measure
   decrease, so `(RL+)` reaches the residual class. *Closes as* a reducer with
   proved guards, **or** an exact minimum-order row where every admissible
   reduction fails with both values shipped, **or** the debt named with its exact
   failing class.
3. **`T-C6-03 SINGLETON-WITNESS-SOURCE-PAYMENT`.** The payment program's only
   surviving obstruction is the zero-degree sources tagged by singleton-witness
   marked leaves (`W_v = {root}`); collisions elsewhere are tie-break-removable
   and Hall holds on the full-deletion class. Determine whether those sources can
   be paid from outside the witness-deletion class by a sign-independent rule,
   with an explicit distinctness audit against the **Cycle 4 one-witness payment
   fence performed first**. *Closes as* a payment rule at ordinary-tree scope, a
   refutation on a guarded row with both values, **or** a certified ruling that
   the Cycle 4 fence already subsumes the class — which closes the route as
   settled debt.

### Orientation F — falsify, and protect the record

4. **`F-C6-01 NEAR-ALPHA-WINDOW-POSITIVE-HUNT`.** The one region no F route
   probed, and the region T and U both identify as the consolidated obstruction.
   Search the **top** of the interior window — `p` near `α−1`, where aggregates
   are smallest in magnitude — across exhaustive order-15/16 trees and every
   designed family already built, with the mechanism value computed on **every**
   row (lift `REL_ORDER_LIMIT`, or state the cap as unmet). Must ship its
   generators. *Closes as* an exact positive complete row with full guard
   evidence, **or** a correctly stated bounded null over the region that mattered.
   **If only one F seat is available, this is the one to run.**
5. **`F-C6-02 U11-STRATUM-FALSIFIER-PROPER`.** Redo family (b) against the
   **frozen** PSC and condition-(A) definitions, with both selector predicates
   computed per row, all-parameter `K_2` and `P_3` including the `b = 0`
   sub-family and the exceptional clause. This is the only route that tests the
   adversarial side of Cycle 4 handoff item 2 at all. **Controller precondition:**
   the frozen definitions must be supplied at dispatch; if they are not, the route
   must **return that as its finding** and must not substitute a proxy — the exact
   failure mode of this cycle.
6. **`F-C6-03 TERMINAL-CERTIFICATION-AUDIT`.** An audit of every literal the
   terminal close will cite, given that certification-literal overclaim over sound
   mathematics recurred across all nine seats. Verify each surviving figure
   against a shipped generator, restate the corrected census figures, and name the
   remaining debt. Not mathematics; **closable by construction**; runs alongside
   either route above and protects the run's final record. It also enforces the F
   seat's own warning: **a fourth bounded null census over already-scanned regions
   must be recognized as a plateau rather than run.**

### Orientation U — formalize, and close or name debt

7. **`U-C6-01 TOP-RANK-RESIDUAL-IDENTITY` formalization (highest value;
   closable).** Freeze the awarded contract above with digests, then formalize the
   seven new definitions and the two double-counting bijections against the F7
   vocabulary at its verified digests. Carry all four hypotheses; conclusion an
   **equality**; no `(RC)`, no inequality, no sign; no `sorry`/`admit`/
   `native_decide`; kernel and axiom verification, hostile statement-fidelity
   review, and canonical close per the Solution Contract. **This is the run's one
   genuinely closable award in a terminal cycle.**
8. **`U-C6-02 NON-STRICT-TERMINAL-STRATUM-SIGN` (closable).** Abandon strict
   per-support negativity, refuted by `double_star(1,5)`, and prove `g_s(p) ≤ 0`
   for all-parameter `K_2`, exceptional `P_3`, and condition-(A) decorated cores,
   together with at least one strict support per eligible row — which suffices for
   strict aggregate negativity. The closed forms are exact and the `g_s = 0` locus
   is localized at `q_s = 1`, so the remainder is a finite case analysis with an
   explicit strictness witness. **Requirements:** state orders 1 and 2 separately;
   use r23's degree-exactly-one original leaf; run T22 and T60 as controls; ship
   SHA-256 and a replay command; report distinct-row counts. **The frozen guarded
   PSC *move relation* is deliberately not allocated a route** — it requires source
   authority that does not exist in scope and should be named as **permanent debt**
   at the terminal close.
9. **`U-C6-03 TM-LOWER-BAND-BY-DOMINATION` (attempt, then name debt).** Prove
   joint **non-strict** signed domination of the negative base block by the
   positive branch blocks across the whole band, preserving both selector
   predicates, all original-leaf multiplicities, and `Δ_N(−1) = −1`. Use the
   corrected diagnosis: base numerator `2q+1−3m ≤ −1` at every in-band point;
   branch numerators non-negative at the band's top and negative only strictly
   below it (first at `m = 40`). **Mandatory:** supply the fifth lemma
   `tm_alpha_and_whole_arm`; prove both-orbit favorability **inside** the band
   rather than assuming the upper-half result; run T22 (`m=22, q=32`) and T60
   (`m=60, q=88`) as the in-band controls they are; ship every artifact with
   digests. *If domination does not close*, the honest terminal outcome is to
   record the band as **named debt** with its exact width law (≈ 0.055·m) and its
   verified violation-free range — **not** to extend the scan.

### Distinctness and cross-orientation notes

Routes 1/4/7 attack one region by three different means (structural
classification, adversarial search, formalization) and are genuinely distinct
mechanisms, not three views of one method. Routes 2 and 9 are distinct objects
(reducer guards versus a family sign theorem) despite both touching the guard
structure: the T seat's finding that the *lower* guard is not the reducer's
binding constraint does **not** discount route 9, which completes U8's family
theorem rather than the reducer. Routes 3 and 8 both concern strictness at a
distinguished locus but on distinct objects (a payment rule versus per-support
sign on decorated cores). Route 6 is disciplinary and composes with any of the
others.

## Continuation ruling

Cycle 5 is closed. The stop gate found **no decisive event** and **no
evidence-backed plateau**, so it does not fire in either direction. Cycle 6 is
the **terminal** cycle by Ashton's boundary of 2026-09-17, and `continue: yes`
here means exactly that: proceed to that one terminal cycle under the portfolio
above, which closes with the controller's independent check and evaluation of the
whole run. It authorizes nothing beyond Cycle 6.

**Exact earliest honest continuation obligations, carried forward unchanged in
substance and sharper in form:**

1. **Prove `S(T,p) ≤ 0` for every eligible literal row `x(T)+2 ≤ p < α(T)`, or
   exhibit a fully guarded exact positive complete aggregate** with the complete
   tree, exact eligibility proof, every favorable original leaf, every summand,
   and a positive total. Nothing less discharges the literal face. The three live
   fronts are the eligible top-rank residual class (`p = α−1`, now the
   consolidated obstruction), the `T_m` lower band `[x_m, ⌊3m/2⌋)` (non-empty only
   for even `m ≥ 22`, infinite, width ≈ 0.055·m), and the non-singleton terminal
   stratum (`K_2`, exceptional `P_3`, condition-(A) decorated cores).
2. **`(RC)` in eligibility-qualified form is open and target-equivalent.** It may
   be proved only as the top-rank case of the headline itself; no
   non-target-equivalent route to it exists. It must never be asserted in a
   Stage 7 contract.
3. **The frozen guarded PSC move relation and the canonical literal-tree
   representation require source authority that does not exist in scope.** Name
   them as permanent debt at the terminal close rather than pursue them.
4. **Literal-to-governed transport is to be treated only after the literal
   theorem closes.** Any later transport must be authenticated, directionally
   adequate, and summand-preserving. Governed `E993-BETA-AGG` and Erdős #993
   remain separate obligations and receive nothing from this cycle.
5. **Reporting discipline is now a first-class obligation.** Every Cycle 6 seat
   must ship generators, SHA-256 digests, and replay commands; must run T22 and
   T60 as controls; must state distinct-row counts rather than evaluation counts;
   must finish background jobs before its return is final; and must not
   strengthen a certification without strengthening its evidence.

continue: yes

## Artifact inventory

**Written by this seat, and only these:**

- `cycles/cycle-5/stage6/SYNTHESIS.md` — this file, the sole synthesis output.
- `scratchpad/S-C5/verify_seal.py` —
  `9a0691a7dca512f4282f9fa77fc19d400ba460cfe90e6a06fd1a767db9388585`;
  independent canonical seal recomputation and per-member re-digest for both
  manifests, written from the canonical rule, importing nothing from the run's
  tooling.
- `scratchpad/S-C5/verify_seal.out` —
  `264f60482fecc63df6b3683595697e335c5cf19c7888895cccb29cd0b769c7f9`;
  captured output, verdict `CLEAN` on both manifests.

**Read (dispatch and its seven enumerated members, all digest-verified):**
`control/C5-STAGE6-DISPATCH-MANIFEST.json` (seal
`74ee86666b94c3e688dd68761f6e8f2e7d46dde1dbd4bba7cfd8da66fb05e1c0`),
`control/C5-F1-STATEMENT-CAPSULE.md`, `control/C5-STAGE5-PACKET-MANIFEST.json`
(seal `7152b42d65c2a345ea3a8f1ab5df0b6d40955f2c7e1daa03f29e1f013c19d10d`),
`control/C5-SYNTHESIS-PROTOCOL.md`,
`control/PATH-CHECK-c5-stage6-dispatch.json`, and the F, T, and U Stage 5
adjudications.

**Read (boundary extensions named in the protocol and dispatch):**
`SOLUTION-CONTRACT.md`, `SEMANTIC-CONTRACT.md`,
`cycles/cycle-4/stage6/SYNTHESIS.md`. Read solely to execute the canonical seal
rule: `control/seal_packet.py`. Mandatory VerityOS boot authorities: `verity.md`
and `identity/startup-protocol.md`.

**Not read:** any Stage 3 return, any Stage 4 critique, any failed or superseded
lineage, any late or post-seal artifact, any worker, critic, or adjudicator
scratch, any synthesis other than Cycle 4's, any manuscript, repository state,
conversation record, or external source.

**Modified:** no source, control, manifest, protocol, return, critique,
adjudication, prior synthesis, or any file outside the three paths above. No
delegation and no child agent was used.

Reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat
cannot self-inspect its runtime model/effort — stated on dispatch-record
authority.
