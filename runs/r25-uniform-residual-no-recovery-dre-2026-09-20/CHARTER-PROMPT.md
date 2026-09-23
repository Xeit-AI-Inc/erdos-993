# Charter prompt (Ashton, 2026-09-20; verbatim)

Work on the highest-priority direction identified by the latest Erdős #993 assessment: extend the matching/vertex-cover method into a uniform residual no-recovery argument.

Update your understanding first
Read the newest results and current canonical ledger before choosing your precise claim. Other agents have completed experiments since your previous work, so reconcile your understanding against the actual files.
Start with:

* Public repository: https://github.com/Xeit-AI-Inc/erdos-993
* Canonical master ledger: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-master-ledger-2026-09-04/LEDGER.md`
* Claim registry: `CLAIM-IDENTITY.json` in that directory.
* Public assessment: `docs/assessment-2026-09-20.md`
* Completed G1 experiment: `experiments/g1-large-residual-dre-2026-09-13.md`
* Its detailed report, terminal ledger, obligations, contracts, and verification records under `runs/g1-large-residual-dre-2026-09-13/`.
* Formal implementations under `proofs/lean/g1-c1-low-rank/`, `g1-c2-first-wide/`, and `g1-c3-third-wide/`.
* The latest r23b and r24 results, especially their counterexamples and terminal evaluations.

Commit `42a291b7be9b423cf5570d8c082a6348ae40afe6` published the three-cycle G1 results and assessment. Treat it as a known baseline; check for subsequent updates.
Distinguish proved results, informal arguments, conditional reductions, refuted mechanisms, and open claims. Resolve differences between older run-local records and the current master ledger before relying on them.
Why this direction matters
The G1 experiment produced rigorous infinite-family theorems and a reusable matching/cover method. However, its results control particular values of the excess
\[ d=|V(F)|-2r. \]
The remaining region permits unbounded \(d\). Proving finitely many additional bands, by itself, cannot close that gap.
The highest-value advance would be an argument uniform in \(d\), or a proved reduction using the ambient G1 hypotheses that confines possible counterexamples to a substantially smaller class.
Mathematical starting point
Let \(i_k(F)\) count independent sets of size \(k\), let
\[ \Delta_k(F)=i_{k+1}(F)-i_k(F), \]
and let \(x(F)\) be the first index of strict descent. Check the exact index and zero-extension conventions in the formal contracts.
Cycle 3 proves:
\[ F\text{ a finite forest},\quad r\ge1,\quad |V(F)|=2r+4,\quad x(F)<r \Longrightarrow \Delta_r(F)\le0. \]
Its proof combines an actual matching/vertex-cover dichotomy with exact independent-set counting over cover fibers. Read the implementation and determine which estimates genuinely depend on the fixed excess.
The next band, \(|V(F)|=2r+5\), remains open in that experiment. A proposed six-edge comparison failed; that failure is not a counterexample to the forest crossing statement.
Your task
Investigate whether this method can yield:

1. A uniform no-recovery theorem for actual forests;
2. A uniform theorem for residuals satisfying the full ordinary G1 hypotheses; or
3. A rigorous reduction that isolates a smaller, explicitly characterized obstruction.

Use the next band as a diagnostic when useful, but explain how each successful step could extend beyond one fixed band. Identify exactly where matching size, cover size, excess, and the earlier-descent hypothesis enter the argument.
Possible directions include parameterized matching estimates, sharper cover-fiber inequalities, and induction or decomposition with a precisely stated invariant. Challenge each proposed mechanism against the registry's known counterexamples before investing in formalization.
If you specialize to ordinary G1, import its complete contract: the original leaf/support geometry, original neighborhoods, \(p=x(T)+1\), negative Gamma guard, width condition, and residual crossing. Do not replace these with a weaker surrogate.
Standards and deliverables

* Separate a failed auxiliary inequality from a counterexample to the target theorem.
* A proposed counterexample must use an actual graph and reproduce every relevant hypothesis with exact counts.
* A recovering forest and a valid G1 tree wrapper are different achievements; verify each separately.
* Do not assume universal log-concavity, raw edge-addition monotonicity, or convolution closure of arbitrary unimodal sequences.
* Keep this G1 residual-sign claim distinct from the older ledger obligation named `OB-G1`.
* Do not claim that closing G1 alone solves Erdős #993 without proving the connecting implications.

Deliver an exact target statement, the strongest established result, independently checked evidence, and the remaining obstruction. Formalize successful mathematical arguments through the supplied DRE + Lean workflow. Record justified claim updates and provide a closeout explaining whether the experiment achieved a uniform advance, a proved structural reduction, another fixed-band result, or a refutation.
Optimize for mathematical reach: a uniform inequality or a strict reduction of the remaining possibilities is more valuable than a larger null census or a collection of auxiliary identities.
