# r23b terminal Lean consolidation

Toolchain pin: Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`
(shared read-only Mathlib binding; never `lake clean`). `source/` is the merged
project from the sealed r23b C6-T3 evidence (byte-identical carry, `.lake`
excluded): the C4 grand merge + C5 `RelationTransport` + the C5 witness fixture
package (namespace-renamed mechanically to resolve a sealed `R23.Graph`
collision, disclosed in-file). `terminal-axioms-report.txt` is the
per-declaration `#print axioms` report (370 constants; `sorryAx` on exactly two
disclosed open lemmas; `native_decide` on exactly two CB(1,2) lemmas with a
kernel-`decide` restatement). `FIDELITY-LABELS.md` labels all 18 theorem
families honestly. The C6-T1/T2 products (abstract bridge corollaries;
R-3/R-4/R-5 transports) are in the sealed internal run's route evidence and
build against this same base. Status of record: `verified`, never
`formally_verified`.
