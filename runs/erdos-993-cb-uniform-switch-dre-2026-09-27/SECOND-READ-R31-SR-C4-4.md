# Second Read

Read `R31-SR-C4-4`: N7, the per-class composition (r31 Cycle 4). This is an isolated second read under
`control/C4-SECOND-READ-PROTOCOL.md`, which is binding. Written 2026-09-29; clock read 01:18 EDT before drafting.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS under the restricted boot. I read exactly two VerityOS files,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and then my brief. I
loaded no other subsystem: no memory, knowledge, conversations, operations, modules, skills, logs or decisions. I wrote no
conversation log, because the protocol allows one deliverable.

## Identity and seal audit

- **Brief.** `control/C4-SECOND-READ-BRIEF-R31-SR-C4-4.md`. I verified it with `shasum -a 256` before reading it:
  `4d72ebe6a7e228875b55a586843f967a96f8e2f482e3ca74a266b34b65f2174c`. It matches the dispatch.
- **Capsule seal.** `control/c4-second-read/R31-SR-C4-4-PACKET-MANIFEST.json`. I recomputed the seal as the SHA-256 of the
  compact, key-sorted JSON of the manifest minus `seal_sha256`, with no trailing newline:
  `c8842fa503fae6803f784f4caa1181898032547001cb294fc5138d0b7a5b32cf`. It **matches** the recorded seal and the dispatch. (The
  manifest file's own SHA-256 is `7d9a346a9af1e2b9a2cb19a7c0192fb57f2489241e2ed053b4333bf25c2cb359`. That is a different quantity
  from the seal and is not a mismatch.) The stage is `cycle-4-second-read-R31-SR-C4-4` and the run id is
  `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
- **Members.** 227 of 227 listed members exist, and each matches its listed SHA-256 (`scratchpad/c4-sr-R31-SR-C4-4/seal_audit.py`).
  There were 0 mismatches and 0 missing files.
- **Frozen Cycle 4 sources.** I checked every capsule member under `sources/c4-stage7-sources/` against
  `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (schema `verityos.r31.source-digests.v1`, dated 2026-09-29, `file_count` 772) before
  reading it. All 65 match, with 0 bad and 0 without an entry (`src_digests.py`). My first run compared the digest map's dict
  values rather than their `sha256` field and reported false mismatches. I fixed the comparison and reran it. No file was
  read before the corrected check passed.

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index and the user's
   e-mail into my context. I did not open any of them with a tool, and no ruling below rests on them.
2. *Capsule members read for content.* These are the contracts and records I read:
   - `SOLUTION-CONTRACT.md`;
   - the brief and the protocol;
   - `control/C4-FROZEN-STATEMENTS.lean`, in full;
   - `SYNTHESIS.md`: head, `## Reconciliation`, `## Exact established results`, `## Lean awards`, `## Registrations`;
   - the U2 `RETURN.md`, lines 100–300;
   - both critiques `C-U2-F` and `C-U2-T`, from re-derivation through the remaining obligations;
   - the U `ADJUDICATION.md`, the N7 passages only (a `grep`, then lines 180–192, 250–262 and 360–372).

   These are the Lean sources I read:
   - `sources/c4-base/LeanProject/LeanProof/E1FlowConstruction.lean`, lines 1–140;
   - `ChokeState.lean`, in full;
   - `C3LA1.lean`: entries 3, 5, 33 and 37, and the location of 53;
   - base `Main.lean` entries 7, 14–20, 26, 40, 112 and 606 (headers located by `grep` inside that file);
   - the C1-LA1 `Snippets/` fragments 0001, 0004–0011 and 0033;
   - U2's companion proof in its `Statements.lean`;
   - `c4-crit-U2-F/work/n7proof.lean`;
   - `c4-crit-U2-T/work/n7_helpers.lean` and `n7_clauses34.lean`.

   I also parsed the three critic/seat `Statements.lean` files programmatically, for header and body comparison.
3. *Registries.* I parsed the run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-close.json` programmatically. From it I
   read the full records of two r31 keys and the key names and statement prefixes of the r31/CB-8 keys. I parsed the frozen master
   and the concurrent master for key-presence and alias tests only.
4. *Outside the capsule.* One `ls second-reads` listed the names of the existing second-read directories (`SR-1`, …, `SR-C2-4`)
   while I checked whether my output directory existed. I read no content from them. I created `second-reads/R31-SR-C4-4/`.
5. *Not read.* I read no other returns, critiques, adjudications, scratch or experiment roots, and no network or external
   source. I made no installs. I ran no `lake` or `lean`, started no background jobs and made no process listing. I did not
   consult Mathlib sources. Every `grep` was rooted at a capsule member. I executed no seat or critic instrument: their outputs
   are cited only as their own checks.
6. *Shell noise.* Two `echo =====` separators failed under zsh (`===== not found`). They had no other effect.

## Statements read

- **R31-SR-C4-4a**: `E993Transport.cb8Rho_one_eq_cb8R1_ratio`. The frozen text is `C4-FROZEN-STATEMENTS.lean` lines 258–266, and my
  header digest prefix is `b3ea25f7…`. On the class `107 ≤ m`, `m % 3 = 2`:
  `cb8Rho (8*1−1) (8*(m−1)+1) (((16m+4)/3 − 1 : ℕ) : ℤ) = cb8R1 m K / cb8R1 m (K − 1)`, with `K = (16m+1)/3`.
  - Proof text: seat U2 (Claude Sonnet 5), four lines through `cb8R_natCast_eq_coeff` and C3-LA1 entries 33 and 37.
- **R31-SR-C4-4b**: `E993Transport.cb8_flowBundle_of_arcSpecs`. The frozen text is lines 268–337, and my header digest prefix is
  `8dc575db…`.
  - Hypotheses: the class, plus, byte for byte, the conclusions of N2 (`hE1`), N3 (`hSec`, `hOut`), N4 (`hIn`, `hZero`), N5 (`hSw`)
    and N6 (`hW`).
  - Conclusion: the Out-`≥`/In-`≤` bundle for `g = cb8E1Arc m p* F + cb8GSec m`, with `F = favorableLeaves (cbGraph m) p*`. The
    clauses are nonnegativity, zero off `transportRel`, layer rows `≥ w_F`, and layer columns `≤ w_F`.
  - Proof texts: critic C-U2-F (Claude Opus 5.5), `n7proof.lean`, which I verified is byte-equal to the N7 body of its
    `Statements.lean`; and critic C-U2-T (Claude Opus 5.5), `n7_helpers.lean` plus `n7_clauses34.lean`, both of which I verified
    are contained in its N7 body. Clauses (1)–(2) in both come from U2. U2's own clauses (3)–(4) are an informal derivation with
    two `sorry`s.

## Independent re-derivation

**Fidelity instrument (mine, `fidelity.py`).**
- **Frozen headers.** Both frozen declaration headers, from `theorem` to `:= by`, occur byte-identically and exactly once in each
  of U2's, C-U2-F's and C-U2-T's `Statements.lean`.
- **Bodies.** The companion body is `sorry`-free in all three files. The N7 main body has **0** tactic-position `sorry` in C-U2-F
  and C-U2-T, and 2 in U2 (clauses 3–4). U2's second textual hit is only the comment "no sorry" in C-U2-T's helper header.
- **Forbidden tokens.** In all three files there are 0 occurrences of the reserved terminal name, `admit`, `native_decide` or
  `set_option`.
- **Limits.** I did not rebuild anything. The compile and axiom claims (`[propext, Classical.choice, Quot.sound]`) are the critics'
  and the adjudicator's. I read the proofs below as mathematics.

**4a, re-derived.**
- **The ratio.** `cb8Rho a b j := cb8R a b j / cb8R a b (j−1)`, where `cb8R a b k` is the integer-indexed `k`-th coefficient of
  `(1+X)^a (1+2X)^b`. At `a = 8·1−1 = 7` and `b = 8(m−1)+1 = 8m−7` (the ℕ subtraction `m − 1` is exact since `m ≥ 107`), the
  coefficient is `Σ_{i=0}^{min(7,k)} C(7,i)·C(8m−7,k−i)·2^{k−i}`. This is `cb8R1 m k` by the literal fragment 0011. Terms with
  `k − i > 8m − 7` vanish on both sides through `Nat.choose`, and `k − i` is an exact ℕ subtraction because `i ≤ min(7,k)`.
- **The index.** `⌊(16m+4)/3⌋ − 1 = ⌊(16m+1)/3⌋` holds for every `m`, so `j = p* − 1 = K`. The ℤ step
  `((p*−1 : ℕ) : ℤ) − 1 = ((p*−2 : ℕ) : ℤ)` needs `p* − 1 ≥ 1`, which holds (`p* ≥ 572`). And `K − 1` is exact.
- **Where the hypotheses enter.** `107 ≤ m` enters only as `m ≥ 1` and `p* ≥ 2`. `m % 3 = 2` is **not** needed for the truth of 4a;
  C3-LA1 entry 37 needs only `1 ≤ m`. The extra hypothesis is harmless: the frozen statement is true a fortiori.
- **U2's proof.** It bridges `cb8Rho` to `e1Rho` through `cb8R_natCast_eq_coeff` and entry 33 (`1 ≤ j`, guarded by
  `hj1 : 1 ≤ p* − 1`), then applies entry 37. It is sound, not circular, and has no Newton or Darroch step.

**4b, re-derived clause by clause.** Write `w = w_F` and `p = p*`. The C2-LA3 terminal (base entry 606) gives
`F = favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)` on the class, and both proofs use it before every application of N6 (`hW`)
or `hZero.2`, since those are stated at `leafSet`. Membership in `indepFamily` yields `IsIndepSet` (the `filter` predicate), and
`cbGraph_adj_r_choke` (base entry 40) gives `r ∈ X` ⇒ `u_i ∉ X` for every `i < m`. So by N6, when `r ∈ X` we get `w(X) = [v ∈ X]`.

- **(1) Nonnegativity:** `hE1.1 + hSec.1`.
- **(2) Support:** if `f B A ≠ 0`, then `hE1.2` gives `∃ x ∈ B, A = B.erase x`, which is the left disjunct of `transportRel`
  (base entry 19). With `hSec.2`, `g = 0 + 0` off the relation.
- **(3) Rows**, for `B ∈ I_{p+1}`:
  - `r ∉ B`: `hE1.3` gives an E1 row exactly `w(B)`, and the sector row is `0` (`hZero.1`; nonnegativity would also suffice).
  - `r ∈ B`, `v ∈ B` (sector source): the E1 row is `0` (contrapositive of `hE1.2`), `w(B) = 1` exactly, and `hOut` gives `≥ 1`.
    **Exact `≥`, no slack consumed.**
  - `r ∈ B`, `v ∉ B`: `w(B) = 0 ≤` a nonnegative sum.
- **(4) Columns**, for `A ∈ I_p`, in an exhaustive split:

| Target class | E1 column | Sector column | `w(A)` | Inequality used |
|---|---|---|---|---|
| `r ∈ A`, `v ∈ A` (in-sector) | `0` (`hE1.5`) | `≤ 1` (`hIn`) | `1` | `0 + (≤1) ≤ 1`, **exact `≤`, zero slack allowed** |
| `r ∈ A`, `v ∉ A` | `0` (`hE1.5`) | `0` (`hZero.2`, weight zero) | `0` | `0 ≤ 0` |
| `r ∉ A`, `q = 0` | `0` (`hE1.5`) | `0` (`hZero.2`; `w = 0` by N6, since no choke is present) | `0` | `0 ≤ 0` |
| `r ∉ A`, `q ≥ 2`, or `q = 1` with `v ∉ A` | `ρ_q·w` (`hE1.4`) | `0` (`hSw.2`) | `w ≥ 0` | `ρ_q·w ≤ w` from `ρ_q < 1` (`cb8Rho_lt_one_topRank m q`, needs `1 ≤ q ≤ m`) |
| `r ∉ A`, `q = 1`, `v ∈ A`, unique choke `i₀`, `γ = γ_{i₀}(A)` | `ρ_1·γ` (`hE1.4` at `q = 1`; `w = γ` by N6 via `sum_eq_single`) | `(8−γ)·σ(γ)` (`hSw.1`) | `γ` | `ρ_1γ + (8−γ)σ(γ) ≤ γ` |

- **The switch-image inequality**, by `γ`:
  - `1 ≤ γ ≤ 7`: C1-LA1 (iv) Switch gives `(8−γ)σ(γ) ≤ θγ`. C1-LA1 (v) Residual gives `θ ≤ 1 − cb8R1`-ratio, and 4a makes that
    ratio `ρ_1`. So `ρ_1γ ≤ (1−θ)γ` (since `γ ≥ 0`), and adding gives `≤ γ`.
  - `γ = 0`: `w = 0`, and both sides are `0`.
  - `γ = 8`: the sector term vanishes (the factor `8 − 8 = 0` in ℚ, or `σ(8) = 0`), and `8ρ_1 ≤ 8` from `ρ_1 < 1`.
- **`q ≤ m`.** Both critics prove it inline (`Finset.card_filter_le` against `card_range m`). Neither uses the `sorry`-bodied frozen
  N1 companion `cbOpenChokeCount_le`.
- **`γ ∈ {0, 8}`:** both boundaries are covered. `γ ≤ 8` holds by construction (a filter of `range 8`). C-U2-T proves it (`hγle`).
  C-U2-F does not need it, because it treats every `γ ∉ [1,7]` through `cb8CGamma γ = 0`.
- **ℕ subtractions.**
  - `8q − 1` needs `q ≥ 1`, and `m − q` and `p* − q` need `q ≤ m < p*`. These appear only inside hypothesis texts and
    `cb8Rho_lt_one_topRank`'s statement, and are guarded there by `hq1` and `hqm`.
  - `8 − γ` is a ℚ subtraction (`8 − (γ : ℚ)`), not a ℕ one.
  - `K − 1` is exact.
- **Zero slack.** Every inequality is non-strict in exact ℚ. The strict `ρ_q < 1` is used only through `.le`. There is no scaling,
  no ε and no asymptotic step. At the two sector ends, `w = 1` exactly and the E1 contribution is exactly `0`, so N7 consumes none of
  the zero slack recorded in the synthesis's (iv). The only slack spent is at the switch images.
- **Hypotheses not used.**
  - `hZero`'s third conjunct: it is bound but never used in either proof (`_hZ3` in C-U2-F; `hZ3` has a single occurrence, the
    `obtain`, in C-U2-T's file).
  - `hZero.1` is replaceable by nonnegativity.
  - C1-LA1 conclusions (i)–(iii) do not enter N7; they enter through N3 and N4.

**Comparison of the two critic proofs.** Both are complete and correct, with the same clause-(3) split and the same five column
classes. They differ as follows:
1. At `γ = 0`, C-U2-F uses the carried definition's wildcard `cb8CGamma 0 = 0` (so `σ(0) = 0`). C-U2-T avoids it: `w = γ = 0`, and
   `hZero.2` zeroes the sector column.
2. At `γ ≥ 8`, C-U2-F's single `γ ∉ [1,7]` branch kills the sector term through `σ = 0` and needs no upper bound on `γ`. C-U2-T
   proves `γ ≤ 8` and uses `(8 − 8) = 0`, independently of `σ(8)`.
3. C-U2-T states the unique-choke extraction and the weight evaluations as named helpers (`hqone`, `hWone`, `hWroot`). C-U2-F
   inlines them.
4. C-U2-T carries an idle `have h4 … := rfl` (cosmetic).

**Findings of my own on the γ boundary.** N7 is sound independently of the junk value, as C-U2-T's route shows. The junk value is
load-bearing only in N5's text (`hSw.1` at `γ = 0` asserts `8·σ(0)`), not in N7's. This agrees with the U adjudication, ruling 6.

**Numeric instrument (mine, `n7_arith.py`; exact `int`/`Fraction`; written from the frozen and carried definitions, not from any seat
script).** Results digest (compact key-sorted JSON): `c55fc0af92beb7b6dfbfed70557d6063a07ce2138b3a8a0e5926aa5f369d97d4`. **0
failures.** The rows are `m ∈ {107, 110, 113, 158, 161, 164, 200}`, with every `q ∈ [1, m]`, and `m ∈ {299, 401, 1001, 2393}`, with
`q` sampled at `{1, 2, 3, ⌊m/3⌋, ⌊m/2⌋, m−1, m}`. At each row it checks:
- the index syntax: `8·1−1 = 7`, `8(m−1)+1 = 8m−7`, `p*−1 = K`, `K−1 = p*−2`;
- 4a exactly, with the left side from the coefficient-sum form and the right side from `cb8R1`'s literal definition;
- at the six rows up to 164, a third side: coefficients by iterated polynomial multiplication, which agree;
- the Residual `θ ≤ 1 − ρ_1` and the Switch inequality for `γ = 1..7`;
- `ρ_1γ + (8−γ)σ(γ) ≤ γ` for `γ = 0..8`;
- `ρ_q < 1` at the clause-(4) syntax (`j = p* − q`).

Two mutation controls were both caught:
- the index shift `j = p*` breaks 4a;
- replacing `θ` by `60θ` violates the switch-image inequality at 107.

| `m` | `(1−ρ_1)/θ` | min slack `γ ∈ [1,7]` (at `γ`) | slack `γ = 0` | slack `γ = 8` | `ρ_q < 1` (argmax `q`) |
|---|---|---|---|---|---|
| 107 | 34.9009 | 4.2476e−3 (1) | 0 exactly | 3.498e−2 | all `q ≤ 107` (1) |
| 110 | 35.8774 | 4.1353e−3 (1) | 0 | 3.403e−2 | all (1) |
| 113 | 36.8540 | 4.0287e−3 (1) | 0 | 3.313e−2 | all (1) |
| 158 | 51.5025 | 2.9056e−3 (1) | 0 | 2.371e−2 | all (1) |
| 161 | 52.4791 | 2.8526e−3 (1) | 0 | 2.326e−2 | all (1) |
| 164 | 53.4556 | 2.8014e−3 (1) | 0 | 2.284e−2 | all (1) |
| 200 | 65.1744 | 2.3056e−3 (1) | 0 | 1.873e−2 | all (1) |
| 299 | 97.4010 | 1.5506e−3 (1) | 0 | 1.253e−2 | sampled (1) |
| 401 | 130.6042 | 1.1594e−3 (1) | 0 | 9.347e−3 | sampled (1) |
| 1001 | 325.9167 | 4.6675e−4 (1) | 0 | 3.746e−3 | sampled (1) |
| 2393 | 779.0417 | 1.9562e−4 (1) | 0 | 1.567e−3 | sampled (1) |

These values reproduce the synthesis's recorded slack (about 4.25e−3 at 107 down to 2.80e−3 at 164) and margins (34.90 to 53.46).
They are census checks (fence 7). No universal statement here rests on them: the proofs above do, through C1-LA1's formally
verified terminal and `cb8Rho_lt_one_topRank`. The difference index is "none": `ρ_q` is the coefficient ratio of `r_q` at the
textual indices `p* − q` over `p* − q − 1`, not a layer difference `i_{p+1} − i_p`.

**Fences.**
- One rank `p*`, `d = 8`, and the class only.
- No Newton or Darroch: `ρ_q < 1` comes from the formally verified C1-LA3 entry 20 plus `twoBinomCoeff_pos`.
- `θ` is the definition `cb8Theta`, used only through C1-LA1's proved feasibility. The `θ*` law and optimality are never used.
- N7 asserts no flow, no (HALL) and no aggregate status (gate ruling 26). It is not the struck R-9/R-10 reduction, because its
  hypotheses are per-arc specs and not conjunct 4.
- No refuted mechanism is revived. There is no status transfer.

## Findings and repairs

1. **Both statements are true as frozen, and both critic proofs of 4b are complete.** No repair to either frozen text.
2. **I concur with both critics on U2's informal derivation of clauses (3)–(4).**
   - Its "every other `A`" branch sets the E1 column to `0` for `r`-free targets with `q ≥ 2`, or with `q = 1` and `v ∉ A`. There,
     `hE1.4` gives `ρ_q·w`, which is bounded only through `cb8Rho_lt_one_topRank` and `q ≤ m`.
   - It also never treats the sector column at `r ∈ A`, `v ∉ A` (that column needs `hZero.2`).
   - It never cites the C2-LA3 bridge.

   "Complete" stays struck. U2's clauses (1)–(2) and the case skeleton survive.
3. **Attribution.**
   - 4a: seat U2 (Claude Sonnet 5), through C3-LA1 entries 33 and 37. Those entries are in the cone of the C3-LA1 award's terminal
     (entry 53) and carry no certificate of their own. The C3-LA1 Stage 7 formalizer (Claude Opus 5.5) re-authored entry 37 from the
     DRAFTs of C-T2-F and C-T2-U.
   - 4b: **critic-derived**, independently by C-U2-F and C-U2-T (both Claude Opus 5.5), with clauses (1)–(2) from U2.

   4a is a vocabulary bridge (`cb8Rho` to `cb8R1`) for the same value identity as C3-LA1 entry 37. It is not new mathematics, and it
   is not to be counted as progress on its own.
4. **Idle hypotheses.** `hZero`'s third conjunct is unused by both proofs. `hZero.1` is replaceable. This is not a defect. The Stage
   7 panel should not describe these as load-bearing in N7. (They are consumed elsewhere, or are redundant.)
5. **Stage 7 hygiene** (concurring with the critics):
   - drop C-U2-T's idle `h4`;
   - the companion's proof needs `C3LA1` in scope (U2's added import), which the single-file award layout resolves;
   - `hres` in 4a is idle for its truth.
6. **Relation to registered keys (alias check).**
   - No key is proposed for either statement, and I propose none. Both are proof-internal frozen leaves of C4-LA1.
   - Lexically: no key or alias in the run-local snapshot (497), the frozen master (491) or the concurrent master (510) mentions
     `flowBundle`, `arcSpecs`, `cb8Rho_one`, a flow bundle or a ρ₁ link.
   - Mathematically: 4b is the Lean per-arc form of the final composition step of the registered implication
     `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
     (`proved_informal`). It is not an alias of it: it does not scale by `1/Σ Out`, its hypotheses are the Lean per-arc specs
     rather than (a)–(c), and it makes the weight-zero targets and the `γ ∈ {0, 8}` switch images explicit. I give a distinction
     row below.
7. **Outside my two statements, for the controller; it bears on registrations that will cite N7.**
   - The run-local snapshot already carries the r31 Tier 1 key
     `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`,
     at `proved_informal` ([r31 C2; SR-C2-5]).
   - The synthesis's R-C4-1 candidate name
     `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-ELIGIBLE-AND-WEIGHTED-HALL` states the same predicate:
     same class, same rank, same (E) ∧ (H). It appears in no registry and in no alias list.
   - The synthesis's alias-check list for R-C4-1 omits this existing key.
   - If C4-LA1 closes, registering the candidate as a new key would mint an alias of an existing key. The consistent path is to
     re-grade the existing Tier 1 key, with a scope note, and list the candidate name among its aliases.
   - This is a finding, not a verdict; it is not within R31-SR-C4-4's statements.

## Registration text

```text
RECORD: R31-SR-C4-4a
CLAIM: [r31 C4; R31-SR-C4-4] N7 companion E993Transport.cb8Rho_one_eq_cb8R1_ratio (frozen text, C4-FROZEN-STATEMENTS.lean lines 258–266): for every m with 107 <= m and m % 3 = 2, cb8Rho (8*1 − 1) (8*(m − 1) + 1) (((16m + 4)/3 − 1 : ℕ) : ℤ) = cb8R1 m K / cb8R1 m (K − 1) with K = (16m + 1)/3 = p* − 1; that is, ρ_1 = r_1(p* − 1)/r_1(p* − 2) in the E1 spec's clause-(4) syntax equals C1-LA1's Residual ratio in entry 111's syntax. The same value identity as C3-LA1 entry 37 (in the cone of the C3-LA1 award's terminal, entry 53; no certificate of its own), re-expressed in the cb8Rho vocabulary through cb8R_natCast_eq_coeff and C3-LA1 entry 33; a vocabulary bridge, not new mathematics. True for every m >= 1 (m % 3 = 2 is idle); every ℕ subtraction exact (m − 1, p* − 1 >= 1, K − 1). Compiled scratch (seat U2's proof; replayed by C-U2-F, C-U2-T and the U adjudicator), ungraded formally until a governed award closes; no status transfer.
STATUS: proved_informal
PROVENANCE: proof text: r31 Cycle 4 seat U2 (route C4-U-02, Claude Sonnet 5); inputs: C3-LA1 entries 33 and 37 (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5, from the DRAFTs of C-T2-F and C-T2-U) and the E1 layer's cb8R_natCast_eq_coeff (r31 Cycle 3 seat U2, copied into the Cycle 4 base); cb8R1: r31 award C1-LA1; isolated second read R31-SR-C4-4 (Claude Opus 5.5), confirmed.
```

```text
RECORD: R31-SR-C4-4b
CLAIM: [r31 C4; R31-SR-C4-4] N7 main E993Transport.cb8_flowBundle_of_arcSpecs (frozen text, C4-FROZEN-STATEMENTS.lean lines 268–337), an implication and conditional by design (gate ruling 26): on CB(8,m), m >= 107, m % 3 = 2, at the single rank p* = (16m + 4)/3, if the per-arc conclusions of N2 (cb8E1Arc_spec_topRank), N3 (cb8GSec_nonneg_and_support, cb8GSec_out_ge_one), N4 (cb8GSec_in_le_one, cb8GSec_zero_classes), N5 (cb8GSec_switchImage_inflow) and N6 (cb8_activeWeight_leafSet_eq) hold, then g = cb8E1Arc m p* F + cb8GSec m with F = favorableLeaves (cbGraph m) p* is nonnegative, vanishes off transportRel, has every layer row >= w_F and every layer column <= w_F. Proof: F = leafSet (C2-LA3 terminal); r ∈ X forces every choke out of X (independence, cbGraph_adj_r_choke); sector sources and in-sector targets have weight exactly 1 and receive E1 value 0, so hOut and hIn close them with exact >= and <= (no slack consumed, no scaling); weight-zero targets (r ∈ A with v ∉ A; r ∉ A with q = 0) receive 0 from both parts; r-free targets with q >= 2, or q = 1 and v ∉ A, receive only the E1 load ρ_q·w_F <= w_F (cb8Rho_lt_one_topRank with q <= m proved inline); u_i-switch images (r ∉ A, q = 1, v ∈ A, weight γ) receive ρ_1·γ + (8 − γ)·σ(γ) <= γ: for 1 <= γ <= 7 by C1-LA1 Switch (iv), Residual (v) and the N7 companion; γ = 0 has weight 0; γ = 8 gives 8ρ_1 <= 8. Uses no Newton or Darroch step, no θ* law, no optimality, no asymptotic step; the third conjunct of the zero-class hypothesis is idle. Two independent sorry-free proofs, both compiled scratch (ungraded formally until a governed award closes). Asserts no flow, no (HALL) and no aggregate status by itself; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN.
STATUS: proved_informal
PROVENANCE: critic-derived: r31 Cycle 4 critics C-U2-F (Claude Opus 5.5; n7proof.lean f82a32c7…) and C-U2-T (Claude Opus 5.5; Statements.lean 476c192f…), independently; clauses (1)–(2) and the case skeleton from seat U2 (route C4-U-02, Claude Sonnet 5), whose informal clauses (3)–(4) are struck as complete (they omit the E1-load bound at q >= 2 or q = 1 with v ∉ A, the C2-LA3 bridge and the r ∈ A, v ∉ A sector column); inputs: r31 awards C1-LA1 (terminal, entry 111), C2-LA3 (terminal, base entry 606), C1-LA2 (cbGraph_adj_r_choke, base entry 40) and C1-LA3 (entries 20 and 14, through cb8Rho_lt_one_topRank of the E1 layer, r31 Cycle 3 seat U2); frozen texts: controller staff (Claude Opus 5.5), R31-N-23; U adjudicator replay; isolated second read R31-SR-C4-4 (Claude Opus 5.5), confirmed, with its own exact arithmetic instrument (results c55fc0af…, 0 failures at 11 class rows).
```

```text
DISTINCTION ROW: R31-SR-C4-4-D1
KEY: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C4; R31-SR-C4-4] The frozen N7 main cb8_flowBundle_of_arcSpecs is the Lean per-arc form of this key's final composition step, not an alias and not a new key. Its hypotheses are the per-arc specifications (N2–N6 conclusions) of the named functions cb8E1Arc and cb8GSec, not this key's hypotheses (a)–(c); its conclusion is the unscaled Out-≥/In-≤ bundle (rows >= w_F, columns <= w_F), with no 1/Σ Out scaling; it treats the weight-zero targets and the γ ∈ {0, 8} switch images explicitly. It carries no status to this key, and this key's grade is unchanged.
```

## Verdicts

verdict[R31-SR-C4-4a]: confirmed
verdict[R31-SR-C4-4b]: confirmed

## Artifact inventory

Output: `second-reads/R31-SR-C4-4/SECOND-READ.md` (this file; its SHA-256 is computed after writing and reported to the controller).

Scratch (`scratchpad/c4-sr-R31-SR-C4-4/`, all mine):

| File | SHA-256 | Role |
|---|---|---|
| `seal_audit.py` | `b6f442629297daf49cb3f65bb59c049f67b035b6568493a07de8e860a6f56e2d` | capsule seal and 227 member digests |
| `src_digests.py` | `52c681510881430c8ccc8215ec4d916758e5e7cd05b1c62157011da92c701c1d` | 65 stage-7 sources against `SOURCE-DIGESTS.json` |
| `fidelity.py` | `832592a8eab6e7f8ccb05a53b0b07b77afdc0eb4187be5ead82b338c8e64aac6` | frozen-header byte equality, body containment, token census |
| `n7_arith.py` | `0da95696d7c15e17443e746f4e20f210a041e624e76e11e5361e0f7500a9aa60` | exact per-class arithmetic (4a identity, Residual, Switch, switch-image inequality, `ρ_q < 1`, mutation controls) |
| `n7_arith.out.json` | `c55fc0af92beb7b6dfbfed70557d6063a07ce2138b3a8a0e5926aa5f369d97d4` | its output (compact key-sorted JSON; file digest equals results digest) |

Replay: `cd <run root>/scratchpad/c4-sr-R31-SR-C4-4 && python3 -B n7_arith.py`. It is deterministic, with no clock, PID or host
field in the output, and takes about 65 seconds.

Reread before close: done.
