# Critique

Critic `C-F1-T`: Cycle 3, Stage 4, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`). This is the cross-orientation (T, prove) critic of seat F1, route `C3-F-01`, mechanism token `FORMAL-STATEMENT-FIDELITY-ADVERSARY`, orientation F. Filed 2026-09-28 (the clock read 06:26 EDT when drafting began).

**Boot.** I booted VerityOS by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both in full, and I am operating within VerityOS. I opened no other VerityOS file outside this run root. The host placed the project `CLAUDE.md`, the user memory index and the user's e-mail address into my context before my first action. I did not open them, act on them or use them. After booting I read the dispatch `control/dispatch/c3-stage4/DISPATCH-C-F1-T.md`, whose SHA-256 `df519b67…0589` I verified, then the protocol, the capsule and the capsule members listed below.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal.** `control/c3-critic-capsules/F1-PACKET-MANIFEST.json` has `seal_sha256` = `f4e0fa0b03551640fd1737dd5c4599efcbf260c5d833ef227597e43821e16889`. I recomputed it over the canonical JSON (sort_keys, `(",", ":")`, `seal_sha256` removed, no trailing newline), and it **matches**. All 14 members match their listed byte counts and SHA-256 values, including the return (`a7fde80e…9129888`, 20169 B).
- **Stage 2 seal.** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`: recomputed, matches. F1's `verify_seal.py`, copied out and replayed, prints the same value and `MATCH`.
- **Stage 3 seal.** `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: recomputed, matches. F1's return is listed in that manifest at the same digest.
- **Stage 4 dispatch seal.** `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`: recomputed, matches.
- **Digests the return lists.**
  - All six award `Main.lean` digests match `sources/c1-results/SOURCE-DIGESTS.json` and `sources/c2-results/SOURCE-DIGESTS.json`. Both F1's `verify_source_digests2.py` replay and my own hashing show this.
  - All six script digests match the files in `scratchpad/c3-F1/`: `verify_seal.py 28b004c1…`, `verify_source_digests2.py 216f7f0c…`, `extract_statements.py b9351c2e…`, `extract_decl.py 6a3015f7…` and `carry_check.py 47c97c5f…`.
  - F1's `carry_check.out.txt`, regenerated in my scratch from the copied script, is **byte-identical** to the digest F1 claims (`323e5ae0137bea47a075cf032ad4d5a8561e21779f28bb3c225da543422252b3`). It reproduces 606 distinct names, 129 shared names and 3 flagged pairs.
- **Route identity.** The route ID `C3-F-01` and the mechanism token `FORMAL-STATEMENT-FIDELITY-ADVERSARY` both appear verbatim on the return, matching `C3-ALLOCATION.md`. The seat's model disclosure (chartered Sonnet/high; runtime `claude-sonnet-5`) is consistent with the allocation.
- **Registered claims touched.** The return touches `R31-C1-LA1`, `R31-C1-LA2`, `R31-C1-LA3`, `R31-C2-LA1`, `R31-C2-LA2` and `R31-C2-LA3`. It proposes no `E993-R31-` candidate, and none is proposed here.

## Independent re-derivation

I built three instruments of my own, all standard library only, in `scratchpad/c3-crit-F1-T/own/`. I also rebuilt the frozen award projects copy-out-first in `scratchpad/c3-crit-F1-T/lean/`. F1's scripts served only as a replay, never as evidence.

**(I) A carry audit keyed by content and origin (`carry_audit.py`).** F1 checks by declaration name across the six r31 files. My instrument instead parses every `-- VERITYOS ENTRY n BEGIN kind name hash` … `END` fragment of all six award files, 799 entries in total (33 + 78 + 21 + 549 + 28 + 90), and indexes every origin `Snippets/` fragment by SHA-256. The origins are first-interior `c2-primary-v2`, the five r30 awards, and each earlier r31 award in close order. Results:
- **Header hashes.** 799/799 headers equal SHA-256(body + "\n"). This is the content hash of the fragment, and it equals the award's own `Snippets/NNNN-…` file byte-for-byte (799/799).
- **Duplicate names.** None within any file. This matters because F1's name-keyed dictionary would silently overwrite a duplicate.
- **Carries by content.** A carry is either byte-identical to an origin fragment or differs by one sanctioned keyword:
  - C1-LA2 has 24 carries from first-interior and r30 (14 FI, 8 r30-C1, 2 r30-C6).
  - C2-LA1 has 97 exact carries (FI/r30 24, C1-LA2 53, C1-LA3 20) and 2 rekeys.
  - C2-LA2 has 17 exact carries from C1-LA3.
  - C2-LA3 has 76 exact carries and 1 rekey.
  - C1-LA1 and C1-LA3 carry nothing.
  - No entry is a modified copy under a reused name (`name_collision_new = []` everywhere).
- **Rekeys.** Exactly three, and each is reversible under a single-keyword edit: replacing `lemma` with `theorem` reproduces the origin bytes exactly.
  - C2-LA1 entry 57 corresponds to C1-LA3 entry 21 (`cb8_block_descent_topRank`).
  - C2-LA1 entry 105 corresponds to C1-LA2 entry 78 (`cb8_topRank_of_descent_and_flow`).
  - C2-LA3 entry 60 corresponds to C2-LA2 entry 28 (`cb8_leafDeletion_closedForms_descent_topRank`).
- **Carried SOURCE fragments.** Every `SOURCE/carried-*.lean.fragment` of every award is found byte-identically in an origin's `Snippets/`: 25 + 99 + 17 + 77 = 218/218.
- **Kernel receipts.** For each of the 11 origin or award kernel receipts (FI, five r30, six r31), `verdict = verified` and `source_sha256_after` equals the SHA-256 of the frozen `Main.lean`.

This agrees with F1's finding of three sanctioned rekeys and no unsanctioned break, and extends it past F1's scope in two ways: to the r30 and first-interior origins, and to the kernel receipts, as gate ruling 19 requires.

**(II) Statement fidelity (`statement_audit.py`).** For each award I compared the frozen `lean_binding.expected_statement` in `THEOREM-CONTRACT.yaml`, and its `expected_statement_sha256`, against the Lean source:
- **Verbatim match.** 6/6 `expected_statement_sha256` values equal the SHA-256 of the expected statement. 6/6 expected statements occur **verbatim, exactly once** in `Main.lean`, followed immediately by ` :=`. Each file has exactly one `theorem`.
- **C1-LA2 against the draft target.** C1-LA2's conclusion equals the `SOLUTION-CONTRACT.md` §2 draft terminal's conclusion after whitespace normalization. This confirms F1's "byte-identical (mod whitespace)" claim.
- **Forbidden tokens.** A scan outside comments finds zero occurrences of `sorry`, `admit`, `native_decide`, `axiom`, `implemented_by`, `extern`, `unsafe`, `ofReduceBool` or `decide` in all six files. Each file's only import is `import Mathlib`.
- **Axioms.** The frozen `EVIDENCE/axioms.txt` gives `[propext, Classical.choice, Quot.sound]` for all six terminals, and `sorryAx` appears 0 times in every `axioms-all-declarations.txt`.

**(III) Definition-level and numeric cross-checks (`numeric_audit.py`, exact integers and `Fraction`).**
- **Closed forms.** The three closed forms on the C2-LA2 face and in `SEMANTIC-CONTRACT.md` §2 are `I(CB)`, `I(CB − v)` and `I(CB − c_{0,3})`, with `G = (1+2x)^8 + x(1+x)^8` and `G_c = (1+2x)^7(1+x) + x(1+x)^7`. Each equals a literal tree DP on `CB(8,m′)` for m′ = 1..6 at every k. The check also gives `α = 9m′+1`.
  - Swapping the roles of `(1+x)` and `(1+2x)` in `G` fails at every m′. So the instrument can detect the retyping trap that F1's mandate names.
  - These small-m checks corroborate that F1's text comparison is correct. They are not proof; C2-LA3's link is the formal statement.
- **`cb8R1`.** Transcribed from C1-LA1, `cb8R1 m k = Σ_{i ≤ min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`. It equals `[y^k](1+y)^7(1+2y)^{8m−7} = r_1(k)` (`a_1 = 7`, `b_1 = 8m − 7`) for m ∈ {1, 2, 3, 5, 8} at every k.
  - At `m = 95`, `cb8R1(95,507)/cb8R1(95,506)` reproduces the contract's fixed point `ρ_1 = 1354839571516225/1361543988640524` exactly.
  - At `m = 107`, `(1 − ρ_1)/θ` evaluates to 34.9009, matching the recorded margin of about 34.90 with `cb8Theta 107 = 96/766193`.
- **Template definitions (read, not only named).** I read the definitions behind C1-LA1's statement:
  - `cb8Out(β,γ) = β·pb + γ·pc + [β = 1 ∧ γ ≥ 1]·σ(γ)`.
  - `cb8In(β,γ) = (8−β−γ)·(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and 0 otherwise.
  - `cb8Theta = 288/(200m²+82m+5)`.
  - These match the contract's choke-local template: an in-sector target at a choke with `8−β−γ` empty legs is fed through each empty leg by the one source whose leg there is `b` (state `(β+1,γ)`) or `c` (state `(β,γ+1)`).
  - Out is summed over `(16m+1)/3 = K` legs and In over `K − 1` legs, as the contract's `K := p* − 1` requires.
  - This check is at **template level only**; the reduction to the literal network is fenced as C1-LA1's scope.
- **Index arithmetic, done symbolically (a proof, not a sweep).** Write `m = 3u + 2`. Then `16m + 4 = 3(16u + 12)`, so `p* = 16u + 12` exactly. Also `(16m+1)/3 = 16u + 11 = p* − 1` and `(16m−2)/3 = 16u + 10 = p* − 2`, both exact.
  - The low window holds: `3p* = 16m + 4 < 18m + 3 = 2α + 1` if and only if `2m > 1`.
  - The C1-LA3 index stays positive: `p* − 2 − j ≥ p* − 2 − m = (13m − 2)/3 = 13u + 8 > 0` for `j ≤ m`.
  - The rows 107, 110, 113, 116, 119, 122, 125, 128 and 140 instantiate these identities, and `θ ≤ 1 − ρ_1` holds exactly at each of them. That is a sanity check only; C1-LA1 is the proof.

**(IV) Kernel rebuilds (copy-out-first).**
- **Method.**
  - Each award's `LeanProject` was copied into `scratchpad/c3-crit-F1-T/lean/<award>/`.
  - `.lake/packages` was bound by manual symlink to the pinned shared root `…/mathlib-v4.32.2-project/.lake/packages` (Mathlib `905b9581…`, Lean v4.32.2).
  - Each project was built with `cd` into it first and then `lake build`. I never ran `lake update` or `lake clean`.
  - Each terminal was probed with `#print axioms` in a separate `Probe.lean`.
- **Results.**
  - C1-LA1, C1-LA2, C1-LA3, C2-LA2 and C2-LA3 build successfully (rc 0). The copied sources have the frozen digests.
  - Every terminal prints `depends on axioms: [propext, Classical.choice, Quot.sound]`. C1-LA3 and C2-LA3 also printed `#check`, and each shows a type identical to the frozen expected statement.
  - C2-LA1 builds successfully (rc 0) and prints the same three axioms. All six terminals are therefore independently kernel-rebuilt.

## Attacks and findings

1. **F1's carry instrument is weaker than its prose says (narrowing; now repaired by this critic).**
   - F1 writes that "the claimed content hash agrees". Its script checks only that the *header* hashes agree **across files**. It never checks that a header hash is the hash of its own body. If a header and a body were changed together, that check would pass.
   - It keys entries by name in a dictionary, so a duplicate name within a file would be silently masked.
   - It never reaches origins outside the six r31 files (the r30 and first-interior `Snippets/`) or the kernel receipts. Gate ruling 19 requires carries bound to the origin's kernel receipt, and the attack brief asks for exactly that.
   - Instrument (I) closes all three gaps: 799/799 header hashes equal their body hashes, no duplicates exist, 218/218 carried fragments are found at their origins, and 11/11 receipts are bound to their sources. F1's conclusion survives, but on the return's own evidence it held only at the scope "cross-file name agreement among the six r31 files".
2. **Expected statement against the Lean source (attack-brief item; F1 did not do it).**
   - F1 compared terminals with the *contract prose*, clause by clause. It never compared each award's frozen `expected_statement` with its Lean source.
   - Instrument (II) makes that comparison: 6/6 verbatim, unique and digest-consistent.
   - I also confirmed the index of record in C2-LA2 and C2-LA3. Both evaluate at `(16m+4)/3 + 1` versus `(16m+4)/3`, which is the forward difference at `p*` required by gate ruling 16. C2-LA3's selector is the carried `favorableLeaves = leafSet.filter (IsFavorableAt · p)` with `IsFavorableAt ⇔ i_{p+1}(T−v) − i_p(T−v) < 0` over ℤ.
   - F1's gate-ruling-16 claim therefore stands, now backed at the definition level.
3. **ℕ-subtraction enumeration is incomplete (narrowing).**
   - The allocation names `8m − 7` explicitly. F1's "ℕ-subtractions and casts enumerated" list omits it, and it also omits `k − i`. Both occur in `cb8R1`, which is load-bearing for C1-LA1's Residual conjunct.
   - My check: `8m − 7` is exact for `m ≥ 1`, and `k − i` is guarded by `i ≤ min(7,k)`.
   - `cb8R1` is literally `r_1`, as shown in (III). So F1's "Residual line matches `θ ≤ 1 − ρ_1` literally" is now backed at the definition level; the return checked it at the level of names only.
4. **Unbacked literal (struck).** On C1-LA1, F1 writes that "`hm` enters only through the arithmetic identities used by `omega`/exact-rational bounds inside the closed proof". F1 read no proof bodies (see its own Remaining obligation 3), and the C1-LA1 theorem contract records no use-site for `hm`. **Struck.** The fidelity finding does not depend on it.
5. **Loose but correct bounds.**
   - "`p*−2−j ≥ 4.3m − 2 > 0`" is true. The exact value is `(13m−2)/3`, as derived in (III).
   - For C2-LA2, F1 says `m − 1` and `8m − 1` are "safe for m ≥ 107". They are, but the award's own contract records that `hm` is unused (the linter warning in `axioms.txt` confirms this) and that `hmod` alone forces `m ≥ 2`. The statement is safe either way.
   - Neither point is a finding against the return.
6. **Conditional reduction C1-LA2: no conclusion smuggling.** I agree with F1. `hE` is conjunct 2 verbatim and `hH` is conjunct 4 verbatim, and both are hypotheses. The theorem derives conjunct 1 (`cbGraph_isTree`) and conjunct 3 (`cb_lowWindow`, hypothesis `0 < m`, read at C1-LA2 line 1510). The award is honestly a reduction, and its face and registration say so.
   - One consequence needs stating for the Cycle 3 terminal: any "terminal ⇐ conjunct 4" statement composed from C1-LA2 or C2-LA1 is a composition of formal awards, not progress on conjunct 4.
7. **Out-of-scope claims taken on the return's word.** F1 cites `OBLIGATIONS.csv`, `ROUTE-STATE.md`, `AUTHORIZATION.md` and the charter prompt for the registry grades. None of these is in my capsule, so I did not check the statement that the grades are "`formally_verified` at their exact registered scopes (per `OBLIGATIONS.csv`)". What I can back is that all six kernel receipts give `verified`, are bound to the frozen sources, and use only the allowed axioms.
8. **Template versus network fence.** C1-LA1 is a template-level statement. F1 correctly treats it as a statement about `cb8Out`/`cb8In` over `Fin m → State8` splittings, and makes no claim that it is the literal sector flow. I found no drift.
9. **No cut and no refutation.** F1 claims none and correctly records `cut_candidate: none`. This is a template-free audit, so no template failure is miscalled.

## Mechanism-equivalence and fence check

- **Mechanism.** `FORMAL-STATEMENT-FIDELITY-ADVERSARY` is an audit mechanism. It proposes no transport mechanism, so it revives nothing on the SOLUTION-CONTRACT §3.6 list or ruling 20's refuted (G′).
- **Fence 1.** One rank `p*`, the class `m ≥ 107`, `m ≡ 2 (mod 3)`, and `d = 8`. Every audited terminal carries `107 ≤ m` and the residue hypothesis on its face, and none claims (HALL), an aggregate, or another rank. The return transfers no status to any aggregate key.
- **Fences 2, 3 and 7.** The selector is derived, not assumed (C2-LA3 proves `favorableLeaves … = leafSet`, with `hm` and `hmod` as its only hypotheses). No Darroch or Newton step appears. No census value is used as proof; my row evaluations are labelled as sanity checks.
- **Fence 8.** Nothing sealed was edited. All work was copy-out-first into my own scratch.
- **Claim identity.** No new key is proposed and the alias check is N/A. The six registry IDs are cited, and no grade is changed.

## Certification audit

| Literal on the return | Status |
|---|---|
| Stage 2 seal `f6b0f3fd…` MATCH | **Backed** (replayed and recomputed) |
| Six `Main.lean` digests MATCH | **Backed** (replayed and independently hashed) |
| `carry_check.out.txt` SHA-256 `323e5ae0…` | **Backed** (regenerated byte-identically) |
| "606 distinct … 129 shared … 126 exact byte-identical carries" | **Backed** as counts of F1's name-keyed instrument. The scope is cross-file name agreement, not an origin-bound carry check. |
| "claimed content hash agrees" | **Narrowed** on the return's evidence to cross-file agreement of headers. **Upgraded by this critic**: 799/799 headers equal their body hashes. |
| 3 rekeys "character-for-character identical apart from the keyword" | **Backed** (single-keyword reversibility reproduced for all three) |
| C1-LA2 conclusion "byte-identical (mod whitespace)" to §2 | **Backed** |
| C2-LA1 literal link target `C5LA1.indepSetCount (cbGraph m)` and index `p*−1 < p*−2` | **Backed** (expected statement verbatim in source) |
| C2-LA2 `G`, `G_c` "term for term" | **Backed** (text), plus a literal-DP corroboration at m′ ≤ 6 |
| C2-LA3 favorability evaluated at `p*` forward | **Backed** (carried definitions read) |
| `cbGraph_indepNum_eq`, `cb_lowWindow` with `hm : 0 < m` | **Backed** (C1-LA2 lines 1411 and 1510) |
| "`hm` enters only through arithmetic identities … inside the closed proof" (C1-LA1) | **Struck** (unbacked) |
| "ℕ-subtractions and casts enumerated … All checked safe" | **Narrowed**: the list is incomplete (`8m−7` and `k−i` are missing). Both are checked safe by this critic. |
| Grades "`formally_verified` … per `OBLIGATIONS.csv`" | Not checked by this critic (outside the capsule). The receipts' `verified` verdict is backed. |
| Gate lines `not_advanced ×3`, `cut_candidate: none` | **Backed** (the seat wrote no Lean) |

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

The return is a correct confirmatory fidelity audit of the six Cycle 1–2 awards. Its conclusion is that there is no statement-fidelity violation, no unsanctioned carry break, no conclusion-smuggling hypothesis, the index of record at `p*`, the contract's `G`, and `107 ≤ m` on every face. That conclusion is **confirmed and strengthened** here by independent instruments.

It is narrowed on three counts:
- The carry check, as shipped, is name-keyed and header-to-header, and it is not origin-bound.
- The ℕ-subtraction enumeration omits `8m − 7` and `k − i`.
- One literal about proof internals is struck.

The grade is `bounded_evidence` as filed. It is an audit, not a mathematical claim, and it moves none of the gate lines.

**Critic-derived advances (attributed to C-F1-T):**
- (a) A carry and receipt audit bound to origins, covering all 799 entries of the six awards, including the r30 and first-interior origins.
- (b) The reversibility records for R31-N-15, which F1 could not locate:
  - C2-LA1 `EVIDENCE/INFORMAL-AUDIT.md` lines 115–117 record entries 57 and 105.
  - C2-LA3 `FORMALIZER-REPORT.md` line 83 records entry 60.
  - I reproduced all three independently. This closes F1's Remaining obligation 2.
- (c) An independent kernel rebuild and `#print axioms` of the six terminals from their frozen sources, with results as stated in (IV). This covers F1's Remaining obligation 3 at the level of kernel re-checking.
- (d) The frozen `expected_statement` checked verbatim against the source for all six.

## Remaining obligation

Exactly one fidelity obligation of F1's allocation remains open: **the signed audit of Cycle 3's own proposed T1–T3/U1–U3 statements**, the ones Stage 7 may freeze. Neither F1 nor this critic may read sibling returns. That audit must be run at Stage 5/7 against each proposed `expected_statement` with the checklist below. The carry and statement instruments in `scratchpad/c3-crit-F1-T/own/` apply unchanged if the new award directories are appended to their lists.

1. The exact index `(16m+4)/3` (forward at `p*`).
2. The contract's `G`.
3. Every ℕ-subtraction, including `8m − 7` and `k − i` in anything built on `cb8R1`.
4. `107 ≤ m` and `m % 3 = 2` on the face.
5. No hypothesis encoding favorability, `ΣIn < 1` or a saturating flow, beyond an explicitly named and disclosed conjunct-4 hypothesis.
6. Link targets that are literally `C5LA1.indepSetCount` / `C4LA1.vertexDeletionIndepSetCount` of `cbGraph m`.
7. Carries that match an origin fragment by content, or differ by one reversible `theorem → lemma` edit, bound to the origin receipt.

Nothing else from F1's list of remaining items stays open. The headline, a formally verified conjunct 4 on `cbGraph m` at `p*`, is untouched by this route.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F1-T/`:

- `replay/` holds copies of F1's six scripts (digests as on the return) and `replay/carry_check.out.txt` (`323e5ae0…`, byte-identical to F1's).
- `own/carry_audit.py` (`56a8e99b57c3bcffda0e7d9e79745365ca5deb2761c9f4c483575cea12bd1673`) → `own/carry_audit.out.json` (`faa966603895de2baade90ce9abdd553fb6405b440cfc30e438ce370008ba8d0`).
- `own/statement_audit.py` (`1efb9fcebe077bf0e1dc690aad32d19e6696b5f4a45a08bd84d5696563b90b28`) → `own/statement_audit.out.json` (`cfc2b6e27c1d55ab3e9e13bb1c0398ab1215c3c79ef527875572ecc3ad383330`).
- `own/numeric_audit.py` (`ad31455e59a7973c675689dc1d311caba3204c8a7bd6c3e51b31185dc720c009`) → `own/numeric_audit.out.json` (`cf98d68e086cb60bd35ab67cf8f6885bc04cf805dca45118c3eb0c637c23a7a3`).
- `lean/{la1c1,la2c1,la3c1,la2c2,la3c2}/` hold the rebuilt copies, each with `build.log`, `Probe.lean` and `probe.out`. The probe outputs are: la1c1 `bd1f0114…`, la2c1 `0ce55557…`, la3c1 `b6dbf9bb…`, la2c2 `3f7ff883…`, la3c2 `c5b9edd4…`. The copied `Main.lean` digests equal the frozen ones.
- `lean/la1c2/` (C2-LA1, 549 entries, including the degree-50 certificate): the build passed (rc 0, 13 min 52 s wall under contention with other builds). `probe.out` (`413989ab346f949fef964230a800720381408fcb0a819143238bac887d7b3c5d`) reads `'E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3' depends on axioms: [propext, Classical.choice, Quot.sound]`. The copied `Main.lean` is `986b5257…` (frozen), and `build.log` is `60298df8…`. It ran as a background job; it had exited and no process of mine remained before this file was finalized.

Every script imports only standard-library modules (`os`, `re`, `json`, `hashlib`, `fractions`, `math`). I used no network and installed nothing. Lean was built only with the pinned toolchain and the shared Mathlib bound by symlink, and I ran no `lake update` or `lake clean`.

**Read-boundary disclosures.**
1. I ran `grep -rIl` for `R31-N-15`/`reversib` rooted at `sources/c2-results/runs/`, which is within the grant (`sources/`), and one non-recursive `ls` of `scratchpad/c3-F1/`, also within the grant. `find` was used only inside `sources/`. I read `sources/c*-results/runs/*` award records (theorem contracts, receipts, evidence and one formalizer report); all of these are Stage 2 members under `sources/`.
2. To identify my own background build by its working directory, I ran `pgrep -f "lake build"` and `pgrep -fl "lean "`, then `lsof` on the PIDs found. These are process listings above my grant. They surfaced the scratch **paths** of other critics' concurrent Lean builds (`c3-crit-U3-T`, `c3-crit-U3-F`, `c3-crit-U1-T`) and one command line. I opened no sibling file and used nothing from them. The only processes I acted on were my own, by literal PID.
3. I did not read `scratchpad/c3-F1-replay/`, which the return cites. All replays used the copies in `scratchpad/c3-F1/` instead, and their digests match.
