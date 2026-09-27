# Critique

Critic `C-T1-U` (orientation U, formal/structural) of seat `T1`, route `C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL` (orientation T).
Run `erdos-993-math-dre-20260926-r30-weighted-transport`, Cycle 5, Stage 4. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, before any other file. No other VerityOS subsystem
was loaded: no memory, conversations, modules, skills, logs or decisions. The host auto-injected the project `CLAUDE.md` and a memory
index into my context. I did not open either file or act on it. I made no conversation log, because writes are restricted to the
critique path and my scratch.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Dispatch.** I read `control/dispatch/c5-stage4/DISPATCH-C-T1-U.md` first. Its SHA-256 recomputed as
`c4525d179931fec4539a097ead304bc0f5d2ecde41a1329a3f1461c052195f44`, which matches the value given, and I followed it only after that
match.

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c5-critic-capsules/T1-PACKET-MANIFEST.json` inner seal (canonical JSON minus `seal_sha256`, sort_keys, `(",",":")`, no newline) | `ebc5a0bbabcfd1f04f13d3723d2c40e8faf4d419b096b86e105fffdec5d94b8d` | same | **match** |
| Capsule members (14 files: bytes and SHA-256) | as listed | recomputed | **14/14 match** |
| Stage 4 dispatch manifest `control/C5-STAGE4-DISPATCH-MANIFEST.json` inner seal | `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` | same | **match** |
| Stage 3 manifest `control/C5-STAGE3-PACKET-MANIFEST.json` inner seal | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | same | **match**. It lists `cycles/cycle-5/stage3/returns/T1/RETURN.md` at `7ab9c9bf…a6da`, the same value as the capsule. |
| Stage 2 manifest `control/C5-STAGE2-PACKET-MANIFEST.json` inner seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | same (1400 members) | **match**. It is the value T1 cites and the one in `C5-CRITIC-COMMON-BRIEF.md`. |
| Stage 2 seal as printed in `control/C5-CRITIC-PROTOCOL.md` duty 1 | `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684` | — | **Clone residue (R30-E-h class).** This value is not the Cycle 5 Stage 2 seal, and it disagrees with the common brief. The governing value is the recomputed `2e8e3d44…`. My grep of `control/` (disclosed below) shows `f0b5a2a1…` is the Cycle 4 Stage 2 seal. The token escaped ruling 44's `C4-` grep because it is a bare hex string. |
| `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78…533d` (SOURCE-DIGESTS, 16710 B) | same | match |
| `sources/lower-region/instruments/cb-switch-cut/run.py` | `94ced046…9d53` | same | match |
| `sources/lower-region/instruments/cb-switch-cut/PROTOCOL.md` | `5b09a7f3…d952` | same | match |
| `control/C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (capsule member) | — | read | T1's three items match its return: the `ls` of `scratchpad/`, the read-before-digest of two frozen files, and SYNTHESIS lines 1–599. Nothing downstream depends on the read order, because both digests match. |
| T1's scratch (`scratchpad/c5-T1/`) | not digested in the return | `t1_generator.py` `f969a378…63a136`; `T1-GENERATOR-OUTPUT.json` `55ddca3e…80f9` | recorded here |

**Claim identity.** T1 proposes no new key. The keys it touches are the following:
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN): untouched.
- The primary aggregate: untouched.
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (`proved_informal`): instantiated at `t = 1`.
- `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM): cited.
- E1 `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`: named only in a heuristic aside.

T1's lexical alias search of `control/CLAIM-IDENTITY.run-local.json` (it reports "453 claim_key strings") is not in my capsule. I did
not verify it.

**Read-boundary disclosure (mine).**
1. To trace the protocol's stale Stage 2 seal, I ran one `grep -n "f0b5a2a1\|2e8e3d44"` over `control/*.md control/*.json`,
   `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`. The glob covers `control/` files outside my capsule. It printed one matching line
   (the seal string only) from each of these seven files:
   - `C4-CRITIC-COMMON-BRIEF.md`
   - `C4-CRITIC-PROTOCOL.md`
   - `C4-STAGE3-AGENTS.json`
   - `C4-STAGE3-ADMISSION.json`
   - `C4-STAGE2-PACKET-MANIFEST.json`
   - `C5-STAGE3-AGENTS.json`
   - `C5-STAGE3-ADMISSION.json`

   I read no other content of those files. The only use I made of it is the clone-residue attribution above.
2. I listed the top level of `scratchpad/c5-T1/`, which is within my grant. I did not list, read or test T1's
   `scratchpad/c5-T1-replay/`, which is outside my grant. T1's in-session replay claim is therefore judged only by my own replay below.
3. I ran one `ls` of the non-existent `cycles/cycle-5/stage4/critics/T1/` (my own output parent) and one non-recursive `ls` of
   `sources/lower-region/inputs/`.
4. My copied-out T1 generator, and my `second_instrument.py`, import the authorized evaluator from `sources/` (a Stage 2 member)
   under `python3 -B`. `sources/lower-region/inputs/__pycache__` does not exist after the runs.

## Independent re-derivation

**My instrument.** It is my own code (`scratchpad/c5-crit-T1-U/crit_instrument.py`, `census.py`), standard library only. It imports
neither the authorized evaluator nor T1's generator.

**Part A: generic literal machinery.**
- A literal tree builder with an acyclicity-and-connectivity test.
- A generic rooted independence-polynomial DP, which equals brute enumeration on 14/14 small trees.
- `x` scanned through rank `α`, including the terminal difference.
- The literal network: `w_F` counts ACTIVE tags `v ∈ F ∩ B` with `B ∩ N(s_v) ∖ {v} ≠ ∅`. (D) ∪ (S) is literal. `F = F_p` is derived
  from `Δ_p(T − v)` on the ORIGINAL tree. `supply − capacity` is asserted equal to `S` computed independently from the `H_v`/`R_v`
  side. The max flow is Edmonds–Karp.

**Fixed points reproduced (all exact).**

| Fixed point | Reproduced values |
|---|---|
| `K_{1,12}` at `p = 8` | `n = 13`, `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`; `Δ_0 = 12 = n − 1`; `i_2 = 66 = C(13,2) − 12` |
| Path-star `(2,3,4)` at `p = 7` | `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, supply 1483, capacity 2701, `S = −1218`, 2025 arcs, max flow 1483 |
| Path-star `(2,2,4,3)` | `n = 18`, `α = 13`, `x = 6` |
| `CB(8,92)` | `n = 1567`, `α = 829`, `x = 490`; the arm tag and a private tag are both favorable at `p = 492` |

I did not re-run the free-tree counts or the `T_m` point, which are not on T1's path.

**Part B: closed form for the CB pattern (critic-derived).** Conditioning on `r` and on each choke gives:
- `g(y) = y(1+y)^d + (1+2y)^d`
- `I_T = y(1+y)(1+2y)^{dm} + (1+2y)·g^m`
- `I_{T−v} = y(1+2y)^{dm} + (1+y)·g^m`
- `I_{T−c} = y(1+y)^2(1+2y)^{dm−1} + (1+2y)·g^{m−1}·g_c`, where `g_c = y(1+y)^{d−1} + (1+y)(1+2y)^{d−1}`

The engine asserts the closed form equal to the literal tree DP on every `(d,m)` with `n ≤ 400`. It computes `g^m` exactly by
packed-integer shift-adds. Its outputs are:
- `x` through `α`
- `α`, asserted to equal `1 + m(d+1)` on every row
- first eligible `p = x + 2`
- eligibility `3p < 2α + 1`
- sector deficiency `3p < 2dm + 5`
- `F_p` membership of `v` and of a private leaf `c` (all `c` are equivalent under `Aut`)
- E1 condition (i) in cleared form

**Replay of T1.** I copied T1's generator out to `scratchpad/c5-crit-T1-U/replay/` and ran it with `python3 -B` (80 s, foreground).
The output is **byte-identical** to T1's `T1-GENERATOR-OUTPUT.json` (`55ddca3e…`), with embedded digest
`e6ccfd94793eef232175aab096e3991b31ce6e7646bee8a08983efcd6f93e65a` as T1 states.

**Claim 3 census on two instruments.** My engine, over T1's exact rectangle (`d ∈ [1,8], m ≤ 150`; `d ∈ [9,16], m ≤ 89`; 1912
pairs), finds **59 hits, all `d ∈ {7,8}`**. The `(d, m, n, α, x, p)` set is equal to T1's. The census is now two-instrument at
`bounded_computation`: T1's evaluator-based DP plus my closed form. T1 alone had one instrument, because its "cross-check against the
independently computed `x`" reuses the same DP.

**Claim 2.** On the five certificate rows:
- `α` values 775, 802, 829, 973, 1153 reproduce.
- `x = p − 2` reproduces on all five.
- The ratios `460/459`, `476/475`, `492/491`, `289/288`, `337/336` follow from `R = 2(dm−p+2)/(p−1)`.

**Claim 1, `α(CB(d,m)) = 1 + m(d+1)`, proved here (critic-derived; `proved_informal`).**
- Lower bound: `{v} ∪ ⋃_i ({u_i} ∪ {c_{i,1..d}})` is independent of size `1 + m(d+1)`.
- Upper bound: the vertex set is partitioned into `1 + m(d+1)` cliques (edges or single vertices): `{s,v}`, `{r,u_1}`, `{u_i}` for
  `i ≥ 2`, and the `dm` edges `{b_{ij}, c_{ij}}`. An independent set meets each clique at most once.

So the statement holds for every `d ≥ 0, m ≥ 1`. T1's Step-2 "generating-function decomposition" states only the lower-bound
construction ("selecting every choke … beats leaving any choke unselected"). It is not a proof, because it has no upper bound.

**Step 2 (the sector instantiation), checked literally.** On 11 laboratories `CB(d,m)` (`d ≤ 4`, `n ≤ 24`), I chose ranks where the
arm tag is favorable and `3p < 2dm + 5` (all non-eligible, so these are laboratories and not evidence). With `F = F_p` derived and
literal weights, each laboratory has:
- sector weights `≡ 1`
- positive-weight deletion targets = `C(dm,p−2)2^{p−2}`, all in-sector (deleting `r` or `v` gives weight-0 targets)
- deletion-only max flow = that target count exactly
- unmatched supply = `C(dm,p−1)2^{p−1} − C(dm,p−2)2^{p−2}`, which is T1's formula

That is 11/11. At ranks where `v ∉ F_p`, for example `CB(2,2)/3`, the sector weight is 0. So "`w_F ≡ 1` on S" needs `v ∈ F_p`, which
T1 never checks (see the audit).

## Attacks and findings

**A1. Fidelity of `F_p` (partial fidelity failure; the numbers survive on my evidence).**
- T1's generator docstring says "F_p is derived on every row via favorable_leaves(), never hard-coded" and "Every eligible row
  reports … |F|". `favorable_leaves()` and `aggregate_S_independent_side()` are defined but **never called**. No row carries `|F|`,
  supply, capacity or `S`.
- Step 2's weight-one sector needs `v ∈ F_p`, and the census "switch-necessary" label inherits that assumption untested.
- My instrument derives `F_p` on every hit row. `v` and every private leaf are favorable on all 59 rectangle rows and on all 2,334
  extension hits, so `F_p` is all `1 + dm` leaves (737 at `CB(8,92)/492`). The census numbers therefore stand, but on my derivation
  and not T1's.
- No row asserts `supply − capacity = S`. T1 says it asserts no `S`, and its gate-31 line records that. The census rows still do not
  carry the SEMANTIC-CONTRACT §3 row data.

**A2. The "`d ∈ {7,8}`" narrowing is an artefact of the `m`-cutoff (refuted as an inference).** I extended the census on my
instrument, and every row asserts closed form = DP where `n ≤ 400`:

| `d` | `m` range | hits | first hit (row, `n`) | notes |
|---|---|---|---|---|
| 9 | ≤ 400 | 289 | `CB(9,112)/673`, `n = 2131` | every `m ∈ [112,400]` is a hit |
| 10 | ≤ 400 | 270 | `CB(10,106)/708`, `n = 2229` | |
| 11 | ≤ 400 | 237 | `CB(11,134)/984` | |
| 12 | ≤ 400 | 189 | `CB(12,212)/1697` | |
| 7 | ≤ 800 | 657 | | |
| 8 | ≤ 800 | 692 | | |
| 6 | ≤ 1000 | 0 | | |
| 1–5 | ≤ 600 | 0 | | |

The first `d = 9` hit sits just past T1's `m ≤ 89` ceiling for `d ≥ 9`. T1's recommendation that "if a uniform class exists it is most
likely `d ∈ {7,8}`" is therefore wrong. The observed boundary is `d ≥ 7` (no hit for `d ≤ 6` in range), with an onset `m_0(d)` that
is smallest near `d = 8`.

**A3. A closed form explains the window: first order, critic-derived.**
- The per-choke coefficient mean is `μ(d) = g'(1)/g(1)`, and exactly `2d/3 − μ(d) = δ_d := 2^d(d−6)/(6(2^d+3^d))`. This is
  elementary: `g'(1) = 2^d + d·2^{d−1} + 2d·3^{d−1}`.
- So the coefficient mean of the dominant `r`-out part `(1+2y)g^m` is `2dm/3 + 2/3 − m·δ_d`, below `2dm/3 − 1/3` exactly when
  `m·δ_d > 1`.
- The `r`-in part has relative weight `(2/3)(1 + (2/3)^d)^{−m}`, negligible for `d ≤ 9` at these `m`, and its mean is
  `2dm/3 + 3/2`.
- Hence: `δ_d > 0 ⇔ d ≥ 7`; `δ_6 = 0`; `δ_d < 0` for `d ≤ 5`. The predicted onset `m ≈ 1/δ_d` is 108.5 (`d = 7`, observed 109) and
  79.9 (`d = 8`, observed 86). For `d ≥ 9` the `r`-in weight delays the onset (`d = 9`: 78.9 predicted, 112 observed).
- The deficit `2dm/3 − x` grows linearly. At `m = 800` it is `29/3` for `d = 8`, against `m·δ_8 − 2/3 ≈ 9.35` predicted.

The step "`x` sits within `O(1)` of the mean" is **not proved**, because `I_{CB}` is not known to be real-rooted. So this is a
heuristic explanation confirmed by the census, not a lemma. The answer to the brief's question is: yes, a closed form explains the
window to first order; no, it is not a `proved_informal` criterion in `d` alone.

**A4. (L-i) as allocated is FALSE on `CB(8,m)`, `m ≥ m_0`: the strongest finding.** The allocation asks for (L-i) "placing `p − q`
at or above the mode of `r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}` for every `q ∈ [1,m]` at every eligible `p`". E1 is exactly this in
cleared form, `r_q(p−q) ≤ r_q(p−q−1)` (CD-2). This fails at first eligible ranks of the class. It was checked on two instruments:
- (i) my census, with exact coefficient sums at `q = 1` and Darroch-decided `q ≥ 2` plus exact sums wherever Darroch is undecided;
- (ii) `second_instrument.py`, which uses the authorized evaluator for `x`, `α`, eligibility and `F_p`, and a literal repeated-product
  expansion of `r_1`.

The rows are:

| Row | `n` | `x` | eligible, switch-necessary, `|F|` | Cleared E1 | Lenient reading `r_1(p) ≤ r_1(p−1)` |
|---|---|---|---|---|---|
| `CB(8,161)/859` | 2740 | 857 | yes, yes, `|F| = 1289` | fails at `q = 1`: first mode of `r_1` = 858 = `p − 1` | holds |
| `CB(8,242)/1290` | 4117 | 1288 | yes, yes | fails at `q = 1..4`: first mode 1290 > `p − 1` = 1289 | fails |
| `CB(7,217)/1013` | | | yes, yes | fails at `q = 1, 2` | |
| `CB(9,186)/1116` | | | yes, yes | fails | |

Counts of first-rank switch-necessary rows where cleared E1 fails:
- `d = 7`: 548 of 657 hits (lenient reading fails on 440, first at `m = 325`)
- `d = 8`: 614 of 692 (lenient fails on 534, first at `m = 242`)
- `d = 9`: 215 of 289 (lenient fails on 137, first at `m = 264`)
- `d = 10`: 162 of 270 (lenient fails on 76, first at `m = 297`)
- `d = 11`: 79 of 237 (first cleared failure `m = 289`)
- `d = 12`: none up to `m = 400`

The smallest-order such row in range is `CB(8,161)/859`. **E1 therefore cannot supply the non-sector half of (HALL) at these rows.**
The allocation's class "`CB(8,m)` for every `m ≥ m_0`" is not reachable by the (L-i) + (L-S) + E1 composition at the first eligible
rank. This is not a cut and says nothing about (HALL) there, because E1 is only sufficient. Grade: `bounded_computation`, with two
instruments at the four named rows.

**A5. The rank-threshold lemma for E1 on `CB(d,m)`: critic-derived advance, `proved_informal` modulo Darroch (1964), a classical
theorem not under `sources/`, named as an undischarged dependency.**

*Statement.* Let `d ≥ 6`, `m ≥ 1`, `μ_1 := (4dm − d + 1)/6`. On `CB(d,m)`, E1's condition (i) in cleared form holds for every
`q ∈ [1,m]` at every rank `p ≥ ⌈μ_1⌉ + 2`. It fails (at `q = 1`) at every rank `2 ≤ p ≤ ⌊μ_1⌋ + 1`.

*Proof.*
1. `r_q` is real-rooted with positive coefficients, with mean `μ_q = (qd−1)/2 + 2(d(m−q)+1)/3`.
2. So it is strictly log-concave, and `r_q(j) ≤ r_q(j−1)` iff `j − 1 ≥` its first mode.
3. Darroch puts every mode in `{⌊μ_q⌋, ⌈μ_q⌉}`.
4. `μ_q + q = (4dm + 1 + q(6−d))/6` is nonincreasing in `q` for `d ≥ 6`, so `⌈μ_q⌉ + q ≤ ⌈μ_1⌉ + 1`.
5. Hence `p ≥ ⌈μ_1⌉ + 2` gives `p − q − 1 ≥ ⌈μ_q⌉ ≥` the first mode for every `q`.
6. Conversely, `p − 2 < ⌊μ_1⌋ ≤` the first mode of `r_1` gives `r_1(p−1) > r_1(p−2)`.

*Checks.*
- At `q = 1` Darroch's decision matched the exact sums on every census hit where Darroch decides; the census asserts it.
- Exact all-`q` checks (no Darroch) agree:
  - `CB(8,86)/460`, `CB(8,92)/492` and `CB(7,144)/673` sit exactly at the threshold (460, 492, 673) and hold.
  - `CB(8,161)`: threshold 860, holds at 860, fails at 859 (in the one-rank gap, decided exactly).
  - `CB(8,242)`: threshold 1292; fails at 1290 (`q = 1..4`) and at 1291 (`q = 1`).

*Consequence.*
- At a rank `p`, E1 and sector deficiency hold together only when `⌈μ_1⌉ + 2 ≤ p ≤ ⌊(2dm+4)/3⌋`, a window of about `(d−3)/6` ranks.
- For `d = 8` the window holds exactly one rank when `m ≢ 1 (mod 3)` and none when `m ≡ 1`.
- The remaining sector-deficient eligible ranks `x + 2 ≤ p ≤ ⌈μ_1⌉ + 1` need a non-sector criterion other than E1.

This answers the brief's "(L-i) mode bound" question. The one-paragraph Darroch proof exists, but it proves a rank threshold and not
"every eligible `p`". The every-eligible-`p` form is false (A4).

**A6. The defect-Hall statement.**
- T1's count is correct: the unmatched sector supply is `C(dm,p−2)2^{p−2}(2dm−3p+5)/(p−1)`, which equals `|L_k| − |L_{k−1}|`,
  `k = p−1`.
- Given the registered CBstar formula, defect-Hall/König yields a matching that saturates every in-sector target. I confirmed this by
  literal max flow on 11 laboratories.
- It does **not** identify *which* sources are unmatched. Maximum matchings are not unique, and the count is not a canonical set. So
  it is not the (L-S) input the brief asks about, and T1's route verdict text is right to say so.
- Whether the count equals `θ*·(switch-image weight)` at the five rows cannot be checked from my capsule, because the certificates'
  switch-image weights are not members. I record it as unverified, not refuted.

**A7. Direction, quantifier and circularity checks.**
- T1 makes no universal (HALL) claim, no flow claim and no cut claim.
- The switch criterion `3p < 2dm + 5 ⇔ 2(dm − p + 2) > p − 1` is correct.
- Eligibility uses `3p < 2α + 1` with `α` from the DP.
- No natural-number subtraction occurs.
- No step assumes `S ≤ 0`.
- The heuristic aside (Step 5) is not used downstream. I checked Claims 0–3 and the grades table.

## Mechanism-equivalence and fence check

- T1 proposes no transport mechanism. Step 2 is the `t = 1` instantiation of the registered CBstar deficit and (NM). As a
  contribution it re-states settled records, and T1 grades it that way ("inherits … `proved_informal`; my contribution … does not raise
  it"). This is correctly fenced.
- It is not deletion-only Hall (`E993-R23-LITERAL-DELETE-ONLY-HALL`). T1 asserts a deletion *deficiency*, not deletion sufficiency.
  None of the other nine refuted keys is touched.
- No census value enters a proof. No RTree wording is used. No live root is read. The controller prior is not cited as evidence.
  (LIFT) and (DCB) are unused.
- Claim 0 checks the sector-count arithmetic, not a target object, and is fine as a laboratory. T1 calls its five instances "not
  switch-necessary". Several satisfy `3p < 2dm + 5` but are non-eligible, so the phrase means "not an eligible switch-necessary row".
  I note this; I do not strike it.
- **Standing letters (C5 gate ruling 39):** T1 supplies **none** of (a′)–(d′). My A4 bears on (a′): the E1-based composition cannot
  deliver (a′) on `CB(8,m)`, `m ≥ m_0`, at the first eligible rank. A5 names the only rank band where E1 is available.

## Certification audit

| Literal | Evidence | Disposition |
|---|---|---|
| "59 hits, at every one of them `d ∈ {7,8}`" (in the stated rectangle) | Replay byte-identical; my instrument gives the same set | **backed** (`bounded_computation`, now two instruments) |
| "1912 `(d,m)` pairs (1200 + 712)", "every pair … evaluated" | Code loops cover them | backed |
| "`CB(8,86)/460` is the smallest by order, `n = 1465`, among all 59" | Both instruments | backed |
| "The five previously registered rows appear inside this list as its own five smallest-`d=8`/one `d=7` entries" | `CB(8,95…107)` precede `CB(8,108)`, and `CB(7,109)` precedes `CB(7,144)` | **struck** (the rows appear, but they are not the smallest) |
| "88/88 match" (`α` formula) | Replay `claim1_alpha_formula_all_88_match: true` | backed. The statement itself is now proved (A-proof above). |
| Claim 2 "match on every field" | Reproduced | backed |
| "the argument is in fact a uniform proof" (Claim 1) | Lower bound only in T1's text | **struck as stated**. It is superseded by the critic's clique-cover proof. |
| "F_p is derived on every row via favorable_leaves()" and "Every eligible row reports … `|F|`" (generator docstring) | Function never called; no `|F|` field | **struck**. `F_p` = all leaves on every hit row is re-established by my instrument. |
| "`w_F(B) = 1` for every `B ∈ S`" | True iff `v ∈ F_p`; not tested by T1 | backed on the census rows by my derivation only |
| "deletion alone saturates all … in-sector targets and leaves exactly … unmatched" | Registered CBstar formula + defect Hall; literal laboratories 11/11 | backed as a count (not a set) |
| "cross-checked against the independently-computed `x`" (Claim 3) | Same DP supplies `x` and the check | **struck** as a two-instrument claim. Two instruments now stand via this critique. |
| "Replay performed in-session: identical SHA-256" | Replay directory outside my grant; my own replay reproduces `e6ccfd94…` | backed by my replay |
| "No bytecode written anywhere" | Not checkable for T1's directories without an out-of-grant `find`; my runs left none | unverified |
| Heuristic "threshold near `d ≈ 6–7`" | Labelled non-rigorous by T1 | not a certification; consistent with A3's `δ_d > 0 ⇔ d ≥ 7` |
| T1's route verdict `bounded_evidence` and `headline_resolved: no` | — | correct |

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained:**
- Claims 0–2 at `bounded_computation`. Claim 1 is upgraded to `proved_informal` by the critic's proof (A-section).
- The Claim 3 census as a bounded fact on its stated rectangle, now two-instrument.
- Step 2 as a correct instantiation of registered records, with no new grade.

**What is narrowed or struck:**
- The census's interpretive conclusion (the class "most likely `d ∈ {7,8}`") is refuted by A2. Hits exist for every
  `d ∈ [7,12]` tested.
- The `F_p`-derivation and "independent `x`" certification literals are struck.
- The "five smallest" literal is struck.

**Critic-derived results, attributed to C-T1-U:**
- (a) `α(CB(d,m)) = 1 + m(d+1)`, `proved_informal`.
- (b) The E1 rank-threshold lemma on `CB(d,m)`, `d ≥ 6` (A5): `proved_informal` modulo Darroch, and STATED here, so it needs an
  isolated second read before registration.
- (c) (L-i) in the allocation's "every eligible `p`" form is false on the class. The four named rows (A4), including
  `CB(8,161)/859` and `CB(8,242)/1290`, are `bounded_computation` on two instruments.
- (d) The first-order mean identity `2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d))` is proved. It explains the `d ≥ 7` switch-necessity boundary
  heuristically; the `x` ≈ mean step is unproved.

If the synthesis wants names, candidate keys are proposed only as predicates. They are alias-checks pending, because the registry is
not in my capsule:
- `E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-EXACTLY-ABOVE-RANK-THRESHOLD` for (b)
- `E993-R30-CB-INDEPENDENCE-NUMBER-EQUALS-ONE-PLUS-M-TIMES-D-PLUS-ONE` for (a)

Neither reuses a working label. The first is mathematically distinct from E1's key, because it states *where* condition (i) holds on
`CB(d,m)`, not what it implies.

No background job was started in this critique. Every run was foreground under `timeout`, so there is nothing to kill.

## Remaining obligation

Exact, for a successor on T1's object (a′) restricted to the CB pattern:

1. **Non-sector criterion below the E1 threshold.**
   - *Needed:* for sector-deficient eligible ranks `x + 2 ≤ p ≤ ⌈(4dm − d + 1)/6⌉ + 1` of `CB(d,m)`, a non-sector deletion-Hall
     criterion that replaces E1, where E1 provably fails (A5). This rank band is nonempty for `CB(8,m)` at `m = 161, 242, …`.
   - *Alternative:* restrict the class to the E1 band `⌈(4dm − d + 1)/6⌉ + 2 ≤ p ≤ ⌊(2dm + 4)/3⌋`, `p` eligible. For `d = 8` this is
     one rank per `m ≢ 1 (mod 3)`. The five certified rows sit exactly at its lower end.
   - Either way the class is `{(CB(d,m), p)}` with `p` in a stated band, not "every eligible `p` of `CB(8,m)`, `m ≥ m_0`".
2. **Eligibility of the band ranks, uniformly.** A proved location of `x(CB(d,m))`, e.g. `x ≤ ⌈μ_1⌉` for `m ≥ m_1(d)`, is needed to
   certify that the band ranks are eligible uniformly. Today it is only census-confirmed.
3. **(L-S), still unattempted by any party in this critique.** It requires a closed-form choke-local sector certificate `(φ_b, φ_c, σ)`
   as functions of `(d, M, K)` with `θ ≤ 1 − ρ_1` on the chosen band. The defect-Hall count (A6) does not identify the unmatched
   sources, and supplies no routing.
4. **Composition by B7** with the registered E1 on the band, at `proved_informal`, followed by an isolated second read.
5. **Gate ruling 39:** from T1's return, the terminal-close test gains nothing. Whether A4 and A5 change the Cycle 6 plan is the
   synthesis's call.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-T1-U/` (SHA-256).
Every run used `python3 -B` in the foreground. There is no `__pycache__`.

**Code:**

| File | SHA-256 | Purpose |
|---|---|---|
| `crit_instrument.py` | `03c61f1a6cd7b1316b3899e80a3c7eb9a5d0912fb02bfc39c205b2f7ae9639d6` | Parts A–C: DP, brute force, literal network, sector labs |
| `census.py` | `a8379f534df9716bb134bc2e432bd116e6e43c1241e8293ecbaef1e2510244a2` | Closed-form census engine |
| `lab2.py` | `09c445090b314f02829c66b461e453915fa9e6b9d4f8e5d1a7c8ecdddb32e2a2` | Sector laboratories, derived `F` |
| `e1_modes.py` | `00452697b82667d3036d10f0723381eebc72d3d6229cc689acc17ced1ee7e20f` | Lenient vs cleared E1 |
| `e1_exact_allq.py` | `064772812d06183a59cdbac655a7b31d7fa482c882e608ffd738e22b9e8d2f9b` | Exact all-`q` E1 at seven rows |
| `second_instrument.py` | `a848b686152a97e32c2fb5c1c87a16eba1b53a0fc380a99f9bd65698f850d0fd` | Authorized-evaluator `x`/`F_p` plus literal `r_1` expansion |

**Outputs:**

| File | SHA-256 | Payload digest / notes |
|---|---|---|
| `CRIT-INSTRUMENT-OUTPUT.json` | `0273c1dc5d9b32a1a48cf905458e69c2940b04fbf1558eec42ffadf234e87ae8` | payload `af269373…` |
| `LAB2-OUTPUT.json` | `cda1c0885b7c4bd03e7d5e3c2a30e272c0dfca75ffdd18f0c040937bbad1b7d2` | |
| `CENSUS-T1-RECTANGLE.json` | `c60fcd7d699dfef1cfa4c01783f1936e637adf1f4793fae257261e24be240080` | payload `f486a2f0…`; 1912 rows, 59 hits |
| `CENSUS-EXT-7-8.json` | `4a2fc585faec5cfbc14d26bed2451fe536f32b30a44d07741a4c916cecc5dff5` | 1600 rows, 1349 hits |
| `CENSUS-EXT-9-10.json` | `e8c6612b4a7a1416edbba7e744b072dde757e293e701dda8efd850906de80b2c` | 800 rows, 559 hits |
| `CENSUS-EXT-11-12.json` | `1a34f8e1d14d40cd6737a44686c5c9a17c9683dbf7bf1bd2ea1e0b66210adf10` | 800 rows, 426 hits |
| `CENSUS-EXT-LOW-D.json` | `ff49034cf8815e2dca7b57750f9d45f317f67b3fc7805c6573c1e02075533645` | 4000 rows, 0 hits |
| `E1-MODES.json` | `6488403eb7d35ae66d9586de91c13addab7a9f32b05448a17af8c180af1489de` | |
| `E1-EXACT-ALLQ.json` | `15843ed27db383f1cb6007a9a523bcbaf7d5f5c94481ad259afa91007fef7a5c` | |
| `SECOND-INSTRUMENT.json` | `baff46075922f675d396d5022f66f4561ee9bc1c36817e4cb525fd91104635f0` | |

**Replay and logs:**
- `replay/t1_generator.py` (`f969a378…63a136`, copied from T1's scratch)
- `replay/T1-GENERATOR-OUTPUT.json` and `replay/REPLAY-OUTPUT.json` (both `55ddca3ef3fb371e9678ca2a80a785a4de2b2bc06da1e972e004228fb3e980f9`, byte-identical)
- `replay/replay_err.log`, `census_err.log`, `crit_err.log` (all empty)
