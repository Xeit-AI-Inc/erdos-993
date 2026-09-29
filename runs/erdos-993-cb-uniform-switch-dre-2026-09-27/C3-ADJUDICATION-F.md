# Orientation Adjudication

Stage 5 adjudicator of orientation F (falsify), Cycle 3, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): a
parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank. The portfolio is seats F1
(`C3-F-01`, `FORMAL-STATEMENT-FIDELITY-ADVERSARY`), F2 (`C3-F-02`, `AT-RANK-COMPOSED-FLOW-ADVERSARY`) and F3 (`C3-F-03`,
`E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`), with their six cross-orientation critiques (C-F1-T, C-F1-U, C-F2-T, C-F2-U,
C-F3-T, C-F3-U). Written 2026-09-28 (the clock read 06:41 EDT when drafting began).

**Boot acknowledgment.** I am operating within VerityOS. As the dispatch requires, I booted by reading exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. My first combined
read failed at a zsh `echo =====` separator after `verity.md`, and the tool display cut the middle of `verity.md`. I re-read the
startup protocol in full and the cut section of `verity.md` with `sed`. I loaded no other VerityOS subsystem. I did not follow
the startup protocol's own map into memory, logs, conversations, modules or skills, because the dispatch's restricted boot
governs this seat and the controller owns conversation logging.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch** `control/dispatch/c3-stage5/DISPATCH-ADJ-F.md`: SHA-256
  `446f1fcb357ef0917d49337ea281d0b635f0964755dc2bd7ef2d4493c5e15799`. MATCH with the value I was given, checked before I read it.
- **Capsule seal (reported as required):** `control/c3-adjudicator-capsules/F-PACKET-MANIFEST.json`, recomputed over the
  canonical JSON without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline) =
  **`2f49ae30d85b005a5f364a024d4e2fdc94ebe8b3246858f49caa6ec7d96ebed5`. MATCH.** All **24/24** listed members match on both
  byte count and SHA-256. They are the protocol (`f1f72362…`), both contracts (`7cc0bf43…`, `480ba2dd…`), the allocation
  (`6ef9ce07…`), the gate (`837bdd0d…`), the Stage 2/3/4 manifests, both admissions, both read-boundary records, the controller
  facts (`2ac6e15b…`), `PATH-CHECK-F.json` (`83214504…`, 0 findings), the three returns (`a7fde80e…`, `a31e7580…`,
  `f089f9a8…`), the six critiques (`aed87190…`, `9dee6689…`, `6d625af0…`, `f5b93480…`, `80bb030d…`, `7b861fd0…`) and
  `sources/SOURCE-DIGESTS.json` (`1508f7dd…`).
- **Stage seals** (recomputed canonically):
  - Stage 2 `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` (5,049 members): MATCH. This is the value
    every F return cites.
  - Stage 3 `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` (41 members): MATCH.
  - Stage 4 `a940eb85c4b829c017b154ce6d72acc2346b66d3cb7c1aad3438500798e87d4e` (67 members): MATCH.
  - The critics cite `cc9683b5…` as the Stage 4 *dispatch*-manifest seal. That file is not in my capsule, so I did not
    recompute it.
- **Admissions.** Stage 3 admitted 9/9. The three F returns are listed at the capsule digests, and the three format exceptions
  concern U2 and U3 only. Stage 4 admitted 18/18. All six F critiques are listed at the capsule digests, with verdict
  `retained_narrowed` and `headline_resolved: no`.
- **Route identity.** Each return carries its route ID and mechanism token verbatim, matching `C3-ALLOCATION.md`. The seats
  disclose chartered Sonnet/high with runtime `claude-sonnet-5`. The critics disclose chartered opus/medium with runtime
  `claude-opus-5-5`.
- **Controller facts** `C3-STAGE5-CONTROLLER-FACTS-F.json`. I treated them as facts, never authority. CF3-F-1 is a
  cross-orientation T-critic summary: T1's `clone_fiber_card` is false as stated, (ii-2) is compiled, and "no other switch"
  and target distinctness are compiled. CF3-F-2 refers to CF3-T-1/2 in another orientation's record, which I may not read, so
  I did not use it. Nothing below depends on either fact except where I say so.
- **Replays (copy-out-first into `scratchpad/c3-adj-F/`):**
  - F2's driver reproduced payload `e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f`, and its output file
    `240ca851…659a` is byte-identical to the seat's. The self-test printed `ALL MUTANTS DETECTED`. For what that proves, see
    F2 below.
  - F3's generator reproduced digest `b65c2b0e2695880ca3de8ac38fe780d4e79405ecccf2fec3c90353a9af5639fc`, with output
    `d87071c5…6044`, which equals both critics' replays.
  - I did not re-run F1's scripts. Both F1 critics regenerated `carry_check.out.txt` byte-identically (`323e5ae0…52b3`).
  - For C-F1-T's kernel rebuilds I read the inventoried `lean/*/probe.out` and `build.log` files:
    - all six builds end "Build completed successfully";
    - each terminal prints `depends on axioms: [propext, Classical.choice, Quot.sound]`;
    - the probe digests are `bd1f0114…`, `0ce55557…`, `b6dbf9bb…`, `413989ab…`, `3f7ff883…` and `c5b9edd4…`;
    - the six copied `Main.lean` files hash to the frozen `f0578ed7…`, `a906ec17…`, `c0605e12…`, `986b5257…`, `e75c66b2…`
      and `7dab4388…`.
- **Read-boundary disclosures (mine).**
  1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail address into context before my
     first tool call. I did not act on them, and I created no conversation log.
  2. Outside the capsule I read only authorized material:
     - within `sources/`:
       - non-recursive `ls` of `sources/c1-results/runs/`, `sources/c2-results/runs/`, two award directories, and the C1-LA2
         `SOURCE/` directory;
       - `sed` excerpts of C2-LA1 `FIDELITY-REVIEW.md` (lines 25–28) and `EVIDENCE/INFORMAL-AUDIT.md` (113–118), and of
         C2-LA3 `FIDELITY-REVIEW.md` (25–28) and `FORMALIZER-REPORT.md` (82–84);
       - C1-LA3 `Main.lean` entries 20–21 and C1-LA1 `Main.lean` entry 11;
       - `shasum` of the C1-LA2 carried fragments;
     - the inventoried scratch of F1, F2, F3 and C-F1-T. I ran non-recursive `ls` of `scratchpad/c3-F1/`, `c3-F2/`, `c3-F3/`
       and `c3-crit-F1-T/lean/<award>/`, and read the probe and build tails.
  3. I ran one `find .` inside my own `scratchpad/c3-adj-F/` for the artifact inventory, which is within the grant.
  4. My process checks were `ps -p` on my own literal PIDs only, with no full listing.
  5. I read no other orientation's portfolio or adjudication, no synthesis and no other experiment root. I used no network,
     installed nothing, started no child agent and ran no Lean or lake command.

## Route-by-route decisions

### F1 — `C3-F-01` `FORMAL-STATEMENT-FIDELITY-ADVERSARY`: **retained_narrowed**; grade `bounded_evidence` (an audit, no mathematical claim)

**What stands.** There is no statement-fidelity violation in the six Cycle 1/2 governed terminals (C1-LA1..3, C2-LA1..3):
- the index of record at `p*` is correct, including C2-LA2's and C2-LA3's forward difference at `p*` (ruling 16);
- `G` and `G_c` are the contract's, with no swapped `(1+X)`/`(1+2X)`;
- `107 ≤ m` and `m % 3 = 2` are on every face;
- no hypothesis smuggles in its conclusion (C1-LA2's `hE`/`hH` are conjuncts 2 and 4 verbatim, openly a reduction);
- the link targets are literally `C5LA1.indepSetCount`/`C4LA1.vertexDeletionIndepSetCount` of `cbGraph m`;
- exactly three rekeys occur, each the sanctioned `theorem → lemma` edit.

Both critics confirmed this with stronger instruments: origin-bound carries, `expected_statement` equality, receipts and
axiom logs, a literal `cbGraph` transcription, and (C-F1-T) six kernel rebuilds. I weight those replays above the return's
self-report.

**Claim by claim** (T = C-F1-T, U = C-F1-U):

| Claim | T | U | Ruling |
|---|---|---|---|
| "claimed content hash agrees" | narrowed: the check is header-to-header across files; 799/799 headers = body hash | narrowed: same; marker = body = Snippet = receipt entry | **Narrowed** (agreement). Held on the return's own evidence only as cross-file agreement; now established by both critics. |
| "126 exact byte-identical carries" | backed as counts; true carries are origin-bound | narrowed: 126 counts *names*; true carries are 214 + 3 rekeys | **Narrowed** (U's wording). The critics' "218 carried fragments" (T) and "214 + 3" (U) **reconcile**: C1-LA2's `SOURCE/` holds the first-interior `crossingIndex` fragment twice with identical content (`378868ab…`, in `carried-c6-la2/0035-…` and `first-interior-0014-…`). That makes 218 files and 217 distinct carries (my check). |
| R31-N-15 reversibility record "not located … outside this seat's read scope" | closed: C2-LA1 `INFORMAL-AUDIT.md` lines 115–117; C2-LA3 `FORMALIZER-REPORT.md` line 83 | **struck**: the records are in authorized `sources/` (also `FIDELITY-REVIEW.md` line 27 of both) | **Struck as to scope; obligation closed (critic-attributed).** I verified all four locations. C2-LA1 `FIDELITY-REVIEW.md` line 27 and `EVIDENCE/INFORMAL-AUDIT.md` lines 115–117 record entries 57/105, and C2-LA3 `FIDELITY-REVIEW.md` line 27 and `FORMALIZER-REPORT.md` line 83 record entry 60. Each reversal reproduces the origin bytes. F1's own disclosure 4 places `sources/` within its grant. |
| C1-LA1 "`hm` enters only through arithmetic identities … inside the closed proof" | struck (unbacked; F1 read no proof bodies) | struck (unbacked) | **Struck** (agreement). |
| ℕ-subtraction list "all checked safe" | narrowed: omits `8m−7` and `k−i` (both safe) | not raised | **Narrowed** per T. No conflict. |
| C1-LA3 "`hj, hjm` bound the ℕ-subtractions" | "loose but correct" | narrowed: `hj : 5 ≤ j` is a *gap* hypothesis and load-bearing | **Narrowed** per U. My replay (`own/adj_block.py`): the block descent at index `p*−2−j` **fails at `j = 0, 1, 2` and holds at `j = 3, 4, …`** at `m = 107, 125, 140`. `hjm` guards `m − j`. |
| "`107 ≤ m` present" as a load-bearing item | C2-LA2 `hm` unused (award contract; linter) | same; also in C2-LA3's carry and C2-LA1 `cb8_term_eq`'s `hj` | **Recorded (agreement).** An unused scoping hypothesis restricts to the class and is not a fidelity break. |
| Cycle 3 T/U statements not audited | carries forward | carries forward | **Open obligation (agreement)**. See `## Next-route allocation`. |

Critic-derived advances (critic-attributed, audit-grade):
- (T) a carry and receipt audit over 799 entries, bound to origins;
- (T) independent kernel rebuilds and `#print axioms` of all six terminals, which I inspected;
- (T, U) verbatim `expected_statement` equality, 6/6;
- (U) the finding that the ruling-16 off-by-one is **numerically invisible at class rows**, since `i_{p*}(T−w) < i_{p*−1}(T−w)` also holds there. F2's non-evidence diagnostic independently shows the same.

The instrument rule follows: a favorability claim must cite its index textually.

### F2 — `C3-F-02` `AT-RANK-COMPOSED-FLOW-ADVERSARY`: **retained_narrowed**; grade `bounded_computation` (retitle required)

**What stands.** These results are replayed byte-identically, and independently confirmed by both critics with their own code
and labellings, at `m ∈ {107,110,113,116,119,122}` (controls) and `{125,128,140}` (fresh, ruling 17):
- the tree;
- `I(T)` equal to the closed form;
- `x = p* − 2` scanned through `α`;
- eligibility and parent descent (a);
- `F_{p*} = leafSet` at the ruling-16 index;
- `S(T,p*) < 0`;
- the C1-LA1 table entered faithfully (79/79 cells) with Switch, Residual, `min ΣOut = 1` and `max ΣIn = 1`;
- the named profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` with `ΣIn = 1`.

The C1-LA1 facts duplicate a formally verified theorem and add no grade (U, A2). The critics also reproduce the §5 fixed
points at `m = 107`.

**Claim by claim** (T = C-F2-T, U = C-F2-U):

| Claim | T | U | Ruling |
|---|---|---|---|
| "supply − capacity = S … from three independent sides" | **struck**: all three sides are the aggregate half; no source side | **struck as stated**: the supply half has a weight-side check; the capacity half has none | **Struck as stated; U's reading is the exact one.** I read `f2_composed_flow.py` lines 118–127: `criterion_part = Σ_q 8q·C(m,q)·r_q(p*−q)` plus `sector_part = 2^K C(8m,K)` is a *class-formula* weight count, but at rank `p*+1` only. `capacity` at `p*` is aggregate-only. F2 did not validate the class formula against literal `w_F`. **(WID) is re-established from independent sides by both critics:** T used a literal-weight tree DP validated by brute force (10 rows, incl. `m = 302`), and U used a class decomposition validated by brute force (9 rows). No downstream number changes. |
| "end-to-end composed flow … on the literal network"; record title `…END-TO-END-COMPOSED-FLOW` | **struck**: no E1 arc value, no target inflow, no Hall sum | **struck**: no literal arc touched; template plus aggregate | **Struck (agreement).** Retitle `R31-C3-F2-CB8-NINE-ROW-INPUT-AND-TEMPLATE-CONSISTENCY` (U's form; T's `…TEMPLATE-AND-AGGREGATE-BATTERY` is equivalent), at `bounded_computation`. |
| mutant self-test "confirms the checks in `f2_composed_flow.py` are live" | **struck**: mutants 1–4 recompute on hand constants; 4 is a tautology | "live, but it tests only F2's own checks" | **Struck (T upheld on my read of `f2_selftest.py`).** Mutants 1, 3 and 4 are arithmetic tautologies on hand-set constants (`θ_bad = 2(1−ρ_1)+1`; `σ_bad = 10^6 θ`; swapped `n_1/n_2`). Mutant 2 computes `pb` directly, although the driver never checks `pb`. Only mutant 5 compares a DP with a closed form, and it does so inside the self-test, not through the driver's `assert`. No mutant exercises the driver. |
| "Δ_v(digits) 21d/22d" | **struck**: 408–534 digits | not raised | **Struck** (verified in the replayed JSON: `delta_v` at `m = 107` has 409 characters with the sign, i.e. 408 digits). |
| "S digits 411…537" | struck: these are supply digits | mislabel | **Struck/relabelled** (agreement; the driver writes `len(str(supply))`). |
| "the C1-LA1 allocation is nonnegative" | struck as F2's certification (only `Out, In ≥ 0` checked) | misattached | **Narrowed (agreement)**: arc values `pb, pc, σ ≥ 0` are formal in C1-LA1 and critic-checked at 10 and 13 rows. |
| "every switch-image's combined load ≤ capacity" | narrowed to the template inequality plus the carried E1 load | template-level only | **Narrowed (agreement)**. See `## Cross-route reconciliation` for the per-target composition now available informally. |
| R.O. 2 "per-target bound implies summed Hall"; "X = weight-γ switch images" | category error (images are targets) | **struck**: capacity bounds alone imply nothing | **Both struck.** The correct form is "a saturating flow implies (HALL-COND) by summation", and the intended family is `X = Sec`. |
| "S < 0 … the deficit the switch mechanism exists to repair" | inverted: `S < 0` is aggregate capacity surplus | not raised | **Wording struck** per T. The sector's local shortfall is `R_K − R_{K−1} = R_{K−1}/K`. |
| rows 116/119/122/140 "first end-to-end pass"; SR-C2-5 agreement | not audited | not audited | **Unverified** within both capsules and mine; given the retitle, moot. |

**Critic-derived advances (critic-attributed; each STATED, isolated second read owed):**
- **C-F2-T Lemma HX** and **C-F2-U (ii)(d) θ_Hall floor** (in `## Established results`).
- The **literal sector bridge**, backed by both critics as bounded evidence (fence 4):
  - exhaustively on literal `CB(8,2)`/`CB(8,3)` (T: 4480/29120/16192 sources; U: 139,776/170,016);
  - by sampling at rank `p*` on literal `CB(8,m)`, `m = 125, 128, 140` (T). There the named profile's literal scaled inflow
    is exactly 1, and the images' combined load is at most `0.99673γ`.

  T also wrote the bridge as a proof paragraph, which I read and found complete. It is still informal: the U1/T3 formal
  object.
- **Whole-family `X = Sec`** residual `Λ = (1−ρ_1)·W_img/(R_K − R_{K−1})`:
  - T and U agree to four digits: 41.46 (107), 48.43 (125), 49.59 (128), 54.24 (140);
  - my own instrument reproduces all four and gives 387.56 at `m = 1001`.

### F3 — `C3-F-03` `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`: **retained_narrowed**; grade `bounded_evidence`

**What stands.**
- The only configuration where X-8's row identity can fail (`α = β = 0`) forces `j = p − q = 0`.
- Since `p* − m = (13m+4)/3 ≥ 465` on the class, it never occurs at `p*`. This is proved in one line and is exact for every
  class `m`; both critics agree.
- Test A (`G_0 = 0`, `H_0 = S_0`) holds identically.
- At `β = 0`, `α ≥ 1`, the tag arcs carry the row.
- At `q = m`, `b = 1`, `β ∈ {0,1}`.
- The zero-weight classification (an `r`-free `B` has `w = #{c_ij ∈ B : u_i ∈ B}`, and `v` is inactive without `r`) holds.
- `cb8R1(m,·) = r_1(m,·)`, a Cauchy product.

**Claim by claim** (T = C-F3-T, U = C-F3-U):

| Claim | T | U | Ruling |
|---|---|---|---|
| Tests F/G as "literal" network evidence; Witness 1 "literal (not merely closed-form) confirmation" | **struck**: `Fset = set(leaves)` is stipulated; no derived selector, no (WID); instances ineligible; `F_p(CB(8,1)) = ∅` at `p = 1..5`, `F_p(CB(8,2)) = ∅` at `p = 1..4` | **struck**: the same, giving `F_p(CB(8,2)) = ∅` at `p = 1..5` | **Struck (agreement); valid only as tests of X-8 under its hypothesis `C ⊆ F`.** Confirmed at line 288/387 (`Fset = set(leaves)`). The apparent range disagreement is only partial coverage: my derived selector (`own/adj_selector.py`, ruling-16 index) gives `F_p(CB(8,1)) = ∅` for `p = 1..5` and `F_p(CB(8,2)) = ∅` for **`p = 1..10`**, with `F_11 = {v}` and `F_p ⊇ C` only from `p = 12`. Both critics' statements are true subsets. Neither instance has an eligible rank (`x = 6, α = 10`; `x = 12, α = 19`). |
| Test C "a genuine defect of X-8's construction in principle" | replaced: outside X-8's domain (`ρ_q` undefined; condition (i) reads `1 ≤ 0` at `p = q`) | same; the corner is manufactured by the seat's guard `ρ = 0 if r(j−1) = 0` | **Replaced (agreement)** by "domain boundary `j = 0`". It is not a template failure at any class row and **not a cut**. |
| "REFUTED: `β = 0 ⟹ H_α = 0`" | (proves the `j ≥ 1` statement; the label is not addressed) | **struck as over-broad**: true for every `α ≥ 1`; undefined at `j = 0` | **U upheld.** The only "counterexamples" have `j = α = 0`, which lie outside X-8's domain. The record reads "holds for `j ≥ 1`; undefined at `j = 0`". "`q = m ⟹ β = 0`" stays REFUTED (the arm slot holds `s` or `v`, and both critics correct "vertex `s`" to "the arm"). |
| shipped summary `out_identity_holds_for_al_ge_1: false` | inverted flag (`all(f[2] != 0 …)`); the math is backed by `all_failures_are_al_equal_0: true` | same, undisclosed by the seat | **Defect confirmed** in my replay (`claim_holds_for_al_ge_1: False`; 105 failures, all `α = j = 0`). The record must be corrected, and the prose claim reworded "4,480 checks, 105 failures, all at `α = j = 0`". |
| "0 unexplained `α = 0` nonzero-active-arc events" | not raised | **struck (vacuous)**: line 337 hard-codes `if al >= 1 else Fr(0)` | **Struck** (verified at line 337). |
| Test E "definitional unfolding", "`unfold`-level"; entries 29–30 "the two pieces" | struck (a `coeff_mul` bridge, not `unfold`); entries 29–30 contain no `Polynomial` | same | **Struck (agreement).** The ℤ[X] identity is true (Cauchy product), backed by independent convolution (U, P3; T, 9 rows). F3's own comparison is tautological. |
| Test D "S, T, G, H nonnegative on `0..a` at every row" | narrowed to `q = m` | narrowed; `ρ_m < ρ_1` compares two of `m` ratios | **Narrowed (agreement).** All `q` are now covered by three instruments (below). |
| R.O. 4 "X-8 sound … for the entire class" | unbacked on the return; backed by (R1)–(R3) | unbacked; backed by A1 | **Unbacked on the return; now backed informally, critic-attributed** (see E-1). |
| `cycles/cycle-3/stage2/ROUTE-STATE.md` "not a sealed-packet member" | inaccurate: it is a Stage 2 member | not checked | **T upheld**: listed in the Stage 2 manifest at `32dd0e1e…`. |
| Condition (i) / `ρ_q ≤ 1` for the adapter | available formally as "C1-LA3 entry 20 in ℤ[X] form" | "carried threshold key …; a Darroch-free formal proof is still owed" | **T upheld; U's "formal proof owed" is struck as to condition (i) itself.** I read C1-LA3 entry 20 (`E993Transport.cb8_E1_conditionI_topRank`, marker `8da112b4…`). It states, for `107 ≤ m`, `m % 3 = 2` and `1 ≤ q ≤ m`, the **strict** `((1+X)^(8q−1)(1+2X)^(8(m−q)+1) : ℤ[X]).coeff ((16m+4)/3 − q) < … .coeff ((16m+4)/3 − q − 1)`. That is condition (i) at `p*` for every `q`, closed via `twoBinom_coeff_strictAnti_of_gap` (Darroch/Newton-free) inside the formally verified C1-LA3. What remains owed is only the **coefficient bridge** from that ℤ[X] form to the ℚ ratio `ρ_q` the flow uses (see `## Lean readiness`, G-F-B). |

## Cross-route reconciliation

1. **One fidelity failure pattern across F2 and F3 (ruling 18).** F2 half-asserted (WID). F3 stipulated `F = leafSet`,
   asserted no (WID), and reported only ineligible instances. F1's textual method had no such failure. Every critic caught
   its seat's instance, and the four critics of F2/F3 each re-established the fact with a derived selector and an independent
   (WID) side. No reported number changes. What changes is what the evidence certifies.
2. **F2's composition level and F3's arc level now meet (informally).** Take three inputs:
   - the X-8 per-target E1 load, exactly `ρ_q·w_F(A)` on every `r`-free target with `q ≥ 1` and 0 elsewhere (E-1 below);
   - the literal sector bridge (in-sector inflow `Σ_i In(β_i,γ_i)`; image inflow `(8−γ)σ(γ)`; 0 on every other target;
     C-F2-T's proof paragraph, bounded by both F2 critics);
   - C1-LA1's Switch and Residual (formal).

   Then every target's combined load is at most its weight: in-sector targets `≤ 1`; switch images
   `ρ_1γ + (8−γ)σ(γ) ≤ ρ_1γ + θγ ≤ γ`; one-choke non-images and `q ≥ 2` targets `ρ_q w ≤ w` (C1-LA3 entry 20); weight-0 targets
   and `r`-containing targets outside the in-sector layer receive 0 (sector flow lands only on in-sector targets and switch
   images; E1 flow only on `r`-free targets). This is the registered composition key's content restated at arc level. It adds no
   new status, but it removes the "E1 per-target load carried, not verified at arc level" caveat that both F2 critics raised
   (T, A2; U, R.O. 2). It does so at `proved_informal` STATED, pending a second read.
3. **`ρ_q` over all `q`: three agreeing instruments.** C-F3-T, C-F3-U and my own `own/adj_x8.py` each find condition (i)
   strict for every `q ∈ [1,m]` at the nine rows, with `argmax_q ρ_q = 1`. My `max_{q≥2} ρ_q` values (0.993883 at 107 …
   0.995322 at 140) equal C-F2-T's table column and C-F2-U's value at 107. The universal statement is C1-LA3 entry 20, which
   is formal.
4. **Whole-family numbers: three agreeing instruments.** C-F2-T, C-F2-U and mine agree on `Λ` at 107/125/128/140. C-F2-U
   and mine agree on `θ/θ_Hall`:
   - U reports 1.1879–1.1891 over 13 rows;
   - I get 1.18794–1.18915 over all 332 class rows `107 ≤ m ≤ 1100`;
   - `θ_Hall(107) = 36132547728/342577655754191` is identical.

   T's "0.8758 of total switch capacity used" is a different quantity, `(R_K − ΣIn)/Σ_img (8−γ)σ(γ)` with actual `σ`. It is
   consistent with U's floor, because `(8−γ)σ(γ) ≤ θγ`.
5. **Ruling-16 invisibility.** F2's diagnostic and C-F1-U's A5 each found, independently, that both indices give negative
   differences at every class row. Favorability evidence therefore needs the index cited textually. A sign test is never
   enough.

## Established results

Grades follow SOLUTION-CONTRACT §4. The Cycle 3 F seats authored **no** compiled Lean. Every "STATED" item was first made at
Stage 4 and needs an isolated second read before registration. My own read (below) is an adjudicator's check, not that
second read.

**Exact theorems (critic-attributed, `proved_informal` STATED).**
- **E-1 (X-8 exactness on every class; C-F3-T (R1)–(R4) and C-F3-U A1, derived independently by the two critics).**
  - *Setting.* For integers `a, b ≥ 0` and `j ≥ 1` with `r(j−1) > 0` (i.e. `j − 1 ≤ a + b`), put
    `S_α = C(a,α)C(b,j−α)2^{j−α}` and `T_α = C(a,α)C(b,j−1−α)2^{j−1−α}` (zero outside range), `ρ = ΣS/ΣT`, `Sc, Tc` the strict
    prefix sums, `G_α = ρTc(α) − Sc(α)` and `H_α = Sc(α) + S_α − ρTc(α)`. Then:
    - (row) `G_α + H_α = S_α`;
    - (in-balance) `G_{α+1} + H_α = ρT_α` for `α < a`, and `H_a = ρT_a`;
    - (per-target load from the literal arc counts `a − α'` and `2(b − β_A)`) the inflow is exactly `ρ·(α'+1)`, including
      the degenerate `β_A = b` case;
    - (`β = 0` boundary) `G_j = S_j`, `H_j = 0`;
    - (nonnegativity) `G_α, H_α ≥ 0`, termwise from log-concavity of single binomial rows. This is elementary, and it is not
      Newton, Darroch or the REFUTED (G′).
  - *Consequence on `CB(8,m)` at `p*`, `m ≥ 107`, `m ≡ 2 (mod 3)`.* Given `C ⊆ F_{p*}` (C2-LA3, formal), the X-8 values form
    a nonnegative flow on literal (D) arcs. It saturates every `r`-free positive-weight source (all such have
    `j = p* − q ≥ (13m+4)/3`). It loads every `r`-free `q ≥ 1` target at exactly `ρ_q·w_F(A)` and every other target at 0.
  - *My check.* I followed both proofs line by line and re-derived the `G` identity `R_T·G_α = Σ_{k<α≤i}(S_iT_k − T_iS_k)`
    and its sign. My independent exact instrument `own/adj_x8.py` runs every `a, b ≤ 18` and every `j ≥ 1`: 6,859 triples,
    0 failures of row, in-balance, top, per-target load (from literal arc counts), `β = 0` and nonnegativity. At the nine
    rows, every `q` and every `α` give 0 negative `G`/`H` and `ρ_q < 1`, with payload `f2a6ceb0…3e53`.
  - *Novelty.* Items (row), (in-balance) and (nonnegativity) re-derive X-8/X-9 of record, a Cycle 2 STATED item. New are
    the exact domain `j ≥ 1`, the boundary closures, and the zero-weight column.
- **E-2 (Lemma HX; C-F2-T).**
  - *Statement.* For `m ≥ 107`, `m ≡ 2 (mod 3)`, `K = p* − 1`, `X = Sec ∪ P_1` (`P_1` = `r`-free one-choke sources):
    `Σ_{N(X)} w_F − Σ_X w_F ≥ 8m(r_1(K−1) − r_1(K)) − R_{K−1}/K ≥ 2.51·R_{K−1}/K > 0`, with explicit `M_0 = 107` and no
    asymptotic step.
  - *Inputs.* C1-LA1 Residual (formal), `F_{p*} = leafSet` (C2-LA3, formal) and literal counting. It uses **no** E1 input.
  - *My check.*
    - Step 5's likelihood-ratio argument: I confirmed `a_{i+1}/a_i = ((7−i)/(i+1))λ_i` with `λ_i` decreasing and
      `q = (16m−2)/(24m−18)` decreasing to `2/3`, hence `(1 − q/2)^7 ≥ (113/170)^7`.
    - Step 6's monotonicity.
    - `own/adj_hx.py`, exact over **all 332 class rows `107 ≤ m ≤ 1100`**: step 5, Residual and the surplus bound hold at
      every row; the minimum exact surplus is `124.2·R_{K−1}/K` at `m = 107` (the lemma's 2.51 is a loose bound).
    - A literal check of steps 1–2 on `CB(8,2)` at `p = 4, 5` with `F := leafSet` stipulated, as the lemma stipulates at
      `p*`. `Σ_X w` equals `R_K + 8m·r_1(K)` exactly (37,968 and 195,664), and `Σ_{N(X)} w ≥ R_{K−1} + 8m·r_1(K−1)`
      (5,408 ≥ 5,136; 40,128 ≥ 37,968).
    - Payload `e4ccfce5…998d`.
  - *Caution.* At those small ranks Hall at this `X` fails, since `Σ_X > Σ_{N(X)}`. That is expected: the stipulated `F` is
    not the selector of record (`F_4 = F_5 = ∅` on `CB(8,2)`), and the rank is not eligible. **It is not a cut** and bears on
    nothing in the class.
  - *Scope.* A necessary-condition Hall inequality at one structured family; not a step toward conjunct 4.
- **E-3 (θ_Hall floor; C-F2-U (ii)(d)).**
  - *Statement.* Any sector allocation with Out = 1, In ≤ 1 and per-image switch load ≤ `θγ`, whose positive arcs land only on
    in-sector targets and switch images, has `θ ≥ θ_Hall := (R_K − R_{K−1})/Σ_γ γN_γ`, where
    `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)`.
  - *Proof.* One line: sum the outflows.
  - *Status.* Conditional on the literal sector bridge. The governed `θ(m)` sits at `1.1879–1.1892·θ_Hall` at every class row
    to 1100 (my check). So the template is a live consistency test, and any improvement of it is bounded by a factor under
    about 1.19. No optimality claim is made, and the `θ*` law is untouched.
- **E-4 (domain boundary and unreachability; F3, narrowed by both critics).** `α = β = 0 ⟺ j = 0 ⟺ p = q`, where `ρ_q` is
  undefined and condition (i) is false. On the class, `p* − q ≥ (13m+4)/3 ≥ 465`. Proved (one line).
- **E-5 (`cb8R1` as a coefficient).** `cb8R1 m k = [y^k](1+y)^7(1+2y)^{8m−7}` by the Cauchy product. The identity is
  `proved_informal`, backed by independent convolution (C-F3-U, P3). F3's own evidence is tautological.

**Conditional reductions.** The per-target composition in `## Cross-route reconciliation` item 2 is conditional on E-1 and on
the literal sector bridge (C-F2-T paragraph), both STATED.

**Bounded computations (attained horizons).**
- F2's nine-row battery, retitled.
- The critics' extensions:
  - C-F2-T: `m = 302` light, and the literal bridge at `p*` sampled at 125/128/140;
  - C-F2-U: template to `m = 200, 302, 500, 1001`;
  - both F2 critics: (WID) from independent sides at nine or ten rows, and the literal bridge exhaustive at `CB(8,2)`,
    `CB(8,3)`.
- X-8 quotient checks with every `q` at nine rows, from three instruments.
- My HX and θ_Hall checks over 332 class rows to 1100.
- `CB(8,1)` and small-CB construction checks: C-F3-T used 7 instances and 64,968 sources with a derived selector; C-F3-U's
  P4 covered 7 instances.

All are `bounded_computation`, never proof.

**Template failures.** None at any class row. F3's corner is a domain boundary, not a template failure.

**Compiled scratch.** None authored in this portfolio. C-F1-T's six rebuilds are **carried** governed awards: sorry-free,
three standard axioms, `Main.lean` digests equal to the frozen ones.

**Imported results at their grades (unchanged).** C1-LA1, C1-LA2, C1-LA3 (including entry 20, condition (i) at `p*`), C2-LA1,
C2-LA2 and C2-LA3 are `formally_verified` at their exact scopes. The criterion key and the Tier 1 key are `proved_informal`.
The favorability and threshold keys stand at their registered grades.

**Record corrections (to be filed by the synthesis; sealed files are never edited).**
- F3's inverted flag.
- F3's REFUTED label restated as "holds for `j ≥ 1`".
- The `q = m` arm-slot wording.
- F2's digit literals and the (WID) wording.
- F2's record title.
- F1's R31-N-15 scope claim.
- The C1-LA2 `SOURCE/` duplicate fragment, which is a count note only.

## Rejected and narrowed mechanisms

- **No mathematical mechanism was refuted this cycle.** No candidate cut exists, and no template failure occurred at a class
  row. The refuted list is unchanged: (G′) (ruling 20), forest real-rootedness (`E993-TREE-REAL-ROOTED`), and the
  SOLUTION-CONTRACT §3.6 list. Nothing in this portfolio revives any of them. Every positivity step uses single-row binomial
  log-concavity or explicit binomial ratios. No step applies Newton or Darroch.
- **Narrowed or struck certifications**, detailed in `## Route-by-route decisions`:
  - F2: "end-to-end composed flow", the (WID) "three independent sides", mutant liveness, the digit literals, "per-target ⇒
    Hall", "X = images", and the `S < 0` wording;
  - F3: literal-network readings of Tests F/G and Witness 1, "defect of X-8", the over-broad REFUTED label, the inverted flag,
    the vacuous `α = 0` counter, "`unfold`-level" and "entries 29–30", Test D's scope, and R.O. 4 as backed by the return;
  - F1: the C1-LA1 `hm` literal, the ℕ-subtraction list, the "126 carries" wording, the R31-N-15 scope claim, and the
    `hj` description.
- **Adversarial record (protocol check 7).**
  - *Horizons.*
    - The composed inputs and template are exact at nine class rows (107–140).
    - The whole family is exact to `m = 1100` (332 rows) for HX/θ_Hall.
    - The literal sector bridge is exhaustive only at `CB(8,2)`/`CB(8,3)` and sampled at `p*` for 125/128/140.
    - **No seat has yet evaluated the actual composed flow per target on the literal network, or on a proved quotient, at a
      class row.** The combined per-target check at bounded rows is still owed as an adversarial item, even though
      reconciliation item 2 now makes its outcome predictable informally.
  - *Candidate cuts.* **None** satisfies any of the conditions: an eligible row of the class, exact supply and neighbourhood
    capacity, and a replay. The only failing configurations in the whole portfolio are:
    - F3's `j = 0` corner, which is off-domain and off-class;
    - my `CB(8,2)`, `p = 4, 5` construction check under a stipulated `F`, where the selector of record makes every weight 0
      and neither rank is eligible.

    Neither is Outcome C.

## Lean readiness

Nothing in this portfolio is a governed award, and no F seat compiled anything. Rulings for each award group that the
portfolio's content supports:

- **G-F-A — "X-8 clone-type algebra" (the E1 closed-form core; E-1). Contract-ready at the informal level, PENDING the isolated
  second read of E-1.**
  - (a) The informal proof is complete at statement granularity. The DAG is closed: definitions → (row) → telescoping
    (in-balance, top) → two absorption identities `(α+1)S_{α+1} = (a−α)T_α` and `(j−α)S_α = 2(b−(j−1−α))T_α` → per-target
    load → `β = 0` boundary → nonnegativity via two termwise log-concavity lemmas.
  - (b) No compiled fragment exists in this portfolio. Per CF3-F-1 (facts only), T-side critics compiled (ii-2) and nearby
    nodes; the synthesis should bind those by entry and digest, which I cannot see.
  - (c) Open nodes: all of the above, as new declarations.
  - *Exact statement (proposed).* For `a b j : ℕ`, `1 ≤ j`, `j ≤ a + b + 1`, with `S`, `T` defined **with explicit guards**
    (`if α ≤ j then … else 0`; `if α + 1 ≤ j then … else 0`) and `ρ : ℚ := (Σ S)/(Σ T)`, for every `α ≤ a`: `0 ≤ G α`,
    `0 ≤ H α`, `G α + H α = S α`, `α < a → G (α+1) + H α = ρ * T α`, `H a = ρ * T a`, `α = j → G α = S α ∧ H α = 0`, and (per-target load) whenever `0 < T α`,
    `(a − α) * (G (α+1) / S (α+1)) + 2 * (b − (j − 1 − α)) * ((α+1) * H α / ((j − α) * S α)) = ρ * (α+1)`, each term read as
    0 when its multiplicity is 0.
  - *Fences.* Pure algebra (no graph, no rank claim, not (HALL), never Tier 1 or Tier 2 progress). It is a node of the E1
    flow. Every `j − α` and `j − 1 − α` needs a guard (CF3-F-1: T1's `clone_fiber_card` failed exactly by truncated ℕ
    subtraction).
  - *Attribution.* C-F3-T and C-F3-U (r31 C3), on X-8/X-9 (r31 C2 T3 and its critics). The criterion is r30's; the mechanism
    is Codex GPT-6's.
- **G-F-B — the `cb8R1` coefficient bridge (E-5). Ready (small, informal proof complete).**
  - *Statement.* `∀ m k, 1 ≤ m → (((1 + X) ^ 7 * (1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff k) = (cb8R1 m k : ℤ)`.
  - *Proof.* By `Polynomial.coeff_mul` over `antidiagonal k`, `coeff_one_add_X_pow`, the coefficient of `(1+2X)^n` as
    `C(n,i)2^i`, and reindexing onto `range (min 7 k + 1)` with `C(7,i) = 0` for `i > 7`. **Not** an `unfold`.
  - *Carries.* C1-LA1 entry 11 `E993Transport.cb8R1` (marker `2efd2823db1ce7d8069b38dd96b9bc3bc2899c6d22733a8066e5ba0fa5e74e9c`),
    and at `q = 1` C1-LA3 entry 20 `cb8_E1_conditionI_topRank` (marker `8da112b4d0a8c184e9ea9d8c749c1342d53211159d575679999b3d73c7db6a3a`),
    whose exponents at `q = 1` read `8 * 1 - 1` and `8 * (m - 1) + 1`; these must be rewritten to `7` and `8 * m - 7` by
    `omega` (an ℕ-subtraction site, valid for `m ≥ 1`).
  - *New.* The bridge lemma, and, for general `q`, its analogue linking entry 20's ℤ[X] strict inequality to `ρ_q < 1` in ℚ.
    That analogue is the only formal gap between condition (i) and the adapter hypothesis.
- **G-F-C — Lemma HX (E-2).** The informal proof is complete, but it is **not recommended for funding.** It is a
  necessary-condition inequality off the conjunct-4 DAG, and the SOLUTION-CONTRACT §2 funding rule favours the terminal's DAG.
  It would need `N(X)` over the carried `transportRel`. Record it at `proved_informal` after the second read.
- **G-F-D — θ_Hall floor (E-3).** Not an award (a one-line corollary, conditional on the bridge).
- **F1's audit and F2's battery.** These never qualify: an audit is not a mathematical claim, and a bounded result never
  qualifies.
- **The §2 terminal, conjunct 4.** Not ready from this portfolio. The smallest unproved lemmas visible to F are:
  - on the E1 side, the literal-to-clone bridge (the clone bijection and a **corrected** fiber count, "`if α ≤ k then N else 0`"
    per CF3-F-1), plus G-F-B's `ρ_q` link;
  - on the sector side, the Out/In arc-sum bridges of U1/T3, which the C-F2-T paragraph backs informally.

  The T/U adjudications own those rulings.

## Progress and plateau assessment

material_progress: no
orientation_plateau: no

**Material progress.** No Tier 1 or Tier 2 grade moved in this orientation:
- Tier 1 stays `proved_informal`;
- Tier 2 was already formal (C1-LA1 at template level, C2-LA1);
- conjunct 4 is untouched formally;
- all three seats return `COND4_formal / E1_formal / TERMINAL_integration: not_advanced`.

The seats' own contributions are a confirmatory audit (F1), a bounded battery that had to be retitled (F2), and an edge-case
record (F3).

**Not a plateau, by the stop-gate definition.** The definition requires no new `proved_informal` lemma **and** no new
adversarial finding. This orientation has three STATED lemmas (E-1, E-2, E-3). E-1 is the vetted adapter content F3's "could
close" named, and it removes the arc-level caveat on the E1 per-target load. The orientation also has new adversarial
findings: two fidelity failures of instruments (ruling 18) caught and repaired, the exact X-8 domain, the numerical
invisibility of the ruling-16 error, and the load-bearing `hj`. These are critic-attributed and owe second reads, so the
controller may weigh them accordingly. The stop gate's decisive events are not triggered: there is no formal Tier 1 and no
confirmed cut.

## Headline assessment

headline_resolved: no
status: still_open

At this orientation's evidence grade, statement by statement:
- **Tier 1 (E), eligibility at `p*`.** Formally verified on record (C2-LA1). F1's fidelity audit and C-F1-T's kernel rebuild
  confirm the statement's literal link target, index and hypotheses. Not refuted.
- **Tier 1 (H), (HALL) at `p*`.** The registry grade `proved_informal` is unchanged and not re-litigated here. This portfolio
  supplies no complete proof of the full statement that I have verified; it supplies nodes (E-1, the bridge paragraph). It
  also supplies no refutation: no eligible deficient cut was found at any horizon. Conjunct 4 is not formal.
- **(L-S)_top.** Formally verified at template level (C1-LA1). The literal-network reduction (fence 4) is `proved_informal`
  STATED (C-F2-T), bounded by both F2 critics. Not refuted. The template sits about 19% above the whole-family floor
  `θ_Hall` at every class row to 1100.
- **(ELIG-top)(a).** Formally verified (C2-LA1). F1 and both F1 critics confirm the literal
  `C5LA1.indepSetCount (cbGraph m) ∅` link at `p*−1` versus `p*−2`. Not refuted.
- **Outcome C.** No candidate. `cut_candidate: none`.

Hence `status: still_open` at the F grade: no verified complete informal proof of the full Tier 1 within this portfolio, and
no replayed eligible cut.

## Next-route allocation

**Exact remaining obligation (orientation F).**
1. The signed fidelity audit of every Cycle 3 statement that Stage 7 may freeze. Neither F1 nor its critics could read those
   statements. The checklist is both F1 critics' seven items plus two additions:
   - any adapter that uses `ρ_q` must reach C1-LA3 entry 20 through an explicit coefficient bridge (G-F-B), never by
     restating condition (i) as a hypothesis;
   - `favorableLeaves = leafSet` must enter through C2-LA3, not as a hypothesis, unless it is disclosed as one.
2. Isolated second reads of E-1, E-2, E-3 and of C-F2-T's literal sector-bridge paragraph.
3. The first per-target evaluation of the actual composed flow (X-8 plus the scaled C1-LA1 allocation) at a class row, through
   a proved quotient.

**Next-cycle routes (up to three):**
1. **`FROZEN-STATEMENT-FIDELITY-SIGNOFF`.** Run the F1-critic instruments (`scratchpad/c3-crit-F1-U/instr/audit_frag.py`,
   `audit_carry.py`; `scratchpad/c3-crit-F1-T/own/`) and the textual checklist above over every award directory Stage 7
   produces from Cycle 3, and over any Cycle 4 candidate `expected_statement`. *Could close:* a signed audit before each freeze.
   This is the one F1 obligation still open.
2. **`X8-AND-SECTOR-BRIDGE-SECOND-READ`.** An isolated read of E-1 and of the bridge paragraph, with an adversarial replay on
   literal small `CB(d,m′)`: derived selector, (WID) asserted, `q < m` exercised, and both selectors reported. *Could close:*
   E-1 and the bridge at `proved_informal` (registrable), and a vetted adapter statement for U2/T3.
3. **`COMPOSED-FLOW-PER-TARGET-ADVERSARY`.** At one fresh row (e.g. `m = 143`) and one control, sum the E1 X-8 loads and the
   scaled sector loads on every target class (in-sector, image, one-choke non-image, `q ≥ 2`, weight 0) of a proved orbit
   quotient. Check every source row sum, and run Hall sums at structured `X` mixing `Sec` with `q ≥ 2` classes (the family
   C-F2-T left untested). *Could close:* the first genuine bounded end-to-end confirmation of the composition (not the
   template), or an exact failure or cut.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-adj-F/`,
standard library only (`fractions`, `math.comb`, `json`, `hashlib`, `sys`), with exact integers and Fractions.

| File | SHA-256 |
|---|---|
| `own/adj_x8.py` (E-1 generic identities; every `q` at nine rows) | `73916d72537eb3743a9270ca76fb7a5c4d9e0c29dd042074ce74ee688fcd3d57` |
| `own/adj_x8.out.txt` (payload `f2a6ceb075baf91ec19c14b73b25d306ace2b7598f66dd6f63fded1088af3e53`) | `1b74775c55d5e44134d0c398e3e3d26130829d5bbe2e69d607d65f9913f4d32f` |
| `own/adj_hx.py` (Lemma HX, θ_Hall, `Λ` over 332 class rows; literal `CB(8,2)` steps 1–2) | `a549e84ae1794f594eeb5756acce68feffad56d4cfb0a5135a5a5e430e2a491a` |
| `own/adj_hx.out.txt` (payload `e4ccfce5e600ff0fd5f76cbd58853f2fbe993e6770a5383f7feaeea12d96998d`) | `ab50220ed827c6c40c771b5a537fd1913e831d5405ac04199d3258da3915a4ac` |
| `own/adj_selector.py` / `.out.txt` (derived `F_p` on `CB(8,1)`, `CB(8,2)`) | `a82bc8766196009f4ce9120d2103ad77bce9de4a887fa563165bfa027f277a0a` / `059409147ed5bf0fc2fba2abf48f30e4e33304e40f0893b93d927e53a95030be` |
| `own/adj_block.py` / `.out.txt` (C1-LA3 `hj` load-bearing check) | `b70e303808658067803fa055be8d64f08006cb604b3b9e8a856c65c1d695df90` / `db10f3bb598fa16f6256a84ca621eda809b5cb80d51732b95cfd7b3d70d416bf` |
| `replay-F2/` (copy-out of F2's three scripts, digests as on the return; `f2_composed_flow_out.json` = `orig_out.json` = `240ca851…659a`; `stdout.txt` `26c078fc…3ab0`; `selftest.txt` `bd1309f6…f72b`) | as listed |
| `replay-F3/` (copy-out of `f3_arc_adapter.py` `99d11bbc…`; `f3_arc_adapter.out.json` `d87071c5…6044`; digest file `ad1b4962…efb0cc`, content `b65c2b0e…39fc`) | as listed |

**Replay.**
- `cd own && python3 -B adj_x8.py 107 110 113 116 119 122 125 128 140` (about 25 s);
- `python3 -B adj_hx.py` (about 11 s);
- `python3 -B adj_selector.py`;
- `python3 -B adj_block.py`;
- `cd ../replay-F2 && python3 -B f2_composed_flow.py && python3 -B f2_selftest.py`;
- `cd ../replay-F3 && python3 -B f3_arc_adapter.py`.

**Jobs.** Two background jobs of mine ran: the F2 replay (PID 13655) and `adj_hx.py` (PID 15039). Both exited on their own,
and `ps -p 13655,15039` returned no process before this write. Nothing was killed, and no job of mine is running.
