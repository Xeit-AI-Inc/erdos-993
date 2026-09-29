# Critique

Critic `C-T1-U` (orientation U, formal / structural), r31 Cycle 3 Stage 4. The assigned return is T1, route `C3-T-01`, mechanism
`E1-CLONE-QUOTIENT-IN-BALANCE`, orientation T. Written 2026-09-28, about 06:08–06:20 EDT by the clock.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Those two files are the only subsystems I loaded. I did not follow
the task-type map into memory, logs, skills, decisions, operations or conversations. The controller owns conversation logging, and
I wrote no conversation log.

**Dispatch.** `control/dispatch/c3-stage4/DISPATCH-C-T1-U.md` SHA-256 `bb0ac7b65b3afd8fcf5ff13bd39bedeb1e6888f2501a744dc5540c8f5b0e8f77`
matches the value I was given. I checked it before reading the file.

**Read-boundary disclosures.**
1. Before my first tool call, the harness put the project `CLAUDE.md`, the user memory index and the user's e-mail into my
   context. I did not open or use them.
2. `control/C3-CRITIC-ATTACK-BRIEFS.md` is a capsule member. I displayed it whole with `cat`, so the other seats' sections were shown
   along with the T1 section. The protocol says to read only your own section. I used only the T1 section.
3. In two early shell calls, an `echo =====` separator caused a zsh `=`-expansion error. The effect was cosmetic, and I re-displayed
   the affected files.
4. I ran `grep -rn` inside the pinned Mathlib package directory
   (`~/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib/Mathlib`) to find API names
   (`card_eq_sum_card_fiberwise`, `subtypeProdEquivProd`, `card_piFinset`, `card_finset_len`). The protocol allows reading Mathlib
   for API meaning.
5. I listed or ran `shasum` only on return-inventoried locations: non-recursive `ls -la` of `scratchpad/c3-T1/`, its `LeanProject/`
   and `.lake/`, and a `shasum` glob over `scratchpad/c3-T1-replay/*`. That directory is inventoried by the return but sits outside
   `scratchpad/c3-T1/`. The glob showed one file the return does not inventory, `replay_stdout.txt`, whose bytes equal the inventoried
   output. I `diff`ed `lean-toolchain` and `lake-manifest.json` against the pinned shared project, which is an allowed root.
6. Beyond the capsule, I read these files under `sources/` (authorized, each digest-checked first):
   `sources/c2-results/SOURCE-DIGESTS.json`, `sources/c2-results/second-reads/SR-C2-2/SECOND-READ.md` and
   `sources/mathlib-binding/PIN.json`.
7. I made no network calls, installed nothing, ran no `lake update` or `lake clean`, and used no child agents and no `/tmp`. I read no
   sibling return, critique or adjudication. Every `lake`/`lean` run was in the foreground from inside my copied project. I started
   no background job, so none was running at the final write and nothing was killed.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| **Capsule seal** `control/c3-critic-capsules/T1-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON minus `seal_sha256`, separators `(",", ":")`, no trailing newline) | **`3bcd2adf345c2dd941bb4596248c24dc3cc255e57dd5ede94e5da533cae1b4d6`** | MATCH (field and dispatch value) |
| Capsule members (14 files) | SHA-256 and byte count of each | 14/14 MATCH |
| Stage 4 dispatch manifest seal | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | MATCH (field) |
| Stage 3 packet manifest seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | MATCH (field) |
| Stage 2 packet manifest seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | MATCH (protocol value) |
| `sources/c2-results/SOURCE-DIGESTS.json` → Stage 2 manifest | `96cd5ec4…cbf80` | MATCH |
| `SR-C2-2/SECOND-READ.md` → Stage 2 manifest and c2-results digests | `38eaf2a7…4383d` | MATCH (both) |
| The return's 8 inventoried artifacts (`lakefile.toml`, `CloneQuotient.lean`, `Check.lean`, `axiom-check.out.txt`, `t1_corroborate.py`/`.out.json`, the replay pair) | SHA-256 | 8/8 MATCH the return's table |
| T1's `lean-toolchain` / `lake-manifest.json` against the pinned shared project and `PIN.json` | `diff` | identical; Mathlib rev `905b9581…a5e96c` |

The return lists and checks the Stage 2 seal. It does not list the Stage 3 or Stage 4 seals, which it could not have known.
Route ID `C3-T-01` and token `E1-CLONE-QUOTIENT-IN-BALANCE` both appear verbatim, matching `C3-ALLOCATION.md`.

## Independent re-derivation

**Objects of record.** The objects of record are SR-C2-2 D2 and D4–D6, which are digest-verified sources:
- `S_α = N_q(α, j)` and `T_α = N_q(α, j−1)`, with `N_q(α, k) = C(a, α)·C(b, k−α)·2^{k−α}` in the INTEGER convention
  (`C(b, negative) = 0`), `a = 8q − 1`, `b = 8(m − q) + 1` and `j = p* − q`.
- `g_α = ρ_q·Tc_{α−1} − Sc_{α−1}` and `h_α = Sc_α − ρ_q·Tc_{α−1}`.
- In-balance: `h_α + g_{α+1} = ρ_q·T_α`.
- Double counts: `S_{α+1}(α+1) = T_α(a−α)` and `S_α·(j−α) = 2T_α(b−(j−1−α))`.

**Derived by hand from the contract.** An `r`-free `B` with choke set exactly `Q` has `v` inactive, because `W_v = {r}`. A leaf
`c_ij` is active iff `u_i ∈ B`, because `W_{c_ij} = {u_i}`. At `i ∈ Q` the supports are excluded and the leaves are free, which gives
`8q` Boolean coordinates, or `8q − 1` once the mark `x` is fixed. At `i ∉ Q` each leg is `{∅, b, c}`, and the arm is `{∅, s, v}`. That
gives `8(m−q) + 1` ternary coordinates. So `a` and `b` agree with `a_q`, `b_q` of SEMANTIC-CONTRACT §2, and the rank/type map is
`(|B| − q − 1, w − 1)`.

**Index check against the allocation's text.**
- T1's `boolean_double_count` is `S_{α'+1}(α'+1) = T_{α'}(a−α')`.
- `ternary_double_count` is `S_{α'}·(j−α') = 2T_{α'}(b−(j−1−α'))`.
- `in_balance` is `h_{α'} + g_{α'+1} = ρ·T_{α'}`, with `prefixSum f α = Σ_{i<α} f i`. This gives `g` equal to SR-C2-2's `g_α` and `h`
  equal to SR-C2-2's `h_α` exactly: `Sc_α = prefixSum S (α+1)` and `Tc_{α−1} = prefixSum T α`.
- The right-hand side `ρ·T_α` is SR-C2-2's.

The indexing (`α` vs `α'`) is faithful. The exponents `a`, `b` are left abstract (not bound to `q`), which the allocation's
"stand-alone" allows.

**Critic instrument** (`crit_t1u.py`: standard library, exact integers and `Fraction`, my own code). Payload
`4947130889350853b17961e152664e281c4844b03090685d85366c1e141a8987`; runtime 18 s.
1. **Abstract fiber by brute force.** For `a ≤ 4`, `b ≤ 3`, every `k ≤ a+b+2` and `α ≤ a+2`, I enumerated
   `(Fin a → Bool) × (Fin b → Fin 3)` (690 cells).
   - Against the integer-convention `N`: 0 failures.
   - Against T1's Lean `N` (truncated ℕ subtraction, `C(b, k ∸ α)·2^{k ∸ α}`): **80 failures, exactly the cells with `k < α ≤ a`**.
2. **Literal D2 on small trees.** I built the literal `CB(d, m)` for `(d, m) ∈ {(2,2), (3,2), (2,3), (8,1), (3,3), (4,2)}` and
   enumerated all independent sets, up to 167,991 per tree. The weight was computed from the literal witness sets. For every `Q`,
   every rank and every type, the number of `r`-free `B` with choke set `Q` containing the mark equals `N_int(a, b, |B|−q−1, α)`:
   972 checks, 0 failures.
3. **Class rows `m = 107, 125, 128, 140` at `p*`, every `q ∈ [1, m]`, every `α ∈ [0, a]`.** 254,232 checks, 0 failures, covering:
   - both double counts (for `α < j`);
   - the in-balance with `ρ_q = r_q(j)/r_q(j−1)`;
   - `g_α, h_α ≥ 0`;
   - `g_0 = g_{a+1} = 0`;
   - `r_q` computed two ways at `q ∈ {1, m}`.
4. **Consequence of the junk value.** With T1's Lean `N`, `Σ_{β≤a} N(a, b, j−1, β) ≠ r_q(j−1)` at every `q` with `a ≥ j`:
   - `m = 107`: `q ∈ [64, 107]` (44 values);
   - `m = 125`: `q ∈ [75, 125]` (51 values);
   - `m = 128`: `q ∈ [77, 128]` (52 values);
   - `m = 140`: `q ∈ [84, 140]` (57 values).

**Replays** (copy-out-first into `scratchpad/c3-crit-T1-U/`).
- `lake build CloneQuotient` gives `Build completed successfully (8656 jobs)`, with one `sorry` warning at `CloneQuotient.lean:37:8`.
- `lake env lean Check.lean` produces output byte-identical to T1's `axiom-check.out.txt` (`4db365c7…`).
- `t1_corroborate.py` produces output byte-identical to the return's (`20ec5278…`; payload `43d2016a…`).

## Attacks and findings

**A1 (strongest; kernel-checked). T1's node (a) `clone_fiber_card` is FALSE as stated.**
- T1's `N a b k α := a.choose α * (b.choose (k - α) * 2 ^ (k - α))` uses truncated ℕ subtraction. For `k < α ≤ a` it evaluates to
  `C(a, α) ≠ 0`.
- The fiber is empty there, because `#true = α` and `#true + #nonzero = k < α` cannot both hold.
- I proved `E993R31.CritT1U.clone_fiber_card_statement_false` in Lean: the universally quantified statement, byte-for-byte T1's
  body, fails at `(a, b, k, α) = (1, 0, 0, 1)`.
- The brute force (instrument 1) shows the failure set is exactly `{k < α ≤ a}`.
- Consequences:
  - the return's remaining obligation 1 ("combine … to reach the graph-free statement `clone_fiber_card` already states") cannot
    be discharged as written;
  - `sorry` was hiding a false statement, not an unproved true one.

**A2. T1's `N` is not SR-C2-2's `N_q` outside `α ≤ k`.**
- The docstring says `N` "is `S_α` at `k = j` and `T_α` at `k = j − 1` in SR-C2-2 (`N_q(α, k)` there)". That holds only for
  `α ≤ k` or `α > a`.
- The return's "Casts" paragraph says nothing is subtracted before it is known to be nonnegative. `k − α` inside `N` is exactly
  such a subtraction.
- Node (b) is unaffected. Both double counts carry `α < j`, so every `N` they mention has `α ≤ k`.
- `in_balance_clone` is a true identity for every `α`. It is SR-C2-2's in-balance for `α ≤ j − 1`, which covers every target type
  that exists.
- The defect bites any successor that sums `N` over `α ∈ [0, a]`:
  - the totals `Σ_α S_α = r_q(j)` and `Σ_α T_α = r_q(j−1)`, which D6's path closure `g_{a+1} = 0` needs, FAIL with T1's `N` at 44
    of the 107 `q` at `m = 107` (instrument 4);
  - they also fail at the fresh rows 125, 128 and 140.
- T1's own Python `N` returns 0 for `t < 0`, which is the integer convention. The corroboration instrument therefore does not model
  the Lean object at `α > k`. That is why the grid and the mutation control could not see A1 or A2. T1 also never checked node (a)
  numerically.

**A3. Node (b) is correct, universal and sorry-free, but its formal content is thin.**
- The two double counts are one application each of `Nat.choose_succ_right_eq` plus `omega` bookkeeping. I re-read both proofs,
  and the hypothesis `α < j` enters exactly at the `j − (α+1) = (j−1) − α` and `ℓ' + 1 = ℓ` realignments.
- `in_balance` is pure telescoping, valid for every `S, T, ρ`. The return says this plainly.
- No hypothesis encodes a conclusion. There is no `sorry`, `admit` or `native_decide` in node (b). `#print axioms` shows only
  `propext`, `Quot.sound` and `Classical.choice` (replayed).
- The load-bearing step of D6's "Columns" is the reduction of a target clone's inflow to `(g_{α+1} + h_α)/T_α`. It was not
  formalized by T1; see A5.

**A4. Scope and hypotheses.**
- Node (b) has no residue class, no `m = 107` endpoint, no `M_0`, no asymptotics, and no Darroch/Newton.
- The binding `a = 8q − 1`, `b = 8(m−q) + 1` is absent from Lean. When it is added, it brings the ℕ guard `q ≥ 1`.
- The well-definedness `r_q(j−1) > 0` (SR-C2-2 D3) is also absent. It is needed for `ρ_q` but not for any T1 declaration, since
  `ρ` is a free parameter.
- These are statement-level facts for the successor, not defects of T1.

**A5 (critic-derived advance, attributed to critic C-T1-U; compiled scratch, no grade).** File `CriticT1U.lean`:
- `card_supp_eq`: for finite `ι`, `β` and base point `z`, `#{f : ι → β | #supp_z f = t} = C(|ι|, t)·(|β| − 1)^t`. The proof splits
  by fibers over `powersetCard t univ` and identifies each fiber with a `piFinset`.
- `clone_fiber_card_of_le` is **T1's node (a), repaired with the guard `α ≤ k` and PROVED**. Its statement is T1's body verbatim,
  over T1's own `N`, which is imported from `CloneQuotient`.
- `clone_fiber_card_guarded` holds for every `(a, b, k, α)`. Its right-hand side is `if α ≤ k then N a b k α else 0`, which is the
  integer-convention object.
- `clone_fiber_card_statement_false` is A1.

File `CriticT1UColumn.lean`:
- `column_inflow_clone` is D6 "Columns" at clone level, in the non-degenerate case `S_{α+1}, S_α > 0`, `α < j`:
  `(a−α)·g_{α+1}/((α+1)S_{α+1}) + 2(b−ℓ')·h_α/((j−α)S_α) = ρ`. It is derived from T1's `boolean_double_count`,
  `ternary_double_count` and `in_balance` with `linear_combination`.
- `rows_identity` (`g_α + h_α = S_α`) and `g_zero`.

All seven compile against the pinned Mathlib with axioms `[propext, Classical.choice, Quot.sound]`. There is no `sorryAx` and no
`sorry`/`admit`/`native_decide` in either file.

A structural remark follows from `column_inflow_clone`. In the non-degenerate case the column equals `ρ` for ANY `ρ`. The specific
`ρ_q = r_q(j)/r_q(j−1)` enters the E1 flow only through nonnegativity ((ii-1)/(ii-2)), the degenerate path closure `g_{a+1} = 0`
(which needs the guarded totals of A2), and capacity (condition (i)).

## Mechanism-equivalence and fence check

- **Fences.**
  - One rank and the class only: nothing in T1 or in my advance mentions `m`, `p*` or the residue.
  - No refuted mechanism is revived. This is the criterion key's registered clone transport. It is not (G′) (ruling 20), not the
    compression lemma, and not an `m`-independent per-choke certificate.
  - No status transfer. No census value is used as proof. The `θ*` law and r30's bounded record are not used.
- **Claim identity.**
  - The key touched is `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`,
    unchanged). The notation source is the heterogeneous criterion key.
  - No `E993-R31-` candidate is proposed by T1 or by me. SR-C2-2 finding 5 records that a new key would alias the criterion key,
    and I agree.
  - T1's lexical alias hit `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` is a different mechanism. I accept T1's reading on its
    description; I did not re-open the registry, because it is not a capsule member.
- **Carries (gate ruling 19).** T1 carries nothing: its namespace is `E993R31.CloneQuotient`, and it uses no `cbGraph` or network
  definition. Nothing needs byte-comparison. A successor that wires these lemmas to the carried network must carry the governed
  definitions and bind `a`, `b` and `ρ_q`.
- **Fidelity (protocol duty 2).** Active-tag weight, (D) ∪ (S), `F_{p*}`, `x` and (WID) are not objects of this route. Neither T1
  nor I built a network. The literal active-tag weight enters only my D2 test (instrument 2), where it is computed from the witness
  sets `W_v = {r}` and `W_{c_ij} = {u_i}`.

## Certification audit

| Literal on the return's face | Evidence | Ruling |
|---|---|---|
| "`Build completed successfully (8656 jobs)`", one `sorry` at line 37 | my rebuild | BACKED |
| `#print axioms` output for the four node-(b) declarations | byte-identical replay | BACKED |
| node (b) "sorry-free", "strictly universal … for all `a, b, j, α` with `α < j`"; `in_balance` "for all `S, T, ρ`" | proof reading and replay | BACKED |
| `clone_fiber_card` "states the abstract cardinality claim … the rank-`k`, type-`α` fiber … has exactly `N a b k α` elements" | kernel-checked refutation (A1) | **STRUCK**: false as stated. The repaired statement (guard `α ≤ k`) is proved by this critic |
| docstring: `N` "is `S_α` at `k = j` and `T_α` at `k = j − 1` in SR-C2-2 (`N_q(α, k)` there)" | A2 | **NARROWED** to `α ≤ k` (or `α > a`) |
| "Casts … nothing here is subtracted before being known nonnegative" | `k − α` in `N` | **STRUCK** |
| Remaining obligation 1, "reach the graph-free statement `clone_fiber_card` already states" | A1 | **STRUCK**: the target is unprovable; superseded by `clone_fiber_card_of_le` |
| Corroboration counts (5,886 / 5,886 / 599; mutation 300 of 475) and payload `43d2016a…` | byte-identical replay | BACKED as `bounded_computation`, with the caveat that the instrument's `N` is the integer convention, not the Lean `N` (A2) |
| the 8 artifact digests | recomputed | BACKED |
| `E1_formal: advanced` | node (b) | BACKED narrowly: stand-alone clone-level identities, not bound to `cbGraph m` or to a flow definition |
| grades: compiled scratch, no grade; the criterion key unchanged | SOLUTION-CONTRACT §4 | BACKED |

## Verdict

verdict: retained_narrowed
headline_resolved: no

```
COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none
```

What is retained:
- Node (b): `boolean_double_count`, `ternary_double_count`, `in_balance` and `in_balance_clone`. They are correct, sorry-free and
  faithful to SR-C2-2 D4/D5 in the indexing the allocation names. The in-balance instance is faithful for `α ≤ j − 1`, which covers
  every target type that occurs.

What is narrowed or struck:
- `clone_fiber_card` is struck as false. It is replaced by the critic's proved `clone_fiber_card_of_le` and
  `clone_fiber_card_guarded`.
- T1's `N` is identified with `N_q` only for `α ≤ k`.
- Three certification literals are struck or narrowed, as tabled above.

`E1_formal: advanced` reflects T1's node (b) and this critic's A5 (node (a) at the abstract level; clone-level Columns, non-degenerate
case; Rows). All of these are compiled scratch with no grade. Nothing here is bound to `cbGraph m`, so conjunct 4 and the terminal
are untouched. No cut, template failure or refutation of any mathematical claim of record was found. The only falsity is in T1's own
Lean statement of node (a). The mathematics of the in-balance and the double counts is complete at `proved_informal` for the clone
product. It is also kernel-checked in scratch for the stand-alone statements. Grading is for the Stage 7 award, not this critique.

## Remaining obligation

1. **Adopt the guarded object.** Any successor award must use an `N` that is 0 for `α > k`, for example `if α ≤ k then … else 0`.
   The alternative is to carry `α ≤ k` on every use. Otherwise the totals `Σ_{α≤a} S_α = r_q(j)` and `Σ_{α≤a} T_α = r_q(j−1)` are
   false in the class range (from `q = 64` at `m = 107`), and so is the path closure `g_{a+1} = 0` built on them. T1's node (b)
   statements are compatible with either choice, because each is guarded by `α < j`.
2. **Close the degenerate Columns cases and the path closure formally.** Remaining are `α = a` (which needs `g_{a+1} = 0`, hence the
   guarded totals and `ρ = r_q(j)/r_q(j−1)` with `r_q(j−1) > 0`) and `S_α = 0 < T_α`. The non-degenerate case is
   `column_inflow_clone`.
3. **The graph-level bijection.** This is D2 on literal `B ⊆ V(cbGraph m)`, with the choke set `Q`, the mark and the literal
   active-tag weight. It is outside T1's object and still open. Only its abstract cardinality (`clone_fiber_card_of_le`) is now
   compiled.
4. **Bind the parameters.** Bind `a = 8q − 1` (guard `q ≥ 1`), `b = 8(m − q) + 1` (guard `q ≤ m`), `j = p* − q` and `ρ_q`, and prove
   `r_q(p* − q − 1) > 0` (SR-C2-2 D3) at statement level.
5. **Nonnegativity** of `g_α` and `h_α` via (ii-1)/(ii-2) is T2's object, and it is still formally open as far as this capsule shows.
6. None of the above yields conjunct 4 without the sector flow, the E1/sector composition and the terminal (U1, U2, U3).

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T1-U/`.
Python 3 standard library only, `python3 -B`, run in the foreground. Lean runs used the pinned toolchain, and Mathlib was bound by a
manual symlink `.lake/packages` → the shared project's `.lake/packages`. I never copied packages and never ran `lake update` or
`lake clean`.

| Path (under scratch root) | SHA-256 | Role |
|---|---|---|
| `seals.py` | `c290d10285cf82edd1678234bfa96a312cec3f85de8662cbc8ee422516d65273` | capsule, stage seals and member digests |
| `crit_t1u.py` | `873420ca0d836dda448557d4531926c93b8a63ea91235e2645c41248a8df9fd0` | independent instrument (fiber brute force, literal D2, class rows, junk-`N` consequence) |
| `crit_t1u.out.txt` | `13d3ad568475d6583053716bb5a668967d9e5b505c4e913b9ff104a922aae386` | its output (payload `4947130889350853b17961e152664e281c4844b03090685d85366c1e141a8987`) |
| `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain, CloneQuotient.lean, Check.lean}` | copies of T1's (`CloneQuotient.lean` `0fe75753…`, `Check.lean` `094427b6…`) | copy-out-first rebuild |
| `replay-axioms.out.txt` | `4db365c7822db47aa7593c552826da383c5212349791e8dc0cb34d2141e488b8` | replayed `#print axioms` (= T1's) |
| `LeanProject/CriticT1U.lean` | `95e8cc1e86556d596a07b872a4877800c34d6f14139281b1e0129add9c3fabe1` | A1 refutation; `card_supp_eq`; node (a) repaired and proved |
| `LeanProject/CriticT1UColumn.lean` | `beae6a8d3b934cdbfae6ba01b5facb658832a0fdfc57d0b1ca907f63d4984e58` | `column_inflow_clone`, `rows_identity`, `g_zero` |
| `critic-lean-nodeA.out.txt` | `ef30d54ce399cb7f30ac22ed2c83c8d09325848ac31ed662b0baecff0ecff5e5` | `lake env lean CriticT1U.lean` (axioms of four declarations; no `sorryAx`) |
| `critic-lean-column.out.txt` | `47284c336cbfcc24ac723a0911bf572b35a06b7f5c570cb5a86b3a76605e5ca7` | `lake env lean CriticT1UColumn.lean` (axioms of three declarations; no `sorryAx`) |
| `replay/t1_corroborate.py`, `replay/t1_corroborate.out.json`, `replay/replay_stdout.txt` | `9e1fbb79…`, `20ec5278…`, `20ec5278…` | copy-out-first replay of T1's generator (byte-identical output) |

To replay, from `…/scratchpad/c3-crit-T1-U/LeanProject`, run:
`lake build CloneQuotient && lake env lean Check.lean && lake env lean CriticT1U.lean && lake env lean CriticT1UColumn.lean`.
From `…/scratchpad/c3-crit-T1-U`, run `python3 -B crit_t1u.py`.

I edited no sealed member. I wrote nothing outside my scratch root and this file. No background job was started, so none was running
at the final write. I reread this file before close.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
