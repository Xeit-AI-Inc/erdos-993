# Critique

Critic `C-F3-T` (orientation T, prove), Cycle 3 Stage 4 of r31, assigned to the return of seat `F3` (route `C3-F-03`,
mechanism `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`, orientation F). Date by the clock: 2026-09-28.

Model disclosure (two parts): chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. Before my first
tool call the harness injected the project `CLAUDE.md`, the user auto-memory index (`MEMORY.md`) and the user's e-mail into my
context. I did not open, follow or use any of them beyond the boot this dispatch authorizes. Conversation logging belongs to the
controller.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage4/DISPATCH-C-F3-T.md` (file SHA-256) | `a36dea67353dea9aab7e314902f455a8aee4fd82f38083622d289174f07fa7ce` | MATCH |
| **Capsule seal** `control/c3-critic-capsules/F3-PACKET-MANIFEST.json` (canonical JSON without `seal_sha256`, sort_keys, `(",", ":")`, no trailing newline) | **`a3f7a5a35dc78be8cfd7ce676af628ef22b0d33e9a37182e48ec489f17bf6a66`** | MATCH |
| Stage 4 dispatch seal `control/C3-STAGE4-DISPATCH-MANIFEST.json` | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | MATCH (self-consistent) |
| Stage 3 seal `control/C3-STAGE3-PACKET-MANIFEST.json` | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | MATCH (self-consistent) |
| Stage 2 seal `control/C3-STAGE2-PACKET-MANIFEST.json` | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | MATCH (the protocol's value) |
| All 14 capsule members (bytes and SHA-256, including `RETURN.md` `f089f9a8…fd4cf1`) | per manifest | 14/14 MATCH |

**Digests the return lists.** I checked every digest the return lists: 13 source files, the generator, and the output.
- Control files: common worker brief `302d6533…`, `OBLIGATIONS.csv` `1f59cb93…`, `CLAIM-IDENTITY.run-local.json` `96fb3560…`,
  `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `C3-ALLOCATION.md` and `C3-STAGE1-GATE.md` all match the Stage 2 manifest.
- `cycles/cycle-3/stage2/ROUTE-STATE.md` `32dd0e1e…` also matches the Stage 2 manifest. The return says it is "not a
  sealed-packet member", but it is listed in the Stage 2 manifest (a minor inaccuracy).
- `crit_t3f.py`, `crit_t3f_arcs.py`, `crit_literal.py` and `F3/cb_lib.py` match both the Stage 2 manifest and
  `sources/c2-stage7-sources/SOURCE-DIGESTS.json`.
- The Cycle 2 `SYNTHESIS.md` `260c8195…` and C1-LA1 `Main.lean` `f0578ed7…` match their sub-tree `SOURCE-DIGESTS.json`.
- The generator `scratchpad/c3-F3/f3_arc_adapter.py` `99d11bbc…` matches.
- I replayed the generator copy-out-first into `scratchpad/c3-crit-F3-T/replay/`. The output digest was
  **`b65c2b0e2695880ca3de8ac38fe780d4e79405ecccf2fec3c90353a9af5639fc`**, which reproduces the return's value. The replayed
  `f3_arc_adapter.out.json` is byte-identical to the seat's (`cmp`).

**Claim identity.** The return touches three registered keys:
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`);
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal` modulo
  Darroch on the `r_q`);
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`.

Its object is the Cycle 2 synthesis row **X-8** ("Explicit E1 flow at `(8, m, p*)` given `C ⊆ F`", `proved_informal` STATED).
X-8 rests on X-9 ((ii-1)/(ii-2)) and on X-7 (FAV-TOP). The return proposes no `E993-R31-` key, and I propose none. Every result
below is a node of X-8 or X-9 (alias check in `## Mechanism-equivalence and fence check`).

## Independent re-derivation

I built my own instruments from the contracts, never from the return's script: own labelling, own forest DP, derived selector,
(WID) from two sides, and `ρ` from a polynomial convolution. Standard library only, exact `int`/`Fraction` arithmetic, no
Newton or Darroch anywhere.

**Notation (from the return, which matches X-8 and the contract's `r_q`).**
- Fix `a = qd − 1`, `b = d(m − q) + 1` and `j = p − q`.
- `S_i = C(a,i)·C(b,j−i)·2^{j−i}` and `T_i = C(a,i)·C(b,j−1−i)·2^{j−1−i}`, with zero outside the ranges.
- `R_S = ΣS_i = r_q(j)`, `R_T = ΣT_i = r_q(j−1)` and `ρ = R_S/R_T`.
- `Sc(α)` and `Tc(α)` are the strict prefix sums.
- `G_α = ρTc(α) − Sc(α)` and `H_α = Sc(α) + S_α − ρTc(α)`.

A positive-weight `r`-free source with `q ≥ 1` chokes and weight `w` has `α = w − 1` and `β = j − α`, where `β` counts
non-active, non-choke vertices. Its arc values are:
- `G_α/S_α` on each active tag;
- `w·H_α/(β·S_α)` on each of its `β` other non-choke vertices;
- 0 on each choke.

**(R1) Out identity, every `α` and every `β`: a closed proof (critic-derived).** Assume `j ≥ 1`.
- *Case `β ≥ 1`.* The row sum is `w·G_α/S_α + β·w·H_α/(β S_α) = w(G_α+H_α)/S_α`. By definition `G_α + H_α = S_α`, so the
  row sum is exactly `w`.
- *Case `β = 0` (so `α = j ≥ 1`).* `T_i = 0` for `i ≥ j` and `S_i = 0` for `i > j`. Hence `Tc(j) = R_T` and
  `Sc(j) = R_S − S_j`, so `G_j = ρR_T − R_S + S_j = S_j`. The row sum is `w·S_j/S_j = w`.

This proves the return's Test B (`G_α = S_α` at `β = 0`, `α ≥ 1`), which the return left as "sketched but not completed". It
also proves the general case the return says it "did not attempt" (Remaining obligation 4). Test A (`G_0 = 0`, `H_0 = S_0`)
holds because `Sc(0) = Tc(0) = 0` (an empty sum), for any `ρ`.

**(R2) In identity (critic-derived; this re-derives T1's node (b) and X-8's load clause).** Take a target class with `q`
chokes, weight `w' = α'+1 ≥ 1`, `β' = j−1−α'` and `T_{α'} > 0`. Its (D) preimages among `r`-free sources are:
- `a − α'` ways to add a private leaf on an empty leg at a present choke;
- `2(b − β')` ways to add `b` or `c` on an empty leg at an absent choke, or `s` or `v` on an empty arm.

Two points about these preimages:
- Adding `r` is impossible because `r ~ u_i`. Adding a choke lands in class `q+1` with a choke-deletion value of 0.
- No other added vertex changes any activity, because `W_{c_ij} = {u_i}` and `W_v = {r}`.

The two double counts `(a−α')/S_{α'+1} = w'/T_{α'}` and `2(b−β')/((β'+1)S_{α'}) = 1/T_{α'}` are binomial absorption. They give
an inflow of `w'(G_{α'+1} + H_{α'})/T_{α'}`. Since `G_{α'+1} + H_{α'} = ρT_{α'}` by telescoping, the inflow is **exactly
`ρ_q·w_F(A)`**.

The boundary terms vanish:
- at `α' = a`, `G_{a+1} = ρR_T − R_S = 0`;
- at `β' = b`, `Sc(α'+1) = Tc(α') = 0`, so `H_{α'} = 0`.

Weight-zero `r`-free targets receive only `G_0/S_0 = 0`. Targets containing `r`, and targets with no choke, receive nothing.

**(R3) Nonnegativity from binomial log-concavity (critic-derived proof; it agrees with X-9's (ii-1)/(ii-2) on record).** Assume
`j ≥ 1` and `R_T > 0`.
- *`G_α ≥ 0`.* `R_T·G_α = Σ_{k<α≤i}(S_iT_k − T_iS_k)`, because the pairs with `i, k < α` cancel. For `k < i`, write
  `u = j−i < t = j−k`. The summand is `C(a,i)C(a,k)2^{2j−1−i−k}[C(b,u)C(b,t−1) − C(b,u−1)C(b,t)]`, which is ≥ 0 by
  log-concavity (with no internal zeros) of `n ↦ C(b,n)`.
- *`H_α ≥ 0`.* `R_T·H_α = Σ_{i≤α<k}(S_iT_{k−1} − S_kT_{i−1})`. The summand is `C(b,j−i)2^{j−i}C(b,j−k)2^{j−k}·[C(a,i)C(a,k−1) −
  C(a,i−1)C(a,k)]`, which is ≥ 0 by log-concavity of `n ↦ C(a,n)`.

Binomial log-concavity is elementary, because `C(n,x)/C(n,x−1) = (n−x+1)/x` decreases in `x`. It is not Newton or Darroch, and
it is not the REFUTED two-binomial ascent tool (G′) of ruling 20.

**(R4) The zero-row corner lies outside X-8's domain, not merely off-target (critic finding).** `α = β = 0` forces `j = 0`,
i.e. `p = q`. There, `R_T = r_q(−1) = 0`, so `ρ_q` is **undefined**, and condition (i) `r_q(p−q) ≤ r_q(p−q−1)` reads
`1 ≤ 0`, which is false. So X-8, which presupposes condition (i) for every `q ∈ [1, m]` at rank `p`, is not asserted at any
rank `p ≤ m`.

The generator's guard `rho = 0 if r(j−1) = 0` is the seat's own convention. The "zero row" is manufactured by that
convention, not by X-8.

Independently, the return's unreachability argument is exact for every class `m`. `p* − m = (13m+4)/3` is an integer
(`13·2 + 4 ≡ 0 mod 3`) and `≥ 465` on the class. So every source class at `p*` has `j ≥ 465`.

**Instruments.**
1. *Literal (`crit_literal.py`).* Own labelling (chokes first, `r, s, v` last); tree test (BFS connectivity plus `n − 1`
   edges); forest-DP `i_k(T − D)`; `x` scanned through `α`.
   - `F_p` is derived with ruling 16's index, `i_{p+1}(T−t) < i_p(T−t)`.
   - **(WID) is asserted at every rank** (as an assert that aborts on failure) from independent sides: literal
     `Σ_B w − Σ_A w` against `Σ_F[q_t(p) − q_t(p−1)]`, with `q_t(j) = i_j(T−t−s_t) − i_j(T−N[s_t])`.
   - X-8 arcs are placed on literal (D) arcs, with `ρ_q` from an explicit convolution of `(1+y)^a` and `(1+2y)^b`.
   - Instances: `CB(8,1)` (every rank), `CB(8,2)` (ranks 1–4, 17, 18), and `CB(2,3)`, `CB(3,2)`, `CB(2,4)`, `CB(4,2)`,
     `CB(3,3)` (every rank).
   - Output digest `98b15ad9…a3ed9`.
2. *Quotient (`crit_quotient.py`).* At the controls `m = 107, 110, 113, 116, 119, 122` and the fresh rows `125, 128, 140`
   (ruling 17), for **every** `q ∈ [1, m]` at `p*`, it checks in exact integers:
   - condition (i);
   - `ρ_q ≤ ρ_1`;
   - `G_α ≥ 0` and `H_α ≥ 0` on every realizable class;
   - the Out, In and `β = 0` identities.

   Also:
   - `r_q` is cross-checked against an independent Cauchy-product loop at `q ∈ {1, ⌈m/2⌉, m}`, and against C1-LA1's `cb8R1`
     transcription at `q = 1`.
   - The r30 fixed point `ρ_1(95) = 1354839571516225/1361543988640524` is reproduced from both sides.
   - An exhaustive sweep over `a, b ≤ 14` and every `j` covers 3,375 triples with `j ≥ 1`.
   - Output digest `30ba2e6f…ec870`.
3. *Rows (`crit_rows.py`).* A tree DP rooted at `r` gives `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`, reproducing the §5
   fixed points; `p* = 572` is eligible. It also gives `CB(8,125)`: `x = 666`, `α = 1126`, `p* = 668`, eligible. `v` and `c`
   are favorable at `p*` on both rows, so `C ⊆ F_{p*}`: X-8's hypothesis holds there. That is a bounded fact; the universal
   statement is X-7/C2-LA3. Output digest `27c3e2b1…ec01`.

**Results.**
- *Literal instrument.* (WID) holds at every rank of all 7 instances. At every rank where `C ⊆ F_p`, there are **0** row
  failures, **0** column failures and **0** negative arcs. That covers 64,968 X-8 sources in total, with every
  `q ∈ [1, m]`, and it covers both edge classes: 11,680 sources with `α = 0, β ≥ 1` and 648 with `β = 0, α ≥ 1`.
- *Corner.* **0** sources sit at the corner `p = q`. Every positive-weight non-sector source is `r`-free with `q ≥ 1`
  (`pos_w_nonsector_other = 0`).
- *Quotient at the 9 rows.* Condition (i) holds for every `q`, and `argmax_q ρ_q = 1`. There are 0 negative `G`/`H` values
  and 0 identity failures. The smallest `j` is `p* − m` (465 at `m = 107`, 608 at `m = 140`).
- *Small sweep.* 0 failures of any identity or inequality across the 3,375 triples.

## Attacks and findings

1. **Fidelity (duty 2): the return's literal tests are not the network of record.** This is the strongest finding.
   - The generator fixes `Fset = set(leaves)` at every rank. It never derives `F_p`, and it never asserts (WID) (ruling 18;
     r30 §1.2: "every instrument asserts this equality on every instance before reporting anything else").
   - My derived selector is **empty** on `CB(8,1)` at `p = 1..5` and on `CB(8,2)` at `p = 1..4`. So at those ranks every
     weight is 0 and supply = capacity = 0.
   - Consequences:
     - Test F's counts at `p = 2..5` (757 `q = m` sources and 247 `β = 0` events in total, plus the 19,520 "zero-weight
       sources", which exclude every `r`-containing source) describe the network with `F := leafSet`, not the network at
       `(CB(8,1), p)`.
     - **Witness 1** (`{u_0, u_1, c_{0,0}}`, `p = 2`) has `w_F = 0` in the network of record, so it needs no outflow. The
       return's "literal (not merely closed-form) confirmation of the Test C corner" is **struck**.
     - Every literal instance the return reports also has an empty eligible window:
       - `CB(8,1)`: `x = 6`, `α = 10`, so `p` would need `≥ 8` and `≤ 6`;
       - `CB(8,2)`: `x = 12`, `α = 19`, so `p` would need `≥ 14` and `≤ 12`.

       r30 §1.1 requires nonempty eligibility of any reported instance.
   - What survives is the reading as algebra checks of X-8's construction under the stipulated hypothesis `C ⊆ F`. That is
     legitimate, and my derived-`F` instrument confirms the same identities where `C ⊆ F_p` actually holds.
   - My own small instances are non-eligible too. I report them only as construction checks of identities that (R1)–(R3)
     prove. The only target-class rows I report (107–140) are quotient-level, with eligibility verified at 107 and 125.
2. **Test C ("a genuine defect of X-8's construction in principle") is narrowed.** By (R4), the corner lies outside X-8's
   hypotheses: `ρ_q` is undefined there and condition (i) fails at `p = q`. The unreachability conclusion (`p* > m`, so no
   class source is at the corner) stands and is exact for every class `m`; the brief's check passes.
   - The phrase "checked exactly for `m = 1..200`" covered only the 67 values with `m ≡ 2 (mod 3)` (`swept_count = 67`). The
     inequality `16m + 4 > 3m` needs no sweep.
   - Corner or not, `(CB(d,m), p=1)` with `B = {u_i, c_ij}` and `F ∋ c_ij` has an empty positive-weight neighbourhood.
     However, no instance has `c_ij ∈ F_1`, and rank 1 is never eligible. So nothing here is a cut.
3. **The Test B/Test A statements are true, and are now closed proofs ((R1)).**
   - The return graded them `computer_assisted`. They are one-line identities: I state them `proved_informal`, with an
     isolated second read owed.
   - **The shipped summary flag is inverted.** `f3_arc_adapter.out.json` carries `"out_identity_holds_for_al_ge_1": false`.
     The code computes `all(f[2] != 0 for f in fails)`, which is False exactly because all 105 failures have `α = 0`.
   - The return's claim is backed by the other flag, `all_failures_are_al_equal_0: true`. The 105 failures are the `j = 0`
     corners: `Σ_{m≤14} m = 105`.
   - This is a certification-literal defect of the shipped evidence. The mathematics is correct.
4. **Test D (`q = m`) is correct but narrow.**
   - At `q = m`, `b = 1` and `β ∈ {0, 1}`. The one slot is **the arm (`s` or `v`)**, not "vertex `s`" alone as the return
     says: when `r ∉ B`, `v ∈ B` is an inactive tag and counts toward `β`.
   - The return's "`G`, `H`, `S`, `T` nonnegative on `0..a`" was checked only at `q = m` (and `ρ` only at `q ∈ {1, m}`). My
     quotient covers every `q` at all 9 rows.
5. **Test E (`cb8R1` bridge).** The identity `cb8R1 m k = [y^k](1+y)^7(1+2y)^{8m−7}` is true: it is a Cauchy product, and my
   independent convolution loop agrees at `k = p*−1, p*−2` on 9 rows and at `m = 95`.
   - The return's "0 mismatches" compares two transcriptions of the same finite sum (`cb8R1` against `rr(7, 8m−7, k)`, both
     `Σ C(7,i)C(8m−7,k−i)2^{k−i}`), so it is not independent evidence.
   - **Struck:** "definitional unfolding" and "`unfold`-level identity" as Lean claims. `Polynomial.coeff` of a product is not
     definitionally a `Finset.range` sum. The Lean bridge needs `coeff_mul` (antidiagonal), the coefficient formulas for
     `(1+X)^7` and `(1+2X)^n`, reindexing to `range (min 7 k + 1)` with vanishing terms, and ℕ→ℤ→ℚ casts. The synthesis's
     "Vandermonde-type coefficient identity" is the accurate description.
   - Also inaccurate: C1-LA1 entries 29–30 (`cb8R1_expand_top/sub`) are ℕ-sum expansions of `cb8R1` at `k = a+8, a+7`. They
     contain no `Polynomial`, so they are not "the two pieces" of the ℤ[X] bridge.
6. **Remaining obligation 4 overclaims relative to the return's own evidence.** "X-8's construction is sound (Out/In
   identities hold) at every source reachable at `p = p*` for the entire class" is not backed by the return. It proved only
   the `α = 0` and `β = 0` regimes, checked columns only on `CB(8,1)` with a stipulated `F`, and checked nonnegativity only at
   `q ∈ {1, m}`. The statement is now backed informally by (R1)–(R3) plus condition (i) (a registered key) and `C ⊆ F_{p*}`
   (X-7 / C2-LA3). The vetted adapter wording is given in `## Remaining obligation`.
7. **Allocation item left unaddressed.** Node (N1) of C2-LA3 was due only "if C2-LA3 did not close". The common brief lists
   graph-level favorability among the six formally verified awards, so the item is moot. The return does not mention it.
8. **No hypothesis encodes a conclusion, and no ℕ-subtraction is unsafe.** `8m − 7 ≥ 1` for `m ≥ 1`; `j = p* − q ≥ 465`;
   `j − α = β ≥ 0`, and every realizable class has `α ≤ a` and `β ≤ b`.

## Mechanism-equivalence and fence check

- **One rank per tree; the class only.** The return's off-class and off-rank tests make no claim at other ranks. Its "for any
  `m ≥ 1`" statement concerns the construction's domain, not (HALL). My (R1)–(R4) are identities of the clone-type counts at
  any `(d, m, p)` with `p > m`, and I claim nothing about (HALL) off `p*`.
- **No refuted mechanism.** (R3) uses single-row binomial log-concavity. That is neither (G′) (ruling 20), nor Newton or
  Darroch on a non-real-rooted polynomial, nor any item in SOLUTION-CONTRACT §3.6.
- **No status transfer.** Nothing touches the aggregate keys, (HALL), TREE, FOREST or #993.
- **Census discipline.** The return graded its sweeps `computer_assisted` and `bounded_computation` and used no sweep as a
  universal proof, except the "sound for the entire class" sentence (finding 6). My row checks are `bounded_computation`.
  The universal content comes from (R1)–(R4).
- **`θ*` law and r30 bounded record:** not used.
- **Alias check.** (R1)–(R3) are nodes of X-8 (saturation and loads) and X-9 ((ii-1)/(ii-2)), and the in-balance is T1's
  node (b). None of them is a new key. (R4) is a domain remark about X-8, and the same holds for it.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| Output digest `b65c2b0e…39fc`, "byte-identical replay" | reproduced by my copy-out replay | backed |
| Test A "(proved, swept 0 failures over 1,000+ triples)" | 2,160 triples; also a one-line proof | backed (proof now written, (R1)) |
| Test B "0 failures among 4,480 checks other than `α = 0`" | `all_failures_are_al_equal_0: true`; but the shipped `out_identity_holds_for_al_ge_1: false` (inverted flag) | math backed; **flag defective, to be corrected** |
| Test C "(proved)", "checked exactly for `m = 1..200`" | the inequality is universal; the sweep covered only 67 class values | backed; the sweep wording is narrowed |
| Test C "a genuine defect of X-8's construction" | the corner lies outside X-8's hypotheses (R4) | **struck; replaced by "outside X-8's domain"** |
| Witness 1 "literal (not merely closed-form) confirmation" | `w_F = 0` under the derived `F_2(CB(8,2)) = ∅` | **struck** |
| Test E "proved exactly, 0 mismatches"; "definitional unfolding"; "`unfold`-level" | tautological comparison; the Lean bridge is not `unfold` | identity true (Cauchy product); **Lean-level literals struck** |
| Test F "exhaustive ... every rank `p = 2..11`" | `F := leafSet` stipulated; no (WID); ranks 10–11 are empty (`p+1 > α`) | **narrowed** to a construction check under the stipulated `F` |
| Test D "S, T, G, H all nonnegative on `0..a` at every row" | only at `q = m` | narrowed to `q = m` (my quotient covers all `q`) |
| R.O. 4 "sound ... for the entire class" | not backed by the return | backed only by the critic-derived (R1)–(R3) plus the registered inputs; STATED |
| Gate lines, `headline_resolved: no`, `cut_candidate: none` | consistent | backed |

## Verdict

The return's load-bearing conclusions survive:
- the only configuration where X-8's row identity can fail (`α = β = 0`) forces `p = q ≤ m`, and so never occurs at `p*`;
- `cb8R1` is the `q = 1` two-binomial total.

They survive with these narrowings:
- the corner is outside X-8's domain (condition (i) fails at `p = q`), not a defect of X-8;
- the literal `CB(8,1)`/`CB(8,2)` evidence is a construction check under a stipulated `F`, not the network of record (no
  derived selector, no (WID), non-eligible rows);
- the Lean-level "definitional/`unfold`" literals and the inverted summary flag are struck;
- Remaining obligation 4 was unbacked as written.

As a critic-derived advance, I close the return's open items in full, as `proved_informal` STATED (second read owed):
- X-8's Out identity (row sum `= w_F(B)`) at every `α`, `β` with `j ≥ 1`;
- its In identity (column `= ρ_q·w_F(A)`, weight-zero and non-`r`-free targets at 0);
- nonnegativity of every arc value, from binomial log-concavity.

These hold at every rank `p > m`, conditional on `C ⊆ F`. At `(8, m, p*)` on the class, X-8 is therefore complete informally
modulo condition (i) (the registered key, Darroch on the `r_q`) and X-7 (`C ⊆ F_{p*}`).

verdict: retained_narrowed
headline_resolved: no

COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

## Remaining obligation

1. **Vetted adapter statement (for U2/T3), exact.** For every `m ≥ 107` with `m ≡ 2 (mod 3)`, every non-sector source
   `B ∈ I_{p*+1}(cbGraph m)` with `w_F(B) ≥ 1` is `r`-free with `q ≥ 1` chokes and `j = p* − q ≥ (13m+4)/3`. X-8's arc values
   on its (D) arcs are nonnegative and sum to exactly `w_F(B)`. Every `r`-free target with `q ≥ 1` receives exactly
   `ρ_q·w_F(A)`, and every other target receives 0. The hypotheses are `C ⊆ F_{p*}` (X-7; C2-LA3 formal) and `ρ_q ≤ 1` for
   all `q` (condition (i); C1-LA3 entry 20 in ℤ[X] form). Grade: `proved_informal` STATED, owing an isolated second read of
   (R1)–(R3).
2. **Formal:**
   - the ℤ[X]↔`cb8R1` coefficient bridge: `coeff_mul` plus binomial coefficient lemmas, not `unfold`;
   - the log-concavity nonnegativity (R3) and the two absorption double counts (R2), as `Finset.sum` lemmas over the clone
     product.

   These are the E1 nodes still open for `E1_formal`.
3. **Records:**
   - correct the generator's inverted flag (`out_identity_holds_for_al_ge_1`);
   - record that `q = m` gives `β ∈ {0, 1}` through the arm slot (`s` or `v`).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F3-T/` (SHA-256):

| File | SHA-256 |
|---|---|
| `seals.py` | `5a18651a829960bfe7f92478426abf833ba734775eaf9386c2806d9b4d0c117a` |
| `crit_literal.py` | `30fb889b30d7fd74a10da1142f5f6844e537211bb78e43518af7e060468b4a0b` |
| `crit_literal.out.json` | `0a8f0ab1966df600469059888d76215f91d60308fcd16f5974e3acae14d2fcfe` (canonical payload digest `98b15ad9f8a752a63fa76b57212ef07c8490893bdbf2b4e0b0117cc8661a3ed9`) |
| `crit_quotient.py` | `cb7f42c0b191f2e4d8eebcc2758ba2dc563f15f59759110b43d1873a13210417` |
| `crit_quotient.out.json` | `d33bf5a05922b65b43597fc92fcd6623d542ca1f086ef90460de4470df851df5` (payload digest `30ba2e6f5d86a8606d29dfeee413428a14e81f814dca54b594b6de219f2ec870`) |
| `crit_rows.py` | `c6ae34f6d13c02679e1dc3d88fc01ac8a4611e004a485d2d0d0c7d158eeeeb22` |
| `crit_rows.out.json` | `eff77c50c7ccdd98dc116621281b2fe08ad1db3603e777a4000a854267042130` (payload digest `27c3e2b134b4a87e27dc6d1cb0845e0d398d96a15ee242dc79c483eef6b1ec01`) |
| `replay/f3_arc_adapter.py` | `99d11bbc9f51da8eecbf9c79d5f88f19ee753a7d904d0c3ddef9ad18dc2aa82c` (copy-out of the seat's generator) |
| `replay/f3_arc_adapter.out.json` | `d87071c59334f5e957e265c3af797661f606b633e54f4846449550e909426044` (byte-identical to the seat's) |

Each script is replayed with `python3 -B <script>` from that directory (run times about 2–16 s). No network, no installs, no
Lean.

**Read-boundary disclosures.**
1. Harness-injected `CLAUDE.md`, `MEMORY.md` and e-mail: not used.
2. Outside the capsule I read only frozen `sources/` members, which are authorized:
   - `sources/r30/records/SEMANTIC-CONTRACT.md` §1.1–1.2 (digest-matched);
   - the Cycle 2 `SYNTHESIS.md` lines 120–130 and 170–180;
   - C1-LA1 `Main.lean` entries 11 and 29–32 (single-file `grep`/`sed` inside `sources/`);
   - one non-recursive `ls sources/c1-results/runs/`.
3. For digest verification only, I hashed without reading their content: the worker brief, `OBLIGATIONS.csv`,
   `CLAIM-IDENTITY.run-local.json`, `cycles/cycle-3/stage2/ROUTE-STATE.md`, the three Cycle 2 critic scripts and
   `F3/cb_lib.py`. I also ran one non-recursive `ls` of `scratchpad/c3-F3/`.
4. **Process listing.** To confirm I had no background jobs, I ran `pgrep -fl "crit_|f3_arc"`. It matched processes of other
   sessions and printed their command lines, which exposed sibling critics' (`C-F2-U`, `C-F2-T`) scratch script text. I did
   not use any of it, and I did not touch those processes. `jobs -l` was empty. I started no background job and none is
   running.
