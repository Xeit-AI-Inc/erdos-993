# Erratum (2026-09-03): Universal Tree TRS2 Is Refuted, Not Open

## The correction

Several documents in this repository, as published through commit `672c247`,
stated that the proposition

```text
every finite tree's independence sequence is TRS2
```

was **open**, and recommended a structural proof of it (`STATUS.md`;
`docs/three-engine-status-2026-09-02.md`; `experiments/r10-trs2-bt-closure.md`;
`proofs/README.md`). That status was wrong. The proposition is **refuted**:

1. The repository's own kernel-checked theorem `trs2_iff_adjacentLogConcave`
   ([`proofs/lean/r8-trs2`](../proofs/lean/r8-trs2/ManagedC8U104/Main.lean))
   identifies TRS2, on a nonzero sequence with positive interval support, with
   adjacent log-concavity. A tree's independence sequence always has positive
   interval support, so tree TRS2 is exactly log-concavity of the raw
   independence sequence.
2. Kadrawi and Levit ([arXiv:2305.01784](https://arxiv.org/abs/2305.01784) —
   reference 4 of this repository's own bibliography) exhibit trees of order
   26 whose independence sequences are not log-concave, with infinite families
   behind them. The witness T(3,4,4) fails at rank 13 with deficit −378;
   replayable exact computation is published at
   [`evidence/kl-order26-trs2-witness`](../evidence/kl-order26-trs2-witness/README.md).

No additional search, induction, or Lean theorem is needed to decide the
universal proposition. The witnesses are weakly unimodal, so **no headline
status changes**: TREE, FOREST, TRANSFER, and the counterexample question all
remain open exactly as before.

## What this does and does not invalidate

**Every Lean theorem in this repository remains valid at its stated scope.**
The error was a status label and a research recommendation, not a proof.

Retained at full value:

- the abstract TRS2 ⟺ adjacent-log-concavity equivalence and the TRS2
  convolution closure (`r8-trs2`, `r8-scp-convolution`);
- the rooted extension-profile recurrences, the tree-sequence admission, and
  the coefficient correspondence (`r10-*`);
- `transfer_to_forest` (`r10-transfer-to-forest`) **as a conditional
  theorem**: if every component tree of a forest is TRS2, the forest is.

Retired as research directions:

- proving universal tree TRS2, and any invariant search whose conclusion is
  universal tree TRS2;
- treating zero TRS2 failures through order 20/21 as bearing on the universal
  question (the first failures have order 26, above every census horizon used);
- the closing recommendation of `experiments/r10-trs2-bt-closure.md` that the
  universal branch "needs a structural proof idea."

The classical route "all trees log-concave → products log-concave → all
forests unimodal" is closed, and has been closed in the literature since 2023.

## A bounded corollary that survives

`transfer_to_forest` composed with Kadrawi–Levit's exhaustive computation
(all trees through order 25 are log-concave — an external computational claim,
cited, not reproduced here) yields, at bounded computational tier:

```text
every forest all of whose components have at most 25 vertices
has a log-concave, hence weakly unimodal, independence sequence.
```

Consequently a minimal forest counterexample to unimodality must contain a
component of order at least 26. This is the correct use of the conditional
theorem: per-forest, with the premise verified per component — never with the
false universal premise.

## The corridor program is not affected

The independent first-recovery/corridor program (r9 and r11) targets the
minimal counterexample to **unimodality** and assumes log-concavity nowhere:
its sealed terminal reconciliation contains no log-concavity hypothesis, and
the r11 ingredient targets (A) and (B) hold on every Kadrawi–Levit witness
tested through order 32 (instance-level evidence only; see the witness
evidence directory). The order-26 family is henceforth a **mandatory
adversarial fixture**: every future invariant or ingredient claim must be
tested against it before proof search.

## How the error happened

An external review (Kevin Vallier's research group, 2026-09-03) flagged the
contradiction; two independent internal audits then confirmed it and traced
the history. In brief: the program's **first** run (2026-08-25) imported the
Kadrawi–Levit witnesses in its opening cycle and recorded universal tree
log-concavity as a *refuted mechanism* in its terminal ledger. On 2026-08-31 a
later run coined the name TRS2, proved the equivalence to log-concavity, and —
its isolated source capsule carrying neither the witness nor the old ledger
row — re-entered the universal question as *open*. The rename broke claim
identity; no reconciliation rule forced the earlier refutation forward; worker
isolation prevented recovery; and a subsequent six-cycle run built its search
program on the false-open status, searching only below the known witness
order. The full forensic record, with line-level citations, is retained in the
program's internal archive; corrective controls (canonical claim aliasing,
monotone refutation precedence, capsule coverage audits, a universal-claim
counterexample gate, and fail-closed handling of out-of-corpus evidence gaps)
are adopted for all future runs.

## Corrected status ledger

| Claim | Status | Reason |
|---|---|---|
| TRS2 ⟺ adjacent log-concavity (nonzero, positive interval support) | governed, verified | kernel-checked r8 theorem |
| Every finite tree is TRS2 | **REFUTED** | exact order-26 witnesses (Kadrawi–Levit) |
| TRS2 closed under convolution | governed, verified | kernel-checked r8 theorem |
| All components TRS2 ⟹ forest TRS2 | governed, conditional | r10 `transfer_to_forest` |
| Universal tree TRS2 + closure ⟹ all forests unimodal | valid implication, **false premise** | cannot establish FOREST |
| Forests with all components ≤ 25 vertices are unimodal | bounded corollary | conditional theorem + cited exhaustive computation |
| TREE / FOREST / TRANSFER / counterexample | open | unchanged; non-log-concave does not mean non-unimodal |
