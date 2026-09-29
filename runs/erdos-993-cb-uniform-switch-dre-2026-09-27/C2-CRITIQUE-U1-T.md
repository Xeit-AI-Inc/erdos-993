# Critique

Critic `C-U1-T` (cross-orientation T, prove) of Cycle 2 Stage 4, r31. Assigned return: seat U1, route `C2-U-01`, mechanism
`FORMAL-ELIG-TOP-PARENT-DESCENT`, orientation U. Dispatch `control/dispatch/c2-stage4/DISPATCH-C-U1-T.md`: I checked its SHA-256
`b81acaac601efa4195b6ed4149f58698a54e912f255ec9af150fa9e9b350b0cc` before reading it. It matched.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded only those two files, the constitution and the startup protocol. I read no memory, conversation, module, skill, log or decision file.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**IMPORT LIST** (every script of this critique): `json`, `hashlib`, `sys`, `fractions.Fraction`, `math` (`comb`, `factorial`, `gcd`,
`lcm`). Standard library only, with exact integers and Fractions. I used no network and installed no packages. On the Lean side I used `import Mathlib` / `import LeanProof.Main`, with
the pinned shared Mathlib bound by a manual symlink. I never ran `lake update`, `lake clean` or `elan`, and I ran `cd` into the project before every `lake`/`lean` call.

## Identity and seal audit

- **Capsule seal (reported):** `control/c2-critic-capsules/U1-PACKET-MANIFEST.json`. I recomputed it over canonical JSON without
  `seal_sha256` (sort_keys, `(",",":")`, no trailing newline) and got `9ffad3154e5a19f7ecde8fb1797621fadb5531aeaf4ec80f21eb2649acfa5897`, which
  **matches**. All 14 listed members match on SHA-256 and byte count (`seals.py`).
- **Stage 4 dispatch manifest seal:** `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` matches. **Stage 3 packet seal:**
  `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` matches. The Stage 3 manifest lists the U1 return at
  `327718437d3d…`, which equals the file I read. **Stage 2 seal:** `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`
  matches.
- **Digests listed by the return:** all five inventoried artifacts match the return's table exactly: `Main.lean` `40789438…`,
  `u1_cb8s5.py` `c5210c76…`, `u1_cb8s5_out.json` `757a5e0a…`, `u1_cb8_delta_check.py` `c4dad7fd…`, `u1_cb8_delta_check_out.json`
  `b5db1905…`. The return's cited dispatch digest `2a5c3284…` equals the Stage 3 manifest's entry for `DISPATCH-U1.md`. Its controller-fact digest
  `7582bb5e…` equals the value in the Stage 3 disclosures record.
- **C1-LA3 carry source:** I checked all 91 files of `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/` against
  `sources/c1-results/SOURCE-DIGESTS.json`. 91 of 91 match. Mathlib `HEAD` = `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`.
- **Claim identity.** The only registered key the return touches is
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
  (grade `computer_assisted`). It also cites the r30 favorability key only for the closed form. The return proposes no new key, and I agree. I propose none either
  (see Mechanism check). The key's statement (a) is `i_{p*−1} < i_{p*−2}`. Both the return's theorem and my critic-derived theorem
  are formal proofs of the **closed-form-polynomial** version of (a). Neither is a new claim. Both are a formalization path for the existing
  key, and neither changes its grade (compiled scratch carries no grade).

## Independent re-derivation

**Which `G` (CF-C2-G).** I checked this in the return's own text, not in its acknowledgment. The Lean line is `cb8G : ℤ[X] := X * (1 + X) ^ 8 + (1 + 2 * X) ^ 8`
(Main.lean, U1 section). The Python in both scripts is `poly_add(poly_mul([0,1], poly_pow([1,1],8)), poly_pow([1,2],8))`. Both equal
the contract's `G = (1+2x)^8 + x(1+x)^8` (commuted addition). The allocation's swapped `(1+x)^8 + x(1+2x)^8` appears nowhere in U1's
artifacts. `cb8I m = (1+2X)·G^m + X(1+X)(1+2X)^{8m}` is SEMANTIC-CONTRACT §2 verbatim.

**My own instrument** (`crit_u1t_rows.py`) avoids U1's code and the closed form as its starting point:
1. It builds `CB(8,m)` **literally** from SEMANTIC-CONTRACT §2 as an adjacency list (`r–s–v`, `m` chokes on `r`, 8 supports per choke, one
   private leaf per support). It then computes the independence polynomial by a generic rooted-tree DP.
2. It checks that the result **equals the closed form** coefficient by coefficient. This is a fidelity check U1's cross-check never made: U1 takes `x` from
   `cb8I`, not from the tree.
3. It computes `α`, `x` (least `k` with `i_{k+1} < i_k`, zero-extended through `α`) and `p*`.
4. It computes the block pieces by a **different method**. It uses `(1+X) = ((1+2X)+1)/2`, so `[X^l](1+X)^{8j}(1+2X)^M = 2^{l−8j} Σ_i C(8j,i) C(M+i,l)`.
5. It checks the difference identity `i_L − i_{L+1} = Σ_j C(m,j) g_j + τ` **exactly** over all `j ∈ [0,m]`.

Rows 95 (outside the class), 107, 110, 113 (controls), 116, 119 (fresh, ruling 9) and 137 (the larger row); payload
`21bc0b30…`:

| m | n (literal) | literal = closed form | α | x | p* | eligible | i_{p*−1} < i_{p*−2} | identity exact | S_5 > 0 | g_j > 0 for all j ≥ 6 | sign g_0..g_8 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 95 | 1618 | yes | 856 | 506 | 508 | yes | yes | yes | **no** | yes | − − − + + + + + + |
| 107 | 1822 | yes | 964 | 570 | 572 | yes | yes | yes | yes | yes | − − − + + + + + + |
| 110 | 1873 | yes | 991 | 586 | 588 | yes | yes | yes | yes | yes | same |
| 113 | 1924 | yes | 1018 | 602 | 604 | yes | yes | yes | yes | yes | same |
| 116 | 1975 | yes | 1045 | 618 | 620 | yes | yes | yes | yes | yes | same |
| 119 | 2026 | yes | 1072 | 634 | 636 | yes | yes | yes | yes | yes | same |
| 137 | 2332 | yes | 1234 | 730 | 732 | yes | yes | yes | yes | yes | same |

The fixed points of SEMANTIC-CONTRACT §5 are reproduced before interpretation: `CB(8,107)/572` gives `n=1822, α=964, x=570`, and `CB(8,95)/508` gives
`n=1618, α=856, x=506`. `n` at 110/113 = 1873/1924, as recorded. My `S_5` and `Δ` digests equal U1's `S5_sha256` and `Delta_L_sha256` on all six of
U1's rows. The integer ratio `⌊10^6·S_5/(i_L − i_{L+1})⌋` is 141707, 162537, 175930, 184048, 188332, 173838 at the class rows. This matches the return's
non-evidentiary floats. All of this is `bounded_computation`.

**Replay.** I copied U1's two generators out to `scratchpad/c2-crit-U1-T/replay/` and re-ran them there with `python3 -B`. Both outputs were
**byte-identical** (`757a5e0a…`, `b5db1905…`). I rebuilt U1's Lean project copy-out-first (`Main.lean` byte-copied, lakefile/manifest/toolchain/`LeanProof.lean` byte-copied
from C1-LA3, `.lake/packages` symlinked): `lake build LeanProof` succeeded in **34.6 s** wall, with `LeanProof.Main` at 26 s. That matches the return's
"~31–34 s".

## Attacks and findings

1. **Lean statements against SOLUTION-CONTRACT §2.** `cb8_block_identity` is exactly the contract's block decomposition
   `I = Σ_j C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m−j)} + x(1+x)(1+2x)^{8m}` for **every** `m : ℕ`, with the correct binomial weights
   `(m.choose j)` and the tail. `cb8_coeff_diff` requires `m ≤ L`, which is exactly the condition that keeps `L − j` untruncated. `cb8_elig_top_a_conditional`'s conclusion
   `(cb8I m).coeff ((16m+4)/3 − 1) < (cb8I m).coeff ((16m+4)/3 − 2)` is (ELIG-top)(a) for the closed form. **Confirmed.**
2. **Is `hS5` exactly the `S_5` positivity statement, not an encoding of the descent?** Yes. `cb8S5 m` is defined as the
   `j = 0..5` block differences plus the tail difference at `L = p* − 2`. The conclusion needs `cb8S5 m + Σ_{j∈[6,m]} C(m,j)g_j > 0`, and
   `hS5` omits the `j ≥ 6` sum, which node (3) handles independently through the carried C1-LA3 theorem. The hypothesis is a genuine proper sub-statement. It is stated
   per `m` (a premise `0 < cb8S5 m`), which is the correct shape for a conditional. **No circularity.**
3. **Axioms and forbidden tokens.** `#print axioms` on all four U1 declarations gives `[propext, Classical.choice, Quot.sound]`. There is no
   `sorry`/`admit`/`native_decide`/`decide`/`axiom` in the file. The only non-default options are two `maxHeartbeats 1000000`. **Confirmed.**
4. **Carry (gate ruling 12).** The first 464 lines of U1's `Main.lean` are byte-identical to C1-LA3's frozen `Main.lean` (SHA-256 `c0605e12…`,
   equal to the digest file). Each of the 21 `Snippets/*.lean.fragment` files appears exactly once, byte-for-byte, in that prefix.
   Entry 21 (`cb8_block_descent_topRank`, `5 ≤ j ≤ m`, strict) is used unmodified, only with `j ≥ 6`. **Confirmed.**
5. **Structural observation (bounded, not a defect).** At every class row, `g_j > 0` already holds for `j ≥ 3`. Only blocks `j = 0, 1, 2` rise at
   `L − j`. The formal descent tool covers `j ≥ 5` (gap `2j − 8 ≥ 2`), so `S_5` pools three rising blocks, two descending-but-unformalized
   blocks and the tail. This explains why the certificate needs all of `j ≤ 5`. It is not a proof of anything universal.
6. **Endpoint and residue.** The theorems quantify over `107 ≤ m`, `m % 3 = 2`. `m = 107` is `u = 0`, `t = 35` in my parametrization, and it is
   covered. `S_5 < 0` at `m = 95` (`t = 31`), which is outside the class. The symbolic numerator (below) is negative for `t = 1..32` and positive from
   `t = 33` (`m = 101`). The class starts two residue steps above the sign change. That is consistent, and it means `m ≥ 107` is not slack in an unsafe direction.
7. **Fidelity note.** The return correctly says it has no network instrument, so (WID)/`supply − capacity` and derived `F` are
   N/A for this route. Its numeric `x` was taken from the closed form, not from the tree. My literal-tree check closes that gap on 7 rows as
   bounded evidence. Formally, the `cbGraph` ↔ `cb8I` link remains open (U3's node), and the return names it correctly.

## Mechanism-equivalence and fence check

Fence 1 (one rank, class only): every statement is at `L = p* − 2` for `m ≥ 107`, `m ≡ 2 (mod 3)`. Mine is the same. Fence 3: neither the return nor my
advance uses Darroch or Newton anywhere. No real-rootedness of `I`, `G` or `G^m` is used (`E993-TREE-REAL-ROOTED` stays REFUTED and uninvoked).
The block route is pure coefficient algebra plus a positivity certificate of an explicit polynomial in `u ≥ 0`. Fence 4: N/A (no
network). Fence 5: there is no asymptotic step. The threshold is the class endpoint itself, and my proof is exact for every `u : ℕ` with no `M_0`. Fence 6: there is no
refuted mechanism. This is not the struck r30 uniform Darroch argument and not a real-rootedness claim. Fence 7: every row table above and in the
return is `bounded_computation`. The universal statement rests only on the kernel-checked proof. Fence 8: no sealed member was edited. Everything was
copied into critic scratch. Fence 9: attribution. The closed form and `α` come from r30 (T1, Cycle 6). The (G)/(BD) tool for `j ≥ 5` comes from C1-LA3. The block/difference
identity, the `cb8S5` isolation and the conditional composition come from seat U1 (Claude Sonnet 5). The discharge of node (2) below is **critic-derived (C-U1-T, Claude Opus 5.5)**.
Alias check: no `E993-R31-` candidate is proposed. Mathematically, my result is the closed-form half of the existing ELIG key's clause (a), so a new key
would alias it.

### Critic-derived advance: node (2) discharged formally (`0 < cb8S5 m` for every class `m`), and (ELIG-top)(a) for `cb8I` unconditional

**Mathematics (C-U1-T).** Put `m = 3u + 107` (`u ≥ 0`), `N = 8m = 24u+856`, `L = p* − 2 = 16u+570`, `N0 = N − 39`, `L1 = L + 1`, `K1 = N − L + 6`.
(i) `2^{8j}(1+X)^{8j}(1+2X)^M = Σ_i C(8j,i)(1+2X)^{M+i}` and `[X^l](1+2X)^M = 2^l C(M,l)`.
(ii) Every one of the 254 binomials `C(n,k)` occurring in `S_5` has `n ≥ N0`, `k ≤ L1`, `n − k ≤ K1`. Hence **`C(n,k)·L1!·K1! = N0!·p_{n,k}(u)`**, where `p_{n,k}` is a
product of exactly 46 linear factors in `u`, obtained from `C(n,k)k!(n−k)! = n!` and three ascending-factorial identities. This is
**denominator-free**: there is no falling-factorial ratio, no rational function, and no sampled "identity guard".
(iii) Therefore `2^45·120·L1!·K1!·S_5(m) = 2^{16u+570}·N0!·Poly(u)` exactly, with `Poly` of degree 50 and 51 integer
coefficients, **all positive** (69 to 146 digits). So `S_5(m) > 0` for every `u ≥ 0`.

I cross-checked this three ways. (a) A separate exact symbolic derivation normalizes to `2^L C(N,L)` over the explicit common denominator
`Q(t) = Π_{k=0}^{38}(N−k)·(L+1)·Π_{i=1}^{6}(N−L+i)` (degree 46), giving a degree-50 numerator `Nn(t)` whose shift `Nn(35+u)` has 51 positive
coefficients. `Poly(u)` is exactly `3·2^43·Nn(35+u)`. (b) Both identities hold against the integer `S_5` at 7 and 9 named rows. (c) Lean
(next paragraph). The degrees (46 denominator, 50 numerator) agree with the return's description of the certificate.

**Lean (compiled scratch, no grade).** `scratchpad/c2-crit-U1-T/LeanProject/LeanProof/CriticS5.lean` (2,742 lines, generated by
`gen_lean_s5.py`) imports U1's unmodified `LeanProof.Main` and proves the following:
- `CriticU1T.cb8S5_pos (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) : 0 < cb8S5 m`. This is U1's own `cb8S5`, untouched.
- `CriticU1T.cb8_elig_top_a (m) (hm) (hmod) : (cb8I m).coeff ((16*m+4)/3 − 1) < (cb8I m).coeff ((16*m+4)/3 − 2)`. It is proved as
  `cb8_elig_top_a_conditional m hm hmod (cb8S5_pos m hm hmod)`, which **discharges `hS5`**.

`#print axioms` for both gives `[propext, Classical.choice, Quot.sound]`. There is no `sorry`/`admit`/`native_decide`/`decide`. The universality over `u` comes from
general lemmas (`coeff_one_add_two_X_pow`, `two_pow_block_coeff`, `choose_base_form`, `choose_small`, `tail_coeff`), 254
per-binomial instances each closed by `linear_combination`/`ring`, seven block lemmas and one `positivity` on the explicit polynomial. There is no
enumeration anywhere. Options: `exponentiation.threshold 2000` (so `ring` can identify `2^571 = 2·2^570`), `maxHeartbeats 0` on the 21 heavy
declarations, and `maxRecDepth 20000` on the final step.

**Compile feasibility and time (the brief's question).** Clean `lake env lean LeanProof/CriticS5.lean` took **309.9 s wall** (689 s CPU,
parallel elaboration) on top of `Main`'s 26 s. The return's step 1 (coefficient extraction) is used, in the `(1+2X)`-power form. Its steps 2–3 (falling-factorial
ratios and a common denominator) are **replaced** by the factorial normalization (ii), which needs no `field_simp` and no rational identity. Its
step 4 is a single `positivity`. A monolithic per-block `linear_combination` scaled super-linearly (block `j = 2` took about 170 s, and projected `j = 5` about 15+ min
per half). Splitting into one lemma per binomial made the whole file about 5 min.

## Certification audit

- "sorry-free", "`#print axioms` … exactly `[propext, Classical.choice, Quot.sound]`", "byte-identical carry", "~31–34 s", the rows'
  `(α, x, p*)`, and the replay byte-identity are all **backed** by my rebuild, byte comparison and replay.
- "Node (3) … carried byte-identically (entry 21, unmodified)": **backed.**
- **Struck:** "The 51 shifted-coefficient signs are independently confirmed (bounded_computation, six rows, this return's replay)" and "I
  confirmed their signs numerically above, matching SR-4's table" (node-(2) section, step 4, and Remaining obligation 1). Neither shipped
  script computes `N_5`, `D_5` or any shifted coefficient. Both compute the integer `S_5(m)` at six rows only. The literal is unbacked by the
  return's evidence. (The signs are in fact all positive by my own symbolic derivation, credited to this critique, not to U1.)
- **Struck as unbacked by shipped evidence:** "56-digit coefficients" as a description of the certificate. The coefficient size depends on normalization:
  56–133 digits in my `Nn(35+u)`, 69–146 in `Poly(u)`. The return shows no computation of it.
- **Not verifiable within my read boundary, so it carries no weight:** "matching SR-4's reported 0.1417, 0.1625, 0.1759" and "reproduces SR-4's reported
  (n, α, x, p*) … exactly". SR-4 is not in my capsule. The values themselves are reproduced against the contract's fixed points and my literal tree.
- "(E) follows from it plus `α = 9m+1` and `3p* < 2α+1`": this is correct mathematics for the closed form, but it is **prose, not formalized**. `crossingIndex` and
  `indepNum` of `cbGraph` are not touched. The return correctly does not claim otherwise in its verdict.
- The `## Remaining obligation` is exact for the return as shipped. Its item 1 is now superseded by this critique's advance, subject to the Stage 7
  award process.

## Verdict

The return's three proved nodes and its conditional composition are exactly as claimed. My checks confirmed each point: the rebuild, the axioms, the byte-identical
carry, the statement fidelity (including CF-C2-G) and the absence of circularity. The one missing hypothesis `hS5` is now discharged in critic scratch.
The mathematics of "(ELIG-top)(a) for the closed-form polynomial `cb8I`, for every `m ≥ 107`, `m ≡ 2 (mod 3)`" is complete and kernel-checked in
scratch. In prose, its grade is `proved_informal`, and it is a candidate for a governed formal award at Stage 7. It is **not** yet a statement about `cbGraph`: the
closed-form link (U3) and the `crossingIndex` minimality step stand between it and terminal conjunct 2. The struck literals above are
side claims and do not touch the route verdict `proved_conditional`, which stands.

verdict: retained
headline_resolved: no
ELIG_formal: advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

## Remaining obligation

Written as what a successor inherits:
1. **Node (2): discharged in critic scratch.** A governed award should take `CriticS5.lean`'s `cb8S5_pos` and `cb8_elig_top_a`
   (with U1's nodes 1, 3, 4 and the C1-LA3 carry) through the lean-proof-workflow. That means freezing `expected_statement`, running a fidelity review and an independent
   rebuild, and producing an isolated second read of the factorial-normalization argument. Until then, this is compiled scratch with no grade, and the ELIG key stays
   `computer_assisted`.
2. **The `cbGraph` link (U3's node):** for every `k`, `#{independent k-sets of cbGraph m} = (cb8I m).coeff k`, over C1-LA2's `cbGraph`.
3. **The first-descent step:** from `(cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)` and item 2, derive
   `C5LA1.crossingIndex (cbGraph m) ≤ p* − 2` (the minimality of entry 0035's `crossingIndex`), which gives conjunct 2 `crossingIndex + 2 ≤ p*`. Conjunct 3
   (`3p* < 2·indepNum + 1`) needs `indepNum (cbGraph m) = 9m+1` from C1-LA2 or a new lemma.
4. Nothing here touches (HALL), favorability or E1. Tier 1 stays `computer_assisted` until (H) and those inputs are formal.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U1-T/`.

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `d3009bfd56b83fac0d81fcca151d0638b28ba0cc9ed28b83e6f8a8325bcf911a` | capsule/stage seals and capsule-member digests |
| `crit_u1t_rows.py` | `532604c1cc3242ee063e30393941144801de232851a7de639189895bad21f6b3` | literal-tree DP, closed-form equality, `x`, `α`, block identity, `S_5` at 7 rows |
| `crit_u1t_rows_out.json` | `2544910a36170811e3d6dbd0f775b53d458acec6bc595d9ea25a33e31b6ce340` | its output (payload `21bc0b30…`) |
| `crit_u1t_s5_symbolic.py` | `b52ae713e65d78505ad0400d5f4f54903d1df408501a65d9844ccb142935a3b7` | exact symbolic `Nn(t)/Q(t)` derivation (no interpolation) |
| `crit_u1t_s5_symbolic_out.json` | `0237d0b30a7c488be03612ed9027529f8d9dbfae27b6a330a90a91796ae6cee0` | degree 50 / 46, 51 positive shifted coefficients, row checks |
| `crit_u1t_N5_coeffs.json` | `dc50469a852f2354ec00a5f55aa26df35cbb283bb7ed5d71bfda12b917bf36ef` | `Nn(t)` and `Nn(35+u)` coefficients |
| `crit_u1t_s5_factorial_form.py` | `6e2983bc092e3d34486138edd45e2343fb1833d9313772071373c8229a251e93` | denominator-free `Poly(u)`, row checks, proportionality to `Nn(35+u)` |
| `crit_u1t_s5_factorial_form_out.json` | `1e4e58d7e9ea5674437f5b6e65bbfc5d3392e828857e0e8375267bb36cd52e72` | its output |
| `crit_u1t_Poly_u.json` | `f75d2f198decd410a274f7630a04f14d85709251454405330120a8d265ae4bac` | `Poly(u)` coefficients (input to the Lean generator's assertion) |
| `gen_lean_s5.py` | `53d4731bf5f772325e96d7d1fd59822c75b04bb593c0f6539b0f8fb7debb940f` | generator of `CriticS5.lean` (asserts its assembled polynomial equals `crit_u1t_Poly_u.json`) |
| `LeanProject/LeanProof/CriticS5.lean` | `300b6bd8c28d37c1310449d513a0f7a57da8a80c35c1afe620be9c529c438745` | the node-(2) proof and unconditional `cb8_elig_top_a` |
| `lean_s5_log.txt` | `fecb63b068833a1638096c2a36e2244bf38f460a06456bc452233bb6e8bbf1e0` | compile log (0 errors; axioms lines; `real 309.91`) |
| `LeanProject/LeanProof/Main.lean` | `40789438145a68c3aaa84659437cd07f29bf575dd20a9b563ff4644dc067dcbe` | U1's file, copied unmodified |
| `gen_lean_proto.py`, `LeanProject/LeanProof/CriticS5Proto.lean` | `a1a874fd…`, `1af30ae1…` | feasibility prototype (worst 46-factor `ring`, `positivity`) |
| `replay/` | `re_s5.json` = `757a5e0a…`, `re_delta.json` = `b5db1905…` | copy-out replay of U1's generators (byte-identical) |

Replay (copy-out-first; deterministic; `python3 -B`):
```
C=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U1-T
mkdir -p ${C}-replay && cp $C/*.py ${C}-replay/ && cd ${C}-replay
python3 -B crit_u1t_rows.py > crit_u1t_rows_out.json
python3 -B crit_u1t_s5_symbolic.py > crit_u1t_s5_symbolic_out.json
python3 -B crit_u1t_s5_factorial_form.py > crit_u1t_s5_factorial_form_out.json
cd $C/LeanProject && lake build LeanProof && lake env lean LeanProof/CriticS5.lean
```

**Read-boundary disclosures.**
- The harness injected the project `CLAUDE.md`, the user memory index and the user's email into context. I did not fetch them, did not use them and did not act on them. Following the run's rule, I wrote no conversation log.
- I read `control/C2-WORKER-COMMON-BRIEF.md`, a Stage 2 member that the critic common brief makes binding. I verified it against the Stage 2 manifest (`8a2eb994…`).
- I ran non-recursive `ls` on the C1-LA3 run directories under `sources/`, which is within the grant.
- I ran `grep` only inside the Mathlib package directory, for API names.
- I used `pgrep -f 'LeanProof/CriticS5.lean'` and `ps -p <literal PID>` to identify my own compile processes. I ran no full process listing.
- I killed my own abandoned compiles by literal PID: 34136/34138/34161 and 34396/34398/34419. No background job remains (`pgrep` returns none).
- I read no sibling return, critique, adjudication, other experiment root or network resource.
- I wrote nothing outside `scratchpad/c2-crit-U1-T/` and this `CRITIQUE.md`.
