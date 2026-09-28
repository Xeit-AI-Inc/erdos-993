# C3 center formalization proposal

The complete candidate at `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center/EVIDENCE/development/Candidate.lean` compiled with pinned Lean 4.32.2 and Mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`. Its terminal theorem statement matches the contract's `expected_statement` byte for byte, including SHA-256 `ea8fdc2956d3e883f671c69777d903114a69003ab1a370a33c02a08a199882e6`. All nine run-relative manifest members matched their recorded SHA-256 hashes; the local cache-audit receipt also matched. The registered independent informal audit is passed.

Proposal files, in dependency order:

1. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center/PROPOSALS/01-e993CenterProduct.lean`
2. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center/PROPOSALS/02-e993_center_product_expansion.lean`
3. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center/PROPOSALS/03-e993_center_subset_coeff.lean`
4. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center/PROPOSALS/ORDER.json`

Reproduce development checking on `mini-away` from the run's `LeanProject` directory:

```sh
R=/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c3-center
cd "$R/LeanProject"
PATH=/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin:/usr/bin:/bin /Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake env lean "$R/EVIDENCE/development/Candidate.lean"
```

`EVIDENCE/development/compile-02.log` is empty after successful compilation. `compile-01.log` retains the earlier diagnostics. Compiling `EVIDENCE/development/Axioms.lean` also succeeded; `compile-03-axioms.log` reports only `propext`, `Classical.choice`, and `Quot.sound`.

This is development checking only. The controller still needs to register the fragments, perform governed kernel verification, and obtain the assigned independent fidelity review. No formal award or broader Erdős 993 result is claimed.
