# Critique

Critic `C-U3-F` (orientation F, falsify), Cycle 2 Stage 4, r31. Assigned return: seat `U3`, route `C2-U-03`, mechanism token
`FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`, orientation U. Date 2026-09-28.

**Boot acknowledgment.** I booted VerityOS by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and read no other VerityOS file. The harness put the project `CLAUDE.md`,
the user memory index and the user's email into my context automatically, before any tool call. I did not fetch them and used nothing
from them. Following the run's rule that the controller owns logging, I wrote no conversation log.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures.**
1. Beyond the capsule, I read these files, each within the dispatch's grant or a Stage 2 member:
   - `control/C2-WORKER-COMMON-BRIEF.md` (a Stage 2 member that the common brief names as binding; digest `8a2eb995…` verified against
     the Stage 2 manifest);
   - `sources/c1-results/SOURCE-DIGESTS.json` and the C1-LA2 award tree (the `ls` of its run directory, `Main.lean`, the project
     files);
   - two targeted `ls`/`grep` probes of `sources/r30/lean/lean-2026-09-28-c6-la2-…`, used to check the return's naming note and its
     spider citation;
   - `sources/mathlib-binding/PIN.json`;
   - `git rev-parse HEAD` in the shared Mathlib package directory.
2. The return's replay script `scratchpad/c2-U3-replay/replay-U3.sh` sits outside `scratchpad/c2-U3/`, but the return names it as its
   replay. I copied it out and read it. I did NOT run it, because it runs `rm -rf` on and writes into the seat's replay tree. I replayed
   the build in my own scratch instead.
3. Non-recursive `ls` of `scratchpad/c2-U3/`, `scratchpad/c2-U3/LeanProject/`, `…/LeanProof/` and `scratchpad/c2-U3-replay/`. These
   were names only, within the granted artifact tree. The outputs showed only the `..` entry, not the parent's contents.
4. I read no sibling return, critique or adjudication. The Stage 3 manifest lists them, and I read only its path list, never the files.
   I ran no `find`/`grep`/`rg`/`ls -R` rooted above a grant. No network, no installs, no background jobs.

## Identity and seal audit

- **Dispatch file** `control/dispatch/c2-stage4/DISPATCH-C-U3-F.md`: SHA-256 `e89e3c03e5a92682e82ab588ad0ad1224b1049d678dedf9bfd48c40ee7c24fdb`,
  which MATCHES the value stated.
- **Capsule seal** (`control/c2-critic-capsules/U3-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys, `(",",":")`,
  no trailing newline): recomputed `f55f23f2bca05fb28f301b9b367cfedd7a486c5b2670267f17857ec208b7225b`, which MATCHES. All 14 listed files match
  their `sha256` and `bytes` (my own `seals.py`).
- **Stage 2 seal** recomputed `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`, which MATCHES. **Stage 3 seal** recomputed
  `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`, which MATCHES. **Stage 4 dispatch seal** recomputed
  `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`, which MATCHES.
- **Digests the return lists**, each re-checked:
  - `Main.lean` `a906ec17…f5f3f`: MATCH against the frozen C1-LA2 award, the Stage 2 manifest and `sources/c1-results/SOURCE-DIGESTS.json`.
    It is 84219 bytes and 1701 lines, as the return states.
  - `U3.lean` `bacc4808…9e9e0`: MATCH on my copy-out.
  - `PIN.json` `af78b3d8…bd3ba0`: MATCH.
  - The Mathlib rev `905b9581…` in the shared package directory: MATCH.
  - `C2-STAGE3-CONTROLLER-FACT-G.json` `7582bb5e…`: taken from the Stage 3 disclosures record. I did not open that file, because it is
    not in my capsule; the record states the fact itself.
  - All 86 C1-LA2 files covered by `sources/c1-results/SOURCE-DIGESTS.json` under `LeanProject`/`FORMALIZATION-STATE` verify (my own
    `digests.py`). The seat's 83 are a subset of these.
  - The seat's `Snippets/` directory is byte-identical to the award's (`diff -r`, 78 fragments).
- **Route identity:** route ID `C2-U-03` and mechanism token `FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS` appear verbatim. The
  load-bearing obligation is quoted verbatim from `control/C2-ALLOCATION.md` §U3. The model disclosure is two-part.
- **Controller fact CF-C2-G (checked independently of the seat's acknowledgment):**
  - `U3.lean` contains no polynomial term at all: a `grep` for `X`, `Polynomial` and `(1+2` hits only a docstring.
  - That docstring (line 176) quotes `I(CB−v) = (1+x)G^m + x(1+2x)^{8m}`, which is the contract's form.
  - Every non-quoted `G` in the return's prose is the contract's `G = (1+2x)^8 + x(1+x)^8`. The one swapped `G = (1+x)^8 + x(1+2x)^8`
    in the return appears only where the return quotes the allocation's erratum as wrong.
  - My instrument separates the two numerically: the contract's `G` reproduces `I(CB(8,m))` from the literal tree for `m = 1..12`, and
    the swapped `G` fails at every one of those `m`.
- **Naming note** (entry 22 vs r30 "0035"): CONFIRMED. In the carried `Main.lean`, entry 22 is `C5LA1.crossingIndex` and entry 35 is
  `cbGraph_adj_iff`. The r30 C6-LA2 snippet `0035-definition-C5LA1-crossingIndex` exists. Entries 1, 7, 8, 10, 22, 31, 39, 42, 67 and 68
  carry the names the return cites. Entry 31 is marked as r30 C6-LA2 origin, and it is r30's `0123-…support_eq_of_isGraphLeaf_of_adj`.

## Independent re-derivation

**Registered claims touched, named before any computation.** My instrument reproduces:
- the closed forms of record (a `proved_informal` node of
  `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`);
- the `CB(8,107)/572` fixed point, from the row key
  `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (`computer_assisted`);
- the parent descent at `m = 107` only (within (ELIG-top)(a)'s `bounded_computation` record).

It upgrades none of them.

**Lean replay (copy-out-first; my own project).**
- **Build.** I built a fresh `scratchpad/c2-crit-U3-F/LeanProject` from the frozen C1-LA2 award's `lakefile.toml`, `lake-manifest.json`,
  `lean-toolchain` and `Main.lean`, plus the copied-out `U3.lean`. Mathlib is bound by a manual symlink, every call runs after `cd`
  into the project, and I never ran `lake update`/`lake clean`. `lake build LeanProof.U3` gives `Build completed successfully (8656
  jobs)`, with the one unused-section-variable linter warning the return reports.
- **Axioms.** `#print axioms` on all five U3 declarations returns `[propext, Classical.choice, Quot.sound]`. The same holds for the
  carried terminal `cb8_topRank_of_descent_and_flow`.
- **Forbidden tactics.** A `grep` for `sorry|admit|native_decide|decide|^axiom` over `U3.lean` finds nothing.
- **Statements read against the carried definitions** (the printed `#check` output matches the return's text):
  - `indepSetCount G D k` is `((univ \ D).powersetCard k).filter IsIndepSet`, carried entries 9–10.
  - Node 0 states `i_{k+1}(G−D) = i_{k+1}(G−D−x) + i_k(G−D−N[x])` for `x ∉ D`, and `insert x (D ∪ N(x))` is exactly `D ∪ N[x]`.
  - The index shift is correct: a `(k+1)`-set containing `x` becomes a `k`-set once `x` is removed.
  - The hypothesis `x ∉ D` is necessary. With `x ∈ D` the first right-hand term equals the left-hand side, and the second term is an
    extra nonnegative count.
  - The leaf corollary replaces `D ∪ N[x]` by `C5LA1.H G x = {x, support G x}` through `neighborFinset x = {s}` and carried entry 31.
    Its first term is `vertexDeletionIndepSetCount G x (k+1)` (entry 1, `univ.erase x`).
- **Labelling.**
  - `v = cbVertex m 2` has support `cbVertex m 1`. `c_ij = cbVertex m (3+17i+2+2j)` has support `b_ij = cbVertex m (3+17i+1+2j)`.
  - This matches the frozen labelling in entry 23's comment: `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`.
  - My Python re-implementation of `cbEdge`, written from entry 23's text, finds exactly `{2} ∪ {3+17i+2+2j}` as the leaf set at
    `m = 3`, with supports as stated.
- **Hypotheses.** No hypothesis encodes a conclusion: Theorems 3–4 carry only `i < m`, `j < 8`.

**Numeric instrument** (`crit_u3_instrument.py`, standard library only; output digest `27595f20…65fe8e`). It uses two independent
counters: brute-force enumeration of independent sets avoiding `D`, and a rooted tree DP.
- **Node 0 by brute force on literal `CB(8,1)`.** Checked at every vertex `x` with `D = ∅`, at 40 random `(D, x)`, and on 60 random
  graphs with `n ≤ 11`: TRUE in every case.
- **Brute force against the DP at `m = 1`:** agree.
- **Closed forms against the literal tree for `m = 1..12`:**
  - the DP matches `I(CB)`, `I(CB−v)` and `I(CB−c_{0,0})`, all with the contract's `G` and `G_c`;
  - it does not match `I(CB)` with the swapped `G`.
- **Fixed point at `m = 107`:** `n = 1822`, `α = 964`, `x = 570`, `p* = 572`, and `i_{571} < i_{570}`. The closed form equals the DP
  polynomial.
- **Root split for `m = 1..7`:**
  - `I(T − r) = (1+2x)G^m`;
  - `I(T − N[r]) = (1+x)(1+2x)^{8m}`.

  These are exactly the two products the missing link must assemble, since `I = I(T−r) + x·I(T−N[r])`.

These are census checks. They discover and test; they prove nothing universal (fence 7).

## Attacks and findings

1. **The Lean mathematics survives.** It is kernel-checked, the axioms are standard, it is sorry-free, the index shift is right, and
   the hypotheses are necessary and used. No defect found. Graph-generic Node 0 is correct at full generality, including arbitrary `D`.
   One small scope note: the recursion is stated only at `k+1`. A successor also needs `indepSetCount G D 0 = 1`, which is trivial but
   not shipped.
2. **Overstated role of Theorems 2–4 (narrowing).**
   - **The claim.** The docstrings call the leaf corollary "the exact bridge that lets a closed-form coefficient identity for `I(G;x)` …
     transfer to `C5LA1.indepSetCount G ∅ k`". The return calls the instantiations "the concrete Node-0 recursion a successor needs to
     carry `I(CB(8,m) − v)`'s closed form".
   - **Why it fails.**
     - Every closed form of record comes from splitting at the ROOT `r`, not at a leaf. `I(T) = I(T−r) + x·I(T−N[r])`, and each term is a
       product over components: `T − r = P_2{s,v} ⊔ m` choke gadgets, and `T − N[r] = {v} ⊔ 8m` edges `b–c`.
     - My instrument confirms both product identities.
     - A leaf split at `v` or `c_ij` expresses `I(T)` through `I(T−v)` and `I(T−{v,s})`. Neither of those is closer to a closed form.
   - **Consequence.** Theorems 3–4 are correct but off the critical path of the conjunct-2 link. They do not supply the closed form
     for `I(CB−v)` or `I(CB−c)` either: each needs its own component product. They are at most a convenience relating
     `vertexDeletionIndepSetCount` to `I(T)` (relevant to favorability, conjunct 4's hypothesis, not conjunct 2).
   - **What survives.** Only Node 0, applied at `r` and at each `u_i`, is on the path.
3. **Gate line overstated (strike).** The return writes `ELIG_formal: advanced`, but no ELIG node changed:
   - conjunct 2 of entry 78 is still a bare hypothesis;
   - no statement about `crossingIndex (cbGraph m)` or any closed-form coefficient is proved;
   - the allocation itself classes U3 as "infrastructure …, not Tier 2 progress".

   Infrastructure that is necessary but far from sufficient does not advance the gate object. I record `ELIG_formal: not_advanced`
   for this return. The same holds after my own advance below, which is also infrastructure.
4. **Remaining-obligation item 4 checked.** I checked this step myself:
   - (ELIG-top)(a), `i_{p*−1} < i_{p*−2}`, means `forwardDifferenceDel G ∅ (p*−2) < 0`, so `crossingIndex ≤ p* − 2` by `Nat.find_min'`.
   - The ℕ-subtraction `p* − 2` is safe because `p* ≥ 572`.
   - Hence `crossingIndex + 2 ≤ p*`, and the direction is correct.
   - The link needs the coefficient identity at just the two indices `k = p*−1, p*−2`. That is a smaller target than "for all `k`",
     though the natural proof gives all `k`.
5. **Certification literals.**
   - "`U3.lean` (198 lines after the file's own `import` line)": FALSE. The file has 198 lines INCLUDING the import (`wc -l` = 198), so
     197 follow it. This is struck as stated and harmless.
   - The return places "`[DecidableEq V]` enters here" at step 2. The proof actually opens `classical` (line 34), and `DecidableEq V`
     is needed by `Finset.univ \ D` in the carried definition. This is a prose imprecision, not a proof defect.
   - All other literals are backed; see the Certification audit.
6. **Boundary note.** The return reports "a final sweep of `/tmp` (`ls /tmp/*.lean`)" that listed other processes' files. That is a
   glob listing rooted outside every grant. The return reports it as a note rather than as a read-boundary disclosure, so I record it
   here as an unclassified out-of-grant listing (names only; nothing used). The seat's own two disclosures are complete as written.
7. **Replay hygiene (minor).** `replay-U3.sh` prints the two digests but does not assert them. It would build a modified `U3.lean`
   without failing. It also copies from the seat's live scratch, not from a frozen copy. My replay asserts both digests with
   `shasum -c`.
8. **No cut or template claim.** This route makes no network claim, so there is no (WID) or `F_{p*}` fidelity item. The census clauses
   do not apply, and the return correctly says so.

**Critic-derived advance (attributed to critic C-U3-F; compiled scratch, no grade).** I attempted the step the return leaves open, its
Remaining-obligation item 1: the disjoint-union multiplicativity for `C5LA1.indepSetCount`.

**Mathlib support.** Nothing ready-made for `C5LA1.indepSetCount` was needed or found. The proof uses generic `Finset` tools:
- `card_eq_sum_card_fiberwise` (fibres of `A ↦ |A ∩ P|`);
- `card_nbij'` (`A ↦ (A ∩ P, A \ P)`, inverse `(B, C) ↦ B ∪ C`);
- `card_product`;
- `Nat.sum_antidiagonal_eq_sum_range_succ`;
- `Set.pairwise_union_of_symm`.

**Compiled declarations.** All are compiled in `scratchpad/c2-crit-U3-F/LeanProject/LeanProof/{CritMul,CritCB}.lean`. `lake build
LeanProof.CritCB` succeeds (8658 jobs), and `#print axioms` returns `[propext, Classical.choice, Quot.sound]` for each.
- **`crit_indepSetCount_eq_sum_antidiagonal_of_noCross`** (graph-generic).

  ```lean
  theorem crit_indepSetCount_eq_sum_antidiagonal_of_noCross (G : SimpleGraph V) [DecidableRel G.Adj]
      (D P : Finset V) (hPD : Disjoint P D) (hno : ∀ a ∈ P, ∀ b, b ∉ P → b ∉ D → ¬ G.Adj a b) (k : ℕ) :
      C5LA1.indepSetCount G D k =
        ∑ ij ∈ Finset.HasAntidiagonal.antidiagonal k,
          C5LA1.indepSetCount G (Finset.univ \ P) ij.1 * C5LA1.indepSetCount G (D ∪ P) ij.2
  ```

  The factor `indepSetCount G (univ \ P) a` counts independent `a`-subsets inside `P`.
- **`critGadget m i`**: the 17 labels `3+17i .. 3+17i+16`.
- **`crit_gadget_noCross`**: no edge of `cbGraph m` leaves a gadget except to label 0. The proof needed a trichotomy on `i` vs `i'`,
  because `omega` alone is incomplete there.
- **`crit_cb_root_split`**: Node 0 at `r`. The return flagged this step but did not execute it.
- **`crit_cb_peel_gadget`**: for any `D ∋ r` disjoint from gadget `i`,
  `i_k(cbGraph m − D) = Σ_{a+b=k} i_a(gadget i) · i_b(cbGraph m − D − gadget i)`. This is the iterable peel step of the `m`-ary
  product.

**What this leaves.** The load-bearing gap of item 1 shrinks to three nodes:
- (a) pairwise disjointness of distinct gadgets, and the fold over `i = 0..m−1`, turning the iterated antidiagonal sums into
  `Polynomial` coefficients of a product;
- (b) the single-gadget count `i_a(gadget i) = [x^a] G` with the contract's `G`, independent of `i`. Its proof is Node 0 at `u_i`, then
  eight two-vertex peels;
- (c) the same pattern for `T − N[r]` and the `{s,v}` pendant.

## Mechanism-equivalence and fence check

- **Fence 1 (one rank, the class only):** the return claims nothing at any rank. Its theorems are rank-free counting identities, and
  they are graph-generic or for all `m`, which is legitimate for infrastructure. No aggregate status transfer.
- **Fence 3 (Darroch/Newton):** not used anywhere, by the return or by me.
- **Fence 7 (census):** the return runs none. My census rows are labelled as tests only.
- **Fence 6 (refuted mechanisms):** none revived. The recursion `i_{k+1}(G−D) = i_{k+1}(G−D−x) + i_k(G−D−N[x])` is the standard
  deletion/closed-neighbourhood recursion. It is not a real-rootedness, compression or `m`-independent certificate claim.
- **Mechanism identity:** the route delivers what its token names only in part (infrastructure toward the closed forms). It does not
  deliver the closed-form link itself, and the return says so.
- **Claim identity:**
  - no `E993-` registry key is confirmed or touched by the return;
  - no `E993-R31-` candidate is proposed, so the alias check is vacuous;
  - the Lean identifiers are ordinary declaration names;
  - my critic declarations are prefixed `crit_`/`critGadget` and propose no key either.
- **Gate ruling 12 (carries):** `Main.lean` is carried whole and byte-identical from C1-LA2, and the snippets are identical. No
  re-typed carried entry and no r30 C1-LA2 entry 0014–0021 appear. **Gate ruling 13:** nothing closed is re-proved.

## Certification audit

- **Backed by my replay:**
  - "compiled", "sorry-free", "`#print axioms` … exactly `[propext, Classical.choice, Quot.sound]`" for all five;
  - "Build completed successfully (8656 jobs)", with the one linter warning;
  - "no `native_decide`, no new `axiom`, no `sorry`";
  - the `U3.lean`, `Main.lean` and `PIN.json` digests;
  - "84219 bytes, 1701 lines";
  - the Mathlib rev;
  - the Stage 2 seal;
  - the entry numbers 1/7/8/10/22/31/35/39/42/67/68;
  - the absence of any closed-form bridge in C1-LA3 and the r30 spider award. This one is checked in part: I confirmed that
    `spiderRootSplitDown` and `spiderOneTwoThrees_crossingIndex_le` exist in the frozen `Main.lean`, but I did not read their proofs.
- **Struck:**
  - "198 lines after the file's own `import` line": it is 198 in total.
  - `ELIG_formal: advanced`: not backed, because no ELIG node changed. Replaced by `not_advanced`.
- **Narrowed:** "the exact bridge needed" and "the concrete Node-0 recursion a successor needs to carry `I(CB(8,m) − v)`'s closed
  form", in the docstrings and prose. Node 0 is a necessary ingredient, and Theorems 3–4 are not on the closed-form path (finding 2).
- **Route verdict `compiled`:** accurate. The return correctly withholds any grade from its scratch declarations.

## Verdict

The return is honest about its scope. Its Lean mathematics is correct, and I rebuilt it independently: five declarations, kernel-checked
with the standard axioms. It is narrowed on three points:
- the leaf instantiations (Theorems 3–4) are off the closed-form path, and only Node 0 is load-bearing;
- the gate line `ELIG_formal: advanced` is struck to `not_advanced`;
- one line-count literal is struck.

Nothing is rejected. The critic-derived advance compiles the generic two-part convolution and the CB gadget-peel step, which reduces
the return's named blocked node to nodes (a)–(c) above. None of this carries a grade until a governed award closes.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

This is what a successor inherits, in order. The link that conjunct 2 of `cb8_topRank_of_descent_and_flow` needs from U1's integer
theorem is still wholly open.

1. **The `m`-ary fold.** Start from `crit_cb_peel_gadget` (critic scratch) and apply it in two passes:
   - First pass, from `crit_cb_root_split`'s first term, with `D_0 = {r}`:
     - peel the `{s,v}` pendant with the generic convolution (`P = {1,2}`, no cross edges once `r ∈ D`);
     - then peel gadgets `i = 0..m−1` in turn, with `D_{i+1} = D_i ∪ critGadget m i`.
   - Second pass, from its second term, with `D_0 = N[r] = {r, s} ∪ {u_i}`:
     - peel `{v}`;
     - then the `8m` edges `{b_ij, c_ij}`.
   - This needs the pairwise disjointness of gadgets and an induction that restates the iterated antidiagonal sums as the
     coefficient of a `Polynomial ℕ`/`ℤ` product. That coefficient is `Polynomial.coeff_mul` with `Finset.antidiagonal`.
2. **The single-gadget factor.** Prove `indepSetCount (cbGraph m) (univ \ critGadget m i) a = coeff G a` with
   `G = (1+2X)^8 + X(1+X)^8`, the contract's form and NOT the allocation's swapped form. The route: Node 0 at `u_i`, with the
   `u_i`-excluded branch being eight disjoint edges, each contributing `1+2X`, and the `u_i`-included branch being eight isolated
   leaves, each contributing `1+X`. Plus the matching two-vertex base cases.
3. **The assembly.** `indepSetCount (cbGraph m) ∅ k = coeff ((1+2X)G^m + X(1+X)(1+2X)^{8m}) k`, needed at least at
   `k = p*−1, p*−2`. Then `Nat.find_min'` on `C5LA1.crossingIndex` gives `crossingIndex (cbGraph m) + 2 ≤ p*` from U1's inequality.
   The ℕ-subtraction `p*−2` needs `p* ≥ 2`, which the class gives.
4. **For favorability (conjunct 4's hypothesis, not conjunct 2):** the same pattern for `cbGraph m − v` and `cbGraph m − c_ij`. The
   `c_ij` case has one damaged gadget with factor `G_c = (1+2X)^7(1+X) + X(1+X)^7`. U3's Theorems 3–4 are not a substitute for this.
5. **Small completeness item:** `indepSetCount G D 0 = 1`, which Node 0 does not cover at `k = 0`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U3-F/`.

| Artifact | Role | SHA-256 |
|---|---|---|
| `seals.py` | capsule, Stage 2/3/4 and capsule-file seal check | `1a2bf104a58741f4a88af2f06e33e99eb0306dbeee0aed9a310c679d47fc853f` |
| `digests.py` | C1-LA2 files and `PIN.json` digest check | `c5f18995783991f0c2f9531bc23defc8de2b3b76e2d8c8e8b944292cc9c27b81` |
| `crit_u3_instrument.py` | independent instrument: literal `cbEdge`, brute force, tree DP, Node 0, closed forms, `m = 107` | `9255d584a82108272636600229e2a18b15984c9e9939a6f46011c8a0bfb13a29` |
| `crit_u3_instrument.out` | instrument output (JSON line + digest `27595f20904f6c5ce80cb82889515e1a54a7f4dacde963b146e29f8f2765fe8e`) | `88cf1bdb142e2d6e75540140752af4c495fbb748cddd5354d34b11a7ac111921` |
| `copy/` | copy-out of the seat's `U3.lean`, `Main.lean`, project files and `replay-U3.sh` | `U3.lean` `bacc4808…9e9e0`; `replay-U3.sh` `70af1a41…6079c` |
| `LeanProject/` | my rebuild: carried `Main.lean` (`a906ec17…`), `U3.lean` (`bacc4808…`), the critic advance and the axiom probes | — |
| `LeanProject/LeanProof/CritMul.lean` | critic advance: generic convolution | `a6f9d2d8102efe580ca8c7b411f9b216d8e5a763c2bd97ae640db7572d2dc82e` |
| `LeanProject/LeanProof/CritCB.lean` | critic advance: `critGadget`, `crit_gadget_noCross`, `crit_cb_root_split`, `crit_cb_peel_gadget` | `61c71d27b2d4d42090b825fde65df62ce87975e67fd5a040606c8b06c5ae0372` |
| `LeanProject/LeanProof/CritAx.lean`, `CritAx2.lean` | `#print axioms` / `#check` probes | `b6e8b8be…c078a`, `18224747…f33f9b` |
| `replay-crit-U3-F.sh` | copy-out-first replay into `scratchpad/c2-crit-U3-F/replay/`; asserts the four Lean digests, builds, prints axioms, reruns the instrument | `a312fe852e485a8d879e43fcf8c48c7d2495bd6b78ab79a73aa347f6deb6577f` |

**Replay:** `bash /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U3-F/replay-crit-U3-F.sh`.
I ran it once and it passed: digests OK, build OK, axioms standard, instrument digest reproduced.

**Background jobs:** none were started. Every `lake`/`lean`/`python3` call ran in the foreground, so there is nothing to kill.
