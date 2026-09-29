# Critique

Critic `C-F3-T` (orientation T, prove), Cycle 1, r31, of seat `F3`'s return. Route `C1-F-03`, mechanism token `ELIG-TOP-DESCENT-ADVERSARY`, orientation F.

**Boot.** VerityOS was booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file. The harness put two things into my context without my fetching them: the project `CLAUDE.md` and the user's auto-memory index. I did not use either. I did not carry out the conversation-logging directive in `CLAUDE.md`, because this seat may write only its critique and its scratch.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Import list (every critic generator):** `math`, `fractions`, `json`, `hashlib`, `sys`, `collections`. Standard library only. Every invocation used `python3 -B`.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-F3-T.md`: SHA-256 `dbddc0c410e9a37284c7aead25d98d2e09fcce07c36948b46ef2988decf19108`. It matched before I read the file.
- **Capsule seal** `control/c1-critic-capsules/F3-PACKET-MANIFEST.json`: recomputed as `cbe2f29cbe64fcd4670d99349f884021342f2ff6b276fad74e3d07f33801a5c8`, which matches. All 14 members match their listed SHA-256 and byte counts.
- Stage 2 seal: `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` (recomputed; matches). Stage 3 seal: `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` (recomputed; matches). Stage 4 dispatch seal: `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` (recomputed; matches).
- `C1-WORKER-COMMON-BRIEF.md` is `89a93d95…2b00`. It matches its Stage 2 entry and was read under the common brief's authorization.
- The return's own digests all match my copies. I also **replayed every one copy-out-first** into `scratchpad/c1-crit-F3-T/replay/`, and each reproduced byte-identically:

| File | Result |
|---|---|
| `elig_top_sweep_output.json` | `70e02c7f…b400`. Full rerun of `elig_top_sweep.py 2600` reproduced it; 69 rows, all parent descent. |
| `block_crossover_output.json` | `1ba14d73…bb71` |
| `e1_condition_output.json` | `1b7fdf8b…121c` |
| `favorability_output.json`, argument 116 | `e3f00032…d5c0` |
| `favorability_output.json`, argument 500 | `271cc56b…5f96` |
| `favorability_output.json`, argument 2396 (shipped file) | `b1ec56a9…398a` |

- Registry keys touched:
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN; untouched).
  - The favorability, E1-threshold and criterion keys of SEMANTIC-CONTRACT §2, cited at their grades.
  - `E993-TREE-REAL-ROOTED` (REFUTED; respected as a fence).
  - The (ELIG-top)(a) bounded record (`bounded_computation`, m ≤ 2395).

## Independent re-derivation

These are my own instruments. They are standard library only and share no code with the return. They are in `scratchpad/c1-crit-F3-T/own/`.

1. **Literal tree, with no closed form (`literal_tree.py`, `fidelity_and_transition.py`).** I build CB(8,m) from its definition as an edge list and check that it is a tree (`n − 1` edges, one component). I then compute I(T), I(T − v) and I(T − c₁₁) by the generic rooted DP.
   - At m = 95 and m = 107 it reproduces the fixed points: n = 1618 / 1822, α = 856 / 964, x = 506 / 570.
   - At the fresh rows m = 110 and 113, and at 116 (digest `bad1035e…38ac`), all of the following hold: n = 1873 / 1924 / 1975; α = 9m + 1, read off as the degree of the literal polynomial; x = p* − 2; parent descent; 3p* < 2α + 1; both leaf classes favorable at p*. The carried closed form `I = (1+2x)G^m + x(1+x)(1+2x)^{8m}` equals the literal polynomial. The full block sum of the parent-descent delta equals the literal delta.
2. **E1 condition (i) (`e1_check.py`, digest `32233c7d…eb86`).** I compared literal coefficients at every q ∈ [1, m] for m = 95, 107, 110 and 113. There were zero failures. At m = 95, ρ₁ = `1354839571516225/1361543988640524`, which is exactly the fixed point of record.
3. **Where the first descent moves off p* − 2 (`transition.py`, digest `e17fbfb1…4b38`).** I used an incremental truncated Gᵐ over the class 107 ≤ m ≤ 500, scanning the full k range from 0 for the least descent.
   - x = p* − 2 exactly for every m ∈ [107, 158] in the class.
   - The **first m with x < p* − 2 is m = 161** (p* − x = 3).
   - p* − x steps to 4 at m = 242, 5 at 320, 6 at 401 and 7 at 479.
   - Parent descent holds at every row.
   - This answers the return's Remaining-obligation item 4 (critic-derived).

## Attacks and findings

**A1. The main sweep is exact, replayed, and still true beyond 2395.** The sweep uses exact Python ints; numpy object dtype holds only those ints. It is independent of r30's instruments: it is F3's own DP from the carried closed form. My byte-identical replay confirms parent descent at all 69 rows 2396 ≤ m ≤ 2600. On those rows x < p* − 2, but that does not weaken (ELIG-top)(a): parent descent is tested directly and gives x ≤ p* − 2. There is no fidelity failure. My literal-tree checks give α = 9m + 1 as a derived degree and x through rank α.

**A2. Rule violation (process): numpy.** Worker brief rule 7 requires a standard-library-only import list. The return declares numpy. The results are exact and replayed, so no number is struck for this reason, but the deviation is recorded.

**A3. The ascending/descending mass ratio is mislabeled, and the tail term is omitted.** In both `block_crossover_check.py` and `elig_top_sweep.py`, "descending mass (j ≥ 3)" is computed as `total − Σ_{j≤2}`. That quantity includes the tail x(1+x)(1+2x)^{8m}. The tail **ascends** at p* − 2: its mean is p* + 1/6. At m = 107, exactly:
- the tail equals 0.183 × (the j ≤ 2 mass);
- |Σ_{j≥3}| / Σ_{j≤2} = **4.100**;
- |Σ_{j≥3}| / (Σ_{j≤2} + tail) = **3.465**.

The shipped 3.917 is neither ratio; it is |Σ_{j≥3} + tail| / Σ_{j≤2}. The same mislabel applies to the sweep's `descending_mass_jge3_digits` and `descend_over_ascend_ratio_approx` fields. The ~10³⁸–10⁴¹ ratios are qualitatively fine, because the j ≤ 2 blocks and the tail are both exponentially small there. The labels are struck. The claim "only 3 blocks (j = 0, 1, 2) ever need to be controlled by hand" is **false as stated**: the tail must also be controlled. My proof below does control it.

**A4. Block indexing: the return's claim is right, and the version attributed to U3 is wrong at j = 3.** Take the contract's decomposition with block j = `C(m,j)x^j(1+x)^{8j}(1+2x)^{8(m−j)+1}`.
- Its mean is μ_j = (16m + 2 − j)/3.
- So μ_j − (p* − 2) = (4 − j)/3. This uses m ≡ 2 (mod 3); it is where the residue class enters.
- Darroch (on a real-rooted block, which the contract permits) therefore decides j ≥ 4 (descend) and j ∈ {0, 1} and the tail (ascend). It leaves **j = 2 and j = 3 undecided**.
- The return's "j = 0, 1, 2 ascend; j ≥ 3 descend" was only sampled. At m = 10001 only j ≤ 3 was tested, and at m = 110 and 113 only j ≤ 4. Its "every tested j ≥ 3" therefore rests on very few j at large m.

I proved the classification Darroch-free for every m ≥ 107 in the class (`certificate.py`, per-block certificates):
- tail, j = 0, 1, 2 ascend;
- j = 3, 4, 5, 6 descend.

Each block delta divided by the positive reference C(n,K)2^K is an exact rational function of t (with m = 3t + 2). Its numerator is P(t), and every coefficient of P(35 + s) has one sign. So F3's indexing is **correct**. A statement "j ∈ {0,…,3} ascend" at the same test pair (p* − 2, p* − 1) is **false at j = 3** for every m ≥ 107 in the class. If U3's "j ≥ 4" was only Darroch's guaranteed set, the two statements are compatible once j = 3 is read as "undecided by Darroch; exactly descending".

**A5. The p* − x law holds on the 69 rows but is not a universal law.** On 2396 ≤ m ≤ 2600, p* − x = ⌈256m/20451⌉: the shipped offsets lie in (0.0075, 0.994). But at m = 479, p* − x = 7 while 256m/20451 = 5.996. Narrow "tracks 256m/20451 to within integer rounding" to the 69 rows. It is a fit, not a law.

**A6. Fixed points n and α were not independently reproduced.** `validate_fixed_points.py` sets n = 17m + 3 and α = 9m + 1 by formula and then asserts them against themselves. That is tautological. Only x was actually computed. My literal-tree DP now supplies n and α as derived values.

**A7. Minor points.**
- "p* − 1 − j − μ_j ≈ (j − 1)/3" is an exact identity, not an approximation (μ_j here is the inner mean).
- The m ∈ {92, …, 104} probe is outside the class. Under gate ruling 5 it is struck from claim content. The return presented it as an observation only.
- The return's E1 and favorability checks are Darroch-free literal comparisons, correctly graded as bounded re-confirmations.

**A8. Critic-derived advance: (ELIG-top)(a) for every m ≥ 107, m ≡ 2 (mod 3).** Let D(m) := i_{p*−1} − i_{p*−2} = δ_tail + Σ_{j=0}^{m} C(m,j)δ_j. This is the exact block decomposition of the carried closed form; it is checked against the literal tree at 107, 110, 113 and 116.

- **Step 1.** For j ≥ 7, μ_j ≤ p* − 2 − 1. Darroch's theorem applies to the real-rooted block (a product of the linear factors x, 1+x and 1+2x, with positive coefficients). It places every mode at or below ⌈μ_j⌉ < p* − 2. Newton log-concavity then gives δ_j < 0.
- **Step 2.** δ₆ < 0 by its polynomial certificate. Hence D(m) < S₅(m) := δ_tail + Σ_{j=0}^{5} C(m,j)δ_j.
- **Step 3.** Put n = 8m + 1 = 24t + 17 and K = p* − 2 = 16t + 10. Each term's ratio to C(n,K)2^K is a product of linear forms in t, by the identity C(n−a, K−b)/C(n,K) = (n−a)!/n! · K!/(K−b)! · (n−K)!/(n−K−(a−b))!. All arguments are in range for t ≥ 35. This gives S₅/(C(n,K)2^K) = P(t)/(L·Q(t)). Here deg P = 50; Q is a product of linear forms, each positive for t ≥ 35; L = 4222124650659840.
- **Step 4.** **Every one of the 51 coefficients of P(35 + s) is strictly negative.** Hence P(t) < 0 for all real t ≥ 35. So S₅(m) < 0, and therefore D(m) < 0, for every m ≥ 107 with m ≡ 2 (mod 3).
- **Checks.** The identity was checked exactly against the direct block sums at m = 107, 110, 113, 161, 479, 1001, 2396 and 2600. The Taylor shift was checked by evaluation. The criterion already holds from t₀ = 33 (m = 101), but nothing is claimed below 107.
- **Consequence for (E).** x ≤ p* − 2, so x + 2 ≤ p*. Also 3p* = 16m + 4 < 18m + 3 = 2α + 1, using α = 9m + 1. That α equality is checked on the literal tree at the rows above; for all m it is a U1/carried item.
- **Explicit M₀ = 107.** No asymptotic "≈" is used. There is no finite residual range.
- **Dependencies, named on the face:**
  - Darroch (1964) on the real-rooted blocks j ≥ 7 (external classical theorem, not under `sources/`);
  - Newton log-concavity on the same blocks;
  - the carried closed form `I(CB(d,m))` (`proved_informal` node).

  Nothing is applied to I, G or Gᵐ.
- **Registry check.** A lexical check of `sources/authority/CLAIM-IDENTITY.json` (491 keys; patterns DESCENT, PARENT, ELIG, CB-8, R31) found no key stating CB(8,m) parent descent for every m. The closest keys are the r30 CB row and threshold keys, which are different objects, and `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`, which is REFUTED and general.
- **Candidate key (a predicate):** `E993-R31-CB-8-EVERY-M-GE-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-2`.
- **Status and grade.** STATED at a review stage. It needs an isolated second read. Proposed grade: `proved_informal` modulo Darroch on blocks j ≥ 7 and the carried closed form.

## Mechanism-equivalence and fence check

- One rank per tree and the class only. The advance is stated only at (CB(8,m), p*) for m ≥ 107, m ≡ 2 (mod 3).
- Darroch and Newton are applied only to single real-rooted blocks, never to I, G or Gᵐ. This avoids the struck r30 uniform argument, which applied Darroch to I itself.
- No refuted mechanism is revived. No census value is used as proof: the sweeps are corroboration, and the proof is a symbolic certificate valid for all t ≥ 35.
- No status transfers to (HALL), to the primary aggregate, or to any aggregate key.
- The θ* law is not used.
- (L-S)_top is untouched.

## Certification audit

- **Stands (replay-confirmed):**
  - "Parent descent holds at 69/69 rows 2396–2600";
  - "x < p* − 2 at those rows";
  - E1 condition (i) with zero failures at 107, 110, 113, 116 and 500;
  - favorability at 107, 110, 113, 116, 500 and 2396;
  - the block/DP cross-check at m = 107.
- **Struck:**
  - "fixed points n, α reproduced independently" (tautological; A6);
  - the "descending mass (j ≥ 3)" labels and the 3.917 ratio as labeled (A3);
  - "only 3 blocks need hand control" (A3);
  - "within integer rounding at every row" as a law (A5; narrowed to the 69 rows);
  - "IMPORT LIST … standard library" compliance (A2).
- **Upgraded:** "empirical, not a theorem" for the block crossover is now proved by this critic for j ≤ 6 plus the tail, and by Darroch for j ≥ 7 (A4).
- The return's `bounded_evidence` verdict is correct for its own content.

## Verdict

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

The return's exact sweep, E1 checks and favorability checks are retained; all were replayed byte-identically. Several labels and certifications are struck (A2, A3, A5, A6). The step the return left open, (ELIG-top)(a) for every m in the class, is supplied by this critic (A8). I believe its mathematics is complete at grade `proved_informal`, modulo Darroch on real-rooted blocks j ≥ 7 and the carried closed form. It is a critic-derived statement awaiting an isolated second read. The first-descent transition is located at m = 161 (critic-derived).

## Remaining obligation

1. An isolated second read of A8: re-derive P(t) independently, recheck the shifted-coefficient signs and the range conditions, and alias-check the candidate key.
2. Remove the Darroch dependency for j ≥ 7, or formalize it. One option is a uniform-in-j Darroch-free descent lemma for x^j(1+x)^{8j}(1+2x)^{8(m−j)+1} at K when μ_j ≤ K − 1. The Lean form would be a U3-type integer award: the S₅ polynomial certificate plus the block-tail sign.
3. α(CB(8,m)) = 9m + 1 for every m (U1/carried) must be composed with (a) to state (E) formally.
4. (L-S)_top and (H) are untouched and remain open. Nothing here bears on (HALL).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F3-T/`.

**Own instruments (`own/`):**

| File | SHA-256 |
|---|---|
| `blocks.py` | `9b13b3e5ef22799f4db4910c54120dac55a4fe70e5575c2a01e27c82f6976c88` |
| `symbolic.py` | `fb2004fc22933e0f22e1e91b06e396670a4fcc5f20f5f58c91d53ad7ba5dff99` |
| `certificate.py` | `50c99337c1dd7b51f0d3c235db3c68fc56765a8241f9925542eea950399adf4a` |
| `certificate_output.json` | `063723d7aacdf5f11e066e8df387b0dce3f1f54cd3e69c22218a780706457b80` |
| `literal_tree.py` | `2708bee1bec69ff4b731c0ce70e7b457cdb558162851589ed74bcce5be78dcad` |
| `fidelity_and_transition.py` | `a84e06aac9e7d155ee44e65eee48f667fbd02cdd2cfaef69b3c053e6fc2b0b53` |
| `fidelity_transition_107_116.json` | `bad1035eaca35256b1ccad64f9332116d12c3507da5a6c073e0c24cf5e6b38ac` |
| `transition.py` | `504019c7be12bebc7fbdbb057705e84ce09775a380f8a6eff5ca328ef46b118d` |
| `transition_500.json` | `e17fbfb1b6ba90bd590f2161eceece45e79d9f73dffd9a74fc1e8833d4a14b38` |
| `e1_check.py` | `b6bd2387ad508f74b569e563bc7e2ca53b7022e9b3c39738bfea48aa00d9fb60` |
| `e1_output.json` | `32233c7d3e1ca1fbd8e50ffb155ecbbfecbbef6a306209eda0ec702616bfeb86` |

Replay: from `own/`, run `python3 -B certificate.py`, `python3 -B fidelity_and_transition.py 107 116`, `python3 -B transition.py 500` and `python3 -B e1_check.py`.

**Replays (`replay/`):** byte copies of every `scratchpad/c1-F3/` artifact, the regenerated outputs (digests matching, listed above), and the `*.shipped.json` copies.

**Disclosures:**
- Two runs went to the background:
  - The sweep replay ran under the harness background runner. Its literal PID 62207 was recorded and awaited, and it has exited.
  - A literal-DP transition scan was auto-moved to the background by the harness timeout. I stopped it with TaskStop. It produced no output, and nothing from it is used; the transition was recomputed in the foreground (PID 71621, exited).
- No background job remains. PIDs 62207, 71621 and 72053 have all exited.
- Non-recursive `ls` of the granted `scratchpad/c1-F3/` directory only.
- Read `sources/authority/CLAIM-IDENTITY.json` (authorized, under `sources/`).
- No network, no installs, no other VerityOS reads.
