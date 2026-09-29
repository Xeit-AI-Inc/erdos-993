# Second Read

Isolated second read **SR-3**, r31 Cycle 1 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): the sector-certificate composition
to (HALL) on the literal network (synthesis S3) and its registration (synthesis R-2). Written 2026-09-28 (session clock 00:13–00:50
EDT).

**Boot acknowledgment.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. My first combined print failed on a zsh
`=====` separator. The tool display also truncated the middle of `verity.md` and I first printed only lines 1–150 of the startup
protocol, so I read the remaining spans of both files before writing any finding. Subsystems loaded: the constitution and the startup
protocol only. The controller owns conversation logging and durable updates. This read writes only this file and scratch under
`scratchpad/c1-sr-SR-3/`.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C1-SECOND-READ-PROTOCOL.md`: SHA-256 `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`.
  **MATCH** with the dispatch value. I checked it before reading the file.
- **Brief** `control/C1-SECOND-READ-BRIEF-SR-3.md`: SHA-256 `93c0fc618774d19e2f6798acae0ecffea372ab4007102d18b391320f7eab1e3c`.
  **MATCH.** I checked it before reading the file.
- **Capsule** `control/c1-second-read/SR-3-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-3`, 775 members.
  - I recomputed the seal as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with separators
    `(",", ":")` and no trailing newline: **`232931c10d9b39bba1fa398c13bd3fd2c5b86cb41a20a5c42b2852492c5e0bf0`. MATCH.**
  - **775/775** members match both byte count and SHA-256 (`seal.py`).
  - The file's own SHA-256 is `3a114ceb…fd993`. That is a file digest, not the seal.
- **Frozen instruments** `sources/c1-stage7-sources/`: all **109/109** capsule members under that directory match that directory's
  `SOURCE-DIGESTS.json` in bytes and SHA-256. I checked them before reading any of them.
- **r30 sources and the master registry:** all **640/640** capsule members under `sources/r30/`, plus
  `sources/authority/CLAIM-IDENTITY.json`, match `sources/SOURCE-DIGESTS.json`.
- **Registries.** The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and the frozen master
  `sources/authority/CLAIM-IDENTITY.json` are byte-identical: both SHA-256 `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b`,
  491 claims each. I ran the alias check against both anyway.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch them, did not use them,
     and wrote no conversation log, because the protocol confines my writes.
  2. The harness saved two oversized tool outputs to its own tool-results folder, outside the run root:
     - my first print of the brief together with the manifest. I did not read this back. I re-read the brief by itself (4,957 bytes);
     - my own script's print of three registry entries, all taken from the capsule member `sources/authority/CLAIM-IDENTITY.json`. I
       read this one back.
  3. Directory listings outside the capsule, names only: one `ls -1` of my own scratch `scratchpad/c1-sr-SR-3/`, for the artifact
     inventory. `mkdir -p` created that scratch folder and `second-reads/SR-3/`. A name-scoped `pgrep -fl c1-sr-SR-3` matched nothing.
  4. I read no return, critique, adjudication or scratch outside the capsule, and no other experiment root.
  5. I made no Mathlib access, ran no `lake` or `lean`, used no network and installed nothing.
  6. Every computation was foreground `python3 -B`, standard library only, with exact integers and `Fraction`. `sr3_small.py` calls
     `sr3_alloc.py` as a blocking child process through `subprocess.run`. No job ran in the background and I killed nothing.
- **Instruments.** All of them are my own and live in my scratch. I used no seat code and no seat graph code. The frozen seat
  instruments and Lean files were read only, for statement shape: the Lean statements of `exists_saturatingFlow_of_saturatingFlowQ`,
  `cb8_flowConjunct_of_rationalFlow`, `IsSaturatingFlow`, `WeightedHall` and `transportRel`. Controller replays and frozen census
  values are cited nowhere as evidence.

## Statements read

- **SR-3a (synthesis S3).** On the class `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, the hypotheses are:
  - `F_{p*}(T) = leafSet(T)`;
  - the mark-clone criterion (i) and (ii) at every `q ∈ [1,m]`;
  - nonnegative `pb`, `pc`, `σ`, `θ` satisfying Out, In, Switch and Residual, over every state assignment.

  The conclusion: the literal (D) ∪ (S) network at `p*` has a nonnegative rational flow that saturates every source within every
  capacity, hence (HALL) and an integral `IsSaturatingFlow`. The lemma is sufficient, not an equivalence.
- **SR-3b (synthesis R-2).** The proposed key
  `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-E1-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
  at `proved_informal`. The brief asks me to check that the name is a predicate, that it is alias-clear against r30's row key and
  criterion key, and that r30 attribution travels.

Origins read, all in the capsule: U2's return; critiques `C-U2-T` and `C-U2-F`; the U adjudication (the U2 section, cross-route
reconciliation, established results, rejections); the synthesis (reconciliation row 3, S3, "Refuted or narrowed", registrations);
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md` and r30's `SEMANTIC-CONTRACT.md` §1.2. From the registry I read the faces of:
- the criterion key and the heterogeneous criterion key;
- the row keys `…CB-8-M-95-TO-107…` and `…FIVE-CB…`;
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`.

I also read SR-C6-2's structural-fidelity paragraph and registration blocks (for format), lines 112–122 of r30 C6 T2's return (the
"B7" meaning), and the controller facts CF6-1..7 and CF-U-1..3 (facts, never authority).

## Independent re-derivation

### Proof, rebuilt from the face (my own derivation from the contracts)

**Setting.** Let `B` be a sector source: `r, v ∈ B`, so `s ∉ B` and every `u_i ∉ B`. Then `B = {r, v}` together with `K = p* − 1`
leg vertices. The state of choke `i` is `(β_i, γ_i)`, with `β_i + γ_i ≤ 8`.

**Lemma 0 (weight dichotomy).** Here `W_v = {r}` and `W_{c_ij} = {u_i}`, both checked literally.
- If `r ∈ S`, independence excludes every `u_i`, so `w_F(S) = [v ∈ S]`. This uses `v ∈ F`.
- If `r ∉ S`, then `v` is inactive and `w_F(S) = #{c_ij ∈ S : u_i ∈ S}`. This uses `C ⊆ F`.

**(1) Non-sector sources.** They are routed by the criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`).
- Its hypotheses: `C ⊆ F`, supplied by `F = leafSet`, and its criterion at `(8, m, p*)`, which is conditions (i) and (ii) at every
  `q ∈ [1,m]`. Condition (ii) holds identically by its scope note `[r30 C4; SR-C4-6]`.
- Its face gives a flow on **deletion arcs** out of `I_{p*+1} ∖ sec`. The flow saturates every such source. It loads each `r`-free
  target with `q ≥ 1` chokes at exactly `ρ_q·w_F(A) ≤ w_F(A)`, where `≤` is condition (i), and loads every other target at 0.
- Sources with `r` but not `v` have weight 0 and send nothing.
- **Capacities.** Because the flow is deletion-only, `r ∉ B` forces `r ∉ A`. So every in-sector target (`r ∈ A`) and every `Res`
  target gets 0 from it. The only targets it shares with the sector part are those of (3) below.

**(2) The sector, of weight 1 per source, routed by the template.** Only literal arcs are used.
- *The arcs of `B`:*
  - the `p*+1` deletions;
  - the switch at `s` (`N(s) ∩ B = {r, v}`);
  - one switch at `u_i` for each choke with `β_i = 1` (`N(u_i) ∩ B = {r, b}`);
  - no other `u` has two neighbours in `B`.
- *Where the rule puts flow:*
  - `pb(β_i,γ_i)` on each `b`-deletion and `pc(β_i,γ_i)` on each `c`-deletion;
  - `σ(γ_i)` on the `u_i`-switch when `(β_i,γ_i) = (1, γ ≥ 1)`;
  - 0 on the deletions of `r` and of `v`, on the `s`-switch and on the `(1,0)` switches. Each of these lands on a target of weight 0.
- All positive arcs have distinct targets. So the literal outflow is `Σ_i Out(β_i,γ_i)`, where
  `Out(β,γ) = β·pb + γ·pc + [β=1, γ≥1]·σ(γ)`. It is `≥ 1` by the Out hypothesis, and the source is scaled by `1/Σ_i Out ≤ 1`.
- **In ≤ 1 is the capacity bound at `K−1`.** Take an in-sector target `A`. Its deletion preimages are `A ∪ {x}`:
  - `x = s` and `x = u_i` are excluded, because both are adjacent to `r`;
  - so `x` is `b_ij` or `c_ij` on a leg that is empty in `A`.

  Its switch preimages need `u ∈ A` with two neighbours in the preimage:
  - `u = r` gives an `r`-free source, which carries 0;
  - `u = b_ij` is impossible, because it would put `u_i` next to `r`;
  - `u = c_ij` and `u = v` have only one neighbour.

  So the sector inflow is exactly `Σ_i (8−β_i−γ_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1))` (0 at a full choke). This is at most 1 over every
  assignment of total `K − 1`.
- **The `8−γ` preimage count.** Take a `u_i`-switch image `A = (B ∖ {r, b_ij}) ∪ {u_i}`. It is `r`-free, has the single choke `u_i`,
  has no `b` there, contains `v`, and has weight `γ`.
  - A sector preimage must insert `u_i` and remove `{r, b_ij'}`, so it is `(A ∖ {u_i}) ∪ {r, b_ij'}` with `j'` any leg that is empty
    in `A`.
  - There are exactly `8 − γ` of them. Each is in state `(1, γ)` and loads `σ(γ)`.
  - The load is therefore `(8−γ)σ(γ) ≤ θγ` by Switch.

**(3) The shared-capacity accounting, and where `C ⊆ F` enters.** The only targets that receive flow from both parts are the
`u_i`-switch images with `γ ∈ [1,7]`.
- Each is `r`-free with exactly one choke (`q = 1`), so the criterion flow loads it at `ρ_1·w_F(A) = ρ_1·γ`.
- Its total is at most `(ρ_1 + θ)γ ≤ γ = w_F(A)`, by Residual `θ ≤ 1 − ρ_1`. Residual is exactly the leftover capacity
  `(1 − ρ_1)γ` that such an image still has after the criterion flow.
- `C ⊆ F` enters twice, and only here and in (1):
  - as the criterion key's hypothesis;
  - as the capacity `w_F(A) = γ` of the switch image, because every `c_ij` at choke `i` must be a tag.
- `v ∈ F` gives every sector source and in-sector target its weight 1.
- Every other target class gets flow from only one part:
  - in-sector: `≤ 1`;
  - `Res`: 0;
  - `r`-free with two or more chokes, a single choke with `s`, a single choke with a `b`-leg, a single choke with `γ = 8`, or
    `γ = 0`: `ρ_q·w ≤ w` or 0.

  Nothing is double-counted: the source sets of (1) and (2) are disjoint.
- The equality `ρ_1 = max_q ρ_q` is **not** needed. The switch image's load uses the key's own `q = 1` ratio.

**(4) Rational flow ⇒ (HALL) ⇒ integral flow.**
- **Rational flow to (HALL).** Sum over `X ⊆ I_{p*+1}`:
  `Σ_X w = Σ_X Σ_A f ≤ Σ_{A ∈ N(X)} Σ_B f ≤ Σ_{N(X)} w`, using nonnegativity and the fact that `f` is supported on literal arcs. This
  is an elementary step. The working label "B7" names exactly this step; r30 C6 T2 treats it as "an elementary fact … not a
  seat-graded claim", and it has no key.
- **(HALL) to an integral flow.** This is the kernel-checked companion `exists_saturatingFlow_of_weightedHall` on the face of
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (VERIFIED, `formally_verified`; a companion carries no certificate
  of its own). Finite max-flow integrality does the same job.
- The r31 scratch chain `weightedHall_of_saturatingFlowQ` → `exists_saturatingFlow_of_saturatingFlowQ` → `cb8_flowConjunct_of_rationalFlow`
  has exactly this shape. I read its statements, and they match `IsSaturatingFlow`, `WeightedHall` and `transportRel` as carried. As
  scratch it has **no grade**.

**Hygiene.**
- **ℕ-subtractions:** `K = p*−1`, `K−1`, `8−γ` (`γ ≤ 7`), `8−β−γ` (`β+γ ≤ 8`), and `p*−q`, `p*−q−1` (`q ≤ m < (13m+4)/3`). All are
  in range.
- No Darroch or Newton, no asymptotics, no `M_0`.
- The residue enters only through the integrality of `p*`. The endpoint `m = 107` is included, and the lemma never uses `m ≥ 107`:
  that is a fence.
- The argument is uniform in `(d, m, p)`, but the claim is fenced to the class.

### Fresh-row test at `(CB(8,110), 588)` — my own literal instruments, built from the contract

**Fidelity first** (`sr3_row.py 110 all` → `row_110.json`):
- **The tree.** Built from the contract's labels as an adjacency list. It passes two independent tests: a BFS for connectivity and a
  parent-tracking DFS for acyclicity, with `|E| = n−1`. `n = 1873`.
- **`α` and `x`.** A generic grouped tree DP gives `α = 991` and `x = 586`, with `x` computed through rank `α`. So `p*` is eligible,
  and parent descent holds.
- **`F_588`.** Derived literally, leaf by leaf, for **all 881 leaves** (`Δ_588(T − t) < 0`). The equality `F_588 = leafSet` also
  follows from explicit automorphisms, which I checked edge by edge, making `C` one orbit.
- **The witness sets.** `W_v = {r}` and `W_{c_ij} = {u_i}`, from degrees.
- **(WID) from two independent sides.**
  - Side 1 is a generic tag-resolving layer DP. At each support it adds `#tags in B − [parent ∉ B]·[the only neighbour in B is a
    tag]`, and it never uses the per-tag decomposition. It was validated against brute force on 9 trees.
  - Side 2 is the aggregate `Σ_{t∈F}[q_t(p) − q_t(p−1)]`, computed from `T − H_t` and `T − R_t`.
  - Result: supply − capacity = `S < 0`, where `S` has 420 digits.
- **Class decomposition.**
  - `|Sec(j)|`, computed literally from `T − N[r] − N[v]`, equals `2^{j−2}C(880, j−2)`.
  - Total supply = `|Sec(589)| + Σ_q C(m,q)·8q·r_q(588−q)`, and total capacity is the same expression at 588. So `ρ_q = W_q(589)/W_q(588)`
    for every `q`.
- **The criterion.** Condition (i) holds **strictly** at every `q = 1..110`. Condition (ii) holds at every `q` and every `α`, checked
  directly and not taken from the scope note.
- **`ρ_1`.** `ρ_1 = 2027991913051965/2036655530990516`, which is `max_q ρ_q`. With `θ = 288/L = 96/809675`, Residual holds with margin
  `(1−ρ_1)/θ ≈ 35.877`.

**The sector part.** S1's intercept table (`adj_alloc_out.json`, `crit_alloc_out.json`) is **not a capsule member**, so I could not
read S1's `pb`/`pc` cells.
- I fixed S1's closed forms from the synthesis face: `θ = 288/L` and `σ(γ) = c_γθ` with `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)`.
- I solved for `pb` and `pc` with my own exact phase-1 simplex on the affine separation (`sr3_alloc.py`, 80 iterations, feasible).
- I then verified Out and In with my own exact min-plus/max-plus DP over **every** state assignment, not through the affine
  relaxation. Results:
  - nonnegativity holds;
  - `min Σ Out = 1` and `max Σ In = 1`, both exactly;
  - Switch holds, tight at `γ = 1..6`;
  - Residual holds.
- The allocation file's SHA-256 is `abce4a92…6b91`.
- This does not re-derive S1's table. SR-1 owns S1. It does show that S1's `σ` and `θ` closed forms admit a feasible exact allocation
  at the fresh row.

**The flow value against the source weight.**
- The composed flow is the criterion flow (`nonsec` supply `Σ_q W_q(589)`, loads `Σ_q ρ_q W_q(588)`, and these are equal) plus the
  scaled sector flow (`|Sec(589)|`).
- Its value equals the **total source weight** exactly: 422 digits, leading digits `68550815117381555571`, SHA-256 of the decimal
  `a57dbeef…8f51`.
- Target feasibility is exact by class:
  - in-sector loads are at most the DP maximum, which is 1;
  - switch images are at most `(ρ_1+θ)γ`, with maximum ratio `1642209871131324850911/1649029067054746042300 ≈ 0.995865`;
  - every other class is as in (3).
- Hence **max-flow = total source weight**. The max-flow can never exceed the supply, and the exhibited flow attains it.
- **Disclosure.** A literal augmenting-path max-flow is infeasible at this row, because `|I_589(T)|` has 421 digits. The per-class
  exactness therefore rests on the reduction proved above. It is corroborated, not replaced, by the literal laboratory below.

**Sampled literal laboratory at the row** (`sr3_lab.py` → `lab_110.json`, 0 failures). All arcs and preimages are enumerated
generically on the adjacency list; the rule is read off the per-choke states.
- **Sources.** 46 sector sources: the exact-DP argmin profile twice, switch-heavy profiles for each `γ`, an all-`c` packing, and 40
  uniform random sources. They have 28,049 literal arcs:
  - every positive-rule arc is literal and lands on a target of weight at least 1;
  - the zero-rule arcs are exactly `D:r`, `D:v`, `S:s` and `S:u(1,0)`, and each lands on weight 0;
  - the literal outflow equals the formula, with minimum exactly 1;
  - 907 switch arcs are used.
- **In-sector targets.** 28 of them: the exact-DP argmax profile twice, 20 random targets and 6 deletion images.
  - Their sector preimages are exactly `2 × #empty legs`, all deletions.
  - The literal load equals `Σ In`, with maximum exactly 1. Scaled loads never exceed unscaled loads.
  - There are **0** `r`-free deletion preimages, and 31,207 `r`-free switch preimages (through `r`). The latter carry 0 because the
    criterion flow is deletion-only.
- **Switch images.** 48 of them, at `γ = 0..7`:
  - the weight is literally `γ`;
  - each is `r`-free with exactly one choke;
  - the sector preimages number exactly `8−γ`, all `u_i`-switches;
  - the load is `(8−γ)σ(γ)`;
  - `ρ_1γ + load ≤ γ`;
  - `γ = 0` images receive 0.
- **Other targets.** 16 of them (two and three chokes, one choke with `s`, `Res`) receive sector load 0.

**Control row** `(CB(8,107), 572)` (`row_107.json`). It reproduces the fixed points of record: `n = 1822`, `α = 964`, `x = 570`,
`θ = 96/766193`, margin 34.90, and `ρ_1 = 5150844596024699/5173467627355748`. The other checks also pass: (WID) from two sides,
`F = leafSet`, and criterion (i) strict and (ii) at every `q`.

### Exhaustive small instances (`sr3_small.py` → `small.json`, `bounded_computation`, sanity only)

**Part A: per-state identities.** On every independent set of `CB(2,3)`, `CB(3,2)`, `CB(4,2)`, `CB(8,1)`, `CB(5,2)` and `CB(2,5)`, at
every rank with a nonempty sector (48 rank rows), with random positive rational `pb`, `pc`, `σ`. Checked:
- Lemma 0 on both layers;
- Out equals the formula;
- every in-sector target's load equals `Σ In` (129,990 targets);
- every switch image has load `(d−γ)σ(γ)` and weight `γ`, with its `d − γ` preimages enumerated literally on a subsample (83,522
  images);
- every other target has load 0;
- every zero-rule arc lands on weight 0.

Result: **0 failures.**

**Part B: an end-to-end literal composition** where the hypotheses genuinely hold (generic `d`, **outside the class**).

Instances: `CB(8,1)/7,8,9`, `CB(7,1)/7,8`, `CB(6,1)/6,7`. At each one:
- `F_p = leafSet` is derived and criterion (i) holds;
- the sector allocation is solved with Residual **tight** (`θ = 1 − ρ_1`) and Switch tight (`(d−γ)σ(γ) = θγ`);
- the criterion flow is built by my own exact integer Dinic max-flow, over deletion arcs with target caps `ρ_q·w`, and it saturates;
- the composed flow is checked arc by arc: every arc is literal, every source is saturated, and every target is within capacity;
- an exact Dinic max-flow on the **whole** literal network equals the total source weight: 2184, 1144, 272, 539, 142, 258 and 76.

At `CB(8,1)/7`, 56 switch images are loaded **exactly** to capacity. That is the shared-capacity inequality at equality, and it holds.

## Findings and repairs

1. **Mathematics: confirmed.** The composition is correct on the class as narrowed by C-U2-T, C-U2-F and the U adjudicator. The
   `8−γ` count replaces U2's single-preimage step, and the in-sector census and In formula are written out. No new gap was found.
2. **Label hygiene, repaired in the registration text.**
   - S3 cites "E1-R's criterion". In the registry, **E1-R labels the heterogeneous key**
     (`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`; see the criterion key's scope note
     (b)). U2 used "E1-R" for the homogeneous key.
   - The registration names the homogeneous criterion key by KEY. The heterogeneous key may replace it at the same grade, because on
     `CB(8,m)` its criterion is exactly condition (i).
   - S3's "r30's 'B7' rational-to-integral principle" conflates two steps. B7 is the flow ⇒ Hall summation, which is elementary and
     has no key. Hall ⇒ integral is the companion on `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`. The text now
     names each step.
3. **Out and In must be defined on the face.** The statement of record says "satisfying Out, In …" without the per-state functions.
   The registration defines `Out(β,γ)` and `In(β,γ)`, with the full-choke convention `In = 0`, and quantifies both over every state
   assignment of total `K` or `K − 1`. The affine separation and LP optimality are not hypotheses.
4. **Condition (ii) as a hypothesis is vacuous but harmless.** It holds identically by `[r30 C4; SR-C4-6]`. It is kept for fidelity
   with the key's criterion and is flagged as identical.
5. **Grade inheritance, made precise.** The implication is `proved_informal`, and its only imported input is the criterion key
   (`proved_informal`). The favorability key's Darroch/Newton dependency does **not** enter the implication. It enters only when a use
   discharges the favorability hypothesis through that key, as the Tier 1 assembly (R-5, SR-5) does. The synthesis sentence "any use
   inherits … the favorability key's Darroch/Newton dependency" is true only of such uses.
6. **The scaling step is dispensable.** The rational engine needs only weak saturation, as C-U2-F noted. It is harmless and is kept
   as written.
7. **Test-row disclosure.** At `m = 110` the sector part uses my own exact allocation built on S1's `σ` and `θ` closed forms, because
   S1's intercept table is outside my capsule. The max-flow value is certified exactly by the exhibited flow, because an
   augmenting-path max-flow at 421-digit layer size is infeasible. Genuine exact whole-network max-flows are run only on the small
   instances of Part B.
8. **SR-3b, the key name.** The proposed name contains the working label **`E1`**. The brief forbids working labels, including
   `E1-R`, in key names, and `E1` is itself a registered alias string of the criterion key. **Repaired** by replacing `E1` with
   `MARK-CLONE-CRITERION`.
   - With that change the name is a true predicate of the statement: sector certificate, mark-clone criterion and all leaves
     favorable, together implying weighted Hall at `p*` on the class.
   - Neither the original nor the repaired name is present in either registry. Neither hits any alias string or `alias_pattern`,
     tested on the name and on my statement probe. The nearest lexical neighbour is the row key, at Jaccard 0.341 for the repaired
     name and 0.359 for the original.
   - My own check; the controller's pre-screen is not my verdict.
9. **Mathematical overlap, not an alias.**
   - The certificate paragraphs of `…CB-8-M-95-TO-107…` and `…FIVE-CB…` contain this argument row by row, at `computer_assisted`
     grade.
   - The criterion key covers the non-sector part only.
   - The new key is the parametric, conditional extraction. I concur with the U adjudicator's ruling, and three distinction rows
     follow.
   - The only shared `(T, p)` is `(CB(8,107), 572)`. There the registered row certificate discharges what the new key assumes.
10. **Fences checked.**
    - One rank, the class only.
    - No status transfer: (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN, and `E993-TREE-REAL-ROOTED` stays
      REFUTED.
    - No refuted mechanism is revived, and no census value is used as proof.
    - The `θ*` law is not a hypothesis.
    - A struck item (U2's Lemma 3 reasoning, U2's `m = 1` switch claim) is never used as evidence.

## Registration text

```text
KEY: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let m >= 107 be an integer with m ≡ 2 (mod 3), let T = CB(8,m) (the path r - s - v; m chokes u_1..u_m adjacent to r; 8 supports b_i1..b_i8 adjacent to each u_i; one private leaf c_ij adjacent to each b_ij; n = 17m + 3; leafSet(T) = {v} ∪ C with C the 8m private leaves), p* = (16m + 4)/3 and K = p* − 1. For a sector source B ∈ I_{p*+1}(T) with r, v ∈ B (so s and every u_i are absent and B is r, v and K leg vertices) or an in-sector target A ∈ I_{p*}(T) with r, v ∈ A (K − 1 leg vertices), the state of choke i is (β_i, γ_i) = (number of b_ij present, number of c_ij present), β_i + γ_i <= 8. Suppose (a) every leaf of T is favorable at p*, that is F_{p*}(T) = leafSet(T) (Δ_{p*}(T − t) < 0 for every leaf t, on the original tree); (b) the criterion of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds at (8, m, p*): condition (i) r_q(p* − q) <= r_q(p* − q − 1) for every q ∈ [1, m], with r_q(k) = [y^k](1 + y)^{8q−1}(1 + 2y)^{8(m−q)+1} and p* − q computed in the integers, and condition (ii), which holds identically by that key's scope note [r30 C4; SR-C4-6]; (c) nonnegative rationals pb(β,γ) (β >= 1), pc(β,γ) (γ >= 1) for β + γ <= 8, σ(γ) for 1 <= γ <= 7, and θ satisfy, with Out(β,γ) := β·pb(β,γ) + γ·pc(β,γ) + [β = 1 and γ >= 1]·σ(γ) and In(β,γ) := (8 − β − γ)·(pb(β+1,γ) + pc(β,γ+1)) for β + γ <= 7 and In(β,γ) := 0 for β + γ = 8: Out, Σ_i Out(β_i,γ_i) >= 1 for every assignment of states to the m chokes with Σ_i (β_i + γ_i) = K; In, Σ_i In(β_i,γ_i) <= 1 for every assignment with Σ_i (β_i + γ_i) = K − 1; Switch, (8 − γ)·σ(γ) <= θ·γ for γ = 1..7; Residual, θ <= 1 − ρ_1 with ρ_1 := r_1(p* − 1)/r_1(p* − 2). Then the literal active-tag weighted network at (T, F_{p*}(T), p*) (sources I_{p*+1}(T) with supply w_F, targets I_{p*}(T) with capacity w_F, arcs the relation (D) ∪ (S)) carries a nonnegative rational flow, supported on literal arcs, that saturates every source and loads every target at most its capacity; summing it over any X ⊆ I_{p*+1}(T) gives (HALL-COND) for every X, and an integral saturating flow exists: (HALL) holds at (T, p*). The flow: on every non-sector source, the deletion-arc flow of the criterion key, which loads each r-free target with q >= 1 chokes at exactly ρ_q·w_F(A) <= w_F(A) and every other target at 0; on every sector source, pb(β_i,γ_i) on each deletion of a b-leg and pc(β_i,γ_i) on each deletion of a c-leg at a choke in state (β_i,γ_i), σ(γ_i) on the switch inserting u_i at a choke in state (1, γ_i) with γ_i >= 1, and 0 on the deletions of r and of v, on the switch at s and on the switches at chokes in state (1, 0), all scaled by 1/Σ_i Out(β_i,γ_i) <= 1. Every positive sector arc is literal and its targets are distinct; the sector preimages of an in-sector target are exactly A ∪ {b_ij} and A ∪ {c_ij} over its empty legs, so its load is at most Σ_i In(β_i,γ_i) <= 1 and it receives nothing from the deletion-only criterion flow; a u_i-switch image of weight γ ∈ [1, 7] (r-free, exactly one choke, no b-leg at it, v present) has exactly 8 − γ sector preimages, each loading σ(γ), and receives ρ_1·γ from the criterion flow, so its total is at most (ρ_1 + θ)·γ <= γ; every other target receives no sector flow. The condition is sufficient, not necessary.
SCOPE: The r31 class only: CB(8,m) with m >= 107 and m ≡ 2 (mod 3), at the single rank p* = (16m + 4)/3 per tree; nothing is claimed at other ranks, at m ≡ 0 or 1 (mod 3), at m < 107, for d ≠ 8, for heterogeneous CB patterns or for arbitrary trees (the argument is uniform in (d, m, p), the claim is fenced to the class). An implication: hypotheses (a), (b) and (c) are assumed, and nothing here discharges any of them; no row is certified by this key. Imported input at its grade: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (proved_informal; its hypothesis C ⊆ F is supplied by (a)); E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL specializes to it on CB(8,m), where its criterion is exactly condition (i), and may replace it at the same grade. The step from the rational flow to (HALL-COND) is summation over X (elementary, no key); the step from (HALL-COND) to an integral saturating flow is the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (formally_verified award; a companion carries no certificate of its own), or finite max-flow integrality. Where C ⊆ F enters: the criterion key's hypothesis, and the capacity w_F = γ of each u_i-switch image, the only targets that receive flow from both parts; v ∈ F gives every sector source and in-sector target weight exactly 1. ρ_1 = max_q ρ_q is not used. No Darroch, Newton, asymptotic step, cutoff M_0 or census value enters; the ℕ-subtractions K = p* − 1, K − 1, 8 − γ (γ <= 7), 8 − β − γ (β + γ <= 8), p* − q and p* − q − 1 (q <= m) are all in range. Grade proved_informal, the implication's only imported input being the criterion key (proved_informal); a use of this key at a row inherits the grades of whatever discharges its hypotheses: (a) through E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3 carries that key's Darroch/Newton dependency, and (b), (c) carry the grades of their own proofs. Checks (bounded_computation; sanity only, never evidence of the universal statement): the per-state identities (Out, In, the 8 − γ preimage count, the zero-flow sector arcs, the target classes) literally on every independent set of small CB trees at every rank with a nonempty sector, with random positive rational parameters (C-U2-T; C-U2-F; the r31 Cycle 1 U adjudicator; SR-3), 0 failures; sampled literal laboratories on CB(8,107)/572, CB(8,110)/588 and CB(8,113)/604 (C-U2-F) and on CB(8,110)/588 (SR-3, record R31-C1-SR-3-CB8-110-RANK-588-COMPOSITION-TEST); end-to-end literal composed flows with tight Residual and whole-network exact max-flows at CB(8,1)/7..9, CB(7,1)/7..8 and CB(6,1)/6..7, outside the class (SR-3).
ATTRIBUTION: Origin: r31 Cycle 1 seat U2 (Claude Sonnet 5; the class-uniform composition with its hypotheses as black boxes, the target-class case analysis, and the text of the rational-flow engine weightedHall_of_saturatingFlowQ, compiled in scratch, no grade). Repairs: critics C-U2-T and C-U2-F (Claude Opus 5.5; the written-out in-sector preimage census and In formula, the 8 − γ preimage count of a switch image in place of the single-preimage step, the criterion's condition (ii) and its scope note, the quantified allocation hypotheses, "sufficient" in place of "exactly", the class scope, and the compiled rational-flow-to-integral-flow chain over byte-identical carried definitions, scratch, no grade); the r31 Cycle 1 U adjudicator (Claude Opus 5.5; the narrowed statement, the ruling that this is the row-free extraction of the r30 row-key certificate paragraph and not an alias, and the scratch CB wrapper cb8_flowConjunct_of_rationalFlow, no grade); the r31 Cycle 1 synthesis (Claude Opus 5.5). Provenance (r30, as registered): the composition argument and the structural fidelity argument on the faces of E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (r30 T2, Claude Sonnet 5; C-T2-F and C-T2-U, Claude Opus 5.5, the structural fidelity argument and the corrected composition direction; SR-C6-2, Claude Opus 5.5); the choke-local sector certificate method (C-T1-U, Claude Opus 5.5, r30 Cycle 4; its r30 Cycle 5 T2 generalization, Claude Sonnet 5); the criterion key's authors as on its face (C-T1-F, C-T1-U, the r30 Cycle 3 T adjudicator, T1, SR-C3-3; the type-path note SR-C4-6); the authors of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE as on its face. Codex (GPT-6 Astra/Sol/Luna): the transport network, the active-tag weight, the relation (D) ∪ (S), (HALL) and the CB family (the lower-region run and its corrections); the first-interior run (Codex) and r24–r26 for the definition layer. Isolated second read SR-3 (Claude Opus 5.5; own derivation, own literal instruments, the fresh-row test at CB(8,110)/588, the name repair).
FENCES: Not (HALL) at full scope: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN, and this key asserts no instance of (HALL) and certifies no row of the class by itself. No status transfer: E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993 stay OPEN (FLOW ⇒ SIGN acts only on rows where every hypothesis is discharged, and then only on those rows). One rank per tree; the class only. Not a deletion-only claim and not E993-R23-LITERAL-DELETE-ONLY-HALL: the root-plus-arm sector is deletion-deficient by the factor p*/(p* − 1) and switch arcs carry load. No refuted mechanism is revived: literal (D) ∪ (S), literal w_F, the fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination; not the m-independent per-choke certificate; no Darroch or Newton on I(CB), G or G^m; E993-TREE-REAL-ROOTED stays REFUTED. The θ* law 288/(200m² + 82m + 5) is a conjecture record and not a hypothesis; LP optimality and the affine separation are not hypotheses (Out and In are quantified over every state assignment). Not an alias, edit, extension or upgrade of E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS or the criterion key, whose sealed statements are unchanged (distinction rows). Compiled scratch declarations (weightedHall_of_saturatingFlowQ, exists_saturatingFlow_of_saturatingFlowQ, cb8_flowConjunct_of_rationalFlow) have no grade until a governed award closes. Nothing here is a cut or refutes anything. No RTree or governed-model assertion.
ALIASES: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-E1-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107; E993-R31-SECTOR-CERTIFICATE-COMPOSITION-REDUCES-WEIGHTED-HALL-TO-SECTOR-ALLOCATION-AND-MARK-CLONE-CRITERION; E993-R31-CB8-TOP-RANK-MARK-CLONE-CRITERION-AND-CHOKE-LOCAL-SECTOR-ALLOCATION-WITH-SWITCH-RESIDUAL-CAPACITY-IMPLY-WEIGHTED-HALL; r31 C1 S3; r31 C1 R-2; sector-certificate composition lemma; SECTOR-CERTIFICATE-COMPOSITION-REDUCTION
```

```text
DISTINCTION ROW: R31-C1-SECTOR-CERTIFICATE-COMPOSITION-VS-CB8-M-95-TO-107-ROW-KEY
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key is an unconditional finite certificate (computer_assisted) of (HALL) at the five named rows (CB(8,m), (16m+4)/3), m ∈ {95, 98, 101, 104, 107}, each with its own exact criterion check at every q and its own per-state table; its certificate paragraph applies this composition argument row by row. The new key is a parametric implication (proved_informal) on the class m >= 107, m ≡ 2 (mod 3): the row data become hypotheses and no row is certified by it. The only shared (T, p) is (CB(8,107), 572), where the registered key's certificate discharges what the new key assumes; the new key neither replaces nor upgrades that row certificate, and the registered key asserts nothing for m > 107. Not an alias (the r31 Cycle 1 U adjudicator's ruling, confirmed by SR-3); the argument's r30 attribution travels on the new key's face.
```

```text
DISTINCTION ROW: R31-C1-SECTOR-CERTIFICATE-COMPOSITION-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key certifies (HALL) (computer_assisted) at (CB(8,86), 460), (CB(8,89), 476), (CB(8,92), 492), (CB(8,108), 577) and (CB(7,144), 673) by the same composition applied row by row. None of these (T, p) lies in the new key's class: the three CB(8,·) residue-2 rows have m < 107, CB(8,108) has m ≡ 0 (mod 3) and CB(7,144) has d = 7. The new key is a conditional parametric statement on the class; no (T, p) is shared and the sealed statement is unchanged.
```

```text
DISTINCTION ROW: R31-C1-SECTOR-CERTIFICATE-COMPOSITION-VS-MARK-CLONE-CRITERION
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: The registered key concerns only non-sector source families X ⊆ I_{p+1} ∖ sec and deletion arcs; it says nothing about sector sources (r, v ∈ B), where deletion-only saturation fails at p*. The new key consumes it as its non-sector part (at its registered grade, with C ⊆ F supplied by the all-leaves-favorable hypothesis) and adds the sector part (the per-state allocation on deletion and u_i-switch arcs), the shared-capacity inequality (ρ_1 + θ)·γ <= γ at the u_i-switch images and the whole-network conclusion. The shared name tokens (MARK-CLONE-CRITERION, WEIGHTED-HALL) name that input; the registered key's statement, grade and scope notes are unchanged.
```

```text
RECORD: R31-C1-SR-3-CB8-110-RANK-588-COMPOSITION-TEST
CLAIM: At (CB(8,110), 588): n = 1873, α = 991, x = 586 (computed through rank α), p* eligible, parent descent i_587 < i_586; F_588 = leafSet derived literally for all 881 leaves; (WID) supply − capacity = S < 0 (420 digits) from two independent sides (a generic tag-resolving layer DP against the aggregate over T − H_t and T − R_t); the mark-clone criterion condition (i) holds strictly at every q = 1..110 and condition (ii) at every q and α, checked directly; ρ_1 = 2027991913051965/2036655530990516 = max_q ρ_q. With θ = 96/809675 = 288/(200m² + 82m + 5) and σ(γ) = c_γ·θ, c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2), an exact simplex gives nonnegative pb, pc with minimum Σ Out exactly 1 and maximum Σ In exactly 1 over every state assignment (exact DP); the composed flow's value equals the total source weight (422 digits, leading digits 68550815117381555571), so the max-flow value equals the total source weight; switch-image loads are at most (ρ_1 + θ)·γ (maximum ratio ≈ 0.995865). A sampled literal laboratory (46 sector sources with 28,049 literal arcs, 28 in-sector targets, 48 switch images γ = 0..7, 16 other targets) has 0 failures. The allocation is SR-3's own (the r31 Cycle 1 synthesis's intercept table of record was not in SR-3's capsule); the literal augmenting-path max-flow is infeasible at this size and the value is certified by the exhibited flow.
STATUS: bounded_computation
PROVENANCE: Isolated second read SR-3 (Claude Opus 5.5), own instruments under scratchpad/c1-sr-SR-3/: sr3_row.py (row_110.json 71cbb2a678ca26e3e8a7cee071aa93887a7cf5ce6a6c10cb79b5d5d8b1ec32a1), sr3_alloc.py (alloc_8_110_S1_588.json abce4a9295f6ba22fd4b760ac54d6dd2600e7480d361f9327f89c7e09b8c6b91), sr3_lab.py (lab_110.json 90277ebcf1d3a0e364bbb000a5af55352931cf54db414e22900c98971ac84006); ρ_1(110) agrees with C-U2-F's value.
```

## Verdicts

verdict[SR-3a]: confirmed_with_repairs
verdict[SR-3b]: confirmed_with_repairs

- **SR-3a.** The mathematics is confirmed as narrowed. The repairs are to the face:
  - the key names replace the working labels "E1-R" and "B7";
  - the per-state Out and In functions are defined, with their quantification;
  - condition (ii) is flagged as identical;
  - grade inheritance is stated precisely.

  The fresh row `m = 110` passes. The flow value equals the source weight exactly.
- **SR-3b.** The key is a predicate once `E1` is replaced by `MARK-CLONE-CRITERION`. It is alias-clear in both registries, and three
  distinction rows are given. Grade `proved_informal`, and the r30 attribution travels.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-3/`. Everything
uses the Python standard library only and runs with `python3 -B` in the foreground. Replay by `cd`-ing into the root and running the
command in the Role column.

| File | SHA-256 | Role |
|---|---|---|
| `seal.py` | `80d841ec802956969ee487cec6da13297ecdf5cb004407e81cfa9e46bb9e729a` | Capsule seal and 775 member digests |
| `sr3lib.py` | `b3e7e1b2e0850b5fc053f660d969e92e3fbb89f2175a0a5ce9da49443df79eab` | Literal CB builder from the contract; generic tree tests; grouped independence DP; generic tag-resolving weighted layer DP; `r_q` |
| `t_lib.py` | `abb5a9296d52b1402aff7267bc135254ca92fdce185660e9ffc58bd50072fc78` | Brute-force self-test of the DPs on 9 trees (all pass) |
| `sr3_row.py` | `e3db87bdcca226d3146b8ada8032065ad7290a90719c567407c0b2566cf370bb` | Row fidelity and composed-flow totals. `python3 -B sr3_row.py 110 all` (about 4 min); `python3 -B sr3_row.py 107` (about 12 s) |
| `row_110.json` | `71cbb2a678ca26e3e8a7cee071aa93887a7cf5ce6a6c10cb79b5d5d8b1ec32a1` | Fresh row `CB(8,110)/588`: every check true |
| `row_107.json` | `bdf9f76e41bc48f193aa55828e8fadb3e4f36829198e6516b664afd2d8cdfae2` | Control row `CB(8,107)/572`: fixed points reproduced |
| `sr3_alloc.py` | `e492ab2b4bce9ddacbb25207817bbb09a67877e926473a3fbb28dc10392ebfb2` | Own exact simplex (`pb`, `pc`) with S1's `σ`, `θ` or tight Residual, plus exact DP verification. `python3 -B sr3_alloc.py 110` |
| `alloc_8_110_S1_588.json` | `abce4a9295f6ba22fd4b760ac54d6dd2600e7480d361f9327f89c7e09b8c6b91` | Allocation at `m = 110`: min Out 1, max In 1 |
| `sr3_lab.py` | `70a94c4cbd6f859e6068e0c6ba7c82fead6836c4865f5a88403ad7fceeb2a6c0` | Sampled literal laboratory. `python3 -B sr3_lab.py 110 alloc_8_110_S1_588.json` (about 17 s) |
| `lab_110.json` | `90277ebcf1d3a0e364bbb000a5af55352931cf54db414e22900c98971ac84006` | `ALL_PASS` true, 0 failures |
| `sr3_small.py` | `cc88c18149059352956dccc6d13920c75c079a0a4816f994730783f02eec32f2` | Exhaustive small instances plus end-to-end composition and Dinic max-flows. `python3 -B sr3_small.py` (about 10 min) |
| `small.json` | `fab1994bf8a25bf931ad8e10739dfb94cac16bc74cf2de56baeb068f6947d1e8` | Part A 0 failures; Part B all max-flows equal source weight |
| `alloc_{8_1_residual_7,8_1_residual_8,8_1_residual_9,7_1_residual_7,7_1_residual_8,6_1_residual_6,6_1_residual_7}.json` | `1cddf745…0aa9`, `3806e760…891e`, `ae5ae664…9038`, `4ab7ffd3…0544`, `79f6960b…7ad1`, `4b152362…2097`, `b15edace…e6af` | Tight-Residual allocations used by Part B |
| `sr3_alias.py` | `34d88d63bf6febdf8a56aff9514118256cd2884c9f816d341f9df101a20265e4` | Own alias check against both registries. `python3 -B sr3_alias.py stmt_probe.txt` |
| `stmt_probe.txt` | `046599c7e442098dfca032b2c31fd411d0d0385e184979ae2db0e7b0e9c9d8e5` | Statement probe for the `alias_patterns` regexes |
| `alias.json` | `7866efe70218d79a6e0f8bfc36ca86907dd06279fb072fa9380b4727f004d320` | No exact key match, no alias-string hit, no pattern hit (both names, both registries) |

The only file written outside the scratch root is this `SECOND-READ.md`. No background job was started. A name-scoped `pgrep` before
the final write matched nothing.
