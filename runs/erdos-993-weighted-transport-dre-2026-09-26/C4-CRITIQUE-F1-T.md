# Critique

Critic `C-F1-T` (orientation T, prove) of Cycle 4 Stage 3 return `F1` (route `C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH`, orientation F). Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Object: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN.

**Boot acknowledgment.** I am operating within VerityOS. Following the dispatch's restricted boot, I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS path. The host injected the root `CLAUDE.md` and the memory index into context at session start. I did not open or act on them beyond the boot they direct.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m] (verbatim from this session's environment declaration, "The exact model ID is claude-opus-5-5[1m]").

**Read boundary.** I read the dispatch file, the 14 capsule members, the frozen source `sources/lower-region/instruments/cb-switch-cut/PROTOCOL.md` (for its digest only; it is a Stage 2 member), and the inventoried artifacts of `scratchpad/c4-F1/`. The artifacts were copied out first into my scratch and replayed there. I ran one non-recursive `ls` of `scratchpad/c4-F1/` to inventory it, and one of `cycles/cycle-4/stage4/critics/F1/` to create my output directory. That second listing showed a sibling directory `U/`, which I did not open. I also ran one `find … -name __pycache__` rooted in my own scratch directory. I did not read the byte-identical `scratchpad/c4-F1-replay/` copy, because it is outside my grant. I did not read any Cycle 1–3 record that the return cites (the Cycle 3 C-F1-T critique, Cycle 3 F1's return, `ROUTE-STATE.md`, `CLAIM-IDENTITY.run-local.json`), because none is a capsule member. Every statement below about those records is marked unverified by me. No network use, no installs, no writes outside my scratch directory and this file.

## Identity and seal audit

- **Dispatch file:** SHA-256 `f4fc8a5a7f7785b7574f4995c10ff1036bfa78615ced5bbb3b1c5140a08af9f9`, which matches the dispatch message.
- **Capsule seal** (`control/c4-critic-capsules/F1-PACKET-MANIFEST.json`): the recorded seal is `2cf863de5d64a1745052514b8347dfa5eb794bbed6e668b6a3d8ce4a642cae6b`. I recomputed it over the canonical JSON (without `seal_sha256`, sort_keys, separators `(",", ":")`, no trailing newline) and got the same value.
- **Capsule members:** all 14 match their listed SHA-256 and byte counts. The return `cycles/cycle-4/stage3/returns/F1/RETURN.md` is `2b4adde7…1b83`, 37002 bytes, and the Stage 3 manifest lists the same digest.
- **Stage 2 seal:** `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, recomputed and equal.
- **Stage 3 seal:** `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, recomputed and equal.
- **Stage 4 dispatch seal:** `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, recomputed and equal.
- **Source digest in the return:** `sources/lower-region/instruments/cb-switch-cut/PROTOCOL.md` = `5b09a7f3…d952`. This matches both the file and `control/SOURCE-DIGESTS.json`.
- **Generator and output digests** stated in the return, all confirmed on the copies:
  - `micro.py` `0f46eaa3…`
  - `validate5.py` `6329972d…`
  - `run_rows2.py` `97b7549c…`
  - `run_rows.py` `5d01d185…`
  - `coarse_check.py` `28c280f8…`
  - `rows_output.json` `3ca09377…`
  - `rows_output2.json` `6d910653…`
- **Internal payload digests:** two of the literals are wrong. Details are in `## Certification audit`.
- **Model disclosure:** the return's line "chartered sonnet/xhigh … `claude-sonnet-5`" is consistent with `C4-ALLOCATION.md` (routes are Claude Sonnet 5 xhigh).
- **Stage 3 read-boundary disclosures:** the F1 entry is benign (four names-only `ls` calls, one harness-backgrounded run stopped via TaskStop). T2's incident record says a `ps aux` showed "F1 and F2's background jobs". That is consistent with F1's one auto-backgrounded run. Nothing in the evidence depends on it.
- **Uninventoried files:** `scratchpad/c4-F1/` contains `run_rows_strict.py` and `rows_output_strict.json` (`0a36677d…`), and neither is mentioned in the return. No reported number depends on them.
- **File-time note:** `bigrun2.py` (01:57) was modified after `rows_output2.json` (01:56). My replay of the shipped `bigrun2.py` reproduces `rows_output2.json` exactly apart from timing fields, so every reported max-flow value is consistent with the shipped, post-sentinel-fix code (`INF = 10·total_supply + 10`).

## Independent re-derivation

**Instrument 1: a literal brute-force instrument** (`own/lit.py`), written by me from `SEMANTIC-CONTRACT.md` §1.2 and sharing no code with `scratchpad/c4-F1`.
- Every tree passes a separate `|E| = n − 1`, connectivity and acyclicity test.
- Independent sets are enumerated as bitmasks.
- `x` is computed through rank `α` (`Δ_α = −i_α` included).
- `F_p` is derived from `Δ_p(T − v) < 0` on the original tree.
- `w_F` counts active tags only (`B ∩ (N(s_v) ∖ {v}) ≠ ∅`).
- The relation is (D) ∪ (S) taken literally (switch at `u ∉ B` with exactly two neighbours in `B`).
- `S` is computed as the C5LA1 aggregate from literal `H_v`, `R_v` counts, and `supply − capacity = S` is asserted on every instance.
- Max-flow is an exact-integer Dinic with a `2^4000` sentinel.

The fixed points of the common brief all reproduce (`own/fixed.py`):
- `K_{1,12}` at `p = 8`: `n = 13`, `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`, flow 1980.
- Path-star `(2,3,4)` at `p = 7`: `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, 1483 / 2701 / flow 1483, `S = −1218`, 2025 positive-to-positive arcs.
- Path-star `(2,2,4,3)` at `p = 8`: `n = 18`, `α = 13`, `x = 6`, `|F| = 12`, 8033 / 13467 / 8033, `S = −5434`, 11691 arcs.
- All three are eligible.

**Instrument 2: record-scale closed-form component generating functions** (`own/rows.py`). I derived these myself for the CB pattern (path `r–s–v`, chokes `u` on `r`, supports `b` on `u`, one private leaf `c` per support), with groups `[(count, d)]`:
- Choke-out branch: `(1+2x)^d`. Choke-in branch: `x(1+x)^d`. Whole tree: `I(T) = x(1+x)·Π(1+2x)^d + (1+2x)·Π[(1+2x)^d + x(1+x)^d]`.
- `F_p` is derived per orbit from literal `T − v` and `T − c` polynomials.
- `S` is computed two ways: (A) the active-weight layer generating function `W`, as `W[p+1] − W[p]`; (B) the aggregate `Σ_F [q(p) − q(p−1)]`, from separate `H_v`/`R_v` polynomials (for the arm tip `q_v = [x·Π(1+2x)^d]`; for a private leaf, the literal `T − {c, b}` and `T − N[b]` polynomials).
- Multiplication uses exact Kronecker substitution.
- The instrument was self-checked against Instrument 1 on `CB(2,3)/6`, `CB[3,2]/5` and `CB(4,2)/8` (`n`, `α`, `x`, `|F|`, `S` all equal).

Results (both sides equal on every row; all rows eligible; `F_p` derived = all leaves):

| Row | `n` | `α` | `x` | window | `p` | `|F|` | `S` (sign, head, digits) |
|---|---|---|---|---|---|---|---|
| `CB(8,86)` | 1465 | 775 | 458 | [460, 516] | 460 | 689 | `−74235140843389047729457826493…`, 328 |
| `CB(8,89)` | 1516 | 802 | 474 | [476, 534] | 476 | 713 | `−23574990702375145359228214474…`, 340 |
| `CB(8,92)` | 1567 | 829 | 490 | [492, 552] | 492 | 737 | `−74881043071022785861898765191…`, 351 |
| `CB(8,108)` | 1839 | 973 | 575 | [577, 648] | 577 | 865 | `−14066552778914304824141836847…`, 413 |
| `CB(7,144)` | 2163 | 1153 | 671 | [673, 768] | 673 | 1009 | `−50696468667517556525170154248…`, 483 |
| `G(8^82,7^2)` | 1427 | 755 | 446 | [448, 503] | 448 | 671 | `−18490741345286020874266913330…`, 320 |

- Every supply, capacity and `S` value (both of F1's sides) in the shipped `rows_output.json` equals mine exactly on all six rows.
- F1's Table 1 `total_supply` equals my supply on all six rows.
- The return's `CB(8,86)/460` 328-digit value is independently confirmed by me.

**Replays** (copy-out-first, `python3 -B`, in `scratchpad/c4-crit-F1-T/replay/`):
- `micro.py`: `TOTAL_CHECKED 11892 TOTAL_MISMATCH 0`.
- `validate5.py`: polynomial P/Q match in 4/4 cases and 0 missing arcs. **The script itself prints `VALIDATE5_ISSUES`**, with 878 / 986 / 733 / 1094 extra class arcs on its four trees. It also prints `VALIDATE5_MAXFLOW_OK` on 14 `(tree, p)` instances.
- `coarse_check.py`: the three coarse rows saturate.
- `run_rows.py` (355 s) and `run_rows2.py` (196 s): both reproduce their shipped JSON exactly once timing fields are removed. My replay's `PAYLOAD_SHA256` differs from the shipped one only because the payload contains wall-clock `time_s` fields (see the certification audit).

**Micro-rules re-derived.** I re-derived D-b, D-u / S-at-b, S-at-u-no-r and S-at-u-with-r from the contract (the derivation is in `## Attacks and findings` item 1). I then checked the necessity halves of §2.5 against the literal relation on 7 CB trees (`own/rules.py`):
- 603,879 q-decreasing arcs, 173,118 q-increasing arcs and 136,134 `q = 0 → 1` arcs.
- **Zero violations.**
- The necessity directions are therefore sound as bounded facts, and so is the sharper rule stated in item 1.

## Attacks and findings

1. **Micro-rules (§2.3, §2.5): the necessity directions are correct; the "sufficiency / exactness" reading is not.** From the contract:
   - D-b lowers one out-branch's `n_b` by 1.
   - Switch at `u_i ∉ B` needs `|N(u_i) ∩ B| = 2`. That means either `r` plus exactly one support (S-at-u-with-r, possible only in `sec`/R0), or exactly two supports with no `r`.
   - Switch at `b_ij` needs `u_i, c_ij ∈ B` (S-at-b, in-branch only).
   - Switch at `r` needs exactly two of `{s, u_1, …}`.
   - Switch at `s` needs `r, v ∈ B`.

   These match the return's ten transition types, and the literal check above confirms the necessity claims. Two points go further than the return:
   - **A sharper rule the return did not use.** Across all 603,879 literal q-decreasing arcs, target `hasB` equals source `hasB`. F1's model instead admits both target `(hasA, hasB) ∈ {10, 11}` for every source.
   - **"Sufficient" does not give class-level reach.** The return argues that any `hasA` target "reverses to a valid q+1 source, for ANY values of the OTHER branches". That shows every such target has *some* preimage. It does not show that every source class joined to a target class reaches every target in it. The return nonetheless treats the class arcs as exact (bigrun2.py docstring: "EXACT arcs (no over/under approximation needed anywhere)"; §7: "exact reachability rules … **proved**"). `proved` is not a grade under `SOLUTION-CONTRACT.md` §4. The necessity halves are at most STATED lemmas on the CB shape, at `bounded_computation` as checked.

2. **The logical direction of "saturates" (the attack brief's central question).**
   - **What Table 1 certifies.** F1's class network puts an uncapacitated arc from source class `C` to target class `D` whenever the model's rule set allows it. A saturating flow there proves only this: for every union `U` of refined source classes, `Σ_U w_F ≤ Σ` of the **whole** weights of the target classes the **model** joins to `U`.
   - **Why that is weaker than literal Hall on class unions.** The literal `N(U)` is a subset of those classes, often a tiny one. So the result is strictly weaker than "weighted Hall holds for every union of refined classes in the literal network", and it does not exclude a class-union (CUT).
   - **The relaxation is pervasive, not confined to the two `S-at-r` bridges.**
     - Laboratories: I computed the literal `N(C)` weight for every refined source class on 14 small CB trees at every rank where `F_p` = all leaves (`own/class_slack.py`). In **1171** (class, rank) instances, the literal class-adjacency relaxation overstates `Σ_{N(C)} w`. F1's model overstates it by as much as 5120 against 10 (`CB(2,5)/11`, `sec01`).
     - Record scale: at `G(8^82,7^2)/448` the model gives `sec01` the capacity `|sec01_p| + |sec10_p| + |sec11_p|`. This agrees exactly with F1's own class GFs, so the check is not built on my own class model. The literal `N⁺(sec01)` is `|sec01_p| + #{exactly one branch with n_b = 1 and an empty pair, all others n_b ≥ 2}`. The model's value is **2.1 × 10^7 times** the literal one. On the CB rows the factor runs from 2.7 × 10^7 to 2.4 × 10^19. For `sec00` the factors run from 4.6 × 10^16 to 5.0 × 10^40 (`own/sector.py`).
   - **The class partition is also too coarse.** At the laboratory `CB[3,2]`, `p = 4` (ineligible, `S = 167`; `own/sec32.py`), the sector subnetwork gives:
     - literal flow over every `X ⊆ sec`: 65 of 80;
     - literal flow over unions of F1's `sec` sub-classes: 70;
     - F1's model: 70.

     The worst literal sector family has deficit 15, and no refined-class union sees more than 10.
   - **Sentences struck:**
     - §5: "No class-union (CUT) was found … strongest adversarial record at six rows". Narrow it to: "no deficient union of refined classes exists **in F1's relaxed class model**".
     - `## Remaining obligation` item 1: closing the two bridge arcs "converts Table 1 … into a genuine Hall CERTIFICATE for every union of these refined classes". This is false. Class-level aggregation is itself a relaxation unless every joined class pair is reach-complete, and it is not.
     - §2.6: "a small number of 'extra' edges … confined to two places". Of the shipped validator's own 733–1094 extras per tree, 104–339 join nonempty classes. Their categories include the general q-decreasing arcs (the most numerous), the `UPGRADES` arcs and self-arcs of nonempty classes (`analyze_v5.py`).
   - **What remains valid:** a deficiency in the model *would* have exhibited a literal deficient family, as the return says.

3. **The 14-instance "exact max-flow match" cannot tell the model apart from a trivial one** (rulings 17/24).
   - In all 14 instances, the literal flow equals `min(total supply, total capacity)`.
   - 10 of the 14 have `S > 0` (flow = total capacity, which is the previous layer's weight). 4 saturate. None is eligible.
   - A complete class graph gives the same 14 values by construction. So the match cannot detect over-permissive arcs, and both of its sides are set by the layer totals that the polynomial check already equates.
   - On 49 further laboratory rows (`own/lab_run.py`), literal, literal-class-union, class-adjacency-relaxed and F1-model whole-network flows all equal `min(supply, capacity)`.
   - Whole-network flow matching is therefore no validation of the class arcs. Struck as evidence: "decisively … EQUALS the literal brute-force max-flow value … digit for digit".

4. **Obligation (b), `G(8^82,7^2)/448`, is not answered.**
   - The retraction of the Aut-orbit collapse is complete. No number in the return depends on it.
   - The replacement claim, "no deficient `X ⊆ sec` was found" as a special case of Table 1, is struck. Table 1 tests only unions of the four `sec` sub-classes, and only in the relaxed model. It says nothing about arbitrary `X ⊆ sec` (compare the laboratory in item 2: 65 against 70).
   - F1's `hasA` lumps `n_b = 0` with `n_b = 1`, so the partition cannot even express the switch-dead sector family (see `## Remaining obligation`).
   - Grade of (b) in the return: none. The SR-C3-6 question is still open.

5. **Fidelity.**
   - The weight counts active tags only. In the return's §2.2 derivation, `W_c = {u_i}` and `W_v = {r}`. This matches the contract, errata R30-E-b, and my own `W` polynomial.
   - The relation is literal in `brute.py` (0 mismatches against `micro.py`).
   - `F` is fixed at rank `p` from `Δ_p(T − ℓ)`.
   - `x` is computed through `α`.
   - `supply − capacity = S` is asserted from two sides. These are separate functions inside one module (`fastrow.py`), which I did not audit line by line. My independent two-sided instrument agrees on every row, which discharges gate ruling 31 for the six `S` values.
   - F1's class machinery hard-codes `F` = all leaves (`validate5.py` sets `F = leaves + [2]`). This is legitimate only because Table 0 derived `F_p` = all leaves on each of the six rows, which I confirmed independently.
   - Dinic sentinel: the fix is in `bigrun.py`/`bigrun2.py` (`INF = 10·total_supply + 10`). The sanity script `coarse_check.py` is shipped and replays. Every reported flow was replayed with post-fix code.

6. **Comparison with the Cycle 3 record.** My exact sector values match every figure the capsule quotes:
   - Deletion ratios: `460/459`, `476/475`, `492/491`, `289/288`, `337/336`, `448/447`.
   - Whole mixed-neighbourhood ratios `Σ_{N⁺(sec)} w / Σ_sec w`: 14.3213 / 14.7859 / 15.2506 at 460 / 476 / 492 (record: 14.32 / 14.79 / 15.25).
   - Switch image alone at 492: 14.2526 (the SR-C3-6 advisory).
   - `G(8^82,7^2)/448`: switch image 13.1075 × sector supply (record "≈ 13.1×").

   I did not verify F1's reported digit-for-digit agreement with Cycle 3 F1's 328-digit `S` (that return is not in my capsule). The value itself is confirmed by my instrument.

7. **Plateau test (gate ruling 30):** the return supplies none of items (a)–(d). It has no restricted-scope (HALL) theorem, no full (HALL) at a switch-necessary eligible row, no (CUT) candidate and no Lean award. It found no cut and issues no conjecture.

## Mechanism-equivalence and fence check

- The return proposes no mechanism, so it revives none of the ten refuted keys. Its class model uses (D) ∪ (S), not deletion-only, and makes no universal claim.
- It re-proves no closed region. Table 0 recomputes row data. That is not a contribution, and it is not presented as one.
- No census value, RTree wording or controller prior enters as evidence.
- It does not use (LIFT) or C3-LA1 to turn a class-level flow into (HALL). The citation of C2-LA1 is explicitly informational.
- **One fence-adjacent risk.** The Cycle 3 "(τ, q) class-union Hall" record is used as the reference for `coarse_check.py`. If that record was established with the same class-level relaxation (arc = some edge, full-class capacity), then agreement with it confirms tooling consistency, not literal Hall. I cannot see the Cycle 3 critique, so I only flag this for the adjudicator.
- **Claim identity.**
  - Keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, unchanged), `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (used), `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (cited), `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (distinguished) and the bounded record `R30-CB-RECORD`.
  - F1 registers no key.
  - I could not re-run F1's alias check (the run-local registry is not in my capsule).
  - Any synthesis registration of the six-row Table 1 would have to say "relaxed class model" in its name (ruling 33: key names are predicates). "Refined class-union Hall" is false when read without that qualifier.

## Certification audit

Backed (by my replay or my independent instrument):
- The six rows' `n`, `α`, `x`, window, eligibility, derived `F_p` = all leaves, and supply, capacity and `S` from two sides.
- The 328-digit `S` at `CB(8,86)/460`.
- `TOTAL_CHECKED 11892 TOTAL_MISMATCH 0`.
- The class counts 3116 / 3224 / 3332 / 3908 / 5204 / 3044 (`8 + 3(4 + 12M)`, empty classes included).
- "saturating" in F1's relaxed model at all six rows.
- The file digests listed in the audit above.
- Replay times of the same order as stated.

Struck or narrowed:
- **Line 257–258, "internal `PAYLOAD_SHA256` field the same value" as the file SHA `6d910653…`.** False. The internal field is `73b46ebd…`, which is what line 430 says.
- **Line 429, `rows_output.json` internal `PAYLOAD_SHA256` `a6ff7fa8…`.** False. The shipped file carries `61f36826…`, and that value recomputes over its payload. Also, both payload digests hash wall-clock `time_s` fields, so no replay can reproduce them (mine gave `457120e7…` and `1a8b5774…` over otherwise identical content). They are not replay certificates.
- **"776 mismatches before the fix"** (§2.6 bug 1). No shipped evidence; struck as unbacked.
- **"On 6 small trees … at `d` up to 4"** (§2.6). The shipped `validate5.py` exercises 5 distinct trees with maximum arity 3. Narrow to that.
- **"Validated on 9 small trees, including 3 genuinely heterogeneous ones."** The shipped list has 4 heterogeneous arity lists (`[2,1]`, `[1,2]`, `[3,2]`, `[2,3,1]`). A harmless undercount.
- **"0 missing edges … a SAFE, if occasionally slightly permissive, model"**, "a small number of 'extra' edges", "confined to two places", "EXACT arcs", "the model's exact-integer max-flow value EQUALS … decisively". Narrowed or struck per findings 2–3. The shipped validator's own `VALIDATE5_ISSUES` output is not disclosed in the return.
- **"Proved"** (§7, twice). Not a grade. Narrowed to "necessity directions STATED, bounded-checked (by me on 913k literal arcs)"; the exactness/sufficiency reading is struck.
- **Obligation (b) "covered as a special case"; "strongest adversarial record at six rows"; `## Remaining obligation` item 1 "converts … into a genuine Hall CERTIFICATE"; items 1 and 2b "likely tractable in under an hour" and "vanishing fraction".** All struck. The relaxation is not confined to the low-`q` bridges.
- **Verdict on the return's `## Remaining obligation`:** not exact. It names the wrong gap (the bridges) and omits the real one (literal class-union neighbourhoods and arbitrary `X`). A corrected statement is below.

## Verdict

verdict: retained_narrowed

headline_resolved: no

**What is retained**, at `bounded_computation`:
- **Table 0.** The six rows' `n`, `α`, `x`, derived `F_p`, and exact supply, capacity and `S < 0` from two sides. I reproduced it independently.
- **The necessity half of the micro-transition rules** for the CB shape, as a STATED lemma. It needs a second read before any registration.
- **Table 1, narrowed to its true content:** "F1's relaxed `(τ, q, hasA, hasB, inflag)` class network saturates at the six rows". It certifies no literal Hall statement, not even for unions of refined classes, and it does not exclude a (CUT).

**What is struck:** obligation (b) is unanswered; the two payload-digest literals are wrong; the validation claims are narrowed as above.

**Critic-derived advance** (mine; `bounded_computation`, exact integers; formulas validated against my literal instrument on 47 `(tree, p)` instances). At all six rows, four natural literal sector families have positive Hall slack under (D) ∪ (S) with the literal `N⁺`. Ratios `Σ_{N⁺(X)} w / Σ_X w` at `G(8^82,7^2)/448`:

| Family | Ratio at `G(8^82,7^2)/448` |
|---|---|
| The whole sector | 14.1052 |
| DEAD: no branch with `n_b = 1` and `n_c ≥ 1`, so no positive-weight switch exit | 16.2865 |
| F1's `sec01` | 17.4053 |
| F1's `sec00` | ≈ 42.1 |

On the CB rows the DEAD ratio runs from 16.5 to 36.0. DEAD is an `Aut`-invariant family that F1's partition cannot express. None of these is (b), which quantifies over every `X ⊆ sec`.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **(b) at `G(8^82,7^2)/448` is exactly: (HALL-COND) for every `X ⊆ sec`.** The sector sources are `r, v ∈ B`, all chokes out, and 447 pair elements; each has weight 1. Their positive-weight literal neighbours are:
   - sector `p`-sets (by deletion of a pair element), weight 1;
   - the `V, q = 1` targets of a switch at `u_i` when branch `i` has exactly one support, weight `n_c(i)`, shared by `d_i − n_c(i)` preimages.

   By the supermodularity argument of C2-LA1 restricted to subsets of `sec`, it suffices to treat `Aut`-invariant `X`. That is still a union of branch-state multisets, far too many to enumerate.

   **An obstruction a proof must respect (critic-derived, elementary).** Take a sector target with 28 empty arity-8 branches and 56 full branches, none of them live (the arity-8 ones have `n_b ≠ 1`). It has capacity 1, and all 448 of its preimages are switch-dead. So no uniform one-hop share rule (each dead source taking `1/447` from each of its 447 deletion targets) can certify (b). A certificate must redistribute non-uniformly across two hops, using the large switch slack of live sources (at least `1/7` per live branch) and the slack of targets with seven or more live preimages.
2. **Any class-level search must use the literal `N(U)`, not class adjacency.** One way: compute the literal neighbourhood weight of each source-class union by generating-function counting of the targets that have a preimage in `U`, as `own/sector.py` does for `sec01`, `sec00` and DEAD. The alternative is to refine to a partition proved reach-complete (`N(C) ∩ D ∈ {∅, D}` for every joined pair `C`, `D`). Only then does a class-level saturation certify Hall for class unions. Even then it is not (HALL) unless the classes are `Aut`-orbits (C3-LA1).
3. **Allocation item 3(a)** (a cut or its exclusion over `Aut`-invariant all-positive-weight families at the six rows) remains fully open. F1's Table 1 does not reduce it.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-F1-T/`, standard library only, run with `python3 -B`. No `__pycache__` remains. No background job remains: the two replay jobs, PIDs 38027 and 38029, exited on completion, and `ps -p` confirmed this before this write.

**My own instruments and outputs:**

| File | SHA-256 | Purpose |
|---|---|---|
| `own/lit.py` | `e44ddf99…` | literal instrument |
| `own/fixed.py` | `fb2620ec…` | fixed points |
| `own/lab.py` | `9b03ece5…` | CB generator and F1-class labeller written from the return's definitions |
| `own/lab_run.py` | `f3c0aa12…` | whole-network flows, 49 rows |
| `own/lab_run.out` | `8aafd7f1…` | output of `lab_run.py` |
| `own/class_slack.py` | `01634f72…` | per-class literal vs relaxed vs model `N` weights |
| `own/class_slack.out` | `55a11316…` | output of `class_slack.py` |
| `own/class_slack.json` | `9b2b97a1…` | data from `class_slack.py` |
| `own/sector_lab.py` | `17ac17fb…` | sector-restricted flows |
| `own/sector_lab.out` | `72f9edb2…` | output of `sector_lab.py` |
| `own/sec32.py` | `e56e4d04…` | the `CB[3,2]/4` class-coarseness example |
| `own/rules.py` | `93ebfabb…` | literal check of the q-changing rules |
| `own/rows.py` | `a5181015…` | record-scale instrument |
| `own/rows_own.json` | `f280b8f2…` | record-scale output |
| `own/sector.py` | `cf8afe8b…` | exact sector families at the six rows |
| `own/sector_own.json` | `2e9955f7…` | sector-family output |
| `analyze_v5.py` | `2b5384a4…` | categorisation of `validate5` extras and saturation |

**Replay of F1's shipped code:**
- `replay/`: byte copies of `scratchpad/c4-F1/*`. The replayed `rows_output*.json` overwrote the copies in `replay/`; the shipped originals are preserved in `orig_outputs/`.
- `replay_run_rows.log` (`9262fac5…`) and `replay_run_rows2.log` (`cf700dce…`).
