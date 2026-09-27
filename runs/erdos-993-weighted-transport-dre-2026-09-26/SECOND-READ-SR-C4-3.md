# Second Read

Isolated second read `SR-C4-3`, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 4, 2026-09-27. Statements
SR-C4-3a–3d: EST-4 (full (HALL), with switch arcs load-bearing, at the three `CB(8,·)` first eligible ranks), EST-5 and EST-6. This
read is DECISIVE for C4 gate ruling 30 letter (b).

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, and loaded no other VerityOS subsystem.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id:
claude-opus-5-5[1m]. In two parts: chartered Claude Opus 5.5, effort high; the model id my runtime reports for itself is
`claude-opus-5-5[1m]`, verbatim. The transport clause follows the protocol's template; I cannot observe the transport parameter
myself.

**Decisive line (ruling 30 letter (b)).** EST-4 is CONFIRMED. With F = F_p derived, full (HALL) holds at `CB(8,86)/460`,
`CB(8,89)/476` and `CB(8,92)/492`, and switch arcs are load-bearing there. I re-derived this on my own instrument: my own LP finds
the same θ*, my own exact DP certifies it, and my own E1-criterion, row-data and laboratory codes agree. The grade is
`computer_assisted`.

## Identity and seal audit

| Object | Value | Check |
|---|---|---|
| Capsule `control/c4-second-read/SR-C4-3-PACKET-MANIFEST.json` | inner seal `187d7c434c0450e771db8b3a78ebfc0d1fa92e31a024e98239f5cdb69cca19af` | recomputed over the compact key-sorted JSON without `seal_sha256`, no trailing newline, **before any member was read**: **match** |
| Manifest file bytes | SHA-256 `43cb6efd04793965ff53bff440bff07aabf61c8b12acaffa1480dbfaf62ff079` | recorded |
| Members | 62 of 62 (`file_count` 62) | SHA-256 and byte count match for every member (`seal_audit.py`, `out_seal_audit.txt`) |
| Frozen reference instruments `sources/c4-stage7-sources/` | 35 capsule members | each matches its entry in the frozen `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (217 entries) on SHA-256 and bytes, checked before I read any of them (`frozen_audit.py`) |
| Brief | `control/C4-SECOND-READ-BRIEF-SR-C4-3.md` `eb9f96f8…` | capsule member; read in full |
| Protocol | `control/C4-SECOND-READ-PROTOCOL.md` `1ee97e74…` | capsule member; binding; read in full |

**Read-boundary deviations and process disclosures (every one).**

1. **Host injection.** The host put the project `CLAUDE.md` and the user's auto-memory index into my context at start. I did not
   open them or act on them. The memory index carries one-line summaries of this run's earlier cycles, and I used none of it as
   evidence. `CLAUDE.md`'s conversation-logging instruction was not followed: the dispatch restricts my writes to this file and my
   scratch.
2. **Harness copy.** The host saved the display of `cycles/cycle-4/stage6/SYNTHESIS.md` (a capsule member, digest-verified) to a
   tool-results file under `/Users/ashtonsperry/.claude/projects/-Users-ashtonsperry-VerityOS/…/tool-results/`, and I read it
   there. The harness wrote that file, not me, and its bytes are the member's.
3. **One out-of-grant listing.** I ran one names-only, non-recursive `ls` of the run's `second-reads/` directory, to see whether
   my output directory existed. It printed other reads' directory names (`SR-BUDGET`, `SR-C2-*`, `SR-C3-*`, …). I opened nothing
   in them, and I then created `second-reads/SR-C4-3/` myself. This was a low-severity boundary slip.
4. **Scratch dumps of capsule members.** For readability I wrote the following to my own scratch: the Stage 6 controller facts
   (`facts6.txt`); the registry entries I needed from the capsule snapshot (`registry_extract.txt`): E1, the five-row key, (HALL),
   `E993-R23-LITERAL-DELETE-ONLY-HALL`, and the R30 key list; and the obligations-snapshot rows for B7 and the CB record
   (`oblig_extract.txt`). I also printed four more registry entries to the terminal: (NM), the second-eigenvalue key, the CBstar
   key and C3-LA1. Everything was read from capsule members only.
5. **Frozen instruments.** I read, as text, `C-T1-U/certify.py`, `ADJ-T/adj_lab_search.py`, `ADJ-T/dump_cert.py` and seven frozen
   output files. My `sr3_cert.py` loads the frozen `ADJ-T/cert_values.json` **as data** (`json.load`), to verify the seat
   certificate's values with my own DP. No seat or adjudicator code was imported or executed.
6. **Searches.** I ran no `find`, `grep` or `rg` rooted above my grant. One `grep -n` ran on my own scratch script. The Mathlib
   and Lean sources were not needed and not touched.
7. **Commands.** My first shell command contained `echo ======`, which zsh rejected as a glob; nothing else was affected. Several
   commands `cd` into the run root and use relative paths inside it.
8. **Runtime.** Every script ran with `python3 -B` in the foreground, using the standard library and exact `int`/`Fraction`
   arithmetic. I ran no background job, so there was nothing to kill. There was no network use, no install, no Lean or lake, and
   no child agent. There is no bytecode in my scratch.
9. **Capsule members not opened for content**, because they were not needed:
   - `cycles/cycle-4/stage3/returns/T1/RETURN.md`;
   - `cycles/cycle-4/stage4/critics/T1/F/CRITIQUE.md`;
   - `cycles/cycle-3/CYCLE-CLOSE.md`;
   - `control/C4-STAGE6-PACKET-MANIFEST.json`;
   - `control/PATH-CHECK-c4-second-read-briefs.json`;
   - the three controller replay records and their generators;
   - the remaining frozen scripts.

   `control/SOURCE-DIGESTS.json` was only digested. `sources/authority/CLAIM-IDENTITY.json` was loaded only by `sr3_alias.py`, for
   its keys, aliases and alias patterns. Nothing outside the capsule was read: no seat scratch, no other second read, not the
   run-local registry file itself (I used the capsule's Stage 2 snapshot, as the brief directs), no other experiment root and no
   external source.

## Statements read

| ID | Statement (as briefed) | Origin | Registration target |
|---|---|---|---|
| SR-C4-3a | EST-6: at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, with `F = F_p` derived, there is a choke-local nonnegative rational flow on the sector `sec = {B : r, v ∈ B}` that saturates every sector source, loads every in-sector target at most 1, and loads every switch image `(B − {r, b_ij}) ∪ {u_i}` of weight `ℓ` at most `θ*·ℓ`, with `θ* = 96/495419, 96/530501, 96/566783` (plus the record rows 577 and 673) | `C-T1-U` A8; T adjudicator's checker | record rows (EST-6) |
| SR-C4-3b | EST-4: E1's registered load clause, superposed with 3a, gives a saturating flow on (D) ∪ (S) with every target loaded at most its weight. By B7 this is (HALL-COND) for every `X`. Switch arcs are load-bearing (460/459, 476/475, 492/491). The D1 criterion holds at these ranks, and every positive-weight exit of a sector source is an in-sector deletion or a switch image | CF-T1/CF-T2/CF6-4; T adjudicator E-2; synthesis EST-4, R-5 | key `E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` |
| SR-C4-3c | EST-5: with the registered D2 (174 ranks), (HALL) holds at all 177 eligible ranks of the three rows; a composition, not a new key | synthesis EST-5, registration item 7 | (HALL) scope note (ii) |
| SR-C4-3d | the key name as a predicate; alias check against the five-row key, C3-LA1, the CBstar key and `E993-R23-LITERAL-DELETE-ONLY-HALL`; the fences | synthesis registration item 2 | KEY block; DISTINCTION ROWs |

**Inputs of record, as I read them in the capsule snapshot.**

- **E1** (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, VERIFIED `proved_informal`). Its load
  clause, verbatim in the snapshot, is exactly CF-T1's quotation: `Σ_B f(B,A) = ρ_q·w_F(A) ≤ w_F(A)` for every target with `r ∉ A`
  and `q ≥ 1`, and `0` for every other target, with every `B ∈ I_{p+1} ∖ sec` saturated by deletion arcs. The hypotheses are
  `C ⊆ F` and the criterion (i)+(ii) at `(d, m, p)`.
- **The five-row key** (`computer_assisted`). D1 is the non-sector clause at all 177 ranks. D2 is full (HALL) with deletion arcs at
  the 174 ranks above the first. Certificate (i) lists the worst `ρ_1` values. At the first ranks the key asserts nothing beyond D1.
- **B7** (`R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA`, `proved_informal` record). If `f ≥ 0` is supported on `transportRel` arcs,
  (ii) holds with equality on every source, and (iii) holds with ≤ on every target, then (HALL-COND) holds for every `X`.

## Independent re-derivation

All instruments are mine, under `scratchpad/c4-sr-SR-C4-3/`. They are written from `SEMANTIC-CONTRACT.md` §1 and the registered
texts, use the standard library and exact integers or fractions, and ran with `python3 -B`.

### A. Row data, `F_p` and WID from independent sides (`sr3_rows.py`)

- **Method.** A generic labelled-tree independent-set DP runs on the literal adjacency. It checks `IsTree`, interns isomorphic
  subtrees and computes exact powers. It evaluates `I(T)`, `I(T − D)` for deletion sets on the original carrier, and
  forced-in/forced-out counts.
- **`α` and `x`.** `x` is scanned through rank `α`, terminal difference included.
- **`F_p`.** `F_p` is derived from `Δ_p(T − t) < 0` on the original tree for `t = v` and for three private leaves in different
  chokes and legs. The three are asserted identical, and `Aut(CB(d,m))` (choke permutations and leg permutations) is transitive on
  the private leaves.
- **Two sides.**
  - Side A: `S = Σ_t [q_t(p) − q_t(p−1)]`, with `q_t(j) = i_j(T − {t, s_t}) − i_j(T − N[s_t])`.
  - Side B: supply and capacity as `Σ_t #{B ∈ I_j : t ∈ B, B ∩ W_t ≠ ∅}`, counted as `#{t ∈ B} − #{t ∈ B, B ∩ W_t = ∅}` by
    forced-in and forced-out labels. No H/R identity is used.
  - `supply − capacity = S` is asserted from the two sides.
- **Third check.** The closed form `I(T) = (1+2y)β^m + y(1+y)(1+2y)^{dm}`, with `β = (1+2y)^d + y(1+y)^d`.
- **Validation.** It reproduces `CB(7,1)/6` (18, 9, 6, 924/945/−21) and `CB(1,7)/10` (29190/58002/−28812).

| Row | `n` | `α` | `x` | window (ranks) | `|F_p|` | `F_p` = all leaves at every window rank | `S` sign / digits | supply digits | `R_K/R_{K−1}` | `3p − 2M` |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,86)/460` | 1465 | 775 | 458 | [460, 516] (57) | 689 | yes | − / 328 | 330 | 460/459 | 4 |
| `CB(8,89)/476` | 1516 | 802 | 474 | [476, 534] (59) | 713 | yes | − / 340 | 342 | 476/475 | 4 |
| `CB(8,92)/492` | 1567 | 829 | 490 | [492, 552] (61) | 737 | yes | − / 351 | 353 | 492/491 | 4 |
| `CB(8,108)/577` | 1839 | 973 | 575 | [577, 648] (72) | 865 | yes | − / 413 | 415 | 289/288 | 3 |
| `CB(7,144)/673` | 2163 | 1153 | 671 | [673, 768] (96) | 1009 | yes | − / 483 | 485 | 337/336 | 3 |

- `α = dm + m + 1` on every row.
- The deficit `R_K − R_{K−1}` equals `R_K/p` at the three first rows; its digit counts are 325 / 336 / 347.
- The three `CB(8,·)` windows hold 177 ranks, 174 of them above the first ranks.
- `RESULT_SHA256 1c33c55e…f6a7`.

### B. The E1 criterion and `ρ_1` from E1's own closed form (`sr3_e1.py`, `sr3_d2check.py`)

- **Transcription.** The code transcribes the registered criterion: `a_q = qd − 1`, `b_q = d(m − q) + 1`,
  `N_q(α, k)`, `r_q`, `j = p − q` in the integers, (i), and both type-path inequalities (ii) for every `α ∈ [0, a_q]` and every
  `q ∈ [1, m]`. `r_q` is cross-checked against polynomial coefficients.
- **At the first ranks.** Criterion (i) and (ii) hold at every `q` at 460 / 476 / 492. `max_q ρ_q` is at `q = 1`: 0.99456172 /
  0.99474464 / 0.99491564.
- **`ρ_1`.** `ρ_1 = 460421124882845/462938713343604`, `1698319298589907/1707291739633300` and
  `4838946572060835/4863675235331932`, **exactly** the brief's and the registered values. `1 − ρ_1 ≈ 5.4383e−3 / 5.2554e−3 / 5.0844e−3`.
- **Corroboration, not evidence of record.** The criterion holds at **every** one of the 177 ranks (max `ρ` at the first rank, at
  `q = 1`). The D2 sector condition `3p ≥ 2dm + 5` holds exactly at the ranks above the first. This agrees with the registered
  D1/D2.
- **By-product at 577 and 673** (not a ruling on SR-C4-4's statement). My code also finds criterion (i)+(ii) at `CB(8,108)/577`
  and `CB(7,144)/673`. The maxima are 0.99739585 and 0.99851025 at `q = 1`, and `ρ_1` equals the five-row key's listed values.

### C. The sector certificate: my own LP, then exact DP (`sr3_lp.py`, `sr3_cert.py`)

**The model, re-derived from the definitions.** A sector source is `B = {r, v} ∪ L`, with `L` a set of `K = p − 1` legs, one
state per pendant pair (∅ / `b_ij` / `c_ij`). There is no choke, because `r ∈ B`.

- **Weights.** `W_v = N(s) ∖ {v} = {r} ⊆ B`, so `v` is active. `W_{c_ij} = {u_i}` and `u_i ∉ B`, so every private tag is
  inactive. Hence `w_F(B) = 1` exactly when `v ∈ F`.
- **Exits** (every arc of (REL) out of a sector source):
  - deletion of a leg gives an in-sector target `{r, v} ∪ (L − x)`, weight 1;
  - deletion of `r` gives weight 0 (`v` is inactive without `r`; no choke);
  - deletion of `v` gives weight 0;
  - the `s`-switch (`N(s) ∩ B = {r, v}`) gives `(B − {r, v}) ∪ {s}`, weight 0;
  - a `u_i`-switch exists iff `N(u_i) ∩ B = {r, b_ij}`, i.e. branch `i` holds exactly one `b` (β_i = 1). Its image
    `(B − {r, b_ij}) ∪ {u_i}` is `r`-free with exactly one choke, and its weight is `γ_i`, the number of `c`-legs of branch `i`:
    `v` is inactive and only branch `i`'s leaves see a choke. So `ℓ = γ_i ≤ d − 1`;
  - no `b`- or `c`-vertex can be a switch centre (`|N(c)| = 1`, and `N(b_ij) ∩ B ⊆ {c_ij}`).
- **Choke-locality.**
  - An arc's value depends only on the `(β, γ)` state of the choke where it acts and on the leg type. So
    `Out(B) = Σ_i Out(β_i, γ_i)`, with `Out(β, γ) = β·pb(β,γ) + γ·pc(β,γ) + [β = 1, γ ≥ 1]·σ(γ)`.
  - An in-sector target `A = {r, v} ∪ L′` has preimages only by adding a leg. Adding a choke or `s` breaks independence with `r`,
    and every switch preimage is `r`-free, and neither the sector flow nor E1 routes along such an arc. So
    `In(A) = Σ_i (d − β_i − γ_i)(pb(β_i+1, γ_i) + pc(β_i, γ_i+1))`.
  - A switch image of weight `g` has exactly `d − g` sector preimages (one per empty leg of its choke), so it receives
    `(d − g)σ(g)`.

**Search (my LP; a search device only).** Minimise `θ` subject to:

- the affine separation: `Out(s) ≥ a + λ|s|` and `In(s) ≤ a₂ + λ₂|s|` on all 45 (36) states, `m·a + λK ≥ 1`, and
  `m·a₂ + λ₂(K−1) ≤ 1`;
- `(d − g)σ(g) ≤ θg`;
- every value `≥ 0`.

The solver is a two-phase dense tableau simplex over `Fraction`, with Bland's rule, written by me.

**Certification (independent of the relaxation).**

- An exact integer DP runs over every profile of `m` choke states with total rank `K` (minimum source outflow) and `K − 1`
  (maximum in-sector inflow). All values are scaled by their common denominator.
- The switch caps are checked for each `g`.
- `θ ≤ 1 − ρ_1` is checked with `ρ_1` from B.

| Row | my LP optimum `θ` | = briefed `θ*` | exact DP: min source outflow / max in-sector inflow | nonneg | max_g `(d−g)σ(g)/g` | margin `(1−ρ_1)/θ*` | `θ*/θ_whole` | seat certificate (`cert_values.json`) by my DP |
|---|---|---|---|---|---|---|---|---|
| 460 | 96/495419 | yes | 1 / 1 | yes | 96/495419 | **28.0648** | 1.1876 | certified; θ = 96/495419 |
| 476 | 96/530501 | yes | 1 / 1 | yes | 96/530501 | **29.0414** | 1.1877 | certified; θ = 96/530501 |
| 492 | 96/566783 | yes | 1 / 1 | yes | 96/566783 | **30.0180** | 1.1877 | certified; θ = 96/566783 |
| 577 | 16/65097 | yes | 1 / 1 | yes | 16/65097 | 10.5951 | 1.1881 | certified; θ = 16/65097 |
| 673 | 16/138633 | yes | 1 / 1 | yes | 16/138633 | 12.9080 | 1.1294 | certified; θ = 16/138633 |

- **Affine parameters.** Mine equal C-T1-U's printed ones (e.g. at 460: `a = −7/990838`, `λ = 1080/495419`, `a₂ = 17224/495419`,
  `λ₂ = −4305/990838`).
- **My vertex is a different certificate.** My `σ(d−1)` sits at the cap (e.g. `672/495419` at 460), while the seat's is
  `336/495419`. Both certify: the certificate is not a single fragile point.
- **Lower bound.** `θ_whole = (R_K − R_{K−1}) / Σ` (weights of the distinct sector switch images) is a lower bound for every valid
  sector flow. Every certificate sits 1.13–1.19× above it, as it must.
- **Scaling.** Sources with outflow above 1 are scaled to exactly 1, which only lowers loads.
- `RESULT_SHA256 d5e7a29c…d002`.

### D. The two small laboratory trees, literally (`sr3_lab.py`)

**Which two.** The brief does not name them. I took the two laboratories that the T adjudicator's search found with a
deletion-deficient sector, E1's criterion holding and the local LP feasible: `CB(4,1)/4` and `CB(5,2)/8`. I added four more for
context. On the literal tree I brute-forced `I_{p+1}` and `I_p`, computed literal `w_F` (F = all leaves; the lab's derived `F_p`
is reported) and the literal (D) and (S) arcs.

| Lab | supply / capacity | sector exits as classified | choke-local out / in / switch | E1 exact load forced | `θ ≤ 1 − ρ_1` | composed loads ≤ `w_F` | literal max-flow (D)∪(S) / (D) |
|---|---|---|---|---|---|---|---|
| `CB(4,1)/4` | 60 / 60 | yes (32 sources) | yes / yes / yes | yes (252 = 252 scaled) | **no** (2/3 vs 2/9) | no: worst ratio `13/9 = ρ_1 + θ` | 60 / 52 |
| `CB(5,2)/8` | 44000 / 46940 | yes (15360) | yes / yes / yes | yes | **no** (26/129 vs 111/743) | no: worst `100846/95847 = ρ_1 + θ` exactly | 44000 / 42080 |
| `CB(7,1)/6` | 924 / 945 | yes (672) | local LP infeasible | — | — | — | 903 / 812 |
| `CB(6,1)/5` | 390 / 340 | yes (240) | local LP infeasible | — | — | — | 340 / 310 |
| `CB(2,5)/8` | 416820 / 308320 | yes | yes / yes / yes | criterion fails (`ρ_1 = 52/49`) | — | — | 308320 / 308320 |
| `CB(3,3)/7` | 40440 / 32706 | yes | yes / yes / yes | criterion fails (`ρ_1 = 42/37`) | — | — | 32706 / 32706 |

- **Exits and choke-locality are exact on literal networks.** Every exit of every sector source is one of the classified kinds
  with the stated literal weight. The literal outflow, the in-sector inflow and the switch-image loads equal the choke-local
  formulas.
- **E1's load profile.** With target capacity `ρ_q·w_F(A)` on `r`-free `q ≥ 1` targets and 0 elsewhere, the non-sector
  deletion network saturates, and total capacity equals total supply. That forces E1's exact load `ρ_q·w_F`.
- **The margin is the binding condition.** At both named laboratories `θ > 1 − ρ_1`, and the composed flow overloads a switch image
  by exactly `ρ_1 + θ`. So the margin inequality is precisely what the composition needs; at the three rows it holds with 28–30×
  slack. (Both laboratory networks saturate anyway, by literal max-flow: 60 and 44000.) `CB(4,1)/4` reproduces the registered record
  (60/60/0; deletion-only 52, mixed 60). The local LP is infeasible at `CB(7,1)/6` and `CB(6,1)/5`, consistent with the recorded
  deficit 21 at `CB(7,1)/6`.
- All laboratories are non-eligible: validation only, never evidence. `RESULT_SHA256 3e30eb0e…77a1`.

### E. The composition (EST-4), checked step by step

1. **Every source is one of two kinds.** It is a sector source (`r, v ∈ B`; weight 1), or it is non-sector. Non-sector sources
   with `r ∈ B` have weight 0 (`v ∉ B`, no choke), and `r`-free ones are E1's.
2. **`f_E1`** (E1, at the criterion verified in B; `F = F_p` = all leaves `⊇ C`). It saturates every non-sector source along
   deletion arcs. It loads `ρ_q·w_F(A)` on `r`-free targets with `q ≥ 1`, and 0 on in-sector targets and on every other target.
3. **`f_sec`** (C, scaled). It saturates every sector source, loads in-sector targets `≤ 1 = w_F`, loads switch images
   `≤ θ*·ℓ`, and puts 0 elsewhere. A sector switch image is `r`-free with `q = 1`.
4. **The sum is a flow.** `f = f_E1 + f_sec` is `≥ 0` and supported on literal (D) ∪ (S) arcs, and every source is saturated. The
   target loads are:
   - in-sector: `≤ w_F` (E1 adds 0);
   - sector switch images: `≤ (ρ_1 + θ*)·w_F < w_F`;
   - other `r`-free `q ≥ 1` targets: `ρ_q·w_F ≤ w_F` (criterion (i), max at `q = 1`);
   - every other target: 0.
5. **Hall and integrality.** B7 gives (HALL-COND) for every `X ⊆ I_{p+1}`. Integer supplies and capacities with a feasible
   fractional saturating flow give an integral saturating flow (max-flow integrality; (HALL⇒FLOW)). This is (HALL) at the three
   `(T, p)`.
6. **Load-bearing.** The sector's only positive-weight deletion exits are the in-sector targets. So `Σ_sec w_F = R_K > R_{K−1} =
   Σ_{N_D(sec)} w_F`, (HALL-COND) fails at `X = sec` with (D) alone, and every saturating flow uses switch arcs.

**Hypotheses and where they enter.**

- The explicit `CB(8,m)` adjacency enters through `W_v = {r}`, `W_c = {u_i}`, the chokes adjacent to `r` only, and the pendant-`P_2`
  legs. It gives the weights, the exits and choke-locality.
- `C ⊆ F` is E1's hypothesis.
- `v ∈ F` gives the sector weight 1.
- `F = F_p` derived is what makes these (HALL) instances. That is `bounded_computation`, re-derived in A.
- The criterion at `(8, m, p)` gives E1's load clause.
- Finiteness.
- Not used: eligibility (beyond identifying the rows as (HALL) instances), invariance, the quotient, and any census value.

**ℕ-subtractions.** `K = p − 1` (`p ≥ 460`); `K − 1`; `d − g` (`g ≤ d − 1`); `d − β − γ` (used only when `β + γ < d`); `M − K + 1`
(positive at the rows). E1's `j = p − q` and `j − 1` are integer ranks, as its registered text requires: `p ≥ m + 1` holds (460 ≥ 87,
476 ≥ 90, 492 ≥ 93). None is truncated.

## Findings and repairs

- **F1 (3a).** EST-6 is confirmed as stated at all five rows by a third instrument, and the seat certificate's values are
  independently certified. The certificate values are search output. Only the stated bounds (saturation; in-sector ≤ 1;
  switch ≤ θ*·ℓ) are claimed.
- **F2 (3b), repairs to the brief's paraphrase, wording only.**
  1. "every target loaded ≤ `(ρ_1 + θ*)·w`" is literally false for in-sector targets. The certificate's exact maximum in-sector
     inflow is 1 = `w_F`, and `ρ_1 + θ* < 1`. The same sentence appears in CF-T2 ("≤ `(ρ_1 + θ*)·w < w`"). The correct form is the
     class-by-class bound in E.4, which the synthesis's R-5 states correctly as `max(1, ρ_1 + θ*, ρ_q)·w ≤ w`.
  2. The margin literal "29.1" at 476 should read **29.04** (28.06 / 29.04 / 30.02).

  Neither repair touches EST-4's statement on the synthesis's face, which is exact. **EST-4 is confirmed.**
- **F3 (3b).** Every positive-weight exit of a sector source is an in-sector deletion (weight 1) or a `u_i`-switch image (weight
  `γ_i`, `r`-free, `q = 1`). `B − r`, `B − v` and the `s`-switch weigh 0. This is proved in C and checked literally on six
  laboratories.
- **F4 (3b).** The D1 criterion at 460/476/492 is confirmed by my own transcription of E1's text: (i) and (ii) at every `q`,
  `ρ_1` exact.
- **F5 (3c).** EST-5 is the composition of EST-4 (3 first ranks) with registered D2 (the 174 ranks `[461,516] ∪ [477,534] ∪
  [493,552]`) = 177. It is a scope note on (HALL), not a key. Its grade is `computer_assisted`.
- **F6 (repair to the synthesis's frontier item (iv)).** The synthesis says the frontier is "(HALL-COND) under (D) ∪ (S) at
  `G(8^82, 7^2)/448` … for every `Aut`-invariant `X ⊆ sec`", and that "with E1-R … that sector statement would give whole-row
  (HALL)". The second clause is false as stated. Sector Hall with full target capacities does not superpose with the non-sector
  flow, because both use the switch images; this is CF-U2's caution on B7's restricted form. What composes is the
  **reduced-capacity** sector statement: a sector flow loading each switch image `A` at most `(1 − ρ_{Q(A)})·w_F(A)`, which is what
  EST-6 supplies at the `CB` rows. The repaired text is below. The wording "the only known switch-necessary eligible row without a
  certificate" is also narrowed: 577 and 673 also lack a whole-row certificate until SR-C4-4.
- **F7 (3d).** The name is a true predicate: at three `CB` first eligible ranks, (HALL) holds with switch arcs load-bearing. It is
  parallel to the registered five-row name. Alias scan (`sr3_alias.py`): every `alias_patterns` regex of the capsule snapshot
  (448 claims) and of the frozen master registry (434 claims), 398 patterns in all, was tested, case-insensitively, against the
  proposed name and the 13 registration blocks below; exact key and alias collisions were checked as well. Results:
  - no pattern matches the name, the KEY block, the scope notes or the record rows;
  - there are no exact collisions, and no ALIASES element contains `:` or `[`;
  - there is exactly one hit, and it is benign. The pattern of (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` matches
    `ORBIT-QUOTIENT-HALL` inside the C3-LA1 distinction row, whose KEY line must name the registered C3-LA1 key.
  - Following the synthesis's warning, the phrase "favorable-leaf aggregate" appears in no registration text.

  **Recommendation, not a ruling:** if
  SR-C4-4 confirms E-2′, register 577/673 as a scope note on this key rather than a renamed five-row key. The synthesis's fallback
  name `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-…` is lexically close to the registered
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-…-ABOVE-FIRST-ELIGIBLE-RANK`, and one flow key per scope is clearer.
- **F8.** The synthesis's "first eligible whole trees on record proved to satisfy (HALL) at every eligible rank" is true only with
  its qualifier ("with switch arcs load-bearing at one rank"). Deletion-only saturation at every eligible row of every tree of order
  11–18 is on record (`bounded_computation`). The registration text keeps the qualifier.
- **Fences.** Checked, with nothing crossed:
  - no status transfer to (HALL), the primary aggregate, `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, TREE,
    FOREST, TRANSFER or Erdős #993;
  - no refuted mechanism revived;
  - no census value in any proof step;
  - no RTree wording;
  - (LIFT) not used;
  - sealed roots untouched.
- **Attribution.** It travels on every face below.

## Registration text

```text
KEY: E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let CB(d,m) be the tree with path r–s–v, m chokes u_i ~ r, d supports b_ij ~ u_i and one private leaf c_ij ~ b_ij. At the three instances (T, p) = (CB(8,86), 460), (CB(8,89), 476), (CB(8,92), 492) — the first ranks of the eligible windows [460,516], [476,534], [492,552], with (n, alpha, x) = (1465, 775, 458), (1516, 802, 474), (1567, 829, 490) — let F = F_p(T), which is the whole leaf set (689, 713, 737 leaves; derived from Delta_p(T − t) < 0 on the original tree), let w_F be the literal active-tag weight and use the literal relation (D) ∪ (S). Then there is a nonnegative rational function f on the (D) ∪ (S) arcs from I_{p+1}(T) to I_p(T) with Σ_A f(B, A) = w_F(B) for every source B and Σ_B f(B, A) <= w_F(A) for every target A; hence (HALL-COND) holds for every X ⊆ I_{p+1}(T) (record B7) and an integral saturating flow exists (max-flow integrality), i.e. (HALL) holds at these three (T, p). Switch arcs are load-bearing: every member of the root-plus-arm sector sec = {B ∈ I_{p+1} : r, v ∈ B} has weight 1 and its only positive-weight deletion exits are the in-sector targets, so Σ_sec w_F = R_K = 2^K C(8m, K) (K = p − 1) exceeds the whole positive-weight deletion neighbourhood R_{K−1} (ratios 460/459, 476/475, 492/491) and no deletion-only saturating flow exists. Certificate: f = f_E1 + f_sec. f_E1 is the flow of key E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, whose criterion (i) and (ii) holds at the three ranks in exact integers (max_q rho_q at q = 1; rho_1 = 460421124882845/462938713343604, 1698319298589907/1707291739633300, 4838946572060835/4863675235331932): it saturates every non-sector source along deletion arcs, loads every r-free target with q >= 1 chokes at exactly rho_q·w_F(A) and every other target at 0. f_sec is a choke-local sector flow (value pb(β,γ) or pc(β,γ) on the deletion of a b- or c-leg at a choke in state (β,γ), σ(γ) on the u_i-switch when β = 1, 0 on the deletions of r and v and on the s-switch; each source scaled to outflow exactly 1), certified by exact dynamic programming over every profile of m choke states: every sector source saturated, every in-sector target loaded at most 1 = w_F, every switch image (B − {r, b_ij}) ∪ {u_i} (r-free, one choke, weight ℓ = γ_i <= 7) loaded at most θ*·ℓ with θ* = 96/495419, 96/530501, 96/566783. Since θ* < 1 − rho_1 (margins (1 − rho_1)/θ* = 28.06, 29.04, 30.02), the loads are: in-sector targets at most w_F; sector switch images at most (rho_1 + θ*)·w_F < w_F; other r-free targets with q >= 1 exactly rho_q·w_F <= w_F; every other target 0.
SCOPE: Three named ordinary-tree instances only. Inputs at their grades: E1 (proved_informal); E1's criterion at the three ranks (the (D1) certificate of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK, computer_assisted; recomputed by SR-C4-3); the choke-local sector certificate (computer_assisted; three instruments: C-T1-U's LP and exact DP, the T adjudicator's affine-separation checker, SR-C4-3's own LP and exact DP, which also certify the seat's values); record B7 (proved_informal); F_p(T) = leafSet(T) derived at each row (bounded_computation; re-derived by SR-C4-3 with supply − capacity = S(T, p) asserted from independent sides). Grade: the weakest input, computer_assisted. A finite certificate: never formally_verified, not a Lean target (an enumeration-scale check), never an Outcome-A event. No eligibility, invariance or quotient hypothesis enters the proof; eligibility only identifies the instances.
ATTRIBUTION: C-T1-U (Claude Opus 5.5; r30 Cycle 4 critique A8: the choke-local sector certificate and the conditional composition). Controller Claude Fable 5.1 (CF-T1: E1's load clause quoted; CF-T2 and CF6-4: the composition derived; one more instrument, never authority). r30 Cycle 4 T adjudicator (Claude Opus 5.5; E-2: independent affine-separation checker, E1 reconstruction, literal laboratory validation). r30 Cycle 4 synthesis (Claude Opus 5.5; EST-4). Isolated second read SR-C4-3 (Claude Opus 5.5; third instrument: own LP, own exact DP, own E1-criterion code, own row data, literal laboratories). Route T1 (Claude Sonnet 5) posed the object; its own numbers are not inputs. E1 and the five-row key of record (C-T1-F, C-T1-U, the r30 Cycle 3 T adjudicator, T1 of Cycle 3; second reads SR-C3-3, SR-C3-4). Record B7 (C-U2-F, C-U2-T; SR-C3-7). Codex (GPT-6 Astra/Sol/Luna) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the definition layer, entries 1–18; r24–r26 for the definition layers.
FENCES: Three finite instances; not parameter-uniform; nothing about any other CB(d,m), any other rank, or any other tree. E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Not the five-row key (that key asserts nothing at these first ranks beyond (D1)); the rows CB(8,108)/577 and CB(7,144)/673 are not covered (sector certificate only; E1's criterion there awaits SR-C4-4); nothing at G(8^82, 7^2)/448. No status transfer to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (S < 0 at these rows was already known), E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. Not E993-R23-LITERAL-DELETE-ONLY-HALL and no refuted mechanism revived (distinction rows). The sector flow is one finite certificate per row, not the uniform lemma (L-S). No governed-RTree assertion. No census value enters.
ALIASES: EST-4 (r30 Cycle 4 synthesis), E-2 (r30 Cycle 4 T adjudication), C-T1-U A8 composition, CF-T2 composition
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C4; SR-C4-3] At CB(8,86), CB(8,89) and CB(8,92), with F = F_p(T) the whole leaf set (derived at every eligible rank), (HALL) holds at every eligible rank: 177 instances, windows [460,516], [476,534], [492,552]. At the first ranks 460, 476 and 492 it holds by key E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, with switch arcs load-bearing (the root-plus-arm sector is deletion-deficient, ratios 460/459, 476/475, 492/491); at the 174 ranks above them by the (D2) part of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK, with deletion arcs alone. Grade computer_assisted (the weakest input of either part). A composition of those two keys, not a new key. At these three rows it closes the Cycle 2 obligation (O2) as narrowed by SR-C3-4, and for these three rows only it supersedes the sentences "at no eligible row has saturation of the whole network with switch arcs been exhibited or proved where deletion alone fails" and "whole-network saturation at all six first ranks" (open list) of [r30 C3; SR-C3-6]: these are the first eligible rows on record at which (HALL) is established with switch arcs load-bearing. Still open at the instance level: whole-row (HALL) at CB(8,108)/577 and CB(7,144)/673 (sector certificates exist; E1's criterion there awaits SR-C4-4) and at G(8^82, 7^2)/448. Fences: finite instances; not parameter-uniform; (HALL) stays OPEN; no status transfer; the primary aggregate untouched; no refuted mechanism revived. Attribution: C-T1-U; the controller (CF-T1, CF-T2, CF6-4); the r30 Cycle 4 T adjudicator and synthesis; the five-row key's authors; isolated second read SR-C4-3 (all Claude Opus 5.5 except the controller, Claude Fable 5.1); Codex (GPT-6) for the network.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C4; SR-C4-3; frontier] Smallest unproved lemma at the instance level (a named open statement, not a claim). With the three CB(8,·) first ranks settled, the lowest-order switch-necessary eligible row on record without whole-row (HALL) is G(8^82, 7^2)/448 (order 1427, F_448 = all 671 leaves). The lemma: a nonnegative flow from the root-plus-arm sector sec = {B ∈ I_449 : r, v ∈ B} along literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most its weight 1, and loads every switch image A = (B − {r, b}) ∪ {u_i} at most (1 − rho_{Q(A)})·w_F(A), where rho_{Q(A)}·w_F(A) is the load of the heterogeneous mark-clone flow (E1-R: STATED, conditional on CD-1, pending SR-C4-5 and SR-C4-6; its criterion verified at all 56 eligible ranks, bounded_computation); equivalently, (HALL-COND) for every X ⊆ sec in the sector network with those reduced switch-image capacities. With E1-R confirmed, such a flow gives whole-row (HALL) at G(8^82, 7^2)/448 by the superposition of E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS. Sector Hall under (D) ∪ (S) with full capacities is necessary but not sufficient for that composition: a Hall condition on sector subfamilies does not superpose with the non-sector flow, which also uses the switch images (the caution on record B7's restricted form). Obstruction R8: some sector targets there have all 448 preimages switch-dead, so no uniform one-hop share rule certifies it; a choke-local non-uniform certificate is not excluded. At CB(8,108)/577 and CB(7,144)/673 the corresponding reduced-capacity sector flows exist (EST-6); only E1's criterion there awaits SR-C4-4. Uniformly, the missing pair is (L-i) and (L-S) on an infinite CB class. Fences: an open lemma, not evidence; (HALL) stays OPEN; no status transfer. Attribution: r30 Cycle 4 synthesis (frontier) as repaired by SR-C4-3; C-F1-T and C-F1-U (R8); the r30 Cycle 4 T adjudicator (E1-R; (L-i), (L-S)); C-F1-U (the order-1427 tree).
```

```text
SCOPE NOTE ON: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: [r30 C4; SR-C4-3] The first eligible ranks 460, 476 and 492 of CB(8,86), CB(8,89) and CB(8,92), where this key asserts nothing beyond (D1), are covered with switch arcs by the separate key E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (computer_assisted). That key's certificate uses this key's (D1) criterion values at those ranks (recomputed by SR-C4-3 from E1's registered text: (i) and (ii) at every q, max_q rho_q at q = 1, rho_1 exact as listed here) and E1's load clause. With (D2), (HALL) holds at every eligible rank of the three rows (scope note on E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL). This key's statement, grade and fences are unchanged; its sentence "No deletion-only saturating flow exists there" stands, and the separate key's flow uses switch arcs.
```

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERT-CB8x86-P460
CLAIM: At CB(8,86)/460 (n 1465, alpha 775, x 458 computed through rank alpha, eligible window [460,516]; F_460 = all 689 leaves, derived; supply 330 digits, S 328 digits and negative, supply − capacity = S from independent sides) the root-plus-arm sector sec = {B ∈ I_461 : r, v ∈ B} (every member of weight 1; R_459/R_458 = 460/459) has a choke-local nonnegative rational flow on literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most 1, and loads every u_i-switch image of weight ℓ at most θ*·ℓ with θ* = 96/495419 (affine separation a = −7/990838, lam = 1080/495419, a2 = 17224/495419, lam2 = −4305/990838; exact DP: minimum source outflow 1, maximum in-sector inflow 1). θ* is 1.1876 times the whole-sector lower bound (R_K − R_{K−1}) / (total weight of the sector switch images), and (1 − rho_1)/θ* = 28.06. It is the sector ingredient of key E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS; alone it is not (HALL).
STATUS: computer_assisted
PROVENANCE: C-T1-U (Claude Opus 5.5; A8, certify.py); r30 Cycle 4 T adjudicator (adj_verify_cert.py); isolated second read SR-C4-3 (own LP and DP, sr3_cert.py; the seat values also certified). Three instruments. Network: Codex (GPT-6).
```

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERT-CB8x89-P476
CLAIM: At CB(8,89)/476 (n 1516, alpha 802, x 474, eligible window [476,534]; F_476 = all 713 leaves, derived; supply 342 digits, S 340 digits and negative, supply − capacity = S from independent sides) the root-plus-arm sector (every member of weight 1; ratio 476/475) has a choke-local nonnegative rational flow on literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most 1 and every u_i-switch image of weight ℓ at most θ*·ℓ with θ* = 96/530501 (exact DP: minimum source outflow 1, maximum in-sector inflow 1); θ*/θ_whole = 1.1877; (1 − rho_1)/θ* = 29.04. The sector ingredient of key E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS; alone not (HALL).
STATUS: computer_assisted
PROVENANCE: C-T1-U (A8); r30 Cycle 4 T adjudicator; isolated second read SR-C4-3. Three instruments.
```

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERT-CB8x92-P492
CLAIM: At CB(8,92)/492 (n 1567, alpha 829, x 490, eligible window [492,552]; F_492 = all 737 leaves, derived; supply 353 digits, S 351 digits and negative, supply − capacity = S from independent sides) the root-plus-arm sector (every member of weight 1; ratio 492/491) has a choke-local nonnegative rational flow on literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most 1 and every u_i-switch image of weight ℓ at most θ*·ℓ with θ* = 96/566783 (exact DP: minimum source outflow 1, maximum in-sector inflow 1); θ*/θ_whole = 1.1877; (1 − rho_1)/θ* = 30.02. The sector ingredient of key E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS; alone not (HALL).
STATUS: computer_assisted
PROVENANCE: C-T1-U (A8); r30 Cycle 4 T adjudicator; isolated second read SR-C4-3. Three instruments.
```

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERT-CB8x108-P577
CLAIM: At CB(8,108)/577 (n 1839, alpha 973, x 575, eligible window [577,648]; F_577 = all 865 leaves, derived; supply 415 digits, S 413 digits and negative, supply − capacity = S from independent sides; 3p = 2M + 3, sector ratio 289/288) the root-plus-arm sector has a choke-local nonnegative rational flow on literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most 1 and every u_i-switch image of weight ℓ at most θ*·ℓ with θ* = 16/65097 (exact DP: minimum source outflow 1, maximum in-sector inflow 1); θ*/θ_whole = 1.1881; (1 − rho_1)/θ* = 10.60. SECTOR ONLY: whole-row (HALL) here (E-2′) additionally needs E1's criterion at this rank on a second instrument and its own second read (SR-C4-4); this record asserts nothing about the whole row.
STATUS: computer_assisted
PROVENANCE: C-T1-U (A8, certify_o3.py); r30 Cycle 4 T adjudicator; isolated second read SR-C4-3 (sector certificate only). Three instruments.
```

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERT-CB7x144-P673
CLAIM: At CB(7,144)/673 (n 2163, alpha 1153, x 671, eligible window [673,768]; F_673 = all 1009 leaves, derived; supply 485 digits, S 483 digits and negative, supply − capacity = S from independent sides; 3p = 2M + 3, sector ratio 337/336) the root-plus-arm sector has a choke-local nonnegative rational flow on literal (D) ∪ (S) arcs that saturates every sector source, loads every in-sector target at most 1 and every u_i-switch image of weight ℓ (at most 6) at most θ*·ℓ with θ* = 16/138633 (exact DP: minimum source outflow 1, maximum in-sector inflow 1); θ*/θ_whole = 1.1294; (1 − rho_1)/θ* = 12.91. SECTOR ONLY: whole-row (HALL) here (E-2′) additionally needs E1's criterion at this rank on a second instrument and its own second read (SR-C4-4); this record asserts nothing about the whole row.
STATUS: computer_assisted
PROVENANCE: C-T1-U (A8, certify_o3.py); r30 Cycle 4 T adjudicator; isolated second read SR-C4-3 (sector certificate only). Three instruments.
```

```text
DISTINCTION ROW: R30-C4-THREE-CB-HALL-VS-FIVE-CB-ROWS-DELETION-HALL
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: Complementary scopes, no overlap of (HALL) instances. The five-row key gives full (HALL) with deletion arcs alone at the ranks ABOVE the first of five rows ((D2), (D3)) and the non-sector clause (D1) at all 177 ranks of the three CB(8,·) rows; it asserts nothing at the first ranks beyond (D1) and records that no deletion-only saturating flow exists there. E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS gives full (HALL) at exactly those first ranks 460, 476, 492, with (D) ∪ (S) and switch arcs load-bearing, and uses (D1)'s criterion values as an input. Neither key is an alias of the other.
```

```text
DISTINCTION ROW: R30-C4-THREE-CB-HALL-VS-C3-LA1
KEY: E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR
TEXT: C3-LA1 is a graph-generic equivalence of Hall conditions (weighted Hall at F_p iff the full-Aut orbit quotient's Hall inequality), formally verified; it decides no instance and constructs no flow. E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS decides three instances by an explicit rational flow on the original network, with no quotient step and no use of C3-LA1. Not an alias; no status transfer in either direction.
```

```text
DISTINCTION ROW: R30-C4-THREE-CB-HALL-VS-CBSTAR-SECTOR-DEFICIT
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The CBstar key is an exact deletion-only deficit formula on the root-plus-arm sector of CBstar(d,m,t), with the no-deficit corollary for t >= 2 at p >= x + 2; at t = 1 (the CB family) the corollary fails and the sector is deletion-deficient at the first eligible ranks. E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS uses that t = 1 deficit only as the load-bearing fact (recomputed: 460/459, 476/475, 492/491) and proves full (HALL) with switch arcs at three instances. The CBstar key is a statement about deletion neighbourhoods of sector subfamilies, not (HALL); not an alias; the CBstar key's scope is not extended.
```

```text
DISTINCTION ROW: R30-C4-THREE-CB-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key is a universal, unweighted deletion-only Hall statement for every finite ordinary tree under the r23 literal contract, refuted by the CB(8,92) arm-tag sector cut. E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS is a finite statement at three instances, with the active-tag weight w_F at the fixed selector F_p and the relation (D) ∪ (S); at CB(8,92)/492, the refuted key's own witness row, it shows the deletion-deficient sector served through switch arcs. It uses deletion arcs only inside a flow that also needs switch arcs, asserts no deletion-only Hall anywhere, and revives nothing: the refuted key stays REFUTED at its exact scope.
```

## Verdicts

verdict[SR-C4-3a]: confirmed
verdict[SR-C4-3b]: confirmed_with_repairs
verdict[SR-C4-3c]: confirmed
verdict[SR-C4-3d]: confirmed

- **SR-C4-3a (EST-6).** Confirmed at all five rows. It was re-derived on my own LP (the same θ*), certified by my own exact DP,
  and the seat's values are also certified. The choke-local model was checked literally.
- **SR-C4-3b (EST-4).** Confirmed. The repairs are to the brief's paraphrase only: (1) the load bound is class by class
  (in-sector `≤ w_F`; switch images `≤ (ρ_1 + θ*)·w_F`; other `r`-free `≤ ρ_q·w_F`), not "every target `≤ (ρ_1 + θ*)·w`"; (2) the
  margin at 476 is 29.04, not 29.1. EST-4's own text is exact and is registered as given above.
- **SR-C4-3c (EST-5).** Confirmed. It is a composition (EST-4 + registered D2 = 177 ranks), `computer_assisted`, a scope note and
  not a key.
- **SR-C4-3d.** Confirmed. The name is a true predicate, the alias check is clear (see inventory), and there are four distinction
  rows. The synthesis's frontier item (iv) is repaired in the second (HALL) scope note (F6).

**Decisive answer for ruling 30 letter (b): EST-4 is confirmed. Full (HALL), with switch arcs load-bearing, holds at
`CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492` (`computer_assisted`).**

## Artifact inventory

Deliverable: this file,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C4-3/SECOND-READ.md`.
Its SHA-256 is reported in the final message, because a file cannot carry its own digest.

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-3/`
(digests below).

| File | SHA-256 | Role |
|---|---|---|
| `facts6.txt` | `dc1ecc4c650d2c35ad86e5d5823418d18def4a358d13280392c9e9883e2c14a4` | readable dump of the Stage 6 controller facts (capsule member) |
| `frozen_audit.py` | `25a971f191c2088762b4f320a68a9eeb5ffa5ce12cb2491a6806e3ef2c30328a` | 35 frozen c4-stage7 members vs the frozen SOURCE-DIGESTS.json |
| `oblig_extract.txt` | `8a1ebb9d60ac57fa55b75aa6d15d14ebab9fecf3609df7d80254cc1902b14691` | B7 and CB-record rows from the capsule obligations snapshot |
| `out_frozen_audit.txt` | `c6b1cfb5404b1e375b2bf8b5bfdea364f072742aebebe0d5302ea8424e848de2` | its output (35 ok) |
| `out_seal_audit.txt` | `ccc13c31bdf5416295cf7b02f30e5a18d1365c00187ecd73fa44d624d0e4bfbb` | its output (seal match; 0 mismatches) |
| `out_sr3_alias.txt` | `635c5630147157e961bf4fc0bac73c5beae35169f216dddd563b16dd1d438530` | its output (1 benign hit) |
| `out_sr3_cert.json` | `d5e7a29c00da9eb11e4577e5e03af2f9bf48853eda3a5f55d9b3d512d9cdd002` | its result (ALL_OWN_CERTIFIED True, ALL_SEAT_CERTIFIED True) |
| `out_sr3_cert.txt` | `8daafe08bfa100ffa29dc57b8cc7350ba2d72d70e959dde93af8ff6453dfcb06` | its output |
| `out_sr3_d2check.txt` | `5cd5af736c94fe77a204e6db9f7b2e1192a78a9f65d19da03e91e71c3a9a5009` | its output |
| `out_sr3_e1.json` | `cbf835a4f7729cea0c00282c11f95c2e782ca812763fa2dad7badf92017116ca` | its result |
| `out_sr3_e1.txt` | `5befc3e856a1cc1f49de5641925bee3d98f604dc40ae4cea0728281b1dba583f` | its output |
| `out_sr3_lab.json` | `3e30eb0e7c735d6fcf0f5b309c64c40cbfbe0ef3a2405f6f1e4c0f61834277a1` | its result |
| `out_sr3_lab.txt` | `3194c23ae576f7a4f83879976875b4de082ffe3747abd4cdff45c7e7c1568160` | its output |
| `out_sr3_rows.json` | `1c33c55e68887c04261dd9a28dc508b292b9a5b0062bd71fdb69058ca20af6a7` | its result (RESULT_SHA256 1c33c55e…) |
| `out_sr3_rows.txt` | `9b683e380ec910303e1cbe1155878a3c28904596cf2b88eb2c1f8540d63f916f` | its output |
| `registry_extract.txt` | `37018fc93ce6357b8a51ab704d8e9ddcdcd7bfe3b745f04c80fd912d82e41fb3` | E1, five-row key, (HALL), R23 delete-only entries and R30 key list from the capsule snapshot |
| `seal_audit.py` | `6f816872e10e136ba08c17740f1e7992d41958bc713f76446901a1d6c24d0e10` | capsule seal and 62 member digests |
| `sr3_alias.py` | `7f6e12584152d0da430046b67670b732bfff2948e81c38646b7eaad40edadbd3` | alias-pattern and collision scan of the registration texts |
| `sr3_cert.py` | `5779440d3e577dc50ba9d33ddc929ac4f522a626d1c31ee7d458c38c578fcf70` | own sector certificate: LP, exact DP; seat values verified as data |
| `sr3_d2check.py` | `0d95d335d16729f9cde356dfad4af85743fb8a930f4af6ee99b16860a6a0f36f` | E1 criterion at all 177 ranks; D2 sector condition (corroboration) |
| `sr3_e1.py` | `f870988115988ad17386e3babef2783967c50a94bf556b6da2b1d1e8d07f9dd0` | E1 criterion transcribed from the registered text; rho_1 |
| `sr3_lab.py` | `48b7e2eb0a525f1b41e9f2616dd061c422cff41645fd3345e1761f0de0ae860b` | literal laboratories: exits, choke-locality, E1 exact load, composition, max-flows |
| `sr3_lp.py` | `5d940c3857365c7e93102cedc3441d183521ea544abf359f396b63f5369e99f0` | own exact two-phase simplex (search device) |
| `sr3_poly.py` | `d06a1120ec96be33548b6f6246a4f882a152629846c4be46a9884085de335ee8` | exact polynomial arithmetic (Kronecker) and the generic labelled-tree DP |
| `sr3_rows.py` | `280f28831686bb46f3e17bfc468f56f193643e8f623e653e71c3bd40ac6f8242` | row data, derived F_p, WID two-sided, windows, sector ratios |

Replay, from the scratch directory, with `python3 -B` in the foreground:

1. `seal_audit.py`
2. `frozen_audit.py`
3. `sr3_rows.py` (about 12 s)
4. `sr3_e1.py`
5. `sr3_d2check.py` (about 41 s)
6. `sr3_cert.py` (about 7 s)
7. `sr3_lab.py` (about 55 s)
8. `sr3_alias.py`

Background jobs: none were started, so none remain.
