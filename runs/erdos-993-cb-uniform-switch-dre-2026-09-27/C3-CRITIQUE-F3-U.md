# Critique

Critic `C-F3-U` (Cycle 3, Stage 4; orientation U, formal/structural) of seat `F3`, route `C3-F-03`, mechanism token
`E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY` (orientation F).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file outside this run root. The
project `CLAUDE.md` and the user auto-memory index were injected by the host at session start; I did not open them.

**Read boundary.** I read the dispatch; the capsule `control/c3-critic-capsules/F3-PACKET-MANIFEST.json` and each member it
lists (the protocol, common brief, F3 section of the attack briefs, both contracts, allocation, Stage 1 gate,
`sources/SOURCE-DIGESTS.json` (I checked the digest only, then did targeted lookups), the Stage 2/3/4 manifests, the Stage 3
read-boundary disclosures (F3 entry), `PATH-CHECK-F3.json`, the return). I also read these frozen sources, which are
authorized: C1-LA1 `Main.lean` (entries 11, 29, 30, 32 only);
`sources/c2-results/cycles/cycle-2/stage6/SYNTHESIS.md` lines 125–130 and 170–180 (X-8, X-9, and the named bridge);
`sources/r30/records/SEMANTIC-CONTRACT.md` lines 20–60 (the (WID) and `q_v` definitions); and a lexical key scan of
`sources/authority/CLAIM-IDENTITY.json`. Every search I ran named one granted file (a `grep` inside one file). I also ran
one non-recursive `ls` of `sources/authority/`. The seat's generator and digest file were copied out by name from
`scratchpad/c3-F3/` into my scratch directory. For the digest cross-checks in duty 1, I hashed the Stage 2 members
`control/C3-WORKER-COMMON-BRIEF.md`, `OBLIGATIONS.csv` and `control/CLAIM-IDENTITY.run-local.json`, which the return
lists. I did not read their contents. I did not read or hash `cycles/cycle-3/stage2/ROUTE-STATE.md`. I read no other
return, no critique, no adjudication, no other experiment root, and nothing from the network. I installed nothing. I did
not run Lean.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage4/DISPATCH-C-F3-U.md` (file SHA-256) | `d879e9678d5d344db15edb63c604ce53b8d4e692d7be02548fce176742b3c419` | MATCH |
| **Capsule seal** `F3-PACKET-MANIFEST.json` (canonical JSON without `seal_sha256`) | **`a3f7a5a35dc78be8cfd7ce676af628ef22b0d33e9a37182e48ec489f17bf6a66`** | MATCH; all 14 members match on bytes and SHA-256 |
| Stage 4 dispatch manifest seal | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | MATCH (self-consistent canonical seal) |
| Stage 3 packet manifest seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | MATCH; lists the return at `f089f9a8…fd4cf1` and `DISPATCH-F3.md` at `c4323a23…a49e74`, both equal to what the return states |
| Stage 2 packet seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | MATCH (charter value) |
| Return `cycles/cycle-3/stage3/returns/F3/RETURN.md` | `f089f9a8656a33d983e03082266f322795b0f6b93ec7da7d15e76e2877fd4cf1` | MATCH |
| The 13 file digests the return lists (contracts, allocation, gate, worker brief, `OBLIGATIONS.csv`, run-local claim identity, Cycle 2 synthesis, the three Cycle 2 critic scripts, C1-LA1 `Main.lean`, `F3/cb_lib.py`) | recomputed on the bytes; each also equals its Stage 2 manifest entry | 13/13 MATCH |
| `cycles/cycle-3/stage2/ROUTE-STATE.md` (`32dd0e1e…`) | not recomputed (outside my grant) | UNVERIFIED by this critic |
| Seat generator `scratchpad/c3-F3/f3_arc_adapter.py` | `99d11bbc9f51da8eecbf9c79d5f88f19ee753a7d904d0c3ddef9ad18dc2aa82c` | MATCH |
| Seat output digest (copy-out replay in `scratchpad/c3-crit-F3-U/replay/`) | `b65c2b0e2695880ca3de8ac38fe780d4e79405ecccf2fec3c90353a9af5639fc` | REPLAYED byte-identically |

The route ID, mechanism token and orientation are verbatim on the return. The return's model disclosure has both parts.

**Registry keys touched** (named before any evidence is used):
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`). X-8 is its explicit
  arc-level form.
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal` modulo
  Darroch on the `r_q`). This key supplies `ρ_q ≤ 1`.
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN; unaffected).
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` ((WID), which my instrument asserts).
- `E993-TREE-REAL-ROOTED` (REFUTED; nobody invokes Newton or Darroch).

Neither the return nor this critique proposes an `E993-R31-` key. On the lexical alias check, the frozen master
(`sources/authority/CLAIM-IDENTITY.json`, 544 keys) has no `R31` key and no arc-value, zero-row or type-path key.
Mathematically, everything below is a proof node of the criterion key (X-8 and X-9 of the Cycle 2 synthesis), not a new
claim.

## Independent re-derivation

I built the instrument `scratchpad/c3-crit-F3-U/crit_f3u.py` (standard library only, exact integers and `Fraction`) from
the contracts and r30 §1.1–1.2, not from the seat's code. It first reproduces the fixed points of SEMANTIC-CONTRACT §5
(`fixedpoints.py`):
- `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`.
- `CB(8,95)`: `n = 1618`, `α = 856`, `x = 506`, `ρ_1 = 1354839571516225/1361543988640524`.

Both come from the contract's `G = (1+2x)^8 + x(1+x)^8`. `x` is scanned through `α` with zero extension.

**Structure (proved here, one line each).** Take `W_{c_ij} = {u_i}` and `W_v = {r}`. Then for every independent `B`:

`w_F(B) = #{c_ij ∈ B ∩ F : u_i ∈ B} + [v ∈ B ∩ F][r ∈ B]`

Since `r ∈ B` excludes every `u_i`, this gives:
- the **zero-weight classification**: an `r`-free `B` has `w = #{present private leaves at present chokes}` (given
  `C ⊆ F`), and `v` is never active in it;
- a `B` containing `r` but not `v` has weight 0.

For `r ∉ B` with choke set `Q` (`|Q| = q`), the other vertices of `B` split into two kinds:
- binary "active" slots: the `c_ij` with `i ∈ Q`, `8q` slots;
- ternary slots: the `8(m − q)` legs of absent chokes (state empty, `b_ij` or `c_ij`) plus the arm (state empty, `s` or
  `v`), `b = 8(m − q) + 1` slots.

So a source has `|B| = q + w + β`, and `β = j − α` with `α = w − 1` and `j = p − q`. The return describes the arm slot as
coming "from vertex `s`". In fact that slot holds either `s` or `v`. The return's conclusion `β ∈ {0,1}` at `q = m` is right.

**Theorem (C-F3-U-A1, critic-derived; X-8 exactness on every class, all boundary cases).** Let `a, b ≥ 0` and `j ≥ 1` be
integers, and put `r(k) = Σ_α N(a,b,α,k)`. Assume `r(j−1) > 0`, that is `j − 1 ≤ a + b`. Take `S, T, G, H` as in X-8 with
`ρ = r(j)/r(j−1)`. Then:
1. **(row)** `G_α + H_α = S_α` for every `α`.
2. **(class in-balance)** `G_{α+1} + H_α = ρ·T_α` for `0 ≤ α < a`, and `H_a = ρ·T_a` (there is no source class `a + 1`).
3. **(per-target load)** A target of class `α'` receives two kinds of arc:
   - `a − α'` tag arcs, each of value `G_{α'+1}/S_{α'+1}`;
   - `2(b − β_A)` ternary arcs, each of value `(α'+1)·H_{α'}/((j−α')·S_{α'})`.

   Using `S_{α'+1} = T_{α'}(a−α')/(α'+1)` and `S_{α'} = T_{α'}·2(b−β_A)/(j−α')`, the total is
   `(α'+1)(G_{α'+1} + H_{α'})/T_{α'} = ρ·(α'+1) = ρ·w_F(A)` exactly. This includes the degenerate case `β_A = b`: there
   `S_{≤α'} = T_{<α'} = 0`, so `H_{α'} = 0` and `G_{α'+1} = ρT_{α'}`.
4. **(β = 0 boundary)** At `α = j` we have `S_i = 0` for `i > j` and `T_i = 0` for `i ≥ j`. So `Sc(j) = r(j) − S_j` and
   `Tc(j) = r(j−1)`, which give `G_j = S_j` and `H_j = 0`, identically. The row is carried by the tag arcs alone.
5. **(nonnegativity; this re-derives X-9, Darroch/Newton-free)** Clear the positive denominator `r(j−1)`:
   - `G_α ≥ 0` is equivalent to `S_{≥α}T_{<α} ≥ T_{≥α}S_{<α}`. This follows termwise, because for `i < k`,
     `S_kT_i ≥ S_iT_k` is the log-concavity `C(b,y)C(b,x−1) ≥ C(b,x)C(b,y−1)` (with `x = j−i > y = j−k`) of a binomial
     row. That row has no internal zeros, so the inequality is zero-safe.
   - `H_α ≥ 0` is equivalent to `T_{≥α}S_{≤α} ≥ S_{>α}T_{<α}`. This follows because for `i < k`,
     `S_{k+1}T_i ≤ S_{i+1}T_k` is the log-concavity `C(a,k+1)C(a,i) ≤ C(a,i+1)C(a,k)`, and `S_0 ≥ 0`.

   These are statements about binomial rows only. No polynomial mode or real-rootedness is used.

**Consequence.** On `CB(d,m)` at any rank `p`, assume three things:
- `C ⊆ F`;
- every `r`-free positive-weight source has `j = p − q ≥ 1`;
- `p − q − 1 ≤ dm`.

Then the X-8 arc values form a nonnegative flow on literal (D) arcs. It saturates every `r`-free positive-weight source
exactly and loads every `r`-free target with `q ≥ 1` at exactly `ρ_q·w_F(A)`. Every other target receives 0: `r ∈ A`
targets are unreachable from `r`-free sources, `q = 0` targets receive only choke-deletion arcs of value 0, and `w = 0`
targets receive only tag arcs from `α = 0` sources, which have value `G_0 = 0`. Capacity then reduces exactly to
`ρ_q ≤ 1`.

At `(8, m, p*)` with `m ≥ 1`, every `q ≤ m` has `p* − q ≥ p* − m = (13m+4)/3 ≥ 1` and `p* − q − 1 < 8m`, so all hypotheses
hold on the whole class. `C ⊆ F` is the carried favorability (X-7), recorded as the C2-LA3 award by the allocation's current-state note, which I did not re-verify.

Grade: `proved_informal`, STATED at a review stage (an isolated second read is owed). Items 1–3 and 5 restate or re-derive
X-8/X-9 of record. Items 3's degenerate case and 4, and the exact domain `j ≥ 1`, close the return's Remaining
obligations 1 and 4.

**Exact computations (critic instrument, output digest `6aefe4ea2b6dc69dc7666d83dd5e4fa7b1758eefd64f95ec949388a231a0798e`).**

| Part | Scope | Result |
|---|---|---|
| P1 generic identities | every `a, b ∈ [0,25]`, every `j ∈ [0, a+b+1]` (17,576 defined triples) | 0 failures of (row), (in-balance), (top), (per-target load from literal arc counts), (β=0), `G ≥ 0`, `H ≥ 0`. `ρ` is undefined in exactly the 676 triples with `j = 0` |
| P2 class quotient | `m ∈ {107,110,113,116,119,122}` (controls) and `{125,128,140}` (fresh, ruling 17); EVERY `q ∈ [1,m]`, every `α` | `j ≥ 1` always; 0 negative `G` or `H`; `ρ_q < 1` for every `q`; `argmax_q ρ_q = 1` at every row |
| P3 `cb8R1` bridge | the same 9 rows, every `k ∈ [0, 8m+2]` | Lean entry 11, transcribed with ℕ-truncating subtraction, equals the coefficient of `(1+X)^7(1+2X)^{8m−7}` computed by **iterated convolution** (no binomial formula): 0 mismatches. C1-LA1's residual lemma uses index `(16m+1)/3 = p* − 1 = K` at every row |
| P4 literal instances | `CB(8,1)`, `CB(2,3)`, `CB(3,2)`, `CB(4,2)`, `CB(2,4)`, `CB(3,3)` at every rank; `CB(8,2)` at ranks `1..5` | tree checked; selector DERIVED (`i_{p+1}(T−t) < i_p(T−t)`); **(WID)** checked two ways at every rank (enumerated supply − capacity against `Σ_F[q_v(p) − q_v(p−1)]` from a tree DP): 0 failures; zero-weight formula: 0 failures; X-8 flow under the hypothesis `C ⊆ F`: 0 row failures, 0 column failures (exact `ρ_q·w_A`), 0 negative arcs, with `q < m` exercised (for example `q ∈ {1,2,3}` on `CB(2,4)` and `CB(3,3)`) |

Disclosure on P4: **none of these literal instances is eligible**. For example, `CB(8,1)` has `x = 6` and `⌊2α/3⌋ = 6`,
and `CB(8,2)` has `x = 12` and `⌊2α/3⌋ = 12`. They test only the rank-generic algebra of X-8. They are not (HALL)
instances and not sign instances.

## Attacks and findings

1. **Fidelity: the seat never derives the selector; its "literal" instances run a counterfactual network (narrows Tests F
   and G).** The return sets `F = leafSet` and justifies this with "leafSet = {v} ∪ C". That confuses `leafSet` with
   `F_p`. My derived selector gives `F_p(CB(8,1)) = ∅` at `p = 2..5`, and `F_p(CB(8,2)) = ∅` at `p = 1..5`. So:
   - on the network of record, every source in Witness 1 (`CB(8,2)`, `p = 2`) and Witness 2 has weight **0**, and nothing
     is required of it;
   - the "19,520 zero-weight sources" and the `p = 2..5` counts describe a hypothetical selector.

   The return also asserts no (WID) and checks no eligibility. Both `CB(8,1)` and `CB(8,2)` are ineligible at every rank,
   against r30 §1.1 and gate ruling 18. What survives is narrower: Tests F and G are valid **tests of X-8 under its own
   hypothesis `C ⊆ F`**, not observations of the literal network. At `p = 6..9` on `CB(8,1)`, `C ⊆ F_p` and the two
   selectors agree on every `r`-free set. The phrase "literal (not merely closed-form) confirmation of the Test C corner"
   is struck.
2. **Test F exercises only `q = m = 1` (`b = 1`).** All 757 positive-weight sources in the `CB(8,1)` sweep have `q = m`.
   The generic regime of X-8 (`q < m`, `b > 1`) is represented only by Witness 2, which is one source, row only, with no
   column check. My P4 supplies the missing literal coverage of `q < m` on six small trees with columns, and P1/P2 cover
   it in closed form.
3. **Test B: the "REFUTED" label is too broad, and the shipped summary contradicts the prose.** As item 4 of A1 shows,
   `β = 0 ⟹ H_α = 0` is **true** for every `α ≥ 1`. It fails only at `j = α = 0`, where `ρ` is undefined. There the seat's
   guard `rho = 0 if r(j−1) = 0` produced the "counterexample". The accurate record is: "holds exactly when `j ≥ 1`;
   undefined at `j = 0`". Separately, the replayed output ships `"out_identity_holds_for_al_ge_1": false`, because the
   expression `all(f[2] != 0 for f in fails)` is inverted. The prose claim is backed only by the sibling flag
   `all_failures_are_al_equal_0: true`. The return does not disclose the contradicting literal. "0 failures among 4,480
   checks other than α=0" should read "4,480 checks, 105 failures, all at `α = j = 0`".
4. **The Test C corner is the domain boundary of `ρ_q`.** `α = β = 0` means `j = 0`, that is `p = q`. There `r_q(j−1) = 0`,
   so X-8 is undefined rather than "defective in principle". There is also a structural fact: a weight-1 source `Q ∪ {c}`
   at `p = q` has no positive-weight deletion neighbour, so no deletion-only flow can serve it. On unreachability I agree,
   exactly and for every class `m`: `p* − m = (13m+4)/3 ≥ 1`. The sweep "checked for `m = 1..200`" is redundant. The corner
   is off-class and ineligible, so it is not a cut. My P4 also finds the corner literally on `CB(8,1)` at `p = 1` (8
   sources with undefined `ρ`), which the seat's sweep (`p ≥ 2`) missed.
5. **Test E is tautological; "definitional unfolding / unfold-level" is struck.** The Python functions `cb8R1` and
   `rr(7, 8m−7, ·)` are the same finite sum, so their equality says nothing about the bridge the Cycle 2 synthesis names:
   `(((1+X)^7(1+2X)^{8m−7} : ℤ[X]).coeff k : ℚ) = cb8R1 m k`. That identity is true, as a standard Cauchy product, and my
   P3 checks it exactly by independent convolution at 9 rows and every `k`. Its Lean proof is not an `unfold`, though. It
   needs `Polynomial.coeff_mul` over `antidiagonal k`, the coefficient of `(1+2X)^n` (`C(n,i)2^i`), the coefficient of
   `(1+X)^7`, and a reindexing onto `range (min 7 k + 1)` that drops the vanishing terms with `i > 7`. Remaining
   obligation 3 calls `cb8R1_expand_top`/`_sub` (entries 29–30) "the two pieces". I read both statements. They expand
   `cb8R1` at `k = a+8` and `k = a+7` into binomials and never mention `ℤ[X]`. That attribution is struck. The allocation
   records T2 as having compiled this bridge. I did not read T2 and do not rely on that.
6. **Test D is narrower than stated.** `support_within_b1` checks `S` only (`T` is supported at `j − α ∈ {1,2}`), and
   `ρ_m < ρ_1` compares only two of the `m` ratios. My P2 closes the gap at the nine ruling-17 rows: `ρ_q < 1` for every
   `q`, and `q = 1` is the argmax. This is bounded evidence for the threshold key's `ρ_1 = max`, not a proof.
7. **ℕ-subtraction and hypotheses.** Everything the return lists holds (`8m − 7`, `p − q`, `j − α`, `p* − m`). One site is
   missing: `j − 1 ≤ a + b` is needed for `r(j−1) > 0`. It holds at `p*`.
8. **Zero-weight classification "verified by construction" is circular.** A generator that skips a class of sources
   cannot confirm what that class is. The statement itself is one line (see the re-derivation), and my P4 checks it on
   every enumerated set with 0 failures.

No inequality has the wrong direction. No asymptotic step, `≈`, `M_0`, Newton or Darroch appears in the return, and none
is needed.

## Mechanism-equivalence and fence check

- The mechanism is the r30 mark-clone deletion flow E1 in its explicit X-8 form. That is not a refuted mechanism (§3.6
  list; ruling 20's (G′) is not used). No Newton or Darroch is applied to `I`, `G` or `G^m`. My nonnegativity step uses
  log-concavity of single binomial rows, which is elementary (ratio `(n−k)/(k+1)` decreasing), not a mode theorem.
- One rank per tree and the class only: every class statement here is at `p*`, `m ≡ 2 (mod 3)`, `m ≥ 107`. The
  small-tree rows are labelled mechanism tests at ineligible instances.
- No census value is used as proof. P2/P3 are `bounded_computation`. The universal content is the written proof A1.
  Fresh rows 125, 128 and 140 were tested alongside the controls, per ruling 17. The one universal claim (A1) is a
  symbolic identity and does not rest on the sweep.
- The `θ*` law is untouched. The r30 bounded record is not used. No status transfers to any aggregate. No template
  failure is called a cut.
- Attribution: the mechanism, weight and relation belong to Codex GPT-6's lower-region run. E1, the criterion and CD-2
  belong to r30. X-8/X-9 belong to Cycle 2 T3 and its critics. The edge-case record is F3's (r31, Cycle 3). A1's boundary
  closures (items 3-degenerate and 4) and P1–P4 are this critic's.

## Certification audit

| Literal on the return | Backing | Ruling |
|---|---|---|
| Output digest `b65c2b0e…` and "replay byte-identical" | my copy-out replay | STANDS |
| "Test A (proved, swept 0 failures over 1,000+ triples)" | 2,160 triples replayed; one-line proof (A1) | STANDS (the identity is proved_informal by A1; the seat's grade `computer_assisted` is conservative) |
| "`G_α = S_α` … 0 failures among 4,480 checks other than α=0" | 4,480 checks, 105 failures all at `α = 0`; the shipped flag `out_identity_holds_for_al_ge_1: false` contradicts it | NARROWED (reword as in finding 3; flag defect undisclosed) |
| "REFUTED: `β=0 ⟹ H_α=0`" | true for `α ≥ 1`; undefined at `j = 0` | STRUCK as stated; replace with "holds for `j ≥ 1`" |
| "literal (not merely closed-form) confirmation" (Witness 1); "literal sweep … 19,520 zero-weight sources" at `p ≤ 5` | selector not derived (`F_p = ∅` there); no (WID); ineligible | STRUCK as literal-network claims; STANDS as X-8-under-hypothesis tests |
| "0 unexplained `α=0` nonzero-active-arc events" | the generator hard-codes the `α = 0` tag arc to 0 (`if al >= 1 else Fr(0)`), so the counter cannot fire | STRUCK (vacuous) |
| "Test E proved exactly … a definitional unfolding … unfold-level" | compares two copies of one sum | "definitional/unfold-level" STRUCK; the ℤ[X] identity is `proved_informal` (Cauchy product) with my P3 as bounded evidence |
| "entries 29–30 … are the two pieces" of the bridge | statements read | STRUCK |
| "`ρ_m < ρ_1` … consistent with `ρ_1` largest" | two ratios per row | STANDS as stated; the all-`q` version is my P2 |
| "Test C unreachability … proved for all `m ≥ 1`" | `p* − m = (13m+4)/3` | STANDS |
| "X-8's construction is sound (Out/In identities hold) at every source reachable at `p = p*` for the entire class" (Remaining obligation 4) | not shown by the return: it tested only boundary regimes and `q = m = 1` literally | UNBACKED on the return; now backed by A1 (`proved_informal`, STATED, second read owed) |
| Route verdict `bounded_evidence`, `cut_candidate: none`, `headline_resolved: no` | — | STANDS |

## Verdict

verdict: retained_narrowed

headline_resolved: no

COND4_formal: not_advanced

E1_formal: not_advanced

TERMINAL_integration: not_advanced

cut_candidate: none

What remains of the route after narrowing:
- The edge-case record for X-8: `α = 0` gives tag-arc value 0; at `β = 0` the tag arcs carry the row; `q = m` gives
  `β ∈ {0,1}`.
- The exact unreachability of the `j = 0` corner at `p*` on the whole class.
- The zero-weight classification.

These are narrowed to tests of X-8 under `C ⊆ F`, not literal-network observations. The seat's selector was not derived,
(WID) was not asserted, and its instances are ineligible. Also struck: the tautological `cb8R1` evidence, the
"unfold-level" and entries-29–30 characterisations, the vacuous `α = 0` counter, and the over-broad REFUTED label.

The critic-derived advance A1 makes the mathematics of the vetted adapter statement complete in prose (`proved_informal`,
STATED, second read owed). Across the whole class, the X-8 arc values are nonnegative. They saturate every `r`-free
positive-weight source exactly and load every `r`-free `q ≥ 1` target at exactly `ρ_q·w_F`. That makes E1's capacity
equivalent to `ρ_q ≤ 1`, which is the carried threshold key. Nothing here is formal. The headline is not resolved.

## Remaining obligation

1. An isolated second read of A1 (items 1–5 and the Consequence), especially:
   - the per-target arc counts `a − α'` and `2(b − β_A)`, which assume the arm slot has exactly two fillings (`s`, `v`)
     and each absent-choke leg has two (`b_ij`, `c_ij`);
   - the zero-safe log-concavity steps.
2. Lean: state the vetted adapter over `cbGraph m` at `p*`. The E1 flow `f` is a ℚ-function on literal (D) arcs with
   values X-8, and it satisfies:
   - `0 ≤ f`;
   - row sum `= w_F(B)` for every `r`-free source;
   - column sum `= ρ_q·w_F(A)` for every `r`-free target with `q ≥ 1`;
   - column sum `0` elsewhere.

   Hypotheses: `favorableLeaves (cbGraph m) p* ⊇ C` and `107 ≤ m`, `m % 3 = 2`. `ρ_q ≤ 1` is kept as a separate
   conjunct. Its closed-form core is A1 items 1–5 as `Finset.sum` identities over the clone product. The literal bridge
   needs the clone bijection and fiber count (T1/U2 objects).
3. The `ℤ[X]` bridge `(((1+X)^7(1+2X)^{8m−7} : ℤ[X]).coeff k : ℚ) = cb8R1 m k` in Lean, through `coeff_mul`, the
   antidiagonal-to-range reindexing, and the vanishing of `C(7,i)` for `i > 7`. This is not an `unfold`. My P3 is bounded
   evidence only.
4. `ρ_q ≤ 1` for every `q ∈ [1,m]` at `p*` on the whole class. This is the carried threshold key (`proved_informal`
   modulo Darroch on the `r_q`). A Darroch-free, formal proof is still owed. My P2 (nine rows) is not a proof.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F3-U/`

| File | SHA-256 |
|---|---|
| `crit_f3u.py` (critic instrument; run `python3 -B crit_f3u.py` in this directory, about 27 s) | `1d4426ede4001ef6007709754e9e5e5a01a264747e9fd2dd9c403eb01ca0ce48` |
| `crit_f3u.out.json` (canonical compact JSON; its SHA-256 is the output digest) | `6aefe4ea2b6dc69dc7666d83dd5e4fa7b1758eefd64f95ec949388a231a0798e` |
| `crit_f3u.digest.txt` | `2cf146f9ae284dd7b22420442ceca743437e0aca19875070ec709c4226e12b27` |
| `run.log` (stderr progress and timing; not hashed into the payload) | `597ea37d4f1b83efb4c9be3e2c0d9d4a9d87d7729505e8ad3bf5d17b313ba456` |
| `fixedpoints.py` / `fixedpoints.log` (§5 fixed points) | `cefe01c5a83208ad25b3f890eaaa3ccd92761f50ded2eb70d51ecf402308a8e9` / `5ade024b3b9c96050e98e395bbce1b9fd079bfc4a38714f2c8afac6d43ce9f8a` |
| `replay/f3_arc_adapter.py` (copy-out of the seat's generator) | `99d11bbc9f51da8eecbf9c79d5f88f19ee753a7d904d0c3ddef9ad18dc2aa82c` |
| `replay/f3_arc_adapter.out.json` / `replay/f3_arc_adapter.digest.txt` | `d87071c59334f5e957e265c3af797661f606b633e54f4846449550e909426044` / `ad1b496204284f3f4b58dd6499c0a9b019a06d3c6517ea06bb70e557e6efb0cc` |
| `orig.digest.txt` (the seat's digest file, copied by name) | `ad1b496204284f3f4b58dd6499c0a9b019a06d3c6517ea06bb70e557e6efb0cc` |

**Process disclosures.**
- One background run of the instrument. Its wrapper was PID 3922, and it exited on its own; a single `ps -p 3922` (no
  full listing) confirmed it was gone. A background wait loop also finished on its own. No job was running at the final
  write, and nothing was killed.
- No child agents, no network, no installs, no Lean.
- Nothing was written outside my scratch directory and this file, apart from creating this file's directory.
