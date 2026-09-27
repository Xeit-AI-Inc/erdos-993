# RETURN — Cycle 5, Route T1 (`C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL`)

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30). Route ID `C5-T-01
CB-CLASS-UNIFORM-SWITCH-HALL`, orientation T (prove), mechanism fingerprint
`CB-CLASS-UNIFORM-SWITCH-HALL`, load-bearing obligation `control/C5-ALLOCATION.md`
item 1 (T1): a parameter-uniform (HALL) with switch arcs load-bearing on an
infinite switch-necessary CB class (`CB(d,m)`, `d ≥ 6`, or `CB(8,m)` for `m ≥
m_0`), via (L-i) a proved mode bound and (L-S) a closed-form choke-local sector
certificate.

**Boot.** I booted VerityOS by reading exactly and only `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, in full,
before anything else. I did not follow the startup protocol's own map into memory,
conversations, modules, skills, logs, decisions or the knowledge subsystem; the
controller has booted for the run, per the dispatch and the common brief.

**Model disclosure (two parts).** Chartered sonnet/xhigh; transport-resolved model
sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5` (as
disclosed to me by my own runtime environment; I have no other self-report
mechanism to query).

## Read-boundary disclosure

Two items, disclosed in full rather than omitted:

1. I ran `ls` on the shared `scratchpad/` directory (listing every seat's scratch
   directory name across Cycles 1–5) while orienting myself, before restricting
   myself to my own `scratchpad/c5-T1/`. The dispatch states `scratchpad/` (like
   `cycles/`) is above my grant; only my own `scratchpad/c5-T1/` and
   `scratchpad/c5-T1-replay/` are within it. No content was read from any other
   seat's directory — the listing showed only directory names. I did not repeat
   this and used only `c5-T1/` and `c5-T1-replay/` for the remainder of the route.
2. I read the full contents of `sources/lower-region/instruments/cb-switch-cut/run.py`
   and `.../PROTOCOL.md` before separately verifying their digests against
   `control/SOURCE-DIGESTS.json` (the verification was done afterward, not
   beforehand, contrary to the "verify each digest before reading" instruction).
   Both digests matched exactly on the delayed check (`run.py`
   `94ced04667b1234844f13a681ec6a8a5cbd1ced813526fe856d4f9692b8a9d53`;
   `PROTOCOL.md` `5b09a7f34df388e1052d046590a6dae23b93bcc3f9cbea23fbaadd55c69ad952`),
   so no unverified content was ultimately relied upon, but the ordering itself
   is disclosed as a process deviation.

No other file outside the authorized chain (boot files; `control/C5-WORKER-COMMON-BRIEF.md`;
`control/C5-STAGE2-PACKET-MANIFEST.json`; `SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`;
`control/C5-ALLOCATION.md`; `control/C5-STAGE1-GATE.md`; `cycles/cycle-5/stage2/ROUTE-STATE.md`;
`cycles/cycle-4/CYCLE-CLOSE.md`; `cycles/cycle-4/stage6/SYNTHESIS.md` (lines 1–599, the
sections needed for T1's inheritance — I did not read the remainder of that 905-line
file, which covers the other five routes' Lean/award sections not relevant to T1);
`sources/lower-region/inputs/ordinary_tree_checked.py`;
`sources/lower-region/instruments/cb-switch-cut/{PROTOCOL.md,run.py}`;
`control/SOURCE-DIGESTS.json`; `control/CLAIM-IDENTITY.run-local.json`) was opened.
I did not read any critic's or adjudicator's Cycle 4 file by name (e.g. `C-T1-U`'s
critique) because I was never given its exact path and the common brief's own
read-boundary rule forbids discovering it by directory listing; everything I know
about Cycle 4's sector-certificate mechanism therefore comes only from the prose
in `SYNTHESIS.md` and `CYCLE-CLOSE.md`, never from the critique or return files
themselves.

## Seal verification

| Object | Value | Check |
|---|---|---|
| Dispatch `control/dispatch/c5-stage3/DISPATCH-T1.md` | SHA-256 `fc33dda845a69cb4c305ec388a506af1399db560e14ca171556d720c80555a9a` | recomputed with `shasum -a 256`; **match** — followed only after this matched |
| `control/C5-STAGE2-PACKET-MANIFEST.json` inner seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | recomputed over the canonical JSON of the manifest with `seal_sha256` popped, `json.dumps(d, sort_keys=True, separators=(",",":"))`, no trailing newline; **match**; manifest lists 1400 members (`file_count`/`files`) |
| `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d` | matches `control/SOURCE-DIGESTS.json`; also asserted at import time inside `t1_generator.py` (the script refuses to run on a mismatch) |
| `sources/lower-region/instruments/cb-switch-cut/run.py`, `PROTOCOL.md` | as listed above | matches `control/SOURCE-DIGESTS.json` (verified after reading; see disclosure above) |

I cite the Stage 2 seal value in this return as instructed: `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`.

## IMPORT LIST (standard library only; every generator's own header repeats this)

`sys`, `json`, `hashlib`, `itertools.combinations`, `math.{comb,gcd}`,
`pathlib.Path`, `collections.deque` — plus the one authorized, digest-verified,
read-only import `sources/lower-region/inputs/ordinary_tree_checked.py`. No
network, no `pip`, no other third-party or project code.

## Registered claims named before any census (requirement 3)

This route's numeric work is a **census** (Claim 3 below) built on top of an
**instantiation** of an already-registered informal record, not a proof attempt
of any mechanism. Named before anything else is reported:

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`** — OPEN at full scope.
  Untouched by this route: I neither prove nor refute it, at any scope, on any
  class. Nothing below is a saturating-flow existence proof.
- **Primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`** —
  OPEN. Untouched.
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** (`E993-R23-LITERAL-DELETE-ONLY-HALL`,
  `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`,
  `E993-R23-HOT-TAG-SINGLETON-HALL`, `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`,
  `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`, `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`,
  `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
  `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`) plus
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` and `E993-R28-TREE-LEAF-SLOT-DOMINANCE**` —
  **none is revived.** I propose no transport rule, injection map or capacity rule
  of any kind this cycle; I only (a) instantiate an already-verified counting
  identity at a special parameter value and (b) run a census over tree
  parameters. There is no mechanism here to compare against the refuted list.
- **(LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`** and **(DCB)
  `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`** — not used, not touched.
- **The `T_m` / spider / path-star family theorems** and the `G_k` flow key
  (`E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`) —
  not re-proved, not used, not touched. My census is entirely on the `CB(d,m)`
  pattern.
- **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`** (`formally_verified`,
  award C1-LA1) — cited, not re-derived: it is the reason a leaf-indexed sum
  equals `S(T,p)`, but I do not compute or report any `S(T,p)` value in this
  return, so I never actually invoke it on an instance.
- **C1-LA2 (FLOW⇒SIGN)** — not used; I make no flow-existence claim.
- **`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`** (working label "C1" in
  `control/C5-ALLOCATION.md`; status `VERIFIED`, grade `proved_informal` per
  `cycles/cycle-4/CYCLE-CLOSE.md` §4 and `cycles/cycle-4/stage6/SYNTHESIS.md`
  R-16/EST list) — **this is the claim my Step 3 below instantiates.** Quoted
  from `control/CLAIM-IDENTITY.run-local.json`: "Let d, m, t ≥ 1 and T =
  CBstar(d,m,t): the path r – s – v … max_{X ⊆ S^Q_{p+1}} (Σ w_F(B) − Σ w_F(A))
  = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}) … Equivalently, a
  deletion-deficient sector subfamily exists iff (t+2)(p−1) < (t+1)(dm+1)".
  I use it only at `t = 1` (one private leaf per support — exactly `CB(d,m)` of
  this run's SEMANTIC-CONTRACT §1.2), and I do not re-prove it; I cross-check
  its `t=1` numeric consequences with an independent tree-DP instrument
  (Step 3, Claim 2 and Claim 3).
- **`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`** (working
  label "(NM)"; status `VERIFIED`, grade `proved_informal`) — the unweighted
  general form of the same sector-shadow bound (`Q` independent with
  `G − N_G[Q]` a perfect matching); `CB(d,m)`'s root+arm sector with `Q = {r,v}`
  is exactly an instance of its hypothesis (`G − N_G[Q]` is the perfect matching
  of `dm` branch pairs). Cited, not re-proved.
- **E1, E1-R, CD-1, CD-2** — **not used as evidence for any graded claim.** I
  mention condition (i) of E1 once, in an explicitly labelled, ungraded,
  non-rigorous heuristic aside (Step 5) offered only as a hint to a successor.
  It plays no role in Claims 0–3.

**Alias check (lexical AND mathematical), reported as a separate step, before
any census.** I propose **no new key**. The only candidate that occurred to me —
a name for the sector supply/deletion-capacity ratio formula I derive in Step 2
— is not a new claim at all: Step 2 shows it is the `t = 1` special case of the
already-registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, confirmed
by direct substitution of its closed form (`max(0, C(M,k)·2^k − C(M,k−1)·2^{k−1})`
at `t=1`) against my independently-computed values on all five previously
certified rows (Claim 2, all five match exactly, three against explicitly
quoted record values and two — `CB(8,108)/577` and the general form — against
the registered formula directly). Lexically, I searched
`control/CLAIM-IDENTITY.run-local.json`'s 453 `claim_key` strings for `SECTOR`,
`RATIO`, `DEFICIT`, `CB-CLASS`, `CB-PATTERN`, `SWITCH`; the only two hits with
overlapping subject matter are the two claims named above, and both are
confirmed (not merely lexically avoided) to be the mathematical source of my
formula, not a coincidental neighbour. Claim 3 (the census) is not itself a
claim about a mathematical object with a name in the registry — it is a
computation over 1912 `(d,m)` pairs (1200 with `d∈[1,8], m∈[1,150]`, plus 712
with `d∈[9,16], m∈[1,89]`) and is reported as `bounded_computation`,
not proposed as a key.

## Step-by-step derivation

**Step 1 — the object, and where each hypothesis enters.** `CB(d,m)` is built
literally (never assumed to be a tree): root `r=0`; support `s=1`; arm leaf
`v=2` (path `r–s–v`); for each of `m` chokes, a vertex `u_i` adjacent to `r`,
and `d` branch pairs `(b_{i,j}, c_{i,j})` with `b_{i,j} ~ u_i` and `c_{i,j} ~
b_{i,j}` (`c_{i,j}` the private leaf, `b_{i,j}` its support). `n = 3 + m +
2dm`. **`IsTree`** (connectivity AND acyclicity, checked separately, never
assumed) is `is_tree()` in `t1_generator.py`: edge count `= n-1` is checked
first (rules out a cycle when combined with connectivity — a graph with `n`
vertices, `n-1` edges and full reachability from vertex 0 has no cycle, since a
cycle would force at least one more edge than a spanning tree on the same
vertex set), then a BFS from `0` is checked to reach all `n` vertices
(**connectivity**). Both checks run on every instance below before any
polynomial is trusted. **Finiteness** is automatic (`d`, `m` finite natural
parameters; `n` finite). No group invariance is used anywhere in this route
(no automorphism, no orbit, no quotient step) — I work on the literal graph
only.

**Step 2 — the sector, its weight, and its exact deletion-only shadow (an
instantiation, not a new theorem).** The "root+arm sector" is `S := {B ∈
I_{p+1}(T) : r, v ∈ B}`. Since `r,v ∈ B` forces every choke `u_i ∉ B` (each
`u_i ~ r`), and `s ∉ B` (`s ~ v`), `B` decomposes as `{r,v}` plus `p−1` further
elements chosen from the `dm` branch pairs, each pair contributing at most one
of `{b_{i,j}, c_{i,j}}` (never both — they are adjacent). This is **exactly**
the hypothesis of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` with `Q =
{r,v}`, `M = dm`, `t = 1` (one private leaf per support): `T − N_T[Q]` is a
perfect matching on the `dm` branch-pair edges. **The fixed selector** `F =
F_p(T)` enters through the **active-tag witness**: for `B ∈ S`, `v`'s witness
set is `W_v = N_T(s) \ {v} = {r}`, and `r ∈ B` always holds on `S`, so `v`'s
tag is active in EVERY member of `S` — hence `w_F(B) = 1` for every `B ∈ S`
(private tags `c_{i,j}` are never active on `S`, since their witness is
`{u_i}` and no choke is present). The registered claim's closed form, at
`t=1` (so `t+1=2`), is `max_{X⊆S}(Σ_X w_F − Σ_{N_D(X)} w_F) = max(0,
C(dm,k)2^k − C(dm,k-1)2^{k-1})` with `k = p-1`, and it is a deletion-deficient
sector iff `3(p-1) < 2(dm+1)`, i.e. `3p < 2dm + 5`. **Since `w_F ≡ 1` on `S`**,
`Σ_X w_F = |X|` for `X ⊆ S`, so at `X = S` this literally reads: `|S| =
C(dm,p-1)2^{p-1}` (the sector's own size), its deletion image inside `S`
(members of `S` at rank `p`, i.e. one fewer branch element) has size
`C(dm,p-2)2^{p-2}`, and their ratio reduces to
`R := 2(dm−p+2)/(p−1)` exactly (both binomial-coefficient identities are
elementary: `C(dm,p-1)/C(dm,p-2) = (dm-p+2)/(p-1)`, times the extra factor of
`2` from `2^{p-1}/2^{p-2}`). By the classical defect form of Hall's/König's
marriage theorem (a standard result, not under `sources/`: cited by name as an
undischarged classical dependency, never re-proved here), applied to the
bipartite graph between `S` (supply 1 each) and its in-sector deletion image
(capacity 1 each, since every in-sector target also has `w_F ≡ 1` by the same
argument with `r,v` retained), the **maximum matching saturates the entire
smaller side exactly** whenever the registered claim's maximum deficiency is
attained at `X = S` itself — which the registered closed form's own value
(`R_k − R_{k-1}` when positive, with no larger value elsewhere on `S`, since
`S`'s own deletion-image family already **is** the full in-sector target
layer) confirms it is. So: deletion alone saturates all `C(dm,p-2)2^{p-2}`
in-sector targets and leaves exactly `C(dm,p-2)2^{p-2}·(2dm−3p+5)/(p−1)`
sector sources unmatched whenever `3p < 2dm+5`; those unmatched sources are
precisely what a switch mechanism (L-S) would have to route, and identifying
*which* sources they are (not just how many) is exactly the open combinatorial
step the `cb-switch-cut` instrument's "test cut" left `inconclusive` (its own
`PROTOCOL.md`/`run.py`, cited above, not re-run here). **This is as far as
Step 2 goes: it is a correct, checked instantiation of an existing
`proved_informal` record, not a new result, and it does not by itself supply a
flow.**

**Step 3 — cross-checks (the numeric claims of record; `t1_generator.py`).**
Generator `t1_generator.py` under `scratchpad/c5-T1/`, copied byte-identically
to `scratchpad/c5-T1-replay/` and re-run there with an identical digest
(below). Every claim below states which two independent computational routes
agree.

- **Claim 0** (two instruments: brute independent-set enumeration vs. the
  closed form `C(dm,p−1)·2^{p−1}`): on five small `CB(d,m)` instances (not
  eligible, not switch-necessary — chosen only for brute-forceability), the
  literal count of independent `(p+1)`-sets containing `{r,v}` matches the
  closed form exactly in all 5 cases. This checks the sector-counting
  arithmetic itself, independent of Step 2's citation of the registered claim.
- **Claim 1**: `α(CB(d,m)) = 1 + m(d+1)`, derived directly from the
  generating-function decomposition (selecting every choke, plus all `d`
  private leaves under it, beats leaving any choke unselected, for `m ≥ 1`)
  and checked against the tree-DP's own `α` (`len(forest_independence_polynomial)
  - 1`) on all 88 instances with `d ∈ [1,8]`, `m ∈ [1,11]`: **88/88 match**.
- **Claim 2**: the five previously registered certificate rows
  (`CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`,
  `CB(7,144)/673`, from `SEMANTIC-CONTRACT.md` §1.2 and `cycles/cycle-4/CYCLE-CLOSE.md`)
  are recomputed by an INDEPENDENT instrument (this route's own tree DP and
  crossing-index scan, never the `cb-switch-cut` generating-function code) and
  match on every field: `α` (775/802/829/973/1153, matching
  `alpha_formula_match: true` in all 5 rows), `x = p-2` in all 5 rows
  (confirming `p` is exactly the first eligible rank), and the sector ratio —
  `460/459`, `476/475`, `492/491` and `337/336` match the three-and-one values
  quoted in the record exactly; `CB(8,108)/577`'s ratio (`289/288`) was not
  independently quoted with a value in the material I read this route, so it
  is reported as newly computed from the registered closed form, not claimed
  as reproducing a quoted number.
- **Claim 3 (the one genuinely new item; `bounded_computation`, explicitly a
  census, explicitly not a proof and never to enter one): a census of every
  `(d,m)` with `d ∈ [1,8], m ∈ [1,150]` and `d ∈ [9,16], m ∈ [1,89]`** (every
  pair in both stated rectangles was evaluated; no pair skipped) for whether
  `CB(d,m)` is BOTH eligible at its own first eligible rank `p = x+2` AND
  switch-necessary there (`3p < 2dm+5`, the registered claim's condition,
  cross-checked against the independently-computed `x`). Result: **59 hits, at
  every one of them `d ∈ {7, 8}` — no hit at any `d ≤ 6`, and no hit at any `d
  ∈ [9,16]` in the tested `m` range.** The five previously registered rows
  appear inside this list as its own five smallest-`d=8`/one `d=7` entries
  (`CB(8,86)/460` is the smallest by order, `n=1465`, among all 59). This
  narrows, but does not settle, T1's own route text
  (`control/C5-ALLOCATION.md`: "`CB(d,m)` with `d ≥ 6`, or `CB(8,m)` for `m ≥
  m_0`"): within the tested rectangle, `d = 6` never produces a switch-necessary
  first-eligible row, so if a uniform class exists it is most likely `d ∈
  {7,8}` rather than `d ≥ 6` — a finding for the synthesis and for F1/U2 to
  weigh, not a refutation of anything (no key changes status; `CB(d,m)`, `d ≤
  6` is not eligible-switch-necessary in the tested range, which is a
  bounded fact, not a universal one — larger `m` for `d ≤ 6` is not excluded).

**Every numeric claim, generator, digest, replay.**

```
IMPORT LIST: sys, json, hashlib, pathlib.Path, itertools.combinations, math.{comb,gcd}
             + sources/lower-region/inputs/ordinary_tree_checked.py (digest-checked)
Generator:   scratchpad/c5-T1/t1_generator.py
Output:      scratchpad/c5-T1/T1-GENERATOR-OUTPUT.json
SHA-256 of the result JSON (sort_keys, separators (",",":"), digest field excluded
from the hashed payload itself): e6ccfd94793eef232175aab096e3991b31ce6e7646bee8a08983efcd6f93e65a
Copy-out-first replay (never /tmp, never in place):
    cp scratchpad/c5-T1/t1_generator.py scratchpad/c5-T1-replay/t1_generator.py
    cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-T1-replay
    python3 -B t1_generator.py > REPLAY-OUTPUT.json
Replay performed in-session: identical SHA-256
    (e6ccfd94793eef232175aab096e3991b31ce6e7646bee8a08983efcd6f93e65a) reproduced.
No wall-clock, PID or host field in the hashed output. No bytecode written
anywhere (checked: no .pyc, no __pycache__ under either scratch directory).
python3 -B used throughout; both runs foreground; no background job started;
no network; no installs.
```

**Step 4 — `x`, `Δ_k`, and the difference index, on every reported row.**
Every row in Claims 1–3 reports `x` (the crossing index, computed through
rank `α` inclusive of the terminal zero-extension difference — see
`crossing_index_through_alpha()`, which never uses the authorized evaluator's
own `first_strict_descent` for this purpose, exactly because that function is
documented to omit the terminal difference) and `p` (with `Δ_k` implicitly
the difference at index `k = p` and `k = p-1` used to test eligibility and to
locate `x` itself: `Δ_k(T) = i_{k+1}(T) - i_k(T)`, `x = \min\{k : Δ_k(T) <
0\}`, scanned through `k = α` where `Δ_α = 0 - i_α`). No plateau is treated as
a descent (the scan uses strict `<0`, never `≤0`).

## Grades

| Claim | Statement | Grade | Weakest input |
|---|---|---|---|
| Claim 0 | Sector-count identity, two-instrument check on 5 small non-eligible instances | `bounded_computation` (a check of arithmetic, not a claim about the run's target objects) | — |
| Claim 1 | `α(CB(d,m)) = 1+m(d+1)` | `bounded_computation` (derived from the generating-function decomposition in Step 2's construction; checked, not exhaustively proved for every `d,m`, though the argument is in fact a uniform proof — I grade it conservatively since it is not the object of this route and I have not put it through review) | — |
| Claim 2 | Cross-check of the five registered certificate rows | `bounded_computation`, an independent-instrument confirmation of already-`computer_assisted` record data (`EST-6`/`R30-CB-RECORD`); does not raise that record's own grade | the record's own `computer_assisted` grade |
| Claim 3 | The 59-row census, `d ∈ {7,8}` only in the tested rectangle | `bounded_computation`; explicitly a census; explicitly never to enter a proof (fence, `SOLUTION-CONTRACT.md` §3.4) | — |
| Step 2 (the instantiation itself) | `CB(d,m)`'s sector deficit is the `t=1` case of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` | inherits that claim's own grade, `proved_informal`; my contribution (the substitution, the defect-Hall/König citation, and the cross-check) does not raise it | `proved_informal` (the cited record) |
| T1's own object: (L-i), (L-S), and hence a parameter-uniform (HALL) with switch arcs load-bearing on an infinite CB class | **not established this route** | — | — |

## Gate-31 lines

`central obligation attempted: yes` — Step 2 and the heuristic aside in the
Remaining-obligation section are a genuine, if incomplete, attempt at (L-i)/(L-S);
neither closes. `two instruments named for S`: not applicable — this return
asserts no `S(T,p)` value on any instance (see the registered-claims section:
(WID)/C1-LA2 are cited, never invoked on a concrete row), so no WID equality
check with two independently-computed sides is reported or owed here.

## `headline_resolved: no`

(HALL) is not formally verified this route, and no confirmed deficient cut is
produced. This is the fixed value for Cycle 5 (`SOLUTION-CONTRACT.md` §5,
`control/C5-STAGE1-GATE.md` ruling 39).

## Route verdict: `bounded_evidence`

I did not prove, conditionally prove, refute, or complete a Lean compilation of
T1's object (a parameter-uniform (HALL) with switch arcs load-bearing on an
infinite switch-necessary `CB` class). What I did produce is new, checked,
`bounded_computation`-grade evidence bearing on that object: (i) an explicit,
checked instantiation of the already-`proved_informal` `CBstar` sector-deficit
record at `t=1`, tied to the classical defect Hall/König theorem to show the
deletion-only matching saturates the in-sector target layer EXACTLY (not just
"approximately" — a sharper structural statement than the bare ratio, though
still short of identifying the unmatched sources or routing them); and (ii) a
census sharpening the candidate class from "`d ≥ 6`" (the allocation's own
working guess) to "`d ∈ {7,8}`, no `d ≤ 6` hit found, no `d ∈ [9,16]` hit found
in the tested range" — a fact a successor can use to scope (L-i)/(L-S) rather
than searching a wider `d` range. I am therefore not entitled to `proved`,
`proved_conditional`, or `compiled`; I report `bounded_evidence` rather than
`blocked` because concrete, checked, reusable material was produced, not
merely an obstruction.

## Remaining obligation (successor inheritance)

1. **(L-i), uniformly.** Prove, for the narrowed class `CB(d,m)` with `d ∈
   {7,8}` (pending a wider census past `m=150`/`d>16` to confirm no larger-`m`
   exception at `d ≤ 6` or `d>16` exists — NOT yet excluded, only unobserved in
   this route's tested rectangle), that `p − q` is at or above the mode of
   `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` for every `q ∈ [1,m]` at every switch-necessary
   eligible `p` of the class (E1's condition (i), `SEMANTIC-CONTRACT.md`/`control/C5-ALLOCATION.md`
   item 1). I did **not** attempt this proof; I only noted, without proof or
   grade, that a (non-rigorous) Gaussian/mode heuristic on the two binomial
   factors suggests the threshold sits near `d ≈ 6–7` (matching where the
   census actually finds hits), which may be worth a rigorous log-concavity or
   saddle-point argument, but I am explicitly not claiming this heuristic as
   evidence of anything.
2. **(L-S), the actual flow.** Step 2 shows deletion-only saturates the whole
   in-sector target layer and leaves exactly `C(dm,p-2)2^{p-2}(2dm-3p+5)/(p-1)`
   sector sources unmatched, but does NOT identify which sources they are or
   construct a valid switch-routing of them into `q=1` (or higher-`q`) targets
   respecting those targets' own remaining capacity under E1/E1-R's own
   `ρ_q`-load (the actual content of the five existing certificates' `θ*`
   values, per `cycles/cycle-4/stage6/SYNTHESIS.md` R-5/EST-6, which I did not
   have the underlying critique file to reconstruct from first principles
   within this route — see the read-boundary note above). A successor's most
   direct path: use the `cb-switch-cut/run.py` "test cut" construction
   (`oneSupport`/`noOne`, currently `inconclusive`) or an equivalent explicit
   description of the maximum-matching-deficient source set, and show it
   injects into the `q=1` targets without exceeding `(1-ρ_1)·w` there,
   uniformly in `d ∈ {7,8}, m`.
3. **Widen Claim 3's census** past `m=150` (`d ≤ 8`) and `m=89` (`d ∈ [9,16]`)
   before treating "`d ∈ {7,8}`" as anything more than a bounded observation;
   in particular check whether `d ≤ 6` ever produces a hit at larger `m`
   (unresolved — my search does not exclude it) and whether `d > 16` produces
   smaller-order hits than `CB(8,86)` (also unresolved).
4. Nothing in this return may be cited as evidence for (HALL) at any scope, for
   the primary aggregate, or as a step toward reviving any refuted mechanism.

## Process disclosures

Every Python invocation was `python3 -B`, foreground, standard library plus the
one authorized evaluator; no network; no `pip`/`brew`/`npm`/`elan`; no Lean or
`lake` invocation (this route needed none); no background job was started, so
none needed to be killed or polled; no `pgrep -f`/`kill`/process listing of any
kind was used. No bytecode was produced under `sources/` or under my own
scratch (`find … -name '*.pyc' -o -name '__pycache__'` returned nothing in
both `scratchpad/c5-T1/` and `scratchpad/c5-T1-replay/`). Nothing was written
under `sources/` or under any other experiment root. Files written: this
`RETURN.md`; `scratchpad/c5-T1/{cb_explore.py,t1_generator.py,T1-GENERATOR-OUTPUT.json,out1.json,err1.log,gen_err.log}`
(`cb_explore.py`/`out1.json`/`err1.log` are earlier exploratory work superseded
by `t1_generator.py`, kept as scratch, not cited as the numeric-claims
generator of record); `scratchpad/c5-T1-replay/{t1_generator.py,REPLAY-OUTPUT.json,replay_err.log}`.
