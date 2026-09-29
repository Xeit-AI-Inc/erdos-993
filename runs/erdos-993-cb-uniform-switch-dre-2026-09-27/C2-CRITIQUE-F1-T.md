# Critique

Critic `C-F1-T` (cross-orientation, orientation T) of route `C2-F-01`, mechanism token `ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`
(seat F1, orientation F), r31 Cycle 2 Stage 4. Run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Stage 2 seal
`ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the critic protocol, my capsule and its listed files. No other
VerityOS file was opened (read-boundary disclosures below).

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Standard library only (`python3 -B`, `fractions`, `math.comb`, `itertools`, `json`, `hashlib`). No network access and no package
installs. No Lean was needed, because F1 is not a Lean seat. Scratch: `scratchpad/c2-crit-F1-T/` only.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c2-stage4/DISPATCH-C-F1-T.md` (`shasum -a 256`) | `526a4f187bccd020d936bc18b14819d2b3b5d5ae05983f360909a1cd9c801e50` | MATCH |
| **Capsule seal** `control/c2-critic-capsules/F1-PACKET-MANIFEST.json` (canonical JSON minus `seal_sha256`, sort_keys, `(",", ":")`, no newline) | `25299cc574d8d5ac83ed8e6f85447aec0dd4915f0b1f56d316e17cd14f86170e` | MATCH |
| All 14 capsule members (SHA-256 and byte count) | each equals the capsule entry | MATCH ×14 |
| Stage 2 packet seal | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | MATCH |
| Stage 3 packet seal | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | MATCH (stored = recomputed) |
| Stage 4 dispatch-manifest seal | `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` | MATCH (stored = recomputed) |
| Return `cycles/cycle-2/stage3/returns/F1/RETURN.md` | `ee6da5f0b63433f27a6bcc02af219fe1e48ccca8c2dedb64eeb2d9f878f6987b` | MATCH |
| Return artifacts `scratchpad/c2-F1/f1_instr.py`, `f1_instr_out.json` (and the `c2-F1-replay/` copies) | `4f931ebc…0c9a`, `cf300011…53b6` | MATCH, as the return's inventory states |
| C1-LA1 `INFORMAL-PROOF.md`, table `SOURCE/ADJ-T-adj_alloc_out.json` vs `sources/c1-results/SOURCE-DIGESTS.json` (`13117a91…c850`, a Stage 2 member) | `16209c9b…34c3`, `7d635805…4b13` | MATCH |
| `sources/r30/records/SEMANTIC-CONTRACT.md` vs `sources/SOURCE-DIGESTS.json` | `ee7ca2e2…9000` | MATCH |
| `sources/r30/lean/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean` (entries 1–3 and 11 read, to fix the favorability index convention) | `86b59c6c…0cb` | MATCH |

**Replay (copy-out-first).** I copied `f1_instr.py` into `scratchpad/c2-crit-F1-T/replay/` and ran it there. It took 15.8 s and
printed four `cut_found=False` lines. It rewrote `f1_instr_out.json` byte-identically (`cf300011…53b6`), so the return's replay
claim holds.

**Read-boundary disclosures (critic's own).**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my context. I did not open or
   use any of them.
2. To find my own section I ran `grep -n '^#'` on the capsule member `control/C2-CRITIC-ATTACK-BRIEFS.md`. That printed the
   one-line heading of every seat's section (T1…U3), and I saw those headings. I used nothing from any section except F1's.
3. I ran two searches inside `sources/`, which is within my grant: a `grep -rn --include='*.lean'` for the favorability
   definitions, and digest lookups in `sources/SOURCE-DIGESTS.json` and `sources/c1-results/SOURCE-DIGESTS.json`. I also listed
   `sources/`, `sources/c1-results/`, the C1-LA1 run folder and the two F1 artifact folders, each non-recursively.
4. **Process listing spill.** Before closing I ran `pgrep -fl "python3 -B"` to confirm I had no running jobs. It matched and
   printed the command lines of other sessions' shells: critic scratch dirs `c2-crit-T2-U`, `c2-crit-F1-U` (the sibling critic
   of this same return; its whole heredoc script text appeared) and `c2-crit-U1-T`. I read no file of theirs and used nothing
   from the listing. My own literal-network check (`literal_quotient.py`, below) had already been written and run before this
   listing appeared; its digest is in the inventory. I killed nothing, since none of those processes are mine.
5. The return was too large to display inline, so the harness saved it to its tool-results folder outside the run root. I read it
   back in full from there.
6. No sibling return, critique, adjudication, other experiment root or external source was read. I read
   `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (a capsule member) in full. It contains other seats' disclosure excerpts
   and CF-C2-G. I did not read the two Stage 4 dispatch-manifest members outside my capsule (`CLAIM-STATUS-LINT-c2-stage3.json`,
   `PATH-CHECK-c2-stage4-dispatch.json`).

A side note on the Stage 3 disclosures index: it summarizes F1 as "none reported". F1's return actually lists five
disclosure items, including two `find` runs inside `sources/c1-results/`. The index therefore understates the return. This is
a controller-record discrepancy, not a defect in F1.

## Independent re-derivation

My own instrument is `crit_instr.py`. It uses integer vertex labels and its own forest DP (exclude/include pairs, product over
components). It shares no code with `f1_instr.py`. At each of `m ∈ {107, 110, 113}` (control rows) and `m ∈ {116, 119}` (fresh
rows) plus `m = 137` (the larger row), it checks the following exactly. All six rows were done before any universal reading;
see the attacks section.

1. **Tree.** `CB(8,m)` has `n = 17m+3` and `n−1` edges, and is connected. `α` is read off the full literal polynomial, which
   has degree `9m+1` at every row.
2. **Closed form.** I also computed `I(CB(8,m))` coefficient-wise by a separate route: the contract's block decomposition
   `Σ_j C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m−j)} + x(1+x)(1+2x)^{8m}`, evaluated by direct binomial sums. It equals the literal
   DP at `k ∈ {1, x, x+1, p*−2, p*−1, p*, p*+1, α}` on every row. This confirms the contract's `G = (1+2x)^8 + x(1+x)^8`, which
   F1 also uses. The allocation's U1 text has the two terms swapped, which is erratum CF-C2-G; F1 found it.
3. **First descent `x`, scanned through `α`** with the terminal zero-extension included:

   | m | p* | α | x | x+2 ≤ p* | 3p* < 2α+1 |
   |---|---|---|---|---|---|
   | 107 | 572 | 964 | 570 | yes | yes |
   | 110 | 588 | 991 | 586 | yes | yes |
   | 113 | 604 | 1018 | 602 | yes | yes |
   | 116 | 620 | 1045 | 618 | yes | yes |
   | 119 | 636 | 1072 | 634 | yes | yes |
   | 137 | 732 | 1234 | 730 | yes | yes |

   The row at 107 reproduces the fixed point of record (`n = 1822`, `α = 964`, `x = 570`). At every row `x = p*−2` exactly, so
   eligibility is tight at the first conjunct.
4. **Derived `F_{p*}`, using the Lean convention of record.** `C4LA1.IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0`,
   where the difference is `i_{p+1}(G−v) − i_p(G−v)` (r30 C1-LA1 `Main.lean`, entries 2–3). I tested `i_{p*+1}(T−t) < i_{p*}(T−t)`
   by a literal DP on the original tree with `t` deleted. I did this for `t = v` and for three private leaves at distinct positions
   (choke 1 leg 1, choke `m` leg 8, and choke `⌊m/2⌋+1` leg 4). All pass at all six rows. The automorphisms of `CB(8,m)` permute
   the chokes, and permute the legs within a choke, transitively on the `8m` private leaves. That extends the result to every
   `c_ij`, so `F_{p*} = leafSet` (`8m+1` tags) at every row.
5. **(WID), checked against the aggregate itself.**
   - Network side: supply − capacity with the active-tag weight counted by Lemma 0, i.e. `#{B : r, v ∈ B}` plus `8m` times
     `#{B : c_ij, u_i ∈ B}`. Each count is an independent-set count of the literal forest `T − N[forced]`. I checked the tag count
     at two different `(i,j)` positions.
   - Aggregate side: `S(T,p*) = Σ_{t∈F} [q_t(p*) − q_t(p*−1)]`, where `q_t(j) = i_j(H_t) − i_j(R_t)`, `H_t = T − {t, s_t}` and
     `R_t = T − N[s_t]`. Each term is a literal forest DP (r30 SEMANTIC-CONTRACT §1.1/§1.2 definitions).
   - The two sides are equal at all six rows, and `S < 0` at every row. `|S|` has 409, 420, 432, 443, 455 and 524 digits at 107,
     110, 113, 116, 119 and 137.
   - Lemma 0 was also checked literally. Over all 33,573 independent sets of `CB(8,1)`, the definition-level `w_F`
     (`F = leafSet`) equals `[r,v ∈ B] + #{c_ij ∈ B : u_i ∈ B}` with zero mismatches.
6. **The C1-LA1 allocation, loaded from the frozen table** (digest re-checked in code; not re-fitted).
   - `θ = 288/L = 96/D`: at the six rows this is `96/766193`, `96/809675`, `96/854357`, `96/900239`, `96/947321` and `96/1255013`.
   - Nonnegativity holds on every state.
   - My own knapsack DP over the `m` chokes gives `min ΣOut` over `Σn = K` equal to exactly 1, and `max ΣIn` over `Σn = K−1`
     equal to exactly 1, at every row.
   - Switch ratios `(8−γ)σ(γ)/(θγ)` are `(1,1,1,1,1,1,1/2)`.
   - Residual `θ ≤ 1 − ρ_1` holds, with margin `(1−ρ_1)/θ` of 34.9009, 35.8774, 36.8540, 37.8306, 38.8071 and 44.6665. The 107
     value reproduces the fixed point of record, 34.90.
7. **Criterion condition (i).** `ρ_q = r_q(p*−q)/r_q(p*−q−1)` is `< 1` for every `q ∈ [1,m]` at every row, and `ρ_1` is the
   largest. My `ρ_1` values equal F1's at 110, 116, 119 and 137. At 110, `ρ_m = 273637/324323`, which also matches F1.
8. **The scaling step, which F1 did not compute** (critic-derived; `scaled_load.py`). Every sector source is normalized to
   outflow exactly 1, and the exact inflow of each target is then recomputed.
   - Per-state slack analysis (`tight_out.txt`): `In` meets its affine bound on every state with `β+γ ≤ 7`.
   - `Out` meets its bound on every state except `(0,0)`, `(0,2)`, `(0,3)`, `(0,4)` and `(0,5)`.
   - The slacks are `m`-free and equal the table's `out_slack`/`in_slack`.
   - So an in-sector target whose chokes all avoid `(0,0..5)` and `β+γ = 8` has every preimage at outflow exactly 1. Its
     post-scaling load is exactly 1. An explicit profile is `(1,4)`×`(6m−K+1)` and `(1,5)`×`(K−1−5m)`; its load computes to
     exactly `1` at 110, 116, 119 and 137.
   - A profile containing a `(0,1)` choke falls strictly below 1 (for example `0.99999980` at 110).
   - For switch images, the post-scaling maximum ratio is exactly `ρ_1 + θ` for `γ = 1..6`, and exactly `ρ_1 + θ/2` for `γ = 7`.
     Both are attained by preimages whose other chokes are out-tight.

## Attacks and findings

**A1 — Fidelity: F1's favorability test sits one rank low (strikes F1's `F_{p*}` evidence).**
- F1's code tests `Iv_lit[pstar] < Iv_lit[pstar-1]` and `Ic_lit[pstar] < Ic_lit[pstar-1]`, i.e. `i_{p*}(T−t) < i_{p*−1}(T−t)`.
- That is `Δ_{p*−1}(T−t) < 0` in the convention of record, not `Δ_{p*}(T−t) < 0`. The return's prose defines Δ as a backward
  difference ("`Δ_{p*}(T−t) < 0`, i.e. `i_{p*}(T−t) < i_{p*−1}(T−t)`"), while its `x` uses the forward one.
- So F1 derived `F_{p*−1}`, not `F_{p*}`. Under protocol duty 2, F1's `F_pstar_equals_leafSet: true` is struck, along with every
  number F1 computed with `F = leafSet` on that authority (supply, capacity and the sign of S).
- **Reinstated by the critic.** The correct-index test (re-derivation item 4) gives `F_{p*} = leafSet` at all six rows. F1's
  downstream numbers are therefore correct in value, but they rest on the critic's derivation, not on F1's.

**A2 — Fidelity: F1 never asserted (WID) itself.**
- The contract's (WID) is `supply − capacity = S(T,p*)`, the complete aggregate `Σ_F[q_v(p) − q_v(p−1)]`, asserted from
  independent sides.
- F1 defines `S := supply − capacity` (in code, `S = supply_f - cap_f`) and never computes the aggregate. Its "two independent
  routes" are two counts of the same network-side totals, both built on the same Lemma-0 decomposition.
- The per-tag route "literal brute force" enumerates `2^7` subsets of one factor that is otherwise the same formula.
- So "(WID) from two independent sides" is struck. What F1 actually did is a two-route count of supply and capacity.
- **Reinstated by the critic**: (WID) holds exactly against the aggregate at six rows (re-derivation item 5).

**A3 — A false universal literal (fresh-row discipline, gate ruling 9).**
- F1 §3 says: "Where `m ≥ 107` enters: nowhere in this section — the descent check and the identity hold at any `m` in this
  residue class".
- This is false. I scanned `x` through `α` literally for every `m ≡ 2 (mod 3)` with `2 ≤ m ≤ 104` (`small_m_descent.py`).
  `x + 2 ≤ p*` FAILS at every such `m ≤ 83`: for example `m = 2`: `x = p* = 12`; `m = 83`: `x = 443 = p*−1`. It holds at
  `86 ≤ m ≤ 104`.
- So the lower bound on `m` is load-bearing for eligibility. The literal is struck.
- The observation that in this bounded range eligibility at `p*` first holds at `m = 86` is `bounded_computation`, critic-derived,
  and makes no claim beyond 104. Nothing in the class (`m ≥ 107`) is affected.

**A4 — The switch-image literal.**
- F1 writes "its load ratio is exactly `ρ_1 + θ`, independent of `γ` (the `γ` cancels)", and its code hard-codes
  `combined = rho1_val + theta` for every `γ`.
- The table gives `(8−γ)c_γ = 7/2` at `γ = 7`, so the γ=7 class is loaded at `ρ_1 + θ/2`, and after scaling every member is at
  most its unscaled value.
- Correct statement: the class maximum is exactly `ρ_1 + θ`, attained for `γ = 1..6`, and `ρ_1 + θ/2` for `γ = 7` (item 8).
  "Exactly … independent of γ" is struck.
- Consequence: nil for feasibility, because `ρ_1 + θ ≤ 1` is C1-LA1 (v).

**A5 — "The scaling step" was not computed. The critic has now computed it.**
- The allocation asked for "the exact load on every target class, including … the scaling step". F1 reported only unscaled
  template bounds (`max ΣIn`, `ρ_1+θ`).
- Item 8 closes this. After scaling, the in-sector maximum is still exactly 1 and is attained, so F1's headline "max load ratio 1
  at the in-sector class" survives, now as an exact post-scaling fact at four rows.
- The flow of record is tight at in-sector targets. Any formal composition must therefore use `ΣIn ≤ 1` non-strictly, and has no
  slack to spend there.

**A6 — "Literal network" is a label, not a computation. The critic filled the bridge on small instances.**
- F1 builds no (D) ∪ (S) arc at any row. Its loads are the template's per-choke functions. The composition's reduction is the
  proved_informal row key; SOLUTION-CONTRACT §3.4 says the template is valid for the literal network only through a PROVED
  reduction.
- F1's cut search ("structured source families") was replaced by the DP over choke-state assignments. That DP tests template
  constraints, not cuts.
- Critic check (`literal_quotient.py`). The relation is generated generically from adjacency and the weights literally from
  the active-tag definition (`F = leafSet`). The runs cover every sector source of `CB(8,2)` with `K ∈ {1..4}` legs and of
  `CB(8,3)` with `K ∈ {1..3}`: 51,456 sources, 6,146 in-sector targets and 4,004 switch images. The checks are:
  - the arc list is exactly `K+2` deletions, the `s`-switch, and one `u_i`-switch per choke with `β_i = 1`;
  - deleting `r` or `v`, the `s`-switch and `(1,0)`-switches reach weight-0 targets;
  - every leg deletion reaches an in-sector target of weight 1;
  - every `u_i`-switch image is `r`-free, has exactly one choke, and has weight `γ_i`;
  - every in-sector target has exactly `Σ_i 2(8−n_i)` sector preimages;
  - every switch image of weight `γ` has exactly `8−γ` sector preimages.
- Result: zero violations. This is bounded structural evidence for the quotient, at small `m'` and all ranks up to `K`. It is not
  a proof, and it is rank-generic rather than at `p*`.
- On F1's Finding 3 (no second doubly-fed class): its structural argument is correct. It rests on E1 being deletion-only from
  `r`-free sources, which is a property of the cited criterion key, and on the sector arc types listed above.

**A7 — Unbacked asymptotic.**
- Finding 2 and Remaining obligation 1 assert that `1 − ρ_1` "shrinks like `Θ(1/m)`", with no constant and no remainder. It is
  not used in any proof, so it is only flagged.
- Bounded observation: `m(1−ρ_1)` is 0.46790 at 107, 0.46809 at 137, 0.46857 at 500 and 0.46870 at 2000, consistent with a
  limit near `15/32`. This is `conjecture` grade, critic-observed.

**A8 — Minor certification literals** (struck or corrected; see the certification audit):
- the "`9^m`-shaped" state space (there are 45 states per choke, so it is `45^m`, collapsed exactly by the per-`n` reduction);
- "`θ = 96/(200m²+82m+5)`" in Remaining obligation 2 (the right value is `288/(200m²+82m+5) = 96/D`; the code uses 288);
- "`S` … magnitude 422–526 digits" (those are the digit counts of supply and capacity; `|S|` has 420–524 on F1's rows);
- "Exact fractions for every entry are in `f1_instr_out.json`" (supply and capacity are stored truncated to 30 digits; `S` and the
  per-γ switch ratios are not stored);
- the garbled m=116 table cell ("0.995966→0.996072"; the true value is `ρ_1+θ = 0.9960725`);
- the self-interrupting sentence at §1 (lines 124–126).

**What survives F1 unchanged:**
- the tree fidelity, and the closed forms `I`, `I−v`, `I−c` against the literal DP;
- `x = p*−2` at each row;
- `min ΣOut = max ΣIn = 1`, Switch and Residual at 110, 116, 119 and 137;
- the exhaustive `ρ_q < 1` sweep with its maximum at `q = 1`;
- no cut found;
- the `G` erratum (Finding 4).

All of these reproduce exactly on my instrument.

## Mechanism-equivalence and fence check

- **Mechanism.** F1 proposes none. It is an adversary route with bounded confirmation, so it has no alias risk. Its keys-touched
  list is the contract's §4 set plus the four Cycle 1 r31 keys, cited at their grades. No key is proposed, and none is needed.
- **One rank, the class only.** Every number is at `p*(m)` on `m ∈ {110, 116, 119, 137}`, with critic controls at 107 and 113. A3's
  small-`m` scan lies outside the class. It is reported only to strike F1's universal literal, and it claims nothing about (HALL)
  there.
- **Darroch/Newton.** Neither is used by F1 or by me. Every comparison is between exact integers.
- **θ\* law.** It is not used as a hypothesis. `θ = 288/L` is the formally verified allocation's defined value (C1-LA1), not an
  optimality claim.
- **Census discipline.** F1 states correctly that its rows are not a proof. It has one lapse: the struck A3 universal literal.
- **Status transfer.** None. (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN. `S < 0` at these rows is
  a numerical fact, not a FLOW⇒SIGN consequence of any new theorem.
- **Refuted mechanisms.** None revived. `E993-TREE-REAL-ROOTED` is not applied.
- **Template vs network.** A6 above. F1 relies on the row key for the reduction. The critic's small-instance literal check
  supports the quotient's arc structure, but it is not the PROVED reduction the contract requires. That remains U2's node.

## Certification audit

| Literal in the return | Evidence shipped | Ruling |
|---|---|---|
| "`F_pstar_equals_leafSet: true`" / "derived `F_{p*}`" | test at rank `p*−1` (A1) | **STRUCK** as F1's evidence; true at `p*` by critic re-derivation |
| "(WID) from two independent sides", "`WID_two_independent_sides_agree`" | two counts of the network side only; aggregate never computed (A2) | **STRUCK** as (WID); true against the aggregate by critic re-derivation |
| "the descent check and the identity hold at any `m` in this residue class" | none; false at every residue-2 `m ≤ 83` (A3) | **STRUCK** |
| switch-image ratio "exactly `ρ_1+θ`, independent of `γ`" | hard-coded; false at `γ = 7` (A4) | **STRUCK**; replace with "maximum `ρ_1+θ` (γ ≤ 6), `ρ_1+θ/2` at γ = 7" |
| "compute the exact load … including the scaling step" (obligation) | not computed (A5) | **NOT DELIVERED by F1**; delivered by the critic (max exactly 1, attained) |
| "literal network" (route title, "exact load on every target class") | template loads only (A6) | **NARROWED** to "template/quotient loads" |
| "EXHAUSTIVE … over all `9^m`-shaped state-assignment space" | exact per-`n` DP over `45^m` | corrected (`45^m`); the exhaustiveness claim for ΣOut/ΣIn **stands** |
| "`θ = 96/(200m²+82m+5)`" (Remaining obligation 2) | code uses `288/L` | **STRUCK** (typo; `288/L`) |
| "`S` … magnitude 422–526 digits" | supply/capacity digit counts | **STRUCK**; `|S|` has 420–524 digits |
| "Exact fractions for every entry are in `f1_instr_out.json`" | supply/capacity truncated; S absent | **STRUCK** |
| "`Θ(1/m)`" shrinkage | no constant or remainder (A7) | unbacked asymptotic; flagged (not load-bearing) |
| `x = p*−2`, closed forms, Out/In = 1, Switch, Residual, all-`q` `ρ_q < 1`, `ρ_1` values, `cut_found: false` | exact replay + critic instrument | **BACKED** |
| replay digest `cf300011…53b6`; inventory digests | replayed byte-identically | **BACKED** |
| verdict `bounded_evidence` | — | stands, narrowed as below |

## Verdict

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

**What is retained, and its grade.** The retained statement is graded `bounded_computation`, with no key proposed. At
`m ∈ {110 (control), 116, 119 (fresh), 137 (larger)}`, each numerical hypothesis of the assembled Tier 1 chain holds exactly at
`p* = (16m+4)/3` on `CB(8,m)`:
- tree, `α = 9m+1`, and `x = p*−2` (scanned through `α`);
- eligibility;
- `F_{p*} = leafSet` at the correct index;
- (WID) against the aggregate, with `S < 0`;
- C1-LA1's Out/In/Switch/Residual, with `min ΣOut = max ΣIn = 1`;
- criterion condition (i) for every `q`, with `ρ_1` maximal.

Under the carried composition, the rows add these facts:
- the post-scaling in-sector maximum load is exactly 1 and is attained;
- switch images are loaded at most `ρ_1 + θ < 1` (`ρ_1 + θ/2` at γ = 7);
- no deficient cut was found.

The composition is `proved_informal`, and the criterion and favorability keys are cited at their grades. The narrowing:
- The `F_{p*}` and (WID) fidelity items and the scaling step stand on the critic's re-derivation, not on F1's.
- "Literal network" means template/quotient loads, backed by the critic's small-instance literal arc check.
- Five literals are struck (see the audit).

Nothing here resolves the headline. The mathematics of this confirmation is complete at the four rows, and it is a finite check,
not a proof of any universal statement.

**Critic-derived advances** (attributed to C-F1-T; bounded or confirmatory; none proposed for registration here):
- (i) (WID) against the aggregate at six rows.
- (ii) `F_{p*}` at the index of record at six rows.
- (iii) The exact post-scaling loads, including the tightness of the in-sector class and the out/in-tight state sets.
- (iv) Eligibility at `p*` fails for every residue-2 `m ≤ 83` and holds on `86..104` (`bounded_computation`).
- (v) C1-LA1's N8 polynomial `Q(p)` re-derived by an independent telescoping expansion. All ten coefficients equal the record,
  and the identity checks numerically at `m = 110`. This discharges F1's Remaining obligation 2, confirmatory of a formally
  verified node.
- (vi) The small-instance literal (D) ∪ (S) check of the sector quotient.

## Remaining obligation

Exact, for this route's line:
1. **Nothing further is owed for the four-row confirmation.** Items A1, A2 and A5 are repaired by the critic's instrument.
2. **The template-to-network reduction** (SOLUTION-CONTRACT §3.4) is still only `proved_informal`.
   - It must be proved on the face, or formalized over `cbGraph` (U2's node).
   - Its nodes: the literal arc list from a sector source, in-sector preimage count `Σ 2(8−n_i)`, switch-image preimages `8−γ`,
     and weight-0 targets for `r`/`v` deletion, the `s`-switch and `(1,0)`-switches.
   - The critic's check supports the arc structure only on `CB(8,2)`, `K ≤ 4` and `CB(8,3)`, `K ≤ 3`.
   - The composition must use `ΣIn ≤ 1` non-strictly, because the post-scaling in-sector load equals 1 exactly.
3. **Tier 1's open items are unchanged by this route.**
   - Conjunct 2: (ELIG-top)(a) for every class `m`, via the `S_5` certificate and the `cbGraph` coefficient link.
   - Conjunct 4: the composition with the criterion flow, formal.
   - Favorability Darroch/Newton-free.
   - The A3 scan shows the `m`-lower bound is essential to (E), so no formal statement of (E) may drop `107 ≤ m`.
4. **Successor hygiene.**
   - Use the forward convention `Δ_p(T−t) = i_{p+1}(T−t) − i_p(T−t)` for the selector. F1's `i_{p*} < i_{p*−1}` is the rank-`p*−1`
     selector.
   - Assert (WID) against `Σ_F[q_v(p) − q_v(p−1)]`, not as a definition of `S`.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F1-T/`.
Everything ran as `python3 -B`, standard library only, in the foreground; no background job was started.

| File | SHA-256 | Role |
|---|---|---|
| `crit_instr.py` | `e5a053da9da31a627f3a6d6ae9d04aab6391d788681a716a5bbcc6eece3da855` | independent instrument: literal forest DP, block-decomposition cross-check, `x` through `α`, `F_{p*}` at the index of record, (WID) vs aggregate, allocation DP, all-`q` `ρ_q` |
| `crit_instr_out.json` | `fd6ac125c623c3d4ddb6a65cebdff847cf023a195c106f63aa3194039195a281` | output at `m = 107, 110, 113, 116, 119, 137` (`python3 -B crit_instr.py 107 110 113 116 119 137`, 32 s) |
| `small_m_descent.py` / `small_m_descent_out.txt` | `67e79bb6c226222d5167bb94a14ad3ce3df810d58b69e3c1c41afd49dd85e32c` / `e1d8b6038fdae81e127b04989c7ce907c9b8c5d011c47228c1c700428fba6c2c` | A3: eligibility scan on residue-2 `m ≤ 104` |
| `tight.py` / `tight_out.txt` | `4d37ea488a4b3e89f1a401ec7991284cccab198625fab315e0c084a91ab2b8ae` / `8a0a20bfbd26d995a7df890eebaf4e6663d6e8ae40ccd0010a7e6bec0741eac3` | out/in-tight state sets; slacks equal table |
| `scaled_load.py` / `scaled_load_out.json` | `6c4175afdf2795f87408347580d5d9e86942b226712ac2a0a3853fc178084425` / `54c6fc9b010a0f77a56aadb131030840efb7efdb44fe89d422b12cd2a43df63f` | A4/A5: exact post-scaling loads |
| `literal_quotient.py` / `literal_quotient_out.json` | `2e8afb585b8f1fd3289acf1b49026c23ddc7c6f4f7e08657e571a28474fe1ef2` / `978d0f20d26907eafedff0bc283e36b6fc03b1bcf311d3ac4119da2ce3fbb780` | A6: Lemma 0 on all independent sets of `CB(8,1)`; literal sector-quotient check on `CB(8,2)`, `CB(8,3)` |
| `n8_rederive.py` / `n8_out.json` | `addf5fe625c593f5745b1f8620be70fc340901bdacfa04f9241938af26ad25f5` / `05e94af527f7d0e3bdc71173274e163eb7e887229a9af0946c4bbdd1613c9655` | advance (v): N8 `Q(p)` re-derived; equals the C1-LA1 record |
| `replay/f1_instr.py`, `replay/f1_instr_out.json` | `4f931ebc2928499c8f65e1f9524d979f40a7ef33f02b8afc6bc18eb9d4210c9a`, `cf300011a0e027326c276ee23dcef1ddf4fb221c98af4b8a074347505f4953b6` | copy-out-first replay of F1 (byte-identical output) |

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
