# Critique

Critic `C-U2-F` (Cycle 4, Stage 4, r31; orientation F, falsify) of seat `U2`, route `C4-U-02`, mechanism
`WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION` (orientation U). Written 2026-09-29 (host clock 00:14 EDT at the last artifact).

**Boot.** Operating within VerityOS under the restricted boot. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch. I loaded no other VerityOS subsystem (no memory,
knowledge, conversations, modules, skills, logs or decisions). The host placed the project `CLAUDE.md`, the user auto-memory index
and the user e-mail into context before the first tool call. I did not open or act on any of them.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch** `control/dispatch/c4-stage4/DISPATCH-C-U2-F.md` has SHA-256 `4148a320c3ec42ff4d2f8c45c119bf7c85306691f1d79234cb8290281ca3a276`,
  which matches before reading.
- **Capsule seal** `control/c4-critic-capsules/U2-PACKET-MANIFEST.json` recomputes to
  **`646889139627d1201d0a851deff778b2aacf70a9f4a154ac9231c3298c33e3cd`** (canonical JSON without `seal_sha256`, sort_keys,
  `(",", ":")`, no trailing newline), which matches. All 16 listed members match on SHA-256 and byte count.
- **Stage 2 seal** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`: recomputed, matches. **Stage 3 seal**
  `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`: recomputed, matches. **Stage 4 dispatch seal**
  `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`: recomputed, matches.
- **Return** `cycles/cycle-4/stage3/returns/U2/RETURN.md`: `9fa4815d9a0eb261378c60039737e28e55e08ad14a34c5778bb6efd2702c74cb`,
  43,316 bytes, which matches the capsule and the admission record.
- **Frozen texts**: `control/C4-FROZEN-STATEMENTS.lean` is `0fc723d7…9ede1` and `.md` is `6aa6dfe5…ca54b`. Both match ruling 23, and
  `sources/c4-base/LeanProject/LeanProof/Statements.lean` is byte-identical to the frozen `.lean`.
- **Every digest the return lists**, recomputed by me:

| Artifact (under `scratchpad/c4-U2/`) | Return's literal | Recomputed |
|---|---|---|
| `build-kernelcheck.log` (162 lines) | `8067cd67…0baa` | match |
| `build-kernelcheck2.log` (86 lines) | `02dfe124…2e44` | match |
| `LeanProject/work/axioms.log` | `7c6b671f…e4` | match |
| `LeanProject/work/AxiomCheck.lean` | `ba74f041…136` | match |
| `work/check_n6_n7companion.py` | `aa3adc83…b611` | match |
| `work/run2.out.json` | `774857c8…eda7` | match |
| `build-main4.log` | `c1f08f9f…d1ef` | match |
| `build-main.log` (empty) | `e3b0c442…b855` | match |
| `LeanProject/LeanProof/Statements.lean` (final) | `2c1ee236…74d0` | match |
| `Main.lean` (base) | `385af1bf…ea3f` | byte-identical to `sources/c4-base` (`cmp`) |

  The internal `sha256_of_results` `13dc6e21…c477` appears verbatim in the replayed output. I did not read the return's
  `scratchpad/c4-U2-replay/` directory: it lies outside `scratchpad/c4-U2/`, the path the dispatch grants. The return's claim
  that the replay is "byte-identical" is instead backed by my own copy-out replay, which reproduces `774857c8…eda7` exactly
  (below).
- **Admission defect for U2** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): adjudicated. Every occurrence (lines 111, 124, 210,
  219, 247, 248, 516, 518, 526) is one of two things. Some cite a governed award (C1-LA1's terminal, C3-LA1). The rest are
  disclaimers that U2's own scratch is *not* `formally_verified`. No label is placed on U2's own scratch, so nothing is struck on
  that ground. I **narrow** lines 111, 124 and 247, which call C3-LA1's *entry 37* (`e1Rho_one_eq_cb8R1_ratio`) and entry 33
  "formally verified" in their own right. Entry 37 is not C3-LA1's terminal (`cb8_E1_cloneTransport_topRank`). Under
  SOLUTION-CONTRACT §4, a non-terminal entry compiled inside a governed award's project carries no certificate of its own. The
  correct citation is "compiled, sorry-free, inside the C3-LA1 award's project". In the Cycle 4 base, per ruling 25, the entry
  is also only a scratch copy.
- **Headline-format exception** (`BAD_HEADLINE_FLAG`, line 515): format only, and the value `no` is correct.

## Independent re-derivation

**Instrument 1: Lean rebuild, copy-out-first.** Scratch: `scratchpad/c4-crit-U2-F/LeanProject/`.
- I copied U2's project, minus `.lake`, into my scratch.
- I bound `.lake/packages` by manual symlink to the shared pinned Mathlib project (v4.32.2, `905b9581…`). I never used `lake update`,
  `lake clean` or `--no-cache`.
- I copied in the controller's base cache (CF-C4-S3-1, from `scratchpad/c4-base/LeanProject/.lake/build`; I also copied its
  `.lake/config`), not the seat's cache.
- Before building, `cmp` confirmed that `Main`, `ChokeState`, `E1FlowConstruction`, `C3LA1`, `LeanProof.lean`, `lakefile.toml`,
  `lake-manifest.json` and `lean-toolchain` are byte-identical to `sources/c4-base`.

`lake build LeanProof` (foreground) exits 0 with `Build completed successfully (8661 jobs)` and 0 `error` occurrences
(`work/build-replay.log`, `f41cf43b…`). The `declaration uses sorry` warnings are at Statements lines
31, 41, 64, 81, 94, 104, 147, 156, 170, 177, 185, 193, 201, 210, 226, 244, 456, 553. That set is exactly the return's.
`#print axioms` (`work/axioms-replay.log`, `b8f1ca7f…`) gives:
- `cb8_activeWeight_leafSet_eq`: `[propext, Classical.choice, Quot.sound]`
- `cb8Rho_one_eq_cb8R1_ratio`: `[propext, Classical.choice, Quot.sound]`
- `cb8_flowBundle_of_arcSpecs`: `[propext, sorryAx, Classical.choice, Quot.sound]`, which matches U2's disclosure that N7 main
  is open.

**Frozen-text fidelity (ruling 23).** My checker `work/sigcmp.py` (`daca77a9…`) extracts all 21 frozen declarations from
`control/C4-FROZEN-STATEMENTS.lean`, each from the keyword through the doc-less signature up to `:=`. Every signature occurs
byte-for-byte, exactly once, in U2's `Statements.lean`. The full `cb8GSec` definition, including its body, is byte-identical. The
reserved terminal name occurs 0 times. There are 0 occurrences of `admit`, `native_decide`, `decide` and `set_option`.

The one file-level divergence is disclosed by U2: an added `import LeanProof.C3LA1` line plus five comment lines, at lines 4–9. The
statements do not depend on it. The companion's *proof* needs it. At Stage 7, the award's panel must either carry this import or
place the companion in a file that already imports `C3LA1`. A `diff` against the frozen file shows hunks only at the import block
and at the three proof bodies (256, 266, 337).

**Instrument 2: my own Python, graph-derived (`work/critic_instrument.py`, `312e4b8b…`; output `work/critic.out.json`,
`dd523ce5…`; canonical results digest `6ea4fd3a0ca70185c82cea56a67011288a4dc782268467ced9f8e2bb5f119cac`).** It is built from
SEMANTIC-CONTRACT §1–§2 prose, not from U2's script. U2's script hard-codes `leafSet = {v} ∪ C` and `W_v = {r}`,
`W_c = {u_i}`, which are the same labelled objects as the Lean entries 60/69/70. It is therefore not an independent side for
*fidelity*. Mine builds the CB(8,m) edge list and checks that it is a tree (`n − 1` edges and connected). It then **derives** the
leaf set as the degree-1 vertices, each leaf's original support as its unique neighbour, and the witness set `N(s_v) ∖ {v}`. It
evaluates the contract's active-tag weight `#{v ∈ F ∩ B : B ∩ (N(s_v)∖{v}) ≠ ∅}` with `F` = all leaves, on arbitrary vertex
subsets. Results:

| Row | Mode | Checks | Failures | Derived leaves | Difference index |
|---|---|---|---|---|---|
| `m = 1` | exhaustive, 2^20 subsets | 1,048,576 | 0 | 9 | none (a per-set identity, not layer-indexed) |
| `m = 2` | sampled + structured | 20,000 | 0 | 17 | none |
| `m = 107` | sampled + structured | 1,500 | 0 | 857 | none |
| `m = 158` (fresh) | sampled + structured | 1,500 | 0 | 1,265 | none |
| `m = 161` (structural) | sampled + structured | 1,500 | 0 | 1,289 | none |
| `m = 164` (fresh) | sampled + structured | 1,500 | 0 | 1,313 | none |

The derived leaf set equals the entry-60 `leafSet` at every row, which is a fidelity check of the carried classification. In the
mutation control, dropping the `[v, r ∈ B]` term fails on 262,144 subsets at `m = 1` (exactly the 2^18 sets containing both `r` and
`v`), so the check discriminates.

**ρ₁ link (N7 companion), my own instrument.** I compute `ρ₁ = r₁(p*−1)/r₁(p*−2)` by direct polynomial convolution of
`(1+y)^7(1+2y)^{8m−7}` (no closed-form sum), with index of record `j = p* − 1` and `j − 1 = p* − 2`. I compare it with
`cb8R1(m,K)/cb8R1(m,K−1)`, `K = (16m+1)/3 = p* − 1`:

| Row | p* | Index (top/bottom) | Equal | θ ≤ 1 − ρ₁ | (1−ρ₁)/θ |
|---|---|---|---|---|---|
| 107 | 572 | 571/570 | yes | yes | 34.9008… (reproduces the fixed point 34.90) |
| 158 | 844 | 843/842 | yes | yes | 51.5025… |
| 161 | 860 | 859/858 | yes | yes | 52.4790… |
| 164 | 876 | 875/874 | yes | yes | 53.4556… |

**Switch-image inequality `ρ₁γ + (8−γ)σ(γ) ≤ γ`, exact, γ = 0..8, at rows 107, 158, 161, 164.** It holds at all 36 cells, with
`σ(γ) = c_γ·θ` from the entry-82 table and `c_γ = 0` off `1..7`. The slack is strictly positive for γ = 1..8 and exactly 0 at γ = 0,
where both sides are 0. **E1 load bound `ρ_q < 1`** holds for every `q ∈ [1, m]` at each of the four rows (index `j = p* − q`), and
the maximum is at `q = 1`.

**Replay of U2's generator, copy-out-first.** I copied `work/check_n6_n7companion.py` (`aa3adc83…`) to
`scratchpad/c4-crit-U2-F/work/replay_check.py` and ran `python3 -B`. Exit 0 with empty stderr. The output `work/replay.out.json`
is **`774857c8…eda7`, byte-identical** to U2's `run2.out.json`. The replay shows N6: 1,058,596 checks over
`m ∈ {1, 2, 107, 110, 113, 158}`, 0 failures. That matches the return. It also shows the **N7 companion at 25 rows**
(107, 110, …, 164, 200, 299, 401, 2000, 2393), all equal. **The return says "20 rows"; that literal is wrong and is corrected to
25.** The file named `.json` also carries two plain-text trailer lines after the JSON object, so it is not valid JSON on its own.
This is cosmetic.

**Row-order disclosure.** My fresh-row tests (158, 164, structural 161) and my Lean composition proof were run in the same session.
The Lean compile of the universal N7 proof came first, and the row check came after. No universal claim in this critique rests on
the rows. The rows found no failure.

## Attacks and findings

1. **The "complete" informal derivation of N7 clause (4) is incomplete (substantive; strikes "complete").** In U2's case split
   "Every other `A`" (RETURN lines 188–194), the return asserts `Total = 0 + 0` using `hE1.5` for the E1 column. But `hE1.5` zeroes
   the E1 column only when `r ∈ A ∨ q(A) = 0`. The **`r`-free targets with `q(A) ≥ 2`**, and those with `q(A) = 1 ∧ v ∉ A`, receive
   the E1 load `ρ_q·w(A) ≠ 0` from `hE1.4`. The return never bounds that load. The missing step is `ρ_q ≤ 1` at the clause-(4)
   syntax `cb8Rho (8q−1) (8(m−q)+1) ((p*−q : ℕ) : ℤ)`. It needs the carried `cb8Rho_lt_one_topRank m q hm hres (1 ≤ q) (q ≤ m)`,
   and hence the fact **`q(A) ≤ m`**. The frozen companion `cbOpenChokeCount_le` is still `sorry`, so a sorry-free N7 must prove
   `q ≤ m` inline. I did this with `Finset.card_filter_le` against `card_range`. The sentence "no case is assumed vacuous without a
   cited hypothesis" is therefore false as written. This is exactly the "two-or-more-choke targets / one-choke targets not reached
   by a switch" class the protocol requires to be checked.
2. **Missing C2-LA3 bridge (minor, but load-bearing in Lean).** Clauses (3) and (4) are stated at the weight
   `F = favorableLeaves (cbGraph m) p*`, while N6 (`hW`) is at `C5LA1.leafSet`. Applying N6 needs
   `cb8_favorableLeaves_eq_leafSet_topRank` (C2-LA3). U2's derivation writes "By N6 (hW), w(B) = …" at `F` without citing the
   bridge. The frozen docstring permits it; the derivation omits it.
3. **The γ ∈ {0, 8} boundary is sound, not an artefact (answering the attack brief).**
   - `cb8Sigma m γ = cb8CGamma γ · θ` (entries 82 and 86). `cb8CGamma` is `0` off `1..7`.
   - γ = 0: the frozen `cb8GSec` guards the switch by `1 ≤ γ` (N3 definition, line 135), and `hZero`'s fourth conjunct zeroes
     (1,0)-switches. The literal switch column really is `0 = 8·σ(0)`, and the E1 load is `ρ₁·0 = 0`. This is an equality case,
     with 0 slack in my exact table.
   - γ = 8: no sector preimage exists, because a (1,8) state would need 9 legs and N5 counts `8 − γ = 0` preimages. The column is
     `0·σ(8) = 0` whatever value `σ(8)` takes. The inequality reduces to `8ρ₁ ≤ 8`, which is `cb8Rho_lt_one_topRank` at `q = 1`.
   - So the junk value affects N5's *formula* only at γ = 0, where it agrees with the guarded definition. N7's use of it is
     consistent. If `cb8CGamma 0` were ever redefined to be nonzero, N5 would become false at γ = 0, not N7. That is a note for the
     N5 panel.
4. **N6: no attack succeeds.** The Lean proof is a genuine `Finset.ext` classification plus disjoint-union and `card_biUnion`
   counting. It has no hypotheses encoding the conclusion, no enumeration and no decide. `0 < m` enters only through
   `mem_leafSet_cbGraph_iff` and `eq_cbVertex_iff`. The final proof is the post-fix text. The five `omega` failures in
   `build-kernelcheck.log` (lines 357, 388, 389, 408, 409; the log's two further `error:` lines are "Lean exited" and "build failed")
   are absent from the final build, and I rebuilt it myself. The formula is stated for *every* finset `B`, not only independent
   ones, and my graph-derived instrument confirms it on arbitrary subsets.
5. **N7 companion: no attack succeeds.** Its value identity is literally the same coefficient ratio. `b = 8(m−1)+1 = 8m−7` equals
   `cb8R1`'s `8m−7`, and `j = p* − 1 = K`. It is proved through C3-LA1's entries 33 and 37 plus `cb8R_natCast_eq_coeff`, with
   ℕ-subtraction guarded by `hj1 : 1 ≤ p* − 1`. Nothing in it is circular.
6. **"Clauses (1)–(2) … kernel-checkable in isolation"** (line 225): this was unbacked as shipped, because the declaration's axioms
   include `sorryAx` and no isolated check was run. It is now backed by my build (next section), which re-uses U2's clause-(2)
   argument unchanged.
7. **Grade vocabulary.** "`bounded_evidence` at the informal-derivation level" (line 227) is not a SOLUTION-CONTRACT §4 grade and
   is struck. The same goes for "BUILD-CONFIRMED, sorry-free, kernel-checked" used as a grade: the correct label is `compiled`
   (scratch, ungraded), and U2 does also say that.
8. **Remaining obligation inexact.** U2's item 1 names only (a) the independence extraction and (b) the γ boundary. It omits the
   E1-load bound for `q ≥ 2` and for `q = 1 ∧ v ∉ A` (finding 1), the inline `q ≤ m`, and the C2-LA3 bridge (finding 2).

**Critic-derived advance: N7 main (`cb8_flowBundle_of_arcSpecs`) closed sorry-free on my scratch, all four clauses.** This result
is attributed to C-U2-F (Claude Opus 5.5). I wrote a proof (`work/n7proof.lean`, `f82a32c7…`) of the frozen declaration, with its
signature byte-identical (checked by `sigcmp.py`). Its route:
- **Setup.** Destructure the hypotheses. C2-LA3 gives `F = leafSet`. From `indepFamily` membership and `cbGraph_adj_r_choke`, `r ∈ X`
  forces `u_i ∉ X` for every `i < m`. Inline, `q(X) ≤ m`.
- **(1) Nonnegativity** comes from `hE1.1 + hSec.1`.
- **(2) Support** is U2's argument.
- **(3) Out**, three cases:
  - `r ∈ B`: the E1 row vanishes by `hE1.2`.
  - `v ∈ B`: `w = 1` by N6, then `hOut`.
  - `v ∉ B`: `w = 0 ≤ Σ g_sec`.
  - `r ∉ B`: `hE1.3` plus `hZero.1`.
- **(4) In**, five cases:
  - `r ∈ A`: E1 is 0. With `v ∈ A`, `hIn` and `w = 1`. With `v ∉ A`, `w = 0`, so `hZero.2` applies.
  - `r ∉ A`, `q = 0`: `w = 0`, and both columns are 0.
  - `r ∉ A`, `q ≥ 2` or (`q = 1`, `v ∉ A`): `hSw.2` zeroes the sector column. `mul_le_of_le_one_left` with
    `cb8Rho_lt_one_topRank m q` bounds the E1 load. This is the case the return omitted.
  - `r ∉ A`, `q = 1`, `v ∈ A`: extract the unique `i₀` (`Finset.card_eq_one`). Then `w = γ` (`Finset.sum_eq_single`), and `hSw.1`
    gives the sector column `(8−γ)σ(γ)`.
    - For `γ ∈ [1,7]`: the companion ρ₁ link, then C1-LA1 (iv) Switch and (v) Residual give `ρ₁ ≤ 1 − θ`, and linear arithmetic
      finishes.
    - For `γ ∉ [1,7]`: `cb8CGamma γ = 0` by `rfl` on the default branch, `σ = 0`, and `ρ₁ < 1`.

Build record:
- **Standalone check.** `lake env lean` on `work/CriticN7.lean` (`1d478145…`) compiles with 0 messages;
  `#print axioms critic_flowBundle_of_arcSpecs` gives `[propext, Classical.choice, Quot.sound]`.
- **Transplant.** I then placed the proof into the frozen declaration's body in my scratch `Statements.lean` (`5392e82d…`, 696
  lines; `diff` against U2's file touches only the N7-main body, `work/statements-critic-vs-U2.diff`).
- **Full rebuild.** `lake build LeanProof` exits 0 with 8661 jobs and 0 `error` (`work/build-critic.log`, `eafe47d9…`). The `sorry`
  warnings now sit only at N1–N5 (lines ≤ 244) and N8 (line 681).
- **Axioms.** `work/axioms-critic.log` (`4f865de1…`): **`cb8_flowBundle_of_arcSpecs` depends on axioms:
  `[propext, Classical.choice, Quot.sound]`**. N6 and the companion are unchanged and clean.

The proof uses only the carried facts the frozen docstring permits, plus Mathlib: C1-LA1's terminal, C2-LA3, `cb8Rho_lt_one_topRank`,
the companion and `cbGraph_adj_r_choke`. It uses no `set_option`, `decide` or `native_decide`, and not the `sorry`-bodied
`cbOpenChokeCount_le`.

This is a **compiled scratch declaration (ungraded)**, and it is conditional *by design* (ruling 26). Its hypotheses are the open
conclusions of N2–N5, so it asserts no flow and no (HALL) by itself.

## Mechanism-equivalence and fence check

- N6 and N7 are gate-frozen leaves. They are not new `E993-R31-` claims, and no registry key is touched or re-graded.
- N7 is the ruling-26 composition. Its hypotheses are per-arc specs of the two named functions, not a flow's existence, so it is
  not the struck R-9/R-10 reduction pattern. My proof does not change this.
- **Fences:**
  - One rank `p*`, `d = 8`, class `m ≥ 107`, `m ≡ 2 (mod 3)` only. N6 is a graph identity for every `m ≥ 1` and asserts nothing
    about (HALL).
  - No refuted mechanism is revived.
  - No Newton or Darroch appears anywhere. `ρ_q < 1` comes from the carried C1-LA3 condition (i) and a positivity lemma.
  - No `θ*` law is used as a hypothesis. `cb8Theta` is C1-LA1's closed form, and my row numbers are census checks, not proof.
  - No status transfers to any aggregate key.
- **Fidelity (protocol duty 2):**
  - The active-tag weight is re-derived from the tree (leaves, supports, witnesses) and agrees.
  - The relation (D) ∪ (S) enters only via `transportRel`'s left disjunct in clause (2).
  - `F_{p*}` is the derived selector, bridged to `leafSet` by the C2-LA3 award.
  - This route computes no `x` and no instance supply or capacity, so (WID) from independent sides is not applicable to U2's
    objects. It stays owed by F2's composed-flow check.
- **Carried-entry byte check:** U2 carries no entries of its own. Its proofs cite base entries by name, and the base files are
  byte-identical to `sources/c4-base`. At Stage 7, carries must come from the governed runs (ruling 25), not from the base copies.

## Certification audit

| Literal in the return | Status |
|---|---|
| N6 compiles sorry-free; axioms `[propext, Classical.choice, Quot.sound]` | **backed** (my rebuild and axioms) |
| N7 companion compiles sorry-free; same axioms | **backed** |
| N6 and companion signatures byte-identical to frozen | **backed** (`sigcmp.py`) |
| Build exit 0, "8661 jobs", 0 errors, sorry-warning line list | **backed** (identical list) |
| All listed digests | **backed** (table above) |
| Python: N6 1,058,596 checks, 0 failures; mutation controls caught | **backed** (byte-identical replay) |
| "N7 companion an exact rational identity at 20 rows" | **struck; corrected to 25 rows** |
| Replay "byte-identical" in `c4-U2-replay/` | not read (outside grant); **equivalent fact backed** by my replay digest |
| N7 clauses (3)–(4) "complete, hypothesis-by-hypothesis informal derivation" | **struck ("complete")**: omits the `q ≥ 2` / `q = 1 ∧ v ∉ A` E1-load bound, `q ≤ m`, and C2-LA3 |
| "no case is assumed vacuous without a cited hypothesis" | **struck** (false for the omitted class) |
| Clauses (1)–(2) "kernel-checkable in isolation" | unbacked as shipped; **now backed by the critic's build** |
| `bounded_evidence` (grade token) | **struck** (not a §4 grade) |
| C3-LA1 entries 33/37 "formally verified" | **narrowed** to "compiled inside the C3-LA1 award's project" |
| `FROZEN_NODES_CLOSED: N6, N7-companion` | **backed** for the return; with the critic advance the U2 node set is N6 and N7 in full |
| `compiled` verdict | **backed** (build and axiom logs exist) |

Numeric claims and difference index (ruling 29): U2's rows are per-set identities (N6) and a value identity whose indices
`p* − 1`, `K`, `K − 1` are written textually. No numeric claim sits at a row without a textual index, so nothing is rejected on this
ground.

## Verdict

verdict: retained_narrowed
headline_resolved: no

U2's two closure claims survive rebuild, frozen-text byte comparison, axiom printing and an independent graph-derived instrument:
N6 `cb8_activeWeight_leafSet_eq` and the N7 companion `cb8Rho_one_eq_cb8R1_ratio`. N6 is a sound Stage 7 candidate. Three things are
narrowed. The return's "complete" informal derivation of N7 clauses (3)–(4) is struck, because it misses the E1-load bound on
`r`-free targets with `q ≥ 2` or with one choke and no `v`. The "20 rows" literal is corrected to 25. The grade vocabulary is
corrected. The critic's own advance closes N7 main sorry-free on scratch, with all four clauses. The U2 node set N6 and N7 therefore
compiles in full on the Cycle 4 base, conditionally on N2–N5 by design. The headline stays unresolved: conjunct 4 still needs
N1–N5 and N8, then Stage 7 awards.

- COND4_formal: no — conjunct 4 is not closed; N6 and N7 (both declarations) compile sorry-free on scratch (N7 main by this critic), N1–N5 and N8 remain `sorry`
- E1_formal: no — N1/N2 not touched by this route or this critique
- TERMINAL_integration: no — N8 and the stitch are untouched
- cut_candidate: none
- FROZEN_NODES_CLOSED: N6, N7 (N7 companion by U2; N7 main `cb8_flowBundle_of_arcSpecs` by critic C-U2-F)

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Stage 7 (N6).** Fund N6 as an award whose terminal is the frozen text. The panel should rebuild from the governed carries
   (ruling 25) and check that `mem_leafSet_cbGraph_iff`, `eq_cbVertex_iff`, `mem_cb_tagWitnesses_v_iff/leaf_iff`,
   `cbVertex_val` and `chokeGamma` are carried byte-identically from C1-LA2 and ChokeState.
2. **Stage 7 (N7).** N7, both declarations, can be funded as the ruling-26 composition. The proof text is at
   `scratchpad/c4-crit-U2-F/work/n7proof.lean` (`f82a32c7…`). It needs an isolated second read against the frozen text before any
   award. The companion's proof requires `C3LA1` to be imported, which is U2's disclosed file-level divergence. The panel must
   resolve that at the award's file layout.
3. **N7 is conditional by design.** Its value to conjunct 4 is realised only when N2 (E1 spec), N3 (sign/support, Out ≥ 1), N4
   (In ≤ 1, zero classes) and N5 (switch-image inflow) compile. The N5 panel should note that N5's `(8−γ)·σ(γ)` at γ = 0 relies on
   `cb8CGamma 0 = 0` agreeing with `cb8GSec`'s `1 ≤ γ` guard.
4. **Still owed by F2, not by U2:** the end-to-end composed-flow check (`cb8E1Arc + cb8GSec`) per target class at rows
   158/161/164, with (WID) from independent sides. Neither U2 nor this critique supplies it.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U2-F/` (SHA-256):
- `LeanProject/` is the copy-out of U2's project, with packages symlinked and the controller base cache copied in.
  `LeanProject/LeanProof/Statements.lean` is `5392e82d…12d8fd` (U2's file, with N7 main's body replaced by the critic proof).
- `work/n7proof.lean` `f82a32c791da17b805cbd42088aa1d60270372ae4ce5bab38ab968cf83d37b40`: the critic's N7 main proof body.
- `work/CriticN7.lean` `1d4781450c18262b8e43da8676bda2fda1c98edb5897e023940137be48268a42`: the standalone copy under a non-reserved
  name, with `#print axioms`.
- `work/build-replay.log` `f41cf43b…` (rebuild of U2's file); `work/axioms-replay.log` `b8f1ca7f…`.
- `work/build-critic.log` `eafe47d94c40aa5c3f75cc828a2e7070e3fcde9fa72649d60e4ee054b07507ff` (rebuild with the critic N7);
  `work/axioms-critic.log` `4f865de10b59989523aa0a587388f12ce2c3b9a853af94667cc7ddabde6a3ca9`.
- `work/Ax.lean` = `work/Ax2.lean` `deeb3a6e…` (axiom scripts); `work/statements-critic-vs-U2.diff` `0a13c1e0…`.
- `work/sigcmp.py` `daca77a9…` (frozen-signature byte comparison).
- `work/critic_instrument.py` `312e4b8bfaa1616e02e7fed969ca783e484ec950904c5cf29b8cace854853e7c`; `work/critic.out.json`
  `dd523ce52d65b590bf6f40fbfd47dcdf9d022d44202efb6e68500c25f6c1c3d4`; canonical results digest (embedded)
  `6ea4fd3a0ca70185c82cea56a67011288a4dc782268467ced9f8e2bb5f119cac`.
- `work/replay_check.py` `aa3adc83…` (copy of U2's generator); `work/replay.out.json` `774857c8…eda7` (byte-identical to U2's).

**Process and read-boundary disclosures.**
1. I read the whole capsule, including `C4-STAGE3-CONTROLLER-FACTS.json`, `C4-STAGE3-ADMISSION(-EXCEPTIONS).json` and
   `PATH-CHECK-U2.json`. I read the frozen statements and the base sources in my own scratch copy. All are Stage 2 members.
2. An `awk` extraction of my section of `C4-CRITIC-ATTACK-BRIEFS.md` also printed the following **U3 section** (about 5 lines).
   This is a read-boundary disclosure. Nothing from it was used.
3. An `ls` of `cycles/cycle-4/stage4/critics/` showed the name of a sibling directory (`U3`). I opened no file in it. This is a
   directory-name disclosure.
4. I did not read `scratchpad/c4-U2-replay/`.
5. I copied the controller cache's `.lake/config` along with `.lake/build`.
6. Every build and `lake env lean` ran in the foreground inside the pinned project. I started no background job, so there was none
   to kill. There was no network access, no package install and no full process listing.
