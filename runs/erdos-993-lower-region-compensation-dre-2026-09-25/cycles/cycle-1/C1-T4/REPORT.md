# C1-T4 report

The favorable selector has an exact first-moment interpretation: for `G=T-v`, a uniform independent `p`-set has expected number of addable vertices `(p+1)i_(p+1)(G)/i_p(G)`, so `Delta_p(G)<0` says this mean is below `p+1` (when `i_p(G)>0`). The leaf's desired summand, however, compares rank `p` with rank `p-1` only inside `H=T-{v,s_v}` and only for independent sets meeting `W=N_T(s_v)\\{v}`. The marked-slice mean addability also carries the multiplicity correction `C_v` for multiply marked extensions.

The derivation and exact incidence counts are recorded in [EVIDENCE.md](EVIDENCE.md). This gives a probability formulation of the selector and a precise identification of the missing step: transfer from an unconditioned rank-`p` measure on `T-v` to selected adjacent-rank marked measures on `H_v`, then control their aggregate over the fixed favorable selector. No valid coupling, stochastic domination, or conditional expectation inequality accomplishing that transfer is established. Accordingly this is a partial reformulation only; it proves neither the global lower-region budget nor a counterexample, and the registered target remains unresolved by this route.

The 16 pinned common source files were hash-checked against `packets/C1-COMMON.json`; there were no mismatches. The route used the packet's T4 probability/hard-core lens and no sibling or controller output.
