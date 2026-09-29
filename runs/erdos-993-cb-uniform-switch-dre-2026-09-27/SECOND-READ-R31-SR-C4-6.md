# Second Read

Read `R31-SR-C4-6` (r31 Cycle 4): the zero-slack tightness identity of the C1-LA1 sector template, and what it implies.
Reader: an isolated second-read seat (Claude Opus 5.5, effort high), 2026-09-29.

VerityOS boot acknowledgment: I am operating within VerityOS. For the restricted boot I loaded exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the brief. No other
VerityOS subsystem was loaded. The harness also auto-injected the project `CLAUDE.md` and the user auto-memory index into
context; I did not open either.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Brief.** `control/C4-SECOND-READ-BRIEF-R31-SR-C4-6.md` has SHA-256
  `a280af20a945e75861feea9b6c09e353915325f49d849d95db269360bf3db902`, which equals the digest in my charter. I verified this
  first.
- **Protocol.** `control/C4-SECOND-READ-PROTOCOL.md` has SHA-256 `eb175f41e1d9b563f09535785a2fb0d0e3ad0491632dfb431f1748b7e7026277`,
  which equals its capsule digest.
- **Capsule seal.** For `control/c4-second-read/R31-SR-C4-6-PACKET-MANIFEST.json` I computed the SHA-256 of the compact,
  key-sorted JSON of the manifest without `seal_sha256`, with no trailing newline. The result is
  `c6cbb4ec06c60a13d6cd5b5bd1f9fda0e53809086525241576704cebd11c9129`, which equals both the declared seal and the charter
  seal. The file's own digest is `887ae1bd…a03a`; that is not the seal. Manifest fields: run_id
  `erdos-993-math-dre-20260927-r31-cb-uniform-switch` and stage `cycle-4-second-read-R31-SR-C4-6`.
- **Members.** 164 files are listed. All 164 exist, and all 164 match their listed SHA-256 and byte count (0 bad).
- **Stage 7 sources.** I checked both records against `sources/c4-stage7-sources/SOURCE-DIGESTS.json` before reading them. Both
  match:
  - `records/cycles/cycle-4/stage5/adjudicators/F/ADJUDICATION.md` has `e8efac2b…e7e932`;
  - `records/cycles/cycle-4/stage6/SYNTHESIS.md` has `84c2805b…f26cb`.
- **The C1-LA1 award I read.** Its `Main.lean` has `f0578ed7…b78e`, which matches the synthesis carry table. The kernel receipt
  `RECEIPTS/kernel-verification.json` (receipt_id `eaeaf771…c9e`) records:
  - verdict `verified`;
  - axioms exactly `propext`, `Classical.choice`, `Quot.sound`;
  - Lean 4.32.2.
- **The Snippets this read rests on.** For award entries 14, 15, 18, 19, 23 and 24:
  - the Snippet SHA-256 equals the digest in its `VERITYOS ENTRY` header in the award `Main.lean`;
  - the Snippet text equals the award block;
  - the Snippet text equals the Cycle 4 base blocks (`sources/c4-base/LeanProject/LeanProof/Main.lean`), which are base entries
    92, 93, 96, 97, 101 and 102.

  This confirms the base-entry numbering: 92 is `cb8_state_out_const`, 93 is `cb8_state_in_const`, 96 is `cb8Out_eq`, 97 is
  `cb8In_eq`, 101 is `cb8_sum_out` and 102 is `cb8_sum_in`. Entry 105 (`cb8_sectorTemplate_nonneg_out_in_switch`) was also
  read in the base.

## Statements read

- **R31-SR-C4-6a (the identity).** `(25m/2 + 5)K − 7m/2 = (200m² + 82m + 5)/3` at `K = (16m+1)/3`. I re-derived it
  symbolically and checked it on the class.
- **R31-SR-C4-6b (the consequence).** For C1-LA1 base entry 92's per-state bound, the brief claims:
  - Out is attained at exactly 1, and In at exactly 1, at `p*` (zero slack at both ends);
  - attainment is bounded, at 95/107/158/161/164.

  I also say precisely what this does and does not imply, and I give the registration text for a scope note on the C1-LA1 key
  `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`.

**Sources.** I read:
- the F adjudication (the E-6 finding and cross-route reconciliation item 1);
- the synthesis (§(iv), `## Registrations`, `## Lean awards` read list);
- the C1-LA1 governed Snippets 0001–0024 (definitions and lemmas) and the kernel receipt;
- the Cycle 4 base `ChokeState.lean` and `cbEdge` (for the sector/state reading);
- the frozen N3/N4 texts in `control/C4-FROZEN-STATEMENTS.lean`;
- the C1-LA1 key's record in the run-local registry;
- `SOLUTION-CONTRACT.md` §§3–4.

## Independent re-derivation

**Instrument.** My own instrument is `scratchpad/c4-sr-R31-SR-C4-6/sr6_instrument.py`. It uses the standard library and
`fractions.Fraction` only. It parses the 36 + 36 intercepts and the 7 `c_γ` straight from Snippets 0002/0003/0004. It evaluates
`cb8Out`/`cb8In` from their literal definitions (0005–0010), not from the decompositions.

**(a) The identity, by hand.** With `K = (16m+1)/3`:
`(25m/2 + 5)K − 7m/2 = [(25m + 10)(16m + 1) − 21m]/6 = (400m² + 25m + 160m + 10 − 21m)/6 = (400m² + 164m + 10)/6 = (200m² + 82m + 5)/3 = D`.

The instrument expands both sides as polynomials in `m` over ℚ. The coefficients are `(5/3, 82/3, 200/3)` on both sides, so the
identity holds identically in `m`. It holds exactly at all 66,632 class rows `m = 107, 110, …, 200000`.

`K ∈ ℕ` needs `m ≡ 2 (mod 3)`, since `16m + 1 ≡ 33 ≡ 0`. In Lean the floor division `(16*m+1)/3` equals the rational value
`(16m+1)/3` only through `cb8_K_cast` (`hm3`).

**(a′) The In-side companion (not in the brief).** Entry 93 gives `InConst(β,γ) ≤ 24 − 5ℓ/2`, with `ℓ = β + γ`. Summed over
`m` chokes with leg total `K − 1`:
`Σ_i [25m(8 − ℓ_i) + 24 − 5ℓ_i/2] = 200m² + 24m − (25m + 5/2)(K − 1)`.

Now `K − 1 = (16m − 2)/3` and `8m − K + 1 = (8m + 2)/3`, so this equals
`(200m² + 50m)/3 + 72m/3 − (40m − 5)/3 = (200m² + 82m + 5)/3 = D`. The instrument confirms it symbolically and on the same
66,632 rows.

**Where the identities already live.** Both identities already appear in the C1-LA1 key's registered proof text ("summing them
over the m chokes of any assignment gives D·ΣOut >= (25m/2 + 5)K − 7m/2 = D and D·ΣIn <= 25m(8m − K + 1) + 24m − 5(K−1)/2 = D
identically in m"). They are also the closing steps of the kernel-checked entries:
- 101 (`cb8_sum_out`: the `calc` step `1 = Σ … / D` closed by `field_simp; ring`);
- 102 (`cb8_sum_in`: the final `_ = 1` step).

**(b) Exact slack.** Entries 96 and 97 (`cb8Out_eq`, `cb8In_eq`) cancel the `m`-terms state by state. I re-verified both
decompositions against the literal definitions at `m = 95, 107, 158, 161, 164, 1001` on all 45 states.

Put `ε_out(s) = OutConst(s) − (5ℓ − 7/2)` and `ε_in(s) = (24 − 5ℓ/2) − InConst(s)`. Entries 92 and 93 say both are `≥ 0`.
My exact evaluation of all 45 states gives:
- `ε_out = 0` at 40 states. It is positive only at `(0,0)`, `(0,2)`, `(0,3)`, `(0,4)`, `(0,5)`, where it equals `7/2`, `96/7`,
  `42`, `72`, `72`.
- `ε_in = 0` at every state with `ℓ ≤ 7` (36 states). At each of the nine states with `ℓ = 8`, `ε_in = 4`.

With the identities (a) and (a′), for every assignment `c : Fin m → State8`:
- **Out side.** If `Σ_i ℓ_i = K`, then `Σ_i Out(c_i) = 1 + (Σ_i ε_out(c_i))/D`.
- **In side.** If `Σ_i ℓ_i = K − 1`, then `Σ_i In(c_i) = 1 − 4·#{i : ℓ_i = 8}/D`.

The instrument checked both formulas exactly on 200 random assignments at `m = 107, 158, 161, 164, 1001`, evaluating `Out`/`In`
literally.

**(b′) Uniform attainment.** This is my own argument. The states `(b, 0)` with `1 ≤ b ≤ 8` are all Out-tight. The states
`(b, 0)` with `0 ≤ b ≤ 7` are all In-tight. For every `m ≥ 1`:
- `m ≤ K = (16m+1)/3 ≤ 8m`;
- `0 ≤ K − 1 = (16m−2)/3 ≤ 7m`.

So there are integers `b_i ∈ [1,8]` summing to `K`, and integers `b'_i ∈ [0,7]` summing to `K − 1`. By (b), these give
`Σ Out = 1` and `Σ In = 1` exactly.

Consequences:
- The minimum in C1-LA1 conclusion (ii) and the maximum in conclusion (iii) both equal 1 at every class row. This is not only
  bounded.
- The minimizers of (ii) are exactly the assignments that avoid the five Out-slack states.
- The maximizers of (iii) are exactly the assignments with no full choke.

The instrument checks the witnesses at `m = 107, 158, 161, 164, 1001, 19997`, and the range conditions at every `m ≡ 2 (mod 3)`
in `[2, 300000]` (0 failures).

**Rescaling rigidity.** `Out` and `In` are linear in `(pb, pc, σ)`. So `λ·(pb, pc, σ)` satisfies (ii) and (iii) together only
for `λ = 1`.

**(b″) Bounded corroboration.** The instrument runs an exact min-plus/max-plus DP over all assignments. It gives min `Σ Out = 1`
and max `Σ In = 1` at `m = 95, 107, 158, 161, 164, 167`. This agrees with the extremal values reported by C-F2-T, C-F2-U and the F
adjudicator. Their instruments were not replayed and are not evidence here.

**(c) Realizability (why the template minimum is the sector minimum).** The edges of `CB(8,m)` are `r–s`, `s–v`, `r–u_i`,
`u_i–b_ij` and `b_ij–c_ij`. If `r, v ∈ B`, then `s` and every `u_i` are excluded. Any choice of disjoint b-legs and c-legs per
choke is then independent, with `|B| = 2 + Σ ℓ_i`.

So the sector members of `I_{p*+1}` realize every assignment with `Σ ℓ = K`, and the in-sector sets of `I_{p*}` realize every
assignment with `Σ ℓ = K − 1`, read through `chokeState` (`chokeBeta`, `chokeGamma`). The instrument also checks this literally on
`cbEdge` at `m = 2, 5, 8`. That check is structural only and off-class.

**The limit of (c).** The literal row and column sums of `g_sec` equal `Σ Out` and `Σ In` only through the frozen Out/In bridges
(`cb8GSec_out_eq`, `cb8GSec_in_eq`, N3/N4). Those are unproved text in the frozen file, pending the concurrent C4-LA1 award.

**Hypotheses and ℕ-subtractions.**
- Hypotheses of entries 101 and 102: only `hm3 : m % 3 = 2`. `107 ≤ m` enters C1-LA1 only in conclusion (i), entry 105.
- The template attainment therefore holds for every `m ≡ 2 (mod 3)`. It is asserted below on the key's class only.
- ℕ-subtraction `(16m+1)/3 − 1` (entry 102): guarded by `hK1 : 1 ≤ (16*m+1)/3`, proved by `omega` from `hm3`.
- `8 − β − γ` in `cb8In`/`cb8InConst`: over ℚ, inside the `β + γ ≤ 7` branch.
- `p* − 1 = K`: safe (`p* ≥ 1`).
- `8m − K + 1` in the registered face formula: over ℚ, and positive.
- No Newton or Darroch step, no ε-margin and no `M_0` appear anywhere.

## Findings and repairs

1. **6a is correct as stated.** It is a polynomial identity in `m` over ℚ. `K` is integral exactly on `m ≡ 2 (mod 3)`.
2. **The In side does not come from entry 92** (repair to 6b's wording). Entry 92 (`cb8_state_out_const`) bounds only Out.
   - "In attained at exactly 1" rests on entry 93 (`cb8_state_in_const`) and on the separate identity
     `200m² + 24m − (25m + 5/2)(K − 1) = D` at leg total `K − 1`.
   - The two attainments are two sharpness facts for conclusions (ii) and (iii) (entries 101 and 102, combined in entry 105).
3. **Attainment is uniform, not bounded** (strengthening repair).
   - The brief's "bounded attainment at 95/107/158/161/164" understates what holds. At the template level, attainment holds at
     every class row, by the explicit witnesses of (b′).
   - The exact slack formulas of (b) characterize the extremal assignments.
   - The bounded rows remain corroboration only (SOLUTION-CONTRACT §3.7).
4. **`m = 95` is off-class** for this key (`m < 107`; fence 1). It is not asserted in the scope note.
5. **Attribution repair.**
   - The synthesis marks the identity "STATED by the F adjudicator". The identity itself is on the C1-LA1 key's face from
     Cycle 1 (seat T1's per-state `m`-cancellation proof), and it is a kernel-checked closing step of entries 101 and 102.
   - New at Cycle 4 is the attainment reading. The critics C-F2-T (P3, F-7) and C-F2-U (exact DP and Lagrangian dual) found the
     extremal values. The F adjudicator replayed them and first stated the structural reading (E-6).
   - The exact slack formulas, the uniform attainment proof, rescaling rigidity and the realizability remark are this read's.
6. **Wording repair.** The synthesis says `D = (200m² + 82m + 5)/3` "is the denominator of the recorded θ*_8(m)". In fact
   `θ = 288/L` with `L = 3D`, so `θ = 96/D`. `D` is `L/3`, not the θ-denominator itself.
7. **Template vs network** (fence 4).
   - "min Σ Out = 1 over all sector sources" and "row = 1, column = 1" are network statements. They hold only through the N3/N4
     bridges at their own grades.
   - The realizability in (c) is elementary. The row-sum equality is not.
   - Conditionally on the bridges, the literal row equals 1 exactly at every sector source whose chokes avoid the five Out-slack
     states. The literal in-sector column equals `1 − 4·#{full chokes}/D`, so it equals 1 exactly at every in-sector target with
     no full choke.
   - The scope note asserts only the template level.
8. **Not adopted.** The F adjudication says "any change in the state reading breaks conjunct 4" at these rows. That is broader
   than anything established here. What is established is:
   - exactness;
   - rescaling rigidity of this template;
   - that (ii) and (iii) must be carried as exact non-strict inequalities over ℚ.

   A statement "`Σ Out > 1` (or `Σ In < 1`) for all assignments" is false at every class row.
9. **What 6b does not imply.**
   - It is not LP optimality.
   - It is not optimality or uniqueness of the allocation. The key's face records at least three distinct feasible closed forms
     sharing `θ = 288/L`.
   - It says nothing about whether `θ` can be lowered by another allocation.
   - The `θ*` law stays `conjecture`.
   - It says nothing about (HALL), the E1 flow, the switch-image loads, conjunct 4, other ranks or residues, or `d ≠ 8`.
10. **Fences** (SOLUTION-CONTRACT §3):
    - one rank `p*` and the class only;
    - no Newton or Darroch;
    - template vs network respected (item 7);
    - no asymptotic step;
    - no census used as proof;
    - no status transfer.
11. **Key.** No new key is proposed; the registration is a scope note on an existing key. The run-local snapshot has no key on
    template tightness or zero slack (I searched the r31 and CB-8 keys), so the note does not alias another claim.

## Registration text

```text
SCOPE NOTE ON: E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C4; R31-SR-C4-6] Zero slack of conclusions (ii) and (iii) at both ends (proved_informal, template level; first read as tightness at r31 Cycle 4 Stage 5 by the F adjudicator (E-6) from critic findings; confirmed with repairs by an isolated second read). Setting as on this key's face: every integer m >= 107 with m ≡ 2 (mod 3), p* = (16m+4)/3, K = p* − 1 = (16m+1)/3, L = 200m² + 82m + 5, D = L/3 (so θ = 288/L = 96/D), ℓ = β + γ. (1) Identities: (25m/2 + 5)K − 7m/2 = D and 200m² + 24m − (25m + 5/2)(K − 1) = D, identically in m over ℚ (((25m + 10)(16m + 1) − 21m)/6 = (400m² + 164m + 10)/6; (200m² + 50m + 72m − 40m + 5)/3). They are the sums over the m chokes of this key's per-state rows, Lean entry 92 (cb8_state_out_const: OutConst >= 5ℓ − 7/2) at leg total K and entry 93 (cb8_state_in_const: InConst <= 24 − 5ℓ/2) at leg total K − 1; both already stand in this key's registered proof text and are kernel-checked closing steps of entries 101 (cb8_sum_out) and 102 (cb8_sum_in), with no grade of their own. (2) Exact slack: by the m-cancellation of entries 96/97, for every assignment of states to the m chokes, Σ_i Out = 1 + (Σ_i ε_out(β_i,γ_i))/D when Σ_i ℓ_i = K, where ε_out = OutConst − (5ℓ − 7/2) is 0 at 40 of the 45 states and equals 7/2, 96/7, 42, 72, 72 at (0,0), (0,2), (0,3), (0,4), (0,5); and Σ_i In = 1 − 4·#{i : ℓ_i = 8}/D when Σ_i ℓ_i = K − 1 (the In row is exact at every state with ℓ <= 7 and has slack 4 at each of the nine states with ℓ = 8). (3) Attainment, uniform on the class: since m <= K <= 8m and K − 1 <= 7m, states (b_i, 0) with 1 <= b_i <= 8 summing to K give Σ Out = 1 exactly, and states (b_i, 0) with 0 <= b_i <= 7 summing to K − 1 give Σ In = 1 exactly; so the minimum in (ii) and the maximum in (iii) both equal 1 at every class row, the constant 1 is sharp on both sides, the extremal assignments are exactly those avoiding the five Out-slack states and those with no full choke, and λ·(pb, pc, σ) satisfies (ii) and (iii) together only for λ = 1. Every such assignment is realized by a literal root-plus-arm sector member (r, v ∈ B forces s, u_i ∉ B; any disjoint choice of b- and c-legs per choke is independent, |B| = 2 + Σ_i ℓ_i), read through chokeState. Bounded corroboration (bounded_computation, exact DP over all assignments; not proof): min Σ Out = 1 and max Σ In = 1 at m = 107, 158, 161, 164, 167 (this read), agreeing with C-F2-T (158, 161, 164), C-F2-U (107, 158, 161, 164) and the F adjudicator (107, 158, 161, 164); the off-class value m = 95 (C-F2-U; this read) is not asserted. (4) What this does not imply: not LP optimality, not optimality or uniqueness of the allocation, and nothing about whether θ can be lowered by another allocation; the θ* law stays a conjecture. Template level only: the literal row and column sums of g_sec equal Σ Out and Σ In only through the Out/In bridges (frozen texts cb8GSec_out_eq, cb8GSec_in_eq) at their own grades; nothing here is asserted about the literal network, (HALL), the E1 flow, switch-image loads or conjunct 4. For any proof that uses this template: (ii) and (iii) must be carried as exact non-strict inequalities over ℚ; Σ Out > 1 or Σ In < 1 for all assignments is false at every class row; no ε-margin, upward or downward rescaling, floating-point or asymptotic step can serve the sector ends. Fences: as on this key's face (one rank p*; the class only; nothing at m < 107, at m ≡ 0, 1 (mod 3), at other ranks, for d ≠ 8 or for heterogeneous patterns); E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer. This note adds no formal content: this key's formally_verified grade covers (i)–(v) as stated, not this note. Attribution: the identities and the per-state rows: this key's allocation and per-state m-cancellation proof (r31 Cycle 1 seat T1; Lean entries 92, 93, 96, 97, 101, 102 by the C1-LA1 formalizer, Claude Opus 5.5); the numerical extrema: r31 Cycle 4 critics C-F2-T (P3; F-7) and C-F2-U (exact DP and Lagrangian dual), replayed by the r31 Cycle 4 F adjudicator, who first stated the tightness reading (E-6); the exact slack formulas, uniform attainment, extremal characterization, rescaling rigidity and realizability: isolated second read r31 R31-SR-C4-6; θ = 288/L: this key's allocation (r31 Cycle 1 seat T1), first recorded by r30 as a conjecture; the root-plus-arm sector and the choke-local certificate method: r30 (named seats, as registered); mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run.
```

## Verdicts

verdict[R31-SR-C4-6a]: confirmed
verdict[R31-SR-C4-6b]: confirmed_with_repairs

The repairs to 6b are these:
- the In end rests on entry 93 and its own identity, not on entry 92;
- attainment is uniform on the class at the template level, not merely bounded;
- `m = 95` is off-class;
- the identity is attributed to the key's Cycle 1 face;
- the network reading holds only through the N3/N4 bridges;
- `D = L/3` is not the θ-denominator.

The registration text above incorporates all of them.

## Artifact inventory

- **Deliverable:** `second-reads/R31-SR-C4-6/SECOND-READ.md` (this file). Its SHA-256 is reported by tool in the closing message,
  because a file cannot state its own digest.
- **Scratch** (`scratchpad/c4-sr-R31-SR-C4-6/`):
  - `seal_check.py`, SHA-256 `d8c1373aa8a7ca374e0a065387f183962f2d061a38ddfd8f89e68c3f509ce383`. It checks the capsule seal
    and the member digests.
  - `sr6_instrument.py`, SHA-256 `f162ae2e727510330cac3bca658329eaccf5c117bd55b7bd80f4162ea6243678`. This is my own exact
    instrument: the identities, the per-state slack tables, the exact DP extrema, the slack formulas, the uniform witnesses and
    literal realizability.
  - `sr6_instrument.out`, SHA-256 `2f608eb5a793f233d05aeaa97ec1fc04f6596ef90d1c12bd9a161b978429b270`.
- **Replay:** run `python3 -B scratchpad/c4-sr-R31-SR-C4-6/seal_check.py` and `python3 -B scratchpad/c4-sr-R31-SR-C4-6/sr6_instrument.py`
  from the run root. Both are deterministic, and the random checks use a fixed seed.
- **Read-boundary disclosures:**
  - **Capsule members read:** the brief, the protocol and the manifest; `SOLUTION-CONTRACT.md` (§§3–4 plus headings); the F
    adjudication and the synthesis (the excerpts cited above); `sources/c4-stage7-sources/SOURCE-DIGESTS.json`; C1-LA1 Snippets
    0001–0024, the award `Main.lean` (entry headers and blocks only) and `RECEIPTS/kernel-verification.json` plus
    `EVIDENCE/axioms.txt`; the base `Main.lean` (entries 23–28, 92–93 and 101–105) and `ChokeState.lean`;
    `control/C4-FROZEN-STATEMENTS.lean` (lines 60–205); `control/snapshots/CLAIM-IDENTITY.run-local.c3-close.json` (the C1-LA1
    key record and a key-name search); `sources/authority/CLAIM-IDENTITY.json` and the concurrent master 510 (key-name searches
    only; no hits).
  - **VerityOS files:** only `verity.md` and `identity/startup-protocol.md`. I read `startup-protocol.md` in two parts
    (lines 1–150, then 151–326), because a shell quoting slip on my first combined command skipped it. I read `verity.md` in
    full.
  - **Outside the capsule:**
    - one directory-name listing of `second-reads/` (names only; no file opened);
    - my own scratch directory.

    The project `CLAUDE.md` and the user memory index were injected by the harness; I did not open them.
  - **Not done:** no `lake` or `lean`, no network, no installs, no background jobs, no process listing, and no `find`, `grep`
    or `rg` rooted above the capsule members. No sealed member was edited.
