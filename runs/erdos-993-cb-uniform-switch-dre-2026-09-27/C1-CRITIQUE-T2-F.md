# Critique

Critic `C-T2-F` (orientation F, falsify), r31 Cycle 1 Stage 4. Assigned return: seat `T2`, route `C1-T-02`, mechanism token
`LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS`, orientation T.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. For this seat I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem. The host injected the root
`CLAUDE.md` and the user memory index into context. I did not fetch them and did not use them (disclosure 1 below).

**Read-boundary and process disclosures.**
1. The harness injected `/Users/ashtonsperry/VerityOS/CLAUDE.md` and the auto-memory index into my context. I did not fetch or use them.
2. The harness moved my first instrument run to the background after it exceeded 600 s. An over-large binomial range in Part A
   caused the delay. I stopped it with `TaskStop` (task `b0s65gg6g`), not by literal PID, because learning the PID would have
   required a process listing, which the rules forbid. I read the harness's own output file for that task, which held only
   "[killed]". I used no output from that run and reran the instrument in the foreground with the range corrected.
   No background job is running at the time of writing.
3. I ran a non-recursive `ls` of `scratchpad/c1-T2/`, the return's inventoried artifact directory, which is inside my grant.
   I ran no `find`, `grep`, `rg` or recursive listing.
4. I read `sources/authority/CLAIM-IDENTITY.json` for the alias check. It is a `sources/` member and its digest is listed in
   `sources/SOURCE-DIGESTS.json`. I did NOT read `control/C1-WORKER-COMMON-BRIEF.md`; I applied its rules as the dispatch restates them.
5. I imported the frozen r30 exact simplex (`sources/r30/instruments/c6/T2/inherited/simplex.py`) as a SEARCH DEVICE only.
   Every claim below rests on my own exact DP verifier or on a Farkas certificate that I checked by direct integer arithmetic.
   No claim rests on the solver's output.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-T2-F.md` has SHA-256 `4d6c46780c4bb9029c3f0de9a1b64e805ab90c667fae5da908d5ae3ebca479a8`,
  which matches the digest I was given.
- **Capsule seal** `control/c1-critic-capsules/T2-PACKET-MANIFEST.json`: recomputed as
  `c7f5968bb5a6bb2c2981df3664e2e7a031f287d01db328bfe232b5515aabeefc`. This MATCHES. Each of the 14 listed files matches its SHA-256 and byte count.
- Stage 4 dispatch manifest seal: recomputed `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`, which matches the manifest field.
  Its capsule-file digest `8433ae5e…` also matches.
- Stage 3 packet manifest seal: recomputed `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`, which matches.
- Stage 2 seal: recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. This matches the protocol and the return's §1.
- The return (`cycles/cycle-1/stage3/returns/T2/RETURN.md`) has digest `74b7c0c9…498d`, which matches the capsule. The route ID and mechanism token
  appear verbatim. The return's read-boundary disclosure (a non-recursive `ls` of the run-root `scratchpad/`) matches
  `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. The disclosure shows nothing that was used.
- Return artifact digests. On copy-out I recomputed them: `t2_flat_obstruction.py` `84a73463…` and `t2_fixed_point_x.py` `2a87f7a0…` both MATCH.
  The return's face does NOT list digests for its other two scripts (`t2_quadratic_feasibility.py` `2ca3e124…`,
  `t2_exact_dp_search.py` `80c8bd1a…`) or for their payloads. That makes it an incomplete face inventory, although the files exist and replay; see Certification audit.
- Replay: I copied out all four generators to `scratchpad/c1-crit-T2-F/replay/` and reran each in the foreground. All four payloads
  came out byte-identical to the shipped JSON. The embedded payload digests were: flat `f16fb678…4292` (matches the face),
  fixed-point-x `ff8cd98e…6b96` (matches the face), quadratic `fe3722a7…462c`, and DP-search `9efc0ef6…aa82`.

## Independent re-derivation

My own instrument is `scratchpad/c1-crit-T2-F/crit_t2f.py` (stdlib only, exact integers and Fractions). It shares no code with the
return or with r30's `localflow.py`/`certify.py`.

- **Class identities (exact).** For every class `m` in `[107, 2999]` (965 values):
  - `2(8m − K + 1) = p*` holds.
  - `C1 = (D−s)(1 − 1/m) > 0` and `C2 = −1/(2m)` hold, with `t = K/m`, `s = (K−1)/m`.
  - `C(8m,K−1)/C(8m,K) = K/(8m−K+1) = 2K/p* < 2` holds, checked against `math.comb` for `m ≤ 206`.

  Symbolically: `3K − 2 = 16m − 1` and `3K = 16m + 1`, so every identity holds for all class `m`. The return's algebra in §6.1–§6.2 is correct.
- **`ρ_1`** by repeated multiplication of linear factors, a method distinct from the return's convolution sum. The two methods agree.
  The fixed point `CB(8,95)/508` gives `ρ_1 = 1354839571516225/1361543988640524` exactly. At the class rows,
  `1 − ρ_1(107, 110, 113)` equals the return's values exactly (≈ 4.373e−3, 4.254e−3, 4.141e−3). No Darroch or Newton argument is used anywhere.
- **Tree fidelity.** I computed the independence polynomial with a generic rooted-tree DP on an explicit adjacency list of `CB(8,m)`,
  which has `17m + 3` vertices and `17m + 2` edges. It equals the closed form of record at `m = 107, 110, 113`.
  `x` is the first strict descent computed through `α`, with the terminal difference counted. I obtained:
  `(n, α, x, p*) = (1822, 964, 570, 572), (1873, 991, 586, 588), (1924, 1018, 602, 604)`.
  Eligibility is true at all three rows and the parent descent `i_{p*−1} < i_{p*−2}` is true at all three.
  This reproduces the return's §4 table. It is a fidelity check at three rows only and says nothing about (ELIG-top)(a) in general.
- **Template fidelity.** The return's Out/In/Switch rows (§5) are the r30 template's rows as written in `localflow.py`:
  - In(β,γ) = (8−n)(pb(β+1,γ) + pc(β,γ+1)).
  - Out adds σ(γ) only at states (1,γ≥1).

  On a literal small analogue, CB(8,2) with leg budget K = 4 and every pure-layer arc enumerated, the arc sums equal the per-state formula exactly.
  The per-state template sees no arc of positive capacity beyond in-sector targets and u_i-switch images. The other exits from a
  sector source are deleting `r`, deleting `v`, or the switch at `s`. Each of those lands on a target of active-tag weight 0.
  (Checked: `v` is inactive once `r` is gone; `c_ij` is active only through `u_i`.)
- **Flat family, independently.** My 45-state exact DP (min-plus/max-plus over all splittings) was run with `p = 1/p*` and the
  LARGEST admissible switch, `σ(γ) = θγ/(8−γ)` with `θ = 1 − ρ_1`. Result: min Out = `K/p*` (571/572, 587/588, 603/604).
  The minimizer is an all-c source, which has no switch-capable choke. In the same runs max In = 1, Switch holds and Residual holds.
  This confirms the return's claim that the switch cannot rescue the flat family.
- **Family 2 (Jensen).** I re-derived conditions (I) and (II) and the elimination by hand. They are correct. Jensen's inequality is used
  on the quadratic polynomial extensions of `g` (convex) and `h` (concave) on `[0,8]`, which is legitimate. The conclusion
  `b ≤ C2/C1 < 0` is correct for every class `m`.
- **Fixed-point check of the full template.** My exact template search at `m = 107` returns `θ* = 96/766193` and margin
  `(1−ρ_1)/θ* ≈ 34.90`, which reproduces the r30 row fixed point. My own DP verifies it: min Out = 1, max In = 1, Switch and Residual hold.

## Attacks and findings

**F-1 (the attack brief's question). Is each infeasibility proof about the literal Out/In system over all splittings, or only the affine relaxation?**
- §6.1 (flat family) is about the LITERAL per-state system. The witness is a real all-c source, and the In side telescopes exactly. It is correct for every class `m`.
- §6.2 is about neither. It concerns a third, weaker object: the Jensen-SUFFICIENT certificate with `B ≥ 0`. The return says so
  honestly in §6.2 ("does not prove no symmetric … correction can ever work under the exact constraint").

So claim 2 is a statement about a proof technique, not about the template. On its own it closes nothing. "Template failure, not a cut" is respected throughout.

**F-2 (critic-derived; strengthens and supersedes both of the return's claims).**

*Type-and-count obstruction (STATED here, attributed to C-T2-F).*
- Hypothesis: `pb(β,γ) = f_b(β+γ)` and `pc(β,γ) = f_c(β+γ)` for arbitrary nonnegative `f_b, f_c` on `{1..8}`. This is the full family
  "deletion probabilities depending only on the leg type and the choke's leg count", which the allocation named for T2.
  Any `σ ≥ 0` and any `θ` are allowed.
- Conclusion: for every class `m`, the template's literal Out/In system is infeasible. Quantitatively,
  `max_{all-c targets} In ≥ (p*/K) · min_{pure sources} Out`.

*Proof.*
- Write `N_j = C(8m, j)`.
- All-c sources (`β = 0` at every choke) and all-b sources (`γ = 0` at every choke) have no switch-capable choke. Their whole outflow
  is deletion, it lands in all-c or all-b targets, and there are `N_K` of each kind.
- Double counting over all-c arcs: the c-part of the total inflow into all-c targets equals `Σ_{all-c B} Out(B)`.
- The b-part is `Σ_{all-c A} Σ_i (8−γ_i) f_b(γ_i+1)`. Relabel b↔c, which maps all-c targets onto all-b targets bijectively.
  The b-part then equals `Σ_{all-b A} Σ_i (8−β_i) f_b(β_i+1) = Σ_{all-b B} Out(B)`.
- Hence `Σ_{all-c A} In(A) ≥ 2 N_K · min Out`. By the class identity, `N_{K−1} = (2K/p*) N_K < 2 N_K`.

My brute force on literal pure layers of CB(8,2), K = 4, with random rates confirms both double-counting identities exactly
(`identity_c`, `identity_b` true).

The theorem contains §6.1 (`f_b = f_c = p`) and all of §6.2: every `f`, every sign of `B`, the exact system rather than Jensen's, and
switch included. It also shows the flat family is extremal: its excess `1/K` is exactly the forced bound `p*/K − 1`.

The precise necessary condition that survives is an asymmetry requirement:
`Σ_{all-c A} Σ_i (8−γ_i) pb(1,γ_i) ≤ ((p*−2)/p*) · Σ_{all-b B} Out(B)`.
In words, the b-deletion rate at states `(1,γ)`, weighted by the all-c targets, must fall strictly below the pure-b deletion rates.
Switch-capable states must deflect load.

**F-3 (critic-derived). The return's named "concrete open door" (§8.2) is closed at the three mandated rows.**
- The family is `pb = f_b(β)`, `pc = f_c(γ)`, with `σ ≥ 0` free and `θ` unbounded. That relaxation drops Switch and Residual.
- An exact cutting-plane search (`crit_t2f_cutplane.py`) generates literal source and target configurations with my DP. The subset
  LP became infeasible at every row: `m = 107` (19 sources, 18 targets), `110` (21/20), `113` (16/15).
- For each row I extracted a Farkas certificate and checked it by direct integer arithmetic, with no solver trusted:
  multipliers `y, z ≥ 0` with `Σ y·OutRow ≤ Σ z·InRow` coefficient-wise and `Σy − Σz > 0`. All three are valid (`certificate_valid: true`).
  The relative gap is ≈ 1.7e−3 at 107, 1.7e−3 at 110 and 1.7e−3 at 113.
- Every configuration was checked to have exactly `m` chokes and total leg count `K` (sources) or `K−1` (targets).
- Consequence: at each of the three rows, no β/γ-separated allocation satisfies Out and In, whatever the switch.
- Grade: per-row exact certificates at the template level (one instrument, `computer_assisted`-type), not uniform in `m`. It is a
  template failure, not a cut.
- The affine-separated LP for the same family is also infeasible at all three rows (`crit_t2f_opendoor.py`).
- What survives: any successful simple allocation must let `pb` depend on `γ` at fixed `β`, or `pc` on `β` at fixed `γ`, so that the
  state dependence is genuinely two-dimensional. The r30 optimum has exactly this shape: for example, `pb(1,1) < pc(0,2)` while
  `pb(1,0) = pc(0,1)` in the r30 table at `m = 101`.

**F-4 (misstatement). §6.2's DP table says `B = −1/(100K)` makes "both sides worse".**
The shipped output shows max In `= 14294/14275 ≈ 1.00133`, which is SMALLER than the flat value `572/571 ≈ 1.00175`. In improves and only Out worsens.
The table's sign pattern (fails on both sides) is correct; the word "worse" for In is false. Struck.

**F-5 (alias).** Claim 1's deletion-only part is already implied by the registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
whose global excess `R_K − R_{K−1} > 0` makes every deletion-only flow fail. Only the "with switch" addition is new, and F-2 contains it.
Claim 2 is a statement about one sufficient proof technique. I recommend neither be registered as proposed (see fence check).

**F-6 (fresh-row rule).** The return proposes no feasible closed form, so it makes no universal positive claim and gate ruling 2
is not engaged. Its negative claims were computed at `m = 107, 110, 113`, and I re-derived them there.

**F-7 (fresh-row observation, record only).** My full-template search reproduces the conjectured law's value
`θ*(110) = 96/809675` and `θ*(113) = 96/854357`, equal to `288/(200m²+82m+5)`. My DP verifies both (Out = 1, In = 1, Switch and
Residual hold, margins ≈ 35.88 and 36.85). This is census data about one template. It is not evidence for the law. It certifies no
(HALL) row, because the per-state reduction and the E1 composition are U2's and F1's.

## Mechanism-equivalence and fence check

- One rank per tree and the class only: every computation is at `p*(m)` for class `m`. Fence 1 holds.
- No refuted mechanism is revived. The flat and symmetric families are close to the refuted "`m`-independent per-choke certificate",
  but they are reported as failures, not proposed as proofs.
- Darroch and Newton are never used, by the return or by me. `ρ_1` is an exact coefficient ratio.
- Template ≠ network (fence 4): both the return and the critic stay at template level. No infeasibility is called a cut and none is.
- Census discipline: F-3 and F-7 are per-row and prove nothing universal.
- The `θ*` law is never a hypothesis.
- No status transfers to any aggregate key.

Claim identity:
- My lexical check against the frozen registry (`sources/authority/CLAIM-IDENTITY.json`) finds zero hits for the return's eight
  terms that bear on this content. The two incidental hits, `…GAMMA-RESIDUE-SLACK-THRESHOLD` and `E993-QUADRATIC-FLOOR`, are unrelated.
  I also find zero hits for `CONSTANT-RATE`, `LEG-TYPE`, `TYPE-AND`, `PURE-LAYER` and `E993-R31`.
- My extractor finds 486 keys. The registry states 491 identities; the difference comes from my extractor and is not a finding.
- Mathematically, no registered key states the type-and-count obstruction.
- Recommended candidate, replacing the return's two, in predicate form:
  `E993-R31-CB8-TOPRANK-SECTOR-ALLOCATION-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-COUNT-IS-INFEASIBLE`.
  Grade: STATED at this review stage (critic-derived), pending an isolated second read. Its informal proof is complete as written in F-2.
- The return's own grades (`proved_informal` for both proposals) are not registrable as they stand (`SOLUTION-CONTRACT.md` §4):
  - claim 1's mathematics is correct and is subsumed by the candidate above;
  - claim 2 should not be registered, because it concerns a technique and is dominated by the candidate above.

## Certification audit

- "exact", "verified" for §6.1 (flat margins `1/K`, `1/p*`; the DP at three rows; the all-c witness): BACKED by the replay and by my own instrument.
- "proved … for the entire class" for §6.2: BACKED only in its stated scope (Jensen certificate, `B ≥ 0`). The algebra is correct for all class `m`.
- "cross-checked … against the true DP at `m = 107`": BACKED as a five-point grid (bounded). "Both sides worse": STRUCK (F-4).
- "Two independent generators": BACKED (the fixed points `ρ_1(95)` and `x(107) = 570` replay).
- "byte-identical payload digests": BACKED for all four. The face gives only two script and payload digests; the other two
  scripts' digests are not on the face.
- The §8.2 "untested and concretely promising" door is SUPERSEDED at the three rows by F-3: that family is infeasible there.
  Its phrase "still depending only on the leg type and the choke's leg count" is misleading, because that exact family is dead uniformly (F-2).
- The route's closing "`blocked`" is accurate.
- `## Remaining obligation` (§8): items 1, 4 and 5 are exact. Item 2 must be revised as F-2/F-3 indicate. Item 3 (state-dependent σ
  beyond `σ(γ)`) is not a template move: the only positive-capacity switch arcs from sector sources are the `u_i` switches at
  `(1,γ)`, and other switches land on weight-0 targets.

## Verdict

The return's two negative results are mathematically correct: §6.1 on the literal template system, §6.2 on the Jensen certificate only.
Both are subsumed by the critic's uniform type-and-count obstruction (F-2). The return's named next move is closed at the three
mandated rows by verified Farkas certificates (F-3). One literal is struck (F-4) and the proposed keys are narrowed (F-5).
No positive allocation, no `θ` bound and no residual-capacity bound were delivered.

verdict: retained_narrowed
headline_resolved: no

`LS_top: template_failure_found`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

(L-S)_top remains OPEN in full. Exactly:
- Find closed forms `pb(β,γ)`, `pc(β,γ)`, `σ(γ)`, `θ(m)` for every class `m ≥ 107`, with Out, In, Switch, `θ ≤ 1 − ρ_1` and nonnegativity
  proved against the literal per-state system, and through U2's proved reduction against the network. Every step needs an explicit `M_0`.
- By F-2, the allocation cannot depend on the choke state only through `(leg type, β+γ)`. By F-3, at `m = 107, 110, 113` it cannot be
  `β/γ`-separated.
- A viable closed form must satisfy the pure-layer necessary asymmetry of F-2. It must also have genuinely two-dimensional state
  dependence, of the shape the r30 table shows.
- The explicit lower bound on `1 − ρ_1(m)` is untouched by this route.

For the registry: F-2 needs an isolated second read before the candidate key is registered. F-3 is per-row and one-instrument; it
needs a second instrument if it is to be recorded.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T2-F/`.

Scripts (file SHA-256):

| File | SHA-256 |
|---|---|
| `crit_t2f.py` | `f9000fbc14fb99474b1bfe7553c4abc84b0ea8ddae0e5685ba56bcf518c761b7` |
| `crit_t2f_opendoor.py` | `aaa22262e5480aad3e78b0f856aec107fdb32e2e529aaa85f1dd7461270b2355` |
| `crit_t2f_cutplane.py` | `63af319eb00d40ec512bdc5dfb5220914adb7d017d14f347f2b737b3287ca140` |
| `crit_t2f_farkas.py` | `44d671471d74288ba1aa887c624530902e11e64004fe11493bfa09fb94c6a5c3` |

Outputs (embedded payload SHA-256):

| File | Payload SHA-256 |
|---|---|
| `crit_t2f_output.json` | `a02c7d31cc3f402c45168ed42285add338e1318f5f137c2acd7f4c7551ae74f6` |
| `crit_t2f_opendoor_output.json` | `0f7a8a2f1be042abc35021fd75162929e0954fd511c94bc27ceb556f749ddbd1` |
| `crit_t2f_cutplane_{107,110,113}.json` | `74df0e61…06b0e6`, `743ea1db…be56a`, `1df02388…6b7b7b` |
| `crit_t2f_farkas_{107,110,113}.json` | `46f680ca…35656`, `c0db8a1a…f5b290`, `61a6b79e…f746c` |

- `replay/`: copy-out of the return's four scripts and four JSON files (originals kept as `*.orig.json`), with run logs. All four payloads are byte-identical.
- Replay commands: run `python3 -B crit_t2f.py` in that directory, then `python3 -B crit_t2f_opendoor.py 107 110 113`, then
  `python3 -B crit_t2f_cutplane.py <m>` followed by `python3 -B crit_t2f_farkas.py <m>` for m = 107, 110, 113.
- Each command runs in under 30 s in the foreground. No background job remains.
