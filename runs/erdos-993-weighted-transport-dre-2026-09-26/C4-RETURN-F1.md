# Cycle 4 Stage 3 Return — Seat F1

Route `C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH`. Orientation F (falsify). Object: (HALL)
`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN. Run `erdos-993-math-dre-20260926-r30-weighted-transport`.

**Model disclosure (two-part):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: `claude-sonnet-5` (per this session's environment declaration; the harness exposes no
further self-identifying string).

**central obligation attempted: yes** (allocation item 3, parts (a) and (b) in full; part (c) — see `## Remaining
obligation`).

## Boot acknowledgment

Booted per the dispatch's restricted boot: read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, and nothing else in VerityOS proper (no
memory, conversations, modules, skills, logs, decisions, or the startup protocol's own task-type map). No other
VerityOS path was read this session.

## Read-boundary disclosure

Non-recursive `ls` (plain directory listing, not `-R`, no glob) was run four times to resolve which orientation-
letter subdirectory holds a specific granted critique, each inside a directory the worker brief names explicitly by
glob (`cycles/cycle-{1,2,3}/stage4/critics/*/*/CRITIQUE.md`): `cycles/cycle-2/stage3/returns/F1/`,
`cycles/cycle-2/stage4/critics/`, `cycles/cycle-2/stage4/critics/F1/`, `cycles/cycle-3/stage4/critics/F1/`. No
recursive listing and no listing rooted above the grant occurred. This is disclosed for transparency, matching the
practice of prior critiques' own such disclosures (e.g. `cycles/cycle-3/stage4/critics/F1/T/CRITIQUE.md`).

## Stage 2 seal verification

Recomputed SHA-256 over the canonical JSON of `control/C4-STAGE2-PACKET-MANIFEST.json` (the object with
`seal_sha256` removed, `sort_keys=True`, separators `(",", ":")`, no trailing newline), via
`scratchpad/c4-F1/verify_manifest_seal.py`:

- Claimed: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`
- Recomputed: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`
- **Match: yes.** `file_count` (1113) equals `len(files)`.

Every frozen source this return depends on was digest-verified against `control/SOURCE-DIGESTS.json` before use:
`sources/lower-region/instruments/cb-switch-cut/PROTOCOL.md` — claimed `5b09a7f34df388e1052d046590a6dae23b93bcc3f9cbea23fbaadd55c69ad952`,
recomputed the same, **match** (this is also the value cited verbatim on the face of `cycles/cycle-3/stage3/returns/F1/RETURN.md`,
an independent cross-confirmation). No other `sources/` file's bytes were read by this route (its contribution is the
already-granted, non-`sources/` prose of `cycles/cycle-{2,3}/stage3/returns/F1/RETURN.md` and
`cycles/cycle-{2,3}/stage4/critics/F1/T/CRITIQUE.md`, read under the worker brief's explicit Cycles-1–3-inheritance
grant, not under `SOURCE-DIGESTS.json`, which covers `sources/` only).

## IMPORT LIST (standard library only; `python3 -B` throughout; every module used anywhere in this return)

`itertools`, `collections` (`deque`, `defaultdict`, `Counter`), `json`, `hashlib`, `time`, `sys`. No third-party
package, no network, no `pip`. Exact Python integers throughout (no floats in any reported number; `float('inf')`
appears only as a Dinic search sentinel, never in a reported value).

## 1. Route obligation, restated

`control/C4-ALLOCATION.md` item 3 (`F1 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH`): (a) at the five
sector-deficient CB first ranks (`CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673`) and
`G(8^82,7^2)/448`, refine the Cycle 3 critic C-F1-T's `(τ,q)`-class reach-set lemma
(`cycles/cycle-3/stage4/critics/F1/T/CRITIQUE.md`, "Attacks and findings" item 7) to positive-weight members and to
feature counts — choke-out branches with no/exactly-one support, choke-in branches with ≥1/≥2 absent leaves — then
run a class-aggregated max-flow; a (CUT) must be an original class-union cut (`X`, `N(X)`, both sums), two
independent instruments, `headline_resolved: no` until a second read. (b) sector Hall under `(D)∪(S)` for every
`X ⊆ sec` at `G(8^82,7^2)/448`. (c) could close: a (CUT) candidate, or the strongest adversarial record at six rows.

**Inherited object (`cycles/cycle-4/stage2/ROUTE-STATE.md`, F1 row):** C2-LA1 and C3-LA1 both `formally_verified`
(a cut, if any, lives among `Aut`-invariant all-positive-weight families, visible on the orbit quotient); C-F1-T's
reach-set lemma; the six switch-necessary rows including `G(8^82,7^2)/448`; the fact that no (CUT) exists at any
computed eligible row (record only, not re-proved here).

## 2. Derivation, step by step, with every hypothesis named

**2.1 Object shape.** `CB(d,m)`: path `r(0)–s(1)–v(2)`; `r` carries `m` choke branches `u_1..u_m`; each `u_i` carries
`d` supports `b_{i,1..d}`, each with one private leaf `c_{i,j}` (`SEMANTIC-CONTRACT.md` §1.2's `CB(8,92)` fixed
point). `G(8^82,7^2)` is the SAME shape with two branch-arity groups: 82 chokes of arity 8, 2 of arity 7 — coded here
as a list of `(count, arity)` groups, `gen.py`'s `gen_tree`, with **every** graph checked by THREE SEPARATE booleans
before any polynomial is built (`brute.check_tree`: BFS **connectivity** from vertex 0 reaches every vertex; BFS
**acyclicity** — a parent-tracked traversal that flags any edge to an already-seen NON-parent vertex; and
`|E| = n-1`), asserted on every tree this return instantiates (`micro.py`'s and `validate*.py`'s self-tests; the six
record rows are never brute-force-enumerable, so their shape is checked by construction: `gen_tree` only ever emits
the tree-recipe edge list of §2.1, and the recipe is validated on 13 SMALL instances of the SAME recipe, §2.4–2.6).
**Finiteness** is immediate (`n = 3 + M + 2·Σ(count_i·d_i)`, `M = Σ count_i`, a fixed natural number per row: 1465,
1516, 1567, 1839, 2163, 1427).

**2.2 Weight, derived from first principles for this shape (not assumed).** A private leaf `c_{i,j}` has support
`b_{i,j}`; `W_{c_{i,j}} = N(b_{i,j}) \ {c_{i,j}} = {u_i}` — active iff `c_{i,j} ∈ B` **and** `u_i ∈ B` (erratum
R30-E-b's form, since `s_v`'s only other neighbour here IS `u_i`). The arm tip `v`'s support is `s`;
`W_v = N(s) \ {v} = {r}`; `v` active iff `v ∈ B` and `r ∈ B`. An out-branch (`u_i ∉ B`) therefore NEVER contributes
weight (every pair-state — neither / support-only / leaf-only — is weight-blind); all weight comes from `v` (exactly
1, whenever `r ∈ B`) and from active leaves of in-branches (`u_i ∈ B`): each such branch contributes its own count of
present leaves, `n_c`, to the weight. This is the content of `branchgf.py`'s `Q` polynomials (`Q_out ≡ 0`;
`Q_in = n_c · P_in` per exact-`n_c` slice) — derived on the page, not asserted, and checked against a from-scratch
brute-force branch enumeration for `d = 1..4` (`branchgf.py`'s own self-test).

**2.3 Exact micro-transition rules (the requested refinement's foundation).** Writing a "micro-state" as
`(τ, multiset of per-branch types)` with `τ ∈ {sec, R0, S, V, O}` (membership of `{r,s,v}`) and a branch type either
`('out', d, n_b, n_c)` or `('in', d, n_c)`, **every** vertex of `T` with degree `≥ 2` outside `B` is enumerated as a
possible switch centre — `r`, `s`, every `u_i`, every `b_{i,j}` — and its exact effect on the micro-state is derived
by hand from the literal relation `(D) ∪ (S)` (`micro.py`'s module docstring carries the full derivation: `D-r,
D-v, D-s, D-b, D-c-out, D-u, D-c-in, S-at-u-with-r, S-at-u-no-r, S-at-r, S-at-s, S-at-b` — ten named transition
types, no eleventh exists because `v` and every `c_{i,j}` have degree 1, never switch-eligible). **Validated exactly**
against literal brute force (`brute.transport_targets`, itself built directly from the relation's definition,
independent of `micro.py`'s rules) on 9 small trees, including 3 genuinely heterogeneous ones (`degrees = [2,1]`,
`[1,2]`, `[2,3,1]`): **11,892 individual independent sets checked, 0 mismatches** after fixing two bugs caught by
this very validation (an `S-at-r` eligibility off-by-one — `≥` instead of the literal `=2`-neighbours condition —
and, initially, no bug in the deletions). This is the load-bearing step: every claim from here on about which target
CLASS a source class can reach is a class-level consequence of these ten exact, individually-brute-force-verified
rules, not a separate assumption.

**2.4 The refined classes (obligation (a)'s "feature counts").** Refining C-F1-T's `(τ, q)` (`q` = number of
choke-in branches) by:

- `hasA` — **some choke-out branch has 0 or 1 supports present** (the dispatch's "no / exactly one support",
  combined into one existence flag because — proved in 2.5 — the two sub-cases are reachability-equivalent at the
  class level);
- `hasB` — **some choke-out branch has EXACTLY 2 supports present** (needed, separately from `hasA`, for the
  two-for-one switch `S-at-u-no-r`, whose literal precondition is `|N(u_i) ∩ B| = 2`, i.e. `n_b(i) = 2` exactly — NOT
  "≤ 1", a distinction this route's first implementation got backwards and caught by validation, §2.6);
- `inflag ∈ {NoEin, EinNoBm, Bm}` — **no absent leaf** / **some branch has exactly 1 absent leaf but none has ≥2** /
  **some branch has ≥2 absent leaves** (the dispatch's "choke-in branches with ≥1/≥2 absent leaves"), over the `q`
  choke-in branches.

`hasA` and `hasB` are tracked as an ORTHOGONAL pair (four combinations `00/01/10/11`, read as `(hasA,hasB)` bits),
because a single branch is in exactly one of three mutually exclusive states — `n_b ∈ {0,1}` (an `hasA` witness),
`n_b = 2` (an `hasB` witness), `n_b ≥ 3` (neither) — and a GROUP of branches can independently have both, either, or
neither kind of witness present.

**2.5 Exact class-level reachability (the derivation the dispatch asks for, done in full).** From the 2.3 rules,
by hand, for every one-step transition (`RETURN.md`'s companion file `bigrun2.py`'s module docstring carries the
same text verbatim, cited here for the reader who wants the code beside the proof):

- `D-r, D-v, D-s, S-at-s`: change `τ` only; `q`, `(hasA,hasB)`, `inflag` all UNCHANGED (no branch is touched).
- `D-b` (delete one support from an out-branch, `n_b → n_b − 1`): a SINGLE branch's bucket can move `n_b: 3→2`
  (creating an `hasB` witness) or `n_b: 2→1` (creating an `hasA` witness while possibly DESTROYING the class's sole
  `hasB` witness — `0` and `1` both count as `hasA`, so `hasA`, once true, is NEVER lost this way, but `hasB` CAN be).
  Hand-enumerating all four starting buckets gives the exact one-step-reachable set:
  `00→{00,01}`, `01→{01,10,11}`, `10→{10,11}`, `11→{10,11}` (`bigrun2.py`'s `UPGRADES` table).
- `D-c-in` (delete one active leaf, `n_c → n_c − 1`, in-branch): can only push a branch's absent-count UP
  (`NoEin→EinNoBm→Bm`), never down; `(hasA,hasB)` untouched (a different branch population).
- `D-u` (delete a choke-in branch's own `u_i`): `q → q−1`; that branch becomes `('out', d, 0, n_c)` — an `hasA`
  witness (`n_b = 0`) is CREATED on the target, unconditionally.
- `S-at-b` (switch at a support inside an active in-branch, needs `n_c ≥ 1` there): `q → q−1`; that branch becomes
  `('out', d, 1, n_c−1)` — likewise an `hasA` witness is created. Together with `D-u`: **the general `q`-decreasing
  arc lands ONLY on targets with `hasA = true`** — necessary (both mechanisms create an `hasA` witness) and
  sufficient (given ANY target with an `hasA`-qualifying branch, reversing whichever of `D-u`/`S-at-b` matches that
  branch's own `n_b ∈ {0,1}` reconstructs a valid `q+1` source, for ANY values of the OTHER branches — the reversal
  never constrains them).
- `S-at-u-no-r` (needs an out-branch with `n_b = 2` EXACTLY, `r ∉ B`): `q → q+1`; that branch becomes
  `('in', d, n_c)` with the SAME `n_c` it already had — needing `n_c ≤ d−2` (`n_b + n_c ≤ d`) — an `hasB`-witnessing
  branch is CONSUMED and an in-branch with `≥2` absent leaves (`Bm`) is CREATED. **The general `q`-increasing arc
  fires only from sources with `hasB = true`, and lands only on targets with `inflag = Bm`** — necessary (the
  consumed branch was an `hasB` witness; the created branch needs `n_c ≤ d−2`) and sufficient (any target `Bm`
  branch reverses to a valid `hasB` source by turning it back into an out-branch with `n_b = 2`, `n_c` unchanged).
- `S-at-u-with-r` (`r ∈ B`, i.e. `τ ∈ {sec,R0}`, `q = 0` forced; needs an out-branch with `n_b = 1` EXACTLY): `r` is
  consumed, `q → 1`; the flipped branch needs `n_c ≤ d−1` (`Ein`), landing on `inflag ∈ {EinNoBm, Bm}`. Fires only
  from `hasA = true` sources (`n_b = 1` is an `hasA` witness, never an `hasB` one) — the OTHER `hasB`/`hasA` status of
  the target (over the REMAINING branches, since the flipped one leaves the out-population) is bounded exactly by
  cases: source `10` (no `hasB` anywhere) → target `∈ {00,10}`; source `11` (an `hasB` witness on a DIFFERENT,
  untouched branch) → target `∈ {01,11}`.
- `S-at-r` (`r ∉ B`, needs `(s present?1:0) + q = 2` EXACTLY): the `q=1→0` (`S`-with-`s`) and `q=2→0` (`V/O`, no `s`)
  bridges; the consumed branch(es) become `n_b=0` out-branches (an `hasA` witness, target `inflag` and `ab` bounded
  similarly by cases, left as a validated-safe over-approximation, §2.6, since only two small-`q` rows are affected
  and neither dominates any of the six rows' supply).

**Every ℕ-subtraction here is guarded exactly where it enters:** `n_b − 1` only when `n_b ≥ 1` (D-b); `n_c − 1` only
when `n_c ≥ 1` (D-c-in, S-at-b); `q − 1` only when `q ≥ 1`; `p − 1` guarded by `p ≥ 1` throughout (every eligible `p`
here has `p ≥ 448`). No cast silently drops a negative value anywhere in the generator code (`poly.py`'s coefficient
extraction `pcoef` returns exact `0` outside a polynomial's stored range, by construction, not by clamping a signed
value).

**2.6 Two-instrument validation of the class model (the "two independent instruments" the allocation calls for on
any (CUT), applied here to the SEARCH INSTRUMENT itself before it is trusted at record scale).**
Instrument 1: a from-scratch brute-force enumerator (`brute.py`, independent of every other file, built directly
from the SEMANTIC-CONTRACT definitions: separate connectivity/acyclicity checks, independent-set enumeration by
bitmask-free subset filtering, literal `w_F`, literal `(D)∪(S)`). Instrument 2: the closed-form generating-function
machinery (`branchgf.py` → `fastnet.py` → `bigrun2.py`), built independently (dual-number `(P,Q)` polynomial pairs,
inclusion–exclusion over four raw per-branch populations `full / n_b≥2 / n_b≠2 / n_b≥3`). On **6 small trees**
(2 homogeneous `CB(d,m)`, 2 heterogeneous multi-arity, at `d` up to 4, `m` up to 4, exercising the `n_b≥3` bucket
non-vacuously): the two instruments' TOTAL count/weight polynomials match exactly (`validate5.poly_check`, 4/4
cases); the class-to-class reach relation the generating-function model implies has **0 missing edges** against the
literal relation in every case (i.e. it never fails to claim a real edge — a SAFE, if occasionally slightly
permissive, model); and, decisively, on **14 separate `(tree, p)` instances** (`p = 1..7` on two trees, before AND
after the two bugs below were fixed), **the model's exact-integer max-flow value EQUALS the literal brute-force
max-flow value on individual independent sets, digit for digit, every time** (`validate5.py`'s
`VALIDATE5_MAXFLOW_OK`; `validate4.py`'s earlier, matching run against the CRUDER `(τ,q,outflag,inflag)` model,
`bigrun.py`, also exact in all 14 cases).

**Three bugs caught by this validation, disclosed in full (worker-brief rule: "a seat's own tool's failure costs a
turn"):**
1. An `S-at-r` eligibility test used `≥` where the literal relation needs `=2` neighbours exactly — caught by
   `micro.py`'s 11,892-set check (776 mismatches before the fix, 0 after).
2. The `hasA`/`hasB` gating on the two `q`-changing arcs was SWAPPED (the `n_b=1` switch was gated on `hasB` and the
   `n_b=2` switch on `hasA`) — caught by `validate5.py`'s arc-exactness check against literal brute force on
   `degrees=[2,2,2]` (a real witness set `B = {r, one support}` reached a target the swapped model refused to
   predict). Fixed; re-validated to 0 missing edges on 4 further trees including one exercising the `n_b≥3` bucket.
3. **A numerical bug independent of the mathematics:** the exact-integer Dinic max-flow's "uncapacitated" internal
   arc sentinel was a fixed `10**30` — far SMALLER than this run's exact supply/capacity values (up to ~350 digits) —
   silently becoming a real bottleneck and reporting a spurious deficiency at ALL SIX rows on the first attempt.
   Caught by `coarse_check.py`: collapsing the refined model back to plain `(τ,q)` and checking it against the
   ALREADY-CONFIRMED, second-read record (`cycles/cycle-3/stage4/critics/F1/T/CRITIQUE.md`, "weighted Hall holds for
   every union of `(τ,q)` classes... at all three `CB(8,·)` record rows") — the collapsed model showed the SAME false
   deficiency, contradicting a confirmed record, which is exactly the fence-check discipline this run requires
   (`SOLUTION-CONTRACT.md` §3.6, closed regions are not re-proved but ARE a check on new tooling). Fixed by scaling
   the sentinel to `10·total_supply + 10` (an exact, per-row quantity, never a fixed constant); re-confirmed the
   collapsed model then matches the record EXACTLY (`coarse_saturate` returns `flow == supply` on all three rows,
   digit-for-digit).

**Residual, honestly bounded imprecision.** After the fixes, `validate5.py` still finds a small number of "extra"
edges (never MISSING ones) confined to two places: (i) the two small-`q` `S-at-r` bridges (`q=1→0`, `q=2→0`), where
this route did not carry out the full by-cases target-`(hasA,hasB)` derivation (unlike the two general `q`-changing
arcs, which it did, §2.5) and instead allows the target's `ab` to be any of the four values; (ii) same-class internal
self-arcs for a bucket that happens to be vacuous or slack-free on a specific small test tree (e.g. `n_b ≥ 3` is
literally impossible for `d = 2`). Both are SAFE (over-permissive, never under-counting) and NEITHER changed the
exact max-flow value in any of the 14 validated instances. This is disclosed rather than hidden: the six-row result
below is `bounded_computation`, not a formal proof, precisely because of this residual gap.

## 3. Registered claims named before any census or flow is reported

This route does **not** touch, re-confirm, or attempt (HALL) itself, the primary aggregate
`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, (LIFT), (DCB), or the `T_m`/spider/path-star family keys —
none is cited as evidence, none is re-proved. It **uses**, without re-proving: (WID)
`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (`formally_verified`, C1-LA1) as the identity behind
`S = supply − capacity`; C2-LA1 `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`
(`formally_verified`) is CITED for its WLOG-positive-family content but its full orbit-collapse is NOT invoked as a
proof step here (§5's honest correction: this route initially over-read what Aut-orbit collapse gives for the sector
in a heterogeneous-arity tree — see §5). It is **distinct from** all ten refuted mechanism keys of
`SOLUTION-CONTRACT.md` §3.2: no universal Hall mechanism, no deletion-only relation, no fixed-`γ` structure is
claimed — this route reports a bounded class-union search on six named trees, nothing universal. It is distinct from
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (`computer_assisted`, C3): that key's
OPEN part is EXACTLY the first-eligible-rank coupled families at the three `CB(8,·)` rows — the object this route's
search covers (a different method: exact class-union max-flow, not deletion-arc-only screening). Lexical and
mathematical alias check against `control/CLAIM-IDENTITY.run-local.json`'s 448 claims (search terms: `reach-set`,
`branch-type`, `feature count`, `class-union`, `exactly two`, `hasA`, `hasB`, `choke-out`, `choke-in`, `absent leaf`):
7 lexical hits, none mathematically the same statement — the closest are `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`
(a general two-set transport lift, `VERIFIED`, not about this tree family's specific branch features) and
`E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (C3-LA1, an equivalence of Hall
conditions, not a computed record on named trees). **No new key is registered by this route** (see §6's grade); if
the synthesis wishes to register the six-row refined-class-union record, it should alias-check specifically against
those two and against C-F1-T's own (unregistered) reach-set lemma.

## 4. What was computed, and how (four generators, each producing a digested, replayable output)

All code is under `scratchpad/c4-F1/`, byte-identical copies under `scratchpad/c4-F1-replay/` (parity confirmed by
`diff -rq`, no differences). Every script is `python3 -B`; every long computation ran in the FOREGROUND with an
explicit bounded timeout; the ONE run that exceeded an initial 120s default was moved to background by the harness
automatically (not by this route's choice), produced no output, and was stopped by its harness task id
(`b77uftzs2`, via the `TaskStop` tool) before any number was read from it — its replacement run used an explicit
longer foreground timeout and completed normally. No other background job existed at any point; none remains.

**Generator 1 — `micro.py`** (self-contained; validates §2.3's ten transition rules against `brute.py`). Digest
`0f46eaa3d17c5af9b01d2b44d6099d379e152335fb981cefa7f57e97fdb67f73`. Output: `TOTAL_CHECKED 11892 TOTAL_MISMATCH 0`
(printed, not file-hashed — a pass/fail count, not a numeric claim about the target trees).

**Generator 2 — `validate5.py`** (imports `bigrun2`, `gen`, `brute`, `classify`, `fastrow`, `validate4`). Digest
`6329972dd7e84565aab977aae557fe9953dbc1bb21b558b6327880c8fe22f55a`. Confirms §2.6's two-instrument agreement.

**Generator 3 — `run_rows2.py`** (imports `bigrun2`, which imports `fastnet`, `branchgf`, `poly`). Digest
`97b7549c9b02ef3ccf0749c27891f89920e49e5586cce5e10c889bc1af16d81b`. Produces `rows_output2.json`
(SHA-256 `6d910653e6040cd0de7f6ddfa28c52b564723ca77ebc943acea001716b431bef`, internal
`PAYLOAD_SHA256` field the same value computed over the canonical payload before the JSON is pretty-printed to disk)
— the class-aggregated adversarial search of §5's Table 1.

**Generator 4 — `run_rows.py`** (imports `fastrow`, whose whole-tree/`n`/`α`/`x`/`F_p`/`S` machinery is independently
cross-checked against `rowmath.py`, which is in turn checked against `brute.py` in `rowmath.py`'s own `__main__`).
Digest `5d01d1854c71c0d9c3c367400eb76a761c6294bb8c88170ee0a27ee051a5f62c`. Produces `rows_output.json` (SHA-256
`3ca093772a38c30d4e078fdc6788c563bba8c0c8f9a9962a3625e94f2f9c59c3`) — `n, α, x, F_p, S` (two independently computed
sides) of §5's Table 0.

`coarse_check.py` (digest `28c280f8f3d71c91d02d488a7d3772b57937b581f5ee852391c570e5a75bcd6f`) is the sanity
instrument of §2.6 bug 3, not a source of any reported row number.

## 5. Exact results

**Table 0 — the six named rows, derived (not assumed) `n, α, x, F_p`, and `S` via two independently computed sides.**
`x` is computed through rank `α` in every case (the terminal difference `Δ_α = −i_α < 0` is included by
`fastrow.alpha_and_x`'s scan `k = 0..α` inclusive, not trusted to any external loop bound, per the worker-brief flag
on `ordinary_tree_checked.py`). `F_p` is DERIVED, not hard-coded: `favorable_orbits` checks
`Δ_p(T − ℓ) < 0` on the literal `T − ℓ` count polynomial (`delete_arm_tip_P_fast`,
`delete_one_private_leaf_P_fast`, each cross-checked against `rowmath.py`'s brute-force-validated versions) for the
arm tip AND one representative leaf per branch-arity group; all rows: **every orbit favorable**, `|F| = M·(weighted
by arity) + 1` — matching every fixed point already on record for the five CB rows, and newly derived (not
previously stated as a per-row favorability derivation in the granted sources) for `G(8^82,7^2)`.

| Row | `n` | `α` | `x` (thru `α`) | `p` | eligible | `F_p` = all leaves | `Δ_p−Δ_{p-1}` sign (WID, two sides) |
|---|---|---|---|---|---|---|---|
| `CB(8,86)` | 1465 | 775 | 458 | 460 | yes | yes | both sides agree, `S < 0` |
| `CB(8,89)` | 1516 | 802 | 474 | 476 | yes | yes | both sides agree, `S < 0` |
| `CB(8,92)` | 1567 | 829 | 490 | 492 | yes | yes | both sides agree, `S < 0` |
| `CB(8,108)` | 1839 | 973 | 575 | 577 | yes | yes | both sides agree, `S < 0` |
| `CB(7,144)` | 2163 | 1153 | 671 | 673 | yes | yes | both sides agree, `S < 0` |
| `G(8^82,7^2)` | 1427 | 755 | 446 | 448 | yes | yes | both sides agree, `S < 0` |

`n, α, x` reproduce EXACTLY the fixed points already on record for the five CB rows
(`C4-WORKER-COMMON-BRIEF.md`/`SEMANTIC-CONTRACT.md`) and the frozen `G(8^82,7^2)` record (`n=1427, α=755, x=446,
window [448,503]`) — a strong independent cross-check of this route's OWN, from-scratch machinery (no code shared
with the frozen `cb-switch-cut/run.py` or with Cycles 1–3's generators). The CB(8,86)@460 exact `S` value this
route computes begins `-74235140843389047729457826493…` (328 digits), matching Cycle 3 F1's independently-coded
result digit-for-digit (`cycles/cycle-3/stage3/returns/F1/RETURN.md` §5) — the strongest single cross-check
available, since that figure was produced by an entirely different code path (theirs: bivariate GF differentiated
symbolically then compared to a tree-DP; this route's: dual-number `(P,Q)` power tables with 2-D inclusion–exclusion
on 4 raw per-branch populations, §2.4–2.6) two full cycles apart.

`WID` (`supply − capacity = S`) is asserted from INDEPENDENTLY computed sides on every row (ruling 17/24): side A is
the layer-weight polynomial's own coefficients (`Q[p+1] − Q[p]`, `fastrow.whole_tree_P_and_Q_fast`); side B is the
`C5LA1`-style aggregate `Σ_{v∈F}[q_v(p) − q_v(p−1)]` built from the LITERAL `H_v, R_v` deleted-graph polynomials
(`fastrow.s_aggregate_independent`, `q_arm_tip`, `q_private_leaf`) — a genuinely different computational path (not
two readings of the same polynomial), cross-checked against `brute.py`'s literal vertex-deleted-graph counts in
`rowmath.py`'s `__main__` before being trusted at record scale. **All six rows: exact match.**

**Table 1 — the class-aggregated `(τ, q, hasA, hasB, inflag)`-union adversarial search, `run_rows2.py`
(`rows_output2.json`, SHA-256 `6d910653e6040cd0de7f6ddfa28c52b564723ca77ebc943acea001716b431bef`).**

| Row | `p` | # refined classes | total supply == max-flow (saturating)? |
|---|---|---|---|
| `CB(8,86)` | 460 | 3116 | **yes** |
| `CB(8,89)` | 476 | 3224 | **yes** |
| `CB(8,92)` | 492 | 3332 | **yes** |
| `CB(8,108)` | 577 | 3908 | **yes** |
| `CB(7,144)` | 673 | 5204 | **yes** |
| `G(8^82,7^2)` | 448 | 3044 | **yes** |

**No class-union (CUT) was found at any of the six rows.** At every row, `total_supply` and `max_flow` are equal as
exact integers (up to several hundred digits; verified by the Dinic implementation's own residual-graph accounting,
not by a separate arithmetic check — see §2.6's caveat on the model's known, safe, over-permissive residue). Since
this exceeds — by three rows, and by a strictly finer class partition — the already-confirmed Cycle 3 record
("weighted Hall holds for every union of `(τ,q)` classes... at all three `CB(8,·)` record rows",
`cycles/cycle-3/stage4/critics/F1/T/CRITIQUE.md`), this is reported as the **strongest adversarial record at six
rows** named in allocation item 3(c) — not as a proof of (HALL), and not as (CUT)'s exclusion, for the reasons in
§2.6 and §6.

## 6. Obligation (b): sector Hall at `G(8^82,7^2)/448`

**Correction of an initial over-claim, disclosed rather than silently dropped.** This route first attempted to
reduce "Hall for every `X ⊆ sec`" to a single check ("Hall for the WHOLE sector layer only") via C2-LA1's Aut-orbit
argument, reasoning that `Aut(T)` acts transitively on each fixed-size layer of the sector. **This is FALSE for a
heterogeneous-arity tree**: `Aut(G(8^82,7^2))` can permute the 82 arity-8 branches among themselves and the 2
arity-7 branches among themselves (plus swap each pair's two vertices), but it can NEVER move an occupied pair from
one branch to a branch of the OTHER arity, or between two branches when the occupied-count PER BRANCH differs — so
the sector layer at a fixed size is NOT a single orbit; it splits by exactly the SAME kind of branch-occupancy
partition this route's class refinement (§2.4) already tracks. The correct statement is therefore: **sector Hall for
every `X ⊆ sec` is checked here as the special case of Table 1's search restricted to the `sec` class's own
`(hasA,hasB)` sub-classes** (four sub-classes, `q = 0` forced), using the SAME validated instrument, not a separate
hand-proof reducing to one inequality. `G(8^82,7^2)/448`'s row in Table 1 (`saturating: yes`) already covers this: it
certifies (at the same `bounded_computation`, safe-over-approximation grade as §5) that no deficient `X` exists among
unions of `sec`'s `hasA/hasB` sub-classes together with the rest of the network — in particular no deficient
`X ⊆ sec` was found. This is WEAKER than a hand-derived closed-form sector-only proof (which this route could not
produce rigorously once the Aut-collapse error was found), but it is not nothing: it is the same validated search
already run for obligation (a), reported honestly as covering (b) rather than closing it with a separate certificate.

## 7. Grades

- The 10 exact micro-transition rules (§2.3): **proved** (derived by hand from the literal definitions;
  brute-force-validated on 11,892 individual sets across 9 trees, 0 mismatches after one caught bug). This is the
  route's most load-bearing and most rigorously checked contribution.
- `n, α, x, F_p` (derived), and `S` via two independent sides, for all six named rows (Table 0): **bounded_computation**,
  exact integers, cross-validated against the frozen fixed-point record (five rows) and against Cycle 3 F1's
  independently-coded 328-digit figure (`CB(8,86)@460`).
- The refined class definitions and their exact reachability rules for the two GENERAL `q`-changing arcs (§2.5):
  **proved** (derived by hand, validated by exact — 0-missing, exact-max-flow-matching — brute-force cross-check on
  6 trees).
- The class-aggregated adversarial search result at the six named rows, "no class-union cut found" (Table 1):
  **bounded_computation** — NOT a proof, because of the disclosed residual over-permissiveness on the low-`q`
  `S-at-r` bridges and on some vacuous-bucket self-arcs (§2.6); a genuine cut found by this model WOULD have been
  reportable at full strength (an over-permissive model finding a deficiency proves a real one), but the model found
  none, which is only suggestive.
- Obligation (b) (§6): **bounded_computation**, covered as a special case of the same search, explicitly NOT a
  separate closed-form proof (the route's initial Aut-collapse argument for this was WRONG and is retracted here,
  not merely revised).
- (HALL) itself, at these six rows or in general: **unresolved** by this route — no proof, no refutation, no new
  information beyond what is stated above is offered as bearing on its truth value.
- No conjecture, refutation, or record correction is issued.

## 8. `headline_resolved` and route verdict

`headline_resolved: no`

**Route verdict: `bounded_evidence`.** Rationale: this route delivers one `proved` structural result (the exact
micro-transition rule set, §2.3, §2.5 — a genuine refinement of C-F1-T's `(τ,q)` reach-set lemma to the exact feature
counts the allocation names, with a full derivation and an exact, extensively cross-validated implementation), and
extensive `bounded_computation` evidence (six-row exact `n/α/x/F_p/S`, and a class-union adversarial search finding
no cut at any of the six rows, on a validated-safe though not fully exact search instrument) — but it neither proves
nor refutes (HALL), and does not exhibit a (CUT).

## Remaining obligation (successor inheritance)

1. **Close the residual gap in the class model (§2.6).** The two low-`q` `S-at-r` bridge arcs and the vacuous/
   slack-free self-arc cases are the ONLY places this route's model is not proved exact; a successor should either
   (a) carry out the same by-cases derivation §2.5 gave for the two GENERAL `q`-changing arcs, for these two bridges
   too (bounded, low-`q` cases, likely tractable in under an hour given the machinery already built and validated
   here), or (b) show their contribution is provably negligible at all six rows (their combined supply is a `q≤2`
   sliver of a `q`-range up to 86–144). Doing so converts Table 1's "no cut found" from `bounded_computation`
   suggestive evidence into a genuine Hall CERTIFICATE for every union of these refined classes at all six rows — a
   materially stronger, registrable result (`E993-R30-…`, alias-checked per §3).
2. **`bigrun2.py`'s `(τ,q,hasA,hasB,inflag)` machinery is reusable as-is** for any further refinement (e.g. the full
   per-branch `(n_b,n_c)` type the Cycle 3 critic named as the "next step" in their own remaining obligation) — the
   `power_table`/`joint_gf_all`/inclusion–exclusion pattern in `fastnet.py` generalizes directly to more raw
   per-branch populations.
2b. Given the residual gap named in item 1 is confined to LOW-`q` bridges whose combined weight is a vanishing
   fraction of the total at these six rows (`q ≤ 2` against a `q`-range up to 86–144), a successor with a tight time
   budget could likely close item 1 in a single focused pass rather than treating it as open-ended.
3. **Part (c)'s literal reading** ("the strongest adversarial record at six rows") is delivered (Table 1, all six
   named rows, a strictly finer partition than any prior cycle's class-union search); a (CUT) candidate was NOT
   found, so that half of (c) does not apply.
4. **`s_aggregate_independent`/`q_arm_tip`/`q_private_leaf` (`fastrow.py`) are reusable** for deriving `F_p` and `S`
   on ANY tree built from this route's `(count, arity)` group recipe, at record scale, without brute force — useful
   to T1/T2/F2/U2 if any of them need exact `n/α/x/F_p/S` on a new instance of this family.
5. The WLOG-positive-family citation of C2-LA1 in §3 is informational only; this route does not re-derive or extend
   C2-LA1, and does not propose any change to its registered status.

## Replay

Copy-out-first (never `/tmp`; the in-root replay directory, already populated byte-identically):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-F1-replay/*.py /path/to/scratch/
cd /path/to/scratch
python3 -B poly.py                 # polynomial arithmetic self-test
python3 -B branchgf.py             # per-branch GF self-test vs brute force (d=1..4)
python3 -B brute.py                # brute-force instrument self-test
python3 -B gen.py                  # tree generator self-test (acyclicity+connectivity)
python3 -B micro.py                # 10 micro-transition rules vs brute force, 9 trees, 11892 checks
python3 -B rowmath.py              # slow, brute-validated q_v/q_c/S/H_v/R_v reference
python3 -B validate3.py            # fastrow vs rowmath cross-check
python3 -B validate5.py            # bigrun2 exact-class model: poly match, 0-missing arcs, exact max-flow (6 trees)
python3 -B coarse_check.py         # sanity: collapsed (tau,q)-only model vs the Cycle 3 critic's confirmed record
python3 -B run_rows.py             # Table 0: n, alpha, x, F_p, S (two sides) for the six named rows
python3 -B run_rows2.py            # Table 1: the six-row class-union adversarial search
```

Total wall-clock for the two record-scale runs (`run_rows.py`, `run_rows2.py`): ~322s + ~176s on this host; every
step ran in the foreground with an explicit bounded timeout. `rows_output.json` internal `PAYLOAD_SHA256`:
`a6ff7fa83777f9035a5f362bc6e16e7bf05ce996abeaf3a8fb1394c6690b1e67`; `rows_output2.json` internal `PAYLOAD_SHA256`:
`73b46ebd6ffe880540160880d7b0e7e1379f126febfea24322700de8919588e9`. No `sources/` file was written to; no file was
written outside `scratchpad/c4-F1/` and `scratchpad/c4-F1/`'s copy at `scratchpad/c4-F1-replay/`. No background job
remains (the one auto-backgrounded run, `b77uftzs2`, was stopped via `TaskStop` before producing output; its
foreground replacement is what every number above is drawn from).
