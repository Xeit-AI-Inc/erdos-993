# RETURN — Route T1, Cycle 1, r31

**Route ID:** `C1-T-01`
**Mechanism token:** `LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES`
**Orientation:** T (prove)

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit
parameter); runtime-reported model id: claude-sonnet-5.

**Dispatch integrity:** `control/dispatch/c1-stage3/DISPATCH-T1.md` verified against the supplied
SHA-256 `2f088bb2deecfbf2596313d1461caf5bcd5b5e9c734fdca1c6e5904e524765d2` before any other action
(`shasum -a 256`, exact match).

## Boot acknowledgment

Booted VerityOS by reading exactly the two authorized files and nothing else from VerityOS proper:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
Per the dispatch and the Cycle 1 Worker Common Brief, the startup protocol's own task-type map,
memory, conversations, modules, skills, logs and decisions were NOT loaded (the controller has
booted for the run).

## Stage 2 seal

`control/C1-STAGE2-PACKET-MANIFEST.json` (1403 files) seal `seal_sha256` field and the dispatch's
quoted value both equal `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. Recomputed
independently: loaded the JSON, removed `seal_sha256`, re-serialized with `sort_keys=True,
separators=(",", ":")`, no trailing newline, and hashed with SHA-256 — **match confirmed**
(canonical JSON length 285,781 bytes).

**Source digests verified** (against `sources/SOURCE-DIGESTS.json`, byte-for-byte, before reading):
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`,
`sources/r30/instruments/c6/C-T2-F/{crit_cert_tables.json,crit_extend_a.json,crit_extend_b.json}`,
`sources/r30/instruments/c6/T2/inherited/{localflow.py,certify.py,sector.py,rowdata.py,simplex.py}`,
`sources/mathlib-binding/PIN.json` — all matched exactly. Also read and verified via the Stage 2
manifest: `AUTHORIZATION.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/C1-WORKER-COMMON-BRIEF.md`.

## Read-boundary disclosure

One inadvertent boundary read occurred: while creating this return's directory I ran
`ls .../cycles/cycle-1/stage3/returns/` (the *parent* of my own `T1/` folder, one level above my
grant) to confirm my own subdirectory existed. This revealed the *names* of five sibling return
folders (`F1`, `F2`, `T2`, `U2`, `U3`) — no file inside them was opened, read, or used, and none of
their content influenced any claim below. Recorded here per the dispatch's rule that any such
listing is a disclosure regardless of intent. No other boundary reads occurred (verified against my
own command history: all other reads were direct opens of the exact files named in the brief and
dispatch, or of my own scratch/replay directories, which are within grant).

## IMPORT LIST

Standard library only: `fractions.Fraction`, `math.comb`, `json`, `hashlib`, `sys`. No network, no
package installs. Own modules (written fresh for this route, in
`scratchpad/c1-T1/`): `t1_simplex.py` (own two-phase exact-rational simplex, Bland's rule),
`t1_template.py` (own LP construction of the choke-local sector template), `t1_verify.py` (own exact
min-plus/max-plus DP verifier, independent of the LP), `t1_rho1.py` (own closed-form E1 ratio),
`t1_generator.py` (the deterministic generator tying everything together).

## Registered claims touched (named before any computation is reported as evidence)

Per `SEMANTIC-CONTRACT.md` §4 / `sources/authority/CLAIM-IDENTITY.json`: this route's target is
**(L-S)_top** (SEMANTIC-CONTRACT §2, the uniform residual-capacity sector allocation — not yet an
`E993-R31-` key; the missing lemma named in `SOLUTION-CONTRACT.md` §1 Tier 2). It cites, without
re-proving, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (VERIFIED — the exact `R_K/R_{K-1}=p*/(p*-1)`
deficiency forcing switch arcs), `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
(VERIFIED — the E1 flow whose ratio `ρ_1` gates Residual), `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
(`proved_informal` — background for why `p*` is the relevant threshold rank), and
`E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
(VERIFIED, `computer_assisted` — the finite bounded-range predecessor row-key whose last row, `m=107`,
this route's class begins at; that key certifies each row's FULL weighted Hall individually and does
**not** contain a closed form). The θ*_8(m) conjecture and its five recorded tables are r30's, cited
`conjecture`/`computer_assisted` per `SEMANTIC-CONTRACT.md` §3, never upgraded here by use.

**New candidate claim** (E993-R31- namespace, alias-checked below): `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-CLOSED-FORM-SATISFIES-OUT-IN-SWITCH-FOR-EVERY-M`
— *predicate*: "the explicit closed-form per-choke-state allocation given below (§ Closed forms)
satisfies the Out, In, Switch and nonnegativity conditions of the choke-local sector certificate,
for every integer `m ≥ 107` with `m ≡ 2 (mod 3)` — **not** conditioned on it being the LP's optimum,
only on it being feasible." This is strictly weaker than (L-S)_top, which also needs Residual
(`θ(m) ≤ 1 − ρ_1(m)`); that piece is NOT included in this candidate and is left open below.

**Alias check (lexical):** searched `control/CLAIM-IDENTITY.run-local.json` (491 claims, byte-identical
to `sources/authority/CLAIM-IDENTITY.json`) for `SECTOR`, `CLOSED-FORM`, `CHOKE`, `RESIDUAL`, `OUT-IN`,
`SWITCH`, `TOP-RANK`, `LS-TOP`, `AFFINE` in every `claim_key`/`statement`. No existing key states a
closed form for the per-state allocation, in `m`, over the unbounded class; the nearest neighbour is
the bounded row-key above (95–107, finite, per-row certified, not a formula).
**Alias check (mathematical):** the candidate's scope (infinite family, `m≥107`) and content (sector
constraints only, excluding Residual) differ from every existing key: the bounded row-key is finite
and asserts the FULL weighted Hall per row (a strictly stronger per-instance claim over a strictly
narrower domain); no existing key is mathematically equivalent under restatement. Not an alias.

**Grade of the new candidate:** `proved_informal` (an exact, computer-algebra-checked but not
Lean-formalized proof — see § Proof).

## Step-by-step derivation

**(1) Reproduction of the five recorded tables, own solver.** Wrote an independent LP
(`t1_template.py`: own variable layout, own row generation, own affine-separation encoding for
Out(β,γ) ≥ a+λ(β+γ), In(β,γ) ≤ a2+λ2(β+γ), Switch (8−γ)σ(γ) ≤ θγ, aggregates `m·a+λK≥1`,
`m·a2+λ2(K−1)≤1`) and an independent two-phase exact-rational simplex (`t1_simplex.py`, Bland's
rule, not copied from `sources/r30/instruments/c6/T2/inherited/simplex.py`, which was read only as
the reference template named in the dispatch). Solved `d=8` at `m=95,98,101,104,107`
(`p*=508,524,540,556,572`); obtained `θ*` and every `pb(β,γ), pc(β,γ), σ(γ)` **identical** to
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json` and
`sources/r30/instruments/c6/C-T2-F/{crit_cert_tables.json,crit_extend_a.json,crit_extend_b.json}`
(spot-checked cell-by-cell, e.g. `pb(1,0)`, `pc(0,1)`, all `σ(γ)`, and `θ`; every value matched
exactly as a `Fraction`). Cross-checked `ρ_1` (see step 5) against the frozen `"rho"` field of
`crit_cert_tables.json` — exact match at `m=95,98`.

**Row context inherited (not recomputed by this route; cited, `SEMANTIC-CONTRACT.md` §5 and
`crit_extend_a.json`/`crit_extend_b.json`):** `CB(8,95)/508`: `n=1618, α=856, x=506` (window
`[508,614]` per the E-window convention; `Δ_x<0, Δ_{x−1}≥0` asserted by the r30 instrument, not
independently re-derived here). `CB(8,101)/540`: `n=1720, α=910, x=538`, window `[540,606]`.
`CB(8,104)/556`: `n=1771, α=937, x=554`, window `[556,624]`. `CB(8,107)/572`: `n=1822, α=964, x=570`,
window `[572,642]`. This route's mechanism (the sector LP) does not touch `x` or eligibility; that
is T3's/F3's obligation. No independent `x`/`Δ_k` computation was performed for the fresh rows
`m=110,113,116` below — flagged explicitly as outside this route's scope, not silently assumed.

**(2) Fresh rows, tested before any universal claim (Stage 1 Gate ruling 2).** Solved fresh at
`m=110` (`p*=588`), `m=113` (`p*=604`), `m=116` (`p*=620`) with the same own LP, then **independently**
re-verified every solution with a from-scratch exact min-plus/max-plus DP (`t1_verify.py`, own
recurrence, not the reference `certify.py`) directly against the literal per-choke-state system —
not the affine relaxation: `min` over all splittings of `K` legs across `m` chokes of Σ Out ≥ 1;
`max` over all splittings of `K−1` legs of Σ In ≤ 1; Switch; Residual (using the closed-form `ρ_1`,
step 5). **All three fresh rows certified `ok=True`** (nonneg, minOut=1, maxIn=1, switch_ok,
residual_ok all held). This satisfies the gate's "fresh rows first" requirement before step 4's
universal argument.

**(3) Closed forms, fit from all eight rows (5 control + 3 fresh) and confirmed exactly on every
one.** Let `D(m) := (200m² + 82m + 5)/3` (an integer whenever `m ≡ 2 (mod 3)`, since
`200m²+82m+5 ≡ 0 (mod 3)` on that residue class — checked: `m≡2 ⇒ m²≡1 (mod 3)`, so
`200m²+82m+5 ≡ 2·1+1·2+2 ≡ 6 ≡ 0`). Fitting a line `A·m+B` to `D(m)·(value)` from the first two rows
and checking it against all eight (exact `Fraction` equality, not approximate) gives, **matching on
every one of the 8 rows with no exceptions**:

```
θ(m)  = 96 / D(m)                    = 288 / (200m² + 82m + 5)
a(m)  = (-7/2) / D(m)
λ(m)  = (25m/2 + 5) / D(m)
a2(m) = (200m + 24) / D(m)
λ2(m) = (-25m - 5/2) / D(m)
pb(β,γ)(m) = (25m/2 + B_pb(β,γ)) / D(m)     [every β≥1 cell, all 36 of them]
pc(β,γ)(m) = (25m/2 + B_pc(β,γ)) / D(m)     [every γ≥1 cell, all 36 of them]
σ(γ)(m) = c_γ · θ(m),   c_γ = γ/(8−γ) for γ=1..6,  c_7 = 7/2   (NOT γ/(8−γ)=7 at γ=7)
```

The slope `25/2` is **identical across every one of the 72 `pb`/`pc` cells** — this was not assumed,
it fell out of the fit and was checked (`t1_closed_form_proof.py` / `t1_generator.py`) against all 8
rows for every cell; the intercepts `B_pb(β,γ), B_pc(β,γ)` are the only per-state data (listed in
`t1_generator_output.json`, SHA-256 below). The `σ(γ)/θ(m)` ratios `c_γ` are likewise exactly
constant across all 8 rows. `θ(m)=288/(200m²+82m+5)` reproduces r30's conjectured law exactly
(`SEMANTIC-CONTRACT.md` §2) — now confirmed on 3 additional, independently-solved fresh rows beyond
r30's original 5.

**(4) Proof that the closed forms satisfy Out, In, Switch and nonnegativity for *every* `m ≥ 107`,
`m ≡ 2 (mod 3)` — not just the 8 sampled rows.** Because every `pb, pc` cell and `a, λ` share the
*same* `m`-slope (`25/2` inside `D(m)·(·)`, and `θ(m)·D(m)=96` is slope-0), substituting the closed
forms into `Out(β,γ) ≥ a + λ(β+γ)` and multiplying through by `D(m) > 0` makes the `m`-linear terms
on both sides **cancel identically**, leaving a single `m`-independent rational inequality per state:

```
Out side:  C(β,γ) := β·B_pb(β,γ) + γ·B_pc(β,γ) + [96·c_γ if β=1,γ≥1]  ≥  5(β+γ) − 7/2
In  side:  (8−n)·(B_pb(β+1,γ) + B_pc(β,γ+1))  ≤  24 − 5n/2     (n=β+γ<8)
Switch:    (8−γ)·c_γ ≤ γ                        for γ=1..7
```

**Checked exactly for every state** (`t1_closed_form_proof.py`, `t1_generator.py`): all three hold —
Switch holds with **equality** for `γ=1..6` and with slack `3.5 ≤ 7` at `γ=7`. **Nonnegativity**:
`pb,pc ≥ 0` reduces to `25m/2 + B ≥ 0`; the most negative intercept found is `B=−689/16≈−43.06`,
requiring `m ≥ 689/200 ≈ 3.45` — true for every `m ≥ 107` (and in fact for every `m ≥ 4`, no
asymptotic regime needed at all). `σ(γ) = c_γθ(m) ≥ 0` since `θ(m) > 0` and every `c_γ ≥ 0`.
**This is a complete, unconditional, `m`-independent proof** — no "large `m`" step, no `M_0` needed,
because the linear-in-`m` terms cancel exactly rather than merely becoming small.

The two **aggregate** identities were also verified — first by hand algebra, then confirmed
computationally by substituting the closed forms directly (not re-solving the LP) at `m=107` and at
three arbitrary large control points **far outside the 8 fitted rows** (`m=1,000,001`; `m=5,000,003`;
`m=12,345,683`, all `≡2 mod 3`): `m·a(m) + λ(m)·K = 1` **exactly**, and `m·a2(m) + λ2(m)·(K−1) = 1`
**exactly**, for every one tested (K=(16m+1)/3). Both are equalities, not just the required
inequalities — consistent with a tight LP-optimal certificate, and strong evidence (though not by
itself a proof of persistence at *literal* infinity) that the fitted closed forms are genuine exact
identities rather than an 8-point coincidence. The proof in the paragraph above does not depend on
this extra evidence — it is a direct, self-contained verification of the closed forms against the
stated inequalities, valid by construction for every `m`.

**(5) The Residual constraint `θ(m) ≤ 1 − ρ_1(m)`: exact closed form for `ρ_1`, confirmed at every
tested row, NOT closed for all `m`.** `ρ_1(d,m,p) = [y^{p−1}]/[y^{p−2}]` of `(1+y)^{d−1}(1+2y)^{d(m−1)+1}`
(`SEMANTIC-CONTRACT.md` §2). Since `d−1=7` is a **fixed** small constant independent of `m`, derived
the exact finite closed form (own instrument, `t1_rho1.py`, not read from any source file):

```
[y^k](1+y)^R(1+2y)^N = Σ_{i=0}^{R} C(R,i)·2^{k−i}·C(N,k−i)          (R=7 terms, O(1) big-int ops,
                                                                      vs. the reference's O(m²)
                                                                      full-polynomial convolution)
ρ_1(m) = C_K / C_{K−1},  K=p*−1, N=8m−7
```

Verified this closed form against a from-scratch brute-force convolution (`rho1_brute`) and against
every `"rho"` value recorded in the frozen tables (exact match at `m=95,98,101,104,107`). Computed it
at all 8 rows and confirmed `θ(m) ≤ 1 − ρ_1(m)` **holds exactly at every one**, with `(1−ρ_1)/θ`
margins `≈31–44` and growing with `m` (consistent with r30's noted `≈m/3` margin-growth trend).

**Also proved (own instrument), for every `m` unconditionally, an exact two-sided bracket** via the
weighted-average-of-ratios lemma (`ρ_1 = ΣA_i/ΣB_i` with `A_i,B_i>0` lies in `[min_i A_i/B_i,
max_i A_i/B_i]`, a one-line convexity fact, no asymptotics): with `f(i):=2(N−K+i+1)/(K−i)`,

```
2(8m−19)/(16m+1)  ≤  ρ_1(m)  ≤  (4m+1)/(4m−5)      for every m (checked monotone in i, tight bracket endpoints i=0,7)
```

**This bracket is valid but too loose**: its upper end `(4m+1)/(4m−5) > 1` for every `m`, so it
cannot by itself certify `ρ_1(m) < 1`, let alone `θ(m) ≤ 1−ρ_1(m)`. Closing the Residual condition
for *every* `m ≥ 107` symbolically needs either (a) a full rational-function expansion of `ρ_1(m)`
(sketched but not completed: chain each `C(N,K−i)/C(N,K)` via `i≤7` successive ratio steps
`(K−s)/(N−K+1+s)` into one `P(m)/Q(m)`, then sign-check `Q−P` — the resulting polynomials have degree
roughly 50+, requiring root isolation not attempted this cycle) or (b) a tighter weighted-average /
second-moment bound than the raw min–max bracket used here. **Not completed this cycle** — see
Remaining obligation.

## Generator, digest, replay

Deterministic generator: `scratchpad/c1-T1/t1_generator.py` (consolidates steps 1–5; no wall-clock,
PID or host field in the hashed output; every LP/DP run in the **foreground**, no background jobs
were started, so none needed to be killed). Output: `t1_generator_output.json` (canonical
`sort_keys=True, separators=(",", ":")`).

**SHA-256(t1_generator_output.json canonical) = `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a`**

**Copy-out-first replay** (executed, not merely described): copied `t1_simplex.py`, `t1_template.py`,
`t1_verify.py`, `t1_rho1.py`, `t1_generator.py` from `scratchpad/c1-T1/` to
`scratchpad/c1-T1-replay/`, edited the one `sys.path` line to point at the replay directory, and ran
it there in the foreground:

```
cp scratchpad/c1-T1/{t1_simplex.py,t1_template.py,t1_verify.py,t1_rho1.py,t1_generator.py} scratchpad/c1-T1-replay/
cd scratchpad/c1-T1-replay && python3 -B t1_generator.py
```

Reproduced digest: `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a` — **identical**.
(Runtime: ≈104s per run, all foreground; the LP solves are ≈1.7s each, the exact DP verification
≈9–14s each scaling mildly with `m`.)

## Scope note: acyclicity/connectivity tests

This route's instruments operate entirely on the abstract per-choke-state model of
`SEMANTIC-CONTRACT.md` §2 (the `(β,γ)` sector states and the affine LP/DP over them) — they never
construct the literal `CB(8,m)` vertex/edge graph, so an acyclicity/connectivity test does not apply
to this code. Literal-graph fidelity (building the tree, checking `IsTree` two ways, and confirming
the abstract per-state reduction matches the literal network) is route F1's
(`LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS`) and U2's
(`SECTOR-CERTIFICATE-COMPOSITION-REDUCTION`) obligation this cycle, cited here as the source of the
"template ≠ network" reduction this route's LP relies on (Stage 1 Gate ruling 4: STATED at r30's
grade until U2's lemma is read).

## Grades (SOLUTION-CONTRACT.md §4; never upgraded by use)

- Out/In/Switch/nonnegativity of the stated closed-form allocation, for every `m≥107,m≡2mod3`:
  **proved_informal** (exact algebraic/computer-algebra proof; not Lean-formalized).
- `θ*_8(m) = 288/(200m²+82m+5)` as an exact value at 8 tested rows (5 control + 3 fresh): confirmed
  exactly, `computer_assisted`; as an LP-optimum *law* for all `m`: still **conjecture** (r30's,
  unchanged, never claimed proved here — LP optimality is never a hypothesis of feasibility, per
  Solution Contract fence 4).
- Closed form for `ρ_1(m)`: **proved** (an unconditional exact identity; the DERIVATION itself, not
  contingent on any further hypothesis).
- Two-sided bracket on `ρ_1(m)`: **proved** for every `m` (unconditional, but not tight enough to
  close Residual).
- Residual `θ(m)≤1−ρ_1(m)` for all `m≥107`: **bounded_computation** (exact at the 8 tested rows,
  including the two gate-mandated fresh rows `m=110,113`; open in general).
- Combined **(L-S)_top**: **proved_conditional** — proved for the stated closed forms *conditional*
  on the Residual inequality, which is itself confirmed (not merely assumed) at every tested row
  with wide, growing margins, but not closed symbolically for the full class.
- New candidate `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-CLOSED-FORM-SATISFIES-OUT-IN-SWITCH-FOR-EVERY-M`:
  **proved_informal**, scoped exactly as stated above (excludes Residual).

## Verdict

**headline_resolved: no**

**Route verdict: `proved_conditional`**

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

## Remaining obligation (successor inheritance)

1. **Close the Residual inequality `θ(m) ≤ 1 − ρ_1(m)` for every `m ≥ 107`, `m ≡ 2 (mod 3)`,
   symbolically.** Everything else needed for (L-S)_top is now closed unconditionally (see above).
   Two concrete paths, neither attempted to completion this cycle:
   (a) Finish the exact rational-function expansion of `ρ_1(m)` sketched in step 5 — chain the 7
   successive-ratio steps `C(N,K−i)/C(N,K) = Π_{s=0}^{i−1}(K−s)/(N−K+1+s)` into one `P(m)/Q(m)` per
   sum, combine the two 8-term sums, and sign-check the resulting (high-degree, ≈50+) polynomial
   `Q(m)−P(m)·(\text{something})` for `m≥107`, e.g. by bounding its leading terms or isolating roots;
   or (b) find a tighter-than-min/max bound on the weighted average `ρ_1=ΣA_i/ΣB_i` (e.g. a
   second-moment / Chebyshev-sum argument using the actual weight shape `C(7,i)2^{-i}D_{K-1-i}`,
   which peaks near `i≈2.3`, rather than its crude extremes) — this is the more promising route
   given how loose the current bracket is (`[0.974,1.016]` vs. the true value `≈0.995` to `0.996`).
2. **Own the exact closed forms and their `m`-independent proof as reusable inputs.** The intercept
   tables `B_pb(β,γ), B_pc(β,γ)`, the ratio constants `c_γ`, and the closed forms for `a,λ,a2,λ2,θ`
   are all in `t1_generator_output.json` (digest above) and should not be re-derived from scratch;
   a successor closing Residual can cite this route's Out/In/Switch/nonneg proof directly.
3. **The anomalous `c_7 = 7/2` (not `γ/(8−γ)=7`)** was observed but its structural reason not
   investigated (the Switch constraint at `γ=7` is not tight, `3.5≤7`, so `σ(7)` is otherwise
   under-determined by the LP; a successor curious why the simplex path lands exactly at `7/2` could
   investigate degeneracy at the `(β,γ)=(1,7)` boundary state, but this does not block anything above).
4. **Eligibility (`x`, `Δ_k`) was not independently checked at the fresh rows `m=110,113,116`** by
   this route (outside its mechanism); T3/F3 own that. This route only established that the SECTOR
   certificate is feasible at those rows, not that `p*` is eligible there (though r30's registered
   favorability/threshold keys, cited above, already cover this at `proved_informal`/conjecture
   grade for the whole class).
