# Critique

Critic `C-U2-T` (orientation T, prove), r31 Cycle 3 Stage 4, of seat `U2`: route `C3-U-02`, mechanism
`FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`, orientation U. Written 2026-09-28, about 06:10 to 06:30 EDT by the clock.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem: no memory, logs, skills,
decisions, operations or conversations, and I wrote no conversation log because the controller owns logging for this run.

**Read-boundary disclosures.**
1. The harness put the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool call.
   I did not open them and I used nothing from them.
2. One `grep -rl "SR-C2-2" .` rooted at `sources/`. That directory is inside my grant. From its hits I read
   `sources/c2-results/second-reads/SR-C2-2/SECOND-READ.md` (lines 1–150) to check the arc values of record. I also read the WID and
   aggregate lines of `sources/r30/records/SEMANTIC-CONTRACT.md` and ran JSON queries on `sources/authority/CLAIM-IDENTITY.json` and
   `sources/concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json`. All of these are Stage 2 members.
3. I ran one `ps -ax -o pid,command | grep … | grep crit-U2-T` to confirm that no `lake`/`lean` job of mine was left running. The
   process table was produced but filtered to my own scratch path, and only my own shell's line was displayed. After the write I
   ran one `pgrep -fl "c3-crit-U2-T"` filtered for lake/lean. It matched only my own invoking shell, whose command line contained
   this file's text, and found no `lake` or `lean` process. I sent no kill.
4. `cmp` read the pinned shared project's `lake-manifest.json`, which lies under an allowed external root. It differs from U2's
   copied manifest. The Mathlib rev `905b9581…` in U2's manifest matches `sources/mathlib-binding/PIN.json`.
5. I ran one non-recursive `ls` of `scratchpad/c3-U2/` (my replay target) and read Mathlib-free carried text in U2's `Main.lean`.
   I did not open U2's `c1la2_names.txt`/`c1la3_names.txt` (not inventoried). I did not open `scratchpad/c3-U2-replay/`, because it is
   outside the `scratchpad/c3-U2/` grant; see the path finding below.
6. An `echo =====` separator triggered a zsh `=`-expansion error. It was cosmetic.
7. No network, no installs, no child agents, no `/tmp`, no `lake update`/`lake clean`. Packages were bound by manual symlink, and
   every `lake`/`lean` call ran with the working directory inside my pinned copy.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage4/DISPATCH-C-U2-T.md` (file SHA-256) | `de9581b885c59dd4ff2d04a9a10dc82fd4485836cbd70a4bb04b03adb8f71dec` | MATCH |
| **Capsule seal** `control/c3-critic-capsules/U2-PACKET-MANIFEST.json` (compact key-sorted JSON minus `seal_sha256`) | **`13d69b2bf489f6368b9ecfe67e6d51cdd3f8fc910fe7b168853e2c494b6423bf`** | MATCH |
| Capsule members (14; bytes and SHA-256) | all recomputed | 14/14 MATCH |
| Stage 4 dispatch manifest seal | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | MATCH (self-seal) |
| Stage 3 packet manifest seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | MATCH (self-seal); lists `returns/U2/RETURN.md` at `96e61484…ddad`, the capsule's value |
| Stage 2 packet manifest seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | MATCH (protocol and dispatch value) |
| Return `cycles/cycle-3/stage3/returns/U2/RETURN.md` | `96e61484683581505dbb728227911c0226dea0e945ec2cf0e75aa015d771ddad` | MATCH |
| Carried origins: C1-LA2 `Main.lean` / C1-LA3 `Main.lean` | `a906ec17…5f3f` / `c0605e12…3011` | MATCH against `sources/c1-results/SOURCE-DIGESTS.json` and the Stage 2 manifest; that digest file (`13117a91…c850`) is itself a Stage 2 member |
| U2 `Main.lean` (2161 lines) | `7fbf053123fa58a36e7a49e09937af54c5d3f153b41a96efd68b5ccf3e9ac9df` | MATCH (return) |
| U2 `E1FlowConstruction.lean` (335 lines) | `54e011f22e1ab95d6c09d930e76a5d53896e16bd7424d6aaf6cdb722cce27c84` | MATCH (return) |
| U2 `u2_rho1_fixedpoint.py` | `f1c504e7d37b8d6b773fab0d01a9fcba5753d7d2d7b569abda470c86c0bc4117` | MATCH (return) |

**Carry audit (gate ruling 19).** I compared the files byte for byte. U2's `Main.lean` is exactly the C1-LA2 `Main.lean` (all 84,219
bytes, as a prefix), then one added banner comment line, then the C1-LA3 `Main.lean` from its line 7 onward. The six stripped lines are
the `import Mathlib` header and the generator comment. No declaration text is altered. The carry is the award runs' assembled
`Main.lean`, not a `Snippets/` re-assembly. Because the bytes match those governed files, I accept it as byte-identical carry. The
synthesis should note that the concatenation adds one non-origin line: a comment, with no effect on any term.

**Path finding.** The return's replay outputs, the build log and `.out.json`, sit in `scratchpad/c3-U2-replay/`. That directory is
outside the seat's scratch `scratchpad/c3-U2/`. I did not read them. Their digests (`9043d2da…`, and the `5e658768…` output file) are
therefore unverified by me. I replaced them with my own rebuild log and replay.

**Route identity.** The return carries route ID `C3-U-02` and mechanism token `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION` verbatim. Both
match `C3-ALLOCATION.md`.

## Independent re-derivation

**R1. Rebuild, done copy-out-first.** I copied U2's project into `scratchpad/c3-crit-U2-T/LeanProject/` and bound `.lake/packages` by
symlink to the pinned shared project. `lake build LeanProof` completed successfully (8658 jobs). There are **8** `#print axioms` lines,
each reporting `[propext, Classical.choice, Quot.sound]`, and no `sorryAx`. `E1FlowConstruction.lean` contains no `sorry`, `admit`,
`native_decide` or `decide`; the word "sorry" occurs only in doc comments. There are **6** warnings: unused `hm`, `hres` and `hfav` in
`cb8E1Arc_spec_topRank_of_named_nodes`, and three unused `if_true` simp arguments.

**R2. Fidelity of the named function to the arc values of record.** I checked against SR-C2-2 D4/D6 and SEMANTIC-CONTRACT §2.
`cb8N a b α k` is `N_q(α,k) = C(a,α)C(b,k−α)2^{k−α}`, guarded to zero outside `α ≤ a, α ≤ k, k−α ≤ b`. `cb8G` is
`g_α = ρ·Tc_{α−1} − Sc_{α−1}` and `cb8H` is `h_α = Sc_α − ρ·Tc_{α−1}`, with `Σ_{α'<α}` read as `Tc_{α−1}`. `cb8E1Val` has three
branches:
- choke deletion gives 0;
- active-tag deletion gives `g_α/S_α`, where the Boolean guard `z ∈ F ∧ ¬Disjoint (B.erase z) (tagWitnesses z)` is literally
  `activeWeight`'s filter predicate;
- any other vertex gives `w·h_α/((j−α)·S_α)`.

The parameters are `α = w−1`, `j = p−q`, `a = 8q−1`, `b = 8(m−q)+1`. The contract's `ℓ` is `j − α`, since a source has
`|B| − q − w = p+1−q−w = j−α` closed-leg or arm vertices. **The named function is literally SR-C2-2's X-8.** `cb8R` is the polynomial
coefficient via the carried `polyCoeffZ`, which is the contract's `r_q`. The active-tag weight, the tag witnesses and the relation
(deletion only; switches are outside E1) are those of record.

**R3. Literal-network instrument (mine, `py/literal_e1.py`).** This is a direct transcription of `cb8E1Val`/`cb8E1Arc`, generalized
to `d`. At `d = 8` it uses the exact Lean labels. It runs on the literal network of small `CB(d,m)` with every independent set
enumerated. It checks the enumeration against a separate tree-DP independence polynomial and asserts (WID) at every rank from the
independent side, `Σ_{v∈F}[q_v(p) − q_v(p−1)]`, where `q_v(j) = i_j(T − {v,s_v}) − i_j(T − N[s_v])` comes from the DP on deleted
graphs. It uses `F = leafSet` (the `hfav` instantiation) and also reports the derived strict selector `i_{p+1}(T−v) < i_p(T−v)`. It
computes `r_q` by direct polynomial convolution, not by the `N`-sum.

Rows tested: `CB(2,1..4)`, `CB(3,2..3)`, `CB(4,2)` and `CB(8,1)`, at every rank. Results:
- (WID) holds at every instance.
- Clause (1): no negative arc anywhere.
- Clause (4) In: exact at every `r`-free target with `q ≥ 1`.
- Clause (5): zero at every `r ∈ A` or `q(A) = 0` target.
- `hZeroChoke`: holds at every instance.
- Clause (3) Out: exact at every source with `j = p − q ≥ 1`. **It fails at exactly the sources with `j = 0`**, where `(q, w, j) = (p, 1, 0)`,
  i.e. `B` = all `p` open chokes plus one tag, at `p ≤ m`. There `r_q(j−1) = 0`, Lean's `x/0 = 0` makes `ρ = 0`, and `h_0 = 1 ≠ 0`.

At `p*`, `j − 1 ≥ (13m+1)/3 > 0`, so this is outside the class. But a formal `hOut` must use `q < p*` (see Attacks, A4). Result digest:
`4b3c068d…8ba`.

**R4. Class-row quotient instrument (mine, `py/classrow_quotient.py`).** Fresh rows first (gate ruling 17): `m = 125, 128, 140`, then
the controls `107, 110, 113, 116, 119, 122`, all at `p*`. For every `1 ≤ q ≤ m`:
- `ρ_q < 1`;
- `ρ_max = ρ_1`;
- `r_q` as the `N`-sum equals the direct coefficient, cross-checked at `q ∈ {1, m/2, m}`.

For every realizable source type (`S_α > 0`, 21,967 to 37,575 per row), with integer cross-multiplication:
- `0 ≤ ℓ ≤ b`;
- `g_α ≥ 0` and `h_α ≥ 0`;
- `g_α + h_α = S_α`;
- `h_α = 0` when `ℓ = 0`.

For every realizable target type, the In identity holds exactly in `Fraction`, with the literal fiber counts `a − α` (tag insertions)
and `2(b − ℓ')` (closed or arm insertions). **0 violations on all 9 rows.** The fixed points reproduce: `CB(8,95)/508` `ρ_1` exact,
and `CB(8,107)/572` `n = 1822`, `α = 964`. Result digest: `0b91b1cc…380`. This is bounded evidence that `hVal_nonneg`, `hOut` and `hIn`
are true at these rows. It is not a proof.

**R5. Replay of U2's generator.** I copied `u2_rho1_fixedpoint.py` into my scratch and ran it. It reproduced
`ρ_1 = 1354839571516225/1361543988640524` with `sha256_of_result_json` `cc9a82ecaa8109a44992e8443ea75d438d246c4cd92be265bcb478b75e6bcfa5`,
which is the return's value. The script's docstring says it matches the Lean `cb8R` "exactly". In fact it computes `r` as the
`N`-sum, so it tests the identity coefficient = `N`-sum by assumption rather than the Lean definition. My R3/R4 direct-convolution
cross-check covers that gap.

## Attacks and findings

**A1 (load-bearing): two of the four "named nodes" are the conclusion.** `hIn` is clause (4) of the conclusion verbatim, with `f`
unfolded and `F = favorableLeaves (cbGraph m) p*`. The proof's clause (4) is `exact hIn A hA hr hq`. `hOut` is clause (3) restricted
to `q(B) ≥ 1`. So the theorem does not "isolate what T1/T2 must still supply" as sub-lemmas. It restates the two flow identities,
which are the whole content of E1 beyond sign, as hypotheses. The return says openly that they are "taken verbatim as the target
clauses' own statements". The real kernel-checked content of `cb8E1Arc_spec_topRank_of_named_nodes` is:
- clause (2);
- clause (5), both branches;
- the `q(B) = 0` halves of clauses (1) and (3).

These are genuine but small. The reduction of the spec to "four named hypotheses" stands only in this narrowed reading.

**A2: the attribution of `hOut` is wrong.** The return assigns `hOut` to "T1's node (b), the `S_{α'+1}(α'+1) = T_{α'}(a−α')` double
count". It is not a double count. Out follows from the telescoping `g_α + h_α = S_α`, which holds by definition, together with the
literal partition of `B`, as SR-C2-2 D6 "Rows" already records. **Critic-derived, compiled:** `cb8G_add_cb8H`
(`cb8G a b j α + cb8H a b j α = cb8N a b α j`, by `Finset.sum_range_succ; ring`) and `cb8_out_algebra`. The latter shows that `w` tag
arcs at `g/S` plus `ℓ ≥ 1` closed arcs at `w·h/((j−α)·S)` sum to `w` whenever `S ≠ 0` and `j − α = ℓ`. The double counts, T1's
node (b), enter only In. Likewise `hVal_nonneg` needs only T2's (ii-1)/(ii-2) together with `S_α > 0`, not T1's node (b).

**A3: `hfav`, `hm` and `hres` are dead.** The linter confirms that the conditional theorem uses none of them. It is class-free as
proved. This is harmless, but "given these … five total, `hfav` already an existing formal fact" misdescribes what the proof consumes.
Discharging `hOut`/`hIn`/`hVal_nonneg` WILL need `F = leafSet`: with `F ⊊ leafSet` an active `c ∉ F` falls into the ternary branch
and `ℓ ≠ j − α`, so Out breaks. `hfav` is therefore needed by the discharges, not by this theorem.

**A4: the `j ≥ 1` requirement.** R3 shows that the literal Out identity fails at `j = p − q = 0`, because `ρ` is undefined and Lean
returns 0. Any formal `hOut` must use `q ≤ m < p*`, so `j − 1 ≥ 0` and `r_q(j−1) > 0`. The `ℓ = 0` case (`w = p+1−q`, possible for
`q ≳ 0.59m`) needs `cb8H a b j j = 0`. That requires the coefficient identity `polyCoeffZ((1+X)^a(1+2X)^b) k = Σ_α cb8N a b α k`,
which is not in the carried layer, together with `r_q(j−1) ≠ 0`. Neither is named by the return.

**A5: over-quantification of `hVal_nonneg` (true, but check).** The hypothesis quantifies over every `Finset B` and every `z`, not
only independent sets of rank `p*+1` or `z ∈ B`. I checked that it is still true. A nonzero value requires `cb8N a b α j ≠ 0`, hence
`α ≤ a`, `α ≤ j`, `j − α ≤ b`. The value then has the sign of `g_α` or `h_α`, and (ii-1)/(ii-2) (X-9) hold for all `α ∈ [0, a]`. At
`α = j` the ternary denominator is 0 and Lean returns 0. So `hVal_nonneg` reduces with no graph content to a pure coefficient
statement: for `1 ≤ q ≤ m`, `α ≤ 8q−1` and `cb8N ≠ 0`, `0 ≤ cb8G ∧ 0 ≤ cb8H`. This makes it a clean T2 target.

**A6: the cast seam.** `cb8E1Val` uses `j := (p:ℤ) − q`, while clause (4) and `cb8Rho_lt_one_topRank` use the ℕ-subtraction
`((16m+4)/3 − q : ℕ)` cast to ℤ. They agree because `q ≤ m < p*`. A future `hIn` proof needs that cast lemma. This is not a defect.

**A7: `cb8Rho_lt_one_topRank`.** It is correct and its statement matches the contract's `ρ_q < 1`, strict, at `p*` for `1 ≤ q ≤ m` on
the class. Its proof is a 10-line division corollary of the formally verified C1-LA3 entry 20 plus entry 14. "Genuine new formal
content" overstates it: it is a ratio restatement of a formally verified lemma, and fence 6 says such restatements are not funded as
progress.

**A8: the remaining clauses hold up.** `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem` and `cb8E1Arc_zero_of_no_open_choke` are correct
and non-circular. The choke test `∃ i < m, z = cbVertex m (3+17i)` and the count `cbOpenChokeCount` match the frozen labels
(`u_i = 3+17i`). No ℕ-subtraction hazard: `8q − 1` is used only under `q ≥ 1`, and `m − q` is safe because `q ≤ m` for a
`range m` filter count.

**A9: the flow target classes (protocol duty 3), for E1's part.**
- In-sector targets (`r ∈ A`) receive 0 (clause (5), formal).
- `r`-free `q ≥ 1` targets, including switch images, receive `ρ_q·w` (clause (4), hypothesis). The switch-image load `ρ_1 γ` is this
  at `q = 1`, and composing it with the sector share is U1/T3's matter.
- `q = 0` targets receive 0 (formal).
- Weight-zero targets receive exactly `ρ·0 = 0`, as R3 shows literally.
- Two-or-more-choke targets receive only E1.

No shared-capacity conflict arises inside E1. Capacity follows from `ρ_q < 1`.

**A10: no cut, no template failure.** Nothing here is a cut candidate.

**Critic-derived advance (attributed to C-U2-T, Claude Opus 5.5; compiled scratch, no grade; STATED).**
`LeanProof/CriticU2T.lean` builds in my pinned copy (`Build completed successfully (8659 jobs)`, every `#print axioms` reporting
`[propext, Classical.choice, Quot.sound]`, no `sorry`/`admit`/`native_decide`, no warnings). It contains:
1. `cb_activeWeight_eq_zero_of_no_open_choke`: for `0 < m`, **every** `F ⊆ leafSet (cbGraph m)` and every `B` with `r ∉ B` and
   `cbOpenChokeCount m B = 0`, `activeWeight (cbGraph m) F B = 0`. It is proved from the carried `mem_leafSet_cbGraph_iff`,
   `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff` and `eq_cbVertex_iff`.
2. `cb8_hZeroChoke`: U2's `hZeroChoke` exactly as stated, **outright** (via `favorableLeaves ⊆ leafSet`, `Finset.filter_subset`).
   `hfav` is not needed.
3. `cb8E1Arc_spec_topRank_of_named_nodes_critic`: U2's conclusion with `hZeroChoke` discharged. The open hypotheses drop to
   `hVal_nonneg`, `hOut` and `hIn`, and `hfav` is kept only because U2's theorem demands it.
4. `cb8G_add_cb8H` and `cb8_out_algebra` (A2): the algebraic core of `hOut`.

## Mechanism-equivalence and fence check

- **Mechanism.** This is the registered E1 criterion flow (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`,
  `proved_informal`; master status VERIFIED), formalized in its X-8 explicit form. It is not a refuted mechanism: not (G′), not
  compression, not CHAR, not the per-choke certificate, not forest real-rootedness. No Darroch or Newton appears anywhere. The only
  sequences involved are `C(a,·)` and `C(b,·)2^·` inside a formally verified lemma.
- **One rank, the class only.** The spec and `cb8Rho_lt_one_topRank` are at `p*` on `107 ≤ m`, `m % 3 = 2`. `cb8E1Val` is defined at
  general `p`, but nothing is claimed off `p*`. My small-`CB(d,m)` runs are instrument fidelity tests only, and they claim nothing
  about any rank or row.
- **No status transfer.** Nothing moves to (HALL), the aggregate keys or #993. No census is used as proof. The `θ*` law is not used.
  The r30 bounded record is not used.
- **Claim identity.** The return touches the criterion, threshold, favorability and Tier 1 keys, all correctly cited at their grades,
  and proposes no key. My alias check was lexical plus a regex for zero-weight, no-open-choke, rho, E1-arc and deletion-flow patterns
  over master 491 and master 510; it found no hit. My `hZeroChoke` lemma is the formal form of SR-C2-2 D1's weight description on
  `r`-free sets. It proposes no new key and belongs as a companion under the criterion key or T2's zero-weight classification. The
  synthesis should dedupe it against T2's classification lemma, which I have not read.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| `cb8Rho_lt_one_topRank`, the structural lemmas, the conditional spec graded "`formally_verified`" (§5) | kernel-checked in scratch (my rebuild) | **STRUCK.** SOLUTION-CONTRACT §4: "a compiled scratch declaration has no grade until its governed award closes". Replace with *compiled (kernel-checked scratch, no grade)* |
| "nine `#print axioms` calls" | 8 in the file and the log | **STRUCK** → 8 |
| "four cosmetic linter warnings" | 6 (3 unused variables, 3 unused simp arguments) | **STRUCK** → 6 |
| "zero `sorryAx`", "zero `sorry`", axioms `[propext, Classical.choice, Quot.sound]` | my rebuild | BACKED |
| "Build completed successfully (8658 jobs)" | my rebuild | BACKED |
| build log digest `9043d2da…`, output-file digest `5e658768…` | files outside the seat's scratch; not read | UNVERIFIED (path finding) |
| `sha256_of_result_json` `cc9a82ec…` | my replay | BACKED |
| script and Lean digests | recomputed | BACKED |
| "genuine new formal content" (`cb8Rho_lt_one_topRank`) | a 10-line corollary of C1-LA3 entry 20 | NARROWED → "ratio restatement of a formally verified lemma" |
| "`hOut` — T1's node (b) … double count" | Out is telescoping plus a partition count (A2) | **STRUCK** |
| "`hVal_nonneg` (T1 node b + T2 node c jointly)" | needs only (ii-1)/(ii-2) plus `S_α > 0` (A5) | NARROWED |
| "the full spec is formal modulo four named hypotheses … isolating precisely what T1/T2 must still supply" | `hIn` is clause (4) verbatim, `hOut` is clause (3) at `q ≥ 1` | NARROWED (A1) |
| "five total, `hfav` already an existing formal fact" | `hfav` unused by the proof | NARROWED (A3) |
| "`hZeroChoke` … not yet proved here" | now discharged by the critic (Lean, outright) | superseded |
| `COND4_formal: advanced` | no statement about `IsSaturatingFlow` or the composition changed. The E1 progress is counted under `E1_formal` | NARROWED → `not_advanced` |

## Verdict

verdict: retained_narrowed
headline_resolved: no

COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none

Retained: the literal named arc function `cb8E1Val`/`cb8E1Arc`, which is faithful to X-8, and the compiled structural clauses (2) and
(5). Also retained is `cb8Rho_lt_one_topRank` at the exact class scope. All of these are compiled scratch with no grade.

Narrowed: the conditional spec is a reduction to `hVal_nonneg`, `hOut` and `hIn`, and `hOut`/`hIn` are the target's own flow
identities. The route's true E1 advance is the definition plus the structural clauses.

With the critic's discharge of `hZeroChoke`, the spec now depends on three hypotheses. I have checked their mathematics:
- Out is complete informally: SR-C2-2 D6, plus A2 and A4, and its algebraic core is compiled by me.
- In is complete informally: SR-C2-2 D5/D6.
- Nonnegativity follows from X-9.

All three are exact on the literal network wherever `j ≥ 1` (R3) and on the quotient at all 9 class rows (R4). My grade for the
unconditional `cb8E1Arc_spec_topRank` statement is `proved_informal` STATED, pending an isolated second read. Its formal discharge is
open.

## Remaining obligation

For the unconditional `cb8E1Arc_spec_topRank` on `cbGraph m`, `107 ≤ m`, `m % 3 = 2`, `p = (16m+4)/3`, `F = favorableLeaves (cbGraph m) p`:

1. **`hVal_nonneg`.** Reduce, with no graph content (A5), to: for `1 ≤ q ≤ m`, `a = 8q−1`, `b = 8(m−q)+1`, `j = p−q`, `α ≤ a` and
   `cb8N a b α j ≠ 0`, show `0 ≤ cb8G a b j α` (this is (ii-1) at `α−1`) and `0 ≤ cb8H a b j α` (this is (ii-2) at `α`). This is T2's
   node (c) as `Finset.sum` inequalities, multiplied through by `r_q(j−1) > 0`, which is C1-LA3 `twoBinomCoeff_pos`.
2. **`hOut`** (`q(B) ≥ 1`, `B ∈ I_{p+1}`, `r ∉ B`). The pieces are:
   - (a) `Σ_{A∈I_p} cb8E1Arc B A = Σ_{z∈B} cb8E1Val B z`, by the injectivity of `z ↦ B.erase z` and the guard;
   - (b) the literal partition of `B` into `q` chokes, `w` active tags and `ℓ = p+1−q−w` others, which needs `hfav`, i.e.
     `F = leafSet`;
   - (c) `cb8N a b (w−1) j ≠ 0`, from `w ≤ 8q` and `ℓ ≤ 8(m−q)+1`;
   - (d) the case `ℓ ≥ 1`, which is the critic's `cb8_out_algebra`;
   - (e) the case `ℓ = 0`, which is `cb8H a b j j = 0`. It needs the new coefficient identity
     `polyCoeffZ((1+X)^a(1+2X)^b) k = Σ_α cb8N a b α k` and `r_q(j−1) ≠ 0` from `q < p`. The identity FAILS at `j = 0`; see R3.
3. **`hIn`** (`q(A) ≥ 1`, `A ∈ I_p`, `r ∉ A`). The pieces are:
   - the literal up-cover fibers: `8q − w_A` tag insertions of type `α+1`, `2(8(m−q)+1−ℓ'_A)` closed or arm insertions of type `α`,
     and choke insertions carrying 0, with `q(B) = q(A)` on the nonzero arcs;
   - T1's node (b), the two double counts on `cb8N`;
   - the in-balance `h_α + g_{α+1} = ρ·T_α` (definitional, like `cb8G_add_cb8H`);
   - the `w_A = 0` case;
   - the ℕ/ℤ cast seam of `j` (A6).
4. `hZeroChoke`: **closed** by this critic (compiled scratch, `cb8_hZeroChoke`). The synthesis should carry it with attribution.
5. After 1–3 close, specialize `cb8E1Arc_spec_topRank_of_named_nodes_critic`, or restate it without `hfav`/`hZeroChoke`. Conjunct 4
   still needs the link from this spec to `IsSaturatingFlow` composed with the sector flow (U1/T3/U3), which is not this route's object.
6. Hygiene: move replay outputs into the seat's own scratch.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U2-T/`:

| Path | SHA-256 | Role |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | `7fbf053123fa58a36e7a49e09937af54c5d3f153b41a96efd68b5ccf3e9ac9df` | copy of U2's carry (byte-identical) |
| `LeanProject/LeanProof/E1FlowConstruction.lean` | `54e011f22e1ab95d6c09d930e76a5d53896e16bd7424d6aaf6cdb722cce27c84` | copy of U2's file |
| `LeanProject/LeanProof/CriticU2T.lean` | `17a8d4c577311c72f3f394784fcba5fe65804c04dfcee3cd363d885841abc913` | critic Lean: `hZeroChoke` discharged, Out algebra |
| `LeanProject/LeanProof.lean` | `13118246fbe5f2bcd4e5ffcb09f1251520236d1938cf66189d58bf575e28a91a` | root with the critic import added |
| `lake_build_replay.log` | `b2604865c4a02bd716506a1641bf4ff5e6ff05d9671b7aecc0f9712c0ab36683` | rebuild of U2 as shipped (8 axioms lines, 6 warnings) |
| `lake_build_critic.log` | `c8e01a403d68153a111cdc1ae8b4f155224443184c4a2a661141b8f200985100` | build including `CriticU2T` (8659 jobs, 13 axioms lines) |
| `py/literal_e1.py` / `py/literal_e1.out.json` | `038e12c1…0048` / `4b3c068dd5aa0e7e190ce72afe9b8b6f4dd142af40b34de961ccf8f8b66038ba` | instrument 1 (literal network, (WID), all clauses) |
| `py/classrow_quotient.py` / `py/classrow_quotient.out.json` | `c146f764…59ba` / `0b91b1cc13286e37c8d7f65b648883a14285ef582e0e5c47b58b123dd7427380` | instrument 2 (fresh 125, 128, 140; controls 107–122) |
| `py/diag_out.py` | `a2215c5b…296a` | diagnostic for the `j = 0` Out failures |
| `u2_rho1_fixedpoint.py` | `f1c504e7d37b8d6b773fab0d01a9fcba5753d7d2d7b569abda470c86c0bc4117` | copy-out replay of U2's generator |

Commands: `cd …/LeanProject && lake build LeanProof`; `cd …/py && python3 -B literal_e1.py && python3 -B classrow_quotient.py`;
`cd …/c3-crit-U2-T && python3 -B u2_rho1_fixedpoint.py`. Imports: Python standard library only (`fractions`, `math`, `json`,
`hashlib`, `sys`); Lean imports `LeanProof.E1FlowConstruction` only. No background job was started. Every `lake` call ran in the
foreground and had exited before this write, as the filtered process check confirmed. Nothing was killed.
