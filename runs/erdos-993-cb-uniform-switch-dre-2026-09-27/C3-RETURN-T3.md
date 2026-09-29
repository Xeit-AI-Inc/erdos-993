# RETURN — r31 Cycle 3, seat T3

Route `C3-T-03`. Mechanism token `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`. Orientation T (prove).

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.

**IMPORT LIST** (every generator in this return, standard library only): `fractions.Fraction`, `itertools`,
`hashlib`, `json`, `sys`. No network, no package installs, no non-stdlib import anywhere in this return.

## Boot

I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and nothing else under the VerityOS root. I did not
follow the startup protocol's own task-type map into memory, logs, skills, decisions, operations or conversations;
the controller owns conversation logging for this run and I wrote none. No `## Read-boundary disclosure` applies.

## Digest verification

- **Dispatch** `control/dispatch/c3-stage3/DISPATCH-T3.md`: SHA-256 `2038a58e8d1e4db2df0f43ff88925a03b5b77f1555c11206922097c69225cf68`, matched the value the launcher supplied before I read the file (recomputed with `shasum -a 256`).
- **Stage 2 packet seal** `control/C3-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON of the manifest (all keys `file_count`, `files`, `run_id`, `schema_version`, `stage`; `sort_keys=True`, separators `(",", ":")`, no trailing newline, `seal_sha256` field removed before hashing) = `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`, which **matches** the manifest's own recorded `seal_sha256` and the value stated in the dispatch. `file_count` (5049) equals `len(files)` (5049).
- **Every source file this return cites** was checked against its cycle's `SOURCE-DIGESTS.json` (`sources/c1-results/SOURCE-DIGESTS.json`, `sources/c2-results/SOURCE-DIGESTS.json`) before being read for content; 42 individual file checks (2 from `c2-results`, 40 from `c1-results`), 0 mismatches, 0 missing. The full list (paths + recorded SHA-256) is reproduced in `## Sources cited, with digests` below and in `scratchpad/c3-T3/digest-check.log` (SHA-256 `9991a3ba8a0d6d95e39e332dcfac80810a62f96e46ad179f3c536a0f1351a234`).

## Registered claims touched (named before any computation, per item 3 of the common brief)

This route proposes **no new claim** in the `E993-R31-` namespace and registers nothing. It builds, at Lean
statement granularity, a dependency-ordered elaboration ("DAG") of the informal argument already registered as a
scope note on one existing key, and independently re-verifies (in scratch, not in Lean) the piece of that argument
named "the Out bridge" in `control/C3-ALLOCATION.md`'s route table. The claims touched, read from
`sources/authority/CLAIM-IDENTITY.json`'s run-local mirror `control/CLAIM-IDENTITY.run-local.json` (497 entries)
before writing any code:

| Key | Status (registry) | Role here |
|---|---|---|
| `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107` | VERIFIED (registry status field; grade `proved_informal` in SOLUTION-CONTRACT §4 terms) | The key carrying Lemma DF's scope note (SR-C2-3, G-5). This return elaborates that scope note's content, not the key's statement/hypotheses/fences, which are unchanged. |
| `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | VERIFIED | E1, the non-sector deletion flow that Lemma DF's In bridge must not double-load against (SEMANTIC-CONTRACT §2 "E1"). Cited, not touched. |
| `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | VERIFIED | Defines `activeWeight`/`transportRel`, the literal objects `g_sec` restricts. Cited, not touched. |
| `E993-TREE-REAL-ROOTED` | REFUTED | Fence check only: this return applies no Darroch/Newton step and no real-rootedness claim to any forest polynomial (SOLUTION-CONTRACT fence 3, 6). |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | Named per SOLUTION-CONTRACT fence 1: nothing here transfers status to either; both stay OPEN. |

**Lexical/mathematical alias scan** (item 5 is conditional on proposing a new claim; none is proposed, so the full
alias-check procedure does not fire — recorded anyway, as diligence). I scanned `claim_key` and `aliases` fields of
all 497 run-local entries for the working labels this return uses (`g_sec`, `Out bridge`, `In bridge`, `Lemma DF`,
`target distinctness`, `SECTOR-LITERAL-ARC-ACCOUNTING`). One incidental substring hit:
`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` contains the character run `G-SEC` inside
"...MATCHIN**G-SEC**TOR..."; reading the key's statement (a matching-shadow key on a different tree family, unrelated
mechanism) confirms this is coincidental, not a naming collision. No registered key or alias matches any working
label as a whole word or phrase. Mathematically: nothing in this return states a universal, conjectural, or
previously-refuted proposition under a new name; every proposition below is either (a) inherited at its recorded
grade from Lemma DF's scope note, cited, or (b) a Lean-granularity restatement of a structural fact already in that
scope note's text, with an independently-written proof and an independently-written scratch check.

## Sources cited, with digests (verified against the listed `SOURCE-DIGESTS.json` before reading)

`sources/c2-results/SOURCE-DIGESTS.json`:
- `second-reads/SR-C2-3/SECOND-READ.md` — recorded `11aa25fb2d1b9354e51ad0e84fb2d5a3aedb4cc99e12a10e2b3fabfc6b400994`, recomputed identical, MATCH.
- `cycles/cycle-2/stage6/SYNTHESIS.md` — recorded `260c819571311c8f3538e90fab8f4f577da18626ea888fd0c8fe04198f626024`, recomputed identical, MATCH.

`sources/c1-results/SOURCE-DIGESTS.json`, all under `runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Snippets/` (C1-LA1, the sector-certificate template layer — 13 fragments: State8; cb8Bpb; cb8Bpc; cb8CGamma; cb8Pb; cb8Pc; cb8Theta; cb8Sigma; cb8Out; cb8In; cb8OutConst; cb8R1; cb8_topRank_sectorTemplate_feasible) and `runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Snippets/` (C1-LA2, the CB definition layer — 27 fragments: cbEdge; cbGraph; cbVertex; cbParentVal; cbParent; cbChildEdge; cbLowerWitness; cbGraph_adj_r_s; cbGraph_adj_s_v; cbGraph_adj_r_choke; cbGraph_adj_choke_support; cbGraph_adj_support_leaf; mem_leafSet_cbGraph_iff; mem_cbLowerWitness_iff; cbLowerWitness_card; taggedFamily; indepFamily; tagWitnesses; activeWeight; layerWeight; favorableLeaves; transportRel; IsSaturatingFlow; WeightedHall; mem_neighborFinset_choke_iff; mem_neighborFinset_root_iff; choke_degree) — 40 fragment files total, MATCH confirmed for all 40.

The exact recomputed digests for every one of these 41 checks are reproduced verbatim in
`scratchpad/c3-T3/digest-check.log` (written by the verification commands of this session; not re-quoted here to
keep this return under a reasonable length — every value there was MATCH, 0 MISMATCH, 0 MISSING).

I did **not** read `AUTHORIZATION.md`, `R31-CHARTER-PROMPT.md`, `OBLIGATIONS.csv` beyond a bounded grep for `T3`
(no hits — the file is a per-state LP obligation table, not seat-indexed), or any sibling seat's Cycle 3 scratch;
consistent with the grant.

## Object (from `control/C3-ALLOCATION.md`, route T3, verbatim quote)

> **T3 — `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`.** Object: U-B's DAG at Lean granularity over C1-LA2's labels:
> the definition of `g_sec` on literal pairs, target distinctness across `(i, j, kind)` for the Out bridge, the In
> bridge with every zero-flow class (non-sector `u = r` two-for-one arcs, the `u = s` and `(1, 0)` switches), the
> `8 − γ` preimage count, and Lemma DF written as that DAG's proof paragraph. Could close: U-B's informal DAG closed
> at statement granularity with the Out bridge proved in scratch.

`ROUTE-STATE.md` inherits for this route: the sector-arc table (SR-C2-3); U2's Cycle 2 sector lemmas (compiled
scratch, no grade — `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean`); C1-LA1's allocation
(`cb8_topRank_sectorTemplate_feasible`, the template-level feasibility theorem, kernel-checked, no grade of its own
beyond the award's).

## Derivation

**Where each hypothesis enters.** `m ≥ 107`, `m ≡ 2 (mod 3)` enters only through C1-LA1's template feasibility
(`cb8_topRank_sectorTemplate_feasible`, cited, not re-derived) and through the integrality of `K = (16m+1)/3` used in
SR-C2-3's tightness argument (cited, not re-derived: this route's object is the arc-accounting DAG, not the
tightness or feasibility claims). The fixed selector enters through `favorableLeaves` / `F_{p*}(T_m) = leafSet`
(C2-LA3, cited): every clause below that mentions "weight" assumes `F ⊇ leafSet`, exactly as SR-C2-3's finding 1
repairs onto the scope note's face. The original supports enter through `tagWitnesses`/`activeWeight`
(C1-LA2 entries 15–16, cited). No ℕ-subtraction is introduced by this route (`chokeState` below is defined by
`Finset.card`, never a subtraction of naturals that could underflow); no Darroch/Newton step is used (SOLUTION-CONTRACT
fence 3); nothing off the `d = 8`, `m ≡ 2 (mod 3)`, rank `p*` class is claimed (fence 1).

### The DAG (Lean-statement granularity, dependency order; namespace `E993Transport` throughout, matching C1-LA2)

Twelve nodes, each named by the identifier it would carry as a Lean declaration. `cbGraph` is the only carried
(non-new) node; the rest are new statement shapes this route proposes for a future U-seat to compile — none is
itself compiled here (no Lean was built by this route; `T (prove)` orientation, not `U (formal/structural)`), so
none carries a grade (SOLUTION-CONTRACT §4: "a compiled scratch declaration has no grade until its governed award
closes" — and these are not even compiled, only statement-shaped).

```text
cbGraph                                                        [carried: C1-LA2 entry 24]
  └─ sector_mem                          "B ∋ r ∧ B ∋ v" (independence forces s ∉ B, no choke ∈ B)
       └─ choke_state                    (β_i, γ_i) := (#{b-legs of B at choke i}, #{c-legs of B at choke i})
            └─ out_arc_classify          the transportRel-images of a sector source B, exactly classified
                 └─ target_distinct      those images are pairwise distinct sets
                      └─ g_sec_def       the literal ℚ-valued arc weight, well-defined BY target_distinct
                           └─ out_bridge_sum     Σ_A g_sec(B,A) = Σ_i cb8Out(m, (β_i,γ_i))   [THE OUT BRIDGE]
            └─ switch_preimage_8_gamma   a weight-γ switch image has exactly 8-γ sector preimages
            └─ in_sector_del_preimage    deletion-preimages of an in-sector target: empty legs only, all sector
            └─ in_sector_switch_r_preimage  switch-at-r preimages: C(z,2), z = #{no-b-leg chokes}
                 └─ in_bridge_zero_classes   the three listed classes carry zero flow; only switch images (γ≥1)
                                              are doubly fed                                    [THE IN BRIDGE]
  lemma_DF  ← { out_bridge_sum, in_bridge_zero_classes }        [Lemma DF, as the DAG's proof paragraph]
```

`out_arc_classify`, `switch_preimage_8_gamma`, `in_sector_del_preimage` and `in_sector_switch_r_preimage` share the
parent `choke_state`/`sector_mem` but are independent of each other (verified acyclic and weakly connected to the
single sink `lemma_DF` by `scratchpad/c3-T3/sector_out_bridge.py:check_DAG()` — `ok_acyclic: true`,
`ok_connected: true`; see `## Replay`).

### Node-by-node statement shapes and proofs

**`sector_mem`.**
```lean
def isSectorMember (m : ℕ) (B : Finset (Fin (17*m+3))) : Prop :=
  cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B
```
If `(cbGraph m).IsIndepSet (B : Set _)` also holds, `cbVertex m 1 ∉ B` and `∀ i < m, cbVertex m (3+17*i) ∉ B`
follow at once from `cbGraph_adj_r_s`, `cbGraph_adj_s_v`, `cbGraph_adj_r_choke` (C1-LA2 entries 38–40, cited): `r`
is adjacent to both, and `B` independent with `r ∈ B` excludes every neighbour of `r`. This is exactly
SEMANTIC-CONTRACT §2's remark "`r ∈ B` excludes `s` and every `u_i`" — stated here as a two-line consequence rather
than folded into the sector definition, so `isSectorMember` stays a definition (not a package of three conjuncts)
and the exclusion is a separate, cheap lemma for a formalizer to discharge with `omega`/`cbGraph_adj_iff_val`.

**`choke_state`.**
```lean
noncomputable def chokeState (m : ℕ) (B : Finset (Fin (17*m+3))) (i : Fin m) : ℕ × ℕ :=
  ( (Finset.univ.filter (fun j : Fin 8 => cbVertex m (3+17*i.val+1+2*j.val) ∈ B)).card,
    (Finset.univ.filter (fun j : Fin 8 => cbVertex m (3+17*i.val+2+2*j.val) ∈ B)).card )
```
`(chokeState m B i).1 + (chokeState m B i).2 ≤ 8` for `B` independent (a leg cannot be both `b` and `c` in `B`:
`cbGraph_adj_support_leaf`, entry 42, makes them adjacent), giving the `State8` bound (C1-LA1 entry 1) for free —
`chokeState` is exactly the bridge from a literal `B` to a `State8` index.

**`out_arc_classify` (Fact 1 of SR-C2-3's registration text, restated for `transportRel`).** For `B` a sector
source (`isSectorMember`, independent, `|B| = p*+1`), the literal `(D) ∪ (S)` images of `B` are exactly:
1. `K` leg-deletions (image in-sector: `B \ {leg}` still has `r, v ∈` it), where `K = |B| - 2`;
2. the deletion of `r` (image is `r`-free, no choke — `s` and every `u_i` are still excluded from `B \ {r}`,
   vacuously, since they were never in `B`; the image just drops `r`);
3. the deletion of `v`;
4. the switch at `s`: `N(s) = {r, v} ⊆ B` always (both are hypotheses of `isSectorMember`), so
   `|N(s) ∩ B| = 2` always holds and the switch always exists, image `(B \ {r,v}) ∪ {s}`;
5. for every choke `i` with `chokeState m B i = (1, γ)` (`γ` arbitrary), the switch at `u_i`:
   `N(u_i) = {r} ∪ {b_{i,j} : j < 8}` (`mem_neighborFinset_choke_iff`, entry 75, cited), so
   `|N(u_i) ∩ B| = 1 + β_i` (the `1` from `r ∈ B`) `= 2` iff `β_i = 1`. Image `(B \ {r, b_{i,j₀}}) ∪ {u_i}` for the
   unique `b`-leg `j₀` at choke `i`: `r`-free, exactly one choke, weight `γ`.

**No other switch exists.** For `u = b_{i,j} ∉ B`: `N(b_{i,j}) = {u_i, c_{i,j}}` (`cbGraph_adj_choke_support`,
`cbGraph_adj_support_leaf`); `u_i ∉ B` always (sector sources contain no choke), so `|N(b_{i,j}) ∩ B| ≤ 1`
(only `c_{i,j}` can contribute, and only if that leg is in state `c`) — never `2`. For `u = c_{i,j} ∉ B`:
`N(c_{i,j}) = {b_{i,j}}`, a singleton — `|N(c_{i,j}) ∩ B| ≤ 1` — never `2`. Every other vertex is `r`, `v`, `s`, or a
choke, and `s`, chokes are excluded from being switch *sources* only in the sense that a switch requires `u ∉ B`;
`r, v ∈ B` are not candidates either. This exhausts `V \ B`. **Verified independently of the written argument** by
direct enumeration over the full vertex set of the literal `CB(8,107)` graph (`n = 1822`) at the class fixed point
`p* = 572`, `K = 571` (`## Replay`, check A): the count of "bad" leg vertices with `|N ∩ B| = 2` is exactly `0`, and
the total image count matches `K + 3 + #\{i : β_i = 1\}` exactly (`575` for the tested profile, `β_1$-count = 1`).

**`target_distinct`.** The `K` leg-deletion images are pairwise distinct (they differ in which leg vertex is
present); each differs from the `r`-deletion (which alone lacks `r` among... — direct: the `r`-deletion image is
the only one missing `r` while retaining every leg and `v`; unique by that signature) and from the `v`-deletion
(symmetric) and from the `s`-switch image (the only one containing `s`) and from every `u_i`-switch image (the only
ones containing a choke vertex, one each, distinguished by which `i`). Formally this is an injectivity argument on
the index `(i, j, kind)` (`kind ∈ {leg-del, r-del, v-del, s-switch, u-switch}`) into `Finset (Fin (17m+3))`, provable
by `Finset.ext`/`decide`-style case splits once `cbVertex_val`/`eq_cbVertex_iff` (C1-LA2, cited) are in scope — no
new mathematical content beyond "these five classes of sets differ in an easily nameable membership fact", but this
is precisely the fact a formalizer needs stated, not re-discovered, before attempting `Finset.card` arithmetic on
`indepFamily`. **Verified independently on the m = 107 instance**: `len(set(targets)) == len(targets)` over all 575
images (`## Replay`, check A, `ok_distinct: true`).

**`g_sec_def` (the requested definition of `g_sec` on literal pairs).**
```lean
noncomputable def g_sec (m : ℕ) (B A : Finset (Fin (17*m+3))) : ℚ :=
  if h : isSectorMember m B ∧ (cbGraph m).IsIndepSet (B : Set _) then
    -- classify A by which of the five out_arc_classify cases produced it (well-defined by target_distinct)
    if leg-deletion at (i, kind=b) then cb8Pb m (chokeState m B i)
    else if leg-deletion at (i, kind=c) then cb8Pc m (chokeState m B i)
    else if switch-at (u i) with (chokeState m B i).1 = 1 then cb8Sigma m (chokeState m B i).2
    else 0   -- r-deletion, v-deletion, s-switch, or A not an image of B at all
  else 0
```
`target_distinct` is exactly what makes the nested `if`s well-defined (a total function of `A`, not a relation that
could disagree with itself on a shared target) — this is the DAG edge `target_distinct → g_sec_def` drawn above.

**`out_bridge_sum` (THE OUT BRIDGE).** By `g_sec_def`'s case split and `Finset.sum` over the (now known, distinct)
image set from `out_arc_classify`:
```
Σ_A g_sec m B A = Σ_{legs (i,b)} cb8Pb m (chokeState m B i) + Σ_{legs (i,c)} cb8Pc m (chokeState m B i)
                + Σ_{i : β_i=1} cb8Sigma m (chokeState m B i).2
                = Σ_i [ β_i · cb8Pb m (β_i,γ_i) + γ_i · cb8Pc m (β_i,γ_i) + (if β_i=1∧γ_i≥1 then cb8Sigma m γ_i else 0) ]
                = Σ_i cb8Out m (chokeState m B i)                                    (unfolding cb8Out, entry 9)
```
the middle step regroups the `K` leg-arcs by which choke they belong to (`β_i` many at weight `cb8Pb(β_i,γ_i)` each,
`γ_i` many at weight `cb8Pc(β_i,γ_i)` each, since every leg at the same choke shares its choke's `(β,γ)` state) —
this regrouping is exactly `cb8Out`'s own definition (entry 9: `Out m s := β·pb + γ·pc + [...]·σ`), so the bridge is
literally "unfold `cb8Out` at each choke and re-sum by choke instead of by leg", once `target_distinct` licenses
treating `g_sec` as a genuine sum over `A` rather than a relation. **Verified on two independent sides** at the
class fixed point `m = 107`, `K = 571` (check C): side 1 enumerates the literal images and sums `g_sec` by the
classification above; side 2 evaluates `Σ_i cb8Out(107, chokeState_i)` from the closed-form template directly (its
own independent unfolding of `cb8Pb`/`cb8Pc`/`cb8Sigma`/`cb8Bpb`/`cb8Bpc`/`cb8CGamma`/`cb8Theta`, re-implemented from
the cited Lean fragments, not copied from any prior seat's script). Both sides compute the exact rational
`1532715/1532386`. Equal.

**`switch_preimage_8_gamma`.** For `A` an in-sector-adjacent switch image (`r ∉ A`, `s ∉ A`, `v ∈ A`, exactly one
choke `u_i ∈ A` with no `b`-leg there and `γ` private leaves, `0 ≤ γ ≤ 7`): a sector preimage `B'` with
`transportRel(B', A)` via the switch branch at `u = u_i` needs `u_i ∉ B'`, `|N(u_i) ∩ B'| = 2`,
`A = (B' \ N(u_i)) ∪ \{u_i\}`, i.e. `B' = (A \ \{u_i\}) ∪ S` for a 2-subset `S ⊆ N(u_i) \setminus A`,
`N(u_i) = \{r\} ∪ \{b_{i,j} : j < 8\}`; only `S = \{r, b_{i,j}\}` for an *empty* leg `j` (one of `A`'s
`8 - γ` empty legs at choke `i`) yields an independent `B'` containing `r`: taking `S = \{r, b_{i,j}\}` with leg `j`
occupied by `c_{i,j} \in A` would make `b_{i,j}` adjacent to `c_{i,j} \in B'`, breaking independence; taking
`S` without `r` gives a preimage that is not a sector source (fails `isSectorMember`'s witness for this key, since
we specifically want the *sector* preimages feeding `g_sec`). Bijection: empty leg `j ↦ (A \ \{u_i\}) ∪ \{r,
b_{i,j}\}`; exactly `8 - γ` of them. **Verified independently by full brute-force enumeration** (every candidate
insertion vertex tested against the literal `transportRel` definition, not against this argument's own shape) at
`m = 2, 3` for every `γ ∈ \{0,...,7\}`: 16 rows, `got == expected == 8-γ` and the preimage *set* equals the
predicted `\{(A \setminus \{u_i\}) \cup \{r, b_{i,j}\} : j \text{ empty}\}` exactly, in all 16 rows (`## Replay`,
check B, `ok_count`/`ok_shape` all `true`).

**`in_sector_del_preimage`.** For `A` an in-sector target, a deletion-preimage `B' = A ∪ \{q\}` (`q ∉ A`) is
independent iff `q ∉ N(x)` for every `x ∈ A`; since `r, v ∈ A`, `q ∉ \{s\} ∪ \{u_i : i<m\}` is forced
(`N(r) = \{s\}∪\{u_i\}`), so `q` is a leg vertex; `q = b_{i,j}` is valid iff leg `j` at choke `i` is empty in `A`
(else `q` is adjacent to `c_{i,j} \in A}`, or `u_i`'s absence is irrelevant since `u_i ∉ A}$ always); symmetrically
for `q = c_{i,j}`. So the deletion-preimages are exactly `A ∪ \{b_{i,j}\}` and `A ∪ \{c_{i,j}\}}` over the
`8 - β_i - γ_i` empty legs of every choke `i`, and every one of them is again a sector source (contains `r, v`).
**Verified by brute force** at `m = 2, 3` on an explicit in-sector target with one occupied choke (`(β,γ)=(1,2)`)
and the rest empty: predicted count `2 × [(8-1-2) + 8(m-1)]` matched the brute-force count exactly at both `m`
(`26` at `m=2`, `42` at `m=3`; `## Replay`, check B, case `B2`, `ok_del: true` both rows), and every deletion
preimage found contained both `r` and `v` (`all_del_are_sector_sources: true`).

**`in_sector_switch_r_preimage`.** A switch-preimage of `A` via `u = r` needs a 2-subset `S ⊆ N(r) \setminus A`
with `B' = (A \setminus \{r\}) \cup S` independent. `N(r) = \{s\} \cup \{u_i : i<m\}`; `s \notin B'` is forced
(`s` is adjacent to `v \in A \setminus \{r\} \subseteq B'`), so `S` must be a 2-subset of `\{u_i : i<m\}`; adding
`u_i` to `B'` is independence-safe iff no `b`-leg of choke `i` is in `A` (`u_i` is adjacent to every `b_{i,j}`, and
to `r`, which is not in `B'`). Writing `z := \#\{i : \text{choke } i \text{ has no } b\text{-leg in } A\}}`, the
valid `S` are exactly the `\binom{z}{2}` pairs of such chokes. **Verified by brute force** at `m = 2` (`z=1`,
predicted `\binom{1}{2}=0`, got `0`) and `m = 3` (`z=2`, predicted `\binom{2}{2}=1`, got `1`), on the same target `A`
used for `in_sector_del_preimage` (`## Replay`, check B, case `B2`, `ok_sw: true` both rows).

**`in_bridge_zero_classes` (THE IN BRIDGE).** Combining the three nodes above with E1's criterion flow
(cited, `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, not re-derived here): the
non-sector `u = r` two-for-one arcs never touch a sector target (E1 loads only `r`-free, `≥1`-choke targets, and a
sector target has `r` in it by definition — a category mismatch, not a cancellation); the `u = s` switch out of a
sector source carries weight `0` by `g_sec_def`'s classification (it is the "deletion of `r,v` / switch at `s`"
branch); a switch target at state `(1, 0)` (i.e. `γ = 0`) carries `g_sec`-weight `0` at its *source* side by
`g_sec_def`'s `cb8Sigma m 0 = 0` (the `cb8CGamma` table has no `0`-entry, defaulting to `0` — entry 4, `| _ => 0`)
even though `switch_preimage_8_gamma` still gives it `8` sector preimages; so all three named zero-flow classes are
zero for the stated reasons, and — by `in_sector_del_preimage` (only sector deletions feed an in-sector target
through `g_sec`) and `in_sector_switch_r_preimage` (the only other literal preimages of an in-sector target carry no
`g_sec`-flow, since `g_sec` is a function of `(B,A)` pairs with `B` a *sector* source and these preimages are
non-sector, containing two chokes and no `r`) — the *only* class doubly fed (by both `g_sec`'s In-side accounting
and E1) is exactly the `u_i`-switch images of weight `γ \in [1,7]`, matching Lemma DF clause 4 verbatim.

**`lemma_DF`.** The written proof paragraph combining `out_bridge_sum` and `in_bridge_zero_classes` is, clause for
clause, SR-C2-3's registration text (already `proved_informal`, second-read-confirmed, cited above; reproduced
under fair-use citation in `sources/c2-results/second-reads/SR-C2-3/SECOND-READ.md`, digest-verified). This route's
contribution is not a new proof of that paragraph but its re-expression as the twelve-node DAG above, in exactly
the vocabulary (`cbGraph`, `cbVertex`, `transportRel`, `activeWeight`, `indepFamily`, `State8`, `cb8Out`, `cb8In`,
`cb8Pb`, `cb8Pc`, `cb8Sigma`) that C1-LA1/C1-LA2 already fixed, plus one node (`out_bridge_sum`) proved and checked
independently rather than only cited, satisfying the route's "Could close" bar: *"U-B's informal DAG closed at
statement granularity with the Out bridge proved in scratch."*

## Grades

| Item | Grade | Note |
|---|---|---|
| `sector_mem`, `choke_state`, `g_sec_def` (definitions) | no grade (definitions are not graded; SOLUTION-CONTRACT §4) | new statement shapes, not compiled |
| `out_arc_classify`, `target_distinct` | inherits `proved_informal` from Lemma DF (SR-C2-3 Fact 1); this route's restatement + independent scratch check adds no grade of its own (compiled scratch has no grade until a governed award closes, and this is not even compiled) | scratch check: `bounded_computation`, sanity only, `m=107` one profile |
| `out_bridge_sum` (the Out bridge) | inherits `proved_informal` (the written general argument above is a restatement of Lemma DF's clause 4 reasoning specialized to the `g_sec`/`cb8Out` vocabulary); scratch verification `bounded_computation`, sanity only, one profile at the class fixed point `m=107` | THE requested "Out bridge proved in scratch" deliverable |
| `switch_preimage_8_gamma`, `in_sector_del_preimage`, `in_sector_switch_r_preimage`, `in_bridge_zero_classes` | inherits `proved_informal` from Lemma DF; scratch checks `bounded_computation`, sanity only, `m=2,3`, several profiles each | |
| `lemma_DF` (as written here) | `proved_informal` (inherited; no grade transfer to the underlying key, matching SR-C2-3 finding 7) | |
| DAG acyclicity/connectivity | `bounded_computation` (a finite, fully-checked graph property of 12 named nodes — not a sampled claim, but not itself a mathematical theorem either) | |

No template failure, no refutation, no record correction, no conjecture is introduced. `E993-TREE-REAL-ROOTED`
stays REFUTED (untouched); (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER, governed beta and
Erdős #993 stay OPEN (untouched, no status transfer — SOLUTION-CONTRACT fence 1).

No `x`/`Δ_k` index-of-record row is reported by this route (T3's object is the sector-arc DAG, not eligibility or
the first-descent index); the "`x` and `Δ_k` with the difference index on every row" requirement of the deliverable
spec is not triggered here, consistent with F1's fidelity scope (eligibility statements) not overlapping T3's.

## Registered gate lines (ruling 21 schema, replacing ruling 14)

- `COND4_formal: not_advanced` — this route compiled no Lean; conjunct 4 (the saturating flow on `cbGraph m` in
  Lean) is U1/U2's object, not T3's. Cycle 2's lesson binds here explicitly: a T-route's "`advanced`" claim on this
  line was struck by the Cycle 2 T adjudicator for exactly this reason (infrastructure/scratch progress is not a
  formal advance on the Lean gate line). This route's DAG and Out-bridge proof are upstream input for U1/U2, named
  under `## Remaining obligation` below, not claimed as `COND4_formal` progress.
- `E1_formal: not_advanced` — E1's flow (T1/T2/U2's object) is cited here, not touched.
- `TERMINAL_integration: not_advanced` — U3's object; untouched.
- `cut_candidate: none` — no deficient cut found or suggested; every structural claim checked in `## Replay`
  passed with 0 failures, consistent with (not evidence for) the existing `proved_informal` grade of Lemma DF.

`headline_resolved: no`

**Route verdict: `compiled`** — the deliverable is a statement-granularity Lean-ready DAG plus an independently
proved-and-checked Out bridge, i.e. compiled *scratch* (per SOLUTION-CONTRACT §4, ungraded until a governed award
closes); no new theorem is proved, no Lean was built, no cut was found. This is not `proved` (nothing new is
established at a citable grade), not `proved_conditional` (there is no stated hypothesis this route's own claim is
conditioned on beyond what Lemma DF already carries), not `refuted`, and not `bounded_evidence` alone (the written
general derivation, not just the sampled checks, is the primary content, matching the route's own "Could close"
language of a DAG "closed at statement granularity" rather than a numerically-bounded claim).

## Remaining obligation (successor inheritance)

For U1 (`FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`) and U2 (`FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`), or their
Cycle 4 successors if Cycle 3 does not close conjunct 4:
1. Compile `sector_mem`, `choke_state`, `out_arc_classify`, `target_distinct`, `g_sec_def`, `out_bridge_sum` in
   that dependency order as actual Lean declarations in `E993Transport`, carrying `cbGraph`/`cbVertex`/
   `transportRel`/`activeWeight`/`indepFamily`/`State8`/`cb8Out`/`cb8Pb`/`cb8Pc`/`cb8Sigma` byte-identically from
   C1-LA1/C1-LA2 (gate ruling 19). `out_arc_classify`'s "no other switch exists" clause is the two-line `omega`
   argument given above (`mem_neighborFinset_choke_iff`/`mem_neighborFinset_root_iff` already carry the needed
   neighbourhood facts) — the smallest non-trivial proof obligation in the DAG.
2. Compile `switch_preimage_8_gamma`, `in_sector_del_preimage`, `in_sector_switch_r_preimage`,
   `in_bridge_zero_classes` — needed for the In side of `IsSaturatingFlow`/`WeightedHall` (C1-LA2 entries 20–21),
   not yet needed for the Out side alone.
3. `lemma_DF` itself, once both bridges are Lean declarations, is the conjunction U1's object names as its
   "Could close" bar: *"conjunct 4 ⇐ E1 ∧ favorability"* — U1 still needs the rational-to-integral step (U2 Part A,
   already compiled scratch, no grade) and the composition with E1's flow (T1/T2's object) to reach conjunct 4
   itself; this route's DAG does not by itself discharge conjunct 4.
4. This route used only ONE explicit literal profile at `m = 107` for the Out-bridge numeric check (check C) and
   small-`m` structural sampling (`m=2,3`, check B); a successor wanting stronger sanity before a Lean attempt could
   extend check C to the `m = 110, 113` fresh rows (gate ruling 17) with a second, differently-shaped profile,
   though this is optional — the written general argument, not the sampled check, is what a Lean proof would
   actually formalize.
5. No cut candidate, no template failure, no refuted mechanism was found or is suspected in this route's object.

## Replay

Copy-out-first replay command (target is this route's replay scratch directory, never `/tmp`):
```
cp scratchpad/c3-T3/sector_out_bridge.py scratchpad/c3-T3-replay/sector_out_bridge.py
cd scratchpad/c3-T3-replay && python3 -B sector_out_bridge.py > REPLAY-OUT.json
```
Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`.

Executed in the foreground both at authoring time and at replay time (no detached/background job; nothing to kill).
Deterministic: no wall-clock, PID or host field is written to the JSON output.

| Artifact | SHA-256 |
|---|---|
| `scratchpad/c3-T3/sector_out_bridge.py` (generator) | `2f996ad1851debdfda54fc1721646e1a16572f36110ed41b286e919e5fa09e63` |
| `scratchpad/c3-T3/OUT.json` (authoring-time output) | `90646e87cf8fec24d293ab461c2090735fb0d3cff552553be1298f07b74b4964` |
| `scratchpad/c3-T3-replay/sector_out_bridge.py` (copied) | `2f996ad1851debdfda54fc1721646e1a16572f36110ed41b286e919e5fa09e63` (identical) |
| `scratchpad/c3-T3-replay/REPLAY-OUT.json` (replay output) | `90646e87cf8fec24d293ab461c2090735fb0d3cff552553be1298f07b74b4964` (identical — byte-for-byte match confirmed with `diff`) |

`all_pass: true` across all four checks (`check_A_fact1_distinctness_m107`, `check_B_preimage_counts_m2_m3`,
`check_C_out_bridge_identity_m107`, `check_DAG_acyclic_connected`); 0 failing rows in any check. Full JSON output
is in the two files above (identical); key numbers: check A on `CB(8,107)` at `K=571` found `575` total images
(`571` leg-deletions `+ 1` r-deletion `+ 1` v-deletion `+ 1` s-switch `+ 1` u-switch, matching
`K + 3 + \#\{β_i=1\} = 571+3+1`), all distinct, 0 illegal switch candidates out of every leg vertex at the graph;
check B's 16 `γ`-rows (`m=2,3`, `γ=0..7`) all matched `8-γ` exactly with the exact predicted preimage sets, and both
`m`'s in-sector-target rows matched the deletion count and the `C(z,2)` switch-at-`r` count exactly; check C found
the literal and template sides of the Out bridge equal at `1532715/1532386` (exact `Fraction`, `m=107`); check D
confirmed the 12-node DAG above is acyclic and weakly connected to its single sink.

No background job was started; nothing was killed. Lean was not invoked (no `lake`/`lean` command in this route);
no Mathlib symlink was needed.
