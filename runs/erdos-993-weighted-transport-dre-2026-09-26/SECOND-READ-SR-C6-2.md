# Second Read

Read `SR-C6-2`, run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 6 (terminal), 2026-09-28. Reader: isolated,
no child delegation. Object: whole-row (HALL) at T2's four first-eligible-rank rows `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`,
`CB(7,112)/524`, and the naming decision K-3/K-4.

**Boot.** I am operating within VerityOS. I read exactly two VerityOS files, in this order: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem (no memory, knowledge, decisions,
operations, logs or conversations). The only subsystem in use is `experiments/`, confined to this run root and my sealed capsule. The
host placed the project `CLAUDE.md` and the user's auto-memory index in my context at session start. I did not act on either. I kept no
conversation log, because the brief confines my writes to this file and `scratchpad/c6-sr-SR-C6-2/`.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Brief `control/C6-SECOND-READ-BRIEF-SR-C6-2.md` | `8131e60a365186844247b884fa4b36831085f01629cee11428afe99fd8da39e1` | `shasum -a 256`, before following it | **match** |
| Protocol `control/C6-SECOND-READ-PROTOCOL.md` | `c2e9d131…37f9` (capsule entry) | `shasum -a 256` | match |
| Capsule `control/c6-second-read/SR-C6-2-PACKET-MANIFEST.json`, inner seal | `868b61a69ffa4de6fcdcb1f2bfb87aacfbefe0f7de4450c0f92c2e88a011b7ab` | SHA-256 of compact key-sorted JSON without `seal_sha256`, no trailing newline (`seal_check.py`) | **match** |
| Capsule members (242; stage `cycle-6-second-read-SR-C6-2`) | SHA-256 and bytes as listed | each recomputed | **242/242 match** |
| Frozen instruments under `sources/c6-stage7-sources/` that are capsule members (203) | `sources/c6-stage7-sources/SOURCE-DIGESTS.json` (itself a member) | each hashed before reading | **203/203 match** |
| Registries | 460 snapshot `6f0a5581…5b97`; frozen 434 master `eba20be3…9c84`; live 457 master `c61b122f…599e` | hashed in `sr_alias.py` | match the capsule entries |

**Read-boundary and process disclosures.**
1. **Harness spill file.** One registry excerpt printed by my own script exceeded the display limit, and the harness saved it to
   `~/.claude/projects/-Users-ashtonsperry-VerityOS/<session>/tool-results/b1p5d05kq.txt`. I read that file. It contains only my script's
   print of three claims from the capsule member `control/snapshots/CLAIM-IDENTITY.run-local.c6-stage2.json`.
2. **Registry reads.** I read the three capsule registries through scripts: whole files parsed, and the keys named below printed.
3. **Shell slip.** My first `cat brief; echo ======; cat protocol` hit a zsh `=word` expansion error after the brief. I then read the
   protocol and `startup-protocol.md` with the file reader. Nothing outside the grant was touched.
4. **Scratch-only listings and writes.** I ran `find .` inside my own scratch directory only, for digests and a bytecode check. It found
   no bytecode. There were no directory listings outside the capsule, and no `find`, `grep` or `rg` rooted above a capsule member.
5. **Copy-out replay.** I copied `ADJ-T/adj_cert_verify.py` and the four critic table files it reads (all capsule members) into
   `scratchpad/c6-sr-SR-C6-2/replay-adj/`, and ran them there as a third instrument only. Its output is byte-identical to the frozen
   `adj_cert_verify.log`.
6. **Not run or read.** No network, installs, `lake` or `lean`. No background job was started, so nothing was killed. I ran no process
   listing. Every Python run used `python3 -B`. No other VerityOS file was read.

## Statements read

- **SR-C6-2a..2d** (statement of record: `cycles/cycle-6/stage6/SYNTHESIS.md` `## Exact established results` item 1; `## Registrations`
  K-3/K-4; the SR-C6-2 row of the second-read table; the brief's "composition of record"). Each statement is whole-row (HALL) at one row,
  as composed, graded `computer_assisted`, with switch arcs load-bearing:
  - 2a: `CB(8,95)/508`;
  - 2b: `CB(7,109)/510`;
  - 2c: `CB(8,98)/524`;
  - 2d: `CB(7,112)/524`.
- **SR-C6-2e.** The naming decision: the two new keys K-3 (`d = 8`) and K-4 (`d = 7`), the predicate and alias checks, the KEY blocks
  restricted to my rows plus a fallback name, and the scope notes on (HALL) and `R30-CB-RECORD`.

Origins read in the capsule:
- T2's return;
- critiques `C-T2-F` and `C-T2-U`;
- the T adjudication `### T2` and its `## Established results` items 5–7;
- the controller facts (read as facts, never authority);
- the criterion, E1-R, threshold, FIVE-CB, FIVE-CB-ROWS and FLOW⇒SIGN keys on the 460 snapshot.

## Independent re-derivation

All instruments are mine, under `scratchpad/c6-sr-SR-C6-2/`. They use the standard library and exact `int`/`Fraction`, and they import
no seat, critic or adjudicator code. They were written from SEMANTIC-CONTRACT §1.1–1.2.

**R0. Instrument validation (`treekit.py`, `sr_validate.py`).** `treekit.py` provides:
- a generic independence-polynomial DP on any tree with any removed-vertex set;
- a NEW generic dual-number active-tag DP computing `Ψ_j = Σ_{B ∈ I_j} w_F(B)` on any tree and any leaf tag set. At a vertex `x` it tracks
  `x ∈ B`, and `x ∉ B` under both statuses of `x`'s parent. A tag child is active iff `x`'s parent, or another child of `x`, is in `B`.

Both DPs were compared with LITERAL enumeration on 77 trees: 70 random trees of order 3–16, plus `CB(1,1)`, `CB(2,1)`, `CB(1,2)`,
`CB(2,2)`, `CB(3,1)`, `CB(2,3)` and `CB(3,2)`. The comparison covered three tag sets per tree and two removal sets. (WID) was checked
layer by layer against the `q_v` route. Result: 2,623 checks, **0 failures**. Fixed points reproduced exactly as
`(n, α, x, |F|, supply, capacity, S)`:
- `K_{1,12}/8`: `(13, 12, 6, 12, 1980, 3960, −1980)`;
- path-star `(2,3,4)/7`: `(15, 11, 5, 10, 1483, 2701, −1218)`;
- path-star `(2,2,4,3)/8`: `(18, 13, 6, 12, 8033, 13467, −5434)`.

**R1. The tree and `IsTree` (`sr_rows.py`).** `CB(d,m)` is built literally: the path `r–s–v`, `m` chokes `u_i ~ r`, `d` supports
`b_ij ~ u_i`, and one private leaf `c_ij ~ b_ij`. Connectivity is checked by a spanning walk. Acyclicity is checked separately by
union-find over the edge list, failing on any edge inside one class. `|E| = n − 1` is recorded as a corollary only. Finiteness enters
the walk's termination. All four trees pass both tests separately:
- `n = 1618, 1638, 1669, 1683`;
- `|E| = 1617, 1637, 1668, 1682`;
- `n = 3 + m(2d+1)`.

**R2. Row data** (generic DP on the literal adjacency, rooted at `r`, and a closed-form cross-check
`I = (1+2y)Q_d^m + y(1+y)(1+2y)^{dm}` with `Q_d = (1+2y)^d + y(1+y)^d`, equal coefficient by coefficient):

| Row | `n` | `α` (`= m(d+1)+1`) | `x` (through `α`, zero-extended) | `Δ_x < 0`, `Δ_{x−1} ≥ 0` | `p = x+2` | `= ⌊(2dm+4)/3⌋` | `3p < 2α+1` | window | leaves | `F_p` |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | 1618 | 856 | 506 | yes, yes | 508 | yes | yes | `[508,570]` | 761 | all 761 |
| `CB(7,109)/510` | 1638 | 873 | 508 | yes, yes | 510 | yes | yes | `[510,582]` | 764 | all 764 |
| `CB(8,98)/524` | 1669 | 883 | 522 | yes, yes | 524 | yes | yes | `[524,588]` | 785 | all 785 |
| `CB(7,112)/524` | 1683 | 897 | 522 | yes, yes | 524 | yes | yes | `[524,598]` | 785 | all 785 |

**`F_p`, derived on the original tree at rank `p`.** Three instruments give the same answer:
- **Transitivity argument.** `Aut(CB(d,m)) ⊇ S_d ≀ S_m` (permute the chokes, and the legs inside a choke). It acts transitively on the
  `dm` private leaves, and `Δ_p(T − c)` is an isomorphism invariant. So the leaf set splits into two classes, `{v}` and `C`.
- **Literal check on representatives of BOTH classes.** The arm leaf `v` and four private leaves (`c_{0,0}`, `c_{m/2,d/2}`,
  `c_{m−1,d−1}`, `c_{m/3,1}`): `Δ_p(T − v) < 0`, and the four private values are equal and negative.
- **Literal check on EVERY leaf, no orbit argument** (`sr_allleaves.py`). All 761, 764, 785 and 785 leaves are favorable, with exactly
  two distinct `Δ_p(T − leaf)` values per row.

**`S` from two independent sides.**
- **Side 1, the leaf-aggregate `q_v` route.** `q_v(j) = i_j(T − {v, s_v}) − i_j(T − N[s_v])`, by generic deleted-carrier DPs on the arm
  leaf and two private representatives (equal).
- **Side 2, the network.** The generic active-tag DP `Ψ` with `F = F_p` (all leaves): `supply = [x^{p+1}]Ψ`, `capacity = [x^p]Ψ`.

Asserted at every row:
- `supply(Ψ) = Σ_F q_v(p)` and `capacity(Ψ) = Σ_F q_v(p−1)`;
- **`supply − capacity = S`**;
- `S < 0`.

`S` has 363, 366, 374 and 376 digits; supply and capacity have 365/365, 368/368, 376/376 and 378/378. The leading digits
`−2378819826946439…`, `−1018442496972491…`, `−7558097842849582…` and `−1267135235341656…` agree with T2's printed `S`. The `Φ` of the
network DP equals `I` (a third check of `α`).

**R3. E1 condition (i) at EVERY `q = 1..m`, exactly.** The check is the cleared form `r_q(p−q) ≤ r_q(p−q−1)`, with
`r_q(k) = Σ_α C(qd−1, α)·C(d(m−q)+1, k−α)·2^{k−α}` computed as an exact binomial sum. Darroch and modes are not used.
- **No failing `q`** at any row: 95, 109, 98 and 112 classes were checked.
- `max_q ρ_q` is attained at `q = 1`: 0.99508, 0.99607, 0.99523 and 0.99618.
- `μ_1 = (4dm−d+1)/6` is `1011/2`, `1523/3`, `1043/2` and `1565/3`, and `p = ⌈μ_1⌉ + 2` holds at all four rows (verified).
- `ρ_(1,d) = r_1(p−1)/r_1(p−2)` is `1354839571516225/1361543988640524`, `2982099946725/2993854889462`, `5057315892440097/5081573746706788`
  and `136682886311740/137207200323159`.

Condition (ii) of the criterion key holds identically by its registered scope note [r30 C4; SR-C4-6] (the type-path inequalities). The
criterion therefore holds at these `(d, m, p)` with no Darroch and no threshold key.

**R4. Switch necessity, exact.**
- A sector member `B ∋ r, v` excludes `s` and every hub `u_i`.
- Its `K = p − 1` further vertices are leg choices from `{∅, b_ij, c_ij}` on `dm` independent legs, so `|sec| = R_K = 2^K·C(dm, K)`.
- Every member has active weight exactly 1: `v` is active through `r`, and every `c_ij` is inactive because `u_i ∉ B`.
- Deletion images of sector members are in-sector targets (weight 1), or else lose `r` or `v` (weight 0). So the positive-weight
  deletion neighbourhood has weight at most `R_{K−1}`.
- `R_K/R_{K−1} = 2(dm−K+1)/K` equals `508/507`, `510/509`, `524/523` and `524/523`, each `= p/(p−1) > 1` exactly.
- Hence `X = sec` is deletion-deficient, and no deletion-only saturating flow exists: **the switch arcs are load-bearing.**

**R5. The certificate: my exact sequential verifier (`sr_cert.py`), written from the model statement.** The critics' per-state tables are
read as DATA only (`pb`, `pc`, `σ`, `θ`); every stored "verification" field is ignored. The tables are C-T2-F
`crit_cert_tables.json` `9c41343c…` and C-T2-U `CERT-TABLES.json` `37b450e6…`, and they are **identical entry for entry** at all four
rows.

Model, per choke state `(β, γ)` with `β + γ ≤ d`:
- `Out(β,γ) = β·pb(β,γ) + γ·pc(β,γ) + [β=1]·σ(γ)`;
- `In(β,γ) = (d−β−γ)·(pb(β+1,γ) + pc(β,γ+1))`;
- `σ(0) := 0`.

A sector source is any profile of `m` states with total `K = p−1`, and an in-sector target is any profile with total `K−1`. Every such
profile is realized, and the functions add over chokes. The verifier scales everything to integers by the lcm of denominators, then runs
an exact sequential DP over the `m` chokes: minimum total `Out` at `K`, and maximum total `In` at `K−1`. The DP was self-tested against
brute force over all profiles in 40 synthetic instances. Table completeness is checked on every state the model reads.

| Row | `θ` (= brief `θ*`) | min `Out` | max `In` | `(d−γ)σ(γ) ≤ θγ`, `γ = 1..d−1` (tight at) | `θ ≤ 1 − ρ_(1,d)` | nonneg; complete | CERTIFIED |
|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | `96/604265` | **1** | **1** | yes (1–6) | yes | yes; yes | **yes** |
| `CB(7,109)/510` | `32/317857` | **1** | **1** | yes (1–5) | yes | yes; yes | **yes** |
| `CB(8,98)/524` | `96/642947` | **1** | **1** | yes (1–6) | yes | yes; yes | **yes** |
| `CB(7,112)/524` | `8/83889` | **1** | **1** | yes (1–5) | yes | yes; yes | **yes** |

My argmin/argmax profiles agree with the critics' records. For example, at `CB(8,95)/508` the argmin is `(0,1)×36, (0,7)×1, (0,8)×58`
and the argmax is `(0,0)×22, (0,2)×1, (0,7)×72`. The exact `(1−ρ_(1,d))/θ` values come out as by-products; the struck "≥ 31×" literals
are records, not mine.

**Third instrument (replay only).** The T adjudicator's `adj_cert_verify.py`, copied out and re-run, reproduces its frozen log
byte-identically: CERTIFIED at all rows. I cite it as a replay, not as evidence.

**Structural fidelity: the certificate's functions ARE the literal network's, restricted to the sector** (my argument, from
SEMANTIC-CONTRACT §1.2). Let `B` be a sector source (`r, v ∈ B`), so `s ∉ B` and every `u_i ∉ B`.

*Arcs out of `B`.*
- **Deletions of `B`.**
  - Deleting a leg vertex `b_ij` or `c_ij` lands on an in-sector target (`r, v` kept, weight 1).
  - Deleting `r` lands on a hub-free, `r`-free set (weight 0).
  - Deleting `v` lands on a set containing `r` but not `v` (weight 0).
- **Switches of `B`.** A switch needs `u ∉ B` with `|N(u) ∩ B| = 2`. Going through the candidates:
  - `u = s`: `N(s) = {r, v}`, giving a weight-0 image (hub-free, `r`-free, `v` absent).
  - `u = u_i`: `N(u_i) ∩ B = {r} ∪ {b's of choke i}`, so the switch exists iff choke `i` has exactly one `b` (`β_i = 1`). The image
    `A = B − {r, b_ij} + u_i` keeps `v`, has exactly one hub, and has active weight exactly `γ_i`: the `c`'s of choke `i` are witnessed
    by `u_i`, and `v` is inactive since `r ∉ A`.
  - `u = b_ij` or `u = c_ij`: at most one neighbour lies in `B`, so no switch.
  - `r` and `v` are in `B`.

So the model's `Out` lists exactly the positive-capacity arcs of `B`, and assigns 0 to the four weight-0 arc kinds.

*Preimages of an in-sector target `A`.*
- Its deletion preimages are `A + x` with `x` a `b` or `c` on an empty leg. `s` and the hubs are adjacent to `r`, and `A + x` for other
  `x` is not independent.
- Its switch preimages need `u ∈ A`:
  - `u = r` gives `B = A − r + {two chokes with β = 0}`, which is `r`-free, never a sector source;
  - `u = b_ij` would put `u_i` next to `r`;
  - `u = c_ij` or `u = v` has one neighbour.

So its sector preimages are exactly one `b`-addition and one `c`-addition per empty leg, which is the model's `In`.

*Preimages of a `u_i`-switch image with `γ` `c`'s in choke `i`.* It has exactly `d − γ` sector preimages (the choice of the empty leg that
gets the `b`), all through the `u_i`-switch. Its load is therefore `(d−γ)σ(γ)`.

The certificate is thus exact over EVERY sector source and target. The sampled laboratory below checks this argument; it is not the
basis of the argument.

**R6. SAMPLED literal laboratory on each ACTUAL row (`sr_lab.py`).** The tree is built literally, with `F = F_p` derived (all leaves) and
`w_F` computed from the set definition.
- **Arcs are enumerated literally:** all deletions, and every `u ∉ B` with `|N(u) ∩ B| = 2`.
- **Targets' preimages are enumerated literally:** every `x` with `A + x` independent, and every `u ∈ A` with every independent pair from
  `N(u)`.
- **Flow assignment.** The certificate's flow is put on each literal arc by the choke-local rule read from the tables. It is asserted
  positive only on literal arcs into targets of literal weight `≥ 1`.

Horizon (seeds 928–931):

| Row | sector sources (literal arcs) | in-sector targets | switch images (per `γ = 0..d−1`) | `r`-free few-hub sources |
|---|---|---|---|---|
| `CB(8,95)/508` | 51 (27,092) | 28 | 32 (4 each) | 10 (1–2 hubs) |
| `CB(7,109)/510` | 50 (26,997) | 28 | 28 (4 each) | 10 |
| `CB(8,98)/524` | 51 (27,955) | 28 | 32 (4 each) | 10 |
| `CB(7,112)/524` | 50 (27,756) | 28 | 28 (4 each) | 10 |

The samples:
- **Sector sources:**
  - the argmin profile, twice;
  - one switch-heavy source per `γ = 0..d−1`, with as many `(1,γ)` chokes as fit;
  - an all-`c` packed source;
  - 40 uniform random sector sources.
- **In-sector targets:** the argmax profile twice, 20 random targets, and 6 deletion images.

Results, identical at all four rows:
- **Sources.** Every sector source has literal `w = 1`. Every positive-flow arc is a literal (D) or (S) arc into a target of literal
  weight `≥ 1`. The minimum literal outflow is exactly **1**, and switch arcs carry flow (1,037 to 1,395 used per row).
- **In-sector targets.** Every one has literal `w = 1`. Its sector preimages number exactly `2 × #empty legs`, and all are deletions.
  The maximum literal load is exactly **1**.
- **`r`-free preimages of in-sector targets.** In-sector targets have POSITIVE-weight `r`-free preimages, ALL through the switch at
  `u = r`:
  - totals over the sampled targets: 17,522, 23,502, 18,633 and 24,481;
  - at the argmax target: 4,234 (equal to C-T2-F's count), 5,610, 4,500 and 5,916.

  They carry 0 only because the criterion key's flow is deletion-only. No `r`-free DELETION preimage of an in-sector target exists (0
  found).
- **Switch images.** Literal `w(A) = γ` at every image. The sector preimages number exactly `d − γ`, all `u_i`-switches.
  - `max load/(θ·w)` is exactly **1**: attained, never exceeded.
  - `ρ_(1,d)·w + load ≤ w` at every image.
  - The `γ = 0` images receive 0.
- **`r`-free sources with 1–2 hubs.** Literal weight equals the number of present private leaves whose choke is present, and the arm tag
  is inactive. This is the weight model on the criterion key's face.

This is a sample, stated as such. Exactness rests on R5's DP over all profiles together with the structural argument.

**R7. The composition (my check).**

*Sources, by class.*
- **Sector (`r, v ∈ B`), weight 1.** The certificate's outflow is `≥ 1` and is scaled down to exactly 1. Scaling only lowers loads.
- **`r ∈ B`, `v ∉ B`.** Weight 0.
- **`r`-free.** Saturated exactly by the criterion key's deletion flow. Its hypotheses are:
  - `F ⊇ C` (derived);
  - `p ∈ ℕ`;
  - condition (i) at every `q` (R3);
  - condition (ii) (identical);
  - `p ≥ m + 1` (508 ≥ 96, and so on).

*Targets, by class.*
- **In-sector:** 0 from the criterion flow (it is deletion-only and puts 0 on targets containing `r`), and `≤ 1 = w` from the sector
  certificate.
- **`r ∈ A`, `v ∉ A`:** weight 0, and 0 from both parts.
- **`u_i`-switch images** (`r`-free, one hub, `v ∈ A`): `ρ_(1,d)·γ` from the criterion flow (`q = 1`), plus `≤ θ*γ` from the sector.
  The total is `≤ γ` since `θ* ≤ 1 − ρ_(1,d)`.
- **Other one-hub `r`-free targets:** `ρ_1·w` only.
- **Targets with `≥ 2` hubs:** `ρ_q·w ≤ w` only; there is no sector switch, since a sector switch inserts one hub into a hub-free set.
- **Hub-free `r`-free targets:** weight 0, and 0 from both parts (the deletions of `r` and the `s`-switches carry 0).

*Direction.* The superposed fractional flow saturates every source within every capacity. Summing over any `X` gives
`Σ_X w_F(B) = Σ_{B∈X} Σ_A f ≤ Σ_{A∈N(X)} Σ_B f ≤ Σ_{N(X)} w_F(A)`, which is (HALL-COND) for every `X` (flow ⇒ Hall). An integral
saturating flow then follows (Hall ⇒ integral flow). The companion `exists_saturatingFlow_of_weightedHall` is kernel-checked on the face
of `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`; the same step also follows from finite max-flow integrality.

*ℕ-subtractions.* `p − q − 1 ≥ p − m − 1 ≥ 411 > 0`; `K − 1 = p − 2 ≥ 0`; `d − β − γ ≥ 0` by the state range. None is truncated.

*Circularity.* There is none: `S < 0` is never used, and (WID) enters only as the identity asserted in R2.

## Findings and repairs

1. **Rows confirmed.** Every numeric claim of statements 2a–2d is reproduced by my own instruments:
   - row data;
   - `F_p` per leaf;
   - `supply − capacity = S` from two sides;
   - E1(i) at every `q`;
   - the sector ratio;
   - `θ*` and the four inequalities;
   - the literal laboratory.
2. **Repair (dependency of record).** Synthesis item 1 says "E1-R's deletion-only flow … (`proved_informal`, with its CD-1 dependency)".
   This is wrong on two counts.
   - The brief names the homogeneous criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`. Its face
     lists no other key as a dependency: condition (ii) is discharged by its own scope note [r30 C4; SR-C4-6], an elementary
     likelihood-ratio proof, and "CD-1" appears there only under an ALTERNATIVE coupling proof of that note.
   - The heterogeneous key's face says in terms that its statement "does not depend on CD-1". It specializes to the criterion key at
     `d_1 = … = d_m`, and may be cited instead at the same grade.

   **Repaired dependency:** the criterion key at `proved_informal`, with no CD-1 and no threshold key. Darroch is not needed at these rows,
   because condition (i) is checked exactly at every `q`.
3. **Repair (HALL⇒FLOW).** The brief's "registered (HALL ⇒ FLOW) key" is not a key in any of the three registries. It is the
   kernel-checked companion `exists_saturatingFlow_of_weightedHall` on the face of
   `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`, which carries no certificate of its own, or else finite max-flow
   integrality. The registration text says so.
4. **Repair (attribution).** The brief's "certificate method T2 (Claude Sonnet 5; the Cycle 5 T2 method)" misplaces the method's origin.
   - T2's return states that the choke-local LP + DP is C-T1-U's Cycle 4 method, run UNMODIFIED.
   - The registered FIVE-CB key attributes "the choke-local sector certificate" to C-T1-U (Claude Opus 5.5).
   - The Cycle 5 T2 method is that method's generalization to two choke degrees.

   **Repaired attribution:** method C-T1-U (Cycle 4); applied to these rows by T2 (Claude Sonnet 5, Cycle 6); the Cycle 5 T2
   generalization is named as precedent.
5. **Composition text.** The direction is fractional flow ⇒ (HALL-COND) ⇒ integral flow. The scaling step (Out `≥ 1` scaled down to 1)
   is named. The deletion-only reason is stated for in-sector targets, which do have positive `r`-free switch preimages. The brief's
   "composition of record" is correct apart from items 2–3.
6. **Scope.** One rank per tree. The ranks `p+1 … ⌊2α/3⌋` (62, 72, 64 and 74 further ranks) are not covered, and none of the four trees
   is closed.
7. **Naming (SR-C6-2e).**
   - **(i) Predicates.**
     - `(16m+4)/3 ∈ ℤ ⟺ 16m + 4 ≡ m + 1 ≡ 0 (mod 3) ⟺ m ≡ 2 (mod 3)`, and it equals `p`: 508 at `m = 95` and 524 at `m = 98`.
     - `(14m+4)/3 ∈ ℤ ⟺ 2m + 1 ≡ 0 (mod 3) ⟺ m ≡ 1 (mod 3)`, and it equals `p`: 510 at `m = 109` and 524 at `m = 112`.
     - `M-95-TO-107-CONGRUENT-2-MOD-3` is exactly `{95, 98, 101, 104, 107}`, and `M-109-TO-121-CONGRUENT-1-MOD-3` is exactly
       `{109, 112, 115, 118, 121}`.

     Each name asserts no more than its (merged) statement: the tree, the rank, weighted Hall, and switch arcs load-bearing (R4). **But
     each full name is a predicate only of the MERGED row set.** On my rows alone it asserts too much. It may be registered only if
     SR-C6-3 confirms all three of its rows in that family; otherwise the enumerating fallback applies (below).
   - **(ii) Alias check** (`sr_alias.py`, against the 460 snapshot, the 434 and the 457 master; the pre-screen is not my verdict):
     - no exact key, alias equality or `alias_patterns` hit, and no forbidden phrase, for K-3, K-4 and both fallbacks;
     - no registry text in the 434 or the 457 master mentions the four trees. The only mention in the 460 snapshot is a census remark
       ("first `CB(7,109)/510`") inside the fence of the `d ≤ 6` sector key, which is not an alias;
     - top lexical neighbour of all four names: the FIVE-CB first-rank key, 10/14 tokens with `E993`/`R30` counted, which is the brief's
       9/13 in the other count. It is below the 85% rule;
     - the withdrawn `…-FOUR-CB-…` name is 13/14 (0.93) of the FIVE-CB key, a confirmed near-alias, and stays withdrawn.

     Mathematically, the row sets are disjoint from:
     - the FIVE-CB key's `(8,86,460)`, `(8,89,476)`, `(8,92,492)`, `(8,108,577)` and `(7,144,673)`. Here `m = 108 ≡ 0 (mod 3)` and
       `144 ≡ 0 (mod 3)` lie outside both families;
     - the FIVE-CB-ROWS key (ranks above the first, on those five trees);
     - `G(8^82, 7^2)`, which is not a CB tree.

     The `R30-CB-RECORD` fallback is **not needed**.
   - **(iii)** KEY blocks restricted to my rows, plus fallback names, are below.
   - **(iv)** Scope notes are below. **`R30-CB-RECORD` is a record family (Tier 3), not a claim key in any of the three registries.**
     Registered text cites it as "a scope note on `R30-CB-RECORD`" and by record ids `R30-CB-RECORD-…`. I write the requested
     `SCOPE NOTE ON: R30-CB-RECORD` block accordingly; the controller files it under that record family.
   - **The uncertified count is census arithmetic only.** It moves 218 → 214 if these four confirm, and → 208 if SR-C6-3's six also
     confirm. I did not derive it: the census of record is not in my capsule.
8. **Standing errata observed.**
   - R30-E-q: the brief itself correctly calls the controller replays a third instrument.
   - The controller fact CF-T2's `θ*` literals are `σ(4..7)` of `CB(8,95)/508` (proposed erratum E-1), as I confirm from the tables.
   - CF-T2's "grade is that key's (modulo Darroch)" is superseded at these rows by the exact all-`q` check.

## Registration text

```text
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let CB(d,m) be the tree with path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to u_i and one private leaf c_ij adjacent to b_ij (n = 3 + m(2d+1)). Rows confirmed by isolated second read SR-C6-2 (the controller merges the rows m = 101, 104, 107 confirmed by SR-C6-3): for d = 8 and m ∈ {95, 98} put p = (16m+4)/3, an integer exactly when m ≡ 2 (mod 3); (T, p) = (CB(8,95), 508) with (n, α, x) = (1618, 856, 506) and (CB(8,98), 524) with (n, α, x) = (1669, 883, 522), x computed through rank α; p = x(T) + 2 is the first eligible rank and 3p < 2α + 1. Let F = F_p(T), derived on the original tree (every leaf, 761 and 785 leaves), w_F the literal active-tag weight and the relation (D) ∪ (S). Then there is a nonnegative rational flow supported on literal (D) ∪ (S) arcs that saturates every source supply w_F(B) and loads every target A at most w_F(A); summing it over any X ⊆ I_{p+1}(T) gives (HALL-COND) for every X, and an integral saturating flow follows (Hall implies an integral flow): (HALL) holds at these two (T, p). Switch arcs are load-bearing: the root-plus-arm sector sec = {B ∈ I_{p+1}(T) : r, v ∈ B} has total weight R_K = 2^K·C(8m, K) with K = p − 1 and every member of weight exactly 1, its positive-weight deletion neighbourhood lies in the in-sector layer of total weight R_{K−1}, and R_K/R_{K−1} = p/(p − 1) = 508/507 and 524/523 > 1, so no deletion-only saturating flow exists. Certificate: (i) the criterion key E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL applies with F ⊇ C, its condition (i) r_q(p − q) <= r_q(p − q − 1) verified in exact integers at every q = 1..m and its condition (ii) holding identically by its scope note [r30 C4; SR-C4-6]; it gives a deletion-arc flow saturating every non-sector source and loading each r-free target with q >= 1 chokes at exactly ρ_q·w_F(A) and every other target at 0; (ii) the choke-local sector certificate puts pb(β,γ) on each b-deletion and pc(β,γ) on each c-deletion of a choke in state (β,γ), σ(γ) on the u_i-switch of a choke in state (1,γ), and 0 on every other sector arc; with θ* = 96/604265 and 96/642947 it has outflow >= 1 at every sector source (scaled down to exactly 1), inflow <= 1 at every in-sector target, and load (8 − γ)·σ(γ) <= θ*·γ at every u_i-switch image, whose active weight is γ; (iii) θ* <= 1 − ρ_(1,8) with ρ_(1,8) = r_1(p − 1)/r_1(p − 2), so every u_i-switch image (r-free, exactly one choke) receives at most (ρ_(1,8) + θ*)·γ <= γ; in-sector targets receive 0 from (i) because that flow is deletion-only (they do have positive-weight r-free switch preimages, through the switch at r); targets with two or more chokes receive no sector flow; weight-zero targets receive nothing. The sum of (i) and (ii) is the required flow.
SCOPE: Two named ordinary trees, each at one rank only (the first eligible rank p = x + 2 = ⌊(2dm+4)/3⌋ = ⌈μ_1⌉ + 2 with μ_1 = (4dm − d + 1)/6); the ranks p+1 .. ⌊2α/3⌋ of these trees (62 and 64 further ranks) are not covered and neither tree is closed. Inputs at their grades: the criterion key (proved_informal, with its scope note [r30 C4; SR-C4-6]; no other registered dependency); the step from (HALL-COND) to an integral flow by the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE, or finite max-flow integrality; the finite sector certificates (computer_assisted). Not inputs: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD and Darroch's theorem (condition (i) is checked exactly at every q, max ρ_q = ρ_(1,8) at q = 1, 0.99508 and 0.99523); E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL specializes to the criterion key and may replace it at the same grade. Certificate data: the full per-state tables crit_cert_tables.json (SHA-256 9c41343c1f932599f9948541706e670454e11d7a497bdc83bb835133097051b1) and CERT-TABLES.json (37b450e6e7a0b6fba167d14bd8ef4741d29bcc328608e0ab97258b526fc57d83), identical entry for entry at these rows; verified by C-T2-F, C-T2-U, the T adjudicator and SR-C6-2's own sequential verifier (min outflow exactly 1, max inflow exactly 1, the switch constraint tight at γ = 1..6). The certificate's Out, In and switch-load functions are exactly the literal network's restricted to the sector (structural argument on the face of SR-C6-2 and C-T2-U; sampled literal laboratories on the actual rows by C-T2-F, C-T2-U and SR-C6-2). Row facts: F_p(T) is every leaf, derived leaf by leaf; supply − capacity = S(T, p) < 0 from two independent sides (363 and 374 digits).
ATTRIBUTION: T2 (Claude Sonnet 5; r30 Cycle 6 route C6-T-02; the row data, the application of the choke-local sector certificate to these rows unmodified, and the composition); C-T1-U (Claude Opus 5.5; r30 Cycle 4; the choke-local sector LP and DP certificate method, as registered on E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS; the r30 Cycle 5 T2 method (Claude Sonnet 5) is its generalization to two choke degrees); C-T2-F and C-T2-U (Claude Opus 5.5; the literal laboratories on the actual rows, the exact check of condition (i) at every q, the full per-state tables, the structural fidelity argument and the corrected composition direction); the r30 Cycle 6 T adjudicator (Claude Opus 5.5; the third exact verifier); the criterion key's authors as on its face; Codex (GPT-6 Astra/Sol/Luna) for the transport network, the active-tag weight, the relation (D) ∪ (S) and the CB family (the lower-region run and its corrections); the first-interior run (Codex) and r24–r26 for the definition layer; isolated second read SR-C6-2 (Claude Opus 5.5; own generic instruments, F_p leaf by leaf, (WID) from two sides, exact condition (i) at every q, own sequential verifier, sampled literal laboratory on each actual row).
FENCES: Finite instances, one rank per tree; computer_assisted, and a finite certificate never qualifies for a formal award. Not (HALL) at full scope: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Not parameter-uniform, and nothing about any other CB(d,m), rank or m ≡ 2 (mod 3) value outside the merged row set. Not a deletion-only claim (deletion-only saturation fails at both rows) and not E993-R23-LITERAL-DELETE-ONLY-HALL; no refuted mechanism is revived (literal (D) ∪ (S), literal w_F, fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination). No status transfer to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (S < 0 at these rows is a row fact), E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. Nothing here is a cut. The θ* law 288/(200m² + 82m + 5) is a conjecture record and is not part of this key. The sealed statement of E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS is not edited. No RTree or governed-model assertion; no census value enters. The full name is a predicate of the merged set m ∈ {95, 98, 101, 104, 107} only; if SR-C6-3 does not confirm all three of its d = 8 rows, register instead under the enumerating fallback name E993-R30-CB-8-M-95-OR-98-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS extended by the confirmed values (pattern E993-R30-CB-8-M-<m_1>-<m_2>-...-OR-<m_k>-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS).
ALIASES: E993-R30-FOUR-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (withdrawn Cycle 6 T2 proposal covering m = 95 and 98 of this key), r30 C6 K-3, CB 8 residue 2 first eligible rank rows weighted Hall with switch arcs
```

```text
KEY: E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let CB(d,m) be the tree with path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to u_i and one private leaf c_ij adjacent to b_ij (n = 3 + m(2d+1)). Rows confirmed by isolated second read SR-C6-2 (the controller merges the rows m = 115, 118, 121 confirmed by SR-C6-3): for d = 7 and m ∈ {109, 112} put p = (14m+4)/3, an integer exactly when m ≡ 1 (mod 3); (T, p) = (CB(7,109), 510) with (n, α, x) = (1638, 873, 508) and (CB(7,112), 524) with (n, α, x) = (1683, 897, 522), x computed through rank α; p = x(T) + 2 is the first eligible rank and 3p < 2α + 1. Let F = F_p(T), derived on the original tree (every leaf, 764 and 785 leaves), w_F the literal active-tag weight and the relation (D) ∪ (S). Then there is a nonnegative rational flow supported on literal (D) ∪ (S) arcs that saturates every source supply w_F(B) and loads every target A at most w_F(A); summing it over any X ⊆ I_{p+1}(T) gives (HALL-COND) for every X, and an integral saturating flow follows (Hall implies an integral flow): (HALL) holds at these two (T, p). Switch arcs are load-bearing: the root-plus-arm sector sec = {B ∈ I_{p+1}(T) : r, v ∈ B} has total weight R_K = 2^K·C(7m, K) with K = p − 1 and every member of weight exactly 1, its positive-weight deletion neighbourhood lies in the in-sector layer of total weight R_{K−1}, and R_K/R_{K−1} = p/(p − 1) = 510/509 and 524/523 > 1, so no deletion-only saturating flow exists. Certificate: (i) the criterion key E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL applies with F ⊇ C, its condition (i) r_q(p − q) <= r_q(p − q − 1) verified in exact integers at every q = 1..m and its condition (ii) holding identically by its scope note [r30 C4; SR-C4-6]; it gives a deletion-arc flow saturating every non-sector source and loading each r-free target with q >= 1 chokes at exactly ρ_q·w_F(A) and every other target at 0; (ii) the choke-local sector certificate puts pb(β,γ) on each b-deletion and pc(β,γ) on each c-deletion of a choke in state (β,γ), σ(γ) on the u_i-switch of a choke in state (1,γ), and 0 on every other sector arc; with θ* = 32/317857 and 8/83889 it has outflow >= 1 at every sector source (scaled down to exactly 1), inflow <= 1 at every in-sector target, and load (7 − γ)·σ(γ) <= θ*·γ at every u_i-switch image, whose active weight is γ; (iii) θ* <= 1 − ρ_(1,7) with ρ_(1,7) = r_1(p − 1)/r_1(p − 2), so every u_i-switch image (r-free, exactly one choke) receives at most (ρ_(1,7) + θ*)·γ <= γ; in-sector targets receive 0 from (i) because that flow is deletion-only (they do have positive-weight r-free switch preimages, through the switch at r); targets with two or more chokes receive no sector flow; weight-zero targets receive nothing. The sum of (i) and (ii) is the required flow.
SCOPE: Two named ordinary trees, each at one rank only (the first eligible rank p = x + 2 = ⌊(2dm+4)/3⌋ = ⌈μ_1⌉ + 2 with μ_1 = (4dm − d + 1)/6); the ranks p+1 .. ⌊2α/3⌋ of these trees (72 and 74 further ranks) are not covered and neither tree is closed. Inputs at their grades: the criterion key (proved_informal, with its scope note [r30 C4; SR-C4-6]; no other registered dependency); the step from (HALL-COND) to an integral flow by the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE, or finite max-flow integrality; the finite sector certificates (computer_assisted). Not inputs: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD and Darroch's theorem (condition (i) is checked exactly at every q, max ρ_q = ρ_(1,7) at q = 1, 0.99607 and 0.99618); E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL specializes to the criterion key and may replace it at the same grade. Certificate data: the full per-state tables crit_cert_tables.json (SHA-256 9c41343c1f932599f9948541706e670454e11d7a497bdc83bb835133097051b1) and CERT-TABLES.json (37b450e6e7a0b6fba167d14bd8ef4741d29bcc328608e0ab97258b526fc57d83), identical entry for entry at these rows; verified by C-T2-F, C-T2-U, the T adjudicator and SR-C6-2's own sequential verifier (min outflow exactly 1, max inflow exactly 1, the switch constraint tight at γ = 1..5). The certificate's Out, In and switch-load functions are exactly the literal network's restricted to the sector (structural argument on the face of SR-C6-2 and C-T2-U; sampled literal laboratories on the actual rows by C-T2-F, C-T2-U and SR-C6-2). Row facts: F_p(T) is every leaf, derived leaf by leaf; supply − capacity = S(T, p) < 0 from two independent sides (366 and 376 digits).
ATTRIBUTION: T2 (Claude Sonnet 5; r30 Cycle 6 route C6-T-02; the row data, the application of the choke-local sector certificate to these rows unmodified, and the composition); C-T1-U (Claude Opus 5.5; r30 Cycle 4; the choke-local sector LP and DP certificate method, as registered on E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS; the r30 Cycle 5 T2 method (Claude Sonnet 5) is its generalization to two choke degrees); C-T2-F and C-T2-U (Claude Opus 5.5; the literal laboratories on the actual rows, the exact check of condition (i) at every q, the full per-state tables, the structural fidelity argument and the corrected composition direction); the r30 Cycle 6 T adjudicator (Claude Opus 5.5; the third exact verifier); the criterion key's authors as on its face; Codex (GPT-6 Astra/Sol/Luna) for the transport network, the active-tag weight, the relation (D) ∪ (S) and the CB family (the lower-region run and its corrections); the first-interior run (Codex) and r24–r26 for the definition layer; isolated second read SR-C6-2 (Claude Opus 5.5; own generic instruments, F_p leaf by leaf, (WID) from two sides, exact condition (i) at every q, own sequential verifier, sampled literal laboratory on each actual row).
FENCES: Finite instances, one rank per tree; computer_assisted, and a finite certificate never qualifies for a formal award. Not (HALL) at full scope: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Not parameter-uniform, and nothing about any other CB(d,m), rank or m ≡ 1 (mod 3) value outside the merged row set. Not a deletion-only claim (deletion-only saturation fails at both rows) and not E993-R23-LITERAL-DELETE-ONLY-HALL; no refuted mechanism is revived (literal (D) ∪ (S), literal w_F, fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination). No status transfer to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (S < 0 at these rows is a row fact), E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. Nothing here is a cut. The θ* law 1152/(959m² + 449m + 32) is a conjecture record and is not part of this key. The sealed statement of E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS is not edited. No RTree or governed-model assertion; no census value enters. The full name is a predicate of the merged set m ∈ {109, 112, 115, 118, 121} only; if SR-C6-3 does not confirm all three of its d = 7 rows, register instead under the enumerating fallback name E993-R30-CB-7-M-109-OR-112-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS extended by the confirmed values (pattern E993-R30-CB-7-M-<m_1>-<m_2>-...-OR-<m_k>-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS).
ALIASES: E993-R30-FOUR-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (withdrawn Cycle 6 T2 proposal covering m = 109 and 112 of this key), r30 C6 K-4, CB 7 residue 1 first eligible rank rows weighted Hall with switch arcs
```

```text
DISTINCTION ROW: R30-C6-CB8-RESIDUE-2-FIRST-RANK-HALL-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Same theorem type (whole-network (HALL) at the first eligible rank of a homogeneous CB tree, switch arcs load-bearing, the same choke-local certificate composed with the same criterion key), disjoint instances. The registered key covers exactly (CB(8,86), 460), (CB(8,89), 476), (CB(8,92), 492), (CB(8,108), 577) and (CB(7,144), 673) and is sealed. The new key covers (CB(8,m), (16m+4)/3) for m in its merged set within {95, 98, 101, 104, 107} (m ≡ 2 mod 3); m = 108 ≡ 0 (mod 3) lies outside that family and no (T, p) is shared. The new key does not edit, extend or supersede the registered statement; the shared tokens (9 of 13 without the E993 and R30 prefixes) name the same mechanism, not the same instances.
```

```text
DISTINCTION ROW: R30-C6-CB7-RESIDUE-1-FIRST-RANK-HALL-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Same theorem type, disjoint instances. The registered key's only d = 7 row is (CB(7,144), 673), with 144 ≡ 0 (mod 3); the new key covers (CB(7,m), (14m+4)/3) for m in its merged set within {109, 112, 115, 118, 121} (m ≡ 1 mod 3). No (T, p) is shared, and the registered statement is not edited.
```

```text
DISTINCTION ROW: R30-C6-CB8-AND-CB7-FIRST-RANK-HALL-VS-FIVE-CB-ROWS-DELETION-HALL
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: The registered key is deletion-arc (HALL) at the ranks ABOVE the first eligible rank of five other CB trees. The two new keys are (D) ∪ (S) (HALL) at the FIRST eligible rank only, on different trees (CB(8,m) with m ≡ 2 mod 3 in 95..107 and CB(7,m) with m ≡ 1 mod 3 in 109..121), where deletion-only saturation provably fails (sector ratio p/(p − 1) > 1). Different trees, different ranks, different arc classes; neither implies the other, and the new keys assert nothing above the first rank.
```

```text
DISTINCTION ROW: R30-C6-CB-FIRST-RANK-HALL-VS-CHOKE-TREE-448-HALL
KEY: E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key is (HALL) at rank 448 of the one heterogeneous tree G(8^82, 7^2), certified by a two-degree sector LP and the heterogeneous mark-clone key. The new keys are (HALL) at first eligible ranks of homogeneous CB(8,m) and CB(7,m) trees, certified by the one-degree choke-local certificate and the homogeneous criterion key. No tree or (T, p) is shared; the shared name tokens describe the mechanism only.
```

```text
DISTINCTION ROW: R30-C6-CB-FIRST-RANK-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key is a universal unweighted deletion-only Hall inequality on the r23 tagged top side. The new keys are finite (HALL) certificates with the active-tag weight w_F on (D) ∪ (S) at named (T, p), where deletion-only saturation provably fails (the root-plus-arm sector is deletion-deficient by the factor p/(p − 1)) and switch arcs carry load. Different weight, relation, family and scope; the refuted key stays REFUTED and nothing is revived.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C6; SR-C6-2] (HALL) holds at the first eligible rank of CB(8,95) (p = 508), CB(8,98) (p = 524), CB(7,109) (p = 510) and CB(7,112) (p = 524), with switch arcs load-bearing (the root-plus-arm sector is deletion-deficient by exactly p/(p − 1)); computer_assisted; keys E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS as merged with SR-C6-3's confirmed rows (or their enumerating fallback names). One rank per tree: the higher eligible ranks of these four trees are not covered and none of them is closed. Since (HALL-COND) holds for every X at (CB(8,95), 508), that row leaves the (CUT) site list; no deficient cut exists anywhere in the Cycle 6 record. This key stays OPEN at full scope; no status transfer to the primary aggregate; the θ* laws are conjecture records only. Attribution as on the two keys.
```

```text
SCOPE NOTE ON: R30-CB-RECORD
TEXT: [r30 C6; SR-C6-2] Bounded record (the census of record is not re-derived here): the four rows CB(8,95)/508, CB(7,109)/510, CB(8,98)/524 and CB(7,112)/524 are certified switch-necessary first-eligible CB rows (keys E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS); at the census of record (223 rows, d <= 13) the uncertified count moves 218 → 214 by census arithmetic, and to 208 if SR-C6-3 confirms its six rows. Row facts at these rows (bounded_computation): θ* = 96/604265, 32/317857, 96/642947, 8/83889 (LP-optimum values of one affine-relaxed local model, not instance invariants); exact (1 − ρ_(1,d))/θ* = 4051244613614535235/130708222909490304 (about 30.9946), 3736390833554609/95803356462784, 15596514627206178377/487831079683851648, 6816082148447/170100356824; in-sector targets have positive-weight r-free switch preimages (4,234 at the CB(8,95)/508 argmax target), which carry no flow in the composition. Grade bounded_computation. Attribution: T2 (Claude Sonnet 5); C-T2-F and C-T2-U (Claude Opus 5.5); the r30 Cycle 6 T adjudicator (Claude Opus 5.5); SR-C6-2 (Claude Opus 5.5). R30-CB-RECORD is a record family, not a claim key.
```

## Verdicts

verdict[SR-C6-2a]: confirmed_with_repairs
verdict[SR-C6-2b]: confirmed_with_repairs
verdict[SR-C6-2c]: confirmed_with_repairs
verdict[SR-C6-2d]: confirmed_with_repairs
verdict[SR-C6-2e]: confirmed_with_repairs

**Rows 2a–2d.** The mathematics and every number are confirmed. The repairs are to the text of record, and the exact repaired text is the
two KEY blocks above:
- the dependency is the criterion key alone, with no CD-1 and no threshold key or Darroch;
- HALL⇒FLOW is named as the kernel-checked companion, or max-flow integrality;
- the certificate method is attributed to C-T1-U, applied by T2;
- the direction and the scaling are stated.

**2e.** The names are predicates of the MERGED row sets and pass the alias check against all three registries. The repairs are:
- register under the full names only after SR-C6-3 confirms all six of its rows; otherwise use the enumerating fallback;
- the scope note on `R30-CB-RECORD` is filed as a record-family note;
- the attribution repair above.

## Artifact inventory

**Deliverable:** this file, `second-reads/SR-C6-2/SECOND-READ.md`.

**Scratch** (`scratchpad/c6-sr-SR-C6-2/`). Everything ran with `python3 -B` in the foreground, using the standard library and exact
`int`/`Fraction`. There is no bytecode, and no background job was started.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `bbcb17ddcbdce0323846f13fadb374d103a7b3aa04cacbd2e313ecfd2e849aa8` | capsule seal and 242 member digests |
| `treekit.py` | `ff36a0cc57817e854957bdf440d1ebca821a9c9ea58787f8c105166e07662e24` | generic tree kit: CB builder, connectivity / union-find acyclicity, deleted-carrier DP, active-tag dual-number DP, literal weight |
| `sr_validate.py` | `fde263cc89d9a2a2d4e4d4d0435a8b5b0757ac4498341417490f0bef0b6c798f` | literal-enumeration validation (77 trees, 2,623 checks) |
| `out_sr_validate.txt` | `31cc31c6ca88d127e9bb9db482757cc914dde4aa169ac338ef7bf96c5594f065` | `ALL_MATCH true` |
| `sr_rows.py` | `da19a28a3b58c7e6e8ffb708a3d5897bdf36d64b0d5cf61623d74cbd75afbf23` | fixed points; row data; `F_p` reps; `S` two sides; E1(i) every `q`; `μ_1`; `ρ_(1,d)`; sector ratio |
| `out_sr_rows.txt` | `bde3fbf499ea3e3ddc20ef02d8f7c3b3d987e748619b59b9bd7cea3f05db24b8` | output (`RESULT_SHA256 8d01c5da…adb2`) |
| `sr_allleaves.py` | `cc696a637aac1386afeff463995d6ace1e0baa1c7dab64e23fde4dd1290cb463` | `F_p` literally for every leaf |
| `out_sr_allleaves.txt` | `21b4b7a5ba3e4a81b0b0cb22a0d4b26ae40c6cc299a3173b30257e02ef655ea3` | 761/764/785/785 favorable |
| `sr_cert.py` | `c070b7b3ff80586c27fa8fa71a85c580f552e04a59c4c08cd830cd45850cb3b4` | own exact sequential verifier (tables as data) |
| `out_sr_cert.txt` | `6186037890ff98474076085b165802343b2e7b09d4fe2af555fc8703c1c4b23a` | CERTIFIED ×4 (`RESULT_SHA256 7152d3d6…6840`) |
| `sr_lab.py` | `c08480c4c3fcdf317f71496df86d1ed68bd10ff123c22a77345afb339aaee736` | sampled literal laboratory on the actual rows |
| `out_sr_lab_8_95.txt` | `3c6779a8d6a552a35dc9c240affae5ff087eb7eeabb165001a4d0edf683979c8` | pass (`cd7b4bf0…6e49`) |
| `out_sr_lab_7_109.txt` | `12dd9c33c6c1d60f30b0723056b61ba2d7a297dbe3e4b205bf77e4fdfb53b6c4` | pass (`2f965a4c…6eaa`) |
| `out_sr_lab_8_98.txt` | `6f4be542b6b30252e7fd68309146ec9469796d78100adf80694c81f9dc585abe` | pass (`b3bd02f8…5ce`) |
| `out_sr_lab_7_112.txt` | `8d28a4045b761317bd82674027c1d8e4d601189cfa600bc2f0e0f13df85f26b0` | pass (`5bf2cb99…822f`) |
| `sr_alias.py` | `2ba4b90db361d3b997048cd817361c37b1ef60ad1eb156fc80ea076e0133919b` | alias check against 460 / 434 / 457 |
| `out_sr_alias.txt` | `e4dea70137b132049d339ce41ace4067a03597fe647bf6f797ad7b787dbd5df1` | output (`RESULT_SHA256 7164ed1f…963c`) |
| `replay-adj/` (`adj_cert_verify.py` and 4 table copies) | as frozen (`9e7e2fff…`; `9c41343c…`, `37b450e6…`, `4b1b7c70…`, `a22aa73b…`) | third instrument, copy-out replay |
| `replay-adj/re_adj_cert_verify.log` | `9ab511a4b4a8a9878e235c1cb076d7df55274032f27ce3a926bdd56efb8bf054` | byte-identical to the frozen log |

Replay (from `scratchpad/c6-sr-SR-C6-2/`):
```
python3 -B seal_check.py
python3 -B sr_validate.py
python3 -B sr_rows.py
python3 -B sr_allleaves.py 8 95 508    # likewise 7 109 510, 8 98 524, 7 112 524 (about 1 min each)
python3 -B sr_cert.py
python3 -B sr_lab.py 8 95 508 928 40 20 4 10    # 7 109 510 929 / 8 98 524 930 / 7 112 524 931
python3 -B sr_alias.py
```

**Background jobs:** none. I reread this file before closing.
