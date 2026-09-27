# Critique

Critic `C-F2-T` (orientation T, prove) of route `C5-F-02 PER-TAG-INJECTION-FRONTIER` (seat F2, orientation F), r30 Cycle 5 Stage 4.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch instructs. I loaded no other VerityOS subsystem.
The host injected the project `CLAUDE.md` and the auto-memory index into context. I did not act on either. The dispatch limits
writes to this file and my own scratch, so I kept no conversation log.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]`

**Letters of gate ruling 39, in one line:** the return supplies none of (a′)–(d′). Its census is finite and gives no infinite
eligible family at `proved_informal`, so it does not supply F2's half of (b′). My own critic-derived work below supplies none either.

## Identity and seal audit

- Dispatch `control/dispatch/c5-stage4/DISPATCH-C-F2-T.md`: SHA-256 `0970f9e53d49c2193d4f1ffd7832fc070a8b617112c73ae2843ec6f118279556`. I hashed it before acting on it, and it matches.
- **Capsule seal** `control/c5-critic-capsules/F2-PACKET-MANIFEST.json`: declared and recomputed values are both
  `0a6285304b1eb6df0623b5e3c5c7b475d48e2cb0b94e1ab9377cd928a8cdfb6e`. I recomputed it from canonical JSON without `seal_sha256`
  (sort_keys, `(",", ":")`, no trailing newline), and it **matches**. All 14 members match on SHA-256 and on byte count.
- Stage 4 dispatch manifest seal `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d`: recomputed, **matches**.
- Stage 3 packet manifest seal `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`: recomputed, **matches**. Its entry
  for `cycles/cycle-5/stage3/returns/F2/RETURN.md` is `c3c15b48…aba60`. That equals the capsule digest and the file on disk.
- Stage 2 packet manifest seal: the recomputed value is `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`, and it matches
  the manifest's own field and `C5-CRITIC-COMMON-BRIEF.md`. **Finding (clone residue, R30-E-h class).** Duty 1 of
  `control/C5-CRITIC-PROTOCOL.md` quotes the Stage 2 seal as `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`,
  which is the **Cycle 4** Stage 2 seal. The ruling-44 token grep cannot catch a stale digest. I resolved the conflict by
  recomputation and by the common brief (`2e8e3d44…`). The controller should record an erratum.
- **Return's listed digests.** I copied `scratchpad/c5-F2/*.py *.json` out to `scratchpad/c5-crit-F2-T/replay/`. All 15 artifact
  digests in the return's inventory match. The inventory omits `make_manifest.py` (`273a5925…`) and `MANIFEST.json` (`847b5107…`),
  which is a minor gap.
- The return's model disclosure (chartered sonnet/xhigh; runtime `claude-sonnet-5`) agrees with `C5-ALLOCATION.md`, where routes
  are Sonnet 5 xhigh.
- The seat's read-boundary disclosures (`C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, F2 items) are low severity. The mistaken
  `/tmp_unused_ignore` redirect failed, and I note it only.

## Independent re-derivation

**Own instrument** (`scratchpad/c5-crit-F2-T/own/inst.py`). I built it from SEMANTIC-CONTRACT §1.1–1.2 alone and read none of F2's
code before writing it. It uses bitmask sets, a forest DP for `i_k(T − D)`, and `x` scanned through rank `α` inclusive. `F_p` is derived
from `Δ_p(T − v) < 0` on the original tree. `w_F` is literal active-tag weight (`v ∈ F ∩ B`, `B ∩ W_v ≠ ∅`), and (D) ∪ (S) is
literal. `S` has two sides:
- literal `Σ_{I_{p+1}} w_F − Σ_{I_p} w_F` over enumerated sets;
- `Σ_F [q_v(p) − q_v(p−1)]` from DP polynomials of `H_v` and `R_v`.

The equality is asserted on every row. Per-tag matching uses Hopcroft–Karp, and joint flows use Dinic.

**Fixed points reproduced** (`validate.py`):
- `K_{1,12}`/8: `n = 13`, `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`, flow 1980, no switch arc.
- Path-star (2,3,4)/7: `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, 1483 / 2701 / `S = −1218`, full flow 1483, **2025 full arcs**.
- Path-star (2,2,4,3)/8: 8033 / 13467 / `S = −5434`, flow 8033, **11691 full arcs**.
- On 50 random trees (seed 993): `Δ_0 = n − 1`, `i_2 = C(n,2) − (n − 1)`, and DP equals literal enumeration.
- Free-tree counts from my own generator (leaf extension plus canonical AHU at the centre) equal A000055 for orders 1–18. This is
  asserted in code.

`CB(8,92)` and `T_m(22,34)` are beyond literal enumeration. The mechanism studied here never reaches them, and I did not reproduce them.

**Operational reformulation, checked.** Under the (WID) bijection `B ↦ B ∖ {τ}`, the τ-active `(p+1)`-sets correspond to the
tagged family `𝒯^τ_p = {A' ∈ I_p(H_τ) : A' ∩ W_τ ≠ ∅}`. F2's per-tag arcs delete `q ≠ τ` and keep τ active. They correspond
exactly to down-shadow arcs `𝒯^τ_p → 𝒯^τ_{p−1}`. So the per-tag criterion asks, for each tag, whether the tagged family of
`(H_τ, W_τ)` has a matching from rank `p` into rank `p−1`. A necessary condition is `q_τ(p) ≤ q_τ(p−1)`, meaning the tag's own
summand is `≤ 0`.

F2's code (`per_tag_frontier.py`) implements exactly this: left = τ-active sources, right = τ-active deletion images with
`q ≠ τ`. The docstring's "right = all deletion-images" is wrong, but the code is right.

I also checked F2's sufficiency argument and it is correct. Each tag τ gets its own injective map `φ_τ` into τ-active targets.
Setting `f(B, A) = #{τ : φ_τ(B) = A}` sends exactly `w_F(B)` units from each source. It delivers at most `#{τ active in A} = w_F(A)`
units to each target, and every arc used is in (D). So per-tag reach at every tag implies deletion-only (HALL) at that row. This is
elementary and `proved_informal`-level. It is F2's statement, which I verified.

**Replay of F2, copy-out-first** (`replay/run/`, `python3 -B`):
- `families.py` smoke: OK.
- `validate_matching.py`: 200 trials, 0 mismatches. The output is byte-identical (`0bcaca03…`).
- `validate_baseline.py`: all rows match, including `k = 6, 7` `S = −24151, −111045`. The output is byte-identical (`443bc987…`).
- `census.py` (241 s) and `census_push.py` (44 s): `census_out.json`, `census_summary.json`, `census_push_out.json` and
  `census_push_summary.json` are all byte-identical to the shipped digests. There are 30 + 26 = 56 rows, with no per-tag failure,
  no joint-Hall failure, and WID on every row.

**Independent replays on my instrument** (`replay2.py`; trees rebuilt from the return's stated family definitions):

| Row | `n` | `α` | `x` | eligible `p` | Supply / capacity / `S` | max summand | Per-tag failures | Del / full flow |
|---|---|---|---|---|---|---|---|---|
| `G_5`, cherry = 1, `p = 8` | 19 | 12 | 6 | {8} | 3125 / 6100 / −2975 | **0** | 0 | 3125 / 3125 |
| `T(6,2)`, `p = 8` | 20 | 13 | 6 | {8} | 6350 / 11155 / −4805 | −400 | 0 | 6350 / 6350 |
| `G_3`, cherry = 3, one arm of length 1, `p = 6` | 13 | 9 | 4 | {6} | 258 / 544 / −286 | −23 | 0 | 258 / 258 |

All three agree with F2's rows. I then enumerated every tree in all of F2's stated families: 124 trees, 73 of them with an empty
eligible window. They have exactly 56 eligible rows, and no window is wider than 2. So F2's `MAX_ELIGIBLE_P_PER_TREE = 3` cap
**never bound**, and the 56 rows are all the eligible rows of the stated family ranges.

## Attacks and findings

1. **Obligation (b) was not discharged in its chartered form (major).** The allocation (item 4(b)) and ruling 42 require an
   exhaustive census over a stated **order** range covering every tree of every order in it. Cycle 4 F2 was faulted for skipping
   orders ≥ 18. F2 instead ran a selection over hand-picked deformation families (`G_k` variants, `T(m,1)`, `T(m,2)`). Its
   statement that "every tree in the stated range is covered" is true only of the family parameter range. A family selection
   cannot identify "the smallest eligible `(T,p)`", so the return's frontier answer is not what was chartered.
2. **Critic-derived: exhaustive order census, orders 13–18 (all free trees, every eligible `p`, no cap)** (`census_all.py`).
   - Coverage: 1301 + 3159 + 7741 + 19320 + 48629 + 123867 trees. They have **51 123 eligible rows**, by order
     163 / 313 / 528 / 2763 / 10061 / 37295.
   - On every row: `F_p` equals the whole leaf set; WID holds from both sides; every per-leaf summand is `≤ 0` (901 rows have a zero
     summand); `S ≤ −192`; and **every tag's deletion injection exists**. Tags are reduced to Aut-orbits by the rooted canonical code
     at the tag. The saturating matchings are explicit and therefore self-certifying.
   - Second instrument: a literal joint deletion-only Dinic max-flow equals supply on all 1404 rows checked. That is every row of
     orders 13–15 plus a seeded sample (99318) of 400 rows of orders 16–18.
   - Consequences: by the sufficiency argument, (HALL) with deletion arcs alone holds at **every eligible row of every tree of order
     ≤ 18**. The smallest eligible row where every summand is `≤ 0` but a per-tag injection fails, if one exists, has **order ≥ 19**.
     Grade: `bounded_computation`, STATED, awaiting a second read.
   - Caveat: no eligible row of order ≤ 18 has a positive leaf summand. So this whole range lies outside the regime where the lower
     region needs compensation across tags. A small complete census tests the easy part of (HALL) only.
3. **Critic-derived laboratory frontier (non-eligible ranks)** (`lab.py`, `labcert.py`: all trees of order ≤ 13, every
   `1 ≤ p < α`, every leaf orbit). Per-tag failures with a summand `≤ 0` **do occur**, so the per-tag criterion is strictly stronger
   than the per-leaf sign. There are 2, 4, 3, 56, 87 and 99 such triples at orders 8–13.
   - **Smallest:** order 8, the tree with centre 0 joined to hub 1 (leaves 2, 3, 4) and hub 5 (leaves 6, 7). At `p = x = 3` with tag 2,
     the summand is 0 and there are 11 sources but only a 10-matching.
   - **Smallest with a strictly negative summand:** order 10, the double star with hub 1 carrying 5 leaves and hub 0 carrying 3 leaves.
     At `p = x = 4` with tag 2, the summand is −1. The Hall violator is checkable by hand: X is the τ-active 5-sets avoiding hub 0.
     Their deletions stay 0-free, so `|X| = C(7,4) − C(3,4) = 35` sources meet only `|N(X)| = C(7,3) − 1 = 34` targets.
   - **Closest to the window:** order 13, with edges 0–1, 0–9–10, 0–11–12, 1–{2, 5, 6, 7, 8}, 2–{3, 4}, where
     `i = (1, 13, 66, 177, 282, 281, 176, 66, 13, 1)`, `α = 9` and `x = 4`. At `p = 5 = x + 1` with tag 3 and `W = {1, 4}`, the summand is
     −2 and there are 61 sources but only 59 matchable. Mechanism: no 6-set can contain the hub witness 1, so the four τ-active targets
     containing 1 are unreachable stranded capacity. The rest is `i_4(Φ) = 61 > i_3(Φ) = 59` on `Φ = P_5 ⊔ 4K_1`. Its only eligible rank,
     `p = 6`, passes.
   - Both violators were extracted from the matching, and `N(X)` was recomputed literally from the definition.
   - A targeted probe (`probe.py`) generalises the order-13 tree: root with A pendant `P_2`s and Z leaves, hub with L leaves, support
     with c tags, `n ≤ 22`. It finds 21 failures at `p = x + 1` and **none at its 386 eligible rows**.
   - Heuristically, the stranded-witness mechanism needs `p ≤ mode(Φ) + 1 ≈ x + 1`, one rank short of eligibility. That is an
     observation, not a proof. These are laboratory facts and not evidence about (HALL).
4. **False literal (struck).** The return says "every per-leaf summand strictly negative on every tested row, in fact". This is false
   on **3 of the 56 rows**: `G_5`, `G_6` and `G_7` with cherry = 1. F2's own code, replayed, gives summands `[…, 0]` there. The zero
   belongs to the single cherry leaf: `W = {root}`, and `q(j) = C(k, j−1)·2^{j−1}` vanishes at both `j = p` and `j = p − 1`. The tag
   is never active, and its injection is vacuous. The substantive `≤ 0` claim stands.
5. **Overstated scale (struck).** Step 0 says literal enumeration is "tractable at the tree sizes this route reaches (`n` up to 30)".
   The largest completed row is `n = 26` (`T(8,2)`), and the `n = 30` instance was excluded, as the return itself discloses.
6. **"Validated against CT-1's own construction" (narrowed).** CT-1's scripts were read, not executed. The check is only that
   `G_3/6` saturates, which agrees with a Cycle 4 record's reported outcome at one row. Read it as "consistent with the Cycle 4 record
   at `G_3/6`".
7. **Joint-Hall reporting.** Both deletion-only and full max-flows are literal. The switch arcs are the literal (S) with exactly two
   neighbours, and the arc capacity `w_F(B)` is harmless. Every per-tag test passed, so the joint checks add nothing beyond the
   sufficiency argument on these rows. They are correct but not independent evidence of anything more.
8. **Gate-31 lines.** `central obligation attempted: yes` is present. The two instruments for `S` (literal `w_F` sums versus the
   `H_v`/`R_v` aggregate) are named in Step 2 but not on a dedicated line. Minor.
9. **Direction and quantifiers.** The return never treats a family census as (HALL) and never calls a flow universal. its headline flag (no) is correct.

## Mechanism-equivalence and fence check

- **Per-leaf down-map (substantive).** By finding 3 of the re-derivation, CT-1's per-tag deletion injection *is* an injective down
  map from each leaf's tagged family, rank `p` into rank `p−1`. That is a per-leaf down-map injectivity mechanism. The return lists
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` among the refuted keys and asserts that none of them "concerns a per-tag
  deletion-injection existence test specifically", without giving a distinction. I did not read the registered text, which is
  outside my capsule. The comparison here is against the key's name and the contract's description, and the adjudicator should
  byte-compare it with the registered statement.
- **Scope of the per-tag method.** The method cannot reach any row where a single leaf summand is positive, which is where the lower
  region's difficulty lives. It also fails at some non-positive rows (finding 3). So it is not a candidate route to full (HALL).
  F2's chartered use is legitimate: it maps the method's reach, the allocation assigns exactly that, and no universal claim is made.
  It is not a revival, but the return's equivalence paragraph must be narrowed to say this.
- **Other fences.**
  - No use of (LIFT) or (DCB).
  - No RTree wording.
  - No census value used in a proof.
  - Closed aggregate theorems are not re-proved; GK-SIGN is used only as a fidelity replay.
  - `T(m,k)` is correctly kept distinct from `T_m`.
  - CT-1 is used only as a working label and never as a key or alias (ruling 41).
  - No proposed key; no live root read (sources only, per its disclosure).

## Certification audit

| Literal | Status |
|---|---|
| "56 eligible instances", "0 per-tag failures", "0 joint-Hall failures", "WID on all 56" | **Backed.** Replayed byte-identically, and 56 independently confirmed as all eligible rows of the stated families. |
| Baseline values 253/527/−274, 1542/2735/−1193, 8875/14196/−5321, −24151, −111045 | **Backed** (replay). |
| "200 random bipartite instances, 0 mismatches" | **Backed** (replay, byte-identical). |
| "strictly negative on every tested row" | **Struck** (3/56 rows have a zero summand). |
| "(`n` up to 30)" | **Struck** (max completed `n = 26`). |
| "exhaustive census over a STATED order range", "every tree in the stated range is covered" | **Narrowed**: exhaustive over family parameter ranges only, not an order-range census (ruling 42). |
| "validated against CT-1's own construction" | **Narrowed** to consistency with one recorded row. |
| "MANIFEST.json byte-identical" (working versus replay dir) | **Not verified** (`c5-F2-replay/` is outside my grant). The shipped outputs replay byte-identically, which is the substantive determinism claim. |
| Artifact digests (15) | **Backed.** |
| Cap `MAX_ELIGIBLE_P_PER_TREE = 3` "disclosed" | **Backed**, and it never bound (max window 2). |

## Verdict

The mathematics the return actually ships is correct. That covers the operational reformulation, its sufficiency argument, and 56
exact rows that replay byte-identically and agree with an independent instrument. The return does not deliver obligation (b) as
chartered (an all-trees order census). It carries one false literal and one overstated literal, and its mechanism-equivalence
paragraph understates that per-tag injection is a per-leaf down-map mechanism.

My own critic-derived census closes the ruling-42 gap through order 18: 51 123 eligible rows, with no per-tag failure and no positive
summand. It also locates laboratory per-tag failures at non-eligible ranks (orders 8, 10 and 13). Grades:
- the return's census: `bounded_computation`;
- my census and laboratory rows: `bounded_computation`, STATED;
- the sufficiency argument: elementary, `proved_informal`-level, STATED by F2 and verified here.

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Frontier (b), exact.** The open question is the smallest eligible `(T, p)` at which every per-leaf summand is `≤ 0` but, for
   some `τ ∈ F_p(T)`, the tagged family `{A ∈ I(H_τ) : A ∩ W_τ ≠ ∅}` has no matching from rank `p` into rank `p − 1`. This critic
   found none at orders ≤ 18 (all trees), so any such row has order ≥ 19. Next steps: an all-trees census of orders 19 and 20
   (317 955 and 823 065 trees; `census_all.py` scales with a C-free rewrite of the enumeration), or a proof that the stranded-witness
   mechanism of the laboratory rows needs `p ≤ x + 1`.
2. **Where compensation first appears.** The smallest eligible row with a **positive** leaf summand is unknown and has order ≥ 19.
   Only there does (HALL) need cross-tag routing, and the per-tag method is structurally excluded there.
3. **Letter (b′) half.** Still unsupplied. No infinite eligible family at `proved_informal` came from F2 or from this critique. For
   `G_k` with cherry = 1, the cherry tag is vacuous at eligible ranks (finding 4). A uniform proof would have to handle the root leaf
   and the `k` arm tips as in CT-1. I have not outlined one.
4. **Erratum.** `C5-CRITIC-PROTOCOL.md` duty 1 quotes the Cycle 4 Stage 2 seal (`f0b5a2a1…`) instead of `2e8e3d44…`.

## Artifact inventory

Scratch root is `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-F2-T/`.
Everything was run with `python3 -B`, and there is no `__pycache__`.

**Own instrument** (`own/`):

| File | SHA-256 |
|---|---|
| `inst.py` | `bb298d238f076bb6c9fbc35de3149fa04a3b195109e2328628ba910d518018a7` |
| `trees.py` | `e35456f84d9bb6f131a8af4c8156251cbedf4e4a5e3feb6da72eeed995d941d4` |
| `validate.py` | `b122ed1d2c77fe9f9d125d8b0d0cfce5c16e53088b5b1176d00f96c158e61636` |
| `replay2.py` | `f05c337cedd866924e5cfe2039ba1f6667137fa9130b6ecf8f223074f6fca3e7` |
| `census_all.py` | `f377fd6222d69d56fd4e7e32df08645f44cc3d2ee95c444b1c2535f336817a88` |
| `census_all_13_17.json` | `c821f5f678498ee3c0b8236c63411de84da432d9e1f88a827fe2ae0d38794acf` |
| `census_all_18_18.json` | `ff5fd4ad6cb2c0939417e8147b39d7c7241bc3102634027c16ebede40d020d0b` |
| `run18.log` | `3043febb6d8a2e2d18ec34ec314c2f4291206a9a5d5fbffe363f8cd7bffb4648` |
| `check2.py` | `1515be05a4e54ab78b69d68f959897c8e131d25caecc49001e0c5e755b661ac0` |
| `lab.py` | `9d766b113c8866e55e2238d12197f184ca0e2cfbcbf26a9083f6bb0c36684009` |
| `lab_13.json` | `3b53a04d555e159a0e16ca4bcbbfa757013002b0a1018653bf6ac15e3f7da143` |
| `labcert.py` | `85812342043e096fa0af29dd0329d3ddb6c38709024acfd660ada608c40eac62` |
| `probe.py` | `e9e6716847c770fb439a70c6fed5c16827203825eb61626e32f285a793241479` |
| `probe_22.json` | `382e58dca7e78e035cf046b54395707a3f2e7ef08336f86dc7252b5ff18136c7` |

Replay commands, run in `own/`:
- `python3 -B validate.py`
- `python3 -B census_all.py 17 13`
- `python3 -B census_all.py 18 18` (about 9 min)
- `python3 -B check2.py`
- `python3 -B lab.py 13`
- `python3 -B labcert.py`
- `python3 -B probe.py 22`
- `python3 -B replay2.py`

**F2 replay** (`replay/` and `replay/run/`): F2's 15 inventoried files plus `make_manifest.py` and `MANIFEST.json`, copied out. The
reproduced outputs in `replay/run/` match the shipped digests listed above. Logs: `run/census.log` `11d32f89…`, `run/push.log` `1971e4f9…`.

**Process and read-boundary disclosures.**
- (i) While auditing the seal discrepancy I ran one `grep` for the two seal strings over the globs `control/*.md control/*.json`.
  That search was above my grant. It displayed single matching lines from `C4-CRITIC-COMMON-BRIEF.md`, `C4-CRITIC-PROTOCOL.md`,
  `C4-STAGE3-AGENTS.json`, `C4-STAGE3-ADMISSION.json`, `C4-STAGE2-PACKET-MANIFEST.json`, `C5-STAGE3-AGENTS.json` and
  `C5-STAGE3-ADMISSION.json`. The only content they showed was seal strings, which I used only to identify the stale digest.
- (ii) I ran `ls` of `scratchpad/c5-F2/`, which is within the grant.
- (iii) I read no other return, critique, adjudication, `sources/` file or other root, and used no network or installs.
- (iv) One background job, the order-18 census (PID 18638), exited on its own before this write, confirmed by `kill -0`. No job is
  running now.
- (v) The harness saved a copy of the return text under the session's tool-results directory for display. It is the capsule member itself.
