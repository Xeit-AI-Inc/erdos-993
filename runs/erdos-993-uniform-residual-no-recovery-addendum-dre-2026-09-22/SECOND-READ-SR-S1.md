# Second Read — SR-S1 (Composition S1, the τ ≤ 5 cover branch at every excess)

Isolated second reader `SR-S1`, lane C of the r25 ADDENDUM run
`erdos-993-math-dre-20260922-r25-addendum`. Commissioned under gate ruling 8 to read
Composition S1 — first stated, and deliberately not registered, in the r25 Cycle 6
terminal synthesis at `R4` — before anything about it is registered. r25 is terminal;
nothing written here changes any r25 record. The controller, not this seat, registers.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading exactly
the two files this seat's dispatch authorizes — `/Users/ashtonsperry/VerityOS/verity.md`
(root constitution) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`
(startup sequence) — and no other VerityOS file. Per the startup protocol's own
task-type map this is controlled-experiment work under `experiments/`; the only
subsystem loaded is this run root, through the sealed SR-S1 capsule and the r25 grant
the protocol names. This report is an experiment-local artifact and proposes no durable
VerityOS memory, decision, knowledge, skill, module, project or writing change. I
followed the dispatch's restriction rather than the startup protocol's own map into
memory, conversations, modules, skills, logs or decisions; no such file was opened.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit
parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority.

**Child delegation:** none. No `Agent`/Task call was made at any point. Every seal
recomputation, every derivation, every census and every ruling below was produced
directly by this seat.

---

## Identity and seal audit

**The capsule seal is `d2c732fe3158177a969afe94b94d253e53acb56acfae015c2e824bb1d93f0aae`.**
Recomputed canonically by my own instrument — SHA-256 over the compact, key-sorted JSON
serialization of `control/lane-c/SR-S1-PACKET-MANIFEST.json` with the `seal_sha256`
field removed, UTF-8, `separators=(",",":")`, no trailing newline (8,360 canonical
bytes) — **exact match** to the manifest's own field and to the value in my dispatch.
`file_count` (57) equals the actual member count, and **all 57 members verify on both
SHA-256 and byte length: 57/57, zero mismatches, zero missing.** Generator
`gen_seal_audit.py` (SHA-256 `725c003a…06dd06`; IMPORT LIST: `hashlib`, `json`, `os`,
`sys`), output `seal-audit.txt` (`ee9b9605…81929d`).

`control/lane-c/PATH-CHECK-SR-S1.json` (capsule member, digest verified): 55 files
scanned, 0 findings, no pruned roots.

**Registry of record for this read.** `control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json`,
digest `8bdd67c6…4b36d` re-verified against the manifest, **360 claims** (`claims` key;
`schema_version`, `authority`, `program`, `created`, `last_updated`, `maintained_by`,
`update_note` are the other top-level fields). Every claim key this report cites exists
in it with the status quoted; none of the eleven keys I queried is absent. Queried by
key **and** by statement with `gen_registry_query.py` (SHA-256 `32940dd1…36ef9956`;
IMPORT LIST: `hashlib`, `json`, `os`, `sys`), output `registry.json`
(`0445e8b0…c5c2ba64`).

**Read boundary observed.** The capsule members only: this protocol; the packet
manifest and the lane-C path check; `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
`SOLUTION-CONTRACT-ADDENDUM-1.md`; `control/A1-STAGE1-GATE.md`; the Stage 2 registry
snapshot; and, under `sources/r25-terminal/`, the F4 return, both F4 critiques, the F
adjudication, the terminal synthesis, the U3 return and critiques, the U adjudication
and the Lean gate closeout. **Three disclosures, all content-free for mathematics,
recorded plainly rather than omitted:**

1. **One harness auto-backgrounding.** My first run of `gen_gamma_residue.py` exceeded
   the harness's foreground timeout and was auto-backgrounded by the harness — not a
   `nohup`, not a detach-and-await. I killed it **by PID** (a `ps -o pid=,args=` listing
   filtered by a pattern that is not my own command line), reduced the scan bound, and
   re-ran in the foreground to completion. **No figure in this report comes from that
   run**; its output file was never produced. Same species as the C-F4-T, C-F4-U and
   C-T4-F disclosures the F adjudication records.
2. **Two `ps -o pid=,args=` process sweeps**, one to kill the above and one immediately
   before this write; both printed unrelated system processes and nothing was read from
   them. No `pgrep -f` was used, and no filter pattern matched my own command line.
3. **One non-recursive `ls` of my own scratch directory** to digest my own artifacts.
   No `find`, `grep`, `rg`, `ls -R`, `cat` with a glob, or any recursive listing was run
   at any point, and nothing was searched at or above this run root, the r25 root, the
   VerityOS root or `/`.

I did **not** read any Cycle A1 material (`cycles/cycle-A1/`, `scratchpad/a1-*`), any
other second reader's directory, any other r25 material beyond the capsule members, any
other experiment root, any external source, any network resource, or any VerityOS file
beyond the two authorized boot reads. **I did not exercise the r25 scratch-replay grant
at all** — every number below is from my own instruments, written from
`SEMANTIC-CONTRACT.md`'s definitions, so no copy-out was needed. **No network, no
package installs; Python standard library and exact integers only.** Scratch is under
the absolute path
`…/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/scratchpad/lane-c-SR-S1/`;
never `/tmp`, `mktemp`, `TMPDIR` or a session scratchpad. No hashed artifact carries a
wall-clock, PID or host field. **Every long job ran in the foreground**; the only
exception is disclosure 1, killed by PID and re-run. `ps` immediately before this write:
no job of this seat running. I touched nothing outside my own two granted directories.

---

## The residue by excess, re-derived

All arithmetic below is from `gen_gamma_residue.py` (SHA-256 `c777df3e…cec1a0f68c`;
IMPORT LIST: `json`, `sys`, `math.comb`), output `gamma_residue.json`
(`0ac6c101…7ca2144b8`), and `gen_diagnostics.py` (SHA-256 `b57f7e8d…1cc7c81f9a`), output
`diagnostics.json` (`d5408896…2fc9bf1958c7`). Exact integers throughout; no float
appears in any judgement or any reported number.

**The bound, built from the contract rather than taken on report.** For a forest `F`
with vertex cover `C`, `|C| = τ`, `B = V∖C` independent, `n = |B| = |V| − τ`, the
cover-fiber partition `i_k(F) = Σ_{S ⊆ C indep} C(b_S, k−|S|)` differences termwise to
`Δ_k(F) = Σ_S E(b_S, k−|S|)`; the `S = ∅` fiber contributes exactly `E(n,k)`, there are
at most `C(τ,a)` independent `S` of size `a`, and the Catalan floor bounds each term
below by `−Cat_{k−a}`. Hence, with `n = 2r+d−τ`,

```
Δ_k(F)  ≥  Γ_n(τ,k,n) := E(n,k) − Σ_{a=1}^{τ} C(τ,a)·Cat_{k−a},
E(b,m) := C(b,m+1) − C(b,m)  (zero-extended: E(b,−1) = 1, E(b,m) = 0 for m ≤ −2),
Cat_j := 0 for j < 0,        Γ(τ,k) := Γ_n(τ,k,2k+2).
```

**Primitive controls, all clean.** Lemma H (`E(b,j) ≥ −Cat_j`, equality **exactly** on
`{2j−1, 2j}`): `j = 0..120`, `b < 6j+60` — **0 floor violations, 0 tight-set
mismatches**. Lemma T (`E(n,k) ≥ Cat_{k+1}` for `n ≥ 2k+2`, equality exactly at
`n = 2k+2`; increment `C(n,k) − C(n,k−1)` flat at `n = 2k−1`, strictly positive from
`n = 2k`): `k = 0..120` — **0 ceiling violations, 0 equality mismatches, 0 flat-step
mismatches, 0 strict-increment failures.** `Cat_{0..10} = 1,1,2,5,14,42,132,429,1430,4862,16796`;
`Cat_{j<0} = 0`; `E(b,−1) = 1` and `E(b,−2) = 0` uniformly over `b = 0..39`.

**`K(τ)` reproduced.** `K(1..7) = 0, 2, 3, 4, 6, 12, 70` by direct scan to `k = 300` —
exact match to the registered, **formally verified**
`E993-R25-CATALAN-GAP-MONOTONE-RATIO`, whose statement in the Stage 2 snapshot reads, in
part: *"Gamma(tau,k) > 0 for all k >= K(tau) with K(1..7) = 0,2,3,4,6,12,70 (sufficiency
half); and Gamma(tau,k) < 0 for all tau >= 8, k >= tau."* I confirm the second clause
too: over `τ = 8..12`, `k = τ..299`, **no `k` has `Γ(τ,k) ≥ 0`**.
`Γ(5, 0..8) = 1, −3, −10, −16, −18, −14, 18, 183, 902` (so `K(5) = 6`) and
`Γ(6, 0..12) = 1, −4, −16, −33, −53, −88, −170, −360, −774, −1578, −2662, −1563, 16848`
(so `K(6) = 12`) — both rows identical to the synthesis's own re-derivation.

**Monotonicity in `τ`, which is what lets `τ = 5` govern `τ ≤ 5`.** Raising `τ` by one
at a fixed cell does two things, both downward: it *adds* a subtracted term and raises
every `C(τ,a)`, and it *lowers* `n = 2r+d−τ` by one. The second step needs
`E(n−1,k) ≤ E(n,k)`, i.e. `n − 1 ≥ 2k−1`, which holds throughout the region used here
because `r ≥ k+1` and `d ≥ τ` give `n ≥ 2k+2`. Checked directly: over
`d = 5..20`, `r = 2..59`, `k = 0..r−1`, `τ = 1..5` — **0 violations of
`Γ_n(τ+1,k,·) ≤ Γ_n(τ,k,·)`.** So the `τ ≤ 5` branch is governed by `τ = 5` at every
cell, and the bound may be applied at the forest's own `τ(F)` with no loss.

**The residue, indexed by slack `s = d − τ`** (`R(τ,s) := {k ≥ 0 : Γ_n(τ,k,2k+2+s) ≤ 0}`,
the ranks at which the bound is inconclusive at the minimal admissible rank `r = k+1`;
the scan runs to `k = 300`, and the residue is confined below `K(τ) ≤ 70` by the
registered award plus monotonicity in `n`):

| `τ` | `s = 0` | `s = 1` | `s = 2` | `s = 3` |
|---|---|---|---|---|
| 1 | ∅ | ∅ | ∅ | ∅ |
| 2 | `k=1` | ∅ | ∅ | ∅ |
| 3 | `k=1,2` | ∅ | ∅ | ∅ |
| 4 | `k=1,2,3` | ∅ | ∅ | ∅ |
| 5 | `k=1..5` | `k=1,2` | **∅** | ∅ |
| 6 | `k=1..11` | `k=1,2,3` | ∅ | ∅ |
| 7 | `k=1..69` | `k=1,2,3,4` | `k=2` | **∅** |

`s*(1..7) = 0, 1, 1, 1, 2, 2, 3` — exact match to C-F4-U's table, the F adjudication's
Ruling 30b and the synthesis's re-derivation. The slack-0 counts are `K(τ)−1` at every
`τ`, as they must be.

**The `τ ≤ 5` branch by excess, which is Composition S1's own table:**

| `d` | slack at `τ = 5` | residue `k` | residue orders `2(k+1)+d` |
|---|---|---|---|
| 5 | 0 | `1,2,3,4,5` | **9, 11, 13, 15, 17** |
| 6 | 1 | `1,2` | **10, 12** |
| **≥ 7** | ≥ 2 | **none** | **none** |

Verified empty at `d = 7..14` directly. **Confirmed, cell for cell.**

**Answering the protocol's sub-question about `τ ≤ 4` explicitly: yes, the `τ = 4`
residue vanishes at `s = d − 4 ≥ 1`, and so does every `τ ≤ 4` residue at every
`d ≥ 5`.** `s*(4) = 1` and `d − 4 ≥ 1` whenever `d ≥ 5`; the rows
`Γ_n(4,k,2k+3)` for `k = 0..8` are `2, 1, 4, 24, 95, 334, 1156, 4021, 14106`, all
strictly positive, and `τ = 3`, `τ = 2`, `τ = 1` have still larger slack and still
larger rows. So at every `d ≥ 5` the whole `τ ≤ 4` sub-branch closes with no residue at
all, and the entire residue of the branch sits at `τ = 5`.

**The registered inputs the `d ≥ 7` emptiness rests on, named exactly.** Three, and no
more. (i) The `Γ` bound itself: the registered `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`
(grade `independently_adjudicated_informal_proof_no_formal_award`) for the cover-fiber
identity, and the registered VERIFIED `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR` for the
termwise floor. (ii) Above `K(5) = 6`: the **formally verified**
`E993-R25-CATALAN-GAP-MONOTONE-RATIO`, which gives `Γ(5,k) > 0` at slack 0 for every
`k ≥ 6`, hence at every slack `≥ 0` by monotonicity in `n`
(`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`). (iii) Below `K(5)`: **a finite exact
check of exactly six integers** — `Γ_n(5,k,2k+4)` at `k = 0..5` is
**`3, 4, 13, 60, 237, 855`**, all strictly positive. Nothing else enters. The phrase "by
arithmetic alone" is fair, and it should travel with those six integers rather than
without them, because the emptiness at `d ≥ 7` is not a single monotonicity argument: it
is one formally verified theorem above `k = 5` and six exact integers at or below it.

**A sharpness discrepancy, chased and resolved in the record's favour.** My first scan of
the rank-isolation hypothesis found **10 strict-increase failures at `d − τ = −3`**,
where C-F4-T's A4, the F adjudication's Ruling 36 and the synthesis's A6 all report
**zero** and call `τ ≤ d+3` sharp. I enumerated all ten. Every one is at `k = 0`,
`r = 1 → 2`, with `n_prev = −1` — a *negative vertex count*, an index no forest reaches —
and with `Γ_prev = Γ = 0` on both sides. Restricted to the region the reduction is ever
used in (`n ≥ 2k`, Lemma T's strict-increase zone, which every real cell satisfies), my
scan over `δ = 0, −1, −2, −3`, `τ = 2..12`, `k = 0..60`, `r = k+1..k+40` gives **0
failures over 101,687 steps**, and `δ = −4` gives **549 genuine failures**. **The record
is correct and my ten are a degenerate-index artifact of my own zero-extension at
`n < 0`.** No finding against the record; recorded because a second reader that finds a
discrepancy must say how it resolved. (This is context only: `τ ≤ d+3` is not
Composition S1's object, which lives entirely at `d − τ ≥ 0`.)

---

## The two d = 6 cells, independently closed

Census by `gen_forest_census.py` (SHA-256 `a9a0409e…5cd0d0121d`; IMPORT LIST: `json`,
`sys`, `itertools.combinations`, `math.comb`), output `census17.json`
(`dc088879…ef52f67d69`), run in the foreground to order 17 in ≈36 s.

**Method and its controls.** Free trees are generated by leaf augmentation and
deduplicated by an **AHU canonical form taken as the minimum over the tree's one or two
centers**, so every distinct count below is computed by a canonical form and never by
construction count. **Every object I call a forest passes an acyclicity test in my own
code** — union-find over the explicit edge list, self-loops and repeated edges rejected,
plus the Euler check `#components = n − e`. Forests are multisets of trees, a class
being the sorted multiset of component canonical forms. The independence polynomial is a
rooted DP, **cross-checked against a direct `2^n` subset enumeration**. `τ` is a minimum
vertex-cover DP, `ν` a maximum-matching DP, `α = deg I(F)`, each computed independently;
`τ = ν` (König) and `τ = n − α` are **asserted on every object, not assumed**.
`x(F) := least natural k with Δ_k < 0`, and `Δ_k := i_{k+1} − i_k` carries its
difference index `k` on every row below.

Controls, all passing: free-tree counts `1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320,48629`
at orders 1–17 and forest counts `2,3,6,10,20,37,76,153,329,710,1601,3658,8599,20514,49905,122963`
at orders 2–17 — the classical sequences, exactly, including **122,963 forests of order
17**. DP versus `2^n` brute force: **1,071 trees tested, 0 mismatches.** `τ ≠ ν`: **0**.
`τ ≠ n − α`: **0**. Acyclicity failures across all generated trees and all **150,082**
assembled forests: **0**. Class count equals enumeration count at every order.

**The two cells, complete over isomorphism classes, every rank `k < r`:**

| cell | order | `r` | population (`τ ≤ 5`) | `k` | **min `Δ_k`** | argmin `τ`/`ν`/`e` | argmin `x` | min `x` over cell |
|---|---|---|---|---|---|---|---|---|
| `d = 6`, `r = 2` | 10 | 2 | **329** | 0 | **+9** | 5 / 5 / 9 | 3 | **3** |
| | | | | 1 | **+26** | 5 / 5 / 9 | 3 | |
| `d = 6`, `r = 3` | 12 | 3 | **1,516** | 0 | **+11** | 5 / 5 / 11 | 4 | **4** |
| | | | | 1 | **+43** | 5 / 5 / 11 | 4 | |
| | | | | 2 | **+66** | 5 / 5 / 11 | 4 | |

**`min Δ₁ = +26` over all 329 forests of order 10** and **`min Δ₂ = +66` over the 1,516
forests of order 12 with `τ ≤ 5`** — the record's figures, reproduced independently and
exactly. The full consequent holds at both: `Δ_k > 0` at **every** `k < r`, and
`x(F) ≥ r` over the **whole** population, not merely at the argmin (`min x = 3 ≥ 2` at
order 10; `min x = 4 ≥ 3` at order 12).

**The two elementary identities, derived and checked against the census.** For a
triangle-free graph on `n` vertices with `e` edges, `i₂ = C(n,2) − e`, and a
non-independent 3-set carries one or two edges, the two-edge sets being paths counted by
their centre, so `i₃ = C(n,3) − e(n−2) + Σ_v C(deg v, 2)`. Differencing,

```
n = 10:  Δ₁ = i₂ − i₁ = C(10,2) − e − 10 = 35 − e                    ≥ 26,
n = 12:  Δ₂ = i₃ − i₂ = 154 − 9e + Σ_v C(deg v, 2)                   ≥ 55,
```

using `e ≤ n − 1` for a forest. **Both identities hold with 0 failures over all 150,082
censused forests** (`i₂`: 0 failures; `i₃`: 0 failures); `Δ₁ = 35 − e` holds with **0
failures over all 329** order-10 forests and `Δ₂ = 154 − 9e + Σ_v C(deg v,2)` with **0
failures over all 1,601** order-12 forests; and the maximum `e` is **9** at order 10 and
**11** at order 12, as a forest requires. So the two cells close **without any census**,
at `+26` and `+55` respectively. The elementary route is weaker than the census at order
12 (`55 < 66`) and exactly tight at order 10 (`26 = 26`, attained precisely by the
trees, `e = 9`). **Acyclicity is load-bearing twice in the elementary route** —
triangle-freeness for `i₃`, and `e ≤ n − 1` for the bound — which is worth saying,
because the elementary counts are sometimes described as needing no hypothesis.

**Two independent cross-checks that the census instrument is right.** (i) Over **all**
1,601 forests of order 12 with no `τ` cap, `min Δ₂ = +65`, attained at a `τ = ν = 6`
class — which is the `(6,6,3)` diagonal cell of the F adjudication's Ruling 33, whose
**85**-class population and **+65** minimum I reproduce exactly; the attaining class is
the path `P₁₂`, and its exclusion by `τ ≤ 5` is exactly why the `τ ≤ 5` minimum is `+66`
rather than `+65`. (ii) `Δ₂ ≥ 55` from the elementary count is a bound on *all* order-12
forests, and `55 ≤ 65 ≤ 66`, as it must be.

---

## The five d = 5 cells, rank by rank

This is the caveat the synthesis raises, and it settles as follows. Populations and
minima below are from the same censused run; the `Γ_n` values from `gamma_residue.json`.

**Calibration first: all five registered cell minima reproduce, digit for digit.**

| cell | order | `r` | population (`τ ≤ 5`) | **min `Δ_{r−1}`** | registry | min `x` over cell |
|---|---|---|---|---|---|---|
| `(5,2)` | 9 | 2 | **153** | **+19** | 19 ✓ | 3 |
| `(5,3)` | 11 | 3 | **710** | **+39** | 39 ✓ | 3 |
| `(5,4)` | 13 | 4 | **3,073** | **+56** | 56 ✓ | 4 |
| `(5,5)` | 15 | 5 | **10,648** | **+56** | 56 ✓ | 5 |
| `(5,6)` | 17 | 6 | **29,915** | **+43** | 43 ✓ | 6 |

The populations `153 / 710 / 3,073 / 10,648 / 29,915` are the registry's own corrected
figures (`E993-R25-CARD5-JOINT-BUDGET-CELLS`, `cycle6_note`: *"Order-13 population
corrected: 3,073 forests with tau <= 5 (3,658 is the TOTAL order-13 forest class
count)"*). I confirm **3,073**, and I confirm the reason `153` and `710` coincide with
the totals: for a forest `τ = ν ≤ ⌊n/2⌋`, so `τ ≤ 5` is **automatic** at every order
`n ≤ 11` and the cover hypothesis is vacuous at orders 9 and 11 — exactly as the U
adjudication and the C6-LA5 award face disclose.

**The rank-by-rank answer, which is the point of this section.** At a cell of excess `d`
and rank `r`, `n = 2r+d−τ`, so at rank `k` the *effective* slack is

```
n − (2k+2)  =  2(r−1−k) + (d−τ).
```

At the top rank `k = r−1` this is `d − τ`; at every lower rank it is at least
`2 + (d−τ) ≥ 2 = s*(5)`. So **every rank below the top is closed by the Γ bound itself.**
Computed, not asserted (`min` over `τ = 1..5` at each cell):

| order | `r` | `k` | eff. slack | `min_{τ≤5} Γ_n` | closed by |
|---|---|---|---|---|---|
| 9 | 2 | 0 | 2 | **+3** | `Γ` bound |
| | | **1** | **0** | **−3** | **residue — top rank** |
| 11 | 3 | 0 | 4 | **+5** | `Γ` bound |
| | | 1 | 2 | **+4** | `Γ` bound |
| | | **2** | **0** | **−10** | **residue — top rank** |
| 13 | 4 | 0 / 1 / 2 | 6 / 4 / 2 | **+7 / +15 / +13** | `Γ` bound |
| | | **3** | **0** | **−16** | **residue — top rank** |
| 15 | 5 | 0 / 1 / 2 / 3 | 8 / 6 / 4 / 2 | **+9 / +30 / +60 / +60** | `Γ` bound |
| | | **4** | **0** | **−18** | **residue — top rank** |
| 17 | 6 | 0 / 1 / 2 / 3 / 4 | 10 / 8 / 6 / 4 / 2 | **+11 / +49 / +139 / +245 / +237** | `Γ` bound |
| | | **5** | **0** | **−14** | **residue — top rank** |

And the same at `d = 6`: at order 10, `k = 0` has slack 3 and `Γ_n = +4`; at order 12,
`k = 0, 1` have slack 5, 3 and `Γ_n = +6, +9`. I confirmed this exhaustively rather than
cell by cell: enumerating **every** `(d,τ,r,k)` with `d = 5..20`, `τ = 1..5`, `r = 2..79`,
`k = 0..r−1` at which `Γ_n ≤ 0` returns **exactly seven cells** — the five at `d = 5` and
the two at `d = 6`, **every one of them at `k = r−1`**, and nothing else anywhere in the
box. Beyond the box, `r > 79` is covered by monotonicity in `r` and `d > 20` by
monotonicity in `n`.

**So the settled answer to "informal-proved, census-closed, or open" is: none of the
three as posed — `Γ`-closed.** At each of the five `d = 5` cells:

- `k = r−1` (the top rank) is discharged **in Lean**, by award **C6-LA5**
  (`E993-R25-CARD5-JOINT-BUDGET-CELLS`, `formally_verified` at the Lean gate closeout),
  as `cell_9/11/13/15/17` with bounds `t = 9, 5, 9, 21, 42` — the registered statement
  reads *"all five registered tau = 5 cells close with +9, +5, +9, +21, +42 at orders 9,
  11, 13, 15, 17"*, against true cell minima `19, 39, 56, 56, 43`, so the Lean bounds are
  **far from sharp at four of five cells**, and `cell_9` is a strictly-less-general
  replay of frozen ENTRY 175 (**four cells are new Lean content, not five**).
- every `k < r−1` is discharged by **the same `Γ_n` bound that closes the whole branch at
  `d ≥ 7`**, at the same grade — `proved_informal`, resting on the cover-fiber identity,
  the Catalan floor, the formally verified Catalan-gap award above `K(5) = 6` and a
  finite exact check below it. They are **not** census-closed (the censuses above
  corroborate them but are not needed), **not** left to an informal small-rank closure,
  and **not open**.

The synthesis's caveat — *"the Lean side discharges only the top rank `k = r−1` at each
cell, while the claim asks for every `k < r`, so the lower ranks remain informal"* — is
therefore **true as written and incomplete as guidance**. It is exactly right that no
Lean object in this run discharges the lower ranks; the registry's own `cycle6_note` and
the synthesis's Dispatch 5 excluded conclusions both say so, and I confirm it. But
"remain informal" reads, to a successor, as an unpaid debt, and it is not one: the lower
ranks were never in the residue. **This is the repair the scope note must carry.**

---

## Instance, not theorem

**Confirmed, on the registry's own face.** The registered statement of
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` (status **VERIFIED**, grade
`proved_informal_adjudicator_verified_no_formal_award`, `formal_award: false`,
`novelty_claimed: false`, registered 2026-09-21, updated 2026-09-22) reads:

> *"For every finite forest F of order 2r+d (d >= 2, r >= 2) with vertex-cover number
> tau(F) <= min(d,5), Delta_k(F) > 0 for every natural k < r (hence x(F) >= r)."*

At every `d ≥ 5`, `min(d,5) = 5`, so the hypothesis `τ(F) ≤ min(d,5)` **is** `τ(F) ≤ 5`
and Composition S1's conclusion is literally the registered conclusion. S1 raises no
status, and it must not: it is an instance. **One precision.** S1 as stated at `R4` omits
the registered claim's `r ≥ 2`. The omission is harmless — at `r ≤ 1` the statement is
trivially true, since `k < r` forces `k = 0` and `Δ₀ = i₁ − i₀ = |V| − 1 > 0` for any
graph on `≥ 2` vertices (and `Γ_n(τ,0,n) = n − 1`) — but a scope note appended to the
registered claim should not silently widen its hypothesis set, so the note below carries
`r ≥ 2`.

**And the composition says `c(d) = min(d,5)` in Lean nowhere, and states no tier.**
Verified against four independent records, all in the capsule:

- the **Lean gate closeout**, C6-LA5: registry effect is
  *"`E993-R25-CARD5-JOINT-BUDGET-CELLS` → formally_verified at the five cells (fixed-cell;
  novelty four cells; cover hypothesis vacuous at 9 and 11; **top rank only**)"*;
- the **synthesis's Dispatch 5** excluded conclusions: *"the group is **never**
  `c(d) = min(d,5)` in Lean and **never** a tier statement; it does **not** discharge
  `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, because each `cell_n` proves **one** rank
  (`k = r−1`) while that claim asks for `Δ_k > 0` at **every** `k < r` — **no Lean object
  in this run discharges the lower ranks**"*;
- the **Stage 2 registry snapshot**'s own `cycle6_note` on the threshold claim, which
  already records S1 and states *"this claim's grade is unchanged … stated in the Cycle 6
  synthesis, not registered (gate ruling 8)"*;
- the **`E993-R25-CATALAN-GAP-MONOTONE-RATIO` scope**: *"NOT a graph theorem, NOT
  fixed-band, not uniform in d (d absent); **never to be packaged as c(d) = min(d,5)**"*.

The Tier 3b headline verdict is unchanged by any of this: `c(d) = min(d,5)` stays
informal and the threshold function did not move. S1 is a **fixed-`τ`** statement about
the branch's proof route, not about `c`.

**A material finding for the scope note, and the reason one is warranted at all.** The
registered scope says: *"the finite residue collapses to FIVE cells, all at tau = 5, all
at r = k+1, at orders 9, 11, 13, 15, 17."* Read as an accounting of **this claim's own**
`Γ`-route residue, that sentence is **incomplete**: the two `d = 6` cells (orders 10 and
12) are also at `τ = 5` and also at `r = k+1`, and they are not in the list. I computed
the residue of the full registered claim — hypothesis `τ ≤ min(d,5)`, every rank `k < r`,
`d = 2..12`, `r = 2..59` — and it is:

| `d` | 2 | 3 | 4 | 5 | 6 | ≥ 7 |
|---|---|---|---|---|---|---|
| cells | 1 (order 6) | 2 (orders 7, 9) | 3 (orders 8, 10, 12) | **5** (orders 9, 11, 13, 15, 17) | **2** (orders 10, 12) | **0** |

`K(d)−1` cells at each `d ≤ 5` (where `τ = d` and the slack is 0), then 2, then none —
**thirteen cells in all, every one at `k = r−1`.** The registered five is the `d = 5`
slice. The `d ≤ 4` cells sit at `τ = d < 5` and belong to the earlier cycles' accounting;
the two at `d = 6` sit at `τ = 5`, were closed **only in Cycle 6 and only by the F4
critics**, and are exactly what S1 adds. **That is the increment, and it is a real one.**

---

## Verdict and the exact scope note

Every component of Composition S1 is confirmed by my own instruments: the residue
structure `5 → 2 → 0`; the emptiness at every `d ≥ 7` and its three registered inputs;
the two `d = 6` cells at `+26` over 329 and `+66` over 1,516, closed again by two
elementary counts; the five `d = 5` cells with minima `19, 39, 56, 56, 43`; the Lean
discharge at `k = r−1` only, `cell_9` already frozen ENTRY 175; and "instance, not
theorem", with `c(d) = min(d,5)` stated in Lean nowhere and no tier touched. Six repairs
are required before anything is recorded, none of them mathematical: the caveat's reading
(the lower ranks are `Γ`-closed, not owed), the `r ≥ 2` hypothesis, the `Γ_n = 0` at
order 10, the vacuity split at the two new cells, the named finite check behind "by
arithmetic alone", and the fact that the registry already carries a `cycle6_note` on this
claim so only the increment may be appended.

verdict: confirmed_with_repairs

**Something should be appended, and only this.** The Stage 2 registry snapshot already
carries a Cycle 6 note on `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` recording S1 in
summary; the controller must **not** restate it. The text below is written as an
addendum to that note, carries grade and attribution on its face, and asserts nothing
this read did not confirm.

> **Scope note (SR-S1, r25 ADDENDUM lane C; second read of Composition S1 under gate
> ruling 8). No grade change; this claim stays VERIFIED at
> `proved_informal_adjudicator_verified_no_formal_award`.**
>
> **(1) The `Γ`-route residue of this claim, complete and by excess.** With
> `Γ_n(τ,k,n) = E(n,k) − Σ_{a=1}^{τ} C(τ,a)·Cat_{k−a}` and `n = 2r+d−τ`, the set of
> `(d,τ,r,k)` with `d ≥ 2`, `τ ≤ min(d,5)`, `r ≥ 2`, `k < r` at which `Γ_n ≤ 0` has
> exactly **one cell at `d = 2`** (order 6), **two at `d = 3`** (orders 7, 9), **three at
> `d = 4`** (orders 8, 10, 12), **five at `d = 5`** (orders 9, 11, 13, 15, 17), **two at
> `d = 6`** (orders 10, 12) and is **empty at every `d ≥ 7`** — thirteen cells, every one
> at the top rank `k = r−1`, with `K(d)−1` cells at each `d ≤ 5`. **The scope sentence
> "the finite residue collapses to FIVE cells, all at tau = 5, all at r = k+1, at orders
> 9, 11, 13, 15, 17" is the `d = 5` slice**: the two `d = 6` cells are also at `τ = 5` and
> also at `r = k+1`, and were closed only in Cycle 6. Restricted to `d ≥ 5`, where the
> hypothesis is `τ ≤ 5`, the residue is **seven** cells: five at `d = 5`, two at `d = 6`,
> none beyond. Governed by `τ = 5` throughout, `Γ_n` being decreasing in `τ` at a fixed
> cell (verified, 0 violations over `d = 5..20`, `r = 2..59`, `k < r`, `τ ≤ 5`); every
> `τ ≤ 4` sub-branch has slack `d − τ ≥ 1 ≥ s*(τ)` at every `d ≥ 5` and so contributes
> nothing.
>
> **(2) The `d ≥ 7` emptiness rests on exactly three registered inputs**, and on nothing
> else: the cover-fiber identity `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` with the
> VERIFIED floor `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`; the **formally verified**
> `E993-R25-CATALAN-GAP-MONOTONE-RATIO` above `K(5) = 6`, lifted off the minimal rank by
> `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`'s monotonicity; and a **finite exact
> check of six integers** below `K(5)` — `Γ_n(5,k,2k+4) = 3, 4, 13, 60, 237, 855` at
> `k = 0..5`. "By arithmetic alone" is accurate and should travel with those six values.
>
> **(3) The two `d = 6` cells, closed twice over.** Complete isomorphism-class census:
> **`min Δ₁ = +26` over all 329 forests of order 10** and **`min Δ₂ = +66` over the 1,516
> forests of order 12 with `τ ≤ 5`**, with `Δ_k > 0` at every `k < r` (`min Δ₀ = +9`,
> `+11`) and `x(F) ≥ r` over the whole population (`min x = 3` at order 10, `4` at order
> 12). And without any census, from `i₂ = C(n,2) − e` and
> `i₃ = C(n,3) − e(n−2) + Σ_v C(deg v,2)` with `e ≤ n − 1`: `Δ₁ = 35 − e ≥ 26` at `n = 10`
> and `Δ₂ = 154 − 9e + Σ_v C(deg v,2) ≥ 55` at `n = 12`. **Acyclicity is load-bearing
> twice** in the elementary route (triangle-freeness for `i₃`; `e ≤ n−1` for the bound).
> **Vacuity, as for orders 9 and 11:** since `τ = ν ≤ ⌊n/2⌋` on a forest, the cover
> hypothesis is **vacuous at order 10** (all 329 classes) and **cover-essential at order
> 12** (1,516 of 1,601). At order 10 the bound is inconclusive only by equality —
> `Γ_n(5,1,5) = 0` exactly, giving `Δ₁ ≥ 0` and missing `Δ₁ > 0` by one — so that cell
> needs the census or the elementary count and cannot be waved through as "nearly
> positive".
>
> **(4) The ranks below the top rank are `Γ`-closed, not owed.** At a cell of excess `d`
> and rank `r` the effective slack at rank `k` is `2(r−1−k) + (d−τ)`, which is `d−τ` at
> `k = r−1` and at least `2 = s*(5)` at every `k < r−1`. Hence at each of the five `d = 5`
> cells and each of the two `d = 6` cells **exactly one rank is `Γ`-inconclusive — the top
> one** — and every lower rank is closed by the same `Γ_n` bound that closes `d ≥ 7`, at
> the same grade. Verified exhaustively: over `d = 5..20`, `τ = 1..5`, `r = 2..79`,
> `k = 0..r−1`, the set `Γ_n ≤ 0` is exactly those seven cells. **So the Cycle 6 caveat
> "the lower ranks remain informal" is correct only as a statement about the Lean side:
> no Lean object in this run discharges `k < r−1`, and that gap is real; but the lower
> ranks are not an open residue and must not be inherited as one.** The `Γ` values are
> `+3` at order 9; `+5, +4` at 11; `+7, +15, +13` at 13; `+9, +30, +60, +60` at 15;
> `+11, +49, +139, +245, +237` at 17; `+4` at 10; `+6, +9` at 12.
>
> **(5) What is Lean and what is not.** `E993-R25-CARD5-JOINT-BUDGET-CELLS` (award C6-LA5,
> `formally_verified`) discharges the **top rank only** at each of the five `d = 5` cells,
> with bounds `9, 5, 9, 21, 42` against true cell minima `19, 39, 56, 56, 43` — far from
> sharp at four of five — and `cell_9` is a strictly-less-general replay of frozen ENTRY
> 175, so **four cells are new Lean content, not five**. The two `d = 6` cells have **no
> Lean at all**.
>
> **(6) Grade, attribution and fences.** `proved_informal`. The residue structure and both
> `d = 6` closures are **critic-attributed to C-F4-T and C-F4-U independently**, confirmed
> by the Cycle 6 F adjudicator (Rulings 30, 30b) and by the Cycle 6 synthesis, and
> re-derived independently by this second reader; the composition is
> **synthesis-composed**, and the `d ≥ 6` decision route is critic-attributed at
> **C-F4-T** and **C-F4-U**, the `d = 5` Lean cells to the **U3 lane and award C6-LA5**.
> This is the `d ≥ 5` instance of this claim on `r ≥ 2` (at `r ≤ 1` it is trivial, since
> `Δ₀ = |V| − 1 > 0`); it **raises no status**, is **never `c(d) = min(d,5)` in Lean**, is
> **never a tier statement**, and bears on no tier, on FOREST/TREE/TRANSFER or on
> Erdős #993. The new content is the **proof route and the exact residue structure,
> uniform in `d`** — not a new theorem.

---

## What it is not

- **Not a new theorem, and not a status change.** At `d ≥ 5` the hypothesis
  `τ ≤ min(d,5)` *is* `τ ≤ 5`; S1's conclusion is the registered conclusion verbatim.
  Nothing here moves `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` off VERIFIED /
  `proved_informal`, and nothing here is `formally_verified` — that grade belongs to the
  governed `lean-proof-workflow` alone, and this seat submitted nothing to it.
- **Not `c(d) = min(d,5)` in Lean, and not a tier statement.** The threshold function
  `c(d)` does not move; Tier 3b `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` stays OPEN and
  the census stays 45 closed / 28 refuted / 0 undetermined. No Lean object in this run
  states `c(d) = min(d,5)`.
- **Not a statement about the diagonal `τ = d`.** The diagonal at `d ≥ 6` is REFUTED and
  stays REFUTED (`E993-R25-COVER-DIAGONAL-D6-SIGN`, `-D7-SIGN`); a REFUTED claim never
  regresses. S1 lives entirely inside `τ ≤ 5`, where the registered theorem holds, and the
  two objects must never be conflated — that conflation is the Cycle 6 F4 seat's own
  wrong-object error (Ruling 29) and the mechanism of its struck "order 9 vacuous"
  (Ruling 31).
- **Not a no-recovery statement, and not Tier 1 or Tier 2.** `x(F) < r` enters nowhere as
  a hypothesis: `x(F) ≥ r` is the **consequent** throughout, derived from an unconditional
  `Δ_k > 0`, never the reverse. Tier 1 `E993-R25-UNR-FOREST-WIDE` and Tier 2
  `E993-G1WIDE-NO-SIZE-CAP` are untouched. Closing G1 alone does not solve Erdős #993, and
  nothing here bears on Erdős #993.
- **Not the rank-isolation reduction, and not a registration of it.** That object
  (`τ ≤ d+3`) is a separate candidate the synthesis rules **DO NOT REGISTER as drafted** —
  a scope note on `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING` at most. My `d − τ = −3`
  observation resolves in the record's favour and is not a finding against it.
- **Not a census result at `d ≥ 7`.** No census closes an infinite family; the `d ≥ 7`
  emptiness is arithmetic, and the censuses here close two named finite cells at fixed
  orders and calibrate the instrument. A finite census proves no universal statement.
- **Not a claim about `τ ≥ 6` or about `s*(τ)` at `τ ≥ 8`.** `s*(1..7) = 0,1,1,1,2,2,3` is
  confirmed; no closed form is established, `⌈(τ−1)/3⌉` breaks at `τ = 7`, and `τ ≥ 8` is
  out of reach because no registered `K(τ)` covers it.
- **Not a registration.** This seat registers nothing and writes no registry. The
  controller registers, and only what this read confirms, at the grade it confirms,
  additively, in the `E993-R25-…` namespace.

---

## Artifact inventory

All under the absolute path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/scratchpad/lane-c-SR-S1/`.
Python standard library only, exact integers throughout, **no float in any judgement or
any reported number**; no network, no package installs; never `/tmp`, `mktemp`, `TMPDIR`
or a session scratchpad. **No wall-clock, PID or host field appears in any hashed
artifact**, so every digest below is reproducible by re-running the generator.

| file | SHA-256 | import list | role |
|---|---|---|---|
| `gen_seal_audit.py` | `725c003acdf480f8569c5027be52e93e4e819f9629d9b5b2d3fb532cd106dd06` | `hashlib`, `json`, `os`, `sys` | canonical recomputation of the capsule seal; per-member digest and byte-length verification of all 57 members |
| `seal-audit.txt` | `ee9b9605c3c9016b4047ba0e8f43caa3873c97db32959e24ba67fb1ed081929d` | — | its output: seal match, 57/57 members |
| `gen_gamma_residue.py` | `c777df3ee97623ef0427cc3dbe7c9a1687df6f739c5c333c36f856cec1a0f68c` | `json`, `sys`, `math.comb` | Lemma H / Lemma T controls; `Γ`, `Γ_n`, `K(τ)`, `s*(τ)`; the residue by `(τ, slack)`; the `τ ≤ 5` branch by excess; `τ`-monotonicity; the full every-rank residue box; the rank-by-rank tables at `d = 5, 6`; the `τ ≤ d+3` sharpness scan |
| `gamma_residue.json` | `0ac6c101292269348411dbc348b41a72698c0d95478cae22c12b26e7ca2144b8` | — | its digested output |
| `gen_forest_census.py` | `a9a0409eee0ee216d26daf53267afb33f50644637c830c02b3b0ae5cd0d0121d` | `json`, `sys`, `itertools.combinations`, `math.comb` | complete forest census to order 17: AHU-canonical free-tree generation, in-code union-find acyclicity, DP vs `2^n` independence polynomials, min-cover and max-matching DPs, `x(F)`, `Δ_k` by index, the named cells, the two elementary identities |
| `census17.json` | `dc0888796892e95509297185cdc683c5bf8c8b931b25f488ca64d4ef52f67d69` | — | its digested output |
| `gen_diagnostics.py` | `b57f7e8d46e12d1694ea7267f68d3a9a5d08edf91a0693045524ca1cc7c81f9a` | `json`, `sys`, `math.comb` | the six-integer finite check below `K(5)`; the `τ ≤ 4` rows; the full registered-claim residue at every `d ≥ 2`; the vacuity split; the `d − τ = −3` failure enumeration and classification |
| `diagnostics.json` | `d540889f663e656a48d96e3579ddd91519da8805943828f06ffcf2c9bf1958c7` | — | its digested output |
| `gen_registry_query.py` | `32940dd1d7c49341358e6284820469e9bdf1f6fd128009afc100f1b236ef9956` | `hashlib`, `json`, `os`, `sys` | Stage 2 registry snapshot: digest re-verification, the eleven cited claims by key, and a by-statement sweep |
| `registry.json` | `0445e8b0e0d694b544eac59320342811826124820293d9ec1b2418b8c5c2ba64` | — | its digested output (360 claims; 0 of 11 keys absent) |

Replay (foreground, in-root):

```sh
SR=/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/scratchpad/lane-c-SR-S1
python3 "$SR/gen_seal_audit.py"      > "$SR/seal-audit.txt"
python3 "$SR/gen_gamma_residue.py"   > "$SR/gamma_residue.json"
python3 "$SR/gen_forest_census.py" 17 > "$SR/census17.json"
python3 "$SR/gen_diagnostics.py"     > "$SR/diagnostics.json"
python3 "$SR/gen_registry_query.py"  > "$SR/registry.json"
```

**Counts and their populations, for the record.** 57 capsule members verified (57/57,
zero mismatches); 1 seal recomputed canonically over 8,360 canonical bytes; 360 run-local
claims searched by key and by statement, 11 of 11 cited keys present; A000055 reproduced
at orders 1–17 and A005195 at orders 2–17, **by canonical form, never by construction
count**; **150,082 forests** assembled and **every one acyclicity-tested in code**, 0
failures; 1,071 trees cross-validated DP against direct `2^n` enumeration, 0 mismatches;
`τ = ν` and `τ = n − α` asserted on every tree, 0 failures; 7 named cells censused
completely with populations 153 / 710 / 3,073 / 10,648 / 29,915 / 329 / 1,516 and every
rank `k < r` reported with its difference index and with `x`; 2 elementary identities
checked on all 150,082 forests and 2 elementary bounds on all 329 and all 1,601 forests
of orders 10 and 12, 0 failures; `Γ`-residues computed over `τ = 1..7` × slack 0..7 to
`k = 300`, and over the every-rank box `d = 5..20`, `τ = 1..5`, `r = 2..79`, `k < r`
(**exactly 7 residue cells**); the full registered-claim residue over `d = 2..12`
(**13 cells**); the `τ ≤ d+3` sharpness scan over `τ = 2..12`, `k = 0..60`, 40 ranks each,
with 101,687 steps in the used region at 0 failures. **Every count names its population;
none is an isomorphism-class count unless it says so.**

**No background job of this seat is running.** The one harness auto-backgrounding was
killed by PID and re-run in the foreground (disclosure 1); a `ps -o pid=,args=` sweep
filtered for every one of this seat's five generator names, run immediately before this
write, returns nothing. This report was **reread before close** and is final at the
addendum seal.

Model disclosure (restated per format requirement, on one line):

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

headline_resolved: no
