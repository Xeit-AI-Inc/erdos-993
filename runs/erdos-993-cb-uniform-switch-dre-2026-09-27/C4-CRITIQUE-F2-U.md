# Critique

Critic `C-F2-U` (cross-orientation U, formal / structural) of r31 Cycle 4 seat `F2`, route `C4-F-02`, mechanism
`COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`, orientation F. Clock at write: `Tue Sep 29 00:17:48 EDT 2026`.

**Boot.** Operating within VerityOS under the RESTRICTED BOOT. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-F2-U.md` (SHA-256 recomputed with `shasum -a 256`:
`22c63841462d9e6bec2d6c802f1f28ae7fc7c0caddc40c67b86508e7040a0c8a`, equal to the value the dispatch was issued under).
**Read-boundary disclosure (host context, no tool read):** the host injected the project `CLAUDE.md` and the user auto-memory
index `MEMORY.md` into my context at session start. I opened neither with a tool, and I used nothing from them. Every other read
was inside the grant: the capsule's 16 files; the Stage 2 members `control/C4-WORKER-COMMON-BRIEF.md` and
`control/C4-FROZEN-STATEMENTS.lean`; `sources/r30/records/SEMANTIC-CONTRACT.md` §1 (for `S` and (WID)); and `sources/c4-base/…`
(`Main.lean` entries 14–19, 23–26, 80–90; `ChokeState.lean`; `E1FlowConstruction.lean` §1–4). I also hashed six Stage 2 files the
return cites, without reading them. My only `grep` calls were on single named files under `sources/` and on the return. I ran no
recursive listing and no network, and installed nothing.

## Identity and seal audit

- **Capsule seal** `control/c4-critic-capsules/F2-PACKET-MANIFEST.json`: recomputed over canonical JSON without `seal_sha256`
  (sort_keys, separators `(",", ":")`, no trailing newline) = `6871ecf22481ac91e656861a06bad69c77f5ff949bb6c5b6655b608043be9401`.
  **Matches.** All 16 listed files match on bytes and SHA-256.
- **Stage 2 seal** recomputed = `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` (matches). **Stage 3 seal**
  = `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` (matches its manifest). **Stage 4 dispatch seal**
  = `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` (matches). `PATH-CHECK-F2.json`: 0 findings.
- **Return identity.** Route ID `C4-F-02`, mechanism token `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS` and orientation F are verbatim
  from `control/C4-ALLOCATION.md`. The return's model disclosure is present in two parts.
- **Every digest literal in the return was recomputed by me.** The eleven file digests in its table all match (lines 82–95:
  contracts, allocation, worker brief, gate, frozen `.md`/`.lean`, `ROUTE-STATE.md`, the five `sources/c4-base` files;
  `Statements.lean` = `control/C4-FROZEN-STATEMENTS.lean`). The generator files, copied out to
  `scratchpad/c4-crit-F2-U/replay/`, hash to `e239be38…f634c` (`composed_flow_check.py`) and `b95ad75e…363167` (`tree_check.py`),
  both matching. My replays reproduce the return's two output digests `ee183557…79f7cc` and `eb30e121…8f862f` exactly (exit 0;
  the `composed_flow_check.py` replay took about 4 minutes).
  **Label correction:** the return calls these "Stdout SHA-256". They are digests of the scripts' emitted text joined by `\n` with
  no trailing newline. The raw stdout file hashes to a different value (`c4eb1d3e…b4c0` in my replay). The value is backed but the
  label is wrong.
- **Admission defect for F2** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`). The only occurrence is at line 258: "the
  `proved_informal`/`formally_verified` keys they cite". That is a citation of governed grades, not a label on F2's own scratch.
  **Adjudicated: allowed, nothing struck.**
- **Host interruptions.** The final scratch, the replays and RETURN.md agree: the shipped generator is the post-fix file, and a
  pre-fix file would have failed its own assertion. No reported number comes from the pre-fix instrument **except one**: the
  "1512/1792" mismatch count, which is struck below.

## Independent re-derivation

My instrument is `scratchpad/c4-crit-F2-U/crit_f2u.py` (SHA-256 `55604606473437cb7e96594cfd3aa30e00a9442db0111701a70382d822d59d46`;
emitted-text digest `3b90547f3006295a17c12a084bc879626accf09cfb3305ca96be061bb0592b35`). It uses the standard library only and
exact integers and Fractions. I built it from the contracts and the Lean text; F2's code was not an input. Its main pieces:

- The template tables are **parsed from `Main.lean` entries 80–82 by regex**. `table_compare.py` then shows that F2's
  hand-typed tables and its `cb8Out`/`cb8In` equal mine on all 45 states at `m = 1, 107, 158, 161, 164`.
- The graph is built literally from `cbEdge` and checked to be a tree by union-find plus the edge count.
- Independence polynomials come from a **generic tree DP on the literal adjacency**, supporting deleted sets and forced
  inclusions. Its second side is the SEMANTIC-CONTRACT closed forms.

Results, with the difference index written out. The convention is `Δ_k = i_{k+1} − i_k`; favorability uses
`i_{p*+1}(T−t) − i_{p*}(T−t)` at `p = p*` (ruling 16), and `S` uses `i_p − i_{p−1}` of `T − H_t` and `T − R_t` at `p = p*`.

| row | tree / `n` / `α` | `x` | eligibility at `p*` | `F_{p*}` derived | (WID) | exact min `Σ_i Out` (all `K`-leg sector sources) | exact max `Σ_i In` (all `K−1`-leg in-sector targets) |
|---|---|---|---|---|---|---|---|
| 95 (fixed pt) | yes / 1618 / 856 | 506 | `p*=508`: `508 ≤ 508`, `1524 < 1713` | leafSet | holds, `S<0` | 1 | 1 |
| 107 (control) | yes / 1822 / 964 | 570 | `p*=572`: `572 ≤ 572`, `1716 < 1929` | leafSet | holds, `S<0` | 1 | 1 |
| 158 (fresh) | yes / 2689 / 1423 | 842 | `p*=844`: `844 ≤ 844`, `2532 < 2847` | leafSet | holds, `S<0` | 1 | 1 |
| 161 (structural) | yes / 2740 / 1450 | 857 | `p*=860`: `859 ≤ 860`, `2580 < 2901`; `x < p*−2` **true** | leafSet | holds, `S<0` | 1 | 1 |
| 164 (fresh) | yes / 2791 / 1477 | 873 | `p*=876`: `875 ≤ 876`, `2628 < 2955`; `x < p*−2` true | leafSet | holds, `S<0` | 1 | 1 |

Notes on the table:

- **`x`** is computed by scanning the literal-DP coefficients through rank `α` with zero extension. The DP polynomial equals the
  closed form `(1+2x)G^m + x(1+x)(1+2x)^{8m}` at every row. The fixed points `n, α, x` at 95 and 107 are reproduced.
- **`F_{p*}`.** `Δ_{p*}(T−t) < 0` was checked for `t = v`, `c_{0,0}` and `c_{m−1,7}`. `I(T−v)` and `I(T−c)` equal their contract
  closed forms. The other `c`-leaves follow by the choke/leg-permutation automorphisms.
- **(WID).** Side 1 is supply − capacity, computed twice, by forced-inclusion DPs `{v,r}` and `{c_{00},u_0}` (×8m) and by the
  closed generating functions `x²(1+2x)^{8m}` and `x²(1+x)^7(1+2x)G^{m−1}`. Side 2 is the aggregate
  `S = Σ_F [Δ_{p−1}(T−H_t) − Δ_{p−1}(T−R_t)]` from deletion DPs, with its `c`-summand equal at `c_{00}` and `c_{m−1,7}`. Both sides
  agree exactly at every row. Supply/capacity is 0.98823, 0.98876, 0.99013, 0.99019 and 0.99024.
- **Out/In certificates.** `K = p* − 1`. The min-plus and max-plus DPs run over every splitting of the legs across all `m` chokes
  and every state. The second instrument, a Lagrangian (affine-separation) dual bound, gives exactly `≥ 1` and `≤ 1`. Both
  extremes are attained with zero slack: the unscaled `g_sec` template is exactly tight on both sides.

Per-class inequalities, again exact at 95, 107, 158, 161 and 164:

- The pb and pc cells used are all nonnegative, and `σ ≥ 0`.
- **Switch-image class** (`q = 1`, `v ∈ A`, `r ∉ A`): `ρ_1γ + (8−γ)σ(γ) ≤ γ` for every `γ = 1..8`, with the minimum slack at
  `γ = 1`. `(1−ρ_1)/θ` is 30.99, 34.90, 51.50, 52.48 and 53.46.
- **`ρ_q < 1` for every `q ∈ [1, m]`**, not only `q = 1, 2`, at 107, 158, 161 and 164. `ρ_q` is the ratio `r_q(p−q)/r_q(p−q−1)` of
  coefficients of `(1+X)^{8q−1}(1+2X)^{8(m−q)+1}` (E1FlowConstruction §2), computed by two different formulas: the direct binomial
  sum, and `Σ_l C(b,l)C(a+b−l, k−l)` via `(1+2X) = (1+X)+X`. The formulas agree at every `q`, and the largest `ρ_q` is `ρ_1`.

**CB(8,1) literal.** Here `p = (16+4)/3 = 6` at the frozen text's own `m = 1`. I enumerated independent sets by
include/exclude recursion rather than a bitmask scan. The return's counts are reproduced: 33,573 sets; `|I_6| = 8484`,
`|I_7| = 8332`; 10,320 `r`-free sets at ranks 6–7; 33,236 `(A,z)` pairs at rank 5; `|Sec| = 1792`; 1,120 in-sector targets. The
Out bridge holds at 1792/1792 and the In bridge at 1120/1120. For these checks my `g_sec` implements the frozen guard, including a
literal `transportRel` test built from adjacency. `F_6(CB(8,1))` is the whole leafSet, derived with difference index
`i_7(T−t) − i_6(T−t)` at `p = 6`.

## Attacks and findings

1. **Ruling 29: F2's numeric row claims are rejected.** The worker brief's item 9 requires, for every number reported at a row,
   the difference index written out (`i_{p+1} − i_p` at `p = …`), or `none: no numeric claim` when there is no numeric claim.
   F2 reports numbers at rows 158, 161, 164 and 1: Out and In values, composed inflows, Hall sums and bridge counts. Its
   `## Instrument sides` instead says "none — no numeric claim … touches `x` or `Δ_k`". That is not the prescribed text, and it
   is false in substance. Every weight F2 uses rests on `F_{p*} = leafSet`, i.e. on `i_{p*+1}(T−t) − i_{p*}(T−t) < 0`, which F2
   neither derived nor wrote down. Gate ruling 29 therefore **REJECTS** these numeric claims; it does not narrow them.
2. **Fidelity: `F` not derived, (WID) absent, `x` not computed.** The allocation and SEMANTIC-CONTRACT §1 require (WID) to be
   asserted from independent sides on every instance before anything else, and require `F` to be derived. F2 assumes
   `F = leafSet` by citation and never mentions (WID); it also never computes `x` at the fresh rows. Under the protocol's
   fidelity-first duty, every number downstream of this gap is struck. (I supply all three independently above; they hold.)
3. **Wrong number: class (a), the in-sector target.** F2 computes the `g_sec` inflow of its in-sector target as a sum over the
   used chokes only, and prints "(+ 52 idle chokes)" as if an idle choke contributes nothing. But `cb8In(0,0) = 8(pb(1,0)+pc(0,1))`
   is positive (`31624/1668587` at `m = 158`), and the N4 bridge sums over **all** `m` chokes. Row by row, F2 printed vs true:
   - `m = 158`: F2 printed `23719/1668587`; the true inflow is **`1668167/1668587`**.
   - `m = 161`: printed `24169/1732469`; true **`1732041/1732469`**.
   - `m = 164`: printed `3517/256793`; true **`1797115/1797551`**.

   The same omission affects the "alt instrument, all-gamma legs" line, so those two instruments share one error. Both reported
   inflows are struck. The true values are still `≤ 1`, and my exhaustive DP shows the maximum over all in-sector targets is
   exactly 1, so no violation is hidden. But F2's "checked `≤ 1`" was checked on the wrong quantity. It is off by a factor of
   about 70, which put the test far from the binding case.
4. **Vacuous Hall test.** The "structured Hall test `X = {B1, B2}`" has three defects:
   - It never computes `Σ_{A∈N(X)} w(A)`. The inequality `Σ_{N(X)} w ≥ Σ_X rowsum(g)` is simply asserted.
   - `out_B2 = w_B2` is written in as a literal ("by N2 clause 3"), not computed.
   - `B2` is not an explicit set: only 13 of its `p*+1 = 845…877` members are specified.

   So "HALL HOLDS for this X" rests only on `Out(B1) ≥ 1` plus a spec assumed as a number. The Hall sums
   `20023226/1668587, 41579627/3464938, 3081543/256793` are struck as Hall evidence (a generator that writes the answer in does not
   derive it). The disjointness argument is also moot. The allocation's "Hall sums at structured `X` mixing `Sec` with `q ≥ 2`
   sources" is therefore not delivered.
5. **Coverage: F2 tested representative instances, not the census.** The allocation asked for the per-target census through r30's
   PROVED orbit quotient, every target class, and every source row sum at each row. Against that:
   - The orbit quotient is not used.
   - Sector sources: 1 (out of all `K`-leg splittings).
   - In-sector targets: 2.
   - `q = 2` targets: 3 (one with `(g1,g2) = (8,8)`, i.e. 16 legs at 2 chokes, legitimate).
   - The one-choke targets without `v` and the weight-zero class are not evaluated.
   - "Every `ρ_q` at m = 158/161/164" (Instrument-sides table) is an overclaim: the code computes `q = 1, 2` only.
   - "every source row sum" is not checked at all for `r`-free sources; there it is the spec.

   The exhaustive literal check "at every rank where the derived selector is nonempty" was done only for the class-free N1/N3/N4
   identities at `m = 1`, ranks 5–7. F2's step 6 also says N1 (B2) was tested, but the code has no N1 (B2) check. **Struck.** (I ran
   it: 19,920/19,920 hold on CB(8,1).)
6. **The self-disclosed bug count is contradicted.** F2 says the pre-fix instrument mismatched "1512/1792 sector sources … by exactly
   `−cb8Sigma(m,γ)`". That is impossible as stated. `cb8Out` has a switch term only in states `(1, γ ≥ 1)`, and CB(8,1) has exactly
   `C(8,5)·5 = 280` sector sources in such a state. Running the pre-fix guard myself gives **280 mismatches**; `1512 = 1792 − 280` is
   the number that *matched*. The literal "1512/1792" is struck. The diagnosis itself (the guard was wrong) and the fix stand.
7. **CB(8,1) cannot test the composition, and the composition fails there.** I evaluated the full frozen `g = cb8E1Arc + cb8GSec`
   literally on CB(8,1) at `p = 6` with `F` derived, under Lean conventions (ℕ truncation, `x/0 = 0`). Script: `cb81_bundle.py`;
   output digest `494cb454…185ff`. Results:
   - 1,400 negative `g_sec` deletion values (E1: 0 negative; the E1 rows equal `w_F` on every `r`-free source).
   - 1,736 sources with row sum `< w_F`.
   - 1,190 overloaded targets: all 1,120 in-sector targets, plus 70 one-choke `v`-targets.

   This is **off-class** (`m = 1`, `m % 3 = 1`), so it is not a cut and not a class statement. It shows that F2's CB(8,1) work
   confirms only the class-free bridge identities; it says nothing about the composed flow.
8. **Newton/Darroch, ℕ-subtraction, the endpoint 107.** F2 applies no Newton or Darroch step anywhere (confirmed). Its ℕ
   subtractions are safe by construction, as it says. It evaluates neither the endpoint row 107 nor the controls (only fixed points
   at 107). I did: row 107 passes every check above.
9. **Template vs cut.** F2 correctly reports `cut_candidate: no`. Nothing in it would be a cut: no eligible explicit `X` with exact
   `Σ_{N(X)}` appears.

## Mechanism-equivalence and fence check

- **Fence 1** (one rank, the class only): respected. `m = 95` and `m = 1` are used only as fixed points or as off-class, and are
  labeled so, both in F2 and here.
- **Fences 2–4.** Fence 2 (fidelity) is **violated** by F2: no (WID), `F` not derived, `x` not computed (findings 1–2). Fence 3 is
  respected. Fence 4: F2 does not claim the template proves the network, but its "HALL HOLDS" line (finding 4) treats a spec as a
  computed flow value. Struck.
- **Fence 7** (census discipline): F2 grades itself `bounded_computation` and makes no universal claim. The `θ*` law is not used
  as a hypothesis. Nothing is transferred to any aggregate key.
- **Claim identity.** F2 proposes no new key. Its citations are correct in name and grade. My results below are STATED
  (review-stage) and need an isolated second read before any registration. No `E993-R31-` name is proposed here.
- **Mechanism.** No refuted mechanism is revived. The mechanism token is honored in intent but not in coverage.

## Certification audit

Struck:
- the class-(a) inflow values at 158, 161, 164 (both "instruments");
- "HALL HOLDS for this X" and its three Hall sums;
- "every `ρ_q` at m = 158/161/164" (backed for `q ∈ {1, 2}` only);
- "N1 (B2) … tested";
- "1512/1792 … mismatched";
- "every target class" (four classes untested: one-choke without `v`, weight-zero, and `q ≥ 3`; plus source rows);
- "Stdout SHA-256" as a label (the value is backed as the emitted-text digest).

Every numeric claim at a row is rejected under ruling 29 (finding 1).

Backed by my replay and confirmed by my own instrument (my difference index written above):
- the fixed points `θ(107)`, `θ(95)`, `σ(95,1..3)`, `508/507`, `ρ_1(95)` and `(1−ρ_1)/θ(107) ≈ 34.90`;
- the switch-class inequalities at `γ = 0..8` and `ρ_1 < 1`, `ρ_2 < 1` at the three rows;
- the tree test;
- the CB(8,1) counts (33,573; 10,320; 33,236; 1792/1792; 1120/1120).

These survive as re-derived facts, not as F2's certified row claims. "compiled" and "formally_verified" do not appear as labels
on F2's own work. Correct.

The return's `## Remaining obligation` is honest but inexact. Item 1 misplaces the gap: the universal-over-distributions question
at the fresh rows is closable by exact DP, and I close it here. Item 3 names CB(8,2) as a meaningful literal test. It is not: the
template is off-class there too (finding 7). The real gap is the literal/orbit-quotient composed flow at a class row, below.

## Verdict

verdict: rejected
headline_resolved: no

- `COND4_formal`: no
- `E1_formal`: no
- `TERMINAL_integration`: no
- `cut_candidate`: no
- `FROZEN_NODES_CLOSED`: none

Reasons:
- **Ruling 29 (mandatory rejection):** numeric row claims without a written difference index.
- **Fidelity failure:** no (WID), `F` not derived, `x` not computed.
- **A wrong reported quantity:** the in-sector inflow omitted the idle chokes.
- **A vacuous Hall test.**
- **An unbacked bug-count literal.**
- **Allocated coverage (the orbit quotient, every class, every source row) not delivered.**

What survives from F2 does so only through my re-derivation: the CB(8,1) class-free bridge counts, the switch-class
inequalities, and the fixed points.

**Critic-derived advance (C-F2-U; STATED, `bounded_computation`, conditional).** At `m ∈ {158, 161, 164}` (fresh and structural)
and the controls 95 and 107, the following hold exactly:

- `CB(8,m)` is a tree. `x` equals 842, 857 and 873 at 158, 161 and 164, so `p*` is eligible. `x < p*−2` holds at 161 and 164.
- `F_{p*}` = leafSet, derived.
- (WID) holds from independent sides, with `S < 0`.
- **Over all** sector sources, `min Σ_i Out = 1`; **over all** in-sector targets, `max Σ_i In = 1`. Two instruments: an exact DP
  and a Lagrangian dual.
- Every switch-image class satisfies `ρ_1γ + (8−γ)σ(γ) ≤ γ`.
- `ρ_q < 1` for every `q ∈ [1, m]`.
- Hall holds exactly at `X = Sec`: `R_K < R_{K−1} + SW` (ratio 0.0393, 0.0386 and 0.0379).

Consequently, at these rows the composed function `cb8E1Arc + cb8GSec` meets every per-class inequality of N7's conclusion,
**conditional on** the frozen per-target formulas:
- N2 clauses 3–5 (E1 rows and columns);
- N3 and N4 (bridges);
- N5 (switch inflow and the no-preimage zeros);
- N6 (weight).

None of these is proved at these rows. The bridges are confirmed literally only at CB(8,1), where the composition itself fails
(off-class). In my judgment the per-class arithmetic of N7 at these rows is complete; the open part is entirely the frozen
bridges and specs.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id:
claude-opus-5-5

## Remaining obligation

A successor inherits:

1. **The literal composed-flow check at a class row is still undone.** Nobody has evaluated `cb8E1Arc + cb8GSec` arc by arc on
   the literal network, or on r30's PROVED orbit quotient, at a row with `m ≥ 107`, `m ≡ 2 (mod 3)`.

   The exact output to produce: for every quotient source class, the row sum minus `w_F`; for every quotient target class, `w_F`
   minus the column sum. These must be computed from the arc definitions (`cb8E1Val` with Lean truncations; the `g_sec` guard with
   literal `transportRel`), not from the N2/N4/N5 formulas.

   Until then, the per-class certificate above is conditional on N2–N6. Rows 158, 161 and 164 are fixed. The quotient must be the
   PROVED one (key `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`, whose scope must be checked to
   admit an arbitrary rational `g`), or the symmetry argument must be written on the face.
2. **A genuine structured-`X` Hall sum mixing `Sec` with `q ≥ 2` sources.** This needs an explicit `X` (defined by a predicate and
   counted exactly) and `N(X)` computed from (REL), with exact `Σ_X w` versus `Σ_{N(X)} w`. The tight family is the sector plus
   the `r`-free sources competing for the one-choke `v`-targets, since both template extremes are attained with zero slack.
3. **The N1 (B2) and bridge checks at a multi-choke size** need a rank-stratified tree-DP enumerator. Note, though, that no small
   `m` tests the composition; only a class row does.
4. **F2's replayable content is its CB(8,1) identities and its fixed points.** Its row numbers are not to be cited.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F2-U/`. Every
Python run was `python3 -B`, standard library only.

**My instrument**
- `crit_f2u.py`, SHA-256 `55604606473437cb7e96594cfd3aa30e00a9442db0111701a70382d822d59d46`. Its output `crit.stdout` hashes to
  `8417be325868b98b449a7f22090d6650e3c799261e8206d6dd559d591b03d0ea`, and its emitted-text digest (written to `crit.stderr`) is
  `3b90547f3006295a17c12a084bc879626accf09cfb3305ca96be061bb0592b35`.
- It took about 7 minutes. I ran it as a background job with literal PID 16846 (recorded in `crit.pid`) and polled that PID until
  it exited.
- Replay: `cp crit_f2u.py <target>/ && cd <target> && python3 -B crit_f2u.py`. It reads `Main.lean` by absolute path.

**Off-class bundle check**
- `cb81_bundle.py`, SHA-256 `eb71199a54e61e62b437699b6d89147c028bef99aa402cecf5c8ae43323d56c8`. Emitted digest
  `494cb4543c81c8881439c16ec2866562360235ca14b3fac2648e336a4a0185ff`; `bundle.stdout` hashes to `a112ca84…dd67`.
- `cb81_split.py`, SHA-256 `3261d80dca824361ea025713067f35b5239df9774e0288e7272850e1d7829501`; `split.stdout` hashes to
  `f30c3f6c…31fa1`.

**Table comparison**
- `table_compare.py`, SHA-256 `b7a9f0abc965a9e9674db285d4761232441cc3bf60a5330322eb9bc19534211c`; `compare.stdout` hashes to
  `c59100d2…47e9`.

**Replay of F2**
- `replay/` holds the copied-out `composed_flow_check.py` and `tree_check.py` with their outputs: `cfc.stdout`, `cfc.stderr`,
  `cfc.exit`, `stdout_digest.txt` (= `ee183557…79f7cc`), `tc.stdout`, and `tree_check_digest.txt` (= `eb30e121…8f862f`).
- The `composed_flow_check.py` replay ran under a background subshell, PID 8190. I confirmed it had exited before this write.

**Background jobs**
- PID 8190 and PID 16846 had both exited before this write; each was checked with `ps -p <PID>`. I never ran a full process
  listing and never killed anything.
