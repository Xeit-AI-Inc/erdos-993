# r7 Endpoint-Sign Package

Candidate `C5-T1-03` proves `C5T103.C5_T1_03`: the displayed endpoint-sign
arithmetic identity, `Gamma >= 0`, and `Delta < 0` imply positive `D` under
the explicit positive rank and leaf-count guards.

Build with `lake build C5T103`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

The endpoint and identity antecedents remain hypotheses. This package does not
derive them from a tree or prove any headline target.
