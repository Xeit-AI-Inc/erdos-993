# Critique

Critic `C-T1-F`, r31 Cycle 3 Stage 4 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`). This is a cross-orientation critique from
orientation F (falsify) of seat `T1`, route `C3-T-01`, mechanism token `E1-CLONE-QUOTIENT-IN-BALANCE`, orientation T (prove). Written
2026-09-28, about 06:08–06:25 EDT by the clock.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. Subsystems loaded:
those two files only. I did not follow the task-type map into memory, logs, skills, decisions, operations or conversations. The
controller owns conversation logging for this run, and I wrote no conversation log.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c3-stage4/DISPATCH-C-T1-F.md` (file SHA-256) | `8faed70a15ef785454d8080d622efa7dd036ff9d047336fc5ad2256c2a94a282` | MATCH, verified before I read it |
| **Capsule seal** `control/c3-critic-capsules/T1-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON minus `seal_sha256`, separators `(",", ":")`, no trailing newline) | **`3bcd2adf345c2dd941bb4596248c24dc3cc255e57dd5ede94e5da533cae1b4d6`** | MATCH (manifest field and dispatch value) |
| Capsule members (14 files) | each SHA-256 and byte count recomputed | 14/14 MATCH |
| Stage 4 dispatch manifest `control/C3-STAGE4-DISPATCH-MANIFEST.json` inner seal | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` | MATCH |
| Stage 3 packet manifest `control/C3-STAGE3-PACKET-MANIFEST.json` inner seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | MATCH. The T1 return's file digest `6c18dd02…c84` matches both the Stage 3 and the capsule entries |
| Stage 2 packet manifest `control/C3-STAGE2-PACKET-MANIFEST.json` inner seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | MATCH (protocol value) |
| `control/C3-WORKER-COMMON-BRIEF.md`, `sources/c2-results/SOURCE-DIGESTS.json` | file SHA-256 against the Stage 2 manifest | 2/2 MATCH |
| `sources/c2-results/second-reads/SR-C2-2/SECOND-READ.md` / `sources/c2-results/cycles/cycle-2/stage6/SYNTHESIS.md` | `38eaf2a7…383d` / `260c8195…6024` | MATCH against `sources/c2-results/SOURCE-DIGESTS.json` (the two digests the return lists). SR-C2-2 read; SYNTHESIS hashed only |
| Return artifacts in `scratchpad/c3-T1/` (6 files: `lakefile.toml`, `CloneQuotient.lean`, `Check.lean`, `axiom-check.out.txt`, `t1_corroborate.py`, `t1_corroborate.out.json`) | SHA-256 | 6/6 MATCH the return's inventory |
| `lake-manifest.json` / `lean-toolchain` of T1's project | `diff` against the shared pinned project | byte-identical. Mathlib `rev` `905b95818eb32af7874a58b427f50c1711a5e96c`, `leanprover/lean4:v4.32.2`, matching `sources/mathlib-binding/PIN.json` |

The return binds route ID `C3-T-01`, mechanism token `E1-CLONE-QUOTIENT-IN-BALANCE` and orientation T verbatim from
`control/C3-ALLOCATION.md`. It carries the two-part model disclosure (`claude-sonnet-5`).

I did not recompute the return's "8/8 MATCH" row. It covers `OBLIGATIONS.csv`, `control/CLAIM-IDENTITY.run-local.json` and
`cycles/cycle-3/stage2/ROUTE-STATE.md`, which are outside my capsule, so that row is **not replayed** by me.

## Independent re-derivation

**Instrument 1: the Lean rebuild, copy-out-first.** I copied T1's `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
`CloneQuotient.lean` and `Check.lean` to `scratchpad/c3-crit-T1-F/replay/LeanProject/`, bound the shared Mathlib by a manual symlink of
`.lake/packages`, ran `cd` into the project, and ran `lake build CloneQuotient`. Result: `Build completed successfully (8656 jobs)`,
with one warning, `declaration uses 'sorry'` at `CloneQuotient.lean:37:8` (`clone_fiber_card`), and no other warning. `lake env lean
Check.lean` reproduced T1's `axiom-check.out.txt` **byte-identically**. The two double counts depend on `[propext, Quot.sound]`, the
in-balance pair on `[propext, Classical.choice, Quot.sound]`, and none depends on `sorryAx`.

**Instrument 2: my own exact generator** (`scratchpad/c3-crit-T1-F/own/crit_t1f.py`). It uses the standard library only, exact
integers, and neither imports nor copies T1's code.

- **(A) A brute-force fiber census of the clone product** `(Fin a → Bool) × (Fin b → Fin 3)` for `a, b ≤ 5` and every `(k, α)` in a
  1,689-cell window. The true fiber counts equal the zero-extended contract object `N_q(α,k) = C(a,α)C(b,k−α)2^{k−α}`, with
  `C(b, negative) = 0`, in 1,689 of 1,689 cells. They differ from **T1's Lean `N`** in 210 cells, and every such cell has `α > k`.
  The first witness is `(a,b,k,α) = (1,0,0,1)`, where the true count is 0 and T1's `N` gives 1. See Attack 1.
- **(B) The literal clone correspondence (D2) and the literal cover counts (D5) on `CB(d,m)`.** I built the literal tree (tree
  check: the edge count is `n − 1`) and enumerated every independent set. Then, for every choke set `Q` and a fixed mark
  `x = c_{Q[0],0}`, I counted the `r`-free sets `B ∋ x` with choke set exactly `Q` by (rank `|B| − q − 1`, type `w − 1`). In this
  count, `w` is the number of active tags: private leaves `c_ij ∈ B` with `u_i ∈ B`, the literal active-tag witness `N(b_ij) ∖ {c_ij}
  = {u_i}`, while `v` is inactive when `r ∉ B`. I compared each count with `N_q` at `a = dq − 1`, `b = d(m − q) + 1`. For every
  clone `(A, x)` I also counted literal up-covers: the Boolean ones (an absent `c_{i'j'}`, `i' ∈ Q`, `≠ x`, that keeps `A`
  independent) against `a − α`, and the ternary ones (an absent leg vertex at a choke outside `Q`, or `s`, or `v`) against
  `2(b − ℓ')`. Rows: `(d,m) ∈ {(2,2),(3,2),(2,3),(4,2),(8,1)}`, with `n` up to 21 and 7,734 clones in total. There were **0 census
  failures and 0 up-cover failures**, which includes `d = 8` at `m = 1`. This independently confirms the exponents `a = 8q − 1` and
  `b = 8(m − q) + 1`, the rank shift `|B| − q − 1`, and the type `α = w − 1` that the attack brief asks about.
- **(C) Class rows, exact.** The rows are `m ∈ {95 (fixed-point control), 107, 110 (controls), 125, 128, 140 (fresh; gate ruling
  17)}`, at `p* = (16m+4)/3` and every `q ∈ [1, m]`. I computed `r_q(k)` from an **independent decomposition**, `(1+2y)^b =
  ((1+y)+y)^b ⇒ r_q(k) = Σ_s C(b,s)·C(a+b−s, k−s)`, and asserted `Σ_α N_q(α,k) = r_q(k)` against it at `k = j, j−1`. I then checked
  the following in cleared integers (`g' = r(j)Tc − r(j−1)Sc`) at every realized target type `α ∈ [0, min(a, j−1)]` (275,764
  `(q, α)` checks): the Boolean double count, the ternary double count, the in-balance at the real `ρ_q`, `g_0 = 0`, `g_{a+1} = 0`,
  `h_j = 0` (when `j ≤ a`), and condition (i) `r_q(j) ≤ r_q(j−1)`. There were **0 failures**. `ρ_1(95) =
  1354839571516225/1361543988640524` reproduces the SEMANTIC-CONTRACT §5 fixed point, and `ρ_1(107) =
  5150844596024699/5173467627355748`.
- **(D) Mutation controls.** Replacing the ternary state count 2 by 3 fails 150 census cells. Replacing `b − ℓ'` by `b − ℓ` in the
  ternary double count fails 420 grid cells. Both are non-vacuous.

The output digest is `ae26d93ef44976776104d2b10afb70ac6690401d5794497fc82e24685341a789` (the file). The internal payload digest is
`25832cbaab2d3772f66bfca1bfbe251341c8a9b8f25941711a8330bcad6582fb`. A copy-out-first replay into
`scratchpad/c3-crit-T1-F/own-replay/` is byte-identical.

**Instrument 3: T1's generator, replayed copy-out-first** into `scratchpad/c3-crit-T1-F/replay/`. The output is byte-identical to
T1's (`20ec5278…9e21`), with payload `43d2016a…0ae5`. I weigh this as the lowest of the three instruments, because it checks a
**different `N`** from the Lean file (Attack 3).

**The re-derivation, on paper.** With `S_α = N_q(α, j)` and `T_α = N_q(α, j−1)`:

- **Boolean:** `S_{α+1}(α+1) = C(a,α+1)(α+1)·f(j−1−α) = C(a,α)(a−α)·f(j−1−α) = T_α(a−α)`, where `f(t) = C(b,t)2^t`. It needs
  `j−(α+1) = (j−1)−α`, which ℕ gives exactly when `α < j`.
- **Ternary:** `S_α(j−α) = C(a,α)·C(b,ℓ)ℓ·2^ℓ = C(a,α)·C(b,ℓ')(b−ℓ')·2·2^{ℓ'} = 2T_α(b−ℓ')`, where `ℓ = ℓ'+1`, so again `α < j`.
  The ℕ-subtraction `b − ℓ'` truncates only when `ℓ' > b`. There `C(b,ℓ') = C(b,ℓ) = 0`, so both sides are 0, as over ℤ.
- **In-balance:** `h_α + g_{α+1} = (Sc_α − ρTc_{α−1}) + (ρTc_α − Sc_α) = ρT_α`. This is telescoping, true for all sequences and
  every `ρ`.

These are SR-C2-2's D5 and D4 objects exactly. The allocation's `S_{α'+1}(α'+1) = T_{α'}(a−α')` uses `α'` as the **target**
type, and T1's Lean `α` is the target type too. `ρ_q·T_α` is the right-hand side SR-C2-2's Columns clause needs (target type `α`
at rank `j−1`). T1's `g α := ρ·Σ_{i<α}T_i − Σ_{i<α}S_i` and `h α := Σ_{i≤α}S_i − ρ·Σ_{i<α}T_i` are SR-C2-2's `g_α`, `h_α` with the
same offsets. The guard `α < j` is automatic where D6 applies it, because a target clone at rank `j−1` has type `α ≤ j−1`.

## Attacks and findings

**Attack 1 (the principal finding): `clone_fiber_card` is FALSE as stated, and I refute it in the kernel.** T1's node (a) reads
`Nat.card {p | #true(p.1) = α ∧ #true(p.1) + #nonzero(p.2) = k} = N a b k α`. Here `N a b k α = C(a,α)·(C(b, k − α)·2^{k − α})`
uses **Lean ℕ-subtraction**, so for `k < α` it truncates to `C(a,α)·C(b,0)·1 = C(a,α)`. That value is positive whenever `α ≤ a`,
while the fiber is empty because the constraint `α + (·) = k < α` has no solution.

My kernel-checked theorem `T1_clone_fiber_card_statement_false` (`scratchpad/c3-crit-T1-F/replay/LeanProject/Advance.lean`,
axioms `[propext, Classical.choice, Quot.sound]`, no `sorryAx`) proves the negation of T1's universally quantified statement, with
witness `(a,b,k,α) = (1,0,0,1)`. `Falsify.lean` repeats the refutation against T1's own `N` imported from `CloneQuotient`, again
without `sorryAx`. Census (A) finds 210 of 1,689 small cells where the statement fails, all with `α > k`.

Consequences:

- The return's framing is wrong on its face: "STATED, NOT PROVED here", "a typed placeholder for a successor", "the route's honest
  remaining obligation" and "This is intentional, disclosed". The `sorry` hides an **unprovable** statement.
- The successor plan in `## Remaining obligation` item 1 cannot reach the stated goal. That plan is `card_powersetCard` for the
  Boolean part, a ternary lemma, `Fintype.card_prod`, then "reach the graph-free statement `clone_fiber_card` already states".
- T1's generator never tested node (a), which is why the error was not caught ("not corroborated numerically here since it is not
  claimed proved").

This is a statement error, not a mathematical error in D2. The prose D2 uses `C(b, k−α)`, which is zero for `k < α`, and is
correct.

**Attack 2 (fidelity of `N` off the realized range): T1's `N` is the contract's `N_q(α,k)` only on `α ≤ k`.** Off that range the
junk value `C(a,α)` replaces 0. The node (b) theorems remain true, because they are guarded by `α < j` or hold for any sequence.
But the instantiation `in_balance_clone` feeds `S β := N a b j β` and `T β := N a b (j−1) β` into prefix sums at **every** `β`. Its
`S`, `T` therefore agree with SR-C2-2's `S_β`, `T_β` only for `β ≤ j` (resp. `β ≤ j − 1`).

This breaks D4's path-closing identity `g_{a+1} = ρ_q·r_q(j−1) − r_q(j) = 0` with T1's `N` whenever `j ≤ a`. Stated with T1's
`N`, one of two things happens. With the true `ρ_q`, `g_{a+1} ≠ 0`. With `r` redefined as `Σ_{β≤a} N`, `ρ ≠ ρ_q`. Instrument (C)
finds this at **every** `q` with `j = p* − q ≤ a = 8q − 1`, that is at 44 of the 107 choke counts at `m = 107` (from `q = 64`), 51
of 125 at `m = 125`, 52 of 128 at `m = 128` and 57 of 140 at `m = 140`. The zero-extended `N_q` gives 0 failures at the same
points.

The flow itself is not affected, because D6 uses `g_{a+1}` only when `a ≤ j − 1`, and there the values agree. But the return's
certification "tie it explicitly to the clone product" for `in_balance_clone` is overstated. The declaration is a one-line
instance of a generic identity, `ρ` is a free rational not tied to `r_q(j)/r_q(j−1)`, and its `S`, `T` are the contract objects
only on the realized range. A successor who states `g_0 = 0`, `g_{a+1} = 0` or `Σ_β N = r_q` with this `N` inherits false
statements at class rows.

**Attack 3 (the corroboration checks a different object).** `t1_corroborate.py`'s `N` returns 0 for `k − α < 0`, which is the
zero-extended contract object. It is **not** the Lean `N`. The double-count checks are guarded by `α < j`, where the two
definitions agree, so they are corroboration of the same statements. The claim that the script "corroborates … the three node-(b)
identities proved … in CloneQuotient.lean" still hides the definitional divergence that Attacks 1–2 expose. Its in-balance "clone
instantiation" is also partly vacuous, since the identity holds for any sequences. Its only mutation control is on the Boolean
double count.

**Attack 4 (content of the in-balance).** `in_balance` is `Finset.sum_range_succ` plus `ring`, for arbitrary `S, T : ℕ → ℚ` and
`ρ : ℚ`. The return says so candidly ("not itself where D5's combinatorial content lives"). The formal content of node (b) is
therefore the two double counts, and each is one application of `Nat.choose_succ_right_eq` with `omega` index bookkeeping. They
are correct, sorry-free and universal, but small. The Columns clause of D6 needs more that is **not** here:

- `g_0 = 0`;
- `g_{a+1} = 0`, with a zero-extended `N` and `ρ = r_q(j)/r_q(j−1)`;
- `h_j = 0` at `ℓ = 0`;
- `g + h = S`;
- the degenerate cases `S_{α+1} = 0` (forcing `T_α = 0`) and `S_α = 0 < T_α` (forcing `h_α = 0`);
- the division by `T_α` that turns the two double counts into "inflow `= (g_{α+1}+h_α)/T_α`".

`E1_formal: advanced` is correct only in this narrow sense.

**Attack 5 (hypotheses encoding conclusions; `sorry`/enumeration standing in).** None of the four closed declarations has a
hypothesis beyond `α < j` (and none at all for `in_balance`). No `native_decide`, `decide`-by-enumeration or `admit` is used. The
single `sorry` is on the false node (a), and the axiom check correctly excludes it.

**Attack 6 (carries, gate ruling 19).** T1 carries no Snippet. The byte-compare is vacuous, and this is consistent with the
allocation's "stand-alone" object. The corollary is that nothing in T1 touches `cbGraph m`, `C5LA1` or any carried definition, so
node (a)'s graph-level bijection D2 has no formal footing at all in this return.

**Attack 7 (process).**

- T1 self-discloses a full `ps aux` listing, which the worker common brief item 7 forbids. It exposed U1's process line. The
  controller's disclosure index records it identically. I rule it a genuine rule violation with no evidential effect on T1's
  mathematics.
- T1's recursive `grep -rl "X-8" .` was rooted inside `sources/c2-results/`, which is within grant.
- The replay target `scratchpad/c3-T1-replay/` is the one the worker brief prescribes.

**Endpoint and fresh rows.** T1's statements are parameter-free ℕ/ℚ identities, so no residue class, no `M_0` and no asymptotic
step enters, and the `m = 107` endpoint is irrelevant to them. My fresh-row evaluation at `m = 125, 128, 140` (controls 107, 110,
and 95 for the fixed point) was done as part of instrument (C). It is corroboration of the identities at the rows of record, not a
universal proof. Favorability (gate ruling 16), (WID) and `x`/`Δ` do not enter T1's object, since T1 builds no network, and I
build none.

## Mechanism-equivalence and fence check

- **One rank, class only:** respected. Nothing is stated about `CB(8,m)` at any rank, and the identities are generic.
- **No refuted mechanism revived:** T1 uses neither the refuted two-binomial ascent tool (G′) of gate ruling 20, nor Newton or
  Darroch, nor real-rootedness of any forest polynomial.
- **No status transfer:** none claimed. `headline_resolved: no`.
- **Census values as proof:** not done. T1 labels its grid `bounded_computation`, and I label mine the same.
- **The `θ*` law / the r30 bounded record:** not used.

**Claim identity.** T1 proposes no `KEY:` block and no `E993-R31-` candidate. It cites
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`, unchanged) and the heterogeneous
key only for notation. This matches SR-C2-2 findings 5 and 11, which I read. I could not replay T1's lexical alias search, because
`control/CLAIM-IDENTITY.run-local.json` is outside my capsule, but no registration is proposed, so nothing turns on it. My
critic-derived lemmas below are compiled scratch and I propose no key. Mathematically they are the clone correspondence's counting
half, already inside the criterion key's proof of record, so a new key would be an alias.

**Mechanism equivalence.** Node (b) is exactly SR-C2-2 D5 plus the D4 in-balance, and adds nothing beyond them. It is formal
scratch toward the existing criterion key's Columns clause.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| `Build completed successfully (8656 jobs)`, one `sorry` warning at line 37 | my rebuild | **backed** |
| `#print axioms` output for the four node (b) declarations, "none depends on `sorryAx`" | byte-identical replay | **backed** |
| "sorry-free", "strictly universal" for `boolean_double_count`, `ternary_double_count`, `in_balance`, `in_balance_clone` | rebuild; statement reading | **backed** |
| "`clone_fiber_card` … states the abstract cardinality claim … STATED, NOT PROVED", "typed placeholder", "honest remaining obligation" | kernel refutation `T1_clone_fiber_card_statement_false` | **STRUCK.** The statement is false, not open |
| Node (a) docstring "has exactly `N a b k α` elements" | census (A) | **STRUCK** as stated (true only with `α ≤ k`) |
| `in_balance_clone` "to tie it explicitly to the clone product" | Attack 2 | **narrowed.** It is an instance of a generic identity, and its `S`, `T` equal the contract's only for `β ≤ j` (resp. `j−1`). `ρ` is free |
| "corroborated numerically over a finite grid" (the Lean identities) | Attack 3 | **narrowed.** The script's `N` is zero-extended, not the Lean `N`. It agrees on the guarded range only |
| Payload `43d2016a…`, output `20ec5278…`, replay byte-identical | my replay | **backed** |
| "Mathlib `905b9581…`, verified against PIN.json" | manifest `diff` | **backed** |
| "8/8 MATCH" against the Stage 2 manifest | outside my capsule | **not replayed** (not struck; not certified by me) |
| `E1_formal: advanced` | Attack 4 | **narrowed** to "two sorry-free double counts" |
| Route verdict `compiled` | — | **stands** for node (b). Node (a) is not a "missing bridge" but a false statement to be replaced |

**`## Remaining obligation` (T1's) judged inexact.**

- Item 1 asks for a proof of a false statement. My repair below gives the correct shape: a guard `α ≤ k`, or a zero-extended
  `N`.
- Item 2 ("`in_balance_clone` finishes that reduction to `ρ_q`") omits the path-closing identities, the degenerate cases and the
  binding of `ρ` to `r_q`, and with T1's `N` those identities are false where `j ≤ a` (Attack 2).
- Item 3 is fine.

## Verdict

verdict: retained_narrowed
headline_resolved: no

```
COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none
```

**Retained:** the two biregular double counts, `boolean_double_count` and `ternary_double_count`. They are exactly SR-C2-2's D5 at
the target-type indexing the allocation uses, true for all `a, b, j, α : ℕ` with `α < j`, sorry-free, rebuilt, and have clean
axioms. My literal `CB(d,m)` cover census (including `d = 8`) and the class rows confirm they are the right objects. The in-balance
`in_balance` is also retained, as a correct but content-free telescoping identity.

**Narrowed:**

- `clone_fiber_card` is refuted as stated, and a successor must not inherit it.
- T1's `N` is the contract's `N_q` only on `α ≤ k`. With it, `in_balance_clone`'s sequences diverge from `S_α`, `T_α` off the
  realized range, and the path-closing `g_{a+1} = 0` fails at every `q` with `j ≤ a` on every class row checked.
- The corroboration script checks a different `N`.
- `E1_formal: advanced` means two small Mathlib-one-liner identities, not the Columns clause.

**Critic-derived advance (attributed to me, C-T1-F; compiled scratch, no grade).** In `Advance.lean` (Mathlib only; does not
import T1's file; `N` restated byte-identically), all sorry-free with axioms `[propext, Classical.choice, Quot.sound]`:

- `card_weight`: for any finite `X` with `card X = c + 1` and any `z : X`, `Fintype.card {g : Fin b → X // #{i | g i ≠ z} = t} =
  C(b,t)·c^t`. It is proved by induction on `b` through `Fin.consEquiv`, `Fin.card_filter_univ_succ'`,
  `Equiv.subtypeProdEquivSigmaSubtype` and `Nat.choose_succ_succ'`.
- **`clone_fiber_card_of_le`**: T1's node (a) statement **verbatim** (statement body byte-identical, checked by `diff`) plus the
  single guard `α ≤ k`. This is **node (a) closed at the abstract level**, the step T1 left open.
- `clone_fiber_card_of_lt`: the fiber is empty for `k < α`.
- `T1_clone_fiber_card_statement_false`: the refutation of T1's unguarded statement.

Together, the fiber has cardinality `if α ≤ k then N a b k α else 0` for all `a, b, k, α`, which is exactly the zero-extended
contract object `N_q(α, k)`.

Mathematically, node (b) plus my abstract node (a) is a complete and correct account of the counting identities of D2's product
side and D5. The graph-level bijection of D2 (literal `B ⊆ V(cbGraph m)` ↔ clone product) remains `proved_informal` on the
criterion key's record, and is corroborated literally by my census (B) at five small rows. It is not formalized.

## Remaining obligation

What a successor inherits, exactly:

1. **Replace T1's `N` by the zero-extended object**, `N a b k α := if α ≤ k then C(a,α)·C(b,k−α)·2^{k−α} else 0` (or carry the
   guard `α ≤ k` on every use). Then cite `clone_fiber_card_of_le` / `clone_fiber_card_of_lt` (critic C-T1-F scratch; funding by
   Stage 7 required before any carry) in place of T1's false `clone_fiber_card`. T1's double counts re-prove verbatim under the new
   definition, because they only use the range `α < j`.
2. **The D4 closure identities with that `N`** and with `ρ := r_q(j)/r_q(j−1)`, where `r_q(k) := Σ_{α ≤ a} N a b k α` is bound to
   the contract's `[y^k](1+y)^a(1+2y)^b`:
   - `g_0 = 0`;
   - `g_{a+1} = 0`;
   - `h_j = 0` when `j ≤ a`;
   - `g_α + h_α = S_α`.
3. **The Columns clause as a formal lemma**: target inflow `(a−α)·g_{α+1}/((α+1)S_{α+1}) + 2(b−ℓ')·h_α/(ℓ·S_α) = ρ_q` for every
   realized target type `α ≤ min(a, j−1)`, including the degenerate cases (`S_{α+1} = 0 ⇒ T_α = 0`; `S_α = 0 < T_α ⇒ h_α = 0`;
   `α = a`).
4. **The graph-level bijection D2 on `cbGraph m`** (C1-LA2's labels, carried byte-identically): `r`-free `B` with choke set `Q` and
   active mark `x` ↔ `(Fin (8q−1) → Bool) × (Fin (8(m−q)+1) → Fin 3)` at rank `|B| − q − 1` and type `w_F(B) − 1`, with the literal
   active-tag weight. No seat's formal work has touched it here.
5. Nothing in 1–4 resolves conjunct 4. The headline remains Stage 7's.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T1-F/`.
Every Python run used `python3 -B`. Every Lean invocation ran after `cd replay/LeanProject`, with Mathlib bound by a manual symlink
(`.lake/packages` → the shared project's `.lake/packages`) and never copied. There was no `lake update`, `lake clean` or `elan`.

| Path | SHA-256 | Role |
|---|---|---|
| `seals.py` | `32a6ddfce20510feb5e5830c453e2118ced34634fc46ed14190753fbd1f5aa0c` | capsule, Stage 4, Stage 3 and Stage 2 seals and member digests |
| `replay/LeanProject/CloneQuotient.lean`, `Check.lean` | `0fe75753…0a48`, `094427b6…67b5` | T1's files, copied out (identical) |
| `replay/axiom-check.critic.out.txt` | `4db365c7822db47aa7593c552826da383c5212349791e8dc0cb34d2141e488b8` | replayed axiom check (identical to T1's) |
| `replay/LeanProject/Advance.lean` | `d7ff84f18964e13936b848dde4433ddfc32ce44e1fc5a6fc5751b4bd75845fb4` | critic-derived: `card_weight`, `clone_fiber_card_of_le`, `clone_fiber_card_of_lt`, `T1_clone_fiber_card_statement_false` |
| `replay/advance.lean.out.txt` | `8585576569aff66aed00636f14399207d682f5f2050be569884d7ce9a97087d2` | `lake env lean Advance.lean` output: four `#print axioms` lines, no `sorryAx`, no warnings |
| `replay/LeanProject/Falsify.lean` / `replay/falsify.lean.out.txt` | `3218e193…50f4` / `7fea6de8…a2de` | refutation against T1's own imported `N` (no `sorryAx`) |
| `replay/t1_corroborate.py` / `replay/t1_corroborate.out.json` | `9e1fbb79…63aa` / `20ec5278…9e21` | T1's generator replayed (byte-identical output) |
| `own/crit_t1f.py` | `aef51fb40cc367c48c01e60fd4b1b0570585046765a50b50408026bd0fad9f07` | independent instrument (A–D). IMPORT LIST: `hashlib`, `json`, `itertools`, `math`, `fractions` |
| `own/crit_t1f.out.json` = `own-replay/crit_t1f.out.json` | `ae26d93ef44976776104d2b10afb70ac6690401d5794497fc82e24685341a789` | its output; payload `25832cba…82fb`. Copy-out replay is byte-identical |

Replay: `cd <scratch>/replay/LeanProject && lake build CloneQuotient && lake env lean Check.lean && lake env lean Advance.lean && lake
env lean Falsify.lean`. Also `mkdir -p <scratch>/own-replay && cp <scratch>/own/crit_t1f.py <scratch>/own-replay/ && cd
<scratch>/own-replay && python3 -B crit_t1f.py`.

**Read-boundary disclosures.**

1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into context before my first tool
   call. I did not open or act on them.
2. I read `control/C3-WORKER-COMMON-BRIEF.md`, a Stage 2 member that the capsule's common brief names as binding on critics, after
   verifying its digest.
3. I read `sources/c2-results/second-reads/SR-C2-2/SECOND-READ.md` (partly, including targeted `grep` and `sed` within that one
   file). It is within the `sources/` grant and digest-verified. I hashed, but did not read, `sources/c2-results/cycles/cycle-2/stage6/SYNTHESIS.md`.
4. A `grep -n '^#'` on `control/C3-CRITIC-ATTACK-BRIEFS.md`, a capsule member, displayed the **heading lines of other seats'
   sections** (one-line summaries of T2, T3, F1–F3 and U1–U3). I read only T1's section body. I disclose the incidental exposure of
   those headings, and I did not use them.
5. I ran recursive `grep -rn` searches rooted in the Mathlib package directory
   `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib/Mathlib`, which is readable for
   API meaning per the protocol, and in no directory above my grant.
6. I ran `ls -la` (non-recursive) on `scratchpad/c3-T1/`, `scratchpad/c3-T1/LeanProject/` and its `.lake/`. I did not read
   `scratchpad/c3-T1-replay/`.
7. I read no sibling return, critique, adjudication, other experiment root or the network. I installed nothing and spawned no child
   agent.
8. Every command ran in the foreground. No background job was started, so none needed to be killed at the final write.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
