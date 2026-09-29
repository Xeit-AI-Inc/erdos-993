# Critique

Critic `C-F1-U` (cross-orientation U, formal/structural) of seat F1, route `C3-F-01`, mechanism token
`FORMAL-STATEMENT-FIDELITY-ADVERSARY`, Cycle 3 Stage 4, r31 (run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`).
Written 2026-09-28.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. My first combined `cat` of both files stopped after `verity.md`
because zsh rejected an `echo ======` separator, so I re-read the startup protocol in a second call. The tool display cut about
5 KB from the middle of `verity.md`, and I re-read that section (same file) with `sed`. I read no other VerityOS file. The harness
injected the project `CLAUDE.md` and the user auto-memory index into context. I did not open them, and I did not rely on them for
anything below.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch file.** SHA-256 of `control/dispatch/c3-stage4/DISPATCH-C-F1-U.md` =
  `436e5ca6c9b709d422132ba208348cfa2ea03cb2558184328cc6bd43eb1334c3`. It matches the value in my instructions.
- **Capsule seal (reported as required):** `control/c3-critic-capsules/F1-PACKET-MANIFEST.json`, recomputed over the canonical JSON
  without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline) =
  **`f4e0fa0b03551640fd1737dd5c4599efcbf260c5d833ef227597e43821e16889`**. MATCH. All 14 listed members match on both byte count
  and SHA-256.
- **Stage 4 dispatch seal:** `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`. MATCH.
- **Stage 3 seal:** `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`. MATCH.
- **Stage 2 seal:** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`. MATCH. This is the value the return cites.
  I also got the same result by replaying F1's `verify_seal.py` copy-out-first.
- **The return's own digests:**
  - The six `Main.lean` SHA-256s in the return's table all MATCH `sources/c1-results/SOURCE-DIGESTS.json` and
    `sources/c2-results/SOURCE-DIGESTS.json`, and each file is a Stage 2 packet member with a matching digest.
  - I widened the check to every file in the six award directories: 127 + 230 + 91 + 1177 + 112 + 256 = 1993 files, with 0
    mismatches and 0 files missing from the index.
  - The script digests the return cites (`verify_seal.py` 28b004c1…, `verify_source_digests2.py` 216f7f0c…, `carry_check.py`
    47c97c5f…, and `extract_statements.py`/`extract_decl.py` with prefixes b9351c2e/6a3015f7) all match the copies in the
    inventoried `scratchpad/c3-F1/`.
  - The return cites its output `carry_check.out.txt` (`323e5ae0…52b3`) and its replay copies under `scratchpad/c3-F1-replay/`.
    That directory is outside my grant and I did not read it. My copy-out replay of `carry_check.py` reproduces an output with
    exactly that digest, `323e5ae0137bea47a075cf032ad4d5a8561e21779f28bb3c225da543422252b3`, so the literal is backed by a
    deterministic replay.
  - `scratchpad/c3-F1/verify_source_digests.py` (3decf811…) is inventoried but not cited. It is a superseded first version and
    does no harm.
- **Identity.** The route ID and mechanism token appear verbatim in the return. The return registers no new claim. The six awards
  it touches keep their run-local labels (R31-C1-LA1 … R31-C2-LA3). The one-line `headline_resolved: no` is present.

## Independent re-derivation

I built my own instruments from the contracts and the frozen sources. They are standard library only, with exact integers and
`Fraction`, under `scratchpad/c3-crit-F1-U/instr/`. They do not reuse F1's scripts.

1. **Fragment and receipt instrument (`audit_frag.py`).**
   - It parses every `-- VERITYOS ENTRY n BEGIN kind name hash` … `END` block in the six files, requiring matching indices. That
     gives 799 entry occurrences, 606 distinct names, 129 names shared by two or more files, 126 of them identical in both body
     and marker hash, and 3 that differ. F1's counts are reproduced exactly.
   - F1 never checked what the marker hash is. I did: in all 799/799 occurrences the marker hash equals `sha256(body + "\n")`,
     equals the SHA-256 of the corresponding `Snippets/NNNN-*.lean.fragment` file (whose content matches the body), and equals
     the entry's `source_sha256` in that award's `RECEIPTS/formalization.json`.
2. **Carry provenance instrument (`audit_carry.py`, `audit_r30.py`).**
   - Each entry is classified by where its hash first occurs: in a prior governed run's `Snippets/` (r30 `lean/*`,
     first-interior), in an earlier r31 award, or nowhere earlier (new):
     - C1-LA1: 33 new.
     - C1-LA2: 24 carried from r30, 54 new.
     - C1-LA3: 21 new.
     - C2-LA1: 24 from r30, 73 from earlier awards, 452 new (including the 2 rekeys).
     - C2-LA2: 17 from C1-LA3, 11 new.
     - C2-LA3: 8 from r30, 68 from earlier awards, 14 new (including the 1 rekey).
   - The carried total is therefore **214 byte-identical carry occurrences plus 3 rekeyed carries**. This matches the sealed
     independent-review notes: C2-LA1 has "97 … byte-identical" plus entries 57 and 105, and C2-LA3 has "76 byte-identical plus
     entry 60".
   - Every r30-origin carry is hash-identical to a fragment of r30 C1-LA2, C5-LA1 or C6-LA2. Each of those three origin runs has
     a kernel receipt with verdict `verified` and `source_sha256_after` equal to its `Main.lean`, and every one of their Snippets
     (35, 183 and 173 files) matches `sources/SOURCE-DIGESTS.json`.
3. **Statement instrument (in `audit_carry.py`).** For each of the six awards:
   - `sha256(expected_statement)` in `THEOREM-CONTRACT.yaml` equals the declared `expected_statement_sha256`.
   - `expected_statement` occurs verbatim exactly once in `Main.lean`, inside the last entry (kind `theorem`), and is followed
     immediately by `:=`.
   - The kernel receipt's `theorem_name` equals the contract's `declaration_name`, and its `source_sha256_after` equals the
     `Main.lean` digest.
   - The SHA-256 of `EVIDENCE/axioms.txt` equals the receipt's value, and the terminal depends on `[propext, Classical.choice,
     Quot.sound]` only.
   - The all-declaration axiom logs show no other axiom. For C2-LA1, 549/549 declarations use only the three standard axioms or
     none.
   - Outside docstrings there are no `sorry`, `admit` or `native_decide` tokens. The only two hits, C2-LA1 lines 2298 and 2347,
     are the word "sorry-free" inside comments.
   - **F1 did not perform this check.** The attack brief asks whether it did. It is now done, and every item is clean.
4. **Contract terminal shape.** After normalizing whitespace, the conclusion of C1-LA2's `cb8_topRank_of_descent_and_flow` equals
   the SOLUTION-CONTRACT §2 conclusion of `cb8_topRank_eligible_and_weightedHall`. The binders `(m : ℕ) (hm : 107 ≤ m)
   (hres : m % 3 = 2)` are the same. This confirms F1's claim.
5. **Literal-object instrument (`literal_cb.py`).** This checks the fidelity of `cbGraph`, which F1 did not examine.
   - I transcribed the Lean `cbEdge` of record directly: labels 0 = r, 1 = s, 2 = v, `u_i = 3+17i`, `b_ij = u_i+1+2j`,
     `c_ij = u_i+2+2j`. From it I built the graph and computed independence polynomials exactly by tree dynamic programming.
   - At m = 2, 5, 8, 11 and at the class rows 107, 110, 113, 116, 119, 122 (controls) and 125, 128, 140 (fresh, per ruling 17),
     all of the following hold:
     - the graph is a tree on `17m+3` vertices;
     - `α = 9m+1`;
     - the leaf set has `8m+1` elements and contains `v`;
     - `I(T)` equals the contract closed form `(1+2x)G^m + x(1+x)(1+2x)^{8m}`, with the contract's
       `G = (1+2x)^8 + x(1+x)^8` (ruling 18);
     - `I(T−v)` and `I(T−c)` equal the C2-LA2 closed forms. I checked every leaf literally for m ≤ 8, and the leaves v,
       `c_{0,0}` and `c_{m−1,7}` at the class rows.
   - At every class row:
     - `x` is scanned through `α` and equals `p* − 2`, so conjunct 2 holds with equality (tight);
     - `3p* < 2α+1`;
     - the parent descent `i_{p*−1} < i_{p*−2}` holds;
     - the forward favorability `i_{p*+1}(T−w) < i_{p*}(T−w)` holds (ruling 16).
   - Fixed point `CB(8,107)`: n = 1822, α = 964, x = 570. This reproduces the contract's §5 values.
6. **Template and block instrument (`template_block.py`).** It instantiates the C1-LA1 and C1-LA3 terminal statements literally.
   - C1-LA1 at m = 107, 110, 113, 125, 128 and 140 (exact min-plus/max-plus dynamic programming over all splittings of `K` and
     `K−1` among the m chokes):
     - nonnegativity holds;
     - `min Σ Out = 1` **exactly** and `max Σ In = 1` **exactly**, so both constraints are tight;
     - Switch and Residual hold;
     - `(1−ρ_1)/θ` = 34.90 at m = 107, which reproduces the fixed point.
   - C1-LA3: the block descent at index `p*−2−j` holds for every `j ∈ [5, m]` at those rows.

These are bounded confirmations of statements that are already formally verified. They are census data, not proof, and they change
no grade.

## Attacks and findings

- **A1: the meaning of "126 exact byte-identical carries" (narrowed).**
  - 126 counts distinct *names* shared by two or more of the six files whose occurrences agree. It is not a count of carries.
    Names propagate through chains: for example, `C4LA1.vertexDeletionIndepSetCount` appears in five awards and counts once.
  - The true carry count is 214 byte-identical occurrences plus 3 rekeys.
  - F1's `carry_check.py` compares occurrences only *across the six files*. It never recomputes the marker hash from the body, and
    it never compares anything with an origin fragment or an origin kernel receipt. So "the claimed content hash agrees" is backed
    only as cross-file agreement.
  - I closed both gaps (Independent re-derivation 1–2). Every one of the 799 occurrences is bound to its own receipt, and every
    carry is bound to an origin fragment whose kernel receipt reads `verified`.
  - Conclusion: F1's "no unsanctioned break" is correct, but its evidence was weaker than the wording implied.
- **A2: rekey reversibility (confirmed and strengthened).** For all three rekeys, a character diff of origin against consumer shows
  exactly one edit, `theorem` → `lemma`. Reversing it reproduces the origin marker hash byte-for-byte:
  - C1-LA3 entry 21 (`1afd4f7d…`) → C2-LA1 entry 57;
  - C1-LA2 entry 78 (`df7623e2…`) → C2-LA1 entry 105;
  - C2-LA2 entry 28 (`93acf3cc…`) → C2-LA3 entry 60.

  In each case the marker's kind field changes from `theorem` to `lemma` along with the body. That edit is sanctioned by ruling 19
  and R31-N-15.
- **A3: F1's Remaining obligation 2, the "R31-N-15 record not located", is closed (critic-derived).** The records exist in sealed,
  authorized sources:
  - `sources/c2-results/runs/…c2-la1…/FIDELITY-REVIEW.md` line 27: entries 57 and 105; reverse substitution reproduces the origin
    bytes, with no other difference.
  - `sources/c2-results/runs/…c2-la3…/FIDELITY-REVIEW.md` line 27 and `FORMALIZER-REPORT.md` line 83: entry 60, length −2,
    reversal reproduces `93acf3cc…8fc9`.
  - The ruling itself is at `sources/c2-results/cycles/cycle-2/stage7/LEAN-GATE-CLOSEOUT.md` line 26.

  F1's return listed `sources/…` as within its grant (its disclosure item 4), so these records were within its reach. The claim
  that they were outside its read scope is struck.
- **A4: expected_statement equality with the Lean source (the attack brief's question).** F1 compared terminals against *contract
  prose*, not against each award's frozen `expected_statement`. I performed that check (re-derivation 3), and it is clean for all
  six awards.
- **A5: index of record in C2-LA2 and C2-LA3 (confirmed, with a caution about instruments).**
  - C2-LA2 compares `coeff((16m+4)/3 + 1) < coeff((16m+4)/3)`, which is the forward direction at `p*`.
  - C2-LA3 goes through `IsFavorableAt` → `vertexDeletionForwardDifference` = `i_{p+1} − i_p`. Those carried definitions are
    hash-identical to r30's.
  - Both follow ruling 16.
  - **New finding.** At every class row I tested (107 through 140), the off-by-one inequality `i_{p*}(T−w) < i_{p*−1}(T−w)` *also*
    holds. A numerical test at class rows therefore cannot detect the ruling-16 error; only a textual check of the index can.
    (At m = 2, 5 and 8 the two indices do differ.) F1's textual method is the right instrument here, and a future computational
    audit should not replace it.
- **A6: unused hypotheses, a finding F1 missed.**
  - The kernel axiom logs record that the C2-LA2 terminal's `hm : 107 ≤ m` is unused. Its docstring and contract say the same
    ("unused … fence 1"). My instrument agrees: both closed-form descents hold at m = 2, 5, 8 and 11.
  - The same `hm` is unused in the carried copy inside C2-LA3.
  - C2-LA1's helper `cb8_term_eq` has an unused `hj`.
  - None of this breaks fidelity: an unused scoping hypothesis only restricts the statement to the class. But it is inaccurate to
    list "the presence of `107 ≤ m`" as load-bearing in every award.
- **A7: F1's description of the C1-LA1 hypothesis entry point (struck as unbacked).** "`hm` enters only through the arithmetic
  identities used by `omega`/exact-rational bounds inside the closed proof" is not supported by anything F1 shipped: F1 read
  statements, not proofs. What is supported: C1-LA1's axiom log shows no unused-variable warning, so `hm` is referenced somewhere.
- **A8: F1's description of `hj` in C1-LA3 (narrowed).**
  - F1 says `hj, hjm bound the ℕ-subtractions`. That is true of `hjm` (`m − j`).
  - `hj : 5 ≤ j` is not a truncation guard. By the contract's own wording it supplies the gap `2j − 8 ≥ 2`.
  - My instrument shows it is mathematically load-bearing. The block descent *fails* at `j = 0, 1, 2` at every tested row and
    holds at `j = 3, 4`. This is why the parent descent in C2-LA1 needs the separate degree-50 `S_5` certificate for small `j`.
  - F1's inequality `p*−2−j ≥ (13m−2)/3 > 0` for `j ≤ m` is correct.
- **A9: literal semantic fidelity of the network definitions (added).**
  - `activeWeight` counts `v ∈ F ∩ B` such that `B.erase v` meets `N(s_v) ∖ {v}`. That is exactly the active-tag weight.
  - `transportRel` is (D) `A = B.erase q` with `q ∈ B`, or (S) `u ∉ B`, `|N(u) ∩ B| = 2`, `A = insert u (B ∖ N(u))`. That is
    exactly (D) ∪ (S).
  - `IsSaturatingFlow` requires support on literal arcs, row sums equal to the weight (saturating), and column sums at most the
    weight.
  - `favorableLeaves` is `leafSet.filter IsFavorableAt`, so the selector is derived rather than assumed.
  - `crossingIndex` is `Nat.find` of the first `Δ_k < 0`, and its existence is proved at `k = α`.
  - All of these are carried hash-identical from r30 C5-LA1 and C1-LA2.
- **A10: scope.** F1 honestly disclosed that it did not audit the Cycle 3 T/U statements. I am under the same read ban and cannot
  either, so this item carries forward.
- **No fidelity break and no cut.** No ℕ-truncation, no retyped `G`/`G_c`, no off-rank selector, and no hypothesis that encodes its
  conclusion was found in any of the six terminals. C1-LA2's `hE` and `hH` are conjuncts 2 and 4 verbatim, stated openly as a
  reduction. That makes C1-LA2 "terminal ⇐ conjuncts 2 ∧ 4", which is correct and disclosed.

## Mechanism-equivalence and fence check

- The route claims no mechanism, so no refuted mechanism is revived. Nothing uses (G′) from ruling 20, forest real-rootedness, or
  Newton/Darroch.
- There is one rank per tree and the class only. The small-m evaluations in my instrument are fidelity probes of closed-form
  identities, not claims.
- No status transfers to an aggregate. Census values (my class-row checks) are reported as bounded confirmation only.
- The `θ*` law is never used as a hypothesis. The r30 bounded record is not cited as proof.
- Attribution is intact. The carried definitions keep their r30 attribution comments byte-for-byte.

## Certification audit

- "Stage 2 seal MATCH" is **backed** (replayed).
- "Six Main.lean digests MATCH" is **backed**, and I extended it to 1993 files.
- "606 / 129 / 126 / 3" is **backed** as counts. "126 exact byte-identical carries" is **narrowed** to "126 shared names whose
  occurrences agree". The carries are 214 identical plus 3 rekeys, each verified against its origin.
- "claimed content hash agrees" is **narrowed** to cross-file agreement only. The marker equals the body hash, and I established
  that independently.
- The three rekeys "character-for-character identical apart from the keyword" are **backed**.
- "C1-LA2 conclusion byte-identical (mod whitespace) to SOLUTION-CONTRACT §2" is **backed**.
- "C2-LA2 closed forms match term for term, `G`/`G_c` not swapped" is **backed**, textually and by my exact polynomial identity at
  13 values of m.
- The C1-LA1 "`hm` enters only through arithmetic identities …" is **struck** (unbacked).
- "`hj`, `hjm` bound the ℕ-subtractions" is **narrowed**: `hj` is a gap hypothesis and is load-bearing.
- "R31-N-15 record not locatable in this seat's scope" is **struck**: the record is in authorized `sources/`.
- The `formally_verified` grades of the six awards are unchanged, and the route asserts none of its own. The kernel receipts'
  `verified` verdicts and axiom lists are backed by the receipts and logs I read.
- The route verdict `bounded_evidence` is appropriate.

## Verdict

verdict: retained_narrowed
headline_resolved: no

F1's zero-violation fidelity audit of the six frozen Cycle 1/2 awards stands, and I independently confirmed it with a stronger
instrument:

- origin-bound carries;
- `expected_statement` equality;
- kernel receipts and axiom logs;
- a literal transcription of `cbGraph` checked against the contract objects at the control and fresh rows.

The narrowings are A1, A3, A6, A7 and A8.

The critic-derived advances are:

- the R31-N-15 reversibility records, located and re-verified;
- the check of all six `expected_statement`s against their Lean sources;
- the finding that the ruling-16 off-by-one cannot be caught numerically at class rows;
- `hj : 5 ≤ j` shown load-bearing, since blocks `j = 0, 1, 2` fail the descent.

No mathematics claim is made, and none is needed for a fidelity route.

COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

## Remaining obligation

1. The Cycle 3 T1–T3 and U1–U3 Lean statements still need the same fidelity audit before Stage 7 freezes any of them. The audit
   should check:
   - `expected_statement` verbatim in the source, with its SHA;
   - the marker hash equals `sha256(body + "\n")`, equals the Snippet, and equals the receipt entry;
   - every carry is bound to an origin fragment with a `verified` kernel receipt;
   - rekeys are limited to `theorem` → `lemma` and are reversible;
   - no hypothesis is conjunct 4 itself or `ΣIn < 1` / favorability smuggled in;
   - any new `g_sec`/E1 arc function is read against SEMANTIC-CONTRACT §2's choke-state and switch language.

   Scripts for this: `scratchpad/c3-crit-F1-U/instr/audit_frag.py` and `audit_carry.py`, with the award list changed.
2. Any computational audit of favorability must pair its numbers with a *textual* check of the index. At class rows the `p*−1`
   inequality also holds, so numbers cannot catch the off-by-one.

Nothing else is left open by this route.

## Artifact inventory

Everything is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F1-U/`.

- `replay/` holds copy-outs of F1's six scripts, with the same digests as in `scratchpad/c3-F1/`, and my replay outputs:
  - `verify_seal.out.txt` `4330bfa0…241c`
  - `verify_source_digests2.out.txt` `cd99ce59…294c`
  - `carry_check.out.txt` `323e5ae0137bea47a075cf032ad4d5a8561e21779f28bb3c225da543422252b3`, equal to the return's cited digest
- `instr/` holds my instruments and their outputs:

| File | SHA-256 |
|---|---|
| `instr/audit_frag.py` | `00cd2db6c172843462b2f968482ef1717b7f0ab7b32bca43a10763265d7c01d7` |
| `instr/audit_frag.out.txt` | `cb897a327bdd1242d3cc5ffe8054d4f21bfb8f09efb1c4a3a6d0def60ccf4d87` |
| `instr/audit_carry.py` | `57b2d0fcd738d7bc1cea87975cd035faae8e02895d3d4c111e5e9f8fd13a0383` |
| `instr/audit_carry.out.txt` | `a7da563ad3d0c6585a26ae88a3734ec01971a5f106030fb373aa9a9dcab0aa6d` |
| `instr/audit_r30.py` | `3240690f3287c64f813743c94b933c4be93e93fb4e9d2040f6ff9e4c4c13712b` |
| `instr/audit_r30.out.txt` | `aa61e9e1203ff6cf1db6ed7ab961ac020c2d0cce5481d1ea4ae9f55536bcdcc9` |
| `instr/entries.json` | `49daf4b3b3797f98f7010137fdd871e9e482a476288ce2972d6434da8c7f0f3d` |
| `instr/literal_cb.py` | `e5374e6f2ae8412fa5fda4fda881854352faf88fce9a2cd5b99d79b94bbdcb53` |
| `instr/literal_cb.out.txt` | `6a84a8d17fea42c344f3df6001f175b694965db489710c6d677ba7127f8214a9` |
| `instr/template_block.py` | `7b169abc26a4665f0d241dd147a9a2fa670d78fc695ddc774e2a703c754a86f2` |
| `instr/template_block.out.txt` | `dcb11f1b93fb39f68914db365cce30267ac6465e0c66a3b32d027bbb8e440898` |

**Replay.** From `instr/`, run `python3 -B audit_frag.py`, then `python3 -B audit_carry.py`, then `python3 -B audit_r30.py`, then
`python3 -B literal_cb.py 2 5 8 11 107 110 113 116 119 122 125 128 140` (about 50 s), then
`python3 -B template_block.py 107 110 113 125 128 140`.

**Read-boundary disclosures.**
- I read the capsule members; files under `sources/` (authorized Stage 2 members), including the award directories' contracts,
  receipts, EVIDENCE axiom logs, FIDELITY-REVIEW and FORMALIZER-REPORT files, the r30 `lean/*` receipts and Snippets, and the c2
  `LEAN-GATE-CLOSEOUT.md`; and `scratchpad/c3-F1/`.
- I ran one `grep -rln` rooted at `sources/c2-results` and `sources/c1-results`, within the grant. The Python `os.walk` calls were
  rooted inside `sources/` or at the six award directories.
- I ran non-recursive `ls` on `sources/` and its subdirectories and on `scratchpad/c3-F1/`.
- I ran `mkdir -p` for my own deliverable directory under `cycles/cycle-3/stage4/critics/F1/U/`, followed by a single `ls` of that
  new empty directory.
- I read no sibling return or critique, no adjudication, no other experiment root, no `scratchpad/c3-F1-replay/`, and nothing from
  the network. I installed nothing.
- I started no background job. Every run was in the foreground and finished before this write, so there was nothing to kill.
