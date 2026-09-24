# RETURN — Route F2, Cycle 1, r27 (audit and formalize the finite forest degree/extension inequality)

Route ID: `C1-F-02`. Mechanism fingerprint: `EXTERNAL-LEAN-SLICE-AUDIT`. Orientation: F (falsify).
Load-bearing obligation: `control/C1-ALLOCATION.md` item 5 (statement fidelity, dependency graph,
static scan, toolchain and license of the external finite Lean slice).

## Boot acknowledgment

VerityOS booted this session by reading EXACTLY the two authorized files and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
No other VerityOS file (memory, conversations, modules, skills, logs, decisions, the startup
protocol's own task-type map) was read. No read-boundary disclosure is needed for the boot itself.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); the seat cannot
self-inspect its runtime model/effort — stated on dispatch-record authority.

## Stage 2 seal verification

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` with the
`seal_sha256` field removed (`json.dumps(data, sort_keys=True, separators=(",", ":"))`, UTF-8, no
trailing newline), standard library only:

```
recomputed: 64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7
recorded  : 64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7
match: True
```

**Seal cited: `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7`.**

Every file this route reads was digest-checked against `control/SOURCE-DIGESTS.json` before use;
all 18 relevant entries (`sources/external/**`) matched exactly (script and raw output in
`scratchpad/c1-F2/` — see the IMPORT LIST / replay section below for the verification command run
inline, not saved as a separate generator since it is a one-shot digest check, not a numeric claim
about forests).

## Read boundary

Read: `C1-WORKER-COMMON-BRIEF.md`, `C1-STAGE2-PACKET-MANIFEST.json`, `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `C1-ALLOCATION.md`, `C1-STAGE1-GATE.md`, `AUTHORIZATION.md`,
`R27-CHARTER-PROMPT.md`, `CLAIM-DISTINCTIONS.json`, `cycles/cycle-1/stage2/ROUTE-STATE.md`,
`SOURCE-DIGESTS.json`, and under `sources/external/`: `STATIC-SCAN.json`, `repository-tree.json`,
`source-hashes.json`, `paper/section8-extracted.txt`, `lean-source/README.md`,
`lean-source/lakefile.toml`, `lean-source/lean-toolchain`, `lean-source/lake-manifest.json`, and
all nine `.lean` files under `lean-source/`. Also `sources/mathlib-binding/PIN.json`. No search
tool was run above the granted roots; no `find`/`grep`/`rg`/`ls -R`/glob `cat` was used anywhere —
all file listing was by exact path from the sealed manifest. **No read-boundary disclosure.**

Not read (out of route scope; not needed for this mechanism): `sources/r25/**`, `sources/r26/**`,
`sources/predecessor-ledgers/**`, `sources/literature-packet/**`, `sources/authority/**` (beyond
naming the claim keys below from the brief text itself, not from opening the 2.4MB registry file —
this route's mechanism touches none of them, so no registry read was needed), the Mathlib project
tree (not needed: no build, no API-existence check performed — named as an open item below), the
external paper's full HTML (only the frozen `section8-extracted.txt` was needed for the §8 text).

## IMPORT LIST (every generator; standard library only)

`hashlib`, `json`, `os`, `re` — no network, no third-party packages, no `pip`.

## Claims touched (before any evidence is presented)

This route re-confirms and touches **none** of the registered claims named in the common brief
(`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`, `E993-R25-RANK5-CEILING-SHARPENED-TO-25`,
`E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29`, `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING`,
`E993-R25-KADDITION-CLOSURE-X-LE-4`, `E993-R25-UNR-FOREST-WIDE`). The mechanism is a pure audit of
an external, non-registered source (`sources/external/`); it presents no census and proves or
refutes no forest-theoretic claim. It produces record-grade findings that feed the obligations-
ledger row `R27-EXTERNAL-AUDIT`, not a new mathematical claim, so lexical/mathematical alias-
checking against the registry does not apply (nothing new is proposed for registration).

## Disclosure: a naming mismatch in this route's own brief

`C1-WORKER-COMMON-BRIEF.md` item 2 instructs every route to identify "where `hyp-tree`,
`hyp-alpha`, `hyp-eligible` and `(★)` enter each step." These four names do not occur anywhere in
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, or `C1-ALLOCATION.md` for r27; they do not name any
object of this run. They read as carried-over boilerplate from a different contract's hypothesis
vocabulary (the r26/top-rank eligibility apparatus used different hypothesis letters). Similarly,
item 5 names the candidate-registration namespace as "`E993-R26-…`", while `SOLUTION-CONTRACT.md`
§1 states explicitly "run-local candidate namespace `E993-R27-…`" — a second drafting
inconsistency in the same sealed brief. Per the run's authority hierarchy (`SOLUTION-CONTRACT.md`
governs the exact targets and namespace; a common-brief boilerplate slip does not override it), I
follow `E993-R27-…` and treat both slips as **record**, not as instructions to act on literally.
In their place, this return performs the equivalent hypothesis-tracing the item evidently intends
(see next section) against r27's actual hypotheses.

## Step-by-step statement fidelity (the "one precise mathematical statement" this route derives)

The statement this F-route attacks/audits is: **do the external declarations `sum_degOn_le`
(`DegreeLemma.lean`) and `prefix_ratio` (`Ends.lean`), specialized at `S = univ`, assert exactly
(DL) and (EX) as fixed by `SEMANTIC-CONTRACT.md` §2, and does their combined proof-term dependency
closure stay inside the frozen finite slice with no `sorry`/`admit`/`axiom`/`native_decide`/
`unsafe`, and no import of the excluded analytic modules?** Traced step by step, naming where each
hypothesis enters (in place of the brief's non-existent `hyp-tree`/`hyp-alpha`/`hyp-eligible`/`★`):

1. **Acyclicity hypothesis** (the run's forest hypothesis). Both `sum_degOn_le` and `prefix_ratio`
   take `hG : G.IsAcyclic` as their first explicit hypothesis, on the *ambient* graph `G` (not on an
   induced subgraph of `S`) — `DegreeLemma.lean:701`, `Ends.lean:43`. This is exactly the run's
   forest hypothesis (`SEMANTIC-CONTRACT.md` §1: "A finite forest is `G` with `G.IsAcyclic`
   (Mathlib); it may be disconnected or empty"). It enters `sum_degOn_le`'s proof at
   `vpoly_fE_forest_nonneg hG S`, which case-splits into `Dpoly_Epoly_nonneg hG` (the tree case, used
   once per component via `inducesTree_of_mem_components hG`) — i.e. acyclicity is consumed exactly
   once per component, to justify `InducesTree` (`Connected ∧ IsAcyclic` on the induced subgraph),
   which licenses the rooted simultaneous induction. `prefix_ratio` consumes `hG` only by passing it
   through to `sum_degOn_le hG S k` (`Ends.lean:59`) — it needs no acyclicity beyond that.
2. **Finiteness/carrier hypothesis.** `[Fintype V] [DecidableEq V]` on the ambient vertex type,
   declared once at the top of `DegreeLemma.lean`/`Ends.lean` (`variable {V : Type u} [Fintype V]
   [DecidableEq V]`). This matches the run's `[Fintype X] [DecidableEq X]` carrier for the
   `forest_degree_lemma`/`forest_extension_inequality` targets in `SOLUTION-CONTRACT.md` §2 exactly
   (not the weaker `[Finite X]` carrier used for (LB)/(R5)/(XR), which is the correct choice since
   those two targets are stated with explicit `Finset`/`Fintype.card` sums).
3. **The `S = univ` specialization** (playing the role the brief's "`(★)`" would play: the point
   where the general "relative to a vertex subset `S`" statement collapses to the run's un-relativized
   object). Both declarations are stated for an *arbitrary* `S : Finset V`, more general than the
   run's target (which fixes `S = univ`, i.e. `D_k(G)`/`i_k(G)` at the whole graph). At `S = univ`:
   `degOn G univ v = G.degree v` by `degOn_univ` (`Basic.lean:155`), **which requires
   `[DecidableRel G.Adj]`** — an instance `degOn`/`icoeff` themselves never need (they are built with
   `open scoped Classical`, so `degOn`/`icoeff` are noncomputable and instance-free by design; the
   *bridge* lemma to Mathlib's computable `G.degree`/`G.neighborFinset` is what needs the instance).
   This matches `SEMANTIC-CONTRACT.md` §1's own text precisely: "`deg_G(v) := G.degree v` (Mathlib,
   **with `[DecidableRel G.Adj]`**)" — the run's contract already anticipates exactly this bridge
   requirement. `icoeff G univ k` needs no bridge instance at all: it counts a `Finset (Finset V)`
   directly and is definitionally the same cardinality as the run's `indepCount G k := Nat.card
   {S : Finset X // G.IsNIndepSet k S}` (a routine `Finset.card`-vs-subtype-`Nat.card` translation
   lemma, standard but **not present** in the frozen slice — an item for whichever U-route ports
   this statement, named in "Remaining obligation" below).
4. **Statement match, (DL).** At `S = univ` with the bridge instance, `sum_degOn_le` reads
   `∑_{J ∈ indepCard G univ k} ∑_{v∈J} G.degree v ≤ 2·k·icoeff G univ k`, i.e. `D_k(G) ≤ 2k·i_k(G)`:
   **exactly** (DL) as fixed by `SEMANTIC-CONTRACT.md` §2 (the raw sum form, not merely the paper's
   normalized-expectation form (8.3) — the Lean statement is in fact the *stronger*, unnormalized
   form the run's contract itself uses).
5. **Statement match, (EX)'s prefix form, with a ℕ-truncated-subtraction caveat.** `prefix_ratio`
   reads `(S.card − 3·k) * icoeff G S k ≤ (k+1) * icoeff G S (k+1)` where `−` is **`ℕ`-truncated
   subtraction**, not the run's `ℤ`/subtraction-free form `(k+1)i_{k+1} + 3k·i_k ≥ n·i_k`. These
   coincide when `S.card ≥ 3k` (there, `(S.card − 3k)` is genuine and the two forms are the same
   statement after distributing). When `S.card < 3k`, `prefix_ratio`'s LHS truncates to `0`, so the
   external statement degenerates to the trivial `0 ≤ (k+1)i_{k+1}` — literally **weaker** than (and
   not a direct syntactic instance of) the subtraction-free form there, **although the
   subtraction-free form is itself also trivially true in that regime** (`n < 3k ⇒ n·i_k < 3k·i_k ≤
   (k+1)i_{k+1} + 3k·i_k` whenever `i_k ≥ 0`, i.e. always), so no mathematical content is lost overall
   — but a formalizer transporting `prefix_ratio` directly into the run's `forest_extension_inequality`
   contract (§2) cannot do it by a single `omega`/`tsub_le_iff_right` rewrite alone in general; it
   needs the same case split the external file itself uses internally
   (`rw [Nat.sub_mul, tsub_le_iff_right]; nlinarith` at `Ends.lean:60`, which is exactly the ℕ/ℤ
   bridge `SOLUTION-CONTRACT.md` §2's remark and `SEMANTIC-CONTRACT.md` §4's "Natural-number
   subtraction" convention already flag as load-bearing). This is a genuine, precise fidelity
   finding, not a defect: the external theorem is true and equivalent in content, but not a literal
   drop-in for the contract's exact statement text.
6. **Double count.** `sum_numExtensions` (`Extensions.lean:67`) reads `∑_{J∈indepCard G S k}
   numExtensions G S J = (k+1)·icoeff G S (k+1)`, needing **no** acyclicity hypothesis at all
   (matches `SEMANTIC-CONTRACT.md` §1's "Double counting" bullet, which likewise states it for every
   graph). `numExtensions_ge` (`Extensions.lean:116`) reads `S.card ≤ numExtensions G S J + J.card +
   ∑_{v∈J} degOn G S v`, matching `e(J) ≥ n − k − Σ_{v∈J}deg(v)` exactly (subtraction-free form).

## Dependency graph (item a)

Two independent, deterministic checks (scripts under `scratchpad/c1-F2/`, replayed byte-identically
under `scratchpad/c1-F2-replay/`):

**Import graph** (`import_graph.py`, digest below). Of the 9 frozen files, three have an `import`
naming a module **not present** in the frozen slice: the root aggregator `ErdosProblem993.lean`
(imports all 18 upstream modules, including `HardCore`, `MeanRange`, `Fourier`, `RootMoments`,
`CLT`, `Curvature`, `Central`, `Transfer`, `ForMathlib.BerryEsseen`, `ForMathlib.EsseenSmoothing`),
`AxiomCheck.lean` (imports `Transfer`), and `Main.lean` (imports `Central`). None of these three
files can be elaborated standalone from the frozen slice alone — they are present for **context**
(the headline statement and the axiom-audit pattern), not as part of a self-contained dependency
closure. The transitive import closure of `DegreeLemma.lean` is exactly `{Basic, Components,
DegreeLemma, Extensions, Recursion}`; of `Ends.lean` it is that set plus `{Ends}` itself. **Neither
closure contains any of the ten excluded/analytic modules** (`excluded_modules_in_*_closure` are
both `[]` in the report). This is the load-bearing confirmation for allocation item 5(a): the
declarations that matter (`sum_degOn_le`, `prefix_ratio`) sit in a genuinely self-contained finite
slice; the three context-only files are the ones that reach outside it, and neither target
declaration is reachable from them (imports run the other direction: `Main`/`AxiomCheck`/root import
*into* `DegreeLemma`/`Ends`, not vice versa).

**Proof-term reference graph** (`dep_closure.py`, digest below), a name-citation BFS over all 191
top-level declarations in the 9 files, independent of the import graph (it looks at which
declaration *names* appear in each declaration's own source text). `sum_degOn_le`'s closure has 132
declarations, `prefix_ratio`'s has 140 (the 8-declaration difference is exactly
`{numExtensions, numExtensions_ge, sum_numExtensions, closedNbrSet, nbrSet,
mem_sdiff_closedNbrSet_iff, symmetric_not_adj, prefix_ratio}` — the double-counting apparatus
`prefix_ratio` needs beyond what `sum_degOn_le` alone needs). Cross-checked against the same 191
declarations searched for the literal token `decide`: only two declarations contain it
(`isBipartiteOn_of_isAcyclic`, `card_le_two_mul_alpha`), and **neither is in either target's
closure** — both belong to the *tail* (decreasing-segment, `eq:tail`/(8.9)) side of the paper's
Proposition 8.2, which this run's (EX) does not need (the run's target is the *prefix*/increasing
side only).

## Statement fidelity (item b) — recap

Covered in full in "Step-by-step statement fidelity" above: `sum_degOn_le` = (DL) exactly at
`S = univ` (raw sum form, stronger than the paper's normalized (8.3)); `prefix_ratio` =
subtraction-free (EX) up to the ℕ/ℤ truncation caveat (mathematically equivalent, not syntactically
a literal instance when `n < 3k`); `sum_numExtensions` = the double count exactly;
`numExtensions_ge` = the `e(J)` lower bound exactly. `icoeff`/`indepCard`/`degOn` translate to the
run's `indepCount`/`I_k`/`G.degree` as stated; the `G.degree` bridge needs `[DecidableRel G.Adj]`
exactly where the run's own contract already anticipates it.

## Static scan (item c) — corrects the packet's record

`sources/external/STATIC-SCAN.json` states `"tokens_excluding_comments": []` and `"lean_files": 19`.
Two findings:

1. **File count.** `19` is the file count of the **full upstream repository**
   (`sources/external/repository-tree.json`: 1 root + 18 under `ErdosProblem993/`, including the ten
   excluded analytic files), **not** the frozen finite slice actually delivered to this route (9
   files: 8 under `ErdosProblem993/` + the root aggregator). The packet's own scan record was not
   updated after freezing down to the finite slice. This does not affect any correctness conclusion
   (the 9 frozen files are exactly the ones digest-verified against `SOURCE-DIGESTS.json` and
   scanned below) but is a genuine record correction to `STATIC-SCAN.json`'s face.
2. **Token count.** A deterministic whole-word scan of exactly the 9 frozen files
   (`static_scan.py`, digest below) for `sorry`, `admit`, `axiom`, `native_decide`, `unsafe`,
   `decide` finds **zero** hits for the first five tokens and **5 hits for `decide`** — contradicting
   the packet's literal claim of zero hits across all tracked tokens. Full context, all 5:
   `Ends.lean:126` `decide (c v = 0)`; `Ends.lean:127` `decide (a = 0)`, `decide (b = 0)`, and
   `:= by decide`; `Recursion.lean:301` `:= by decide`. Of the 5: **3 are the ordinary
   `Decidable.decide : Prop → Bool` term-mode function** (building a 2-colouring `V → Bool`, not a
   proof method at all — unrelated to the proof-integrity concern a "decide" scan exists to catch),
   and **2 are the `decide` tactic**, both closing a fixed, tiny, closed proposition over `Fin 2`
   (2–4 cases: "`∀ a b : Fin 2, decide(a=0)=decide(b=0) → a=b`" and "`∀ i : Fin 2, ¬i=0 ↔ i=1`") —
   not "`decide` over an enumeration for a universal step" in the sense `SOLUTION-CONTRACT.md` §2
   fences against (that fence targets the run's own project; this is a finite-checked coloring-parity
   fact, four truth-table rows). Per the dependency-graph cross-check above, **none of the 5 hits lie
   in the proof closure of `sum_degOn_le` or `prefix_ratio`**. Net: the packet's "none" claim is
   literally incomplete for the token `decide`; substantively, nothing that matters to (DL)/(EX) is
   affected. `sorry`/`admit`/`axiom`/`native_decide`/`unsafe`: genuinely zero hits, packet claim
   confirmed for those five.

## Toolchain and Mathlib pins (item d)

External (from `lean-toolchain` and the **resolved** entry in `lake-manifest.json`, not merely the
`lakefile.toml` tag): Lean `v4.29.1`, Mathlib commit `5e932f97dd25535344f80f9dd8da3aab83df0fe6`
(the `lakefile.toml` `[[require]] rev = "v4.29.1"` is a tag reference; the manifest's resolved
`"rev"` under the `mathlib` package entry is the actual pinned commit, confirmed identical to the
README's stated commit). Run's pin (`sources/mathlib-binding/PIN.json`): Lean `v4.32.2`, Mathlib
commit `905b95818eb32af7874a58b427f50c1711a5e96c`. Different toolchain, different Mathlib revision,
as `C1-STAGE1-GATE.md` Ruling 4 already records; the external toolchain is not installed, `elan` was
not run, nothing was built (no `lake build` anywhere in this session). Minor fidelity note: the
external `lake-manifest.json`'s own package name is `"StatLean"`, not `"ErdosProblem993"` (the
`lakefile.toml`'s declared name) — a harmless internal naming leftover, not evidence of a different
project. Named Mathlib API surface load-bearing for `sum_degOn_le`/`prefix_ratio`'s closure that a
formalizer must re-check exists with a matching signature under the run's `905b95818e` pin (not
checked here — no build permitted): `SimpleGraph.IsAcyclic`, `SimpleGraph.IsAcyclic.coloringTwo`,
`SimpleGraph.degree`, `SimpleGraph.neighborFinset`, `SimpleGraph.Coloring`, `SimpleGraph.Walk`
(`.support`, `.toPath`, `path_unique`), `Relation.ReflTransGen`, `Finset.strongInduction`,
`Finset.card_nbij'` (used inside `sum_numExtensions`'s bijection — a comparatively new Mathlib
combinator name, worth checking first), `Nat.findGreatest`/`Nat.findGreatest_spec`, `Polynomial.C`/
`coeff_C_mul_X_pow`/`finset_sum_coeff`. This list is the deliverable of item (d)'s "which Mathlib
names may have changed"; verifying each against the pinned project is left as a named obligation
(below), not performed here (would require reading the ~3-year-newer Mathlib source tree for each
name, out of this route's time budget and arguably U1/U2/U3's job once they actually build).

## License status (item e)

No `LICENSE` file is present in the frozen audit copy, and — independently — none is present in the
**full upstream repository tree** either: `sources/external/repository-tree.json`'s root-level
listing (`.gitignore`, `ErdosProblem993.lean`, `ErdosProblem993/`, `README.md`, `lake-manifest.json`,
`lakefile.toml`, `lean-toolchain`) has no `LICENSE`/`LICENSE.md`/`COPYING` entry at the same level as
`README.md`. This strengthens rather than merely repeats Gate ruling 3: the absence is not an
artifact of an incomplete freeze, it appears to be the state of the public repository at the pinned
commit itself. Per the ruling and `SOLUTION-CONTRACT.md` §3.6, the external text stays read-only —
audited and quoted at most a declaration's statement line, never copied into any project, never
built.

## Section-numbering drift (a fidelity note beyond the allocation's explicit list)

The frozen paper (`section8-extracted.txt`, §8) labels the degree bound "**Lemma 8.1**" and the
prefix/tail statement "**Proposition 8.2**" (displayed as (8.1)–(8.9)). The external Lean file
headers read "**Lemma 6.1**" (`DegreeLemma.lean`'s docstring) and "**Proposition 6.2**" (`Ends.lean`'s
docstring). The mathematical content matches verbatim (I compared `D_T`/`E_T` and the two
recurrences (8.4)–(8.5) against `degDefect`/`degDefectAux`/`Dpoly_join`/`Epoly_join` term by term;
they agree exactly, including the "attach one child at a time" reformulation the Lean file's own
comment already flags as a deliberate restructuring of the paper's "attach all `m` children at once"
presentation). The numbering drift is consistent with the Lean project being pinned against an
earlier arXiv revision of the same paper with different section numbers than the frozen v1
(17 September 2026) copy under audit — a citation-label mismatch only, not a content mismatch.
Any published attribution from this run should cite the paper's current numbering (Lemma 8.1,
Proposition 8.2), not the Lean comments' numbering.

## Which intermediate statements a local re-proof needs (item f)

The self-contained closure for `sum_degOn_le` (132 declarations) is exactly the machinery
`U2 LEAN-DEGREE-LEMMA-CORE` is chartered to build in-run: the vertex-weighted polynomial `vpoly`
(additivity, root conditioning, multiplicativity over `Separated` unions), `NonnegCoeffs` closure
lemmas, the `JoinAt`/one-child-at-a-time join recursions `Dpoly_join`/`Epoly_join`, and the
`children`/`compOf`/centroid-free component machinery (`Components.lean`) needed only for
`inducesTree_of_mem_components` and the strong induction on `Finset.strongInduction`. `prefix_ratio`
additionally needs the double-count bijection (`sum_numExtensions`, a `Finset.card_nbij'` argument)
and `numExtensions_ge`. None of it needs `IsBipartiteOn`, `alpha`, `tail_ratio`, or anything from the
"tail" side. Full name lists (132 and 140 entries) are in `dep_closure_report.json`
(`closure_sum_degOn_le`, `closure_prefix_ratio`) rather than repeated here in full.

## Fixed points

This route's mechanism is a text/dependency/license audit; it never instantiates `G` on any concrete
forest, so `SEMANTIC-CONTRACT.md` §4's fixed-point table does not apply to any numeric claim here (no
census, no table is presented — consistent with common-brief item 3's "before any census" gate: this
route presents none). One structural cross-check was made in passing: `icoeff_zero`
(`Recursion.lean:114`, `icoeff G S 0 = 1`) matches the contract's `i_0 = 1` always.

## Grades

Every finding above is a **record** (a documentary/provenance fact about the frozen source text,
established either by direct reading or by a deterministic, digested, replayed script), not a
forest-theoretic theorem, conditional theorem, bounded computation, conjecture, or refutation — the
theorem/conjecture grading ladder in `SOLUTION-CONTRACT.md` §4 does not apply to source-audit
findings. Where a finding corrects the packet's own prior record (`STATIC-SCAN.json`'s file count and
token-hit claim), it is a **record correction**, evidenced by a digested, replayed generator, not an
assertion resting on this route's authority alone.

## Generators, digests, and replay (item 7)

Three deterministic generators, standard library only, each with a SHA-256 digest of the report's
canonical JSON (sorted keys, `(",", ":")` separators, no wall-clock/PID/host field) embedded in the
report itself, and each independently replayed byte-identically in `scratchpad/c1-F2-replay/` (fresh
copy, fresh run, diffed against the original — all six output bytes identical):

| Generator | Script SHA-256 | Report SHA-256 (file) | Report digest field (canonical JSON) |
|---|---|---|---|
| `static_scan.py` | `2980929d9d1bbe3107d7c8d76d9b51a47b79e85736dbb5f12e3e6702a273f020` | `1a00d183a9533af6432dbc34eb761b1469b0b8526877b9b855f110c881b17439` | `da09feae40e2d1214b679f3b744679a4042406fd4981438d6deee5381107a061` |
| `dep_closure.py` | `c267e18c63e2de9b0577210b2f9247c0c94428cdfcdf7db4b1973bac2f07d1be` | `b4a11d5d3d407c480b25e89b941bb415dabc0381af51343bf04d1fa17271912a` | `97a4c05f1ed5f4daf95f46091f3bdbdc7ef04ca6ed832fdceda0d0f18ce6dbdd` |
| `import_graph.py` | `10a33c271b96a0a51f85c30db57fb7d05f48f84307d2e22fd5b76e86c44dba6d` | `aa8315a7d7dc1998232ce79690fbf0941e77c0fb68c5b45d9ef1f059ba8ec1b9` | `635985f6043b9ec921f7fcf9db1a82b728ec53819f5062904c4b816ee24a269e` |

Replay (copy-out-first; each writes its report next to itself, never in place, never `/tmp`):

```bash
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-F2/{static_scan.py,dep_closure.py,import_graph.py} \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-F2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-F2-replay
python3 static_scan.py && python3 dep_closure.py > /dev/null && python3 import_graph.py > /dev/null
```

All three scripts and reports also live under `scratchpad/c1-F2/` (the run location) and were
diffed byte-for-byte against the replay directory's regenerated copies before this return was
written; all six pairs matched exactly. No background job was started at any point (all three
scripts run to completion in well under a second, in the foreground); nothing was killed (nothing
was backgrounded); no `lake build`, no `elan`, no network call, no `pip` install occurred in this
session.

## `x` and `Δ_k` note

This route computes no `i_k`/`Δ_k`/`x` values for any forest (its mechanism is source audit, not
computation), so no row-by-row `x`/`Δ_k` table applies; this is stated explicitly rather than
omitted silently, per common-brief item 7.

## `headline_resolved`

`headline_resolved: no`

## Route verdict

`bounded_evidence` — this route neither proves nor refutes any forest-theoretic statement; it
delivers machine-checked, replayable, digested bounded evidence about the external source's
statement fidelity, dependency closure, static-scan content, toolchain/license status, and two
record corrections to the packet's own prior static-scan record.

## Remaining obligation

Successor inheritance, for whichever route/cycle next touches (DL)/(EX) formalization (U2/U3 in this
cycle, or a later cycle):

1. **Port target.** `sum_degOn_le`'s self-contained 132-declaration closure is the right shape and
   size for `U2`'s in-run port of (DL); `prefix_ratio`'s 8 additional declarations (the double-count
   apparatus) are the right addition for `U3`'s (EX). Full closure name lists are in
   `dep_closure_report.json`. No external Lean text may be copied (Gate ruling 3); this is a
   structural map for an independently-authored in-run proof, not a transcription source.
2. **The ℕ/ℤ subtraction bridge.** Whoever states the run's `forest_extension_inequality` (already
   correctly subtraction-free per `SOLUTION-CONTRACT.md` §2) should not expect a literal one-line
   restatement of `prefix_ratio`; the case split at `S.card ≥ 3k` vs `< 3k` (or working in `ℤ`
   throughout) is required, exactly as `SEMANTIC-CONTRACT.md` §4 already flags.
3. **Unverified Mathlib API surface.** The named list in "Toolchain and Mathlib pins" above
   (`Finset.card_nbij'` in particular) has not been checked for existence/signature match under the
   run's pinned Mathlib `905b95818e`; this needs a build (U1/U2/U3's job, not this route's — no build
   was permitted or attempted here).
4. **`icoeff`-to-`indepCount` bridge.** A routine but unwritten translation lemma between the run's
   `Erdos993G1.indepCount G k` (`Nat.card` of a subtype) and the external `icoeff G univ k`
   (`Finset.card` of a filtered `Finset (Finset V)`) is needed if any U-route wants to reuse the
   *shape* of the external proof against the run's own G1 definitions of record.
5. **Attribution.** Cite the paper's current numbering (Lemma 8.1, Proposition 8.2), not the
   external Lean comments' numbering (Lemma 6.1, Proposition 6.2) — see "Section-numbering drift"
   above.
6. **Record corrections owed.** `sources/external/STATIC-SCAN.json`'s `"lean_files": 19` and
   `"tokens_excluding_comments": []` fields should be corrected (or superseded by a scoped note) at
   the next point this packet's static-scan record is promoted anywhere durable; this return is the
   evidence for that correction, not itself an edit to any sealed member (`STATIC-SCAN.json` was not
   touched, per "sealed members are never edited after their seal").
7. **Two claim-distinctions drafting slips** (this route's own brief item 2's stray
   `hyp-tree`/`hyp-alpha`/`hyp-eligible`/`(★)` and item 5's stray `E993-R26-…` namespace) are worth a
   one-line correction the next time `C1-WORKER-COMMON-BRIEF.md`-style boilerplate is drafted for a
   future run, so a later seat does not follow the stale text literally.

Nothing above transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, or any
no-recovery claim; none was touched.
