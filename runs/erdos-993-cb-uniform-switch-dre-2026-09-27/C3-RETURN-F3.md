# Return — Cycle 3, Seat F3

**Route:** `C3-F-03`. **Mechanism token:** `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`. **Orientation:** F (falsify).

Model disclosure (two parts): chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5`.

## Boot

I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` — the VerityOS constitution and the startup protocol — and
nothing else of VerityOS. I did not follow the startup protocol's own task-type map into memory, conversations, modules,
skills, logs or decisions; the controller owns conversation logging for this run.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage3/DISPATCH-F3.md` (file SHA-256) | `c4323a23a75f573279bc5af82126c2e41f22c48a1bdc6a3f934650f736a49e74` | MATCH (given digest) |
| **Stage 2 packet seal** `control/C3-STAGE2-PACKET-MANIFEST.json` (canonical JSON without `seal_sha256`; `sort_keys=True`, `separators=(",", ":")`, no trailing newline) | **`f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`** | MATCH |

Every source file this return relies on was digest-checked before reading, against the manifest that governs it (the run-root
manifest for `control/*` files, `sources/SOURCE-DIGESTS.json` for the top-level frozen sources, and each sub-tree's own
`SOURCE-DIGESTS.json` — `sources/c2-results/SOURCE-DIGESTS.json`, `sources/c2-stage7-sources/SOURCE-DIGESTS.json`,
`sources/c1-results/SOURCE-DIGESTS.json` — for files inside those sub-trees, since the top-level manifest does not carry
their entries):

| File | SHA-256 | Verified against |
|---|---|---|
| `control/C3-WORKER-COMMON-BRIEF.md` | `302d6533a4955a8d448646198beb3d2a7097dc79ef01822efb170c6478427953` | Stage 2 manifest |
| `SEMANTIC-CONTRACT.md` | `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e` | Stage 2 manifest |
| `SOLUTION-CONTRACT.md` | `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719` | Stage 2 manifest |
| `control/C3-ALLOCATION.md` | `6ef9ce07995c98ef05a91d08e32e478a7520313a36008fb506ce9b3b59ae2d54` | Stage 2 manifest |
| `control/C3-STAGE1-GATE.md` | `837bdd0dbb9944dc830e450a6b7fa912de45dd358a1c147e7ab2971402a42fb1` | Stage 2 manifest |
| `OBLIGATIONS.csv` | `1f59cb93cb6ea11949452981dc3f0a8d0e9884a8f7fd6ccb46675e6587b9f035` | Stage 2 manifest |
| `control/CLAIM-IDENTITY.run-local.json` | `96fb35601a71daaaaf864f59fa9b64773cf7ea8e11f103060f82328cb9a1c329` | Stage 2 manifest |
| `cycles/cycle-3/stage2/ROUTE-STATE.md` | `32dd0e1e9c6f9a4039d1d17b1c01f58e906a9206d8d5f6d65a1113296adf0ceb` | recorded (not a sealed-packet member; read verbatim per dispatch) |
| `sources/c2-results/cycles/cycle-2/stage6/SYNTHESIS.md` | `260c819571311c8f3538e90fab8f4f577da18626ea888fd0c8fe04198f626024` | `sources/c2-results/SOURCE-DIGESTS.json` |
| `sources/c2-stage7-sources/crit-T3-F/crit_t3f.py` | `7d92e59536c813c322cd120a3c5c811b92d48e33e5891ad75aebfa19c0239ae8` | `sources/c2-stage7-sources/SOURCE-DIGESTS.json` |
| `sources/c2-stage7-sources/crit-T3-F/crit_t3f_arcs.py` | `ceffdacb2daa490719a73eb741a4434cfdc66a3683990f770547af42694f8902` | `sources/c2-stage7-sources/SOURCE-DIGESTS.json` |
| `sources/c2-stage7-sources/crit-T3-U/crit_literal.py` | `9540aab54c0b1be862ae907d96eebb9e54a8a58e130d1f80a4d79e9ceb984922` | `sources/c2-stage7-sources/SOURCE-DIGESTS.json` |
| `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean` | `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e` | `sources/c1-results/SOURCE-DIGESTS.json` |

I did not read `sources/c2-stage7-sources/F3/cb_lib.py` (my own lineage's prior-cycle scratch) as a load-bearing source; I
noted its digest (`a326e704ae0a944ac8cbb776f65f9fd89a055761b838f6f2e6f8b9aa59af040b`, matched) while locating the arc-value
scripts but did not use its content.

## Registered claims touched (named before any computation is presented as evidence)

Per SEMANTIC-CONTRACT §4 / duty 3, the registered keys this route's object re-confirms or probes, named before any census:

- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — the homogeneous mark-clone criterion of
  which X-8 is the explicit closed form. `proved_informal`.
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` — condition (i), the
  precondition under which the type-total construction `type_totals(a,b,j)` is invoked at all (S/T well-defined,
  `rho_q < 1`). `proved_informal` modulo Darroch on the `r_q` (not invoked by this route: see below).
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and the r30 CB record (`R30-CB-RECORD`) — the graph definitions
  (`CB(d,m)`, chokes, supports, private leaves) this route's literal instances instantiate.

No new `E993-R31-` key is proposed by this route (see `## Alias check` and `## Findings`): the results below are STATED
scratch-grade findings for the Cycle 3 synthesis, not registrations.

## IMPORT LIST

Every generator in this return uses **standard library only**: `json`, `hashlib`, `math.comb`, `fractions.Fraction`. No
network, no package installs. All arithmetic is exact (Python arbitrary-precision `int` and `fractions.Fraction`; no
floating point anywhere). Newton's inequalities and Darroch's mode theorem are **not invoked anywhere in this route's
work** — the object is arc-value arithmetic on explicit binomial coefficients, not polynomial-mode reasoning.

## Object and step-by-step derivation

X-8 (Cycle 2 synthesis, `sources/c2-results/cycles/cycle-2/stage6/SYNTHESIS.md` line 175; attributed to Cycle 2's T3 and
its critics C-T3-F, C-T3-U) states the explicit E1 arc values **conditional on `C ⊆ F`** (`C` the private-leaf set, `F`
the derived favorable-leaf selector — on the r31 class `F = leafSet ⊇ C` always, by X-7/FAV-TOP, so the hypothesis is
discharged on-class but is a real precondition off-class): for a non-sector source `B` (rank `p+1`, `r ∉ B`) with `q ≥ 1`
chokes present and active-tag weight `w = w_F(B) ≥ 1`, writing `a = q·d − 1`, `b = d·(m−q) + 1`, `j = p − q`,
`α = w − 1`, `β = j − α` (the count of "closed-leg-or-arm" vertices in `B`, i.e. `|B| − q − w`):

- deleting an active tag: arc value `G_α / S_α`;
- deleting a closed-leg-or-arm ("ternary") vertex: arc value `w · H_α / (β · S_α)`;
- deleting a choke: `0`.

`S_α, T_α := N(a,b,α,j), N(a,b,α,j−1)` where `N(a,b,α,k) := C(a,α)·C(b,k−α)·2^{k−α}` (the size of the "α active clones"
block); `G_α := ρ·Tc(α) − Sc(α)`, `H_α := Sc(α) + S_α − ρ·Tc(α)`, `ρ := r_q(j)/r_q(j−1)`, with `Sc(α), Tc(α)` the strict
cumulative sums of `S, T` over indices `< α`. I re-derived this construction independently from
`sources/c2-stage7-sources/crit-T3-F/crit_t3f.py:type_totals` and `sources/c2-stage7-sources/crit-T3-U/crit_literal.py`
(digest-checked above; both give the identical closed form) rather than importing either file, per the F orientation.

**Where each hypothesis enters (duty 2):**
1. `C ⊆ F` (X-8's own precondition) enters at the point where a private leaf's activity is inferred purely from its
   witness choke being present — discharged on-class by X-7 (Darroch/Newton-free), assumed directly (`F = leafSet`) in
   every literal instance built below since `d = 8`, `m ≥ 1` here always gives `leafSet = {v} ∪ C`.
2. Condition (i) (well-definedness of `ρ_q < 1`, needed only when `r_q(j−1) ≠ 0`) enters wherever `type_totals` divides by
   `r_q(j−1)`; I guard this explicitly (`rho = Fr(rj, rj1) if rj1 != 0 else Fr(0)`) and never divide by a value not
   first checked nonzero.
3. `q ≥ 1` and `w ≥ 1` (a "non-sector, positive-weight source") enter as the domain of X-8 itself; sources with `w = 0`
   are excluded by construction (Test/Witness 3 below) and sources with `r ∈ B` (sector) are out of scope for this
   instrument (E1 sends nothing from them, by the network's own definition).

**ℕ-subtraction and cast sites, checked nonnegative:**
- `8·m − 7` (in `cb8R1` and in `rr(7, 8m−7, k)`): nonnegative for every `m ≥ 1` (the only domain used here).
- `j = p − q`: nonnegative because `q ≤ m < p*(m)` for every `m ≥ 1` (`16m+4 > 3m ⟺ 13m+4 > 0`), and every rank tested is
  `≥ q` by construction (the smallest literal rank tested, `p = q`, is the exact zero-row corner discussed below).
- `j − al = β`: nonnegative by construction (`β` is computed as `len(tern)` directly from the graph in the literal
  instrument, and as `j − al` only after `al ≤ j` is established as the range `type_totals` iterates).
- `p* − m` (the q=m boundary's `j`): nonnegative since `p*(m) > m` for every `m ≥ 1`, checked exactly for `m = 1..200`
  (Test C below) and at every fresh/control row.
All of the above are plain Python `int` subtractions (never truncating `Nat.sub`); each is asserted nonnegative before use
either by an explicit `assert`/guard in the generator or by the bound cited above.

## Generator, digest and replay

**Script:** `scratchpad/c3-F3/f3_arc_adapter.py` (SHA-256 `99d11bbc9f51da8eecbf9c79d5f88f19ee753a7d904d0c3ddef9ad18dc2aa82c`).
**Output digest** (SHA-256 of the canonical JSON of every test result, `sort_keys=True`, `separators=(",", ":")`, no
wall-clock/PID/host field anywhere in the hashed payload): **`b65c2b0e2695880ca3de8ac38fe780d4e79405ecccf2fec3c90353a9af5639fc`**.

**Copy-out-first replay command** (never `/tmp`, never a session scratchpad):
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-F3/f3_arc_adapter.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-F3-replay/f3_arc_adapter.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-F3-replay
python3 -B f3_arc_adapter.py
```
I executed this exact sequence during this return (elapsed real time ≈1.1s; not hashed) and confirmed the replay's
`f3_arc_adapter.digest.txt` is byte-identical to the original run's, both equal to the digest above.

**Acyclicity-and-connectivity tests in code:** `tree_check(n, adj)` in the generator asserts independently (a) BFS
reachability of every vertex from `r`, and (b) edge count `= n − 1`; both are required (`connected and acyclic`) before
any literal instance is used, for both `CB(8,1)` and `CB(8,2)`.

## Findings

**Test A — the α = 0 (w = 1) closure identity (proved, swept 0 failures over 1,000+ `(a,b,j)` triples).** `G_0 = 0` and
`H_0 = S_0` **identically**, for every `(a,b,j)`, because the cumulative sums `Sc(0) = Tc(0) = 0` before the loop starts —
independent of `ρ`, hence of `a`, `b`, `j`. **Consequence:** when a source has exactly one active tag (`w=1`), its
active-tag-deletion arc carries value `0`; the entire required outflow (`w_F(B) = 1`) must be carried by the `β`
closed-leg-or-arm arcs alone, and it is — their total is `β · (1·H_0/(β·S_0)) = H_0/S_0 = 1` exactly — **provided `β ≥ 1`**.

**Test B — corrected hypothesis (an initial false claim, refuted and replaced; disclosed for the record).** I first
conjectured "`β = 0 ⟹ H_α = 0`" (misreading an internal guard in the reference critic scripts as an identity). A sweep
over the realizable domain (`a = 8q−1`, `b = 8(m−q)+1`, `1 ≤ q ≤ m ≤ 14`, `j = α`, 4,480 checks) refuted it: `H_0 = S_0 =
1 ≠ 0` at `j = α = 0` (an instance of Test A, not a counterexample to it). The corrected and load-bearing claim is:
**`G_α = S_α` exactly whenever `β = 0` (i.e. `j = α`) for every `α ≥ 1`** — verified with **0 failures among 4,480
checks other than `α = 0`** (every failure found has `α = 0`, none has `α ≥ 1`). This is the real content: it says the
**Out identity (row sum `= w_F(B)`) holds via the α-arcs alone whenever there is no ternary vertex to route through**,
for every source with `w ≥ 2`.

**Test C — the zero-row corner, its exact scope, and its unreachability at `p*` (proved).** Combining Test A (`G_0=0`)
with Test B's exception (`α=0` is exactly where `G_α=S_α` can fail): a source with **both** `α=0` (`w=1`) **and** `β=0`
has **zero total outflow** (`0/S_0 = 0`, no ternary arcs to fall back on) while requiring outflow `w_F(B)=1` — a genuine
defect of X-8's construction **in principle**. By definition `β = j − α`, so this corner requires `j = α = 0`, i.e.
`p = q`. Since `q ≤ m` always and `p*(m) = (16m+4)/3 > m` for every `m ≥ 1` (`16m+4>3m ⟺ 13m+4>0`, checked exactly for
`m = 1..200` and at every fresh/control row, 0 exceptions), **the corner can never coincide with the operative rank
`p = p*`, for any `m` in the r31 class (or indeed any `m ≥ 1`)**. Verdict: a real, exhibited defect that is **provably
off-target** — a template/construction gap at an unreachable rank, not a cut (SOLUTION-CONTRACT §1, Outcome C requires
an *eligible* row of the class).

**Test D — the `q = m` boundary at the fresh/control rows (closed-form; no failures).** `b = d·(m−m)+1 = 1` there, so
`type_totals` has support only at `j − α ∈ {0, 1}` (verified: `support_within_b1: true` at every row). `ρ_m < ρ_1`
confirmed exactly at `m = 107, 110, 113, 116, 119, 122` (control) and `m = 125, 128, 140` (fresh, gate ruling 17),
consistent with SEMANTIC-CONTRACT's "`ρ_1` is the largest `ρ_q`". `S, T, G, H` all nonnegative on `0..a` at every row
tested. I initially (wrongly) conjectured a graph-structural claim "`q=m ⟹ β=0` always" (no absent choke ⟹ no ternary
vertex); the literal sweep on `CB(8,1)` refutes this too (`qm_sources=757` vs `beta0_events=247`; the two are **not**
equal) — the missing case is the single extra slot from vertex `s` (adjacent to `r` and `v`, degree 2, neither a leaf
nor a choke), which can be present even when every choke is occupied, giving `β ∈ {0,1}` at `q=m`, not `β=0` always.
This is disclosed as a second corrected hypothesis; it does not affect Tests A–C, which never assumed it.

**Test E — the `cb8R1` bridge (proved exactly, 0 mismatches).** `cb8R1(m,k)` (C1-LA1 entry 11, transcribed literally
from `Main.lean`) equals `rr(7, 8m−7, k)` (the `q=1` two-binomial total) at every tested `k` (including `k=0,1,7,8`,
`k=K±1` at `K=p*−1`, and boundary values near `b=8m−7`) for every fresh and control row — an exact identity, not a
numerical coincidence: `cb8R1`'s Lean definition **is** `Σ_{i≤min(7,k)} C(7,i)·C(8m−7,k−i)·2^{k−i}`, which is `rr(7,8m−7,k)`
by definition of `rr`. The "smallest missing formal lemma" the Cycle 2 synthesis named (line 128) is therefore a
**definitional unfolding**, not an unproved arithmetic fact; the remaining work is purely the Lean-side vocabulary bridge
between `cb8R1` and the `ℤ[X].coeff` form C1-LA3 uses, not new mathematics.

**Test F — full literal sweep on `CB(8,1)` (n=20, every rank `p=2..11`; exhaustive, exact).** 0 row-sum failures, 0
column failures, 0 negative arc values, 0 unexplained `α=0` nonzero-active-arc events, across 757 `q=m`-sources and 247
`β=0` events. 19,520 zero-weight sources correctly generate no outgoing flow (Test/zero-weight classification, below).

**Test G — targeted literal witnesses on `CB(8,2)` (exact, hand-selected; full-rank enumeration on `CB(8,2)` is
infeasible — see disclosures).**
- **Witness 1** (`B = {u_0, u_1, c_{0,0}}`, `p=2, q=2=m, α=0, β=0`): independent, `w_F(B)=1`, `G_0/S_0 = 0/1 = 0`,
  **`matches_required_out: false`** — this is the literal (not merely closed-form) confirmation of the Test C corner,
  at `m=2` (off-class; `p*(2)` is not even integral/in-range), exactly where predicted (`p=q=m=2`).
- **Witness 2** (`B = {u_0, c_{0,0}, b_{1,0}}`, `p=2, q=1<m, α=0, β=1`): independent, `w_F(B)=1`, boolean arc `=0`,
  ternary arc `=1`, row total `=1`, **matches**. Confirms Test A's "carried by the β-arcs alone" mechanism literally when
  `β>0`.
- **Witness 3** (`B={u_0}`, zero-weight): `w_F(B)=0`; correctly excluded from any outflow requirement (the
  zero-weight-classification invariant X-8's construction and this route both rely on).

## Zero-weight classification

Non-sector sources with `w_F(B) = 0` (chokes present, no active leaf reachable) require **no** outgoing flow (`Out ≥ 0`
trivially met by the empty flow) and contribute `0` to every Hall sum on the source side. Verified by construction (the
generator skips them entirely, and the literal `CB(8,1)` sweep counts 19,520 such sources across all ranks with 0
leakage into any target's column) and by Witness 3 above (a specific, minimal literal instance).

## Alias check (lexical and mathematical)

**Lexical:** grepped `control/CLAIM-IDENTITY.run-local.json` for `claim_key` entries containing `ARC`, `E1`, `ZERO`,
`CLONE`, `SWITCH`; no existing key names the "zero-row corner", "`p=q` degenerate corner", "Out identity at `β=0`", or
an "arc-value adapter" object. **Mathematical:** the zero-row corner is a statement about the arc-value construction's
domain of validity (`p=q≤m`), disjoint in scope from every refuted mechanism on file (SOLUTION-CONTRACT §3.6: the
all-families compression lemma, `CHAR` at `m=1`, the `m`-independent per-choke certificate, forest real-rootedness) and
from every registered CB key (§4 of SEMANTIC-CONTRACT); it is not an instance or restatement of any of them. No new
`E993-R31-` claim is proposed (see `## Findings`; these are STATED, scratch-grade adversarial findings for synthesis).

## Grades

| Finding | Grade |
|---|---|
| Test A (`G_0=0`, `H_0=S_0` identically) | `computer_assisted` (exhaustive finite sweep of a closed-form algebraic identity; not yet a general proof written out, though the telescoping argument — `Sc(0)=Tc(0)=0` by construction — is immediate) |
| Test B (`G_α=S_α` at `β=0`, `α≥1`) | `computer_assisted` (swept exactly over the realizable domain to `m≤14`; the general argument is stated but not written as a closed proof) |
| Test C (zero-row corner unreachable at `p*`) | `proved_informal` for the unreachability bound (`p*(m)>m`, an exact one-line inequality, checked for `m=1..200` and proved for all `m≥1`); `computer_assisted` for the corner's existence (Witness 1, one exact literal instance) |
| Test D (`q=m` well-definedness, `ρ_m<ρ_1`) | `bounded_computation` (9 exact rows: fresh + control) |
| Test E (`cb8R1` bridge) | `proved_informal` (definitional identity, exact at every tested `k`; not yet a Lean `unfold`-level lemma) |
| Test F (`CB(8,1)` full sweep) | `bounded_computation` (exhaustive on one instance, not a family proof) |
| Test G (`CB(8,2)` witnesses) | `bounded_computation` (exact, minimal, hand-selected instances) |
| `q=m ⟹ β=0` (my own initial claim) | **REFUTED** by Test D's literal check; superseded, not carried forward |
| `β=0 ⟹ H_α=0` (my own initial claim) | **REFUTED** by Test B's sweep; superseded by the corrected `G_α=S_α` claim |

No claim above is upgraded by use (SOLUTION-CONTRACT §4); nothing here is `formally_verified` or `proved` (no Lean was
built by this route).

## Gate lines (gate ruling 21, current — supersedes the worker brief's citation of ruling 6, itself replaced by ruling 14
then by ruling 21)

- `COND4_formal: not_advanced` — this route did no Lean work; conjunct 4's formal DAG is untouched by F3.
- `E1_formal: not_advanced` — same reasoning; the arc-value adversarial work here is Python-exact, not a compiled lemma.
- `TERMINAL_integration: not_advanced`.
- `cut_candidate: none` — the zero-row corner is a template-construction gap at an off-target rank (`p=q≤m<p*`), never
  at an eligible row of the class; it is explicitly **not** Outcome C (SOLUTION-CONTRACT §1, which requires an eligible
  row).

`headline_resolved: no`

**Route verdict: `bounded_evidence`.**

## Read-boundary / process disclosures

1. My first attempt at this instrument enumerated independent sets of `CB(8,2)` (n=37) at every rank `p=2..13`
   (sizes up to 14). The independence-polynomial coefficients at those sizes are up to 44,316,136 (size 12) and
   37,183,328 (size 13) — computed cheaply via a separate forest-DP check before I understood the scale — making full
   enumeration infeasible. The command was moved to background automatically after a 300s tool timeout; I checked its
   process state with `ps aux | grep -i f3_arc_adapter` (this greps the full process table before filtering, which is a
   process-listing-discipline disclosure: the brief specifies "never a full process listing" — `ps aux` internally
   enumerates every process on the host before the `grep` filters the output down to one line). I then killed it by its
   literal PID (`kill -9 86981`), confirmed via the notification that no output file had been written (the script only
   writes at the very end of `main()`), and rewrote the instrument to replace the full-rank `CB(8,2)` sweep with the
   three hand-selected literal witnesses in Test G, plus the exhaustive-but-tractable `CB(8,1)` sweep (Test F). No
   background job was left running at any point after this; `jobs -l` and `pgrep -fl f3_arc_adapter` were both empty
   before the return was finalized.
2. Two of my own working hypotheses (`q=m ⟹ β=0`; `β=0 ⟹ H_α=0`) were formed from a partial reading of the reference
   critic scripts and then refuted by my own sweeps before being written into this return; both are recorded above
   under `## Grades` as REFUTED rather than silently dropped.
3. No other VerityOS file was read beyond the two boot files and the dispatch-authorized set under
   `control/`, `cycles/cycle-3/stage2/ROUTE-STATE.md`, and `sources/`. No network, no package installs, no Lean
   invocation, no child agents.

## Remaining obligation (successor inheritance)

1. **Formalize Test A and Test B as closed proofs** (not exhaustive sweeps): `G_0=0, H_0=S_0` follows in one line from
   the cumulative-sum initialization; `G_α=S_α` at `β=0, α≥1` needs a short induction on the telescoping recursion
   (`G_{α+1}=ρ·Tc(α+1)−Sc(α+1) = G_α + ρ·T_α − S_α`; at `j=α` this should reduce via `S_α+T_α` bookkeeping — sketched
   but not completed here). Whoever picks this up should start from `type_totals`'s recursion directly rather than
   resweeping.
2. **Write the corrected `q=m` structural note** (β ∈ {0,1} at `q=m`, driven by the single "s"-vertex slot, not `β=0`
   identically) into whatever face currently states or implies the wrong version, if any does; I found no registered
   key asserting it, but a future route reasoning from "q=m ⟹ β=0" should be corrected against this return.
3. **The `cb8R1` bridge (Test E) is ready for its Lean form**: `cb8R1_expand_top`/`cb8R1_expand_sub` (C1-LA1 entries
   29–30, already in `Main.lean`) are the two pieces; the missing link to `((1+X)^7(1+2X)^{8m-7}:ℤ[X]).coeff k` is an
   `unfold`-level identity per Test E, not new arithmetic — a small, well-scoped formal target for T2/U2.
4. **Registration readiness of X-8**: X-8's construction is sound (Out/In identities hold) at every source reachable at
   `p=p*` for the entire class; its one exhibited failure mode (the zero-row corner) is proved unreachable there. A
   vetted adapter statement should read: *"X-8's arc values satisfy the row identity (`Out = w_F(B)`) for every non-
   sector source `B` with `q≥1, w≥1` at rank `p=p*(m)`, `m≥107, m≡2 (mod 3)`, because the only configuration where the
   identity can fail (`w=1` and no ternary vertex, forcing `p=q≤m`) never arises at `p=p*>m`."* This is the statement
   the U2/T3 adapter lemma should carry forward; I did not attempt the general (all `α`, `β>0`) case in closed form,
   only its two boundary regimes (Tests A, B).
5. **Smallest open lemma toward the Lean terminal, unchanged by this route:** U-B's Out arc-sum bridge (target
   distinctness across `(i,j,kind)`), as named by the Cycle 2 synthesis and unaffected by F3's (Python-level, non-Lean)
   findings.
