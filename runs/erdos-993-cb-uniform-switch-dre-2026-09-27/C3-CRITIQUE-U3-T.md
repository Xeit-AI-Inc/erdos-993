# Critique

Critic `C-U3-T` (cross-orientation, orientation T / prove) of seat U3, route `C3-U-03`, mechanism token
`FORMAL-CB8-TERMINAL-INTEGRATION` (orientation U), r31 Cycle 3 Stage 4. Dispatch
`control/dispatch/c3-stage4/DISPATCH-C-U3-T.md`, SHA-256 `b8d08f2c07bb9142f923c5e463c0ba74127237f8104eceaad1ce0c574cd947a0` (recomputed: match).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The harness also placed the project `CLAUDE.md` and the auto-memory
index into my context without my reading them. I opened no other VerityOS file (see the read-boundary disclosures under
`## Artifact inventory`).

## Identity and seal audit

- **Capsule seal** (`control/c3-critic-capsules/U3-PACKET-MANIFEST.json`), recomputed over the canonical JSON without `seal_sha256`
  (sort_keys, separators `(",",":")`, no trailing newline): `416beba2d380b52df2c8ec4d349daeacd3467fc82c33962ebd061409d220c5c7`. **Match.**
  All 14 member files match their listed SHA-256 and byte counts, including the return
  (`cycles/cycle-3/stage3/returns/U3/RETURN.md`, `726ed6f8…fbd3`, 27051 B).
- **Stage 4 dispatch manifest seal:** `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`, which matches.
  **Stage 3 packet seal:** `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`, which matches.
  **Stage 2 seal:** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`, which matches the protocol's value and the return's.
- **Digests the return lists:**
  - The merged `Main.lean` SHA-256 `88ccaaa4db42ee8fc87b4b30b0b18e78f46c63530eab24339bd59ade9b186a25` is reproduced two ways:
    - the copied-out file, 2,419,823 B and 13,302 lines, as claimed;
    - my copy-out-first replay of U3's `merge_lean.py` + `assemble.py`, with only the output path redirected to my scratch. That replay
      gives a byte-identical `Main.lean` and a byte-identical `merged_blocks.json`.
  - The 799 origin fragment digests were rechecked against each origin `FORMALIZATION-STATE.json` by my own instrument (below).
- **Route ID / token** present verbatim in the return. The return's model disclosure is two-part (`claude-sonnet-5`).

## Independent re-derivation

U3 ships no numeric table. Its claims are Lean artifacts, so I re-derived every one with my own instruments and did not rely on U3's scripts.

1. **Carry fidelity (own checker `carry_check.py`, which does not import U3 code).**
   - For each of the six frozen runs I checked three things:
     - the origin `Main.lean` digest equals its kernel receipt's `source_sha256_before = source_sha256_after`, and all six are bound;
     - every Snippet digest equals its `FORMALIZATION-STATE.json` entry and the digest on the origin `Main.lean` ENTRY marker;
     - every Snippet body equals the corresponding origin `Main.lean` segment.
   - Result: 799 occurrences (33+78+21+549+28+90), 606 distinct names, and 0 mismatches.
   - Against U3's `Main.lean`: all 606 carried names are present once.
     - 603 blocks are byte-identical to an origin variant.
     - 3 blocks carry exactly one `theorem`→`lemma` edit on the run's own terminal. These are the C1-LA1, C2-LA1 and C2-LA3 terminals
       (entries 111, 582 and 606). I checked that each edit is reversible.
     - 0 mismatches, 0 missing, and 2 new names.
   - All six origin `VERIFICATION-REPORT.json` report `status: formally_verified`.
   - Ruling 19 holds for the full carry, not only a sample.
2. **The three name collisions (own `collision_check.py`).**
   - The collisions are `cb8_topRank_of_descent_and_flow` (C1-LA2 / C2-LA1), `cb8_block_descent_topRank` (C1-LA3 / C2-LA1) and
     `cb8_leafDeletion_closedForms_descent_topRank` (C2-LA2 / C2-LA3).
   - Each downstream copy equals the origin copy after the single keyword edit, so the unified diff is exactly one line. U3's
     statement is confirmed.
3. **Rebuild (copy-out-first).**
   - I rebuilt `scratchpad/c3-crit-U3-T/LeanProject`: U3's shell files and `Main.lean` byte-copied, with `.lake/packages` bound by
     manual symlink to the shared project. The shared Mathlib `git rev-parse HEAD` is `905b95818eb32af7874a58b427f50c1711a5e96c`,
     which matches the pin.
   - I ran `cd` into the project, then `lake build LeanProof` (PID 1340, polled). Result: `Build completed successfully (8657 jobs)`,
     0 errors, 8 warnings. All warnings are at carried lines 2991, 5372, 5415, 5443 (×4) and 12572, so U3's count is reproduced.
   - The only `sorry` tokens in `Main.lean` sit in two docstrings (lines 3011 and 3060). There is no `native_decide`, `admit` or `axiom`.
4. **Axioms (own `CheckAxioms.lean`).**
   - `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for both new U3 declarations, which reproduces U3's `axioms.log`.
   - U3's `CheckAxioms.lean` is not in its inventoried scratch; only the log is. My rerun now backs it.
5. **Statements read against `SOLUTION-CONTRACT.md` §2 (`#check` output in `axioms.log`).**
   - The conclusion of `cb8_topRank_eligible_and_weightedHall` is the §2 four-conjunct body verbatim: `IsTree`,
     `crossingIndex + 2 ≤ p*`, `3p* < 2·indepNum + 1`, and `∃ f, IsSaturatingFlow … favorableLeaves … p* f`. The binder `hres` is
     renamed `hmod`, which is immaterial.
   - Its **hypotheses are not §2's**: it adds `hH`, which is *literally conjunct 4*. The theorem therefore has the shape
     `P → (A ∧ B ∧ C ∧ P)` with `A, B, C` proved. It is "terminal ⇐ conjunct 4", a pure composition of formal awards. That is correct,
     and I say so as the brief requires.
6. **Zero-weight lemma, semantic check (own `zero_weight_check.py`).**
   - I built literal `CB(8,m)` from the frozen label map (`cbEdge`, C1-LA2 entry 23: `r=0, s=1, v=2, u_i=3+17i, b_ij=u_i+1+2j,
     c_ij=u_i+2+2j`). I computed the active-tag weight from the contract's definition: support = the unique neighbour of a leaf, and
     `W = N(s_v)∖{v}`.
   - I compared the zero-weight condition with the lemma's right-hand side on 20,000 random sets for each of `m = 1, 2, 3`: 0
     mismatches, with 6,935 / 7,815 / 8,814 positive-weight samples. The lemma means what its docstring says.

## Attacks and findings

**F-1 (principal; alias). U3's "new" terminal-integration theorem is already a carried declaration of C2-LA1.**
- Entry 580 of U3's own merged project is `E993Transport.AdjU.cb8_topRank_of_flow`. It is C2-LA1's face companion, which the U
  adjudicator authored in Cycle 2, and its docstring reads "The terminal of SOLUTION-CONTRACT §2 reduced to conjunct 4 alone". It
  has the same binders `(m) (hm : 107 ≤ m) (hres : m % 3 = 2) (hH : ∃ f, IsSaturatingFlow …)` and the same conclusion.
- I checked this in the kernel. The declaration `example : @cb8_topRank_eligible_and_weightedHall = @AdjU.cb8_topRank_of_flow := rfl`
  compiles, and it can only compile if the two types are definitionally identical.
- Consequences:
  - (a) The return's mathematical alias check ("not present verbatim or by trivial restatement anywhere in the registry") is false.
    The statement sits in the project U3 itself built.
  - (b) The gate-line justification "down from two (`hE ∧ hH`) in C1-LA2's own terminal" is stale. C2-LA1 had already reduced it to
    `hH` alone in Cycle 2, and that step was kernel-checked inside the C2-LA1 award.
  - (c) Proposed key 1, `E993-R31-CB8-TOPRANK-SOLUTION-CONTRACT-TERMINAL-CONDITIONAL-ON-CONJUNCT-4-ALONE`, is an **alias** of a
    carried C2-LA1 statement and should not be registered as new. Under SOLUTION-CONTRACT §4 a companion lemma on an award's face
    carries no certificate of its own, so the statement exists formally at C2-LA1 without a key.

**F-2 (claim-identity hazard; reserved name).**
- U3 gives its conditional theorem the name `cb8_topRank_eligible_and_weightedHall`. That is exactly the name §2 reserves for the
  unconditional Tier 1 terminal.
- Two declarations with one name cannot coexist in one Lean project. A name-keyed lint could also match the conditional declaration
  against the Tier 1 `expected_statement`.
- Neither U3 declaration may be frozen under that name. Use C2-LA1's `AdjU.cb8_topRank_of_flow` or a name such as `…_of_flow`.
  Remaining-obligation item 1's "one application" hook is mathematically right, but it would have to target a renamed or carried
  declaration.

**F-3 (overclaim of the route object).**
- The allocation's object was "the terminal … stated with conjunct 4 reduced to the E1 hypothesis alone". The return says this
  "closed", and `new_entries.py` labels it "conjunct 4 reduced to the E1 hypothesis alone".
- The hypothesis `hH` is **conjunct 4 itself**, not the E1 flow in the adapter shape. No reduction of conjunct 4 to the E1 hypothesis
  was done; that reduction needs the sector flow `g_sec` and its composition, which is U1's object.
- The phrase is struck. What closed is "terminal ⇐ conjunct 4", and C2-LA1 had already closed it (F-1).

**F-4 (zero-weight lemma; correct and new).**
- `cb8_activeWeight_leafSet_zero_iff` compiles sorry-free with standard axioms. Its statement matches the contract's `W_v = {r}` and
  `W_{c_ij} = {u_i}`, it holds for arbitrary `B`, and its `hm : 0 < m` is genuinely needed (at `m = 0`, `r` is itself a leaf).
- It is independently confirmed on literal instances (above).
- A search of `sources/` found no prior zero-weight classification lemma. The nearest are `critic_sector_activeWeight_eq_one` and
  `critic_switch_image_activeWeight`, which are different statements. The lemma is new at the grain of the frozen sources.
- Fidelity caveat: its tag set is `C5LA1.leafSet`, not `favorableLeaves … p*`. Applying it to the network at `p*` needs C2-LA3's
  `cb8_favorableLeaves_eq_leafSet_topRank`, which is carried at entry 606.
- The in-code comment cites "SEMANTIC-CONTRACT §5". The weight-zero clause is in §2, and §5 holds the fixed points. This is minor.

**F-5 (merge integration; genuine).**
- The six governed awards (606 declarations) co-elaborate in one project with no name clash beyond the three keyword variants. I
  reproduced this.
- This is real integration value, and it is the part of `TERMINAL_integration: advanced` that stands.

**Fidelity items of protocol duty 2** (active-tag weight, relation (D) ∪ (S), `F_{p*}` derived, `x` through `α`, (WID)):
- U3 introduces no instrument and no number.
- The weight, relation and selector in play are the carried Lean definitions of record (entries 14–21). I diffed them against r30
  C1-LA2's snippets: they differ only by `open scoped Classical` → `open Classical in` scoping and docstrings, which is the recorded
  "freeze repair 3".
- `favorableLeaves` is the derived strict selector, not assumed. It is `leafSet` only through C2-LA3's formal proof.
- (WID) is not applicable, since no computation is interpreted.

**Other checks:**
- No ℕ-subtraction or cast is introduced by either new declaration; `(16m+4)/3` is carried.
- Newton and Darroch are not touched.
- No hypothesis encodes a conclusion other than by design. `hH` *is* conjunct 4, which is stated and correct but makes the theorem
  trivial.
- The endpoint `m = 107` is covered by `hm : 107 ≤ m`.
- The residue enters only through the carried C2-LA1 and C1-LA2 lemmas.

**Comparison with U1's hypothesis (attack brief).** I cannot perform it: U1's return is outside my read boundary. I state U3's
hypothesis exactly, as `hH` above. My advance CA-2 below gives the rational-flow interface that any U1-style hypothesis should be
matched against at adjudication.

## Mechanism-equivalence and fence check

- The mechanism is pure term-level composition of formally verified awards plus one pointwise `Finset` lemma. No refuted mechanism is
  revived: not (G′), not forest real-rootedness, and not the `m`-independent per-choke certificate.
- **Fences hold:**
  - one rank `p*`, with the class `m ≥ 107`, `m % 3 = 2`, `d = 8`;
  - no status transfer to (HALL), to any aggregate or to #993;
  - no census value used as proof;
  - the `θ*` law never used;
  - the r30 bounded record never used.
- The zero-weight lemma is stated for all `m > 0` and arbitrary `B`. It is a structural fact about `activeWeight` on `cbGraph m`, not
  a claim at other ranks or residues, so fence 1 is not breached.
- Attribution: every carry retains its origin comment. The terminal's attribution should name the C2-LA1 U adjudicator as the origin
  of the statement (F-1).

## Certification audit

**Struck (not backed):**
1. "the terminal … stated with conjunct 4 reduced to the E1 hypothesis alone … **Both closed**". `hH` is conjunct 4, not the E1
   hypothesis (F-3).
2. "down from two (`hE ∧ hH`) … not previously stated or carried anywhere in the registry" as applied to the terminal, and the
   mathematical alias check's "not present … by trivial restatement anywhere". The statement is carried C2-LA1 entry 580 (F-1, `rfl`).
3. The `Main.lean` header literal "six name-collisions". There are **three** (my `collision_check.py`; U3's own return also says
   three).
4. "lines ≈13230–13380" for the two new declarations. They begin at line 13202 (entry 607). This is harmless, because no warning
   falls there.

**Backed (reproduced by my instruments):**
- the `Main.lean` digest `88ccaaa4…6a25`;
- 2,419,823 B, 13,302 lines, 608 entries;
- 799 occurrences, 606 distinct, 193 duplicates;
- zero digest mismatches and no missing group digest;
- the three keyword-only collisions;
- `Build completed successfully (8657 jobs)`, 0 errors, 8 carried-content warnings;
- the axioms output of both new declarations;
- "sorry-free" for both new declarations;
- the Mathlib pin.

The QuickTest build and `build2.log` are self-reports that I did not replay; nothing depends on them.

**Grade:** both new U3 declarations are `compiled` (scratch, no grade), as U3 correctly says. The return's note on what grade a
governed award would inherit is accurate for the zero-weight lemma. For the terminal the note is moot, because the statement already
lives inside the C2-LA1 award.

**Critic-derived advances (C-U3-T, scratch, no grade; compiled in `scratchpad/c3-crit-U3-T/LeanProject/LeanProof/CriticU3T.lean` on
top of U3's merged project; `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for each; 0 errors, 0 warnings).**

To attempt the step U3 leaves open (conjunct 4), I reduced its hypothesis to the object a composed flow actually produces:
- **Carry:** r30 C1-LA2 (`lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`, `formally_verified`), entries 30–34
  (`card_sigma_fiber_filter`, `exists_saturatingFlow_of_weightedHall`, `transportRel_mem_indepFamily`,
  `weightedHall_of_saturatingFlow`, `weightedHall_iff_exists_saturatingFlow`), byte-identical from `Snippets/`.
  - Each is digest-checked against `FORMALIZATION-STATE.json` and found verbatim in the receipt-bound origin `Main.lean`.
  - The kernel rechecks them against the r31 definitions of record.
- **CA-1** `critU3T_cb8_conjunct4_iff_weightedHall_leafSet`: on the class, conjunct 4 ⇔
  `WeightedHall (cbGraph m) (leafSet (cbGraph m)) p*`. This combines C2-LA3's terminal with the carried Hall⇔flow lemma.
- **CA-2** `critU3T_weightedHall_of_ratFlow` (generic: any finite simple graph, any `F`, any `p`) and
  `critU3T_cb8_topRank_of_ratFlow_leafSet`. The §2 four-conjunct body follows from **any `ℚ`-valued `g` on `cbGraph m` at `p*`** with:
  - `0 ≤ g` on `I_{p*+1} × I_{p*}`;
  - `0 < g B A → transportRel B A`;
  - `w_leafSet(B) ≤ Σ_A g B A` (Out, with no scaling needed);
  - `Σ_B g B A ≤ w_leafSet(A)` (In).

  No selector, integrality or exact saturation is required. This is exactly the object "E1 flow + scaled sector certificate"
  produces, so conjunct 4 is now reduced in Lean to a checkable rational-flow statement.
- **CA-3** `critU3T_flow_eq_zero_of_activeWeight_eq_zero`: in any saturating flow, a weight-zero target receives 0 from every source.
  Combined with U3's zero-weight lemma, this discharges the "weight-zero targets receive nothing" class of the §2 composition.

These advances do not construct the flow. `COND4_formal` for the return stays `not_advanced`: CA-1 and CA-2 move only the interface.

## Verdict

verdict: retained_narrowed
headline_resolved: no

COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: advanced
cut_candidate: none

Narrowed to:
- (i) the merged project, in which six governed awards and 606 declarations compile together, byte-identically carried and keyed to
  receipts, which I reproduced;
- (ii) the new zero-weight classification lemma `cb8_activeWeight_leafSet_zero_iff`, which is correct, kernel-checked and new.

Struck as a contribution:
- the terminal-integration theorem, a kernel-confirmed alias of carried C2-LA1 entry 580 `AdjU.cb8_topRank_of_flow`;
- proposed key 1, an alias;
- the "reduced to the E1 hypothesis alone" claim.

The terminal name `cb8_topRank_eligible_and_weightedHall` must not be frozen for a conditional statement. Proposed key 2 (zero-weight)
may proceed to registration after an isolated second read.

## Remaining obligation

- **Exactly one Lean term is still needed on the class:**
  `∀ m, 107 ≤ m → m % 3 = 2 → WeightedHall (cbGraph m) (C5LA1.leafSet (cbGraph m)) ((16*m+4)/3)`.
  - By CA-1 this is equivalent to conjunct 4.
  - By CA-2 it suffices to give a `ℚ`-function `g` on `Finset (Fin (17m+3))²` with the four clauses `hnn`, `hsupp`, `hout`, `hin`
    at `p* = (16m+4)/3`.
- Then `AdjU.cb8_topRank_of_flow` (or `critU3T_cb8_topRank_of_ratFlow_leafSet`) yields the §2 body. This must go under the reserved
  name and without `hH`, in a project where no conditional declaration occupies that name.
- The flow itself (the E1 deletion flow over `cbGraph m`, the literal sector flow `g_sec` with its Out/In bridges, and the load
  composition) remains open and is not advanced by U3 or by this critique.
- Registration of U3's zero-weight key needs an isolated second read.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U3-T/`:

| Artifact | Contents |
|---|---|
| `u3copy/` | Copy-out of U3's inventoried scratch: scripts, logs, `merged_blocks.json`, project shell, `Main.lean` (`88ccaaa4…6a25`) |
| `replay/` | Redirected replay of U3's generator; `Main.lean` byte-identical `88ccaaa4…6a25` |
| `carry_check.py` (`66ce57cce7217db4c8b2145336a3443f798626d74d691c9bebfe729ca8e4005b`) → `carry_check.out` (`e37a711f5c4e63d1b155b5e22977f733c05506259e921815d57a930b562390b0`) | Independent carry and receipt check |
| `collision_check.py` (`df380cbcc1ebced1029409094b4cc6c3ee38dffb570988c74fcca3b5d8c9c793`) → `collision_check.out` (`00ef8883d71a3025d2e58013490715d22f84dbc3eaa4e44ef38af6c227de1284`) | Collision check |
| `zero_weight_check.py` (`0aa672c0b6c8405aa636ccd40f1ff25431b2cae98caacb747756ed9d809920fa`) → `zero_weight_check.out` (`f1be73045d5fb2a4e5423a2d9800075e7cac090b20290048169804f94e395d3e`) | Semantic check of the zero-weight lemma |
| `LeanProject/` | Rebuild; `.lake/packages` symlinked to the shared pinned project, never copied, no `lake update` or `lake clean` |
| `LeanProject/LeanProof/CriticU3T.lean` (`c9783d27e57f93ecc9d7e220a2bf5ec8edea9b691bca97dde99550b5732a03d3`) | Carries plus CA-1..3 and the `rfl` alias test; source tail `critic_tail.lean` (`835b17ee78ed22da97ceda85b1e186b25dd6a300574fbd75c2a2bab3a90f0090`) |
| `LeanProject/LeanProof/CheckAxioms.lean` (`7fdb8c214d38fc0a5e21acfc6b2498b39dc4a71fe58fc3017f62413b324d6ec4`) | Axiom and `#check` probe |
| `build.log` (`8e0c8162110e189f688271547bd63f1c586949d8365ca8de70abb5379c73a746`) | Main build, PID 1340 |
| `critic.log` (`28d3b9e880a77975493dc7e359144c0295a4f694cfe0af4f928c22307bc5c320`) | Critic file, PID 10681: `exit 0`, no messages |
| `axioms.log` (`8acea5e5599234ea993302ffe8c442b3e61c07792133800a8e05a3612ee5b588`) | Axioms and `#check`, PID 10887 |

**Process.** All three jobs ran to completion and were confirmed gone with `kill -0` before this write. Nothing was killed. There was
no network access and no package install.

**Read-boundary disclosures:**
1. I read `control/C3-CRITIC-ATTACK-BRIEFS.md` with a single `cat`, which displayed every seat's section and not only U3's. Only the
   U3 section was used. The U1 section's pointer "Compare with U3's terminal" is answered above without reading U1's return.
2. I ran searches rooted inside `sources/`, which is within my grant:
   - `grep -r` for activeWeight and zero-weight lemmas (`--include='*.lean'`/`'*.fragment'`);
   - `grep -rln` for `exists_saturatingFlow_of_weightedHall` and `critic_sector_activeWeight_eq_one`. The filename hits included
     `sources/c2-results/.../ADJUDICATION(-U).md` and `sources/c2-stage7-sources/...` paths. I saw the names only; those files were
     not opened.
3. I ran non-recursive `ls` of `scratchpad/c3-U3/` and its `LeanProject/`, and of `sources/` and its run directories.
4. For the pin I ran `ls` of the shared Mathlib `.lake/packages` and `git rev-parse HEAD`.
5. `ps -p 1340` was a single-PID query, not a process listing.
6. I did not open `scratchpad/c3-U3-replay/` (not in my grant). No sibling return, critique, adjudication of Cycle 3, other
   experiment root or external source was read. Nothing outside my scratch and this file was written.
