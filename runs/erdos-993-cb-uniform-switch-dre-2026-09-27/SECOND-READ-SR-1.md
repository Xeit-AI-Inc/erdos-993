# Second Read

Isolated second read `SR-1`, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 1: (L-S)_top at template level, the
closed-form allocation (S1) and the Residual (S2), and the proposed registration R-1. Written 2026-09-28.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the brief requires. Subsystems loaded: the constitution and the
startup protocol only. The controller owns conversation logging and durable updates. This reader writes only this file and scratch
under `scratchpad/c1-sr-SR-1/`.

## Identity and seal audit

- **Protocol** `control/C1-SECOND-READ-PROTOCOL.md`: SHA-256 `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`. I
  recomputed it with `shasum -a 256` before reading anything else. **MATCH.**
- **Brief** `control/C1-SECOND-READ-BRIEF-SR-1.md`: SHA-256 `d18e520fbb86b82624102ab9f11fb14baf021e1bad7e18400200dde08ea7d162`. **MATCH.**
- **Capsule** `control/c1-second-read/SR-1-PACKET-MANIFEST.json` (stage `cycle-1-second-read-SR-1`, 490 files):
  - The file itself hashes to `c3b4ff05…`. That is expected, because the seal is defined on the manifest minus its own field.
  - Inner seal, the SHA-256 of the compact key-sorted JSON without `seal_sha256` (separators `(",", ":")`, no trailing newline):
    **`5e4642ab3edd4ee8e346164c7f14587860df7a411a5aec497e79a22138e8db14`. MATCH** with the stored value and with the dispatch.
  - All **490/490** member SHA-256 digests match. There are 0 mismatches.
- **Frozen instruments.** All 391 capsule members under `sources/c1-stage7-sources/` match their entries in that directory's
  `SOURCE-DIGESTS.json`, with 0 mismatches and 0 missing. I checked this before reading any of them.
- **Table of record** `sources/c1-stage7-sources/ADJ-T/adj_alloc_out.json`: SHA-256
  `7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13`. **MATCH** with the brief and the synthesis.
  - Its 72 intercepts equal those of C-T1-U's `crit_alloc_out.json` (`da76863d…`) cell by cell, as exact `Fraction`s.
  - The two files differ as bytes only in key names and in extra fields.
- **Registries.** `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and `sources/authority/CLAIM-IDENTITY.json` are
  byte-identical (`cmp`). Each holds 491 claims, with SHA-256 `b4a339ef…`.
- **Path check** `control/c1-second-read/PATH-CHECK-SR-1.json`: 0 findings.
- **Read-boundary disclosures (this reader):**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use either, and I
     wrote no conversation log, because the brief confines my writes.
  2. **A listing outside the capsule.** I ran one `ls` of `cycles/cycle-1/*/` together with a `wc -c` on the result. It printed:
     - the non-member name `cycles/cycle-1/stage2/ROUTE-STATE.md` and its size (1621 bytes);
     - the directory names `stage3/returns`, `stage4/critics` and `stage5/adjudicators`;
     - the member `stage6/SYNTHESIS.md`.

     I did not open `ROUTE-STATE.md`. From then on I listed members only through the manifest.
  3. **Tool-results files.** The harness saved two oversized tool outputs to its own tool-results files outside the run root:
     - my combined print of the brief and the manifest, which I did not read back (I re-read the brief directly);
     - my print of the capsule member `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md`, which I **did** read back from the
       tool-results copy. That copy is the member's text, and the member's digest had already matched.
  4. I ran one scratch-free foreground `python3 -B -c` timing test of my DP loop, on synthetic data.
  5. I used no network, installed nothing, invoked no `lake`/`lean`, did not grep Mathlib and started no background job. I killed
     nothing. Every computation was foreground Python standard library, with exact integers and `Fraction`s.
- **Controller facts** (CF6-1..7, CF-T-1..4, CF-F-1..3): I read them as facts, never authority. CF6-7, CF-T-4 and CF-F-3 are
  controller priors. I cite none of them as evidence.

## Statements read

- **SR-1a (S1): the allocation.** `L = 200m²+82m+5`, `D = L/3`, `θ = 288/L`, `pb = (25m/2 + B_pb)/D`, `pc = (25m/2 + B_pc)/D` and
  `σ(γ) = c_γθ` with `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)`, using the table of record. I test four claims: nonnegativity for
  `m ≥ 689/200`; Out over every assignment with total `K = p*−1`; In over every assignment with total `K−1`; and Switch.
- **SR-1b (S2): the Residual.** `288/L ≤ 1 − ρ_1(m)`, where `ρ_1 = r_1(p*−1)/r_1(p*−2)` and
  `r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7}`. I also test the human bounds `1−ρ_1 ≥ 9/(20m)` and
  `15/32 − 1/(8m) ≤ m(1−ρ_1) ≤ 15/32`, and the `2/(5m)` bound quoted elsewhere.
- **SR-1c (R-1): the registration.** The proposed key is
  `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`,
  covering S1 ∧ S2 at template level with the intercept table on the face. It is proposed at grade `proved_informal`, with the fence
  and the attribution of synthesis row R-1.

**Sources read.**
- The two contracts.
- The synthesis, in full.
- The T adjudication, in full.
- T1's return, in full.
- The Residual and allocation sections of C-T1-F, C-T1-U, C-F1-T, C-F2-T and C-F2-U.
- The allocation and Residual sections of the F adjudication.
- The three controller-facts files.
- The alias pre-screen.
- The registries, parsed programmatically.
- `CLAIM-DISTINCTIONS.json`, for the row format.
- The allocation tables `adj_alloc_out.json`, `crit_alloc_out.json`, C-F2-U's `closed_forms.json` and C-F1-T's
  `uniform_proof_out_M0_107.json`, read as data.

I ran no seat instrument. A struck item was never used as evidence.

## Independent re-derivation

**Definitions: from the contract, not from a seat** (SEMANTIC-CONTRACT §2).
- **Sector.** A sector source is `B ∈ I_{p*+1}` with `r, v ∈ B`. It is `{r, v}` plus `K = p*−1` legs, and each leg `(i,j)` is in one
  of the states empty, `b_ij` or `c_ij`. At most one of these is present, because `b_ij ~ c_ij`.
- **Choke state.** The state `(β,γ)` counts the legs in state `b` and in state `c`, with `β+γ ≤ 8`.
  - The brief's gloss "`β` lone supports, `γ` supported leaves" should read as follows. `β` counts supports `b_ij ∈ B`, whose leaf
    is then absent. `γ` counts private leaves `c_ij ∈ B`, whose support is then absent.
  - There are 45 states. `pb` is defined where `β ≥ 1` (36 cells) and `pc` where `γ ≥ 1` (36 cells), for 72 intercepts. The key sets of
    the table of record are exactly these.
- **Nonzero sector arcs.**
  - A `b`-deletion carries `pb(β,γ)` and a `c`-deletion carries `pc(β,γ)`. Each lands on an in-sector target of weight 1.
  - The `u_i`-switch at `(1,γ)`, `γ ≥ 1`, carries `σ(γ)`.
- **Out and In.** From these arcs, `Out(β,γ) = β·pb + γ·pc + [β=1, γ≥1]·σ(γ)`.
  - An in-sector target's preimages are exactly the additions of `b` or `c` at an empty leg. So
    `In(β,γ) = (8−β−γ)(pb(β+1,γ) + pc(β,γ+1))`, which is 0 at `β+γ = 8`.
  - In uses only defined cells.
  - These agree with the synthesis's C1-LA1 definitions.
  - A switch image, of weight `γ`, has `8−γ` sector preimages. The Switch row `(8−γ)σ(γ) ≤ θγ` bounds exactly that load.

**SR-1a: the per-state cancellation, from the face** (`sr1_alloc.py`). Multiplying by `D`:

```text
D·Out(s) = (25m/2)·n + E(s),        E(s) := β·B_pb + γ·B_pc + [β=1,γ≥1]·96·c_γ      (n = β+γ;  σ·D = 96·c_γ)
D·In(s)  = 25m·(8−n) + F(s),        F(s) := (8−n)·(B_pb(β+1,γ) + B_pc(β,γ+1)),   F = 0 at n = 8
Per-state affine bounds (m-free), checked exactly at all 45 states each:
  E(s) ≥ a + λn   with a = −7/2,  λ = 5          (40 tight; slack 7/2, 96/7, 42, 72, 72 at (0,0),(0,2),(0,3),(0,4),(0,5))
  F(s) ≤ a2 + λ2n with a2 = 24,   λ2 = −5/2      (36 tight; slack 4 at the nine n = 8 states, where F = 0)
Summation over the m chokes of an ARBITRARY assignment (Σ n_i = K, resp. K−1), K = (16m+1)/3:
  D·ΣOut ≥ (25m/2)K + m·a + λK = (25m/2 + 5)(16m+1)/3 − 7m/2 = (400m² + 164m + 10)/6 = D
  D·ΣIn  ≤ 25m(8m − K + 1) + m·a2 + λ2(K−1) = (200m²+50m)/3 + 24m − (40m−5)/3 = (200m² + 82m + 5)/3 = D
```

- **Out and In.** For every assignment, `ΣOut ≥ 1` and `ΣIn ≤ 1` hold **identically in `m`**. No census, DP, LP optimality or
  `θ*` law is used, and there is no `M_0`.
  - In the `L`-normalization these are the seats' `a = −21/(2L)`, `λ = (75m+30)/(2L)`, `a2 = (600m+72)/L` and
    `λ2 = −(150m+15)/(2L)`.
  - T1's `a(m) = (−7/2)/D`, `λ(m) = (25m/2+5)/D`, `a2 = (200m+24)/D` and `λ2 = (−25m−5/2)/D` are the same four numbers.
  - My slacks equal the `out_slack`/`in_slack` fields of the table of record, cell for cell.
  - A grid scan finds that `λ2 = −5/2` (in the `D`-normalization) is the only feasible slope on a step-`1/24` grid in that
    normalization, so the In aggregate is tight on both coefficients.
- **Switch.** `(8−γ)c_γ ≤ γ` holds with equality at `γ = 1..6`, and at `γ = 7` it reads `7/2 ≤ 7`.
- **Nonnegativity.** The most negative intercept is `B_pc(1,7) = −689/16`, so `pb, pc ≥ 0` if and only if `m ≥ 689/200`. Also
  `σ ≥ 0`.
- **The count of per-state inequalities is 90, not 45.** There are 45 Out rows and 45 In rows over the 45 states, and the nine In rows
  at `n = 8` are trivial. C-F2-U's face also says 90.
- **Fresh rows, exact.** The results are in `sr1_alloc_out.json`.
  - At `m = 110`, `113` and `1001` I ran an exact min-plus/max-plus DP over **all** splittings, with no affine relaxation. It gives
    `minOut = 1` and `maxIn = 1`, with nonnegativity and Switch holding. The ops counts are 0.38M, 0.41M and 32M.
  - At `m = 10⁶+1` (`K = 5333339`), every per-state affine bound holds at the row and the sums equal exactly 1.
  - The decomposition `L·Out = (75/2)mn + 3E` and `L·In = 75m(8−n) + 3F` is asserted at every row.

**SR-1b: the Residual** (`sr1_residual.py`, `sr1_residual_show.py`; my own product-form symbolic algebra).
- **Rational form.** Let `N = 8m−7` and `K = (16m+1)/3`. Divide `r_1(K)` and `r_1(K−1)` by `C(N,K−8)·2^{K−8}` and multiply by
  `Π_{j=K−7}^{K} j`, using `C(N,k)/C(N,k−1) = (N−k+1)/k`. This gives

```text
ρ_1(m) = P(m)/Q(m),
P = Σ_{i=0}^{7} C(7,i)·2^{8−i}·Π_{j=K−7}^{K−i}(N−j+1)·Π_{j=K−i+1}^{K} j
Q = Σ_{i=0}^{7} C(7,i)·2^{7−i}·Π_{j=K−7}^{K−1−i}(N−j+1)·Π_{j=K−i}^{K} j
3^8·P = [−431132800, 6048136960, −22509853696, −15567405056, 354404728832, −1175359324160, 1917568679936, −1606317768704, 549755813888]
3^8·Q = [33420800, 85669888, −5899110400, 25202458624, 38712246272, −482783264768, 1235474186240, −1348619730944, 549755813888]
        (coefficients of m^0 … m^8; deg P = deg Q = 8, deg(Q−P) = 7)
```

- **Where the class enters.** The identity `ρ_1 = P/Q` holds whenever `K` is an integer with `K ≥ 8` and `N−K+1 = (8m−19)/3 > 0`.
  The residue class `m ≡ 2 (mod 3)` is used **only** to make `K` an integer.
  - I checked the identity against direct binomial sums at `m = 8, 11, 95, 107, 110, 113, 161, 302, 1001, 2000`.
  - It reproduces the fixed point `ρ_1(95) = 1354839571516225/1361543988640524`.
- **The certificate: one explicit shift, `m = 107 + t`, with real `t ≥ 0`.** Put `R := (Q−P)·L − 288·Q`, so that
  `R/(QL) = 1 − ρ_1 − 288/L`.
  - `R` has degree 9. Its leading coefficient is `17179869184000/2187`, and `R(107) = 13736854315533908060107804800`.
  - `3^8·R(107+t)`, from `t^0` to `t^9`, is `[90127501164217970782367307292800, 7623352623161277005880559173120, 286581710636287134057314118144,
    6284403254386739698484097024, 88591168066243079697997824, 832572196305810330746880, 5216251090132903919616, 21009026643558137856,
    49359024738533376, 51539607552000]`. All 10 coefficients are **positive**.
  - `Q(107+t)` has all 9 coefficients positive. Independently, every linear factor of `Q` is positive for `m ≥ 107`.
  - Hence `288/L < 1 − ρ_1(m)` for every real `m ≥ 107`, and in particular on the whole class.
  - The residue class is **not** used for positivity.
  - The variant shift `m = 107 + 3s` also has all 10 coefficients positive.
  - No Darroch, no Newton, no asymptotic step and no `M_0` beyond 107 is used.
- **Concordance.** My `R` equals C-T1-U's `G` exactly: the same leading coefficient `17179869184000/2187`, and the same `R(107)` as the
  T adjudicator's constant `13736854315533908060107804800`. C-T1-F's `Q` matches `R/2` in both of its quoted values: leading coefficient
  `8589934592000/2187` and constant `6868427157766954030053902400`.
- **Human bounds.** Each is proved by a positive-coefficient certificate at `m = 107 + t`.

| Bound | Holds for real `m ≥ 107`? | Origin |
|---|---|---|
| `1−ρ_1 ≥ 9/(20m)` | **yes** (degree 8, all coefficients positive) | C-T1-F |
| `1−ρ_1 ≥ 2/(5m)` | **yes**. It is weaker than `9/(20m)` | C-T1-U (C-F2-U states it from `m ≥ 3`) |
| `m(1−ρ_1) ≤ 15/32` | **yes** (degree 7) | C-F2-T (R2) |
| `m(1−ρ_1) ≥ 15/32 − 1/(8m)` | **yes** (degree 8). It implies `9/(20m)` for `m ≥ 7` | C-F2-T (R2) |
| `288/L ≤ 9/(20m)`, i.e. `1800m² − 5022m + 45 ≥ 0` | **yes** for `m ≥ 3` | elementary |

  - `lim m(1−ρ_1) = lead(Q−P)/lead(Q) = 15/32` exactly.
  - The margins `(1−ρ_1)/θ` are 34.90 at 107, 35.88 at 110, 36.85 at 113, 52.48 at 161, 98.38 at 302, 325.92 at 1001 and 651.11 at
    2000.
  - The `9/(20m)` quoted in S2 is correct. The `2/(5m)` quoted elsewhere is C-T1-U's, and it is also correct but weaker. There is no
    conflict.
  - The one-line human route is `288/L ≤ 9/(20m) ≤ 1−ρ_1`.

**Attribution support: the other two closed forms** (`sr1_ftables.py`). I read C-F2-U's and C-F1-T's tables in the `L`-normalization
(`c = 3B`) and tested them with the same contract-derived Out/In and affine sums.
- **Feasibility.** Both are feasible on all 90 rows and on Switch, with `σ(γ) = γθ/(8−γ)` for every `γ`, so `σ(7) = 7θ`, tight.
  Both are nonnegative from `m ≥ 1069/40`.
- **Tight rows.** C-F2-U has 39 Out and 36 In rows tight. C-F1-T has 44 and 31.
- **Differences from the table of record.**
  - C-F2-U differs in `pb(1,7)` (`−5345/16` against `31/16`), in `pc(0,8)` (`5449/16` against `73/16`) and in `σ(7)`.
  - C-F1-T differs in `pb(1,7)`, in `pc(0,2..5)` and in `σ(7)`.
  - The two F tables differ from each other in `pc(0,2)`, `pc(0,3)`, `pc(0,4)`, `pc(0,5)` and `pc(0,8)`.

**SR-1c: the alias check** (`sr1_alias.py`, against both frozen registries).
- The key is absent from both, and no `E993-R31-` key is present.
- It hits none of the registered `alias_patterns` and none of the `aliases`.
- **Nearest mathematical neighbours:**
  - `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (VERIFIED,
    `computer_assisted`) holds finitely many rows `m ∈ {95,…,107}`, each with full literal (HALL) and a per-row certificate. Its own
    text says "the θ* law 288/(200m² + 82m + 5) is a conjecture record and is not part of this key". It shares only `m = 107`, where
    both have `θ = 96/766193`.
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` says deletion-only allocations fail. The new allocation uses the switch arcs, so
    the two are consistent and neither implies the other.
  - `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-…` and `E993-R30-CB-7-M-109-TO-121-…` concern other ranks or `d`.
- The `θ*` law is not a key. The new key asserts feasibility at `θ = 288/L`, **not** optimality.
- **Not an alias** of any registered key. The controller's lexical pre-screen agrees, but it is not my verdict.

## Findings and repairs

1. **S1 is true as stated. No mathematical defect.**
   - The `m`-terms cancel state by state.
   - Summing the per-state affine bounds over an arbitrary assignment gives exactly 1 on both sides, identically in `m`.
   - Nonnegativity holds from `689/200`, and Switch is tight at `γ ≤ 6`.
   - No LP optimality and no `θ*` law enters.
   - **Repair (count):** "45 `m`-free per-state inequalities" (synthesis C1-LA1 DAG; brief) should read **90**: 45 Out rows
     `E(s) ≥ −7/2 + 5n` and 45 In rows `F(s) ≤ 24 − 5n/2`, of which the nine at `n = 8` are trivial. They are completed by the two
     aggregate identities. The affine data are named `a = −7/2`, `λ = 5`, `a2 = 24`, `λ2 = −5/2` in the `D`-normalization.
   - **Repair (face):** the registered statement must state Out and In explicitly from the contract, as in my registration text,
     rather than by reference to "the certificate".
2. **S2 is true as stated. It is Darroch/Newton-free.**
   - `ρ_1 = P/Q` with `P, Q` of degree 8.
   - `R = (Q−P)L − 288Q` has degree 9, with 10 positive coefficients at `m = 107 + t`.
   - Every quoted human bound holds for real `m ≥ 107`, and the table above gives each bound's origin.
   - "Degree 9 in T's normalization, 16 in F's" is accurate as a report of different clearings. C-F2-U's degree 10 is a third
     clearing.
3. **Synthesis Row 1 misdescribes the three allocations.** It says "They differ only in five `pc(0,·)` cells and in `σ(7)`".
   - **Correct record:** the two F tables differ from each other in five `pc(0,·)` cells (`(0,2)`, `(0,3)`, `(0,4)`, `(0,5)`, `(0,8)`).
   - Each also differs from the table of record in `σ(7)` (`7θ` against `(7/2)θ`) and in `pb(1,7)` (`−5345/16` against `31/16`).
     C-F2-U also differs in `pc(0,8)`, and C-F1-T in `pc(0,2..5)`.
   - All three are feasible with `θ = 288/L`. The F tables are nonnegative only from `m ≥ 1069/40`.
   - This is a record correction and does not touch S1.
4. **Attribution: "independently" means different tables.** C-F2-U (F-8) and C-F1-T (item 6) are independent feasible allocations
   with the same `θ`. They are not re-derivations of the table of record. The registered statement concerns the table of record only.
5. **The state-definition gloss.** See the definitions above: `γ` counts present private leaves whose support is absent.
6. **Corollary, for the record.** `ρ_1 < 1` at `p*` on the class, Darroch-free. This is E1 condition (i) at `q = 1` only, and it is
   not E1(i).
7. **Grade.** `proved_informal` is right.
   - The proof is universal on the class. It consists of finitely many fixed exact facts written on the face: 72 intercepts,
     90 `m`-free rational inequalities, two ring identities, seven Switch rows and one explicit degree-9 polynomial with 10 listed
     positive coefficients.
   - It has no per-row certificate, no finite-range certificate and no census, so it is not `computer_assisted` in the contract's
     sense.
   - It is not `formally_verified`. Only a C1-LA1 award whose `expected_statement` matches this statement can raise it, at template
     scope.
8. **Name.** The key is a predicate the statement satisfies: the closed-form choke-local allocation satisfies Out, In, Switch and
   residual capacity on the residue-2 class from 107 at the top rank.
   - "TOP-RANK" is the contract's defined term for `p* = (16m+4)/3` (SEMANTIC-CONTRACT §2).
   - The name has no working label and no "FOR-EVERY-M", and it is class-scoped.
   - The earlier names should travel as ALIASES so that they are never registered separately: T1's struck `…-FOR-EVERY-M`, the T
     adjudicator's `…-OUT-IN-SWITCH-ON-THE-RESIDUE-2-CLASS-FROM-107`, and C-T1-U's Residual-only name.
9. **The fence must be on the face.** It reads: "template level: not a flow on the literal network, not (HALL), not eligibility".
   Synthesis row R-1 names it only through C1-LA1's fences. My registration text puts it in the key's `FENCES` field.
10. **No cut and no template failure.** Nothing in this read bears on outcome C.

## Registration text

```text
KEY: E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let m >= 107 be an integer with m ≡ 2 (mod 3), T = CB(8,m) (path r – s – v; chokes u_1..u_m adjacent to r; supports b_ij adjacent to u_i; one private leaf c_ij adjacent to each b_ij), p* = (16m+4)/3, K = p* − 1 = (16m+1)/3, L = 200m² + 82m + 5, D = L/3 and θ = 288/L. At a choke of a root-plus-arm sector member (r, v ∈ B; K legs, each empty, b_ij or c_ij) let (β, γ) count its legs in state b_ij and in state c_ij (β + γ <= 8; 45 states). Put pb(β,γ) = (25m/2 + B_pb(β,γ))/D for β >= 1, pc(β,γ) = (25m/2 + B_pc(β,γ))/D for γ >= 1 and σ(γ) = c_γ·θ for γ = 1..7 with (c_1..c_7) = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2), where the 72 intercepts are the table of record (sources/c1-stage7-sources/ADJ-T/adj_alloc_out.json, SHA-256 7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13, content-equal to C-T1-U's crit_alloc_out.json): B_pb: (1,0) 3/2; (1,1) -197/28; (1,2) -44/3; (1,3) -753/40; (1,4) -76/5; (1,5) -7/12; (1,6) 0; (1,7) 31/16; (2,0) 13/4; (2,1) 73/12; (2,2) 429/40; (2,3) 733/40; (2,4) 365/12; (2,5) 189/4; (2,6) 793/16; (3,0) 23/6; (3,1) 231/40; (3,2) 171/20; (3,3) 149/12; (3,4) 171/10; (3,5) 271/16; (4,0) 33/8; (4,1) 223/40; (4,2) 89/12; (4,3) 189/20; (4,4) 749/80; (5,0) 43/10; (5,1) 65/12; (5,2) 33/5; (5,3) 539/80; (6,0) 53/12; (6,1) 21/4; (6,2) 89/16; (7,0) 9/2; (7,1) 79/16; (8,0) 73/16. B_pc: (0,1) 3/2; (0,2) 283/28; (0,3) 107/6; (0,4) 177/8; (0,5) 187/10; (0,6) 53/12; (0,7) 9/2; (0,8) 73/16; (1,1) -5/28; (1,2) -35/12; (1,3) -297/40; (1,4) -593/40; (1,5) -319/12; (1,6) -171/4; (1,7) -689/16; (2,1) -2/3; (2,2) -99/40; (2,3) -101/20; (2,4) -103/12; (2,5) -63/5; (2,6) -167/16; (3,1) -33/40; (3,2) -83/40; (3,3) -43/12; (3,4) -99/20; (3,5) -229/80; (4,1) -4/5; (4,2) -19/12; (4,3) -21/10; (4,4) -19/80; (5,1) -7/12; (5,2) -3/4; (5,3) 15/16; (6,1) 0; (6,2) 25/16; (7,1) 31/16. With Out(β,γ) := β·pb(β,γ) + γ·pc(β,γ) + [β = 1 and γ >= 1]·σ(γ) and In(β,γ) := (8 − β − γ)·(pb(β+1,γ) + pc(β,γ+1)) for β + γ <= 7, In := 0 at β + γ = 8: (i) pb, pc and σ are nonnegative (pb, pc exactly for m >= 689/200); (ii) Σ_i Out(β_i,γ_i) >= 1 for every assignment of states to the m chokes with Σ_i (β_i + γ_i) = K; (iii) Σ_i In(β_i,γ_i) <= 1 for every assignment with Σ_i (β_i + γ_i) = K − 1; (iv) (8 − γ)·σ(γ) <= θ·γ for γ = 1..7; (v) θ <= 1 − ρ_1(m) with ρ_1 = r_1(p* − 1)/r_1(p* − 2) and r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7} = Σ_{i=0}^{7} C(7,i)·C(8m−7, k−i)·2^{k−i}. Proof on the face: multiplying by D cancels the m-terms state by state; the 45 Out rows β·B_pb + γ·B_pc + [β=1,γ>=1]·96c_γ >= −7/2 + 5(β+γ) and the 45 In rows (8−n)(B_pb(β+1,γ) + B_pc(β,γ+1)) <= 24 − 5n/2 (n = β+γ; trivial at n = 8) hold exactly, and summing them over the m chokes of any assignment gives D·ΣOut >= (25m/2 + 5)K − 7m/2 = D and D·ΣIn <= 25m(8m − K + 1) + 24m − 5(K−1)/2 = D identically in m; (iv) is (8−γ)c_γ <= γ (equality for γ <= 6); for (v), ρ_1 = P/Q with P, Q explicit degree-8 polynomials in m (normalisation at C(8m−7, K−8)·2^{K−8}; valid because K is an integer, which uses m ≡ 2 (mod 3)), and (Q − P)·L − 288·Q, of degree 9, has all 10 coefficients positive after the shift m = 107 + t, while Q > 0 there; equivalently 288/L <= 9/(20m) <= 1 − ρ_1(m), and 15/32 − 1/(8m) <= m(1 − ρ_1(m)) <= 15/32, for every real m >= 107. No Darroch, no Newton, no LP optimality, no θ* law, no M_0 beyond 107.
SCOPE: CB(8,m) for every integer m >= 107 with m ≡ 2 (mod 3), at the single rank p* = (16m+4)/3; template level only (the per-choke-state Out, In, Switch and residual-capacity rows of the choke-local sector certificate of SEMANTIC-CONTRACT §2), for the one allocation fixed by the table of record.
ATTRIBUTION: closed-form allocation and the per-state m-cancellation proof: r31 T1 (seat of origin); table of record shipped by the r31 T adjudicator (adj_alloc_out.json), content-equal to C-T1-U's recovered table (crit_alloc_out.json); the proof confirmed by C-T1-F, C-T1-U and the T adjudicator; independent feasible allocations with the same θ but different tables: C-F2-U (F-8) and C-F1-T (item 6), verified by the F adjudicator; Residual (v): C-T1-F (degree 9; 9/(20m)) and C-T1-U (degree 9; 2/(5m)), with C-F1-T and C-F2-U (other clearings) and C-F2-T (15/32 − 1/(8m) <= m(1 − ρ_1) <= 15/32); the choke-local sector certificate, its Out/In/Switch/residual-capacity rows, r_q, ρ_q and the E1 flow whose load ρ_1·γ motivates (v): r30 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL and the certificate paragraph of E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, with their named seats as registered); the θ = 288/(200m² + 82m + 5) value first recorded by r30 as a conjecture; mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; isolated second read: r31 SR-1.
FENCES: template level: not a flow on the literal network, not (HALL), not eligibility; the template-to-network composition, the E1 flow, favorability and (ELIG-top)(a) are separate statements at their own grades and are not asserted here; (v) is an arithmetic inequality and says nothing about switch-image loads without the E1 criterion key and the composition; one rank p*, the class only (nothing at m < 107, at m ≡ 0, 1 (mod 3), at other ranks, for d ≠ 8 or for heterogeneous patterns); no optimality or uniqueness of the allocation (at least three distinct feasible closed forms share θ = 288/L) and the θ* law stays a conjecture; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer; formally_verified only through a governed award whose expected statement is this statement.
ALIASES: E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-CLOSED-FORM-SATISFIES-OUT-IN-SWITCH-FOR-EVERY-M; E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-ON-THE-RESIDUE-2-CLASS-FROM-107; E993-R31-CB-8-TOP-RANK-E1-RESIDUAL-CAPACITY-EXCEEDS-288-OVER-200M2-PLUS-82M-PLUS-5-ON-THE-RESIDUE-2-CLASS-FROM-107; (L-S)_top at template level on the r31 class; closed-form choke-local sector allocation of CB(8,m) at rank (16m+4)/3; residual capacity 288/(200m²+82m+5) <= 1 − ρ_1(m)
```

```text
SCOPE NOTE ON: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: [r31 C1; SR-1] This key's row m = 107 is the first member of the r31 class (m >= 107, m ≡ 2 (mod 3), rank (16m+4)/3). E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 gives a closed-form template allocation with θ = 288/(200m² + 82m + 5) (= 96/766193 at m = 107) that satisfies Out, In, Switch and residual capacity uniformly on the class. It is template level only and does not replace this key's literal-network (HALL) certificate at m = 107. It does not make the θ* law part of this key. No status transfer in either direction.
```

```text
DISTINCTION ROW: SR-C1-1-D1
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key certifies full literal weighted Hall at finitely many rows m ∈ {95, 98, 101, 104, 107} by per-row certificates (computer_assisted). The new key is a uniform template-level statement on the infinite class m >= 107, m ≡ 2 (mod 3): one closed-form allocation (72 intercepts, θ = 288/L) satisfies the per-state Out, In, Switch and residual-capacity rows, proved by m-cancellation and one degree-9 positivity certificate. It asserts no flow on the literal network and no (HALL). The two share only the row m = 107, where both use θ = 96/766193. Neither implies the other; no status transfers.
```

```text
DISTINCTION ROW: SR-C1-1-D2
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The registered key shows that deletion arcs alone cannot serve the root-plus-arm sector (R_K/R_{K−1} = p*/(p* − 1) > 1 for CB(8,m) at p*). The new key's allocation uses the u_i-switch arcs (σ(γ) = c_γθ > 0), and its In row bounds only the deletion inflow of in-sector targets. The two are consistent, and neither is derived from the other.
```

```text
RECORD: SR-C1-1-REC-1
CLAIM: Correction to the r31 Cycle 1 synthesis, reconciliation Row 1. The three feasible closed-form allocations with θ = 288/L do not "differ only in five pc(0,·) cells and in σ(7)". C-F2-U's and C-F1-T's tables differ from each other in pc(0,2), pc(0,3), pc(0,4), pc(0,5) and pc(0,8) (intercepts in the D-normalisation). Each differs from the table of record in σ(7) (7θ against (7/2)θ) and in pb(1,7) (−5345/16 against 31/16). C-F2-U also differs in pc(0,8) (5449/16 against 73/16), and C-F1-T in pc(0,2..5). All three are feasible, and the two F tables are nonnegative from m >= 1069/40.
STATUS: record
PROVENANCE: r31 SR-1 instrument sr1_ftables.py on the frozen tables adj_alloc_out.json (7d635805…), C-F2-U closed_forms.json and C-F1-T uniform_proof_out_M0_107.json
```

```text
RECORD: SR-C1-1-REC-2
CLAIM: Count correction to the synthesis's C1-LA1 informal DAG and to the SR-1 brief. The m-free per-state inequalities number 90, not 45: 45 Out rows β·B_pb + γ·B_pc + [β=1,γ>=1]·96c_γ >= −7/2 + 5n and 45 In rows (8−n)(B_pb(β+1,γ) + B_pc(β,γ+1)) <= 24 − 5n/2, of which the nine In rows at n = 8 are trivial. With them come the two aggregate identities (25m/2 + 5)K − 7m/2 = D and 25m(8m − K + 1) + 24m − 5(K − 1)/2 = D.
STATUS: record
PROVENANCE: r31 SR-1 instrument sr1_alloc.py; concordant with C-F2-U's "90 affine rows"
```

```text
RECORD: SR-C1-1-REC-3
CLAIM: On CB(8,m), m >= 107, m ≡ 2 (mod 3): ρ_1(m) = r_1(p*−1)/r_1(p*−2) < 1, i.e. E1 condition (i) of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL at q = 1 only, strictly, at p*, without Darroch or Newton (a corollary of (v) of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107). It says nothing at q >= 2.
STATUS: proved_informal
PROVENANCE: C-T1-U (stated at q = 1 only); the r31 T adjudicator (R2 corollary); C-F2-T and C-F1-T (side consequence at q = 1); r31 SR-1 re-derivation
```

## Verdicts

verdict[SR-1a]: confirmed_with_repairs
verdict[SR-1b]: confirmed
verdict[SR-1c]: confirmed_with_repairs

- **SR-1a.** The mathematics of S1 is confirmed exactly. The repairs are to the count (90 rows, not 45; REC-2), to the explicit Out/In
  definitions on the face, and to the Row 1 record of the three tables (REC-1).
- **SR-1b.** Confirmed, together with the human-checkable bounds (`9/(20m)`, `2/(5m)`, and `15/32 − 1/(8m) ≤ m(1−ρ_1) ≤ 15/32`, all for
  real `m ≥ 107`).
- **SR-1c.** The key is a true predicate and alias-clear against both registries, and the grade `proved_informal` is right. The
  repairs are: the fence written on the face, the attribution refined (the independent allocations are different tables, and each
  bound has its named origin), and the earlier names carried as ALIASES.
- **Controller action.** Register the texts above verbatim.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-1/`. Everything uses
the Python standard library only (`fractions`, `math`, `json`, `hashlib`, `ast`, `re`), run with `python3 -B` in the foreground. The
longest run took about 5 s.

| File | SHA-256 | Role |
|---|---|---|
| `table_of_record_copy.json` | `7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13` | read-only copy of the table of record |
| `sr1_alloc.py` | `5853a567b2cd3b0d4a18114f991f63ce1e790f7a359c56206697e3a999ec8d36` | Out/In from the contract; `m`-cancellation; 90 per-state rows; aggregate identities; Switch; nonnegativity; exact all-splitting DP at 110/113/1001; affine certificate at `10⁶+1` |
| `sr1_alloc_out.json` | `3225dabb9ad1755b69ddc4442acedcceadba3150037b53f6925c97bfa9d9c414` | its output |
| `sr1_residual.py` | `b90188fe156ae5ede0b820c6b9f179ac97be688653a6419bc0534a8fbe37a232` | `ρ_1 = P/Q` by product-form symbolic algebra; validation at 10 rows plus the `m = 95` fixed point; shifted certificates at `107+t` and `107+3s`; the human bounds |
| `sr1_residual_out.json` | `fefee51b163f2faaa8b18f24e1a82cbd9e338960ceccddd7f5faf80e44b764e6` | its output |
| `sr1_residual_show.py` | `5873330017b63adaed778fb69e1eeddc77178e319a3f349a2f56f89704d77820` | common-scale integer forms of `P`, `Q`, `R` and `R(107+t)` |
| `sr1_residual_show_out.json` | `f84f3cf23bcdcfc1e5194b637f0e3c3d095892af3d1d819a1ca5bbba5727c824` | its output |
| `sr1_ftables.py` | `9b1753975975753edaa96026a938b5fe29ef72fb37778d15f2cded68e16ee13f` | the F tables under the same checks; cell differences |
| `sr1_ftables_out.json` | `c4dedb5f7f9131a53341caa222344e4fc21863537ace6f931fbd20119b00ef14` | its output |
| `sr1_alias.py` | `7386cce4b39b27a9259d60d4ccb50b12af71110895ca88f4006391223a35fed6` | exact-key, alias-pattern and neighbour check against both registries |
| `sr1_alias_out.json` | `0ac09e48848bd486ea7386c77179cd87f177ee0d50d0dc18d5571870642df60c` | its output |

**To replay:** `cd` into the scratch root and run, in order:
1. `python3 -B sr1_alloc.py > sr1_alloc_out.json`
2. `python3 -B sr1_residual.py > sr1_residual_out.json`
3. `python3 -B sr1_residual_show.py > sr1_residual_show_out.json`
4. `python3 -B sr1_ftables.py > sr1_ftables_out.json`
5. `python3 -B sr1_alias.py > sr1_alias_out.json`

**Jobs and writes.** No background job was started, and no process was killed. The only file written outside the scratch root is this
`SECOND-READ.md`. No sealed member was edited.
