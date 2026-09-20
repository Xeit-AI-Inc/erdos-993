**Cycle 3 closes with a formally verified forest theorem and its exact ordinary G1 specialization. The unrestricted ordinary G1 target, its governed RTree counterpart, and Erdős 993 remain unresolved.** All three authorized cycles are complete. This experiment ends at the user's hard three-cycle limit.

Write \(i_k(F)\) for the number of independent sets of size \(k\), \(\Delta_k(F)=i_{k+1}(F)-i_k(F)\), and \(x(F)=\min\{k\ge0:\Delta_k(F)<0\}\). Counts have integer zero extension; a plateau is not a descent. The new theorem is

\[
 F\text{ a finite forest},\quad r\ge1,\quad |V(F)|=2r+4,\quad x(F)<r
 \quad\Longrightarrow\quad \Delta_r(F)\le0.
\]

For an ordinary G1 tuple, let \(v\) be the original leaf, \(s\) its degree-two support, \(g\) the other neighbor of \(s\), and \(U=T-(N_T[v]\cup N_T[g])\). Retain the full original G1 guards, including \(p=x(T)+1\), the negative \(\Gamma\) condition, the width condition, and \(x(U)<p-2\). The additional equality \(|U|=2p\) then implies \(\Delta_{p-2}(U)\le0\). The proof uses actual induced graphs and independent-set counts. It reconciles natural subtraction with integer subtraction using the guards, which imply \(p\ge3\).

The exact declaration is `Erdos993G1.thirdWideForestAndG1` in [the Lean source](../../proofs/lean/g1-c3-third-wide/LeanProof/Main.lean). It has two conjunction outputs corresponding to these two statements. One completed governed contract supports two separately identified formal consequences; it does not support a formal award for unrestricted G1.

The proof divides forests into two cases. A leaf-removal induction constructs a matching and an equally sized vertex cover. Thus a forest either has five disjoint edges or has a cover of size at most four. This avoids assuming an external matching-cover theorem or any unimodality property of forests.

With five disjoint edges, the formal proof counts actual independent sets according to how many of the ten marked endpoints they contain. Insertion/deletion incidence inequalities, exact integer certificates, and explicit small-rank cases give \(i_{r+1}\le i_r\). This component holds for arbitrary finite simple graphs of order \(2r+4\) containing five disjoint edges. The larger informal normalized-comparison argument remains separately documented; the Lean proof uses the direct incidence certificate.

For a cover \(C\) of size at most four, let \(B=V(F)\setminus C\). The exact independent-set partition is

\[
 I(F;z)=\sum_{\substack{S\subseteq C\\S\text{ independent}}}
 z^{|S|}(1+z)^{|B\setminus N_F(S)|}.
\]

This retains the actual overlaps among neighborhoods. For \(m,j\in\mathbb N\), the arithmetic bound
\(\binom m{j+1}-\binom m j\ge-\operatorname{Cat}_j\), together with

\[
\operatorname{Cat}_{k+1}-4\operatorname{Cat}_{k-1}
-6\operatorname{Cat}_{k-2}-4\operatorname{Cat}_{k-3}
-\operatorname{Cat}_{k-4}>0\qquad(k\ge4),
\]

proves strict positivity of every difference before rank \(r\). The Catalan inequality is proved by recurrence and an exact polynomial identity with positive coefficients. Forest edge counts, independent triples, and a sparse cover vertex settle the small ranks. This branch contradicts \(x(F)<r\), completing the dichotomy. No raw edge-addition monotonicity or universal forest log-concavity enters the proof.

The [verification report](verification/C3/VERIFICATION-REPORT.md) records the completed contract, independent informal audit, canonical registration, kernel check, fresh independent fidelity audit, and workflow close. The registered source has 187 entries: 14 definitions, 172 lemmas and one terminal theorem. It reuses 135 audited entries from Cycle 2 and adds 52 entries. Verification used Lean 4.32.2 and Mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`. The only reported axioms are `propext`, `Classical.choice`, and `Quot.sound`. There were zero governed repair attempts; development failures remain preserved in the evidence directory.

| Verification artifact | SHA-256 |
|---|---|
| [Exact contract](verification/C3/THEOREM-CONTRACT.yaml) | `4bc0bea5fa8e1e22e4c5ae16de395f66c4a8671ccd75483ca611a433827ec5df` |
| [Registered Lean source](../../proofs/lean/g1-c3-third-wide/LeanProof/Main.lean) | `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4` |
| [Kernel receipt](verification/C3/RECEIPTS/kernel-verification.json) | `14e70b56dedb0fa2839f79a8d4c8b99a889a65f3021b405a39447ea9c23f0dfa` |
| [Fresh fidelity receipt](verification/C3/RECEIPTS/fidelity-audit.json) | `27b880f94c12e837a3e8a5d1f5961490fd8b885c69fd0e04c81a441f5ea20c05` |
| [Workflow close report](verification/C3/VERIFICATION-REPORT.json) | `3f945529c506812fd523e6dbbe104fd952dc87c300ec010b8195292d22017ec0` |

The progress should be judged by the theorem and the failed mechanisms that can now be excluded. The ledger's size is not a count of discoveries: its 288 identities include inherited claims, counterexamples, conditional implications, and open obligations.

| Result | Final status and scope |
|---|---|
| Ordinary G1 at \(p\le5\) | Inherited formal result from Cycle 1 |
| First wide band \(|U|=2p-2\) | Inherited formal result from Cycle 2 |
| Second wide band \(|U|=2p-1\) | Retained informal result with its external mathematical dependencies |
| Third wide band \(|U|=2p\) | New formal result from Cycle 3 |
| Next forest band \(|F|=2r+5\) | Open; a failed six-edge comparator does not refute the crossing theorem |
| Unrestricted ordinary G1 and governed RTree G1 | Open, as distinct claims |
| Literal ordinary-tree Hall shortcuts | Refuted at their stated scopes; no automatic governed RTree or aggregate conclusion |

Combining the formal results with the retained informal second-band and path-forest results, any possible ordinary G1 counterexample must have \(p\ge6\), \(|U|\ge2p+1\), residual maximum degree at least three, and a strict recovery of its residual coefficients after the first descent. This is a necessary region with mixed verification grades. It neither produces a counterexample nor proves that those conditions suffice.

Several corrections materially constrain further work. Raw forest edge-addition monotonicity fails even when both forests satisfy the wide-size and strict-crossing conditions; the refuting examples still have negative target differences. The factor-two negative-margin bound fails on full ordinary G1 examples, while factor one remains open. Requiring every independent set to satisfy the addability bound is also false; the average bound is the live question. A negative sum for each deletion channel does not imply that one vertex has both signs. Writing \(B_v=\Delta_{r-1}(F-N_F[v])\), the exact interval condition is \(\Delta_r(F)\le B_v\le0\) at the same vertex. Conditions involving the factor-one bound already imply the supported target sign, so adding a channel-diameter assumption does not create a weaker route to proving that sign.

The common-connector padding analysis also yields a useful obstruction. For fixed nonempty \(F\) and \(r\ge1\), put
\[
h_0=2r+3+(r+1)\max(0,-\Delta_r(F)-\Delta_{r-1}(F)).
\]
For every root tuple, padding with at least \(h_0\) gateway leaves forces \(\Delta_{r+1}(T_h)>0\), preventing the required ambient first descent. Increasing fixed-residual padding indefinitely is therefore unavailable as a repair mechanism. The original universal restricted to recovering forests remains open: under the obstruction it is equivalent to the absence of such recovering forests. Refuting that universal nonvacuously would require an actual recovering instance. A negative root-average \(\Gamma\) and a nonempty set of roots with valid history likewise do not establish that a common root satisfies both conditions.

The completed sibling results were incorporated with their original ranks and representations intact. In particular, the positive arm cut in `CB(8,92)` occurs at sibling rank \(p=492\), where the complete aggregate is negative. At G1 rank \(p=491\), neither leaf orbit satisfies strict crossing. The literal ordinary Hall counterexample therefore does not answer the G1 sign question. Exact deficiency also requires Delete surjectivity, rather than neighborhood containment alone. The empty-top `CB(2,2)` example separates deficiency from the signed tag contribution. These distinctions are preserved in the terminal records.

The most useful next work, requiring a new authorization, is:

1. **Exploit the proved matching/cover dichotomy.** Test the exact next band \(2r+5\) as a focused structural problem. Identify the correct matching threshold and the remaining cover cases, rather than assuming the failed six-edge comparison extends. A sequence of band theorems would still need a uniform argument to settle unrestricted G1.
2. **Attack the remaining average-count inequality on actual residual graphs.** Keep the factor-one average formulation, its supported-rank condition, and every ambient G1 guard explicit. The failed pointwise and every-vertex strengthenings should remain excluded. Rooted correlations or a rigorously justified subset of vertices may be useful, but their needed sign hypotheses must be proved independently.
3. **If pursuing a counterexample, search the residual recovery first.** A successful ambient lift needs recovery, complete ambient first-descent history, and negative \(\Gamma\) at the same root tuple. Fixed-residual padding cannot manufacture recovery or rescue arbitrarily large padding. Report each failed condition separately so a mechanism counterexample cannot be mistaken for a G1 counterexample.

The final registry has 143 VERIFIED, 84 REFUTED, 24 CONDITIONAL and 37 OPEN identities, with six formal consequence identities across the three completed contracts. Cycle 3 preserves all 259 prior identities, adds 29 material identities, and promotes 17 previously open records at their stated grades. All 285 synthesis outputs, their 456 source occurrences, and all 1,944 rows across 31 inherited current ledger views remain traceable. The six historical source qualifications remain visible, including missing attachment recipes that prevent exact historical replay; they have not been converted into new mathematical open problems.

Each cycle used nine Sol xhigh search workers, three each for T/F/U, followed by 18 Astra xhigh cross-orientation critics, three Astra xhigh adjudicators, and one neutral Astra xhigh synthesis. Formal production and its separate review roles used Astra xhigh. These are completed role assignments, not simultaneous agents. The native execution limit was three workers alongside the controller. The final verification uses a fresh fidelity reviewer independent of both formal production and the informal audit.

The [final reconciliation](FINAL-RECONCILIATION.md), [terminal ledger](TERMINAL-LEDGER.csv), [current obligations](OBLIGATIONS-C3-FINAL.csv), and [continuation handoff](CONTINUATION-HANDOFF.md) record the completed state. The old root `RUN-STATE.json` and `OBLIGATIONS.csv` are immutable historical inputs referenced by earlier seals; the current state is `RUN-STATE-C3-FINAL.json` and the explicitly versioned final obligations. The continuation handoff requires new authorization. There is no Cycle 4 in this experiment.
