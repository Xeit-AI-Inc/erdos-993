# Orientation Adjudication

r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank), Cycle 3, Stage 5,
orientation **T (prove)**. Portfolio: returns `T1` (`C3-T-01`, `E1-CLONE-QUOTIENT-IN-BALANCE`), `T2` (`C3-T-02`,
`E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`) and `T3` (`C3-T-03`, `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`), with critiques `C-T1-F`,
`C-T1-U`, `C-T2-F`, `C-T2-U`, `C-T3-F` and `C-T3-U`. Written 2026-09-28, about 06:30–06:50 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and I loaded no other VerityOS subsystem. The controller owns conversation
logging for this run, so I wrote no conversation log.

**Read-boundary disclosures.**
1. Before my first tool call, the harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my
   context. I did not open them and did not act on them.
2. My first two shell calls used an `echo =====` separator. zsh `=`-expansion made them exit 1. The boot files and the protocol
   were displayed in full regardless, and I re-displayed the startup protocol and capsule separately. The effect was cosmetic.
3. Beyond the capsule, I made these reads:
   - Non-recursive `ls -la` of the inventoried scratch directories of the three seats and six critics.
   - Copy-out-first copies of their Lean and Python files, which the dispatch authorizes.
   - Inside `sources/`: `sources/mathlib-binding/PIN.json`, `sources/c1-results/SOURCE-DIGESTS.json`, and the C1-LA1, C1-LA2 and
     C1-LA3 `Snippets/` fragments. I read the fragments only to byte-compare carries. C1-LA2 `Main.lean` was hashed only.
   - The pinned shared project's `lean-toolchain` and `lake-manifest.json`, read for a `diff`.
4. I ran no `find`, `grep -r`, `rg`, `ls -R` or glob `cat` rooted above a granted directory. My process checks were `pgrep` calls
   filtered to my own scratch path or to a script name. They returned nothing foreign.
5. I read no other orientation's portfolio, no adjudication, no synthesis, no second read, no other experiment root and no network
   resource. I installed nothing and spawned no child agent.

## Identity and seal audit

| Object | Recomputed | Result |
|---|---|---|
| Dispatch `control/dispatch/c3-stage5/DISPATCH-ADJ-T.md` (file SHA-256) | `51249690208f1f4e9e1c5082334db4139d3f1957768c85167da43436ede43264` | **match**, verified before reading |
| **Capsule seal** `control/c3-adjudicator-capsules/T-PACKET-MANIFEST.json` (canonical JSON minus `seal_sha256`; `sort_keys`, `(",", ":")`, no trailing newline) | **`eaca5191e7a2adf347d83bbe25fe5ef3e8dde16416d9c8261d659abe78c8cda7`** | **match** |
| Capsule members (24) | SHA-256 and byte count of each | **24/24 match** |
| `PATH-CHECK-T.json` | read | 23 files scanned, 0 findings |
| Stage 2 packet seal | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` | match |
| Stage 3 packet seal | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` | match. Lists T1/T2/T3 `RETURN.md` at the capsule digests |
| Stage 4 packet seal | `a940eb85c4b829c017b154ce6d72acc2346b66d3cb7c1aad3438500798e87d4e` | match. Lists the six T critiques at the capsule digests |
| Stage 3 / Stage 4 admission | `verdict: admit` (9 returns / 18 critiques) | T1–T3 admitted without exception. All six T critiques admitted, each `retained_narrowed` |
| Controller facts `C3-STAGE5-CONTROLLER-FACTS-T.json` | read | facts CF3-T-1..3, treated as facts, never authority (see Cross-route reconciliation) |

Identity checks:
- Each return binds its route ID and mechanism token verbatim, and carries the two-part disclosure (`claude-sonnet-5`).
- Each critique carries `claude-opus-5-5` at chartered opus/medium, per its own face.

Replayed seat artifacts. All are byte-identical.
- T1 `axiom-check.out.txt` `4db365c7…`, byte-identical to my replay.
- T1 generator output `20ec5278…`, byte-identical.
- T2 `Main.lean` `c11f62aa…`, and its generator output `82c2623d…`, byte-identical.
- T3 `OUT.json` `90646e87…`, byte-identical.
- C-T3-U's `CRITIC-OUT.json` `f11493e7…`, byte-identical when replayed by me.

Replayed critic logs:
- The `#print axioms` lines of every critic's Lean file equal the shipped logs:
  - `advance.lean.out.txt` `8585576…`
  - `critic-lean-nodeA.out.txt` `ef30d54…`
  - `critic-lean-column.out.txt` `47284c3…`
  - `lean_critic.log` `1b24470…`
  - `critic_ax.log` `032b5d9…`
  - `lean-check.log` `c501a46…`
  - `build.log` `b4ea99a…`
- Each lists only `propext`, `Quot.sound` and, where used, `Classical.choice`. No `sorryAx` appears.

Carries:
- T2's 24 carried blocks (C1-LA3 entries 1–21; C1-LA1 entries 11, 29, 30) are byte-identical to the frozen `Snippets/` fragments.
  Each marker digest equals its fragment's digest and matches `sources/c1-results/SOURCE-DIGESTS.json` (24/24, my replay).
- C-T3-U's 13 carried C1-LA2 fragments pass the same test (13/13).
- C-T3-F imports C1-LA2 `Main.lean` at `a906ec17…`, the frozen digest.

Toolchain: every project uses Lean v4.32.2 and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, matching `PIN.json`. Mathlib
was bound by manual symlink. I ran no `lake update` or `lake clean`.

## Route-by-route decisions

### T1 — `C3-T-01`, `E1-CLONE-QUOTIENT-IN-BALANCE`

**Decision: retained_narrowed. Node (b) is retained. Node (a) as stated is REFUTED.**

- **Retained (replayed).**
  - `boolean_double_count` and `ternary_double_count` are SR-C2-2 D5 at target-type indexing. Both are universal over `ℕ` with
    guard `α < j`, and sorry-free. Their axioms are `[propext, Quot.sound]`.
  - `in_balance` is D4, pure telescoping, true for every `S, T, ρ`.
  - `in_balance_clone` is its instance.
  - My rebuild gave `Build completed successfully (8656 jobs)`, with one `sorry` warning at `CloneQuotient.lean:37:8`. The axiom
    output was byte-identical to T1's.
- **Refuted (both critics concordant; kernel-checked twice; I replayed both).**
  - T1's `N a b k α := C(a,α)·C(b,k−α)·2^(k−α)` uses truncated ℕ subtraction, so for `k < α ≤ a` it returns `C(a,α) ≠ 0` where
    the fiber is empty.
  - The universally quantified `clone_fiber_card` is therefore false.
  - Refutations: `E993R31.CritT1F.T1_clone_fiber_card_statement_false` and `clone_fiber_card_false` (both C-T1-F), and
    `E993R31.CritT1U.clone_fiber_card_statement_false` (C-T1-U). Witness `(a,b,k,α) = (1,0,0,1)`.
  - The `sorry` hid an unprovable statement, not an open one. The return's "honest remaining obligation" item 1 is struck.
- **Narrowed.**
  - T1's `N` is the contract's `N_q(α,k)` only for `α ≤ k` (or `α > a`).
  - The "Casts … nothing is subtracted before known nonnegative" literal is struck.
  - The corroboration script models the zero-extended `N`, not the Lean `N`, so it could not see the defect.
  - `E1_formal: advanced` holds only for two one-lemma double counts.
- **My replay of the consequence.** With T1's `N`, the totals `Σ_{β≤a} N(a,b,j,β) = r_q(j)` and `Σ_{β≤a} N(a,b,j−1,β) =
  r_q(j−1)` FAIL at:

  | `m` | failing `q` | count |
  |---|---|---|
  | 107 | `[64, 107]` | 44 |
  | 110 | `[66, 110]` | 45 |
  | 125 | `[75, 125]` | 51 |
  | 140 | `[84, 140]` | 57 |

  With the zero-extended `N` they hold everywhere (`adj_t.py`). This matches both critics exactly.
- **Critic-attributed advances (compiled scratch, no grade; replayed).** Node (a) is repaired with the guard `α ≤ k` and proved,
  independently by both critics:
  - `E993R31.CritT1F.clone_fiber_card_of_le` / `clone_fiber_card_of_lt` (C-T1-F);
  - `E993R31.CritT1U.clone_fiber_card_of_le` / `clone_fiber_card_guarded` (C-T1-U).

  Also from C-T1-U:
  - `E993R31.CritT1U.column_inflow_clone`: D6 Columns at clone level, non-degenerate case `S_{α+1}, S_α > 0`, `α < j`;
  - `rows_identity` (`g_α + h_α = S_α`);
  - `g_zero`.

### T2 — `C3-T-02`, `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`

**Decision: retained_narrowed. Every compiled declaration stands. The route object is not reached (adapter and zero-weight
classification unattempted).**

- **Retained (replayed: `lake env lean` exit 0, 0 errors, no `sorry`; axioms `[propext, Classical.choice, Quot.sound]`).**
  - `cb8R1_eq_coeffQ` (R-4, every `m, k`, no hypotheses).
  - `cb8Rho_le_one` and `cb8Rho_lt_one` (node (d), from carried entries 20 + 14).
  - `cb8Rho1_eq_cb8R1_ratio`.
  - `likelihood_ratio`.
  - `cb8_typePath_ii1` (TP-g at `a, b ≥ 0`, `j : ℕ`, `α ≤ a`).
  - T2's `Nterm`/`Sterm`/`Tterm`/`rz` are **zero-extended**: `Nterm` is guarded `if α ≤ k`, and `Sterm`/`Tterm` use `polyCoeffZ`.
    They are the contract objects, unlike T1's `N`.
- **Struck or narrowed.**
  - "No shortcut through carried content" for TP-h is struck: both critics compiled TP-h from carried entry 15 at `b = 0` by a
    shift-by-one pairing, with no `β`-reindexing.
  - `cb8Rho1_eq_cb8R1_ratio`'s "exact phrasing … as C1-LA1 does" is narrowed to value-equal and syntactically unlinked. Its
    indices are `(16m+4)/3 − 1, −2` and its exponents `7, 8m−7`. C1-LA1's residual uses `(16m+1)/3, (16m+1)/3 − 1`, and entry 20
    uses `8·1−1, 8(m−1)+1`. Both critics compiled the link.
  - "`ρ_1(107)` … fixed point of record" is narrowed (see Cross-route reconciliation).
  - "Fresh/control rows 107, 110, 113" is narrowed to control rows only.
  - The Part D reduction tally is narrowed: I confirmed in the replayed code that the reduction ran on the 18,125-instance grid
    only.
  - "Axiom copy … discarded" is inaccurate: `AxiomCheck.lean` and `Test1–4.lean` remain in scratch, uninventoried.
  - "Carried inputs … still-open, not-yet-Stage-7-closed" is struck. `C3-ALLOCATION.md` records C1-LA1 and C1-LA3 as formally
    verified awards. The error understated the grade, so it caused no contamination.
- **Critic-attributed advances (compiled scratch, no grade; replayed).**
  - TP-h / (ii-2), compiled twice and independently: `critF_cb8_typePath_ii2` (C-T2-F) and `critic_typePath_ii2` (C-T2-U).
  - The class-instance nonnegativity of both E1 type-path totals, `critic_cb8_E1_typePath_totals_nonneg` (C-T2-U). Positivity of
    `r(j−1)` is discharged inside the proof.
  - The C1-LA1-syntax link: `critF_cb8Rho1_eq_c1la1_ratio` and `critF_cb8R1_residual_pos` (C-T2-F);
    `critic_cb8R1_rho1_lt_one_LA1form` and `critic_cb8_residual_capacity_pos` (C-T2-U).
- **Gate line.** T2 reported `E1_formal: not_advanced`. That is overruled. R-4, node (d) and TP-g are seat-authored, sorry-free
  nodes of the E1 formal DAG (see the gate-line standard below).

### T3 — `C3-T-03`, `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`

**Decision: retained_narrowed. The route verdict `compiled` is struck and replaced by `bounded_evidence` plus a statement-shape
proposal.** No Lean was built by T3.

- **Retained.** The mathematics restates Lemma DF (SR-C2-3), `proved_informal`, inherited. Both critics' independent literal
  instruments, plus my replay of T3's generator and of C-T3-U's instrument (byte-identical), support each of the following:
  - the image classification: `K` leg deletions, `r`- and `v`-deletions, the `s`-switch, and `u_i`-switches iff `β_i = 1`;
  - target distinctness;
  - the `8 − γ` sector-preimage count;
  - the in-sector preimage structure: `2·#empty legs` sector deletions plus `C(z,2)` switches at `r`;
  - the Out-bridge regrouping `Σ_A g_sec(B,A) = Σ_i cb8Out(m, state_i(B))`.

  The Out-bridge value `1532715/1532386` (m = 107, T3's profile) was reproduced by both critics.
- **Struck.**
  - "Verified on two independent sides" (check C): both sides call the same template functions, and side 1 reads states from the
    layout dict.
  - "Two-line `omega`" and "carried neighbourhood lemmas already supply the facts" for the no-other-switch clause. The carried
    lemmas cover `N(u_i)` and `N(r)` only. The clause needs `N(v)`, `N(b_ij)`, `N(c_ij)` and independence, about 50–60 lines.
  - "`chokeState` gives the `State8` bound for free": `cb8Out` takes a subtype, so a `β+γ ≤ 8` proof from independence is
    required.
  - The DAG-acyclicity check as `bounded_computation`: it is a check of T3's own transcription and is non-evidence.
  - The stated reason in `in_bridge_zero_classes` that the non-sector `u = r` arcs "never touch a sector target … a category
    mismatch". That is false: these arcs land exactly on in-sector targets (T3's own `C(z,2)`). They carry zero flow because
    `g_sec` is sourced only at sector sets and E1 is deletion-only.
  - The count "41 checks": corrected to 42.
- **Narrowed.** "U-B's informal DAG closed at statement granularity" is narrowed to: classification and preimage nodes stated. Still
  unstated:
  - the Lean definition of `g_sec`;
  - normalization `g_sec / Out(B)` (since `IsSaturatingFlow` needs row sum = weight = 1);
  - the In-sum node `Σ_B g_sec(B,A) = Σ_i cb8In(state_i(A))`;
  - the switch-image inflow `(8−γ)σ(γ)`;
  - the leg-count node `Σ_i(β_i+γ_i) = |B| − 2`;
  - images in `indepFamily`.

  The case analysis of switch preimages of in-sector targets omits the centres `v`, `b_ij` and `c_ij`. They are impossible, but
  the case must be written.
- **Critic-attributed advances (compiled scratch over the carried C1-LA2 layer; replayed; axioms clean).**
  - `sector_no_choke`, `sector_switch_center`, `choke_switch_iff` and `sector_transportRel_classify` (C-T3-F).
  - `no_choke_of_root_mem`, `leg_partner`, `leg_neighborFinset_inter_card_le_one`, `sector_switch_vertex_classify`,
    `choke_neighborFinset_inter_card` and `sector_switch_classify_full` (C-T3-U).
  - The generic `erase_label_unique`, `erase_ne_switch` and `switch_label_unique` (C-T3-U). These make target distinctness a
    generic graph fact and let `g_sec` be defined by set difference.
  - The In-sum identity is critic-STATED by both critics, each backed by an independent literal instrument:
    - C-T3-F: 48/48 targets at `m = 107, 125, 128, 140`;
    - C-T3-U: 27 targets at nine rows, plus exhaustive `m = 1`, `m = 2`.

    It needs an isolated second read before any registration.

### Gate lines for orientation T (ruling 21)

**Standard applied.** A line is `advanced` when a **seat-authored**, sorry-free compiled node of that DAG has been replayed by the
adjudicator. Critic-derived compiled nodes are recorded as critic-attributed and do not by themselves move a line. This reconciles
the T1/T2 critics (whose `advanced` rests on T1's and T2's own nodes) with the T3 critics (who kept `COND4_formal` at `not_advanced`
because the only sector Lean is theirs).

```
COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none
```

- **`COND4_formal: not_advanced`.** The sector-side literal Lean is entirely critic-attributed (C-T3-F, C-T3-U).
- **`E1_formal: advanced`.** Seat-authored nodes:
  - T1: the two double counts and the in-balance;
  - T2: R-4, node (d) and TP-g.

## Cross-route reconciliation

Paired-critic disagreements, resolved claim by claim:

1. **`ρ_1(107)` "of record" (T2).**
   - C-T2-F narrows the label. C-T2-U rules it "backed".
   - **Resolved for C-T2-F on the label.** SEMANTIC-CONTRACT §5 records `ρ_1` only at `m = 95`. At `m = 107` it records
     `θ* = 96/766193` and margin `≈ 34.90`. T2's `m107_rho1_expected` is a hard-coded literal (line 83 of `verify_t2.py`, read by
     me).
   - **Resolved for C-T2-U on the value.** `ρ_1(107) = 5150844596024699/5173467627355748`, recomputed by both critics and by me.
     `(1 − ρ_1)/θ* = 34.90085…` is consistent with the recorded margin.
   - So there is one fixed point of record, and the second value is confirmed but not "of record".
2. **Entry 21 carried as `theorem` (T2).**
   - C-T2-F: a procedural deviation from ruling 19. C-T2-U: "stricter than required, harmless".
   - **Resolved for C-T2-F.** Ruling 19 prescribes the edit `theorem` → `lemma` with a recorded reversibility check for an origin
     terminal. It was not made. The effect is non-mathematical, and the edit must be made at the governed carry.
3. **TP-h "needs a second, structurally different likelihood-ratio lemma" (T2).**
   - C-T2-U: "true in substance, overstates cost". C-T2-F: the "no shortcut" claim is struck.
   - **Both hold on different sub-claims.** A second likelihood-ratio lemma is needed (`critic_likelihood_ratio_h` /
     `critF_shifted_pair`), and it is structurally different from `likelihood_ratio`. The `β`-reindexing and "no shortcut through
     carried content" are struck, since carried entry 15 at `b = 0` suffices.
4. **`in_balance_clone` (T1).**
   - C-T1-F: narrowed. C-T1-U: retained, faithful for `α ≤ j − 1`.
   - **Not in conflict.** It is a true identity, faithful on every realized target type. It is not tied to `ρ_q`, because `ρ` is
     free, and its sequences diverge from `S_α`, `T_α` off the realized range. Retained with that narrowing.
5. **The T3 registry key's status.**
   - C-T3-U could not verify it inside its boundary. C-T3-F verified it against the frozen Cycle 2 close snapshot (`VERIFIED`,
     `proved_informal`).
   - **Resolved as backed**, on C-T3-F's evidence. C-T3-U's limitation was a boundary limitation, not a finding.
6. **The controller's Stage 3 disclosure summary for T2** ("saw a sibling U3 build process").
   - Both T2 critics note that this is absent from T2's face.
   - **Record note:** the index entry is unsupported by the return, which is the authority.

Reconciliation across routes:

- **Two `N` vocabularies.**
  - T1's `N` is truncated and wrong off `α ≤ k`. T2's `Nterm`/`Sterm`/`Tterm` are zero-extended and correct.
  - A successor award must state everything in T2's vocabulary (or a guarded `N`).
  - T1's double counts re-prove verbatim there: they use only `α < j`, where the two agree.
  - C-T1-F notes that `in_balance_clone` then needs `ρ` bound to `rz a b j / rz a b (j−1)`.
- **The E1 clone-level transport is now almost entirely compiled in scratch.** The nodes are:
  - rows (`rows_identity`);
  - non-degenerate columns (`column_inflow_clone`);
  - nonnegativity at the class (`critic_cb8_E1_typePath_totals_nonneg`, resting on TP-g and TP-h);
  - `ρ_q < 1` (node (d)).
- **My instrument (`adj_t.py`).** It checks the complete clone-level E1 transport (the X-8 arc values) at `m = 107, 110, 125, 140`,
  every `q ∈ [1, m]`, using exact `Fraction` and the zero-extended `N`, with `r_q` computed by an independent decomposition
  `Σ_s C(b,s)C(a+b−s,k−s)`. It covers 21,990 / 23,238 / 29,991 / 37,605 realized target types. Results, all with 0 failures:
  - rows = 1 per source clone;
  - column inflow = `ρ_q` on every realized target type, **including the degenerate classes**:
    - `α = a` (63 at `m = 107`);
    - `S_α = 0 < T_α` (67 at `m = 107`);
  - `g, h ≥ 0`;
  - `g_0 = g_{a+1} = 0`;
  - `h_j = 0` for `j ≤ a`.

  This is `bounded_computation`, and it confirms that the remaining formal Columns cases are true at the class rows.
- **Controller fact CF3-T-3 (cross-orientation, STATED).** F-side critics give a closed informal proof of X-8 exactness. It is
  consistent with the above. The Lean nodes in my portfolio cover:
  - its rows clause: `rows_identity`;
  - its non-degenerate columns clause: `column_inflow_clone`;
  - its nonnegativity clause: TP-g + TP-h ⇒ `critic_cb8_E1_typePath_totals_nonneg`. This rests on entry 15's strong
    log-concavity of products of linear factors, not on Newton or Darroch.

  Uncovered formally: the degenerate columns, and the binding of the clone level to `cbGraph m`.
- **CF3-T-1 (cross-orientation, STATED).** It names a per-set neighbourhood-count bridge on `cbGraph m` as the missing formal piece
  of the E1 flow. It is the same obstruction as T1's critics' item 4: the graph-level D2 bijection and literal up-cover counts
  `a − α`, `2(b − ℓ')` on `cbGraph m`. No T route owns it. I adopt it as route 2 below. It is not registered from here.
- **The sector and E1 sides compose only through C1-LA1's Switch/Residual.** The subtrahend of the residual is now linked in C1-LA1's
  literal syntax (`critF_cb8R1_residual_pos` / `critic_cb8_residual_capacity_pos`), so no index-rewrite gap remains on that
  interface.

## Established results

Each result is listed with its grade, what it consumes, and its attribution. Compiled scratch has no grade until a governed award
closes (SOLUTION-CONTRACT §4). No new exact theorem is registered from this Stage.

**A. Compiled scratch, seat-authored, sorry-free, replayed.** All are universal unless a scope is stated, with no residue class, no
`M_0` and no asymptotics.
1. `E993R31.CloneQuotient.boolean_double_count (a b j α) (hα : α < j)` and `ternary_double_count` (T1). Consumes only
   `Nat.choose_succ_right_eq`.
2. `in_balance (S T ρ α)` (T1). Pure telescoping.
3. `E993Transport.cb8R1_eq_coeffQ (m k)` (T2). No hypotheses.
4. `cb8Rho_le_one` / `cb8Rho_lt_one (m q) (107 ≤ m) (m % 3 = 2) (1 ≤ q) (q ≤ m)` (T2). Consumes carried entries 20 and 14.
5. `likelihood_ratio`, `cb8_typePath_ii1 (a b j α) (α ≤ a)` (T2). Consumes carried entry 15 at `a = 0`.

**B. Compiled scratch, critic-attributed, sorry-free, replayed.** These are STATED at a review stage and need an isolated second
read.
1. The node-(a) repair `clone_fiber_card_of_le` / `_guarded` (C-T1-F, C-T1-U independently).
2. `column_inflow_clone`, `rows_identity`, `g_zero` (C-T1-U).
3. TP-h `critF_cb8_typePath_ii2` (C-T2-F) and `critic_typePath_ii2` (C-T2-U), independently.
4. `critic_cb8_E1_typePath_totals_nonneg` at the class (C-T2-U).
5. The C1-LA1-syntax `ρ_1 < 1` and `0 < 1 − ρ_1` (C-T2-F, C-T2-U).
6. The sector image classification over the carried `cbGraph m`: `sector_transportRel_classify` (C-T3-F) and
   `sector_switch_classify_full` + label uniqueness (C-T3-U).

**C. Informal, inherited.**
- Lemma DF's arc accounting, including the Out bridge, stays `proved_informal` (inherited, SR-C2-3). T3 restates it.
- The In-sum identity is critic-STATED, `proved_informal` pending a second read.

**D. Bounded computations** (`bounded_computation`, corroboration only):
- the literal sector Out/In/switch checks at nine class rows, with exhaustive `m = 1, 2` (C-T3-U, replayed byte-identical by me);
- the same checks at `m = 107, 125, 128, 140` (C-T3-F), with (WID) asserted from independent sides and `x`, `F_{p*} = leafSet`
  derived at ruling 16's index;
- the clone-level E1 transport at four class rows (mine);
- the type-path totals at fresh rows (C-T2-U).

**E. Refuted steps and record corrections.**
- T1's `clone_fiber_card` is REFUTED as stated, in the kernel.
- The Cross-route and Route-by-route strikes above are the record corrections.
- No mathematical claim of record is refuted.

## Rejected and narrowed mechanisms

- **T1's truncated `N` is rejected as the object of record.** Every successor must use the zero-extended object (T2's `Nterm`, or
  `if α ≤ k then … else 0`).
- **T2's `β`-reindexing prescription for TP-h** is superseded by the shift-by-one pairing, which uses entry 15 at `b = 0`.
- **The "two-line" no-other-switch argument is rejected.** The compiled proof needs a leg-partner lemma, a five- or ten-way
  `cbEdge` case split, and independence.
- **T3's CB-specific five-signature injectivity is narrowed.** It is correct, but it is replaced by generic label uniqueness, and
  `g_sec` should be defined by set difference.
- **T3's category-mismatch reason for `u = r` arcs is rejected.** It is replaced by "sector-sourced `g_sec` and deletion-only E1".
- **Fences confirmed on every return and critique.**
  - Nothing uses Newton or Darroch: entry 15 is an induction over linear factors.
  - Nothing uses (G′) (ruling 20), the `m`-independent per-choke certificate, the all-families compression, or forest
    real-rootedness.
  - Nothing states a claim at another rank, residue or `d`.
  - The `θ*` law is never a hypothesis.
  - No census is used as proof.
  - No status transfers. `E993-TREE-REAL-ROOTED` stays REFUTED. (HALL) at full scope, the primary aggregate, TREE, FOREST,
    TRANSFER and #993 stay OPEN.

## Lean readiness

**Group T-A: the E1 clone-level transport at the class. CONTRACT-READY with three named small open nodes.**

- **(a) Informal proof.** Complete at statement granularity: SR-C2-2 D4–D6 + CD-2 (`proved_informal`, scope notes of the criterion
  key). The DAG is closed.
- **(b) Compiled fragments.** Every node below is compiled sorry-free (the §A/§B declarations).
- **(c) Open nodes.** Named below.

Proposed statement (a draft for the Stage 7 freeze, in T2's vocabulary):

```lean
namespace E993Transport
theorem cb8_E1_cloneTransport_topRank (m q : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hq1 : 1 ≤ q) (hqm : q ≤ m) :
  let a := 8*q - 1; let b := 8*(m - q) + 1; let j := (16*m + 4)/3 - q
  let S := fun α => (Sterm a b j α : ℚ); let T := fun α => (Tterm a b j α : ℚ)
  let ρ := (rz a b (j : ℤ) : ℚ) / (rz a b ((j : ℤ) - 1) : ℚ)
  ρ < 1 ∧
  (∀ α ≤ a, 0 ≤ gE S T ρ α ∧ 0 ≤ hE S T ρ α ∧ gE S T ρ α + hE S T ρ α = S α) ∧
  gE S T ρ 0 = 0 ∧ (j ≤ a → hE S T ρ j = 0) ∧
  (∀ α ≤ a, α < j → 0 < T α →
     (if α < a then ((a - α : ℕ):ℚ) * gE S T ρ (α+1) / (((α+1 : ℕ):ℚ) * S (α+1)) else 0)
   + (if j - 1 - α < b then ((2*(b - (j-1-α)) : ℕ):ℚ) * hE S T ρ α / (((j-α : ℕ):ℚ) * S α) else 0) = ρ)
end E993Transport
```

Here `gE`/`hE` are T1's `g`/`h`, instantiated over `Sterm`/`Tterm`.

- **Hypotheses.** `107 ≤ m` and `m % 3 = 2` enter only through carried entries 20 and 14, for `ρ < 1` and `r(j−1) > 0`. The
  inequalities and identities are otherwise generic in `a, b, j`.
- **Fences.**
  - Clone level only. It is NOT a statement about `cbGraph m`, NOT the E1 flow on the literal network, NOT conjunct 4, and NOT
    progress on (L-S)_top or (ELIG-top)(a).
  - It is a formal node of `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`,
    unchanged).
  - No new key: SR-C2-2 finding 5 records that a new key would be an alias.
- **Carried fragments** (byte-identical, receipt-bound; digests per the `VERITYOS ENTRY` markers of T2's `Main.lean` `c11f62aa…`):
  - C1-LA3 entries 1–21, among them:
    - entry 1 `polyCoeffZ`, `046f659b…`;
    - entry 14 `twoBinomCoeff_pos`;
    - entry 15 `twoBinomCoeffZ_strongLC`, `61e8794f…`;
    - entry 20 `cb8_E1_conditionI_topRank`, `8da112b4…`;
    - entry 21 `cb8_block_descent_topRank`, to be carried as `lemma` with the ruling-19 reversibility record.
  - C1-LA1 entries 11 `cb8R1` `2efd2823…`, 29 `cb8R1_expand_top` `144157fc…` and 30 `cb8R1_expand_sub` `5910302b…`.
- **New declarations.**
  - T2: `coeff_one_add_two_mul_X_pow`, `cb8R1_eq_coeffQ`, `cb8Rho_lt_one`, `Nterm`, `rr`, `rr_eq_coeff`, `fB`, `Sterm`, `Tterm`,
    `rz`, `likelihood_ratio`, `cb8_typePath_ii1`.
  - T1's double counts and `in_balance`, restated over `Sterm`/`Tterm`.
  - Critic-attributed: TP-h (either critic's), `critic_cb8_E1_typePath_totals_nonneg`, `rows_identity`, `g_zero` and
    `column_inflow_clone`, re-targeted.
- **Open nodes.**
  - **(O1)** T1's double counts restated over `Sterm`/`Tterm` (the guarded object). This is mechanical.
  - **(O2) The smallest unproved lemma:** the degenerate Columns cases.
    - `α = a`: only ternary up-covers, using `hE a = ρ·T_a`, which follows from the totals.
    - `S_α = 0 < T_α`: only Boolean up-covers, and `hE α = 0` because all lower `S`, `T` vanish.
  - **(O3)** `j ≤ a → hE j = 0`.

  My instrument confirms (O2) and (O3) at four class rows.
- **The node-(a) fiber count** is not needed by T-A. It belongs to Group T-C.

**Group T-B: the literal sector image classification on `cbGraph m`. READY ONLY AS A COMPANION**, not as a standalone award.

- **Statements.** `sector_transportRel_classify` (C-T3-F) and `sector_switch_classify_full` + `erase_label_unique` /
  `switch_label_unique` (C-T3-U), exactly as compiled.
- **Carried.** The 13 C1-LA2 fragments:
  - 19 `transportRel` `b1b9ac6c…`
  - 23 `cbEdge` `84901458…`
  - 24 `cbGraph` `206cd488…`
  - 25 `cbGraph_decAdj` `dabf8061…`
  - 26 `cbVertex` `8a1b06d4…`
  - 33 `cbVertex_val` `c6accdf2…`
  - 34 `eq_cbVertex_iff` `e31d191c…`
  - 35 `cbGraph_adj_iff` `b462cedd…`
  - 36 `cbGraph_adj_iff_val` `0d82fdf8…`
  - 37 `cbGraph_adj_of_val` `07d238df…`
  - 40 `cbGraph_adj_r_choke` `bf806398…`
  - 75 `mem_neighborFinset_choke_iff` `1cca2da8…`
  - 76 `mem_neighborFinset_root_iff` `8e28d4f3…`

  Alternatively, C1-LA2 `Main.lean` whole at `a906ec17…`.
- **Fences.** These are structural facts, valid at every `m`. They are not Hall claims.
- **Why companion only.** The group proves no flow property. It becomes award-worthy only inside the sector-flow award (T-D).

**Group T-C: the E1 graph lift (D2 on `cbGraph m`). NOT READY.**

- The informal proof is complete: D2 of SR-C2-2 and the criterion key.
- The formal DAG is not written. Missing:
  - the bijection `{B r-free, choke set Q, active mark x} ↔ (Fin (8q−1) → Bool) × (Fin (8(m−q)+1) → Fin 3)`, carrying rank
    `|B| − q − 1` and weight `w_F(B) − 1`, with the literal active-tag weight;
  - the literal up-cover counts (CF3-T-1's neighbourhood-count bridge).
- **Smallest unproved lemma:** on `cbGraph m`, for `r`-free independent `B` with choke set `Q`, the number of `c`-leaves `c_ij`,
  `i ∈ Q`, not in `B` equals `a − α`, and each insertion is independent.
- The abstract fiber count `clone_fiber_card_of_le` is compiled (critic).

**Group T-D: the literal sector flow `g_sec` and its Out/In bridges. NOT READY.**

- The informal proof is complete: Lemma DF plus the critic-STATED In-sum, pending a second read.
- Compiled: the classification (T-B).
- Open: the `g_sec` definition by set difference, images in `indepFamily (cbGraph m) p*`, the leg-count lemma, the Out-bridge
  `Finset.sum`, the In-sum, the switch-image inflow, and normalization.
- **Smallest unproved lemma:** a switch image `insert u_i (B \ N(u_i))` of an independent sector `B` with `β_i = 1` is independent
  and has card `|B| − 1`. It is required for the Out sum's index set.

A bounded result never qualifies for any group. Nothing in any group is a certificate of Tier 1.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress on Tier 1's formal obligation (conjunct 4).**
- Seat-authored:
  - T1's two double counts;
  - T2's R-4 bridge, node (d) and TP-g.
- Critic-attributed:
  - TP-h, compiled twice independently;
  - the class-instance nonnegativity of the E1 totals;
  - the repaired node (a);
  - non-degenerate columns;
  - the sector classification over the carried `cbGraph m`.
- With these, the numeric core of the E1 flow (T-A) is contract-ready.

**New adversarial findings.** A false Lean statement (`clone_fiber_card`), kernel-refuted, and a wrong stated reason in T3.

**No Tier 2 statement moved.** (L-S)_top at template level and (ELIG-top)(a) are formally verified per the Cycle 2 close (carried
record). This cycle's T work is formalization of the literal-network bridges, not new Tier 2 mathematics.

**Stop gate.**
- Neither decisive event occurred in this orientation: no formal Tier 1, and no cut.
- The plateau conditions are not met: there are new compiled nodes and new adversarial findings.
- Much of the advance is critic-attributed. The controller may weigh this when judging whether T-seat routing is efficient.

## Headline assessment

headline_resolved: no
status: still_open

- **Tier 1 (E)+(H) on the class.** `still_open` at this orientation's evidence grade. The registered Tier 1 key is
  `proved_informal` from Cycle 2, which I carry and do not re-grade. I have not verified a complete informal proof of the full
  Tier 1 statement inside this capsule. My portfolio verifies components: the E1 clone transport and the sector arc accounting.
  No eligible deficient cut was produced or replayed in this orientation, so the status is not `refuted`.
- **(L-S)_top.** Template level is formally verified (C1-LA1; carried record, not re-checked here). The literal-network sector
  bridges are `proved_informal` (Lemma DF, inherited; this cycle's instruments agree at `bounded_computation`) and are not
  formalized.
- **(ELIG-top)(a).** Formally verified in C2-LA1 per the Stage 1 gate's current-state check. It was not an object of orientation T
  this cycle.
- **Conjunct 4.** Not formal. It remains the one obstruction to decisive event (a).

## Next-route allocation

**Exact remaining obligation for orientation T.** Conjunct 4 on literal `cbGraph m` at `p*` needs three things, in order:
1. T-A closed (O1–O3);
2. the E1 graph lift (T-C), which yields the E1 flow on `cbGraph m`;
3. the sector flow (T-D).

Their composition through C1-LA1's Switch/Residual and the rational-to-integral step belongs to the U orientation's terminal route.

Up to three routes:

1. **`E1-CLONE-TRANSPORT-AWARD-CLOSE`.**
   - Restate T1's double counts over T2's zero-extended `Sterm`/`Tterm`.
   - Prove the degenerate Columns cases and `hE j = 0`.
   - Assemble `cb8_E1_cloneTransport_topRank` (T-A) sorry-free over the carried C1-LA3/C1-LA1 fragments.
   - An isolated second read of the critic TP-h and nonnegativity proofs should accompany it.
   - **Could close:** Group T-A in full, as an intermediate award candidate for the Stage 7 after next cycle.
2. **`E1-GRAPH-LIFT-D2-ON-CBGRAPH`.**
   - Over the carried C1-LA2 layer, state and prove the literal clone correspondence (T-C). This also serves as CF3-T-1's
     neighbourhood-count bridge.
   - First target: the Boolean and ternary up-cover counts `a − α` and `2(b − ℓ')` for `r`-free independent `B` with choke set `Q`.
   - Then the weight identity `w_F(B) = α + 1`, where `F = leafSet` is carried from C2-LA3.
   - **Could close:** the up-cover count lemmas and the rank/weight map sorry-free. The full bijection is possible but not
     assured in one cycle.
3. **`SECTOR-GSEC-LEAN-OUT-IN-BRIDGES`.**
   - Carry T-B.
   - Define `g_sec` by set difference.
   - Prove: switch and deletion images lie in `indepFamily`; the leg-count lemma; the Out bridge via `Finset.sum_image` with label
     uniqueness; the In-sum after its second read; the switch-image inflow; normalization by `Out(B) ≥ 1`.
   - **Could close:** the Out bridge and leg-count sorry-free, likely the In-sum. This is the sector half of conjunct 4 in
     scratch, ready for U's terminal composition.

The next cycle should register nothing from these routes without a governed award and an isolated second read.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-adj-T/`.

Conventions:
- Every Python run used `python3 -B`, standard library only.
- Every Lean run happened after `cd` into a copied project, with `.lake/packages` symlinked to the pinned shared Mathlib. I ran no
  `lake update` or `lake clean`.
- No sealed member was edited, and nothing was written outside this scratch directory and this file.

| Path | SHA-256 / result | Role |
|---|---|---|
| `adj_t.py` | `7e0f338ad1ca2c4e2c1c92419d8b0704443041c730f959cda6941111a566867d` | my instrument. IMPORT LIST: `fractions`, `math`, `json`, `hashlib`, `sys` |
| `adj_t.out.json` | `5fd48d45129a075e1d3f05535c3fe4e817b6280c6bec4bfa7870350d2fe9a5a3` (payload `97344a652965782b6a593de32ea076efe1092c8bc8d3d1bae53568c0fa579591`) | clone-transport, truncated-`N` and `ρ_1(107)` checks at 107, 110, 125, 140 |
| `t1/LeanProject/` (T1 `CloneQuotient.lean`, `Check.lean`; C-T1-F `Advance.lean`, `Falsify.lean`; C-T1-U `CriticT1U.lean`, `CriticT1UColumn.lean`) and `t1/*.out` | build OK; `check.out` byte-identical to T1's `axiom-check.out.txt` | T1 and T1-critic Lean replay |
| `t2/LeanProject/LeanProof/{Main,CriticF,CriticU}.lean` and `t2/*.out` | `c11f62aa…`, `cbed43aa…`, `11c4407b…`; all exit 0, 0 errors, no `sorry` | T2 and T2-critic Lean replay |
| `t2/carry-check.txt` | 24/24 true | T2 carry byte-identity and digest check |
| `t3/py/REPLAY-OUT.json` | `90646e87cf8fec24d293ab461c2090735fb0d3cff552553be1298f07b74b4964` (= T3's `OUT.json`) | T3 generator replay |
| `t3/F/` (C1-LA2 `Main.lean` `a906ec17…`, `CriticT3F.lean` `0db39495…`) and `t3/U/` (`CriticAdvance.lean` `1f3f365d…`, `Carried/`) with `critic.out` | exit 0; axioms match the shipped logs | T3-critic Lean replay; 13/13 C-T3-U carries verified |
| `replay-cT3U/CRITIC-OUT.json` | `f11493e7d26ff516d5a4fe14ad7ef3bc5d63f461c1a427380043fb34fd774291` (= C-T3-U's) | C-T3-U instrument replay |
| `gen/t1_corroborate.out.json`, `gen/verify_t2.out.json` | `20ec5278…`, `82c2623d…` (= originals) | T1 and T2 generator replays |

**Jobs.** One background job was started: the replay of C-T3-U's instrument (PID 15096). It exited before this write, and
`pgrep` shows nothing of mine running. Every Lean job ran to completion in the foreground or under `wait`. Nothing needed to be
killed. I reread this file before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
