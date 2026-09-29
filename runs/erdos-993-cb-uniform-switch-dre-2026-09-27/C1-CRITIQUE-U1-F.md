# Critique

Critic `C-U1-F` (orientation F, falsify) of seat `U1`, route `C1-U-01`, mechanism `LEAN-CB-DEFINITION-LAYER`, r31 Cycle 1 Stage 4.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I made no other VerityOS read. The read-boundary items are listed under
"Disclosures" in `## Artifact inventory`.

Model disclosure: see `## Verdict`.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-U1-F.md`: SHA-256 `2c8d7e91e39a10f07435391ebedbb5f89a23cc8ed7b255081aa2a3a4757d44cc`. Recomputed, and it matches.
- Capsule `control/c1-critic-capsules/U1-PACKET-MANIFEST.json`: the recomputed inner seal (canonical JSON without `seal_sha256`, sort_keys, `(",",":")`, no
  trailing newline) is `4a9b8d7bc5e561f77349573822d2c097a16dfbd261e9d2ffe287dda3cd0d05e4`, which matches. All 14 listed files match in byte count and SHA-256.
- Stage 2 seal: recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`, which matches. Stage 3 seal: recomputed
  `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`, which matches. Stage 4 dispatch seal: recomputed
  `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`, which matches.
- Return `cycles/cycle-1/stage3/returns/U1/RETURN.md`: `bed1e714…446b0d`. This matches both the capsule and the Stage 3 manifest.
- Every digest the return lists was checked. `DISPATCH-U1.md` `148ea72f…a270f` matches the Stage 3 manifest. `AUTHORIZATION.md`,
  `R31-CHARTER-PROMPT.md`, `OBLIGATIONS.csv` and `CLAIM-IDENTITY.run-local.json` match their Stage 2 manifest records. I compared literals
  only and did not open those files. `PIN.json`, the three seed project files and the C6-LA2 `Main.lean` template match `sources/SOURCE-DIGESTS.json`,
  and each file on disk matches its record. All six entry digests the return cites (`65acd314…`, `8e1e1a68…`, `78ec6551…`, `16687f86…`,
  `113d9521…`, `772a13c0…`) equal the SHA-256 of the corresponding r30 C6-LA2 `Snippets/` fragment and the `VERITYOS ENTRY` header digest.
  Entries 4, 5, 6 and 15 are byte-identical across C1-LA1 and C6-LA2. The shipped artifacts reproduce their digests:
  `Main.lean` `c6d2279c…f5e7` (837 lines) and `cb_indepnum_check.py` `b68699d2…d4d9`.
- Route ID `C1-U-01` and token `LEAN-CB-DEFINITION-LAYER` appear verbatim. The return's two-part model disclosure (sonnet/high;
  `claude-sonnet-5`) agrees with the allocation.

## Independent re-derivation

**Instrument 1: my own Python, stdlib only (`crit_cb_check.py`).** It builds CB(8,m) from the prose of `SEMANTIC-CONTRACT.md` §2 on abstract
vertex names (r, s, v, u_i, b_ij, c_ij). Separately, it transliterates U1's Lean `cbEdge` from the literal text of `Main.lean` lines 120–124 and evaluates it
over every ordered label pair. For m ≤ 3 it cross-checks a direct evaluation of the quantifiers against the closed-form evaluation. It then asks
whether U1's label map is a bijection onto `Fin (17m+3)` that carries the abstract CB edge set exactly onto the `cbEdge` edge set, and it does.
At m ∈ {1, 2, 3, 5, 107, 110, 113}:

- n = 17m+3 and edges = 17m+2, with the graph connected, so it is a tree.
- α = 9m+1 by two methods: a rooted-tree DP, and n − ν with ν the maximum matching from greedy leaf matching, exact on trees. At m = 1 a third
  method, brute force over all 2^20 subsets, gives α = 10.
- The leaf set is {v} ∪ C with |leafSet| = 8m+1.
- W_v = {r}, and W_{c_ij} = {u_i} for all i, j.
- N(u_i) = {r} ∪ {b_ij}, deg u_i = 9, N(r) = {s} ∪ {u_i}, and deg r = m+1.

All checks pass (digest `adbd4b97…f541e`). The §5 fixed points are reproduced: CB(8,107) has n = 1822 and α = 964, CB(8,110) has n = 1873,
and CB(8,113) has n = 1924.

**Instrument 2: Lean, pinned v4.32.2 and Mathlib `905b9581…`.** I rebuilt copy-out-first in
`scratchpad/c1-crit-U1-F/lean-check/LeanProject`, binding the shared packages by manual symlink and running `cd` into the project before `lake env lean`.
- The shipped `Main.lean` builds with exit 0 and empty output (log SHA-256 is the empty-file hash).
- I built `AuditBase.lean` from `import Mathlib`, the byte-exact C6-LA2 fragments 1–21, 123 and 124, the byte-exact first-interior entry 14
  (`C5LA1.crossingIndex`), and U1's NEW section taken verbatim from lines 102–836. The first-interior fragments 1–6 and 10–13 are byte-equal to their
  C6-LA2 counterparts. All 24 fragments match `SOURCE-DIGESTS.json`. `Audit.lean` adds the critic checks and also compiles with exit 0.
  So the U1 layer composes with the full carried network layer, which the shipped file never tested.
- `#eval` of the literal adjacency gives 38 ordered adjacent pairs at m = 1 and 72 at m = 2, that is 2(17m+2).
- `#print axioms` on all six U1 theorems gives exactly `[propext, Classical.choice, Quot.sound]`. `cbGraph_decAdj` gives `[propext, Quot.sound]`.
- A scan of `Main.lean` finds no `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `set_option`, `unsafe`, `implemented_by` or `opaque`.

**Proof read against the contract.** `cbEdge`/`cbGraph := SimpleGraph.fromRel (cbEdge m)` and the `@[reducible, instance] cbGraph_decAdj`
have exactly the draft shapes of `SOLUTION-CONTRACT.md` §2.

- **Tree.** `IsTree` holds for every m:ℕ by child–parent bijection. `cbParentVal_lt` makes the map injective, the range equals the edge set by
  case analysis on the four edge shapes, and the non-root card count gives |E| = |V| − 1.
- **α ≥ 9m+1.** The explicit witness {s} ∪ {u_i} ∪ C has its cardinality computed via image/injOn with no enumeration over m.
- **α ≤ 9m+1.** The three parts are the star {r} ∪ {u_i} (≤ m, split on r ∈ S, using `hm` only for 1 ≤ m), {s,v} (≤ 1), and the
  choke blocks (≤ 8m, via an injection into `range m × range 8` whose collision case is killed by the edge b_ij–c_ij). The cover is proved by
  `cb_val_cases`. No step enumerates m, and the argument is uniform.
- **Leaves and witnesses.** The leaf and witness lemmas go through the carried `mem_tagWitnesses_iff_of_adj`.
- **Necessity of `hm`.** The hypothesis `0 < m` is needed for α and the leaves: at m = 0 the tree is r–s–v, where α = 2 ≠ 1 and r is a leaf.

The mathematics claimed is correct.

## Attacks and findings

1. **FINDING (carry-literal failure, 3 of 6 entries).** The return says every carried entry is "byte-identical". Byte comparison against
   `sources/r30/lean/…c6-la2…/Snippets/` (`carry_compare.py`) shows:
   - Entries 4 (`IsGraphLeaf`), 5 (`support`) and 6 (`leafSet`) are exact.
   - Entries 15 (`tagWitnesses`), 123 (`support_eq_of_isGraphLeaf_of_adj`) and 124 (`mem_tagWitnesses_iff_of_adj`) are NOT byte-identical. Their
     `--` comment lines were stripped:
     - entry 15 lost six provenance lines ("Author: r30 U2 (Claude Sonnet 5)", freeze-repair note);
     - entry 123 lost two lines ("authored in-run by the C6-LA2 formalizer (Claude Opus 5.5)");
     - entry 124 lost one line.

   The declaration text is identical once the comment lines are removed, so the elaborated terms are unaffected. My `AuditBase.lean`
   compiles U1's NEW section against the verbatim fragments. But the shipped blocks do not hash to the digests the return prints beside
   them. The stripped lines are attribution, which Fence 9 says travels on every face. Repair: re-carry those three fragments verbatim.
2. **FINDING (axioms literal unbacked by shipped evidence).** The only axiom-audit output the seat shipped, `scratchpad/c1-U1/leanout_axioms.txt`,
   contains five `Unknown constant` errors, because the names were not namespace-qualified. No successful axioms output is inventoried.
   The return's sentence "all six depend on exactly `[propext, Classical.choice, Quot.sound]`" is therefore struck as a U1 literal. It is
   reinstated on critic authority by my rerun (Instrument 2). The return also says "the five substantive results" and then lists and
   counts six, an internal inconsistency.
3. **Grade misattribution (struck).** "Grades" cites `α(CB(d,m)) = m(d+1)+1` "at its `proved_informal`-modulo-Darroch/Newton grade" and says the
   cited closed form's derivation used Darroch/Newton. `SEMANTIC-CONTRACT.md` §3 grades the closed forms `proved_informal` (a node). The
   Darroch/Newton qualifier belongs to the favorability and E1-threshold keys, not to α, and the return shows no source for the attribution.
   The consequence is harmless, since U1 adds no Darroch dependency, but the qualifier is struck.
4. **Minor overstatements.** (a) The Python "checks connectivity and acyclicity in code". In fact it checks connectivity and |E| = n − 1, which
   is equivalent for a finite graph, but there is no direct acyclicity test. (b) The Python builds its adjacency from its own restatement of the
   labelling, not from the Lean `cbEdge` text, so it cross-checks the prose, not the definition. My instrument closes that gap. (c) The return's
   Python replay reproduces its result digest `b1e4a7b2…d633` and `all_checks_pass: true` at m ∈ {1, 2, 3, 5, 10, 95, 107, 110, 113, 200}.
   Sampled, as the return itself says: not proof.
5. **Unused hypothesis.** `mem_cb_tagWitnesses_v_iff` carries `hm : 0 < m` without using it. The statement is weaker than it could be but not
   wrong. The return's claim that the r-degree step is "the ONLY place `m>0` enters" is literally false for that statement's signature.
6. **Remaining-obligation item 5 corrected.** The return says a naive cell bound overcounts by exactly 1 and that "the fix is the explicit case split on r".
   A simpler uniform fix exists (critic): α ≤ n − |M| for any matching M. The matching {s–v, r–u_0} ∪ {b_ij–c_ij} has |M| = 8m+2 (needs m ≥ 1),
   giving α ≤ 17m+3 − (8m+2) = 9m+1. The "exactly 1" is correct only for the partition {r}, {u_i} as singletons.
7. **Disclosure gap (for the controller).** The return's Disclosures say "`ps aux` was checked once at the end". That is a host-wide process
   listing, the same act recorded as an INCIDENT for U2. It is absent from U1's entry in `C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, which lists
   only the memory-index item. I did not read `DISPATCH-U1.md`, which is not a capsule member, so I cannot rule on whether it was forbidden for
   U1. I flag the omission from the transcribed record under the r30 rule ("every disclosure item, including process listings mentioned in passing").
8. **Attacks that found nothing.**
   - The labelling has no overlaps: c_{i,7} = base+16 < base+17.
   - `cbVertex` wraps modulo n only off the vertex range, and every use carries `n < 17m+3`.
   - The decidability instance agrees with the carried `[DecidableRel G.Adj]` instance arguments of `activeWeight`, `favorableLeaves` and
     `IsSaturatingFlow`. `open Classical in` there is local to the selector's filter and does not replace the instance. The terminal statement
     elaborates.
   - No hypothesis encodes a conclusion, and no finite enumeration stands in for a universal step.

## Mechanism-equivalence and fence check

- **Fence 1.** Nothing is claimed at any rank. The layer is rank-free, and `cb_lowWindow` holds for every m ≥ 1 with no residue hypothesis, which is
  correct, weaker than the class, and harmless. No status transfers to any aggregate.
- **Fences 3–7.** No Darroch/Newton appears, nor any refuted mechanism, census-as-proof, θ* hypothesis, or use of the r30 bounded record.
- **Claim identity.** No `E993-R31-` candidate is proposed. The layer proves `SEMANTIC-CONTRACT.md` §2 structural facts that are already part of
  the r30 CB record, so it is correctly not registered as new. `SOLUTION-CONTRACT.md` §2 lists "the CB tree/α/leaf-classification layer" as a
  fundable intermediate certificate, but not as progress on (L-S)_top or (ELIG-top)(a). The return says exactly this.
- **Cited keys.** All seven exist in `sources/authority/CLAIM-IDENTITY.json` as VERIFIED. Four are `proved_informal`: CBSTAR, criterion,
  threshold and favorability. Three are `computer_assisted`: the two FIVE-CB row keys and the CB-8-M-95-TO-107 row key. None is re-graded by the return.
- **Attribution.** The NEW layer is correctly attributed to the seat. The carried attribution comments are damaged (Finding 1).

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "Compiles sorry-free" | critic rebuild exit 0, empty log; token scan clean | backed |
| axioms "all six … [propext, Classical.choice, Quot.sound]" | seat's only shipped axioms log shows 5 errors | struck as seat literal; reinstated by critic rerun |
| carried entries "byte-identical" | 3/6 differ (comment lines stripped) | struck for entries 15, 123, 124; backed for 4, 5, 6 |
| `α = 9m+1` "both directions", "for every m ≥ 1" | read and rebuilt; uniform proof, no enumeration | backed (compiled scratch, no grade) |
| `IsTree` "for every m:ℕ" | read and rebuilt | backed |
| leaf classification, `W_v = {r}`, `W_{c_ij} = {u_i}` | read, rebuilt, independent instrument | backed |
| digests of `Main.lean`, `.py`, seed files, template, result digest | recomputed / replayed | backed |
| α closed form "modulo Darroch/Newton" | contract §3 says otherwise | struck |
| Python checks "acyclicity" | connectivity and edge count only | narrowed to "tree via connected ∧ |E| = n − 1" |
| "five substantive results … all six" | internal count mismatch | corrected to six |

Nothing in the return claims a grade. "Compiled scratch, no grade" is correct per `SOLUTION-CONTRACT.md` §4.

## Verdict

verdict: retained_narrowed

headline_resolved: no

The mathematics of the definition layer is complete and correct in scratch Lean. It covers the tree, α = 9m+1 in both directions, the leaf set, the
witness sets and the third terminal conjunct. The informal status is `proved_informal`, and it is `compiled` in scratch pending a governed award.
The narrowing is to certification literals only:
- the "byte-identical" carry is struck for entries 15, 123 and 124;
- the seat's axioms literal rests on critic replay, not on shipped evidence;
- the α Darroch/Newton grade attribution is struck.

The layer does not advance (L-S)_top or (ELIG-top)(a).

**Critic-derived advance (C-U1-F, scratch, no grade; `Audit.lean`, compiled, axioms `[propext, Classical.choice, Quot.sound]`).**
- `cbTerminal_of_conj2_conj4`: over the byte-exact carried definitions, the terminal `cbTerminalStatement` (the §2 shape verbatim)
  follows from conjunct 2 (crossing index) and conjunct 4 (saturating flow) alone, with conjuncts 1 and 3 discharged by U1's layer.
  This is the first check that U1's layer plugs into the literal terminal.
- `cb_leafSet_eq` / `cb_leafSet_card`: `leafSet(CB(8,m))` equals an explicit `Finset`, with card `8m+1`.
- `favorableLeaves_eq_leafSet_of_all` (graph-generic): if every original leaf is strictly favorable at p, then F_p = leafSet. This is the exact
  interface through which the favorability key must enter conjunct 4. It reduces U1's open item 2 to the per-leaf integer statement
  `IsFavorableAt (cbGraph m) τ p*` for τ = v and τ = c_ij.
- `mem_neighborFinset_choke_iff`, `mem_neighborFinset_root_iff`, `choke_degree` (deg u_i = 9): the neighbourhoods the switch relation
  `|N(u) ∩ B| = 2` of `transportRel` consumes, for U2's reduction.
- The matching proof of the α upper bound (Finding 6).

LS_top: not_advanced
ELIG_top: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

Exactly what is still owed:
1. **Re-carry entries 15, 123 and 124 verbatim** from C6-LA2 `Snippets/`, restoring their comment lines. The layer is already known to compile
   against them.
2. **Ship a successful `#print axioms` log.**
3. **Freeze the labelling** (0 = r, 1 = s, 2 = v, base(i) = 3+17i, u_i = base, b_ij = base+1+2j, c_ij = base+2+2j) at synthesis.
4. **Conjunct 2**, `C5LA1.crossingIndex (cbGraph m) + 2 ≤ p*`, which needs (ELIG-top)(a) and its composition. It is untouched.
5. **Conjunct 4.** First, for each leaf τ ∈ {v} ∪ {c_ij}, the integer statement `C4LA1.IsFavorableAt (cbGraph m) τ p*` for every m ≥ 107 with
   m ≡ 2 (mod 3). This is the favorability key, `proved_informal` modulo Darroch/Newton, and it is not formalized. By the critic lemma it
   yields F_{p*} = leafSet with 8m+1 tags. Second, U2's composition turning E1 plus a sector allocation into `IsSaturatingFlow (cbGraph m) …`.
6. **Nothing here is registered or graded.** An intermediate award for the layer would certify a registered r30 structural fact, not progress on
   Tier 2.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U1-F/`, SHA-256:
- `crit_cb_check.py` `3d495184f8eeb5bc773abbc6a634e50d772c88d3fd29ac3a32afa9f4b67fcf65`: my independent instrument, stdlib only. Its output
  `crit_cb_check.json` is `46209f06fbcfd27e27865eea92e01f99c8ac80af08db9f622695951e267dd252`, with inner result digest `adbd4b97260aa11df6b0415e4eafcbc4d4b450d0bf96734e9a10f40053bf541e`.
- `carry_compare.py` `b3efc2005cb4ce2983fc08f64ffc1e0067452a57ba2ca5aaee94fb0238b6d6bc`: byte comparison of the carried entries.
- `cb_indepnum_check.py` (copy of U1's, `b68699d2…d4d9`) with its replay output `u1_py_replay.txt` `f7e6579da9e65a03af3b08b74cdc25119a69e0f2b5a2687fc10f51f1a8cb054c`.
- `lean-check/LeanProject/` is a copy of U1's project. `.lake/packages` is a symlink to
  `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`, and `LeanProof/Main.lean` is unchanged (`c6d2279c…f5e7`).
  The build log `lean-check/build_main.txt` is empty (`e3b0c442…b855`).
- `lean-check/LeanProject/LeanProof/AuditBase.lean` `a6885f32c89c1903082d46f6b4754a64e70c898a4b4f3965f273ebb0a27fd156`: the verbatim carried fragments plus U1's NEW section.
- `lean-check/LeanProject/LeanProof/Audit.lean` `f285a9e1f5c9ea595e0fe25a54b7342afb4e600481e109e1f6889a3b2ef10710`: AuditBase plus the critic lemmas, `#eval` and `#print axioms`.
  Its output `lean-check/audit_out.txt` is `6c2abf128654d742d6d24c50cbde4ff53de9af20784beba9548efd36dab6598e`.
- Replay: `cd …/scratchpad/c1-crit-U1-F/lean-check/LeanProject && lake env lean LeanProof/Audit.lean` (about 14 s). For Python:
  `cd …/scratchpad/c1-crit-U1-F && python3 -B crit_cb_check.py` (about 4 s).

No background job was started. Every command ran in the foreground to completion, and no `lake update` or `lake clean` was run. Nothing was
written outside this scratch directory and this CRITIQUE.

**Disclosures (read boundary).**
- (a) A `head -20` of `control/C1-CRITIC-ATTACK-BRIEFS.md` displayed the T1 section and the T2 heading before I isolated the U1 section.
  A `grep -n '^#'` of the same file displayed every seat's section heading, including one-line summaries of sibling routes. None of it was
  used.
- (b) The harness auto-injected the user memory index and the project `CLAUDE.md` into context. Neither was fetched or used. The `CLAUDE.md`
  conversation-logging step was not performed because the dispatch mandates exactly one deliverable file.
- (c) The Stage 3 manifest's file list, a capsule member, printed sibling return paths (names only). Nothing was read.
- (d) Reads under `sources/` (the r30 and first-interior `Snippets/`, `SOURCE-DIGESTS.json`, `authority/CLAIM-IDENTITY.json`) were all
  authorized. The shared Mathlib packages were used read-only through the symlink.
- There was no network access, no install, and no search rooted above the grant.
