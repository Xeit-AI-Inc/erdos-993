# RETURN — Cycle 1, Route T2 — r31 (CB uniform switch, top sector-deficient rank)

**Route ID:** `C1-T-02`
**Mechanism token:** `LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS`
**Orientation:** T (prove)
**Load-bearing obligation (`control/C1-ALLOCATION.md`, T2 row, verbatim quoted below under §1):** deliver a feasible sector
allocation that is *not* the LP optimum but is simple enough to prove uniformly, with every constraint proved by explicit
estimates; if the simple allocation provably fails, report the obstruction exactly.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5` (per this runtime's own system disclosure: "You are powered by the model named Sonnet 5. The exact
model ID is claude-sonnet-5.").

## Boot acknowledgment

VerityOS booted for this seat by reading **exactly** the two authorized files and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS
subsystem (memory, conversations, modules, skills, logs, decisions, the startup protocol's own task-type map) was loaded — the
controller has booted for the run, per `control/C1-WORKER-COMMON-BRIEF.md` and `control/dispatch/c1-stage3/DISPATCH-T2.md`.

## Read-boundary disclosure

One boundary violation occurred and is disclosed here in full: before verifying the digest of the sources I would need, I ran a
non-recursive `ls` on the run root's top-level `scratchpad/` directory (not my own `scratchpad/c1-T2/`) to confirm its
existence before `mkdir -p`. `scratchpad/` at the run root is explicitly named in the dispatch as above my grant. The command
was a single, non-recursive `ls` (not `find`/`grep`/`rg`/`ls -R`) and it returned only the names of sibling seats' scratch
directories (`c1-F1`, `c1-F1-replay`, …, `c1-U3-replay`) — no file contents. No other file, name, or content outside my grant
was read as a result. All subsequent work stayed inside `sources/`, the explicitly listed control/root files, and
`scratchpad/c1-T2/` and `scratchpad/c1-T2-replay/`.

## §0 IMPORT LIST (every generator below; standard library only)

`sys`, `math` (`comb`), `json`, `hashlib`, `fractions.Fraction`. No network, no third-party packages, no package installs were
used or attempted.

## §1 Stage 2 seal and source digests verified

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (the `seal_sha256` field removed,
`sort_keys=True`, `separators=(",", ":")`, no trailing newline):

```
e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc
```

This matches both the manifest's own `seal_sha256` field and the digest asserted by `control/dispatch/c1-stage3/DISPATCH-T2.md`
(verified separately against the dispatch file itself before opening it, per the outer instruction: SHA-256 of `DISPATCH-T2.md`
= `9e3236cabedf1eb7d7ccd2f77c960eadfe5875d0a58ad3596f39fbe970b1a92b`, matched).

Every file this return actually reads or cites was independently re-hashed and compared against
`control/C1-STAGE2-PACKET-MANIFEST.json` / `sources/SOURCE-DIGESTS.json` and found to match, specifically:
`control/C1-WORKER-COMMON-BRIEF.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/CLAIM-IDENTITY.run-local.json`,
`AUTHORIZATION.md`, `OBLIGATIONS.csv`, `sources/mathlib-binding/PIN.json` (not otherwise used — no Lean work this route),
`sources/r30/instruments/c6/T2/inherited/{localflow.py,certify.py,sector.py,rowdata.py,simplex.py}`,
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`,
`sources/r30/instruments/c6/C-T2-F/{crit_cert_tables.json,crit_extend_a.json,crit_extend_b.json}`. No file outside `sources/`
and the explicitly listed control/root files was read for content.

## §2 The load-bearing obligation, restated exactly (`C1-ALLOCATION.md`, T2 row)

> "a feasible allocation that is NOT the LP optimum but is simple enough to prove uniformly — e.g. deletion probabilities
> depending only on the leg type and the choke's leg count, a switch share with explicit slack, `θ(m)` chosen with room below
> `1 − ρ_1(m)` — with every constraint proved by explicit estimates … If the simple allocation provably fails (a state where
> no choice of your parameters works), report the obstruction exactly — that is a template failure, not a cut."

## §3 Registered claims this return touches or would re-confirm (named before any census, per rule 3 of
`C1-WORKER-COMMON-BRIEF.md` and `SEMANTIC-CONTRACT.md` §4)

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) — the run's headline target; **not resolved by this route**.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`) — E1, cited only (its
  `ρ_1(m)` is reproduced independently below as a fixed-point fidelity check, not re-derived as a contribution).
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal` modulo
  Darroch on the `r_q`) — cited only, for the exact value `ρ_1(m) = r_1(K)/r_1(K-1)`, itself a ratio of coefficients of the
  real-rooted product `(1+y)^7(1+2y)^{8m-7}`; used here as a bare integer-coefficient ratio (Darroch/Newton not invoked by
  this route — I only take an exact coefficient ratio, never a real-rootedness-dependent inequality on it).
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (`proved_informal`
  modulo Darroch/Newton) — cited only (favorability of `F_{p*}`); not touched computationally by this route.
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and the r30 Cycle 6 CB template/composition keys — cited as the source of
  the local-flow template (`localflow.py`, `sector.py`, `certify.py`) this return studies and departs from; not re-proved.
- No claim above is re-confirmed as evidence by this return: this route neither certifies nor refutes any of them. It reports
  two new, narrowly-scoped **negative** findings about a specific proof *technique* (below, §6), proposed as new
  `E993-R31-` candidate keys, alias-checked in §7.

## §4 Fixed points reproduced before any table (`SEMANTIC-CONTRACT.md` §5), with independent generators

Two independent, self-written generators (not copies of `sources/r30/instruments/.../rowdata.py`,
`.../localflow.py`, `.../certify.py` — those are read only as reference, per rule 1 of `C1-WORKER-COMMON-BRIEF.md`, item 1's
"your own implementation is required" convention, applied here even though the explicit sentence naming it is in T1's row):

**(a) `ρ_1(m)` and `θ*` reproduction.** `scratchpad/c1-T2/t2_flat_obstruction.py`, function `rho1`, computes
`ρ_1(m) = r_1(K)/r_1(K-1)` with `r_1(k) = [y^k](1+y)^7(1+2y)^{8m-7}` by direct exact binomial convolution (`math.comb`), and
reproduces, exactly, the recorded fixed point:

```
CB(8,95)/508:  computed ρ_1 = 1354839571516225/1361543988640524
               recorded  ρ_1 = 1354839571516225/1361543988640524   MATCH
```

**(b) `x` (first strict descent) reproduction.** `scratchpad/c1-T2/t2_fixed_point_x.py` builds the CB(8,m) independence
polynomial directly from the tree's own recursive shape (own bottom-up rooted convolution: a leg is the path
`u_i – b_ij – c_ij`; a choke `u_i` has `d=8` legs; `r` has `m` chokes plus the pendant `s – v`), independently re-deriving
`I(CB(d,m)) = (1+2y)G^m + y(1+y)(1+2y)^{dm}`, `G=(1+2y)^d+y(1+y)^d` (matching `SEMANTIC-CONTRACT.md` §2's closed form,
confirmed rather than assumed), and reproduces the recorded fixed point exactly:

```
CB(8,107)/572: computed n=1822 alpha=964 x=570   (SEMANTIC-CONTRACT.md: n=1822 alpha=964 x=570)   MATCH
```

`x`, `Δ_x := i_{x+1}-i_x` and `Δ_{x-1} := i_x - i_{x-1}` at the three mandated rows (own generator, exact integers; `Δ_x` is
the difference at index `k=x`, `Δ_{x-1}` at index `k=x-1`; both are astronomically large integers as printed by the
generator — reported here only by sign/eligibility, full values in the JSON payload):

| m | n | α | x | sign(Δ_x) | sign(Δ_{x-1}) | (E): x+2≤p* ∧ 3p*<2α+1 |
|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | − (k=x) | + (k=x−1) | true |
| 110 | 1873 | 991 | 586 | − (k=x) | + (k=x−1) | true |
| 113 | 1924 | 1018 | 602 | − (k=x) | + (k=x−1) | true |

(This eligibility reproduction is a fidelity check only — (ELIG-top)(a) at *every* `m` in the class is T3's/F3's load-bearing
obligation, not mine; I report it here only because SEMANTIC-CONTRACT.md §5 requires reproducing reachable fixed points before
any table, and my constraint system below presupposes `p*` eligible.)

**Digests and replay (copy-out-first, target `scratchpad/c1-T2-replay/`, never `/tmp`):**

```
sha256(t2_flat_obstruction.py)      = 84a73463c19988d984b0e9ca78915419c5f798a563a31245ed218d107292989e
sha256(t2_fixed_point_x.py)         = 2a87f7a07aa5400b5c6e488c5cb6b81bf709ea4c567a8e11bcb9698d015342d5
payload digest (flat_obstruction)   = f16fb6787af7515af0ee90e29ac61773f30eb527c3e11e49aac2a5c3fb244292
payload digest (fixed_point_x)      = ff8cd98ecb30927cf7d4723b8ccfe1604a9e5978d496bb4588ef7d2985e41b96

Replay:
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2/t2_flat_obstruction.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2/t2_fixed_point_x.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2-replay
python3 -B t2_flat_obstruction.py
python3 -B t2_fixed_point_x.py
```

Both were re-run from the copied files during this session (foreground, no detachment) and produced byte-identical payload
digests to the originals.

## §5 The template, restated (`sources/r30/instruments/c6/T2/inherited/{localflow.py,sector.py,certify.py}`, read-only
reference; `SEMANTIC-CONTRACT.md` §2)

Per choke `i` (of `m`), each of its `d=8` legs is in state {empty, `b`-only, `c`(-and-`b`-implicitly-absent)}; `(β,γ)` counts
legs in `b`-state / `c`-state, `n:=β+γ≤8`. A sector source has total occupied legs `K=p*-1` spread over the `m` chokes; an
in-sector target has total `K-1`. The template's certificate is nonnegative `pb(β,γ)` (probability mass on deleting one
`b`-leg at that state), `pc(β,γ)` (deleting one `c`-leg), `σ(γ)` (the switch share at states `(1,γ)`, `γ≥1`), and `θ`,
subject to, **for every** choke state:

- **Out:** `β·pb(β,γ) + γ·pc(β,γ) + [β=1,γ≥1]·σ(γ) ≥` (a value whose sum over any source's `m` chokes must be `≥1`).
- **In:** `(d-n)·(pb(β+1,γ)+pc(β,γ+1)) ≤` (a value whose sum over any in-sector target's `m` chokes must be `≤1`), for `n<d`.
- **Switch:** `(d-γ)σ(γ) ≤ θ·γ` for `γ=1..7`.
- **Residual:** `θ ≤ 1-ρ_1(m)`.

The r30 LP-optimal `pb,pc,σ,θ` (`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`, row `8,95,508`) are messy exact
rationals with no visible closed form (e.g. `pb(1,0)=1189/604265`, `pb(8,0)=19073/9668240`, `θ=96/604265`) — my
obligation is a *simpler*, deliberately suboptimal, uniformly-provable alternative.

## §6 Derivation: two natural simple families, both proved infeasible (the obstruction)

### §6.1 Family 1 — flat (state-independent) per-leg deletion rate

**Hypothesis entering:** `pb(β,γ)=pc(β,γ)=p` for a single constant `p` (independent of `β,γ`), zero switch use. This is the
simplest imaginable member of "deletion probabilities depending only on the leg type and the choke's leg count" (here: not
even on the count).

**Where the hypothesis enters the algebra:** because `p` is *literally* state-independent, `Out(β,γ)=p·n` and
`In(β,γ)=2p(d-n)` are **exactly linear** in `n=β+γ` (not merely affinely bounded) — so summing over the `m` chokes of any
source/target telescopes **exactly**, with no adversarial extremization possible:

```
Σ_i Out(state_i) = p·Σ_i n_i = p·K                         (any source: Σn_i=K)
Σ_i In(state_i)  = 2p·Σ_i(d-n_i) = 2p(dm-(K-1))            (any target: Σn_i=K-1)
```

**Exact identity used (verified, not assumed):** `2(dm-K+1) = p*` for every `m` in the class — because
`K=p*-1` and `d=8`, `dm=8m`, and `p*=(16m+4)/3` gives `2(8m-K+1)=2(8m-(16m+4)/3+2)=(16m+4)/3=p*` by direct algebra (confirmed
computationally at `m=107,110,113` in `t2_flat_obstruction.py`, `assert twice_cap == pstar`).

**The obstruction (exact, all `m` in the class, ℕ/ℚ arithmetic only, no asymptotics):** Out≥1 needs `p≥1/K`; In≤1 needs
`p≤1/p*`. Since `K=p*-1<p*`, `1/K>1/p*`: **no constant `p` satisfies both.** Forcing Out tight (`p=1/K`) gives
`In = p*/K = p*/(p*-1) = 1 + 1/(p*-1) > 1` (excess `1/(p*-1)=1/K` exactly). Forcing In tight (`p=1/p*`) gives
`Out = K/p* = (p*-1)/p* = 1 - 1/p* < 1` (shortfall `1/p*` exactly). Verified against my own exact min-plus/max-plus DP
(independent of the algebra, `min_sum_dp`/`max_sum_dp` in `t2_flat_obstruction.py`) at `m=107,110,113`:

```
m=107 (K=571,p*=572): p=1/571 -> min Out=1 (ok), max In=572/571 (FAILS, >1)
                       p=1/572 -> min Out=571/572 (FAILS, <1), max In=1 (ok)
m=110 (K=587,p*=588): identical pattern, excess/shortfall = 1/587, 1/588
m=113 (K=603,p*=604): identical pattern, excess/shortfall = 1/603, 1/604
```

**Switch cannot rescue this:** `σ(γ)` only credits states `(β=1,γ≥1)`. A sector source can realize its entire `K`-leg budget
using only `β=0` legs at every choke (all occupied legs pure `c`-type; trivially constructible for `m≥107` since
`K/m≈16/3<8`), visiting **zero** `(1,γ)` states — for such a source, with `p=1/p*` (the In-tight choice), the switch adds
exactly 0 and `Out=(p*-1)/p*<1` genuinely, not just by a sufficient-condition artifact: **this specific real source is not
saturated.** This is an exact counterexample to "flat rate + switch", not merely a failure of an affine relaxation.

**Grade: template failure, proved** (exact algebra + independent DP + explicit counterexample; this is a fact about the
specific candidate construction, not about `(L-S)_top` itself, which the r30 LP already shows is achievable by a
non-simple allocation).

### §6.2 Family 2 — convex-quadratic per-occupancy correction (Jensen route)

**Hypothesis entering:** `f(n)=A+B(n-1)` for `n≥1` (so `g(n):=n·f(n)=An+Bn(n-1)`), i.e. `pb(β,γ)=pc(β,γ)=f(β+γ)` — still
"depends only on the choke's leg count", now allowing a linear-in-`n` correction to the rate, parametrized by `A=a/K, B=b/K`.
`g` is convex iff `B≥0` (constant second difference `2B`); `h(n):=2(d-n)f(n+1)` (the In function) is then automatically
*concave* (`h(n)=2AD+2(BD-A)n-2Bn²`, quadratic coefficient `-2B≤0`) — the same sign of `B` controls both, which is exactly
what makes Jensen's inequality (an **exact**, non-asymptotic classical fact, not an estimate needing a remainder term)
applicable in the direction we want on *both* sides simultaneously:

```
Out = Σg(n_i) ≥ m·g(K/m)              (Jensen, g convex; exact for every m, no error term)
In  = Σh(n_i) ≤ m·h((K-1)/m)          (Jensen, h concave; exact for every m, no error term)
```

**Where each hypothesis enters:** convexity of `g` (⟺ `B≥0`) is used for the *direction* of the Out-Jensen bound; the same
`B≥0` is what makes `h` concave and hence gives the *useful* direction of the In-Jensen bound. Substituting
`t:=K/m, s:=(K-1)/m` and clearing `K` reduces feasibility of `(a,b)` to two exact linear inequalities:

```
(I)   a + b(t-1)                         ≥ 1
(II)  aD + (bD-a)s - bs²                 ≤ K/(2m)
```

Eliminating `a` gives a single linear condition on `b`: `b·C1 ≤ C2` with, **exactly** (derived, not fit):

```
C1 = (D-s)(s-t+1) = (D-s)(1 - 1/m)      [since s-t = -1/m exactly, for every m]
C2 = K/(2m) - (D-s) = -1/(2m)            [exact closed form; verified: (3K-2)/(2m) - D = -1/(2m) since 3K-2=16m-1]
```

`D-s>0` always (`s≈16/3<8`), `1-1/m>0` for `m≥107`, so `C1>0` for **every** `m` in the class; `C2=-1/(2m)<0` for **every** `m`.
Hence `b ≤ C2/C1 < 0` is *forced* for every `m≥107, m≡2(mod 3)` — **`B≥0` (the only sign for which the Jensen argument runs in
the needed direction) is infeasible for the entire class**, not merely at the tested rows. Confirmed numerically (exact
fractions) at `m=107,110,113` in `t2_quadratic_feasibility.py`: `C1≈2.65`, `C2=-1/(2m)`, critical `b≈-1.7×10⁻³` in each case.

**Cross-check against the true (non-Jensen) exact DP**, not just the sufficient bound, at `m=107` (`t2_exact_dp_search.py`):
every tested `B>0` candidate *worsens* the exact `In` (max) beyond the flat case's own violation while only mildly improving
`Out` — consistent with, and not contradicted by, the Jensen-level proof:

```
flat (B=0):        min Out=1 (ok),        max In=572/571 (FAILS)
B=+1/(100K):       min Out=596/571 (ok),  max In=602/571 (FAILS, worse)
B=+1/(1000K):      min Out=1147/1142(ok), max In=575/571 (FAILS, worse)
B=-1/(100K):       min Out<1 (FAILS),     max In>1 (FAILS, both sides worse)
```

**Grade: template failure, proved for the Jensen-sufficient certificate, for the entire class** (`m≥107,m≡2(mod3)`, exact
algebra, no `M_0`/remainder needed since Jensen is exact); **cross-checked, not merely predicted, against the true DP at the
mandated row `m=107`.** This does not prove no symmetric-in-(β,γ) convex correction can ever work under the *exact* (rather
than Jensen-sufficient) constraint — only that this specific, standard proof route is closed. The natural next move —
`pb≠pc` (breaking the `β↔γ` symmetry that this route's `h(n)` collapses into a single function of `n`) — is untested by this
route and is the concrete open door named in §8.

## §7 New claim proposals (alias-checked lexically AND mathematically against `control/CLAIM-IDENTITY.run-local.json`, 491
entries, before any of the above was treated as a registrable finding)

Lexical check: searched the 491 claim keys for `JENSEN`, `SLACK`, `QUADRATIC`, `FLAT-RATE`, `CONVEX`, `LS-TOP`,
`SECTOR-ALLOC`, `RESIDUAL-CAPACITY` — zero hits on all eight terms. Mathematical check: the existing CB/sector keys in the
registry (`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, the criterion/threshold/favorability keys, the `θ*` conjecture) are
all about the *r30 LP-optimal* certificate or its conjectured closed form; none states or implies a fact about the flat or
convex-quadratic *sub-families* specifically, so neither proposal below restates a registered claim under a new name.

Proposed (PREDICATE form; **not registered** — this is a route return, registration is the controller's/synthesis's step):

- `E993-R31-CB8-TOPRANK-CONSTANT-RATE-SECTOR-ALLOCATION-INFEASIBLE-FOR-EVERY-CLASS-M` — statement: for every
  `m≥107, m≡2(mod 3)`, no state-independent constant per-leg deletion rate `p` (with or without the switch) yields a feasible
  root-plus-arm sector allocation for `CB(8,m)` at `p*(m)`; exact excess/shortfall `1/(p*(m)-1)` resp. `1/p*(m)`. Grade:
  `proved_informal` (exact algebra + independent DP + explicit witness source; no gap I can see, but it has not had an
  isolated second read).
- `E993-R31-CB8-TOPRANK-CONVEX-QUADRATIC-OCCUPANCY-ALLOCATION-JENSEN-CERTIFICATE-INFEASIBLE` — statement: for every
  `m≥107, m≡2(mod 3)`, the Jensen-sufficient certificate for the symmetric convex-quadratic family `g(n)=An+Bn(n-1)`
  (`pb=pc=f(n)`) is infeasible for every `B≥0`. Grade: `proved_informal` (exact algebra, closed-form `C1,C2`; no gap seen; no
  second read).

## §8 Remaining obligation (successor inheritance)

`(L-S)_top` is **still open** after this route. What a successor inherits, precisely:

1. Two specific simple sub-families (flat-rate; symmetric convex-quadratic-in-`n` via Jensen) are now **proved** infeasible for
   the whole class, with exact margins — do not re-attempt either without a materially different mechanism.
2. **Untested and concretely promising:** break the `pb=pc=f(n)` symmetry. My `h(n)` collapsed `pb(β+1,γ)+pc(β,γ+1)` into
   `2f(n+1)` only because `pb=pc`; with `pb≠pc` (e.g. `pb` depending on `β` and `pc` on `γ` separately, still "depending only
   on the leg type and the choke's leg count" per the obligation's own suggested style), the In-side sum is
   `(d-n)(pb(β+1,γ)+pc(β,γ+1))`, a function of `(β,γ)` jointly, not reducible to a single-variable Jensen bound — the
   two-dimensional discrete-convexity argument needed is a genuinely different (and unexplored, by this route) problem.
3. **Also untested:** letting `σ` be state-dependent beyond `σ(γ)` (e.g. allowing chokes at `β≥2` a *different*, smaller
   switch-like arc if the literal network admits one — this would need U2's reduction lemma to confirm such an arc is literal,
   not just template).
4. The exact identities proved here (`2(8m-K+1)=p*`; `C2=-1/(2m)` exactly; `ρ_1(m)` formula reproduced against the recorded
   fixed point) are reusable building blocks for whichever successor construction is tried next; they do not need
   re-derivation.
5. `θ(m) ≤ 1-ρ_1(m)`: **not exercised** by this route beyond citing `ρ_1(m)`'s exact formula and reproducing the one recorded
   fixed point, because no candidate allocation of mine reached the switch-feasibility stage (both families failed at the
   Out/In stage before `θ`/residual capacity became the binding constraint).

## §9 Gate lines (`C1-STAGE1-GATE.md` ruling 6)

```
LS_top: template_failure_found
ELIG_top: not_advanced
cut_candidate: none
```

## §10 Verdict

```
headline_resolved: no
```

**Route verdict: `blocked`.** The assigned mechanism (a simple, uniformly-provable, sub-optimal sector allocation) was pursued
through two natural, increasingly general constructions; both are proved infeasible by exact algebra, cross-checked by an
independent exact DP and (for the first family) an explicit witness source. No feasible simple allocation is delivered. This
is reported as the obligation itself anticipates ("report the obstruction exactly — that is a template failure, not a cut"):
`(L-S)_top` is not refuted (the r30 LP already exhibits a — non-simple — feasible certificate at tested rows), only these two
simple sub-families are closed off. The smallest concrete open door for a successor is the `pb≠pc` (β/γ-asymmetric)
generalization named in §8.2, which this route did not have the remaining scope to attempt.

## Scratch and replay accounting

All work product is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T2/`
(four scripts + four JSON output payloads) and its byte-identical replay copies under
`.../scratchpad/c1-T2-replay/` (four scripts + four run logs, re-executed in the foreground this session with matching
payload digests). No background jobs were started; none needed to be killed. No source file was mutated. No file was written
outside this route's assigned `RETURN.md` and its two scratch directories.
