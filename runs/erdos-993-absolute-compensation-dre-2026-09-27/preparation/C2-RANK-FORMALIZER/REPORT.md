# C2 rank formalizer handoff

The exact contract theorem `e993_rank_any_strict_descent` compiled in a development Lean check. Its statement SHA-256 is `d04776272178640e26f7a28a630330b1a17eb3dd95b86cd0faf670fbb5def75f`, matching the contract. The compiled declaration uses only `propext`, `Classical.choice`, and `Quot.sound` according to Lean's `#print axioms` output.

The proposal contains 3 definitions, 32 lemmas, and exactly one terminal theorem. It formalizes coefficientwise nonnegativity, weighted differential product and sum rules, local certificates for arities 2/3/4, list products, the parent polynomial, coefficient extraction, and the strict-drop contradiction. The assigned differential weight is `rs.sum + 1`; no degree equality is assumed. The empty list and zero-extended coefficients are covered.

## Development evidence

- Exact proposal assembly: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/EVIDENCE/development/Assembled.lean` (SHA-256 `7272310bc1a0f7683347f48127a06fb97383ac21e97dc69d8dfa2417d27669dc`).
- Compilation log: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/EVIDENCE/development/check-assembled.log` (empty; Lean exited 0).
- Axiom log: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/EVIDENCE/development/check-axioms.log` (first line reports the three permitted axioms).
- The theorem statement and compiled assembly were checked against the contract hash, and the assembly was confirmed byte-for-byte against the ordered remote fragments. No fragment contains `sorry`, `admit`, `native_decide`, or a custom `axiom` declaration.

## Exact proposal paths

Order file: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/ORDER.json`.

- `definition` `e993NN`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/01-e993NN.lean.fragment`
- `definition` `e993D`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/02-e993D.lean.fragment`
- `definition` `e993RankParent`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/03-e993RankParent.lean.fragment`
- `lemma` `e993NN_add`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/04-e993NN_add.lean.fragment`
- `lemma` `e993NN_mul`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/05-e993NN_mul.lean.fragment`
- `lemma` `e993NN_one`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/06-e993NN_one.lean.fragment`
- `lemma` `e993NN_X`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/07-e993NN_X.lean.fragment`
- `lemma` `e993NN_nat`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/08-e993NN_nat.lean.fragment`
- `lemma` `e993NN_pow`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/09-e993NN_pow.lean.fragment`
- `lemma` `e993D_mul`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/10-e993D_mul.lean.fragment`
- `lemma` `e993D_add`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/11-e993D_add.lean.fragment`
- `lemma` `e993C2`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/12-e993C2.lean.fragment`
- `lemma` `e993C3`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/13-e993C3.lean.fragment`
- `lemma` `e993C4`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/14-e993C4.lean.fragment`
- `lemma` `e993D_G`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/15-e993D_G.lean.fragment`
- `lemma` `e993D_B2`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/16-e993D_B2.lean.fragment`
- `lemma` `e993D_B3`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/17-e993D_B3.lean.fragment`
- `lemma` `e993D_B4`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/18-e993D_B4.lean.fragment`
- `lemma` `e993D_X`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/19-e993D_X.lean.fragment`
- `lemma` `e993D_L`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/20-e993D_L.lean.fragment`
- `lemma` `e993NN_L`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/21-e993NN_L.lean.fragment`
- `lemma` `e993NN_twoX`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/22-e993NN_twoX.lean.fragment`
- `lemma` `e993NN_G`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/23-e993NN_G.lean.fragment`
- `lemma` `e993NN_DG`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/24-e993NN_DG.lean.fragment`
- `lemma` `e993NN_B`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/25-e993NN_B.lean.fragment`
- `lemma` `e993NN_DB`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/26-e993NN_DB.lean.fragment`
- `lemma` `e993D_one`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/27-e993D_one.lean.fragment`
- `lemma` `e993NN_zero`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/28-e993NN_zero.lean.fragment`
- `lemma` `e993NN_prod`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/29-e993NN_prod.lean.fragment`
- `lemma` `e993NN_Dprod`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/30-e993NN_Dprod.lean.fragment`
- `lemma` `e993NN_Dpow`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/31-e993NN_Dpow.lean.fragment`
- `lemma` `e993NN_parent`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/32-e993NN_parent.lean.fragment`
- `lemma` `e993NN_Dparent`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/33-e993NN_Dparent.lean.fragment`
- `lemma` `e993_coeff_X_derivative`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/34-e993_coeff_X_derivative.lean.fragment`
- `lemma` `e993D_coeff`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/35-e993D_coeff.lean.fragment`
- `theorem` `e993_rank_any_strict_descent`: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank/PROPOSALS/36-e993_rank_any_strict_descent.lean.fragment`

## Replay command

On `mini-away`, using the approved SSH transport:

```sh
R=/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c2-rank
cd "$R/LeanProject"
PATH=/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin:$PATH lake env lean "$R/EVIDENCE/development/Assembled.lean"
```

This is a development check only. The controller still must register the fragments and perform governed kernel verification and independent fidelity review. I did not modify managed source, pins, manifests, state, or receipts.
