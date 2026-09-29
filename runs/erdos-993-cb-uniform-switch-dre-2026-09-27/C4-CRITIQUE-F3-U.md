# Critique

**Critic:** `C-F3-U`, r31 Cycle 4 Stage 4. Cross-orientation critic, orientation U (formal / structural), of seat `F3`.
**Route:** `C4-F-03`. **Mechanism token:** `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`. **Orientation:** F (falsify).
**Assigned return:** `cycles/cycle-4/stage3/returns/F3/RETURN.md`, SHA-256 `2fe57c3fc84c58bdfdba2b1df5fbf7d1e7725436c1a6c47998a6347a84bc5ce6`, 22,480 bytes.
**Clock:** 2026-09-29 00:17 EDT at the time of writing.

**Boot.** I am operating within VerityOS. This was a restricted boot. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-F3-U.md`. Its SHA-256 `eea5647683c0f56c2c208f692159b35c2db67df67732e28675d82f279809d03b` matched
the controller's literal. I read no other VerityOS file outside the run root. No conversation log was written, and no memory,
decision or other durable VerityOS record was touched.

## Identity and seal audit

**Seals.** Each seal below was recomputed as the SHA-256 of the manifest's compact, key-sorted JSON with `seal_sha256` removed and no trailing newline.

| Object | Recorded seal | Recomputed | Match |
|---|---|---|---|
| Capsule `control/c4-critic-capsules/F3-PACKET-MANIFEST.json` | `6e5f0786ebb510cba7d5387fce0713bf8ffd27cbc63ff6e6ae84ce3a7d4ce126` | same | yes |
| Stage 4 dispatch `control/C4-STAGE4-DISPATCH-MANIFEST.json` | `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` | same | yes |
| Stage 3 `control/C4-STAGE3-PACKET-MANIFEST.json` | `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` | same | yes |
| Stage 2 `control/C4-STAGE2-PACKET-MANIFEST.json` | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | same | yes |

**Capsule members.** All 16 capsule members match their listed SHA-256 and byte counts, the assigned return included.

**Stage 2 members I relied on.** I checked each digest against the Stage 2 manifest or against ruling 23/25:
- `control/C4-FROZEN-STATEMENTS.lean` `0fc723d7…9ede1`. It is byte-identical to `sources/c4-base/LeanProject/LeanProof/Statements.lean`.
- `control/C4-FROZEN-STATEMENTS.md` `6aa6dfe5…ca54b`. I checked its digest only and did not read it.
- `sources/c4-base/…/Main.lean` `385af1bf…2ea3f`.
- `ChokeState.lean` `64a101ef…d3bb`.
- `E1FlowConstruction.lean` `d26e7022…9b38e`.

**Digests the return cites.** All of these reproduce:
- Stage 2 seal.
- C1-LA1 `Main.lean` `f0578ed7…b78e`. It is recomputed and present in `sources/c1-results/SOURCE-DIGESTS.json`.
- The three c4-base file digests.
- All nine artifact-inventory digests and byte counts, recomputed on my copy-out (`replay/`).

**Admission defect `DIGEST_LITERAL_UNMATCHED` (two values).** Both literals are stdout digests of script output, not file digests. I replayed both copy-out-first in
`scratchpad/c4-crit-F3-U/replay/`:
- `python3 -B tree_check.py` printed `digest: 3527a38bda398c1d62f7b775d55b05dfcbd7d06fda6ddede804fc76e67de44bd`.
- `python3 -B run_all.py` printed `MASTER_DIGEST_SHA256: 4ad0c6f428c8371eb4ba3088216083f8ed95201b927878b47e9437129e7476fe`. It exited 0 in 12 s.

Both literals are therefore backed by replay. The defect is **cured** and neither literal is struck. The return has no other admission defect listed.

**Interruption consistency.** The seat's scratch holds eight files, and their digests match the inventory. The narrative says the class-row tests were "written after resumption". That conflicts with the file mtime: `test_n5_full.py` is dated 08:54, before the stated 08:55 interruption. Read "written" as "run". This is a minor narrative inaccuracy and does not change any number.

**Read-boundary disclosure (one item).** The dispatch grants the return's inventoried artifacts under `scratchpad/c4-F3/`. The replay driver `run_all.py` is inventoried, but it lives at `scratchpad/c4-F3-replay/run_all.py`, a sibling directory outside that literal path. The attack brief requires replaying its digest (return line 247), so I copied that one file, and nothing else from `c4-F3-replay/`, into my scratch. I verified its digest `7521f1a3…2c41` against the inventory.

**Other reads.** All were inside the grant: the capsule members, the Stage 2 members named above, `sources/c4-base/` (lines of `Main.lean` for entries 1–26, 79–91 and 111, and the C2-LA3 statement at lines 13180–13192), and one digest file under `sources/c1-results/`. The only listings were non-recursive `ls` of `scratchpad/c4-F3/` and `sources/c4-base/`. I ran no `find`, no `grep -r` and no recursive listing above the grant. There was no network use and no install. I did not read another return, critique or adjudication.

## Independent re-derivation

**Instrument.** My instrument, `scratchpad/c4-crit-F3-U/own/`, was written from the Lean definitions of record and imports no F3 code. The one exception is the explicitly labelled adjudication row below, which calls F3's `exact_preimages` in order to test it. Components:
- `core.py` evaluates `cbEdge` as the literal disjunction on every ordered pair. At class rows it uses the witness construction, which I checked equal to the pairwise build at m = 0..3. It also carries `cbVertex` with its `mod`, `leafSet` as exists-unique neighbour, `support`, `tagWitnesses`, `activeWeight` and the literal `transportRel`. Forward images enumerate the definition's existential witnesses over every vertex. It also has my own inverse-preimage construction, `chokeBeta`/`chokeGamma`/`cbOpenChokeCount`, and `cb8GSec` transcribed from the frozen text with no extra `A ⊆ B` conjunct.
- The C1-LA1 tables `cb8Bpb`/`cb8Bpc`/`cb8CGamma` were **parsed mechanically** from the base `Main.lean` text (36/36/7 cells). They agree with F3's hand transcription cell for cell.

**Fidelity first.** F3 skipped these checks. I ran them before anything else.

1. **(WID) from independent sides.** On the weight side, supply − capacity is computed from `tagWitnesses`/`activeWeight`. On the other side, `S(T,p) = Σ_{v∈F} (Δ_{p−1}(T − H_v) − Δ_{p−1}(T − R_v))` follows the carried `C5LA1.aggregate`, with ℕ `p − 1`.
   - CB(8,1): exhaustive, at **every** rank p = 0..10 with `F_p` derived. 11/11 ranks equal.
   - m = 95, 107, 158, 161, 164: at `p*`, by tree DP on the literal graph. Leaf contributions use the orbit representative for `v` plus five `c`-leaves spot-checked equal: `(0,0), (0,7), (m−1,3)` and two random. Equal at all five rows, with `S < 0` at each.
2. **The selector is derived, at the index of record (ruling 16).** `Δ_{p*}(T − z) = i_{p*+1}(T − z) − i_{p*}(T − z) < 0` holds for `z = v` and for the `c`-leaf representatives, so `F_{p*} = leafSet` (`8m + 1` tags) at 95/107/158/161/164.
3. **`x` computed through rank `α`** (least `k` with `i_{k+1} < i_k`, zero above `α`) on the literal tree:

   | m | p* | n | α | x | eligible |
   |---|---|---|---|---|---|
   | 95 | 508 | 1618 | 856 | 506 | yes |
   | 107 | 572 | 1822 | 964 | 570 | yes |
   | 158 | 844 | 2689 | 1423 | 842 | yes |
   | 161 | 860 | 2740 | 1450 | 857 (`= p* − 3`, the structural row) | yes |
   | 164 | 876 | 2791 | 1477 | 873 | yes |

   At CB(8,1), α = 10 and x = 6 (not a class row).
4. **SEMANTIC-CONTRACT §5 fixed points, all reproduced:**
   - 107: `n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193` (formula of record), margin `(1 − ρ₁)/θ = 34.90085…`.
   - 95: `x = 506`, `θ = 96/604265`, `ρ₁ = 1354839571516225/1361543988640524` from a polynomial expansion by repeated multiplication (not the convolution sum), `σ(1..3) = 96/4229855, 32/604265, 288/3021325`, `R_K/R_{K−1} = 508/507`.

**Exhaustive at CB(8,1)** (n = 20; 33,573 independent sets, reproduced). Results in `own/m1_exhaustive.out`, digest line `M1_DIGEST: 9dd6e08a…3af8`:
- **N6:** all 1,048,576 finsets, 0 failures.
- **N1 (B1), (B2):** all 20,451 `r`-free independent sets, 0 failures each.
- **N1 (B3):** **all** 9,437,184 `(A, z)` pairs (A any finset, z ∉ A, z ≠ r, z not a choke), 0 failures. F3 only sampled 126,418 pairs.
- **N1 companion `cbOpenChokeCount_le`:** true on all finsets.
- **N5 at p\* = 6** (no class hypothesis in either N5 text, so m = 1 is in scope). Column sums come from **forward definitional images of every B ∈ I_7**:
  - census (set equality, `card + γ = 8`, states): 70/70 targets, 0 failures;
  - inflow clause 1: 70/70;
  - clause 2 zero: 126/126.
- **Inverse versus forward.** My inverse preimages agree with the forward definitional images on all 33,315 targets of every rank 0..α−1: 0 mismatches. **F3's own `exact_preimages`, adjudicated the same way:** 0 mismatches on all 33,315 targets.

**Class rows, own instrument** (`own/classrows.out`, `CLASSROWS_DIGEST: d5136950…01f6`):
- **N5 on random targets** at m = 107, 158, 161, 164, 36 per row. Each target is 12 one-choke-with-`v` with γ drawn from 0..8, plus 12 one-choke-without-`v`, plus 12 multi-choke. Preimages come from my inverse construction, and inflow is the literal `cb8GSec` summed over them. 144/144 pass, 0 failures. Values of γ seen across rows: 0–8, all.
- **N7 companion** at all 15 ruling-27 rows: `ρ₁` comes from a polynomial expansion, `cb8R1` from the entry-89 text with ℕ subtraction. Exact equality at 15/15, and `(16m+4)/3 − 1 = (16m+1)/3` at 15/15.
- **Switch capacity** `ρ₁γ + (8−γ)σ(γ) ≤ γ` for **γ = 0..8**, including the two ends N7 needs and F3 did not test: holds at 15/15 rows.

## Attacks and findings

**A1. The "independent definitional evaluator" does not exist in the shipped evidence (attack brief item 2). Strike.**
- The return claims `exact_transport.py` was "cross-validated against an independently-written direct definitional evaluator (`transport_targets` in `falsify_cb8.py`) on ALL 33,573 independent sets of CB(8,1): 0 mismatches".
- `transport_targets` is defined but **called nowhere** in the nine shipped scripts. `run_all.py` has no such row.
- The only cross-check shipped is `exact_transport.py __main__`. It tests **one** `A0` and **one** `B0`, against `exact_images`/`exact_preimages`, which is the same method family, not the definitional evaluator. It prints `preimage match: True 8 8`, `image match: True 7 7`.
- The claim as written is therefore unbacked and struck, and the Instrument-sides row "preimage/image cross-validation" falls with it.
- The substance is restored by the critic alone: F3's `exact_preimages` agrees with my forward definitional images on all 33,315 targets at CB(8,1). F3's class-row N5 numbers therefore survive on **my** validation, not on the return's.

**A2. The N7 case-split prose is false as a universal. Strike and narrow.**
- The return says: "no sector source's literal arc ever lands on an r-free, v-free target". **Counterexample, exact at every m:** the switch at `s`.
- For a sector source `B` (`r, v ∈ B`), `s ∉ B` and `N(s) ∩ B = {r, v}` has cardinality 2. So `A = (B ∖ {r, v}) ∪ {s}` is a literal (S) image, and it is `r`-free and `v`-free.
- Exhibited (`own/sswitch.out`, `SSWITCH_DIGEST: a5f69220…b9b0`): at m = 107 (|B| = 573 → |A| = 572) and m = 158, `transportRel = True`, `A` independent, `q(A) = 0`, `cb8GSec = 0`, `w(A) = 0`.
- Counted at CB(8,1): class `r0_v0_s1_q0` receives 1,792 sector arcs.
- F3's probe only built targets with `q ≥ 1` chokes (`build_rfree_target` pads with closed supports), so its 7 numeric zeros stand only for "`r`-free, `v`-free, `q ≥ 1`".
- The frozen texts are **not** affected: N4 `cb8GSec_zero_classes` names "the switch at `s`" explicitly, and such targets have weight 0.
- Also struck: the Remaining-obligation reference to "§ Method item 7 reasoning: a sector source changes exactly one vertex per step". Method item 7 contains no such reasoning, and the statement is false for (S) arcs, which remove two vertices and add one.

**A3. The N1 check-count literal "0 mismatches / 46,754 checks" is unbacked. Strike.** The replay prints B1 20,451, B2 20,451, B3 126,418. No subtotal equals 46,754. The zero-failure result itself is replayed, and I re-derived it exhaustively, B3 included.

**A4. The mutation control M5 has no teeth. Strike the "teeth" claim for M5 only.** `run_all.py` compares the two **numbers** `(8−γ)σ(γ)` and `(7−γ)σ(γ)`. It never runs the N5 checker on a mutated statement, so "7/7 failures" only says `σ(γ) ≠ 0` for γ = 1..7. M1 (drop the `[v, r]` term of N6) is a genuine checker run: 262,144 = 2^18 failures, replayed, and the count is exactly the finsets containing both `v` and `r`.

**A5. The N7 companion "two syntaxes / independent sides" is one instrument. Narrow.** F3's `cb8_R` and `cb8_r1` are the same convolution sum `Σ C(a,j)C(b,k−j)2^{k−j}` evaluated twice. The result is correct (critic: an independent polynomial-expansion side at 15/15 rows, plus the proof in the advance below). The "two independent instruments" label is struck.

**A6. Fixed points "All match exactly". Narrow.**
- F3 did not reproduce `x` (570 and 506), which §5 lists, and the return says `x` "is not computed or cited".
- F3's `θ* = 96/766193` is an evaluation of the conjectural law `cb8Theta`, not a reproduction of the LP optimum. At most, the formula of record evaluates to the recorded value.
- I reproduced `x`, `α`, `n` and the margin independently (Independent re-derivation, item 4).

**A7. Fidelity deviations: (WID) not asserted, selector not derived, `x` not computed. Recorded; nothing struck.** Fence 2 and protocol duty 2 require all three. F3's numbers are definitional identities of frozen texts (N1, N5, N6 and the N7 companion). None of them depends on `S`, `x` or the selector: N5 and the companion do not involve `F`, and N1/N6 are stated at `leafSet`. So nothing is downstream of the omission. I supplied the anchors myself (WID at 11/11 ranks of CB(8,1) and at five class rows, `F_{p*} = leafSet` derived, `x` through `α`), and they hold.

**A8. Minor fidelity points. Recorded, harmless.**
- F3's `gsec_literal` adds an `A ⊆ B` conjunct to the deletion label tests that the frozen text does not have. On `transportRel` pairs it is equivalent: on an (S) arc `B ∖ A` has two elements, so it is never a singleton. My transcription omits it and agrees.
- F3 builds the graph from label arithmetic rather than evaluating `cbEdge`. My pairwise evaluation of the literal disjunction agrees at m = 0..3.
- "13 class-row cases" is per row. 26 cases were run across two rows.

**A9. Attempt on every frozen node F3 attacked.** No counterexample to N1 (all four), N5 (both), N6 or N7 (companion and main) exists. For each I have a short informal proof, given in the critic-derived advance below. **None is a certificate:** nothing was compiled, and every frozen node remains `sorry`.

**Critic-derived advance** (attributed to `C-F3-U`; STATED at review, needs an isolated second read). This is the step F3 left open: N7's case split, swept over all `q` "or, more valuably, look for a mis-stated target class".

1. **Complete classification of sector-source images.**
   - For a sector source `B` (independent, `r, v ∈ B`, hence `s ∉ B` and `u_i ∉ B` for all `i`), every literal `transportRel` image falls in exactly one of these five classes:
     - (i) deletion of `b_ij`/`c_ij`, giving an in-sector target of weight 1;
     - (ii) deletion of `r`, giving `r`-free, `v ∈ A`, `q = 0`, weight 0;
     - (iii) deletion of `v`, giving `r ∈ A`, `v ∉ A`, weight 0;
     - (iv) the switch at `s`, giving `r`-free, `v`-free, `q = 0`, weight 0;
     - (v) the switch at `u_i`, which requires `β_i(B) = 1` and gives `r`-free, `v ∈ A`, `q = 1`, weight `γ_i(B)`.
   - No other switch exists:
     - at `b_ij`, `|N ∩ B| ≤ 1` since `u_i ∉ B`;
     - at `c_ij`, `|N| = 1`;
     - `r` is in `B`;
     - at `v`, `N(v) = {s}` and `s ∉ B`.
   - Hence no sector source reaches `q ≥ 2` or (`q = 1`, `v ∉ A`). The CB(8,1) census shows exactly these five classes.
2. **N5 is true for every m** (both declarations). This follows from item 1 and the `cb8GSec` guard.
   - For `A` with `v` and one open choke `u_i`, a sector preimage must invert (v). So `B = (A ∖ {u_i}) ∪ {r, b_ij}` with `c_ij ∉ A`: the `8 − γ` sets, each in state `(1, γ)`, since `u_i ∈ A` excludes every `b_ik` from `A`.
   - On such an arc, `B ∖ A = {r, b_ij}` is not a singleton, so the only nonzero summand is the `u_i` switch term `σ(γ)`, and only when `γ ≥ 1`.
   - At `γ = 0` the formula still holds because `cb8CGamma 0 = 0` makes `cb8Sigma m 0 = 0`. At `γ = 8` there are no preimages and `(8 − 8)·σ = 0`.
3. **N6 is true for every m ≥ 1 and every finset.**
   - For m ≥ 1, `leafSet = {v} ∪ {c_ij}`: `r` has degree `m + 1`, `s` degree 2, `u_i` degree 9, `b_ij` degree 2.
   - `tagWitnesses v = {r}` and `tagWitnesses c_ij = {u_i}`.
   - So `v` is counted iff `v, r ∈ B`, and `c_ij` iff `c_ij, u_i ∈ B`. This gives the frozen formula with no independence needed.
   - At m = 0, `r` is a leaf and `{r, v}` has weight 2 ≠ 1, as F3 found.
4. **N1 (all four) is true for m ≥ 1.**
   - The companion holds because the filter is over `range m`.
   - **(B1).** The three classes partition `B`, and leaves are never chokes. With `r ∉ B`, `w = Σ_{open} γ_i ≤ 8q`. The arm `{s, v}` gives at most 1 ternary vertex, open chokes give 0, and each closed choke gives at most 8 (one of `b_ij`, `c_ij` per leg, and `c_ij` is inactive when `u_i ∉ B`). So `ℓ ≤ 1 + 8(m − q)`.
   - **(B2).**
     - The Boolean insertions are exactly the `c_ij ∉ A` at open chokes, `8q − w` of them. `v` is never active, since `r ∉ A`.
     - The ternary insertions plus twice the ternary count give 2 on the arm and 2 per leg of each closed choke. Open chokes give 0 and are paid by `16q`. Total `2 + 16(m − q) + 16q = 16m + 2`.
   - **(B3)** needs no independence. It is the one-vertex difference of the N6 formula: inserting `v` adds `[r ∈ A]`, inserting `c_ij` adds `[u_i ∈ A]`, and `s`/`b_ij` add 0. These are exactly the frozen indicator, because `(insert z A).erase z = A`.
5. **N7 companion is true for every m ≥ 1 with m ≡ 2 (mod 3).**
   - `(16m+4)/3 − 1 = (16m+1)/3 = K` (both exact), and `8(m − 1) + 1 = 8m ∸ 7`.
   - `cb8R 7 (8m−7) k` equals `coeff_k ((1+X)^7 (1+2X)^{8m−7}) = Σ_{i ≤ min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`, which is `cb8R1 m k`, at `k = K` and at `k = K − 1 ≥ 0`.
   - Numerators and denominators agree term for term.
   - Lean hint: `polyCoeffZ_natCast`, `Polynomial.coeff_mul` over `antidiagonal`, and the binomial coefficients of `(1+X)^7` and `(1+2X)^b`.
6. **N7 main is true from its hypotheses** (ruling 26 composition).
   - **Targets**, split by N6 (`hW`) and C2-LA3 (`F = leafSet`):
     - `r ∈ A` gives E1 0 (clause 5). In-sector: `g_sec ≤ 1 = w`, where `w = 1` because `r ∈ A` excludes every `u_i`. With `v ∉ A`, `w = 0`, so `g_sec = 0` pointwise by `hZero`(2).
     - `r ∉ A`, `q = 0` gives E1 0 and `w = 0`.
     - `r ∉ A`, `q ≥ 2` or (`q = 1`, `v ∉ A`) gives `g_sec = 0` (`hSw`(2)) and E1 `= ρ_q w ≤ w` by `cb8Rho_lt_one_topRank`. This needs `q ≤ m`: the N1 companion, or inline `Finset.card_filter_le`, which is **not** in N7's listed carried facts. **U2 must record the dependency.**
     - `r ∉ A`, `q = 1`, `v ∈ A` gives `w = γ ≤ 8`. The load is `ρ₁γ + (8 − γ)σ(γ)`. For `1 ≤ γ ≤ 7` it is at most `ρ₁γ + θγ ≤ γ`, by C1-LA1 Switch plus Residual through the companion. At γ = 0 the load is 0. At γ = 8 it is `8ρ₁ ≤ 8`.
   - **Sources:**
     - `r ∉ B`: E1 row `= w`.
     - Sector: `w = 1 ≤ hOut`.
     - `r ∈ B`, `v ∉ B`: `w = 0`.
   - **Nonnegativity and support.** E1 `≠ 0` forces a (D) arc, and `g_sec` uses `hSec`.

**Grade of the advance.** Each of items 1–6 is `proved_informal` at most, pending an isolated second read. None closes a frozen node, and none is a registry claim.

## Mechanism-equivalence and fence check

- **Fence 1 (one rank, the class only).** Respected. F3 tests N5 at `p*` and uses m = 0, 1 only where the frozen text is generic (N1, N6, and N5 has no class hypothesis). Nothing is claimed at another rank or `d`.
- **Fence 2 (fidelity).** Deviation A7 is recorded. The critic supplied the missing anchors, and they hold.
- **Fence 3 (Darroch/Newton).** Not invoked by F3 or by me.
- **Fence 4 (template vs network).** F3's N5 checks run on the literal network. Its switch-capacity inequality is template arithmetic and is correctly labelled as N7's composition input, not as a flow.
- **Fence 6 (refuted mechanisms).** None revived. F3 makes no real-rootedness, compression, CHAR or `m`-independent-certificate argument.
- **Fence 7 (census discipline).** Respected by F3: it graded its work `bounded_computation` and named the verdict `bounded_evidence`. My universal statements rest on the proofs in the advance, never on the sweeps.
- **Other contract items.** No status transfer to any aggregate. The `θ*` law is never a hypothesis: F3 uses `cb8Theta` only as C1-LA1's formula of record, and I flag its §5 "reproduction" wording in A6. The r30 bounded record is not used as proof.
- **Mechanism.** The route is what its token says: a Python execution of the frozen texts under Lean conventions. It is not a Lean build, and it does not alias another seat's mechanism.
- **Claim identity.**
  - Keys touched are as F3 lists them, and they are correct:
    - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`;
    - the E1 criterion key;
    - the threshold and favorability keys;
    - `E993-R30-CB-8-M-95-TO-107-…-LOAD-BEARING-SWITCH-ARCS` (fixed-point rows).
  - Grades are unchanged by use. No `E993-R31-` candidate is proposed by F3 or by me. The reserved terminal name appears 0 times in F3's files and in mine. The critic's advance restates frozen node texts; it is not a new key and not an alias of any registered key.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| Stage 2 seal `226555ee…` | recomputed | backed |
| c1-results / c4-base file digests | recomputed | backed |
| 9 artifact digests + bytes | recomputed | backed |
| `MASTER_DIGEST_SHA256 4ad0c6f4…` | replayed | backed (admission defect cured) |
| tree `digest: 3527a38b…` | replayed | backed (admission defect cured) |
| N1 "0 mismatches / 46,754 checks" | replay shows 20,451 / 20,451 / 126,418 | **struck** (count); zero-failure result backed |
| N1 B3 "126,418 sampled" | replayed | backed |
| N6 "0 / 1,048,576" | replayed and re-derived | backed |
| N6 m = 0 "2 ≠ 1" | replayed and re-derived | backed |
| "cross-validated … `transport_targets` … ALL 33,573 … 0 mismatches" | no shipped call | **struck**; substance restored by the critic |
| N5 "0 mismatches / 13 class-row cases" | replayed (13 per row, 26 total) | backed, narrowed (per row) |
| N7 companion "15/15", "two syntaxes / sides" | 15/15 replayed | equality backed; **"independent sides" struck** |
| switch capacity "0 / 105" | replayed | backed (γ = 1..7 only) |
| case-split probe "0 / 7" | replayed | numbers backed for `q ≥ 1`; **universal prose struck** (A2) |
| fixed points "All match exactly" | partial | **narrowed**: `x` absent; `θ*` is a formula evaluation |
| mutation M1 "262,144 / 1,048,576" | replayed | backed |
| mutation M5 "7/7", "teeth" | tautological | **"teeth" struck** |
| `is_tree` at m = 0, 1, 2, 107, 158 | replayed | backed |
| "sorry-free", "compiled", `formally_verified` on its own work | none claimed | n/a (no Lean build) |

- **Ruling 29.** F3 reports no forward difference or difference-indexed number. Its class-row numbers are stated at rank `p* = (16m+4)/3`, which is written textually (for example `CB(8,107)/572`). No rejection under ruling 29 is triggered. My own difference-indexed numbers are written textually: `Δ_{p*}(T − z) = i_{p*+1} − i_{p*}` and `Δ_{p*−1}` inside `S`.
- **The return's `## Remaining obligation`.**
  - It is accurate that the frozen nodes stay `sorry`, and on the ownership assignments.
  - Its item 2 rests on the struck "one vertex per step" argument, and its proposed `q = 1..m` sweep is superseded by the classification proof in the advance.

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: no
E1_formal: no
TERMINAL_integration: no
cut_candidate: no
FROZEN_NODES_CLOSED: none

**What stands.** The return's central finding is correct and re-derived here with a separate instrument: no counterexample exists to N1, N5, N6 or N7 (companion and composition). I extend that to informal proofs at full scope (advance items 1–6, `proved_informal` pending an isolated second read; no award, no frozen node closed).

**What is struck or narrowed.**
- The claimed exhaustive cross-validation against a definitional evaluator is struck, because it was never run.
- The universal case-split prose is struck, with a counterexample: the `s`-switch.
- The 46,754 count is struck.
- The M5 "teeth" claim is struck.
- The "independent sides" label on the companion is struck.
- The fixed-point claim is narrowed.

**Why narrowed rather than rejected.** Every number the route relies on survives my own validation.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Formal work (owners per C4-ALLOCATION):**
   - compile the frozen N1 (T1/U1), N5 (T3), N6 and N7 companion (U2) texts byte-for-byte on the c4-base, with axioms `propext`, `Classical.choice`, `Quot.sound` only;
   - N7 main (U2) from its hypotheses, recording the `q ≤ m` dependency (N1 companion or `Finset.card_filter_le`), which is not in N7's listed carried facts.
2. **Isolated second read** of the critic's advance items 1–6 before any of it is cited as `proved_informal`. The classification in item 1 is the load-bearing lemma for N5 clause 2 and for the completeness of N7's case split.
3. **F3's class-row evidence stands on the critic's validation (A1).** A Stage 7 panel citing F3 should cite the critic's `inverse_vs_forward` and `F3_exact_preimages_vs_critic_forward` rows (`own/m1_exhaustive.out`), not the return's struck cross-validation.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F3-U/`. SHA-256 values are from `shasum -a 256` in this session.

| Path | SHA-256 | Bytes | Role |
|---|---|---|---|
| `own/core.py` | `92b9fdd655317f497b643b56dec98fda2852b397e0cca656a452877c1d30c64d` | 7092 | critic core: literal `cbEdge`, weights, `transportRel`, forward/inverse maps, `cb8GSec`, parsed tables |
| `own/m1_exhaustive.py` | `ab8a16815ad77eee130e2ab67fb48c74743abab0e0c069697925398f562caf92` | 9087 | CB(8,1): WID every rank, x, N1 B1/B2/B3 (all pairs), N6, N5 forward, classes, inverse validation, F3 adjudication |
| `own/m1_exhaustive.out` | `783c199ba2c583de97051cd4439ba648e59bf7b4d0f3d9cf4650f4b3009e2615` | 1547 | output (`M1_DIGEST: 9dd6e08ab8a606bcf39da59928c53fe49a974dc523169373600a4ec0f5713af8`) |
| `own/classrows.py` | `7ad15476e188e446c66cebe3093032628a16ed8045956b120b77298873ce2878` | 10335 | rows 95/107/158/161/164: tree DP, x/α, derived selector, WID, fixed points, companion, switch γ = 0..8, N5 random |
| `own/classrows.out` | `bad3cd6122ed7953a9ae3f7ff09cfbc7ecf15fba97deb99ef42fc2a71c141799` | 8838 | output (`CLASSROWS_DIGEST: d5136950f4506a15126650e332e3bb1b55687df9d4ce18c38d77315c439b01f6`) |
| `own/sswitch.py` | `0eba8c507b13bc213b7b601c8864f6d19d1eb8a194ddcdb8c743fba016112211` | 1062 | the `s`-switch counterexample to the case-split prose at 107, 158 |
| `own/sswitch.out` | `96698ee97de3c765ac917694ec2729a9f26fe891bae4ec531bdd4be2c35589eb` | 400 | output (`SSWITCH_DIGEST: a5f692202a60d371ddbbfc42a269f8a650771ad63639a742571e3f124390b9b0`) |
| `replay/*.py` (9 files) | identical to the return's inventory (all nine digests matched) | 37285 total | copy-out-first replay set (8 from `c4-F3/`, `run_all.py` from `c4-F3-replay/`; disclosed) |
| `replay/run_all.out` | `aa23967e4e1870f57e14e93c448f81ddc5bf80a9e15c12f47fca4b975ad82fba` | 1495 | replay output (`MASTER_DIGEST_SHA256: 4ad0c6f4…`) |

**Replay my evidence** (standard library only; from `own/`):
```sh
python3 -B core.py
python3 -B m1_exhaustive.py
python3 -B classrows.py
python3 -B sswitch.py
```

**Process notes.**
- Background jobs: none started. Every command ran in the foreground, and `jobs -l` before the final write returned nothing.
- No process listing was run. No `lake`/`lean` was invoked: F3 is not a Lean seat, and nothing needed a rebuild.
- No network, no installs.
- Writes: my scratch directory and this file only.
