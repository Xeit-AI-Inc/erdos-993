# Critique

Critic `C-T2-U`, Cycle 4 Stage 4, r31. Cross-orientation critic, orientation U (formal / structural), of seat T2's return: route
`C4-T-02`, mechanism `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE`, orientation T (prove).

**Boot acknowledgment.** I am operating within VerityOS. This was a restricted boot: I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-T2-U.md`. Its SHA-256 `7c02ff3ce57d9c071487fd3fa4cb15ed8a66cf0bf55f22c468a06279f5b814af`
was recomputed and matched before I read it. I read no other VerityOS file outside the run root.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal** (`control/c4-critic-capsules/T2-PACKET-MANIFEST.json`): I recomputed SHA-256 over the compact key-sorted JSON
  without `seal_sha256` and got `361196547fa1ca35e14a7bff166caf8a586dd876fc2e7f1dd135065c6ec2b248`, which matches. All 16 listed
  files match their SHA-256 and byte counts.
- **Stage 4 dispatch seal** `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`: recomputed and matched.
  **Stage 3 packet seal** `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`: recomputed and matched.
  **Stage 2 seal** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`: recomputed and matched.
- **Assigned return** `cycles/cycle-4/stage3/returns/T2/RETURN.md`: SHA-256 `c9cb4259…4dfb4`, 23,304 bytes. This matches the
  capsule and the Stage 3 admission record.
- **Digests the return lists.** I checked each one.
  - The frozen text `control/C4-FROZEN-STATEMENTS.lean` is `0fc723d7…9ede1`. It is byte-identical to
    `sources/c4-base/LeanProject/LeanProof/Statements.lean`.
  - The companion `.md` is `6aa6dfe5…ca54b`.
  - All 12 entries of `sources/c4-base/SOURCE-DIGESTS.json` match, including `Main.lean` `385af1bf…` and `ChokeState.lean`
    `64a101ef…`.
  - The Mathlib pin `905b95818eb32af7874a58b427f50c1711a5e96c` equals `git rev-parse HEAD` of the shared checkout.
  - The five draft-input digests (`0db39495…`, `1f3f365d…`, `c0d1794f…`, `396315cc…`, `a03e15f3…`) each match their file. They
    also appear in the Stage 2 manifest and in the sub-root digest files (`sources/c3-scratch-lean/SOURCE-DIGESTS.json` and
    `sources/c2-stage7-sources/SOURCE-DIGESTS.json`). They do NOT appear in the top-level `sources/SOURCE-DIGESTS.json`, so the
    return's phrase "the run's `SOURCE-DIGESTS.json` records" is loose. The digests themselves are correct.
  - `T2.lean` is `a2eeaf65929dd5189b2c5c51ad80363ee9d409e1a335e95434b5611cc86ba6f0`. The working copy, the replay copy and my
    copy-out all have this digest.
- **Consistency across the host interruptions.** The final scratch, logs and RETURN.md agree.
  - `T2.lean` has the same digest in all three places.
  - The four carried base files in `scratchpad/c4-T2/LeanProject/LeanProof/` are byte-identical to `sources/c4-base`, and the
    project's root `LeanProof.lean` is unmodified.
  - `work/build-final.log` records the failed attempt to wire `T2` into the root import (`environment already contains
    'E993Transport.cb8GSec' from LeanProof.Statements`). This is the clash the return discloses as the reason for the standalone
    target.
  - `work/axioms.log` matches the quoted axiom output.
  - `work/build-t2.log` shows `Replayed LeanProof.T2`, a cache replay rather than a fresh elaboration. This does not change the
    result: I elaborated `T2.lean` fresh myself (below).
- **Identity.** The route ID `C4-T-02` and the mechanism token appear verbatim. The return registers no new `E993-R31-` key, so
  there is nothing to alias-check. All five proved names are the frozen names of record.

## Independent re-derivation

I used three instruments of my own. I did not treat T2's scripts or logs as evidence.

**(I) Fresh kernel rebuild, copy-out-first.**
- Project: `scratchpad/c4-crit-T2-U/LeanProject/`, copied from `sources/c4-base/LeanProject`. `.lake/packages` is bound by manual
  symlink to the pinned shared Mathlib. The controller base cache (CF-C4-S3-1) is copied in; it contains no `T2` artifacts, and I
  used neither `--no-cache` nor the seat's cache.
- `lake build LeanProof`: the base replayed in 7.1 s and succeeded, with the 20 frozen `sorry` warnings.
- `lake build LeanProof.T2`: `Built LeanProof.T2 (34s)`, a genuine elaboration. Zero errors; the only warning is the unused `hv`
  binder at 445:5.
- `#print axioms` (`instr/AxT2.lean`): all five N3 declarations and both generic uniqueness lemmas depend on
  `[propext, Classical.choice, Quot.sound]` only.
- Token scan of `T2.lean`: 0 `admit`, 0 `native_decide`, 0 `decide`, 0 `axiom`, 0 `set_option`, and 0 occurrences of the reserved
  terminal name. The one literal `sorry` is in the header comment.

**(II) Binding to the FROZEN text (the step the return leaves open; see `## Attacks and findings` F1).**
- `instr/bind.py` takes the frozen `Statements.lean` bytes and makes two changes only: it replaces the five N3 `sorry` bodies with
  T2's proof bodies, and it inserts T2's helper block verbatim immediately before the frozen `cb8GSec` definition. T2's duplicate
  `cb8GSec` is dropped, so the frozen single copy governs.
- A reverse check (remove the helper block, restore the five `sorry` bodies) gives bytes equal to the frozen file.
- `lake build LeanProof.StatementsBound` succeeded with exactly 15 `sorry` warnings, i.e. 20 − 5.
- In the frozen module context (imports `Main`, `E1FlowConstruction`, `ChokeState`; `open SimpleGraph Polynomial`), `#print
  axioms` on the five frozen declarations gives `[propext, Classical.choice, Quot.sound]`. Controls: `cb8GSec_in_eq` and
  `cbOpenChokeCount_le` still show `sorryAx`.
- A co-import of `Main`, `E1FlowConstruction`, `ChokeState`, `C3LA1` and `StatementsBound` elaborates with no name clash. C3-LA1's
  terminal keeps its three standard axioms.

**(III) Exact literal-network check of the N3 mathematics** (`instr/out_bridge_check.py`, standard library).
- The instrument is written from SEMANTIC-CONTRACT §2 and the `cbEdge` labels: `r=0`, `s=1`, `v=2`, `u_i=3+17i`,
  `b_ij=3+17i+1+2j`, `c_ij=3+17i+2+2j`. The labels were checked against `Main.lean` entry 23.
- It evaluates the frozen `cb8GSec` literally: the guard `IsSectorSource ∧ B ∈ I_{p*+1} ∧ transportRel`, then the indicator sum.
- The per-state coefficients `pb(s)`, `pc(s)` and `σ(γ)` are FREE SYMBOLS, so the Out bridge is tested as a symbolic identity
  (multiplicity of every symbol). A numerical coincidence cannot pass.
- The left side is summed over distinct `A`, as a Finset sum, which catches double counting.
- Also checked: the leg count, the image-in-layer facts, and both uniqueness lemmas on every pair `(B, A)` with a one-point
  difference.
- Rows, each with its rank written textually:

| Row | `p*` | Coverage |
|---|---|---|
| `m = 1` | `(16·1+4)/3 = 6` | EXHAUSTIVE: all 1,792 sector sources (= `R_5 = 2^5·C(8,5)`), all 8,484 sets of `I_6`, 12,544 erase pairs, 2,072 one-point switch pairs (including the 1,792 switches at `s`, which correctly get 0) |
| `m = 2` | `12` | 300 sampled sources |
| `m = 5` | `28` | 60 |
| `m = 107` (endpoint) | `572` | 12 |
| `m = 158` (fresh) | `844` | 6 |
| `m = 161` (structural) | `860` | 6 |
| `m = 164` (fresh) | `876` | 6 |

- Half of the samples are biased toward `β_i = 1` chokes, so switch arcs are exercised, including the `(1,0)` states that must
  get 0.
- Result: 0 failures (`out_bridge_check.log`).
- This is bounded: it tests the literal meaning of the frozen texts and proves nothing universal. The universal statements rest on
  the kernel, instruments (I) and (II).

Fidelity (SEMANTIC-CONTRACT §1):
- N3 touches none of the active-tag weight, `F_{p*}`, `x` or (WID). No numeric claim in the return depends on them, so nothing
  downstream is struck for fidelity.
- The relation used is the carried `transportRel` (entry 19): the literal (D) ∪ (S), read in the Lean source of record.

## Attacks and findings

**F1. Did the return close the FROZEN node, or a copy? It closed a copy, and the critic binding now closes the frozen node.**
- T2's five theorems live in module `LeanProof.T2`. They refer to T2's own `cb8GSec` constant, not the frozen
  `Statements.cb8GSec`. They were elaborated in a different context: no `E1FlowConstruction` import and no `open Polynomial`.
- Byte for byte, the five statement texts and the `cb8GSec` definition text are identical to the frozen file (`instr/stmt_diff.py`:
  `ALL5_IDENTICAL True`, `cb8GSec def IDENTICAL`, the same `open Classical in` scoping). Even so, under gate ruling 23 a proof
  attached to a duplicate constant does not by itself discharge the frozen declaration. The return says so itself (Remaining
  obligation 1).
- **Critic-derived advance (C-T2-U):** instrument (II) performs that binding.
  - With the frozen file's bytes unchanged apart from the five bodies and one inserted helper block, all five frozen N3 declarations
    compile sorry-free on the Cycle 4 base with the three standard axioms.
  - The helpers do not clash with the full base, including `C3LA1`.
- `FROZEN_NODES_CLOSED: N3` is therefore backed. Its backing is the critic's binding, not the return's standalone module. The
  binding is mechanical and needed no proof edits.

**F2. The two generic lemmas (attack brief).**
- `eq_erase_of_sdiff_singleton`:
  - Hypotheses: `B.card = p+1`, `A.card = p`, `x ∈ B`, `B \ A = {x}`. Conclusion: `A = B.erase x`.
  - This is true: `B \ {x} ⊆ A` and the cardinalities are equal.
  - `hx` is derivable from `heq`, so it is redundant but harmless. The direction `B \ A` is correct for deletions.
- `eq_switch_of_sdiff_singleton`:
  - Hypotheses: `A.card = p`, `A` independent, `u ∉ B`, `|N(u) ∩ B| = 2`, `A \ B = {u}`. Conclusion:
    `A = insert u (B \ N(u))`.
  - This is true. `A ∩ B ⊆ B \ N(u)` follows from independence of `A ∋ u`. Both sides have cardinality `p − 1`: this uses
    `|N(u) ∩ B| = 2`, which is necessary, since with `< 2` the inclusion is strict. The direction `A \ B` is correct for switches.
  - `A ⊆`-type uses are correct. No hypothesis encodes the conclusion.
- Both lemmas are actually used: in `sdiff_singleton_sum` / `sdiff_singleton_sum'`, and in `hred`, which proves by contraposition
  that the `transportRel` wrapper in `cb8GSec` is redundant on `I_{p*}`.
- `#print axioms` on each: standard three. Instrument (III) checked both on 12,544 + 2,072 exhaustive pairs at `m = 1` and on
  every sampled pair at the class rows.

**F3. `cb8GSec_out_ge_one` against C1-LA1's Out conclusion.**
- `#check` shows conjunct (ii) of `cb8_sectorTemplate_nonneg_out_in_switch` is
  `∀ c : Fin m → State8, Σ_i (β+γ) = (16m+1)/3 → 1 ≤ Σ_i cb8Out m (c i)`.
- There is no restriction on `β` or `γ` beyond `State8` (`β + γ ≤ 8`). `chokeState m B hsec` is exactly such a `c`, and
  `chokeState` is built with the `≤ 8` proof from `chokeBeta_add_chokeGamma_le`.
- The leg-total hypothesis comes from `cb8_sector_legCount` plus `|B| = p*+1`, via `omega`. The identity
  `(16m+4)/3 − 1 = (16m+1)/3` holds for every `m`, since `16m+4 = (16m+1)+3`.
- Carried entry 105 in the base (`lemma …cb8_sectorTemplate_nonneg_out_in_switch`) is byte-identical to the governed C1-LA1
  snippet `0027-lemma-…nonneg_out_in_switch.lean.fragment`. The snippet's SHA-256 `0a376ba5…2f6a` equals the entry header digest
  in the governed `Main.lean`.
- Out is used UNSCALED, as `cb8GSec` is frozen. Scaling belongs to N7, not N3.

**F4. ℕ-subtraction and hidden hypotheses.**
- No ℕ subtraction appears on any N3 face. `(8:ℚ) − …` terms belong to `cb8In` and are not used.
- The class hypotheses `107 ≤ m`, `m % 3 = 2` enter only through C1-LA1, in nonneg and Out ≥ 1. `arcImages`, `legCount` (`0 < m`)
  and `out_eq` carry no class hypothesis, which matches the frozen text.
- There is no `sorry`, `admit`, `native_decide` or enumeration anywhere.

**F5. Semantic adequacy of the frozen N3 (a U-orientation check, not a defect).** Instrument (III) confirms three things on the
literal network:
- The only literal arcs out of a sector source are the `|B|` deletions, the switch at `s` (always present, since `N(s) = {r, v}`),
  and the switches at chokes with `β_i = 1`. Supports and leaves never have two neighbours in `B`.
- The frozen `cb8GSec` assigns `pb`/`pc` to the `b`/`c` deletions at the source state and `σ(γ)` to the `(1, γ≥1)` switches. It
  assigns 0 to the `r`/`v` deletions, the `s`-switch and `(1,0)` switches.
- The resulting row sum is exactly `Σ_i Out(β_i, γ_i)`.

So N3 says what the synthesis needs for the sector Out half.

**F6. Process disclosure.** The one `pgrep -f` is a rule violation under common-brief item 13. It was disclosed in the return, not
repeated, and has no evidentiary bearing: no claim rests on a process listing. It is recorded, not struck.

## Mechanism-equivalence and fence check

- **Mechanism.** A literal-label Out bridge: an arc-label uniqueness sum over the frozen `g_sec`, composed with the governed C1-LA1
  template. This is not one of the refuted mechanisms (SOLUTION-CONTRACT §3.6): no compression lemma, no `m`-independent per-choke
  certificate, no forest real-rootedness, no CHAR.
- **Fence 1.** One rank `p*` and the class only. `out_eq`, `legCount` and `arcImages` are rank-pinned at `p*`, and `m` is free,
  exactly as frozen (ruling 24(6)). Nothing is claimed at other ranks.
- **Fences 3 and 4.** No Newton or Darroch. No `θ*` law as a hypothesis. The per-state allocation reaches the literal network
  through a PROVED bridge (`cb8GSec_out_eq`, kernel-checked), which is exactly what fence 4 asks for on the Out side.
- **Fence 7 (census discipline).** The return cites the frozen-statement census as non-vacuity only, and that is appropriate. My
  own bounded check is labelled bounded.
- **Status transfer.** None. No status passes to (HALL), the aggregate or any `E993-` key.
- **Keys.** The return's citation of `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` "via the carried `activeWeight`/`transportRel`
  definitions" is over-broad. `activeWeight` occurs 0 times in `T2.lean` and in the N3 statements. Only `transportRel` is used.
  This is harmless because nothing is claimed about the key.
- **Attribution.** The draft inputs (C-T3-U, Cycle 2 U2) are named on the face.

## Certification audit

- **Backed literals:**
  - The Stage 2 seal, the frozen and base digests, the Mathlib pin, the five draft-input file digests, and the `T2.lean` digest.
  - "Build completed successfully (8657 jobs)".
  - The axiom output for all five declarations.
  - "sorry-free, standard axioms only". This is backed for T2's module and, through the critic binding, for the frozen
    declarations.
  - "(16m+4)/3 − 1 = (16m+1)/3 for every m".
- **STRUCK:** "the frozen statements' own non-vacuity census (5,547+ checks, 0 failures …)". The `C4-FROZEN-STATEMENTS.md` check
  summary contains no 5,547 total. Its N3 rows sum to 16,528 checks (1,816 × 4 + 12 + 12 + 9,240). The citation stands without the
  number.
- **STRUCK:** the `T2.lean` header claim that `no_choke_of_root_mem` and `choke_neighborFinset_inter_card` are "reproduced here
  byte-identically" from `CriticAdvance.lean` "lines 36-42, 101-131".
  - `no_choke_of_root_mem` is verbatim, but sits at line 230.
  - `choke_neighborFinset_inter_card`, at line 295, is NOT byte-identical: its statement is restated through `chokeBeta`, with an
    added `unfold chokeBeta`, and binders are renamed `this → hv`.
  - These lemmas are draft text either way, never a carry. The strike affects provenance only, not the result.
- **STRUCK:** the `T2.lean` header claim that `cb8GSec` is a copy of frozen "lines 257-269". The frozen definition is at lines
  125–137. The byte-identity of the text is confirmed.
- **NARROWED wording:** "two independent instruments". `lake build` and `lake env lean` + `#print axioms` share one elaborator and
  kernel. The axiom trace is a distinct check that detects `sorryAx`, but it is not an independent instrument. My fresh rebuild,
  the binding and the literal-network check supply the independent sides.
- **Admission defect `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN` (T2), adjudicated: no strike.** All three occurrences (lines 56,
  185, 207) either cite the governed award C1-LA1 or say the route does NOT use the label. None labels T2's scratch. The admission
  exception `BAD_HEADLINE_FLAG` is format only, and the value `no` is unambiguous.
- **Grades.** The return grades its declarations `compiled` scratch, ungraded until a governed award closes, which follows
  SOLUTION-CONTRACT §4. I confirm this; nothing is upgraded.

## Verdict

The route's claim is that the five frozen N3 declarations compile sorry-free with standard axioms. That claim is retained:
- It was re-derived with a fresh kernel build.
- The critic binding (F1) shows the proofs attach unchanged to the FROZEN declarations in the frozen file context.
- The literal-network check found 0 failures, exhaustive at `m = 1` and sampled at 107, 158, 161 and 164.

The struck literals are provenance and census-count wording. None of them carries the result.

N3 (the sector Out half) is a sound Stage 7 candidate under ruling 31, with terminals equal to the frozen N3 texts. Its
mathematics is complete at `proved_informal` and compiled in scratch. It gets no grade until a governed award closes.

verdict: retained
headline_resolved: no

- `COND4_formal: false`
- `E1_formal: false`
- `TERMINAL_integration: false`
- `cut_candidate: none`
- `FROZEN_NODES_CLOSED: N3`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Governed award for N3.** A Stage 7 formalizer must re-author T2's helper block and the five bodies under the governed
   workflow, with receipts. The terminals are the frozen N3 texts, byte for byte. C1-LA1 entry 105 is carried receipt-bound from
   the governed snippet 0027, not from the base copy (ruling 19). The critic binding (`StatementsBound.lean`, `8c9828eb…789a`)
   shows this needs no statement or proof change; only the helper block has to be placed ahead of the frozen `cb8GSec`.
2. **Reuse for N4/N5.** On the In side (`cb8GSec_in_eq`), the generic `sdiff_singleton_sum` form must be recast over PREIMAGES,
   i.e. sums over `B ∈ I_{p*+1}` for fixed `A`. The uniqueness lemmas `eq_erase_of_sdiff_singleton` and
   `eq_switch_of_sdiff_singleton` apply as stated, with the roles of the layers unchanged. The preimage count is new work: a
   deletion preimage is `insert x A` for `x ∉ A` with `insert x A` independent; a switch preimage is determined by `u` and the
   two re-inserted neighbours. The Out-side sums do not transfer verbatim.
3. Nothing else in N3 is open. N1, N2 and N4–N8 are outside this route.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T2-U/`.

| File | SHA-256 |
|---|---|
| `instr/stmt_diff.py` (frozen vs T2 byte compare) | `4bd04520ac38977dc38419f4d7382e9068f056dcb122c88d964023e294d8f47e` |
| `instr/bind.py` (binding to frozen text; reverse check) | `af78e542967da34fa0206101db55b7e4e2d1060027554f656f857515f095c753` |
| `instr/out_bridge_check.py` (literal-network symbolic check) | `629e2513cca04bd7307e3ecc19f74fc6916053b24a70209c68529edb319e1e46` |
| `instr/AxT2.lean` | `cd0dbcd24a17e854254c8c91b957d9c1f6f160d7dc41ad0148d9d09c5b2b25a0` |
| `instr/AxBound.lean` | `db84537edda273569818e7044404b4ca70e38368aaaff17213a42aa34367a36f` |
| `instr/CoImport.lean` | `5989a72b5bc1b24a6768234f6dd0ab7debfa9e6ca0212593f9a4f42e57dbf5b4` |
| `LeanProject/LeanProof/StatementsBound.lean` (critic binding) | `8c9828eb0f6459cc39bf8f128518d60f7e1e8aeb2ab25849fdc8c10a83a5789a` |
| `LeanProject/LeanProof/T2.lean` (copy-out of the seat file) | `a2eeaf65929dd5189b2c5c51ad80363ee9d409e1a335e95434b5611cc86ba6f0` |
| `out_bridge_check.log` | `56fd4f011ec1f729f9fafa4a5d3731ebf49ce7c95ffd37f9ac962d0a4319bba5` |
| `axioms-t2.log` | `6f34ae5c79f0714d28dd277f8d86a08527a74fc3da367769d31f048741228ce1` |
| `axioms-bound.log` | `9d2d25e6375c5fcc74dfef68e5bf6b5481e28ae5c90ac5a1e339f6a8de004462` |
| `coimport.log` | `ee5e5ac95c9bea240fa5400727c9da645bfc5d5d61cb3a629b4a6894163a0d5c` |
| `build-base.log` | `ae814954374cf60afbd9277a8cab39c37906fa5a5117a715e8752e95c010c8ad` |
| `build-t2-fresh.log` | `1f293c7441d42cb53f7374226aaadef812c7ebacdeb31fd95163d63f88c1da44` |
| `build-bound.log` | `72f47f511f15bd736f83374c94e5797f236b7f3e8ba1f169318034ac85a00f01` |

`copyout/` holds verbatim copies of T2's `work/` logs, `T2.lean`, `LeanProof.lean`, `replay.sh` and `AxiomCheck.lean`.

**Read-boundary and process disclosures.**
- I read `control/C4-FROZEN-STATEMENTS.lean` and `.md`. They are not in the capsule list, but the protocol names them as Stage 2
  members a critic may read.
- I listed and copied the controller base cache `scratchpad/c4-base/LeanProject/.lake/build`, per the attack brief and
  CF-C4-S3-1.
- I listed `scratchpad/c4-T2-replay/` and copied `replay.sh` and `AxiomCheck.lean` from it. The directory is outside
  `scratchpad/c4-T2/`, but the return inventories it.
- I ran a `grep -r` / recursive glob rooted at `sources/c1-results/…` and `sources/c3-scratch-lean`, `sources/c2-stage7-sources`.
  These are inside the grant.
- I read `sources/mathlib-binding/PIN.json` and ran `git rev-parse HEAD` in the shared Mathlib checkout, which is an allowed
  external root.
- Nothing else was read. There was no network and no install; Python was standard library only.
- No `lake update` or `lake clean`. Every `lake`/`lean` call ran after `cd` into my pinned project.
- No background job was started, so there was nothing to kill.
