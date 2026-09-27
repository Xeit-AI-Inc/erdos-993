# Second Read

Isolated second read **SR-C6-3**, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 6 (the terminal cycle).
Statements: whole-row (HALL) at the six critic-derived rows `CB(8,101)/540`, `CB(7,115)/538`, `CB(8,104)/556`, `CB(7,118)/552`,
`CB(7,121)/566`, `CB(8,107)/572` (SR-C6-3a..3f), and the KEY blocks for these rows (SR-C6-3g). Session date 2026-09-27 (the brief is
dated 2026-09-28).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, in full. I loaded no other VerityOS subsystem; the only
subsystem in use is `experiments/`, confined to this run root and my sealed capsule. The host placed the project `CLAUDE.md` and the
user's auto-memory index in my context at session start; I did not act on either, and I kept no conversation log, because the brief
confines my writes to this file and `scratchpad/c6-sr-SR-C6-3/`.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Brief `control/C6-SECOND-READ-BRIEF-SR-C6-3.md` | `868b565f7034fc4daf001c24280f16b1edbf322a2fdefd4f3df2c1dca117a098` | `shasum -a 256`, before following it | **match** |
| Protocol `control/C6-SECOND-READ-PROTOCOL.md` | capsule entry | `c2e9d131218cd682ab9113d8d0c536834dbf3c0e1e6aa2cdd5d8d1cb218837f9` | matches its capsule entry |
| Capsule `control/c6-second-read/SR-C6-3-PACKET-MANIFEST.json`, inner seal | `6e72a1e5c8fbc68c1b0e05889fbb61810655d634d49e39feec24f521045b6d7d` | SHA-256 of compact key-sorted JSON (`(",",":")`, no trailing newline) of the manifest minus `seal_sha256` | **match** (file digest `fe45850d…77b1`) |
| Capsule members | 242 files (`file_count` 242), SHA-256 each | recomputed | **242/242 match** |
| Frozen instruments under `sources/c6-stage7-sources/` in the capsule | 203 files | against that directory's `SOURCE-DIGESTS.json` (itself a capsule member) | **203/203 match**, before any was read |

**Read-boundary and process disclosures.**
1. **Reads.** Capsule members only, plus the two boot files. Of the capsule I read: the brief and protocol; `SEMANTIC-CONTRACT.md`;
   `SOLUTION-CONTRACT.md`; the synthesis (`## Exact established results`, `## Refuted or narrowed mechanisms`, `## Headline verdicts`,
   `## Progress and stop-gate ruling`, `## Registrations`, `## Continuation ruling`, and its preamble); T2's return; the critiques
   `C-T2-F` and `C-T2-U`; the T adjudication (preamble, identity, `### T2`, `## Cross-route reconciliation`, `## Established results`);
   the Stage 5 T and Stage 6 controller facts (by grep and a printout of the Stage 5 facts); the controller alias pre-screen; the
   registry faces I cite, from the 460 snapshot, the 434 master and the 457 master (by script); `control/CLAIM-DISTINCTIONS.json`
   structure and its last rows (by script); two `grep` lines of `cycles/cycle-5/CYCLE-CLOSE.md`; and, as DATA or third-instrument
   replays only, `C-T2-F/crit_extend_{a,b}.json`, `C-T2-U/own/CERT-TABLES.json`, `C-T2-U/own/out_row_{8_101,7_115,8_104,7_118}.json`,
   `C-T2-F/crit_frontier.json`, `C-T2-F/out_crit_frontier.txt` and `ADJ-T/adj_cert_verify.log` (parts).
2. **Attempted non-member paths.** My comparison script tried to open `C-T2-U/own/out_row_7_121.json` and `…/out_row_8_107.json`;
   neither exists (and neither is a member); the script caught `FileNotFoundError` and read nothing.
3. **Listings outside the capsule (names only).** One `ls -d` of `scratchpad/c6-sr-SR-C6-3` and `second-reads/SR-C6-3` (both absent)
   before `mkdir -p` of these two granted write locations. `ls` and one `find . -name __pycache__ -o -name '*.pyc'` rooted INSIDE my
   own scratch (empty result). No other listing, `find`, `grep` or `rg` above a capsule member.
4. **Display artefacts.** The tool display truncated the middle of `verity.md` on first read; I re-read that middle section. The
   host saved one of my `cat` outputs of a capsule member (T2's return) to its own tool-results file and I read it back from there;
   the bytes are the member's.
5. **One edit of my own script** (`sed -i` on `sr3_lab.py`, removing an unused flag); no sealed member was touched.
6. **Not read:** SR-C6-2's brief or read (the brief's "as SR-C6-2e" was applied from this brief's own description), `C6-ALLOCATION.md`
   (not opened), other returns, critiques, adjudications, second reads, `scratchpad/c6-*` seat scratch outside the frozen
   copies, other roots, Mathlib/Lean sources, the network. No installs, no `lake`/`lean`, no background jobs, no process listing, no
   kills. Every script ran `python3 -B` in the foreground with the standard library and exact `int`/`Fraction`; no bytecode exists.
7. **Harness noise.** One `echo =====` in zsh printed "not found" (a shell `=`-expansion artefact); it had no effect.

## Statements read

Statement of record: `cycles/cycle-6/stage6/SYNTHESIS.md`, `## Exact established results` item 1 (the six rows with
`C-T2-F`/`C-T2-U` attribution, the mechanism, the conditions), `## Registrations` K-3 and K-4 and the naming decision, the S-2 scope
note on `R30-CB-RECORD`, and the SR-C6-3 row of the "Cycle 6 second-read batch" table (fences "as SR-C6-2": one rank per tree; a
literal laboratory on the actual row; E1(i) exact; grade sought `computer_assisted`).

- **SR-C6-3a** `CB(8,101)/540` (`n = 1720`, `α = 910`, `θ* = 96/682829`, margin 32.95; C-T2-F and C-T2-U).
- **SR-C6-3b** `CB(7,115)/538` (1728, 921, `64/707469`, 41.14; C-T2-F and C-T2-U).
- **SR-C6-3c** `CB(8,104)/556` (1771, 937, `96/723911`, 33.92; C-T2-F and C-T2-U).
- **SR-C6-3d** `CB(7,118)/552` (1773, 945, `64/744785`, 42.21; C-T2-F and C-T2-U).
- **SR-C6-3e** `CB(7,121)/566` (1818, 969, `16/195765`, 43.28; C-T2-F only).
- **SR-C6-3f** `CB(8,107)/572` (1822, 964, `96/766193`, 34.90; C-T2-F only).

Each asserts: at `(T, p) = (CB(d,m), ⌊(2dm+4)/3⌋)`, `p = x + 2` the first eligible rank, `F = F_p(T)` = every leaf, the literal network
of SEMANTIC-CONTRACT §1.2 has a saturating integral flow, switch arcs load-bearing, grade `computer_assisted`, built as (criterion
key's deletion-only flow on `r`-free sources) + (exact homogeneous sector certificate) ⇒ (HALL-COND) for every `X` ⇒ integral flow.
- **SR-C6-3g** the KEY blocks under K-3 (`m = 101, 104, 107`) and K-4 (`m = 115, 118, 121`), restricted to my confirmed rows, with the
  predicate and alias checks, the FIVE-CB distinction row, and the scope note on `R30-CB-RECORD`.

Registered inputs, read on their faces in the 460 snapshot: the criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (VERIFIED, `proved_informal`; its criterion is conditions
(i) and (ii); its scope note `[r30 C4; SR-C4-6]` proves (ii) identically by an elementary likelihood-ratio argument; its second proof via
the coupling is the only place any other dependency appears, and the heterogeneous extension's face states "The statement does not
depend on CD-1"); the threshold key (`proved_informal`, modulo Darroch); `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-…` (the precedent);
`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (formally verified; companion `exists_saturatingFlow_of_weightedHall`
on its face is the kernel-checked (HALL⇒FLOW)). There is no registry key named "(HALL ⇒ FLOW)"; the brief's "registered (HALL ⇒ FLOW)
key" is that companion lemma.

## Independent re-derivation

**Instrument** (`scratchpad/c6-sr-SR-C6-3/`, written from SEMANTIC-CONTRACT §1.1–1.2 only; it imports no seat, critic or adjudicator
code; critic tables are read as DATA in step (5) only).

- `sr3_lib.py`: my own `CB(d,m)` labelling; `IsTree` by two SEPARATE tests (iterative DFS connectivity; union-find acyclicity; `|E| = n−1`
  recorded as a consequence only); a generic rooted-tree independence DP on the ORIGINAL carrier with a forced-out set; a NEW generic
  dual-number DP for `Ψ_j = Σ_{B∈I_j} w_F(B)` with states IN / OUT-parent-in / OUT-parent-out, counting every present `F`-leaf child and
  subtracting exactly the configurations in which it is the only neighbour of its support in `B` (the literal active rule); the CB closed
  forms `I(T) = (1+2y)Q_d^m + y(1+y)(1+2y)^{dm}`, `I(T−v)`, `I(T−c)`, `q_v = [y^j] y(1+2y)^{dm}`, `q_c = [y^j](1+2y)Q_d^{m−1}y(1+y)^{d−1}`.
- `sr3_validate.py` → `out_validate.txt`: 198 (random tree, tag set) pairs of order 4–14 (all leaves and random subsets) and `CB(2,2)`,
  `CB(3,2)`, `CB(2,3)`, `CB(1,4)`, `CB(1,3)`, `CB(3,1)`: DP layers and weights equal literal enumeration at every size, (WID) holds at every
  `j`, closed forms equal the generic DP. Fixed points reproduced exactly: `K_{1,12}/8` `(13,12,6,12,1980,3960,−1980)`; path-star
  `(2,3,4)/7` `(15,11,5,10,1483,2701,−1218)`; `(2,2,4,3)/8` `(18,13,6,12,8033,13467,−5434)`. **ALL_OK True.**

**Checks (1)–(6) at each row** (horizon: the literal row itself; all integers exact).

| Row | (1) `IsTree` conn / acyc | `n` | `α` (= `m(d+1)+1`) | `x` (through `α`) | window | `p = x+2 = ⌊(2dm+4)/3⌋`, `3p < 2α+1` | (2) `\|F_p\|` = leaves, leaf by leaf | `S < 0` (digits) | (WID) two sides | sector ratio `R_K/R_{K−1}` |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,101)/540` | yes / yes | 1720 | 910 | 538 | `[540,606]` | yes | 809 / 809 | yes (386) | yes | `540/539` |
| `CB(7,115)/538` | yes / yes | 1728 | 921 | 536 | `[538,614]` | yes | 806 / 806 | yes (386) | yes | `538/537` |
| `CB(8,104)/556` | yes / yes | 1771 | 937 | 554 | `[556,624]` | yes | 833 / 833 | yes (397) | yes | `556/555` |
| `CB(7,118)/552` | yes / yes | 1773 | 945 | 550 | `[552,630]` | yes | 827 / 827 | yes (396) | yes | `552/551` |
| `CB(7,121)/566` | yes / yes | 1818 | 969 | 564 | `[566,646]` | yes | 848 / 848 | yes (406) | yes | `566/565` |
| `CB(8,107)/572` | yes / yes | 1822 | 964 | 570 | `[572,642]` | yes | 857 / 857 | yes (409) | yes | `572/571` |

- **Row data, both sides** (`sr3_rows.py` → `out_rows.jsonl`). Side A: the generic DP on the literal tree gives `I(T)`, `α`, `x` (scanned
  through `α` with zero extension; `Δ_x < 0 ≤ Δ_{x−1}`), `F_p` for the arm leaf and four literal private representatives (chokes `0`,
  `⌊m/2⌋`, `m−1`, `⌊m/3⌋`), `q_v` from `H_v`/`R_v` deletions. Side B: the closed forms give the same `I(T)`, `α`, `x`, both favorability
  signs and the same `S` to the last digit.
- **`F_p` per leaf, literally** (`sr3_allleaves.py` → `out_allleaves.jsonl`): `Δ_p(T − ℓ) < 0` computed on the ORIGINAL tree for EVERY
  leaf `ℓ` (no orbit argument): every leaf is favorable at every row; per-leaf `q_ℓ(p)`, `q_ℓ(p−1)` take exactly two values (arm, private);
  the literal leaf sum `S` equals the dual-DP `supply − capacity`, and `supply = Σ_F q_ℓ(p)`, `capacity = Σ_F q_ℓ(p−1)` separately. The
  dual DP never sees `q_ℓ`, so this is (WID) from two genuinely different computations. My full `S` equals C-T2-U's shipped `S` digit for
  digit at the four shared rows, and C-T2-F's `n, α, x`, window, leaf count and `S` digit count at all six (`out_compare.jsonl`; replay
  only).
- **(3) The criterion, both conditions, exactly** (`sr3_e1.py` → `out_e1.jsonl`), from the criterion key's own face:
  `a_q = qd−1`, `b_q = d(m−q)+1`, `N_q(α,k) = C(a_q,α)C(b_q,k−α)2^{k−α}`, `j = p−q` in the integers. Condition (i)
  `r_q(j) ≤ r_q(j−1)` holds at **every** `q = 1..m` (101, 115, 104, 118, 121 and 107 values); condition (ii), both prefix inequalities at
  every `α ∈ [0, a_q]`, holds at every `q` — checked directly, so the key's type-path scope note is not needed at these rows either.
  `max_q ρ_q = ρ_1` at every row (0.995368, 0.996278, 0.995501, 0.996373, 0.996463, 0.995627). A second coding of `r_q` by polynomial
  powers agrees at `q = 1, 2, m`. `p ≥ m + 1`. No Darroch, no Newton, no threshold key. For the record, `p = ⌈μ_1⌉ + 2` with
  `μ_1 = 1075/2, 1607/3, 1107/2, 1649/3, 1691/3, 1139/2`.
- **(4) Switch necessity.** Every sector member (`r, v ∈ B`) has literal weight 1 (`r` blocks every hub, so every private tag is
  inactive; `v` is active through `r`). Deleting `r` or `v` lands on weight 0 (no hub; `v` loses its only witness). Deleting a leg lands
  in-sector (weight 1), and every in-sector `p`-set is such an image (`K − 1 < M`). So `Σ_{sec} w = R_K = 2^K C(M,K)` against a
  positive-weight deletion neighbourhood of weight `R_{K−1}`, and `R_K/R_{K−1} = 2(M−K+1)/K = p/(p−1) > 1` exactly at all six rows: no
  deletion-only saturating flow exists, and the switch arcs are load-bearing.
- **(5) The certificate, re-verified from the critics' tables as DATA** (`sr3_cert.py` → `out_cert.jsonl`). The flow I verify is DEFINED
  by me from the table: on a sector source with choke states `(β_i, γ_i)` (`Σ(β_i+γ_i) = K = p−1`), each support deletion carries
  `pb(β,γ)`, each private-leaf deletion `pc(β,γ)`, the switch inserting `u_i` at a `(1,γ)` choke carries `σ(γ)` (`σ(0) := 0`), every other
  arc 0. In exact integers (one common denominator), by a sequential min-plus / max-plus DP over the `m` chokes and ALL choke-state
  profiles:

  | Row | tables C-T2-F = C-T2-U | nonneg; domains complete | min Out (all profiles) | max In (all profiles) | `(d−γ)σ(γ) ≤ θ*γ`, `γ = 1..d−1` (tight at) | `θ*` | `1 − ρ_1` | exact margin `(1−ρ_1)/θ*` |
  |---|---|---|---|---|---|---|---|---|
  | `CB(8,101)/540` | identical | yes | **1** | **1** | yes (1–6) | `96/682829` | `102627591581/22155402234980` | `10011013675951807/303845516365440` ≈ 32.9477 |
  | `CB(7,115)/538` | identical | yes | **1** | **1** | yes (1–5) | `64/707469` | `174891725521/46991473054107` | `41243491387538783/1002484758487616` ≈ 41.1413 |
  | `CB(8,104)/556` | identical | yes | **1** | **1** | yes (1–6) | `96/723911` | `19613737445677/4359770838823980` | `14198600288037482747/418538000527102080` ≈ 33.9243 |
  | `CB(7,118)/552` | identical | yes | **1** | **1** | yes (1–5) | `64/744785` | `646420241665/178210890061849` | `481444099688467025/11405496963958336` ≈ 42.2116 |
  | `CB(7,121)/566` | C-T2-F only | yes | **1** | **1** | yes (1–5) | `16/195765` | `21447340463/6062924489599` | `4198638605739195/97006791833584` ≈ 43.2819 |
  | `CB(8,107)/572` | C-T2-F only | yes | **1** | **1** | yes (1–6) | `96/766193` | `22623031331049/5173467627355748` | `5777869414876808819/165550964075383936` ≈ 34.9009 |

  **CERTIFIED at all six.** The brief's `θ*` and margins are exact. **Dependence on critic data:** the table VALUES (`pb`, `pc`, `σ`,
  `θ*`) are C-T2-F's LP output (identical to C-T2-U's at the first four rows); everything else in (5) — the flow rule, the profile DP,
  `ρ_1`, the comparisons — is my own code. A certificate is valid however it was found, so this dependence affects provenance, not
  soundness. The `θ*` values fit `288/(200m²+82m+5)` (`d = 8`) and `1152/(959m²+449m+32)` (`d = 7`) exactly — a record, not evidence.
- **Structural fidelity (why the choke-local model IS the literal network on the sector), checked on the face against §1.2.** In a sector
  source `B` every hub `u_i` and `s` is absent (they neighbour `r`). Its (D) arcs: deleting a leg vertex (in-sector target, weight 1),
  deleting `r` or `v` (weight 0). Its (S) arcs need `u ∉ B` with `|N(u) ∩ B| = 2`: `u = s` (removes `r, v`; weight-0 target), or `u = u_i`
  where choke `i` has exactly one support in `B` (state `(1,γ)`), giving `A = B − {r, b} + {u_i}`, which has exactly one hub and weight
  exactly `γ` (the choke's `γ` private tags are active through `u_i`; `v` has lost `r`; other chokes' tags have no hub); no leaf or support
  insertion has two neighbours in `B`. An in-sector target (`r, v ∈ A`) has sector preimages only by adding a support or a private leaf at
  one of its `d−β−γ` empty legs per choke (preimage choke states `(β+1,γ)` and `(β,γ+1)`), which is the model's `In`; no (S) arc from a
  sector source lands in-sector (every sector switch removes `r`). A switch image with `γ` private leaves has exactly `d−γ` sector
  preimages (the removed support sat on one of the `d−γ` legs without a private leaf), which is the model's `(d−γ)σ(γ)`.
- **(6a) Sampled literal laboratory on each ACTUAL row** (`sr3_lab.py … 8 2027` → `out_lab.jsonl`). The 1720–1822-vertex tree, `F` = all
  leaves, `w_F` by the set definition, arcs enumerated from the vertex set, all preimages of a target enumerated from the vertex set:

  | Row | sources (literal arcs) | min literal outflow | in-sector targets (sector preimages) | max literal load | switch images, every `γ = 0..d−1` | max load / `(θ*·w)` | `r`-free positive-weight switch preimages into in-sector targets |
  |---|---|---|---|---|---|---|---|
  | `CB(8,101)/540` | 19 (10,904) | **1** (argmin) | 12 (6,480) | **1** (argmax) | 24 | **1** | 26,702 |
  | `CB(7,115)/538` | 18 (10,396) | **1** | 12 (6,456) | **1** | 21 | **1** | 34,412 |
  | `CB(8,104)/556` | 19 (11,233) | **1** | 12 (6,672) | **1** | 24 | **1** | 28,324 |
  | `CB(7,118)/552` | 18 (10,645) | **1** | 12 (6,624) | **1** | 21 | **1** | 36,195 |
  | `CB(7,121)/566` | 18 (10,933) | **1** | 12 (6,792) | **1** | 21 | **1** | 38,268 |
  | `CB(8,107)/572` | 19 (11,538) | **1** | 12 (6,864) | **1** | 24 | **1** | 30,028 |

  Sources: the DP argmin profile (two shuffles), all-private and all-support extremes, one switch-saturated source per `γ = 1..d−1`, eight
  uniform random sector sources; every source has literal weight 1, every positive-flow arc is a literal (D)∪(S) arc to a target of
  literal weight ≥ 1, every switch target has literal weight `γ`. Targets: the argmax profile (two shuffles), four random, six deletion
  images; every one weight 1; no sector preimage of an in-sector target arises through a switch (0 at every row); an exhaustive
  literal-validity spot check of every enumerated preimage of the first two targets passes. Switch images: three per `γ`, literal weight
  `γ`, exactly `d − γ` sector preimages, sector load `(d−γ)σ(γ)` equal to `θ*γ` at the tight `γ`, and `+ ρ_1γ ≤ γ`; the `γ = 0` images get
  0. The laboratory is sampled; exactness over every source and target comes from (5) plus the structural argument above.
- **(6b) Composition: coverage, direction, scaling** (proved here on the face).
  - *Sources.* `I_{p+1} = sec ⊔ {r ∈ B, v ∉ B} ⊔ {r ∉ B}`. `sec` is served by the certificate; `r ∈ B, v ∉ B` has weight 0; `r`-free sources
    are served by the criterion key's flow (its domain `I_{p+1} ∖ sec` contains the weight-0 class, which sends nothing).
  - *Hypotheses of the criterion key*, each met: `T = CB(d,m)`, `d, m ≥ 1`; `F ⊇ C` (every leaf is in `F`, derived); `p` natural; the
    criterion (i) and (ii) at `(d,m,p)` exact. It gives a nonnegative rational flow on (D) arcs from `I_{p+1} ∖ sec`, saturating, loading
    each `r`-free target with `q ≥ 1` hubs at `ρ_q w_F(A) ≤ w_F(A)` and every other target (in particular every target containing `r`) at 0.
  - *Scaling.* Each sector source has certificate outflow `Out(B) ≥ 1 = w_F(B)`; multiply its arc flows by `1/Out(B) ≤ 1`. Loads only drop.
  - *Targets.* In-sector targets: 0 from the criterion flow (they contain `r`), `≤ 1 = w_F(A)` from the certificate. Switch images:
    `r`-free with exactly one hub (`q = 1`), so `ρ_1 γ` from the criterion flow plus `≤ θ*γ` from the certificate, total
    `≤ (ρ_1 + θ*)γ ≤ γ = w_F(A)` because `θ* ≤ 1 − ρ_1`. Targets with `≥ 2` hubs, hub-free `r`-free targets (weight 0) and all others: the
    criterion flow only (`≤ ρ_q w_F(A)` or 0). So the sum `f` is a nonnegative fractional flow on literal (D)∪(S) arcs, saturating every
    source, within every capacity.
  - *Direction.* Flow ⇒ Hall: for every `X ⊆ I_{p+1}`, `Σ_{B∈X} w_F(B) = Σ_{B∈X} Σ_A f(B,A) = Σ_{A∈N(X)} Σ_{B∈X} f(B,A) ≤ Σ_{A∈N(X)} w_F(A)`
    (positive flow only on arcs, so each such `A ∈ N(X)`). Then (HALL-COND) for every `X` gives an integral saturating flow by
    `exists_saturatingFlow_of_weightedHall` (kernel-checked companion on the face of
    `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`), equivalently max-flow integrality (integer supplies/capacities).
    No step uses `S ≤ 0`; there is no ℕ subtraction (the criterion's ranks `p−q`, `p−q−1` are integer ranks with `p ≥ m+1`).
  - *Scope.* ONE rank per tree. The further eligible ranks `p+1 … ⌊2α/3⌋` (66, 76, 68, 78, 80 and 70 ranks) are not covered, and none of the
    six trees is CLOSED.

**Two-instrument standard for the single-pipeline rows.** For `CB(7,121)/566` and `CB(8,107)/572` the first instrument of record is
C-T2-F's pipeline (with the T adjudicator's verifier as a third check of its certificate). **This read's instrument is the SECOND
independent instrument of record** (SOLUTION-CONTRACT §4's two-instrument standard for `computer_assisted`): my row data (two sides,
`F_p` leaf by leaf), my exact criterion check (both conditions), my verifier and my literal laboratory are independent of C-T2-F's code;
my certificate check depends on C-T2-F's LP table values as data only (above).

## Findings and repairs

1. **Every numerical claim of the six rows is exact** (the brief's `n`, `α`, `θ*`, margins; the synthesis's table). The first four rows'
   two critic tables are identical entry for entry.
2. **Dependency misstatement (repair).** The synthesis item 1 and K-3/K-4 describe the non-sector part as "E1-R's deletion-only flow
   (`proved_informal`, with its CD-1 dependency)". On the registry faces, the criterion key's registered proof does not depend on that
   item: its condition (ii) holds identically by the elementary type-path scope note `[r30 C4; SR-C4-6]`, and the heterogeneous extension's
   face records "The statement does not depend on CD-1". At these six rows I checked condition (ii) directly as well, so not even the type-
   path note is needed. The registry text must name the input by KEY: for homogeneous `CB(d,m)` the exact key is
   `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (the heterogeneous key is its extension and would also
   apply). Repaired text below.
3. **Threshold key and Darroch: not used.** At these rows the criterion is verified in exact integers at every `q`, so
   `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`, Darroch and Newton do not enter.
4. **Attribution (repair).** The certificate METHOD is the choke-local sector certificate of C-T1-U (r30 Cycle 4), as the registered
   FIVE-CB key and T2's own return record; T2's contribution is the pipeline that runs it (Cycle 5 T2 method). The face should carry
   both. The critics used T2's unmodified LP as their search device.
5. **The "(HALL ⇒ FLOW) key".** No registry key has that name; the kernel-checked step is the companion lemma
   `exists_saturatingFlow_of_weightedHall` on the face of `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`, cited as the
   registered `G(8^82,7^2)` key cites it.
6. **Composition text.** The direction is flow ⇒ (HALL-COND) ⇒ integral flow (C-T2-U's correction, confirmed); scaling down is required
   and harmless; "in-sector targets get 0 from the criterion flow" holds because that flow uses deletion arcs only — in-sector targets
   have 26,702–38,268 positive-weight `r`-free switch preimages in my laboratory samples, all carrying 0.
7. **Name predicates (K-3, K-4).** Each name asserts (HALL) with load-bearing switch arcs at `(CB(d,m), (2dm+4)/3)` for every
   `m ≡ 2 (mod 3)` in `[95,107]` (`d = 8`) or `m ≡ 1 (mod 3)` in `[109,121]` (`d = 7`); `(16m+4)/3` and `(14m+4)/3` are integers on those
   classes and equal `540, 556, 572` and `538, 552, 566` at my rows. The names are true predicates of the MERGED key only if SR-C6-2
   confirms `m = 95, 98` (K-3) and `m = 109, 112` (K-4). My blocks carry my rows; the fallback names for my rows alone are given and
   alias-checked. The names do not claim "first eligible", which the statement adds.
8. **Alias check (own, `sr3_alias.py` → `out_alias_names.txt`, `out_alias_text.txt`).** Against the 460 snapshot, the frozen 434 master
   and the live 457 master: no exact key, no `alias_patterns` hit (on the name, its spaced lower-case form and my registration text), no
   alias equality, no token overlap ≥ 85%. Top overlap: the FIVE-CB switch-arcs key (10 of 14 tokens, 0.71; run-local only) and the
   `G(8^82,7^2)` rank-448 key (0.67); in the 434 and 457 masters nothing above 0.67 (`E993-BF-*`, two tokens). No forbidden phrase and no
   working label in the registration text. The names alone: `NAMES_CLEAR True`. The text scan's only `alias_patterns` hit is the
   pattern of `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` matching a line that cites that key by its exact name (the
   integrality companion); with the exact citations masked the pattern does not match. A citation is not an alias. A lexical overlap is
   a distinction-row obligation, met below.
9. **Census count.** 218 → 208 is arithmetic on the census of record (223 switch-necessary first-eligible CB rows, `d ≤ 13`). I did not
   derive census membership; I confirmed independently that each of the six is a switch-necessary first-eligible row, and C-T2-F's finder
   record (replayed) lists them as the next six after the nine certified rows.

**Exact repaired text** (for SR-C6-3a..3f; the row statement itself is unchanged):
"Whole-row (HALL), switch arcs load-bearing, at the first eligible rank `p = (2dm+4)/3` of `CB(d,m)` — `CB(8,101)/540`, `CB(7,115)/538`,
`CB(8,104)/556`, `CB(7,118)/552`, `CB(7,121)/566`, `CB(8,107)/572` — `computer_assisted`. Mechanism: a fractional flow, the sum of the
deletion-only flow of `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` on the non-sector sources
(`proved_informal`; both conditions of its criterion checked in exact integers at every `q` at each row, so neither its type-path scope
note, nor the threshold key, nor Darroch or Newton enters) and the exact homogeneous sector certificate (Out ≥ 1 scaled to 1, In ≤ 1,
`(d−γ)σ(γ) ≤ θ*γ`, `θ* ≤ 1 − ρ_1`); then (HALL-COND) for every `X` by summation; then an integral flow by
`exists_saturatingFlow_of_weightedHall` (companion on `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`). One rank per
tree; no tree CLOSED. Attribution: rows, laboratories, exact criterion checks and full tables C-T2-F (all six) and C-T2-U (the first
four); certificate method C-T1-U (Cycle 4) run as the T2 pipeline (Claude Sonnet 5; Cycle 5 T2 method); third verifier the T
adjudicator; isolated second read SR-C6-3."

## Registration text

```text
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Rows carried by this block (isolated second read SR-C6-3): m = 101, 104, 107. Let CB(d,m) be the tree with path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to u_i and one private leaf c_ij adjacent to b_ij (n = 3 + m(2d+1), M = dm). At each of the three ranks (T, p) = (CB(8,101), 540), (CB(8,104), 556), (CB(8,107), 572), where p = (16m+4)/3 is the first eligible rank x + 2 and (n, alpha, x) = (1720, 910, 538), (1771, 937, 554), (1822, 964, 570), let F = F_p(T) (derived leaf by leaf: every leaf), w_F the literal active-tag weight and the relation (D) union (S). Then there is a nonnegative rational flow supported on literal (D) union (S) arcs that saturates every source supply w_F(B) and loads every target A at most w_F(A); hence (HALL-COND) holds for every X subset of I_{p+1}(T) (sum the flow over X), and an integral saturating flow exists by max-flow integrality: (HALL) holds at these three (T, p). Switch arcs are load-bearing: the root-plus-arm sector sec = {B in I_{p+1}(T) : r, v in B} has total weight R_K = 2^K C(M, K) (K = p - 1; every member weight 1), its whole positive-weight deletion neighbourhood is the in-sector layer of total weight R_{K-1} = 2^{K-1} C(M, K-1), and R_K/R_{K-1} = 540/539, 556/555, 572/571 > 1, so no deletion-only saturating flow exists at these ranks. Certificate: (i) E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, with both conditions of its criterion verified in exact integers at every q = 1..m at each row (max_q rho_q = rho_1 < 1), gives a deletion-arc flow saturating every non-sector source, loading each r-free target with q >= 1 chokes at rho_q w_F and every other target at 0; (ii) the choke-local sector flow of the per-state table (flow pb(beta, gamma) on each deletion of a support and pc(beta, gamma) on each deletion of a private leaf at a choke in state (beta, gamma), sigma(gamma) on the switch inserting u_i at a choke in state (1, gamma), 0 elsewhere) has outflow at least 1 from every sector source (minimum exactly 1 over all choke-state profiles; scaled down to exactly 1), loads every in-sector target at most 1 (maximum exactly 1) and every u_i-switch image of weight gamma at most theta* gamma ((8 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..7), with theta* = 96/682829, 96/723911, 96/766193; (iii) every u_i-switch image is r-free with exactly one choke, so its superposed load is at most (rho_1 + theta*) gamma <= gamma because theta* <= 1 - rho_1 (exact margins (1 - rho_1)/theta* = 10011013675951807/303845516365440, 14198600288037482747/418538000527102080, 5777869414876808819/165550964075383936, about 32.95, 33.92, 34.90); in-sector targets contain r and receive nothing from (i), which uses deletion arcs only; targets with two or more chokes receive no sector flow; the sum of (i) and (ii) is the required flow.
SCOPE: Three named ordinary trees in this block, each at its first eligible rank only. The controller merges this block with SR-C6-2's block for m = 95, 98 under this key; the name asserts every m congruent to 2 mod 3 in [95, 107] and is a true predicate only if SR-C6-2 confirms both of its rows; otherwise the key registers under a name enumerating the confirmed rows (for this block alone: E993-R30-CB-8-M-101-104-107-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, alias-checked clear against the 460, 434 and 457 registries). F_p(T) = leafSet(T) derived leaf by leaf (bounded_computation). Relation (D) union (S) literal; weight w_F literal. Inputs at their grades: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (proved_informal; its condition (ii) holds identically by the type-path scope note [r30 C4; SR-C4-6] on its face, and at these rows both conditions were also checked directly, so neither that note, nor E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD, nor Darroch's or Newton's theorem enters); the per-row criterion checks and sector certificates (computer_assisted; records R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-101-540, R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-104-556 and R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-107-572); integrality by max-flow integrality, kernel-checked as the companion lemma exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (formally_verified award; a companion carries no certificate of its own). The grade is the weakest input's: computer_assisted, conditional on the criterion key at its registered grade proved_informal. Status qualifier: restricted scope, separate key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN.
ATTRIBUTION: Rows, literal laboratories, exact all-q criterion checks and full per-state tables: C-T2-F (Claude Opus 5.5; m = 101, 104, 107) and C-T2-U (Claude Opus 5.5; m = 101, 104; its tables identical to C-T2-F's entry for entry). The choke-local sector certificate method: C-T1-U (Claude Opus 5.5; r30 Cycle 4, as registered on E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS), run as the T2 pipeline (Claude Sonnet 5; the Cycle 5 T2 method, exact LP plus DP), whose unmodified LP the critics used as their search device. Third exact verifier: the r30 Cycle 6 T adjudicator (Claude Opus 5.5). Isolated second read SR-C6-3 (Claude Opus 5.5): own literal-tree DPs and closed forms, F_p leaf by leaf, (WID) from two sides, both criterion conditions exact at every q, own exact verifier reading the tables as data, sampled literal laboratory on each actual row; for m = 107 this read is the second independent instrument of record. The criterion key: as on its face (C-T1-F, C-T1-U, the Cycle 3 T adjudicator, T1, SR-C3-3; type-path note SR-C4-6). The transport network (HALL), the active-tag weight w_F, the relation and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; the first-interior run (Codex) and r24-r26 for the definition layer.
FENCES: One rank per tree: the ranks p+1 .. floor(2 alpha/3) of these trees (66, 68 and 70 further eligible ranks) are not covered, and none of these trees is CLOSED. Not (HALL): E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN at full scope; three finite instances, not parameter-uniform, nothing about any other CB(d,m) or rank; the theta* values fit the conjectured law 288/(200m^2 + 82m + 5), a record (conjecture), not evidence and not part of this key. computer_assisted conditional on the criterion key at its registered grade proved_informal. Not a deletion-only claim (deletion-only saturation fails at all three ranks) and not E993-R23-LITERAL-DELETE-ONLY-HALL. Not an edit, extension or alias of E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, whose sealed statement is unchanged (disjoint rows; distinction row). No (CUT): nothing here is or refutes a deficient cut. No status transfer: the primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched (S < 0 at these rows was already derivable), as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No refuted mechanism revived (literal (D) union (S), literal w_F, fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination). No RTree or governed-model assertion. No census value enters. A finite certificate never qualifies for a formal award.
ALIASES: r30 Cycle 6 critic-derived d 8 first-rank switch-arc rows
```

```text
KEY: E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Rows carried by this block (isolated second read SR-C6-3): m = 115, 118, 121. Let CB(d,m) be the tree with path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to u_i and one private leaf c_ij adjacent to b_ij (n = 3 + m(2d+1), M = dm). At each of the three ranks (T, p) = (CB(7,115), 538), (CB(7,118), 552), (CB(7,121), 566), where p = (14m+4)/3 is the first eligible rank x + 2 and (n, alpha, x) = (1728, 921, 536), (1773, 945, 550), (1818, 969, 564), let F = F_p(T) (derived leaf by leaf: every leaf), w_F the literal active-tag weight and the relation (D) union (S). Then there is a nonnegative rational flow supported on literal (D) union (S) arcs that saturates every source supply w_F(B) and loads every target A at most w_F(A); hence (HALL-COND) holds for every X subset of I_{p+1}(T) (sum the flow over X), and an integral saturating flow exists by max-flow integrality: (HALL) holds at these three (T, p). Switch arcs are load-bearing: the root-plus-arm sector sec = {B in I_{p+1}(T) : r, v in B} has total weight R_K = 2^K C(M, K) (K = p - 1; every member weight 1), its whole positive-weight deletion neighbourhood is the in-sector layer of total weight R_{K-1} = 2^{K-1} C(M, K-1), and R_K/R_{K-1} = 538/537, 552/551, 566/565 > 1, so no deletion-only saturating flow exists at these ranks. Certificate: (i) E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, with both conditions of its criterion verified in exact integers at every q = 1..m at each row (max_q rho_q = rho_1 < 1), gives a deletion-arc flow saturating every non-sector source, loading each r-free target with q >= 1 chokes at rho_q w_F and every other target at 0; (ii) the choke-local sector flow of the per-state table (flow pb(beta, gamma) on each deletion of a support and pc(beta, gamma) on each deletion of a private leaf at a choke in state (beta, gamma), sigma(gamma) on the switch inserting u_i at a choke in state (1, gamma), 0 elsewhere) has outflow at least 1 from every sector source (minimum exactly 1 over all choke-state profiles; scaled down to exactly 1), loads every in-sector target at most 1 (maximum exactly 1) and every u_i-switch image of weight gamma at most theta* gamma ((7 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..6), with theta* = 64/707469, 64/744785, 16/195765; (iii) every u_i-switch image is r-free with exactly one choke, so its superposed load is at most (rho_1 + theta*) gamma <= gamma because theta* <= 1 - rho_1 (exact margins (1 - rho_1)/theta* = 41243491387538783/1002484758487616, 481444099688467025/11405496963958336, 4198638605739195/97006791833584, about 41.14, 42.21, 43.28); in-sector targets contain r and receive nothing from (i), which uses deletion arcs only; targets with two or more chokes receive no sector flow; the sum of (i) and (ii) is the required flow.
SCOPE: Three named ordinary trees in this block, each at its first eligible rank only. The controller merges this block with SR-C6-2's block for m = 109, 112 under this key; the name asserts every m congruent to 1 mod 3 in [109, 121] and is a true predicate only if SR-C6-2 confirms both of its rows; otherwise the key registers under a name enumerating the confirmed rows (for this block alone: E993-R30-CB-7-M-115-118-121-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, alias-checked clear against the 460, 434 and 457 registries). F_p(T) = leafSet(T) derived leaf by leaf (bounded_computation). Relation (D) union (S) literal; weight w_F literal. Inputs at their grades: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (proved_informal; its condition (ii) holds identically by the type-path scope note [r30 C4; SR-C4-6] on its face, and at these rows both conditions were also checked directly, so neither that note, nor E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD, nor Darroch's or Newton's theorem enters); the per-row criterion checks and sector certificates (computer_assisted; records R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-115-538, R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-118-552 and R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-121-566); integrality by max-flow integrality, kernel-checked as the companion lemma exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (formally_verified award; a companion carries no certificate of its own). The grade is the weakest input's: computer_assisted, conditional on the criterion key at its registered grade proved_informal. Status qualifier: restricted scope, separate key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN.
ATTRIBUTION: Rows, literal laboratories, exact all-q criterion checks and full per-state tables: C-T2-F (Claude Opus 5.5; m = 115, 118, 121) and C-T2-U (Claude Opus 5.5; m = 115, 118; its tables identical to C-T2-F's entry for entry). The choke-local sector certificate method: C-T1-U (Claude Opus 5.5; r30 Cycle 4, as registered on E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS), run as the T2 pipeline (Claude Sonnet 5; the Cycle 5 T2 method, exact LP plus DP), whose unmodified LP the critics used as their search device. Third exact verifier: the r30 Cycle 6 T adjudicator (Claude Opus 5.5). Isolated second read SR-C6-3 (Claude Opus 5.5): own literal-tree DPs and closed forms, F_p leaf by leaf, (WID) from two sides, both criterion conditions exact at every q, own exact verifier reading the tables as data, sampled literal laboratory on each actual row; for m = 121 this read is the second independent instrument of record. The criterion key: as on its face (C-T1-F, C-T1-U, the Cycle 3 T adjudicator, T1, SR-C3-3; type-path note SR-C4-6). The transport network (HALL), the active-tag weight w_F, the relation and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; the first-interior run (Codex) and r24-r26 for the definition layer.
FENCES: One rank per tree: the ranks p+1 .. floor(2 alpha/3) of these trees (76, 78 and 80 further eligible ranks) are not covered, and none of these trees is CLOSED. Not (HALL): E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN at full scope; three finite instances, not parameter-uniform, nothing about any other CB(d,m) or rank; the theta* values fit the conjectured law 1152/(959m^2 + 449m + 32), a record (conjecture), not evidence and not part of this key. computer_assisted conditional on the criterion key at its registered grade proved_informal. Not a deletion-only claim (deletion-only saturation fails at all three ranks) and not E993-R23-LITERAL-DELETE-ONLY-HALL. Not an edit, extension or alias of E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, whose sealed statement is unchanged (disjoint rows; distinction row). No (CUT): nothing here is or refutes a deficient cut. No status transfer: the primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched (S < 0 at these rows was already derivable), as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No refuted mechanism revived (literal (D) union (S), literal w_F, fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination). No RTree or governed-model assertion. No census value enters. A finite certificate never qualifies for a formal award.
ALIASES: r30 Cycle 6 critic-derived d 7 first-rank switch-arc rows
```

```text
SCOPE NOTE ON: R30-CB-RECORD
TEXT: [r30 C6; SR-C6-3] Uncertified count of the switch-necessary eligible CB frontier of record (223 rows for d <= 13 in the census ranges, all at the first eligible rank): 218 entering Cycle 6. This read confirms the six critic-derived rows CB(8,101)/540, CB(7,115)/538, CB(8,104)/556, CB(7,118)/552, CB(7,121)/566 and CB(8,107)/572 (keys E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, or their enumerating fallbacks), so the uncertified count at close is 214 - 6 = 208 if SR-C6-2 confirms the four T2 rows, and in general 218 - (T2 rows confirmed by SR-C6-2) - 6. The count is arithmetic on the census of record, not derived here: this read confirmed independently that each of the six is a switch-necessary first-eligible row (p = x + 2 and sector ratio p/(p - 1) > 1), and the six are the census pointer's (C-T2-U) and C-T2-F's finder record's next six after the nine certified rows. The theta* values at the six rows fit theta*_8(m) = 288/(200m^2 + 82m + 5) at m = 101, 104, 107 and theta*_7(m) = 1152/(959m^2 + 449m + 32) at m = 115, 118, 121 exactly (conjecture; laws of one LP optimum, not instance facts, not evidence). Grade: bounded_computation. Attribution: C-T2-F and C-T2-U (Claude Opus 5.5; the rows), the T adjudicator (Claude Opus 5.5; the laws), isolated second read SR-C6-3 (Claude Opus 5.5).
```

```text
DISTINCTION ROW: R30-C6-CB8-RANK-16M-PLUS-4-OVER-3-HALL-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Same theorem type (whole-row (HALL) at the first eligible rank of a homogeneous CB(d,m), switch arcs load-bearing, criterion-key flow plus choke-local sector certificate) on DISJOINT instances. The registered key covers exactly (d, m, p) = (8, 86, 460), (8, 89, 476), (8, 92, 492), (8, 108, 577), (7, 144, 673); the new key covers (8, m, (16m+4)/3) for m congruent to 2 mod 3 in [95, 107], none of which is a registered row (m = 108 is not congruent to 2 mod 3). Neither statement implies the other; the new key restates no registered row, and the sealed registered statement is not edited. The shared name tokens (WEIGHTED HALL WITH LOAD BEARING SWITCH ARCS; 10 of 14, overlap 0.71) name the common predicate type, not the same instances. Not an alias.
```

```text
DISTINCTION ROW: R30-C6-CB7-RANK-14M-PLUS-4-OVER-3-HALL-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Same theorem type on DISJOINT instances. The registered key's only d = 7 row is (7, 144, 673); the new key covers (7, m, (14m+4)/3) for m congruent to 1 mod 3 in [109, 121]. Neither statement implies the other; the sealed registered statement is not edited. The shared name tokens (10 of 14, overlap 0.71) name the common predicate type. Not an alias.
```

```text
DISTINCTION ROW: R30-C6-CB-FIRST-RANK-HALL-ROWS-VS-CHOKE-TREE-448-HALL
KEY: E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key is one heterogeneous tree G(8^82, 7^2) (82 chokes of degree 8 and 2 of degree 7) at one rank 448, with the heterogeneous criterion key and a two-degree sector certificate. The new keys E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS are homogeneous CB(d,m) rows at other ranks. Different trees and ranks; neither implies the other; the shared tokens (overlap 0.67) name the common predicate type. Not an alias.
```

```text
DISTINCTION ROW: R30-C6-CB-FIRST-RANK-HALL-ROWS-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts universal unweighted Delete-only Hall on the r23 tagged top side. The new keys E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS are weighted by the active-tag weight, use the relation (D) union (S), and at every one of their rows deletion-only saturation FAILS (the root-plus-arm sector has ratio p/(p - 1) > 1 against its deletion neighbourhood); the switch arcs carry positive flow. Finite instances only. Not a revival.
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-101-540
CLAIM: At CB(8,101), p = 540 (n = 1720, alpha = 910, x = 538, window [540, 606]; all 809 leaves favorable, derived leaf by leaf; S < 0 with 386 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..101; max_q rho_q = rho_1; 1 - rho_1 = 102627591581/22155402234980); the per-state table crit_extend_a.json (SHA-256 4b1b7c70...; identical entry for entry to CERT-TABLES.json 37b450e6...) with theta* = 96/682829 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (8 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..7, equality at 1..6; theta* <= 1 - rho_1, margin 10011013675951807/303845516365440; sector ratio 540/539.
STATUS: computer_assisted
PROVENANCE: C-T2-F and C-T2-U (Claude Opus 5.5; rows, LP tables, laboratories); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/, outputs out_rows.jsonl, out_allleaves.jsonl, out_e1.jsonl, out_cert.jsonl, out_lab.jsonl).
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-115-538
CLAIM: At CB(7,115), p = 538 (n = 1728, alpha = 921, x = 536, window [538, 614]; all 806 leaves favorable, derived leaf by leaf; S < 0 with 386 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..115; max_q rho_q = rho_1; 1 - rho_1 = 174891725521/46991473054107); the per-state table crit_extend_a.json (SHA-256 4b1b7c70...; identical entry for entry to CERT-TABLES.json 37b450e6...) with theta* = 64/707469 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (7 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..6, equality at 1..5; theta* <= 1 - rho_1, margin 41243491387538783/1002484758487616; sector ratio 538/537.
STATUS: computer_assisted
PROVENANCE: C-T2-F and C-T2-U (Claude Opus 5.5; rows, LP tables, laboratories); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/).
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-104-556
CLAIM: At CB(8,104), p = 556 (n = 1771, alpha = 937, x = 554, window [556, 624]; all 833 leaves favorable, derived leaf by leaf; S < 0 with 397 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..104; max_q rho_q = rho_1; 1 - rho_1 = 19613737445677/4359770838823980); the per-state table crit_extend_a.json (SHA-256 4b1b7c70...; identical entry for entry to CERT-TABLES.json 37b450e6...) with theta* = 96/723911 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (8 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..7, equality at 1..6; theta* <= 1 - rho_1, margin 14198600288037482747/418538000527102080; sector ratio 556/555.
STATUS: computer_assisted
PROVENANCE: C-T2-F and C-T2-U (Claude Opus 5.5; rows, LP tables, laboratories); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/).
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-118-552
CLAIM: At CB(7,118), p = 552 (n = 1773, alpha = 945, x = 550, window [552, 630]; all 827 leaves favorable, derived leaf by leaf; S < 0 with 396 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..118; max_q rho_q = rho_1; 1 - rho_1 = 646420241665/178210890061849); the per-state table crit_extend_b.json (SHA-256 a22aa73b...; identical entry for entry to CERT-TABLES.json 37b450e6...) with theta* = 64/744785 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (7 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..6, equality at 1..5; theta* <= 1 - rho_1, margin 481444099688467025/11405496963958336; sector ratio 552/551.
STATUS: computer_assisted
PROVENANCE: C-T2-F and C-T2-U (Claude Opus 5.5; rows, LP tables, laboratories); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/).
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB7-121-566
CLAIM: At CB(7,121), p = 566 (n = 1818, alpha = 969, x = 564, window [566, 646]; all 848 leaves favorable, derived leaf by leaf; S < 0 with 406 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..121; max_q rho_q = rho_1; 1 - rho_1 = 21447340463/6062924489599); the per-state table crit_extend_b.json (SHA-256 a22aa73b...; single critic pipeline) with theta* = 16/195765 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (7 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..6, equality at 1..5; theta* <= 1 - rho_1, margin 4198638605739195/97006791833584; sector ratio 566/565. Two instruments of record: C-T2-F's pipeline and this read's instrument (second, independent; it uses the LP table values as data only).
STATUS: computer_assisted
PROVENANCE: C-T2-F (Claude Opus 5.5; row, LP table, laboratory); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/).
```

```text
RECORD: R30-CB-RECORD-C6-FIRST-RANK-CERTIFICATE-CB8-107-572
CLAIM: At CB(8,107), p = 572 (n = 1822, alpha = 964, x = 570, window [572, 642]; all 857 leaves favorable, derived leaf by leaf; S < 0 with 409 digits; supply - capacity = S from two sides): the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds in exact integers (conditions (i) and (ii) at every q = 1..107; max_q rho_q = rho_1; 1 - rho_1 = 22623031331049/5173467627355748); the per-state table crit_extend_b.json (SHA-256 a22aa73b...; single critic pipeline) with theta* = 96/766193 verifies exactly: nonnegative; minimum sector-source outflow 1 over all choke-state profiles; maximum in-sector inflow 1; (8 - gamma) sigma(gamma) <= theta* gamma for gamma = 1..7, equality at 1..6; theta* <= 1 - rho_1, margin 5777869414876808819/165550964075383936; sector ratio 572/571. Two instruments of record: C-T2-F's pipeline and this read's instrument (second, independent; it uses the LP table values as data only).
STATUS: computer_assisted
PROVENANCE: C-T2-F (Claude Opus 5.5; row, LP table, laboratory); T adjudicator (Claude Opus 5.5; third verifier); isolated second read SR-C6-3 (Claude Opus 5.5; own instrument scratchpad/c6-sr-SR-C6-3/).
```

## Verdicts

verdict[SR-C6-3a]: confirmed_with_repairs
verdict[SR-C6-3b]: confirmed_with_repairs
verdict[SR-C6-3c]: confirmed_with_repairs
verdict[SR-C6-3d]: confirmed_with_repairs
verdict[SR-C6-3e]: confirmed_with_repairs
verdict[SR-C6-3f]: confirmed_with_repairs
verdict[SR-C6-3g]: confirmed_with_repairs

For 3a–3f every mathematical and numerical claim is confirmed exactly; the repairs are the dependency and attribution wording (Findings
2, 4, 5; exact repaired text under `## Findings and repairs`). For 3g the K-3 and K-4 names pass the predicate and alias checks for my
rows; the repairs are the key-by-key citation of the criterion input, the attribution, and the merge condition on SR-C6-2's rows with the
enumerating fallback (Finding 7); registration text above. (HALL) stays OPEN at full scope; no (CUT); no status transfer.

## Artifact inventory

**Deliverable:** this file only, `second-reads/SR-C6-3/SECOND-READ.md`.

**Scratch** (`scratchpad/c6-sr-SR-C6-3/`; `python3 -B`, standard library, exact `int`/`Fraction`, foreground only, no bytecode):

| File | SHA-256 | Role |
|---|---|---|
| `out_alias_names.txt` | `d152cc055bd1584abf48dbc1da23cc86738609eb23cb9dd08e39d4948111b19c` | NAMES_CLEAR True |
| `out_alias_text.txt` | `0adaa40a65406032ffb3e414e7eb4e3773eef00d55637710b11c325d1e1d9fef` | TEXT_CLEAR True; its NAMES_CLEAR False comes only from the text-scan hit, an exact citation of the FLOW=>SIGN key |
| `out_allleaves.jsonl` | `21a552989079f826753c913b54132328296fc0e63b1a1905e59c699967729941` | six rows, every leaf favorable, ALL_OK |
| `out_cert.jsonl` | `f95e82f48b3726b3dffd362bd922aaa17f03a3300bcff9bb689ee179c29d523c` | six rows CERTIFIED; argmin/argmax profiles |
| `out_compare.jsonl` | `85574ab474372dc03753edce3af5bf13bab1c5912a3d2de21a31ca51f0b2c85b` | all equal; laws fit |
| `out_e1.jsonl` | `169a3d4bfe3164f2bcdfa049e866905d48207ab0dd3d7791207a8a5dd94cc017` | six rows, no failure |
| `out_lab.jsonl` | `344e9ec9f20a7437bd85f518acf21b3140f9c9eb338da5a50a5842414c5a994f` | six rows, ALL_OK |
| `out_rows.jsonl` | `2c9b07551216d5202830a1febb2202318752631f94bbd2cc93d8b7d90a9fb69b` | six rows, full S/supply/capacity, ALL_OK |
| `out_validate.txt` | `edad57b369fca8ddcfce4db945a7895642c1ec3bb07bc7e801e72fbbb6860169` | ALL_OK True |
| `registration_text.txt` | `68595669b233e949c67c52422ad966dc8f386cd02f3e7d8739a9d6beb374df9a` | the ## Registration text section of SECOND-READ.md (scan input) |
| `sr3_alias.py` | `86763bb32f31b53191b44905147dc32f9485bfa0b73b002a1b1df88782058166` | alias check vs 460 / 434 / 457 registries; forbidden-phrase and label scan |
| `sr3_allleaves.py` | `06b5f0bfd4980994458eb86bee71672509bd04958e96d7ca922278ffa93b0ce2` | F_p leaf by leaf; per-leaf q; literal leaf-sum S vs dual DP |
| `sr3_cert.py` | `5a3e4af3058ac0eaa18ff6936c04268c26b7fe1cf4059b33d7dfac394bbffc47` | own exact verifier of the critic tables (as data); F-vs-U table identity |
| `sr3_compare.py` | `3c563a9fe9a8c06354f3005aeb939aa54f09dd898a52f72cccf1e1e79689c51b` | replay comparison with critic outputs (third instrument only); theta* law record |
| `sr3_e1.py` | `27bcac68b96e57567816906ed98b43eb6d372951798a608a737ffbc41ddecbaa` | criterion conditions (i) and (ii) exact at every q; rho_1; mu_1 |
| `sr3_lab.py` | `be78ef6e811ffa98352800351a2ff58f9c3e4592c1ab3f3412bec0bb51c916b2` | sampled literal laboratory on each actual row |
| `sr3_lib.py` | `cdf15ca069bb83fdb2be3b5fa42038129e5e777afa1a6e5adb2828b7cda2837e` | own library: CB builder, IsTree (two tests), generic independence DP, generic active-weight dual DP, brute force, closed forms |
| `sr3_rows.py` | `d5f6c20a535b3d91ecda307507aa9b58383b99449f9ca6dcd31a85966a0cee29` | row data, two sides; IsTree; F_p by representatives; (WID) two sides; sector ratio |
| `sr3_validate.py` | `baa43d8badc92ce1cc8558ad5db5b9497512d312826c5205aa85213eb0bd952e` | validation vs literal enumeration (198 tree/tag pairs, 6 small CB) and fixed points |

**Replay** (from the scratch directory, run root two levels up; about 35 minutes in total):

```
python3 -B sr3_validate.py > out_validate.txt                          # ~2 s
python3 -B sr3_rows.py 8,101,540 7,115,538 8,104,556 7,118,552 7,121,566 8,107,572 > out_rows.jsonl   # ~15 s
for r in 8,101,540 7,115,538 8,104,556 7,118,552 7,121,566 8,107,572; do python3 -B sr3_allleaves.py $r >> out_allleaves.jsonl; done   # ~4 min per row
python3 -B sr3_e1.py 8,101,540 7,115,538 8,104,556 7,118,552 7,121,566 8,107,572 > out_e1.jsonl        # ~5 s
python3 -B sr3_cert.py > out_cert.jsonl                                 # ~1 s
for r in 8,101,540 7,115,538 8,104,556 7,118,552 7,121,566 8,107,572; do python3 -B sr3_lab.py $r 8 2027 >> out_lab.jsonl; done        # ~2.5 min per row
python3 -B sr3_compare.py > out_compare.jsonl
python3 -B sr3_alias.py > out_alias_names.txt
python3 -B sr3_alias.py registration_text.txt > out_alias_text.txt
```
