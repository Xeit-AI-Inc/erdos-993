# Order-26 TRS2 Witness — Kadrawi–Levit Spiders

Replayable evidence that **universal tree TRS2 is refuted**: the proposition
"every finite tree's independence sequence is TRS2" is false, by exact finite
witness. See the [erratum of record](../../docs/erratum-2026-09-03-universal-tree-trs2.md).

## The two-step refutation

1. The kernel-checked r8 theorem `trs2_iff_adjacentLogConcave`
   ([`proofs/lean/r8-trs2`](../../proofs/lean/r8-trs2/ManagedC8U104/Main.lean))
   proves that for a nonzero sequence with positive interval support, TRS2 is
   exactly adjacent log-concavity. Every tree's independence sequence has
   positive interval support (each rank up to α is realized by a subset of a
   maximum independent set), so tree TRS2 is exactly log-concavity of the raw
   independence sequence.
2. The Kadrawi–Levit spider T(3,4,4) — a center whose three children carry
   3, 4, and 4 pendant 2-paths; 26 vertices ([arXiv:2305.01784](https://arxiv.org/abs/2305.01784)) —
   has independence sequence ending `…, 2979, 51, 1` with
   `51² − 2979·1 = −378 < 0` at rank 13. Its sequence is not log-concave,
   hence not TRS2. It **is** weakly unimodal, so the headline conjecture is
   untouched.

## Artifacts

| file | sha256 |
|---|---|
| `check_kl_witness.py` | `2cd7c61222463ce26ce51ab9722ccdd481957a0f1f92e23cf3ee7db6e228aecd` |
| `witness-report.json` | `c995a1dde1c573e77468b414eb5e8b974daf2dc2b54e54b3ad3613b0c62b16ea` (regenerate: `python3 check_kl_witness.py > witness-report.json`) |

The script is deterministic, stdlib-only, exact-integer. It also confirms:

- **Controls hold**: T(3,3,3), T(3,3,4), T(2,4,4) are log-concave — consistent
  with the source paper's exhaustive finding that all trees through order 25
  are log-concave (external computational claim, not reproduced here).
- **The failure persists in the family**: T(3,4,5), T(3,5,5), T(3,5,6),
  T(4,4,4) all fail log-concavity at the top ranks while remaining unimodal.
- **The r11 corridor ingredient targets survive the witnesses**: theorem
  targets (A) and (B) of
  [`proofs/lean/r11-ingredient-reductions`](../../proofs/lean/r11-ingredient-reductions/README.md)
  hold on every case above, through order 32. This is instance-level evidence
  only, never universal; its significance is that the corridor program's named
  targets are not killed by the same witnesses that kill TRS2.

Two independent implementations (this script and a separate audit
implementation) produced identical integers for every case.

## Standing rule for future invariants

Any proposed transfer invariant must be tested against these witnesses
before proof search: it must **hold** on the T(3,k,k) / T(3,k,k+1) family
(they are unimodal) while being strong enough to survive convolution.
