# G1 large-residual DRE: three-cycle close

**Closed 2026-09-20 at the authorized three-cycle limit. Unrestricted ordinary G1, governed RTree G1 and Erdős #993 remain open.** This is the residual-sign G1wide argument; it is distinct from the old `OB-G1` strict-endpoint obligation.

For a finite graph `F`, let `i_k(F)` count independent sets, with integer zero extension, `Delta_k=i_(k+1)-i_k`, and `x(F)` the first strict descent. The main new theorem is

```text
F a finite forest, r>=1, |V(F)|=2r+4, x(F)<r => Delta_r(F)<=0.
```

For an ordinary G1 tuple, `U=T-(N_T[v] union N_T[g])` uses original neighborhoods. The full guards require a leaf `v` with degree-two support `s` and other neighbor `g`, `p=x(T)+1`, the negative Gamma condition, `2p-3<|U|`, and `x(U)<p-2`. The equality `|U|=2p` then implies `Delta_(p-2)(U)<=0`.

The proof uses five actual disjoint edges or a vertex cover of size at most four. Exact independent-set incidence certificates settle the first branch; a cover-fiber partition and Catalan bounds rule out an earlier descent in the second. It does not assume tree log-concavity or forest unimodality.

Three independently governed contracts are published:

| Cycle | Public package | Exact scope |
|---|---|---|
| C1 | [Low rank](../proofs/lean/g1-c1-low-rank/README.md) | Forest low-rank classification and ordinary G1 for `p<=5` |
| C2 | [First wide band](../proofs/lean/g1-c2-first-wide/README.md) | Sharp order-`2r+2` graph classification and ordinary G1 at `|U|=2p-2` |
| C3 | [Third wide band](../proofs/lean/g1-c3-third-wide/README.md) | Order-`2r+4` forest crossing sign and ordinary G1 at `|U|=2p` |

Each completed theorem-contract, independent informal audit, source registration, kernel/axiom check, fresh statement-fidelity audit and workflow close. The public Main sources and project pins are byte-identical to the verified internal sources. Reproduce all three packages with `./scripts/verify-g1-lean.sh` from the repository root. The [verification record](../evidence/verification-2026-09-20-g1.md) supplies exact source and receipt hashes.

The second band `|U|=2p-1` remains informal with named mathematical dependencies. The combined necessary counterexample region `p>=6`, `|U|>=2p+1`, branching residual and strict recovery has mixed grades. The next forest band `2r+5` is open; failure of a six-edge comparator does not refute that crossing theorem.

The run also excludes raw edge-addition monotonicity, factor-two margin and pointwise/every-vertex strengthenings, and proves a root-uniform limit on fixed-residual padding. The literal sibling Hall counterexamples remain mechanism counterexamples at their original ranks, with negative complete aggregates. The full [report](../runs/g1-large-residual-dre-2026-09-13/REPORT.md) gives the corrections and remaining questions.

Each cycle used 9 Sol xhigh search workers (3 T, 3 F, 3 U), 18 Astra xhigh critics, 3 Astra xhigh adjudicators and 1 Astra xhigh neutral synthesis. Formal production and independent reviews used Astra xhigh. These are completed role assignments, not a simultaneous agent count. No Cycle 4 was started.

Public records: [terminal ledger](../runs/g1-large-residual-dre-2026-09-13/TERMINAL-LEDGER.csv), [current obligations](../runs/g1-large-residual-dre-2026-09-13/OBLIGATIONS-C3-FINAL.csv), [publication reconciliation](../runs/g1-large-residual-dre-2026-09-13/FINAL-RECONCILIATION.md), and [strategic assessment](../docs/assessment-2026-09-20.md). The source run's 288 identities are not 288 new theorems. The merged master preserves its original 81 objects and imports 207 additional G1-lineage identities at their exact grades.
