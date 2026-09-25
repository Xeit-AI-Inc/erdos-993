# Informal proof — award `C1-LA4`, the descent order bounds (LB), (R5), (XR)

Run `lean-2026-09-25-c1-la4-descent-order-bounds`. Producer `c1-la4-formalizer-opus-20260925`.
Statement of record: `cycles/cycle-1/stage6/SYNTHESIS.md` `## Lean awards`, "C1-LA4";
`SOLUTION-CONTRACT.md` §2; `SEMANTIC-CONTRACT.md` §1–§2.

**Grade on the face.** This award is COMPOSED WITH `C1-LA1`'s kernel-verified source: the whole of
`C1-LA1`'s `Main.lean` (55 registrar entries) is carried into this single-source project, and the
unconditional degree lemma (DL) and extension inequality (EX) are `C1-LA1`'s. `C1-LA1`'s independent
reviews are still running. **The grade of `C1-LA4` follows `C1-LA1`'s close**: `C1-LA4` can be
`formally_verified` only once `C1-LA1` closes `formally_verified`. This run's own status is
`compiled-candidate`.

---

## 0. The three statements

All three are declared in namespace `Erdos993G1`, UNCONDITIONAL — no `DlHyp` binder survives on any
face (brief R9). Hypotheses are finiteness and acyclicity only.

```lean
lemma forest_descent_linear_bound {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (k : ℕ) (hneg : Erdos993G1.delta G (k : ℤ) < 0) : Nat.card X ≤ 4 * k

lemma forest_rank5_ceiling_20 {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (hn : 21 ≤ Nat.card X) : 0 ≤ Erdos993G1.delta G 5

theorem forest_descent_restriction {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (r : ℕ) (hx : firstDescent G < r) : Nat.card X ≤ 4 * r - 4
```

`forest_descent_restriction` is the ONE terminal `theorem` of the run. The first two carry the
`lemma` keyword, which the registrar requires of a non-terminal entry; `lemma` and `theorem` are the
same declaration in Lean 4, and the statement text is otherwise character-for-character
`SOLUTION-CONTRACT.md` §2.

## 1. Definitions of record used

| symbol | Lean name | source |
|---|---|---|
| `i_k(G)` | `Erdos993G1.indepCount G k : ℤ` = `(Nat.card {S : Finset V // G.IsNIndepSet k S} : ℤ)` | r25 award entry 1, carried byte-identically |
| integer-indexed zero extension | `Erdos993G1.coeff G (k : ℤ)` = `if 0 ≤ k then indepCount G k.toNat else 0` | r25 award entry 2, byte-identical |
| `Δ_k(G)` | `Erdos993G1.delta G k` = `coeff G (k+1) - coeff G k` | r25 award entry 3, byte-identical |
| `e(J)` | `Erdos993G1.e G J` = `(Finset.univ \ (J ∪ J.biUnion (G.neighborFinset ·))).card` | `C1-LA1` entries 4–6 |
| `D_k(G)` | `Erdos993G1.indepDegreeSum G k` = `∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v` | `C1-LA1` entry 7 |
| `x(G)` | `Erdos993G1.firstDescent G` = `Nat.find (exists_delta_neg G)` | `C1-LA3` entry 9, byte-identical |

No G1 definition is re-stated anywhere in this project (brief R1). The six declarations that this
run shares with the frozen r25 award source (`indepCount`, `coeff`, `delta`,
`indepCount_eq_card_indepSetFinset`, `coeff_nat`, `delta_nat`) reproduce that source's registrar
entry digests exactly; see `CAPSULE-VERIFICATION.json` → `r1_g1_definitions_of_record`.

`firstDescent` is well defined because `exists_delta_neg` holds for every finite graph: `i_0 > 0`
(the empty set is an independent `0`-set), `i_{n+1} = 0` (no `(n+1)`-subset of an `n`-element type),
and if no `Δ_j` were negative the sequence `i_j` would be monotone from `i_0 > 0`, contradicting
`i_{n+1} = 0`. By proof irrelevance `Nat.find` does not depend on which proof of the existential is
supplied, so this `firstDescent` is the same function as `C1-LA3`'s and U1's.

## 2. Where each hypothesis enters

- **Finiteness** enters EVERYWHERE. The three faces are stated on `[Finite X]` with `Nat.card X`;
  every step that needs a `Finset` computation crosses to `[Fintype X]` by `Fintype.ofFinite X`
  under `classical`, exactly as `C1-LA3`'s `critic_lb_of_ex` does. The crossing is sound because
  `Nat.card X = Fintype.card X` under `Fintype.ofFinite` (`Nat.card_eq_fintype_card`), which the
  carried body proves as `hcard` and uses only in that direction.
- **Acyclicity (`hG : G.IsAcyclic`) enters EXACTLY ONCE**, through (DL), inside `C1-LA1`'s carried
  proof. Concretely: `C1-LA1`'s rooting API uses acyclicity only at
  `Erdos993G1.rootPath_unique` (uniqueness of the path to the component root, from
  `SimpleGraph.IsAcyclic.path_unique`), from which `par_or`, `rk_par_lt`, `par_par_ne` and the
  swap-map injection follow; those give (RC) and then (DL). Everything downstream of (DL) —
  the double count, the per-set extension bound, (EX), (LB), (R5), (XR) — is unconditional on
  acyclicity and simply transports `hG` to that one use. Nothing in §3–§5 below uses acyclicity
  again.
- **No other hypothesis exists.** There is no `DlHyp` binder, no size hypothesis beyond the one each
  face states, no connectivity and no decidability hypothesis on the face (`DecidableRel G.Adj` is
  produced classically inside).

## 3. (DL) ⇒ (EX): carried unchanged from `C1-LA1`

Statement (DL), `Erdos993G1.forest_degree_lemma` (`C1-LA1` entry 54):
for every finite forest and every `k`, `(D_k(G) : ℤ) ≤ 2k · i_k(G)` — an AVERAGE over `I_k(G)`;
it bounds no individual independent set's incident degree (`SOLUTION-CONTRACT.md` §3.3).

Statement (EX), `Erdos993G1.forest_extension_inequality` (`C1-LA1` entry 55):
`n · i_k ≤ (k+1) · i_{k+1} + 3k · i_k` in `ℤ`.

The derivation (all of it carried): the double count
`(k+1)·i_{k+1} = Σ_{J ∈ I_k} e(J)` (entries 26–29 here), the per-set bound
`e(J) + |J| + Σ_{v ∈ J} deg(v) ≥ n` and its `ℤ` form `e(J) ≥ n − k − Σ_{v∈J} deg(v)`
(entries 30–32), summed over `I_k` and combined with (DL) by `linarith`.

`C1-LA4` does not re-derive any of this. It carries `C1-LA1` whole.

## 4. (EX) ⇒ (LB)

Assume `Δ_k(G) < 0`.

1. `delta_nat` gives `Δ_k = i_{k+1} − i_k` in `ℤ`, so `i_{k+1} < i_k`.
2. `pos_indepCount_of_delta_neg`: `i_{k+1} ≥ 0` (it is a cast cardinality), so `Δ_k < 0` forces
   `i_k > 0`. **This is the step that makes the cancellation in 5 legitimate.**
3. `(k+1) · i_{k+1} ≤ (k+1) · (i_k − 1)`, since `i_{k+1} ≤ i_k − 1` in `ℤ` and `k+1 > 0`.
4. (EX) at this `k`: `n · i_k ≤ (k+1) · i_{k+1} + 3k · i_k ≤ (k+1)(i_k − 1) + 3k · i_k
   < (4k+1) · i_k` (the last step is `nlinarith`; the slack is exactly the `−(k+1) < 0` term).
5. Cancel the positive `i_k`: `n < 4k + 1` in `ℤ`, i.e. `n ≤ 4k`, and `Nat.card X ≤ 4 * k` in `ℕ`.

`k = 0` is included: `Δ_0 < 0` means `i_1 < i_0 = 1`, so `i_1 = 0`, which forces `n = 0 ≤ 0`.

Body carried byte-identically from `C1-LA3` entry 16 (`critic_lb_of_ex`, critic `C-U1-T`).

## 5. (LB) ⇒ (R5) and (LB) ⇒ (XR)

**(R5).** Contrapositive of (LB) at `k = 5`: if `Δ_5(G) < 0` then `n ≤ 20`, contradicting
`21 ≤ n`; hence `0 ≤ Δ_5(G)`. The only technical content is the cast bridge between the face's
integer literal `Erdos993G1.delta G 5` and (LB)'s `Erdos993G1.delta G ((5 : ℕ) : ℤ)`, discharged by
`exact_mod_cast`. Body carried byte-identically from `C1-LA3` entry 17.

**(XR).** Let `x = firstDescent G`. The spec `firstDescent_spec` gives `Δ_x(G) < 0`, so (LB) gives
`n ≤ 4x`. The hypothesis `hx : x < r` gives `x ≤ r − 1`, hence `n ≤ 4(r−1) = 4r − 4`.
Body carried byte-identically from `C1-LA3` entry 18.

Note that (XR) uses only the SPEC of `firstDescent` (that it is a descent), never its minimality.
Minimality is what makes `x` the *first* descent and is what the statement's reading depends on, but
the inequality itself does not consume it.

## 6. ℕ/ℤ cast audit

| place | direction | justification |
|---|---|---|
| `i_k : ℤ` defined as `(Nat.card … : ℤ)` | ℕ → ℤ | definition of record; `i_k ≥ 0` always, used in §4.2 |
| `indepCount_eq_card_indepSetFinset` | ℤ = ↑ℕ | `Nat.card_eq_fintype_card` + `Fintype.card_subtype`; needs `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` |
| `delta_nat`, `coeff_nat` | ℕ index → ℤ index | `coeff G ((k:ℕ):ℤ) = indepCount G k` since `0 ≤ (k:ℤ)`; no truncation |
| `Nat.card X = Fintype.card X` | ℕ = ℕ | under `Fintype.ofFinite X`; used left-to-right only |
| §4.5 `(n : ℤ) ≤ 4 * (k : ℤ)` → `Nat.card X ≤ 4 * k` | ℤ → ℕ | `exact_mod_cast`; both sides are casts of naturals, so no truncation |
| (R5) `delta G 5` vs `delta G ((5:ℕ):ℤ)` | literal bridge | `exact_mod_cast`; `((5:ℕ):ℤ) = (5:ℤ)` |
| **(XR) `4 * r - 4`** | **ℕ truncated subtraction** | see below |

**The one truncated subtraction.** `Nat.card X ≤ 4 * r - 4` is ℕ-subtraction ON THE FACE, by
contract (brief R8). It is honest, not clamped:

- `hx : firstDescent G < r` forces `1 ≤ r`. For `r ≥ 1`, `4 * r - 4 = 4 * (r - 1)` exactly, and the
  proved inequality is `n ≤ 4·firstDescent G ≤ 4(r−1)`, which is the intended real-number content.
- `r = 0` is never reached: `firstDescent G < 0` is false in ℕ. The `r = 0` instance of the
  statement is therefore **vacuous-hypothesis-sound**: it is true because its hypothesis is
  unsatisfiable, NOT because `4 * 0 - 4 = 0` was used to clamp a false bound. No inequality is
  weakened or strengthened anywhere by truncation.
- The carried `critic_xr_of_lb` discharges both cases with a single `omega`, which is a complete
  decision procedure for linear ℕ arithmetic with truncated subtraction, so the audit is
  mechanically checked and not merely asserted here.

## 7. Carry table

`CAPSULE-VERIFICATION.json` → `entry_table` is the machine copy with full SHA-256 values.
`=` byte-identical, `~` re-derivation.

| entries | origin | status |
|---|---|---|
| 1–16 | `C1-LA1` entries 1–16 (`Main.lean` `b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a`) | `=` |
| 1–3 also | frozen r25 award `sources/r25/c4-forest-descent-order-bound/…/Main.lean` (`736eb9df…7dfe0`) entries 1–3 | `=` (digests reproduced) |
| 17–21 | `C1-LA3` entries 5–9 (`DlHyp`, `ExHyp`, `LbHyp`, `R5Hyp`, `XrHyp` + `exists_delta_neg`, `firstDescent`), pinned `Main.lean` `cae9396136d9609bc3d086140e7c0e135ad0bf127fab48d22b58b850411f3a30` | `=` |
| 22–59 | `C1-LA1` entries 17–54 | `=` |
| 60 | `C1-LA1` entry 55, `forest_extension_inequality` | `~` **keyword-only re-derivation**: the single token `theorem` → `lemma`; every other byte identical. The registrar admits exactly one terminal `theorem`, which here is `forest_descent_restriction`. Origin `9a2d591f…8218be`, carried `ce29cda6f2f5…` |
| 61–62 | `C1-LA3` entries 11–12 (`coeff_nat`, `delta_nat`); also r25 award entries 5–6 | `=` (both digests reproduced) |
| 63 | `C1-LA3` entry 14 (`pos_indepCount_of_delta_neg`, `delta_firstDescent_neg`, `firstDescent_spec`) at the R7-pinned digest `03c82b20…82195` | `=` against the pinned version; see the drift record below |
| 64 | IN-RUN `dl_holds`, `ex_holds` | authored |
| 65–67 | `C1-LA3` entries 16–18 (`critic_lb_of_ex`/`lb_of_ex`, `critic_r5_of_lb`/`r5_of_lb`, `critic_xr_of_lb`/`xr_of_lb`) | `=` |
| 68 | IN-RUN `lb_holds`, `r5_holds`, `xr_holds` | authored |
| 69–71 | IN-RUN the three award faces | authored |

Rows 10–16 of the Stage 7 carry list are CRITIC-attributed and rows 17–19 ADJUDICATOR-attributed;
that attribution travels on the face of every declaration carried from them (entries 63, 65–67 here
are critic `C-U1-T`'s advances as compiled by seat U3 in `C1-LA3`, with the U adjudicator's
`firstDescent` reconciliation). **No external Lean text is carried anywhere in this run**
(Gate ruling 3): `sources/external/lean-source/` was never opened, and no declaration here descends
from it. The three renames `indepFinsets → r27IndepFinsets`, `mem_indepFinsets →
mem_r27IndepFinsets`, `degOn → r27DegreeIn` therefore have nothing to apply to: U2's file (row 8)
is not carried.

### Sibling-run drift recorded during this run

`C1-LA3`'s `Main.lean` was rewritten by that run while `C1-LA4` was working (digest
`cae93961…` → `23d9a163…`); controller fact CF-LA4-1 identifies this as `C1-LA3`'s completed
repair round 1. The change is **docstring prose only, in entry 14**: with the `/-- … -/` blocks
removed the old and new fragments are byte-identical, and the three Lean declarations, their
binders, statements and proof scripts are unchanged. `C1-LA4` carries the version pinned by the
brief's R7 digest, which is the version it read; the pinned file has been reconstructed
byte-exactly and stored as `EVIDENCE/carried-sources/C1-LA3-Main.lean.pinned-cae93961` (it hashes
to `cae93961…`, which is itself the proof that entry 14 is the only difference). `C1-LA3`'s run
root was not written to. **Citation rule followed: this run cites the copy it actually read, by
digest `cae9396136d9609bc3d086140e7c0e135ad0bf127fab48d22b58b850411f3a30`.**

### Controller fact CF-LA4-1

`control/C1-STAGE7-CONTROLLER-FACTS-LA4.json` was conveyed to this seat mid-dispatch. It is NOT a
member of the sealed capsule, and it is not cited as evidence anywhere in this run. It was
verified. It states that `C1-LA3` declares `Erdos993G1.forest_extension_inequality` in the
conditional (`hDL`) form under `C1-LA1`'s name, that `C1-LA1`'s is the one to carry, that
`C1-LA3`'s conditional copy and `ex_of_dl` must not be carried, that `lb_of_ex`, `r5_of_lb`,
`xr_of_lb` and the `firstDescent` layer may be carried byte-identically, and that the repair round
above should be cited by the digest actually read.

This seat had already established the collision independently, by reading both `Main.lean` files,
before the fact arrived, and the route described in §8 was already the route taken. The fact
confirmed it in every particular and changed nothing. The evidence for the collision in this
document is the two files' own text, not the controller's statement.

## 8. Composition route, and why the preferred route was not available

Brief R10 names a preferred route: one project carrying all 55 `C1-LA1` entries AND `C1-LA3`'s
`DlHyp`…`XrHyp`, `firstDescent` layer and `degree_lemma_implies_chain`, then discharging `DlHyp`
from `forest_degree_lemma`.

That is impossible without dropping an entry, because of a hard name collision:

- `C1-LA1` entry 55 declares `Erdos993G1.forest_extension_inequality` UNCONDITIONALLY
  (`(G) (hG) (k)`).
- `C1-LA3` entry 13 declares a DIFFERENT `Erdos993G1.forest_extension_inequality`, the
  (DL)-conditional form `(k : ℕ) (hDL : …)`, inside its carried U3 counting block.

The two cannot coexist in one Lean file. `C1-LA3`'s `ex_of_dl` (entry 15) calls the conditional
form, and `degree_lemma_implies_chain` (entry 19) calls `ex_of_dl`; so keeping `C1-LA1`'s entry 55 —
which the brief requires ("all 55") and which is the stronger, unconditional statement — blocks
`C1-LA3` entries 13, 15 and 19.

**Route taken: the direct route of R10's second clause, executed with the maximum byte-identical
carry the collision allows.** Entries 13, 15 and 19 of `C1-LA3` are not carried; entry 13's other
ten declarations are DEDUPLICATED against `C1-LA1` entries 17–27, which carry the same bodies from
the same U3 source (`C1-LA1`'s copies are the ones registered; `C1-LA3`'s differ from them only in
the `theorem`/`lemma` keyword and the section layout, which R10 records as a re-derivation).
The three deductions are NOT re-derived: `critic_lb_of_ex`, `critic_r5_of_lb`, `critic_xr_of_lb`
and their `Prop`-to-`Prop` wrappers `lb_of_ex`, `r5_of_lb`, `xr_of_lb` are carried byte-identically
from `C1-LA3` entries 16–18, which is stronger than the direct route requires.

Only the two composition steps are authored in-run:

```lean
lemma dl_holds : DlHyp.{u} := by intro X _ _ G _ hG k; exact forest_degree_lemma G hG k
lemma ex_holds : ExHyp.{u} := by intro X _ _ G _ hG k; exact forest_extension_inequality G hG k
lemma lb_holds : LbHyp.{u} := lb_of_ex ex_holds
lemma r5_holds : R5Hyp.{u} := r5_of_lb lb_holds
lemma xr_holds : XrHyp.{u} := xr_of_lb lb_holds
```

`ex_holds` stands in for `C1-LA3`'s `ex_of_dl` and reaches the same `Prop` by the shorter path,
since (EX) is already unconditional in this project. `dl_holds` is the brief's
`have hDL : DlHyp.{u} := fun G hG k => forest_degree_lemma G hG k` recorded as a declaration; it is
registered for the dependency graph and is not consumed downstream, because routing (EX) through
(DL) a second time would add nothing. The `Prop` abbreviations quantify over `Fintype`/`Finite`
INSTANCES, which is critic `C-U3-F`'s caveat: a (DL) proved at one fixed instance would not compose;
`C1-LA1`'s is instance-general, so it does.

## 9. Attribution (travels on every face)

- **Fang, Lu, Nevo, Yao, Zheng**, *Unimodality of Independence Polynomials for Sufficiently Large
  Forests*, arXiv:2609.20961v1 (17 September 2026), §8 — the mathematics of (DL) (Lemma 8.1,
  consequence (8.3)) and of Proposition 8.2's displayed inequality and its consequence.
- **FRESH-LEAD lane 11** (the literature map) — the conditional deductions (LB), (R5), (XR).
- **Seat T3** — the r27 derivations.
- **Critics `C-U1-T`, `C-U3-T`, `C-U3-F`, `C-U1-F` and seat U3** — the compiled deduction chain,
  award `C1-LA3`; the U adjudicator — the `firstDescent` reconciliation.
- **`C1-LA1`'s formalizer and critic `C-F1-T`** — the (DL) proof and the rooting/swap-map argument
  carried here, and (EX).

## 10. Excluded conclusions and fences

1. (LB), (R5), (XR) are ORDER BOUNDS whose contrapositives have sign `Δ_k ≥ 0`. **None is a
   no-recovery statement.** None transfers status to `E993-R25-UNR-FOREST-WIDE`,
   `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the aggregates, or Erdős #993.
2. Nothing asymptotic is asserted: no `N₀`, no CLT, no "sufficiently large forests are unimodal".
3. **(XR) is NOT a uniform bound on `d`.** At `n = 2r + d` it reads `d ≤ 2r − 4`, a bound that grows
   with `r`.
4. Nothing is asserted about `Δ_k` for `n > 4k` beyond the sign.
5. **Nothing about sharpness.** The census maxima are a separate census-grade record; no claim here
   is that `4k`, `20` or `4r − 4` is attained.
6. Nothing about non-forests. (DL) is an average over `I_k(G)`; no pointwise degree statement is
   registered (§3.3 of the solution contract).
7. The r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`Δ_k < 0 ⇒ n ≤ (k+1)²`, `k ≥ 1`) is
   **unchanged** and stays registered at its own statement. (LB) strengthens it as a SEPARATE key
   (`4k ≤ (k+1)²` always, strictly for `k ≥ 2`).
8. The consequences others may draw from (R5) — that the stated residue of
   `E993-R25-RANK5-CEILING-SHARPENED-TO-25` (orders 22–25, ≥ 3 branch vertices) is empty, and the
   extension of the r25 K₁-addition closure to `x ≤ 5` — are SEPARATE records whose grade is bounded
   by their weakest input (the r25 order-≤21 census is bounded computation, never
   `formally_verified`). This run registers none of them.
9. Sealed r25/r26 records are never edited; corrections are records and scope notes.
10. `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is not a premise anywhere.

## 11. What this document is not

This is the statement-level informal proof required by brief R5. It is not an independent
proof-integrity audit, not a kernel receipt and not a fidelity review. Lean certifies only the exact
formal declarations; that the Lean statements faithfully represent `SOLUTION-CONTRACT.md` §2 is the
independent fidelity reviewer's question, not this document's claim.
