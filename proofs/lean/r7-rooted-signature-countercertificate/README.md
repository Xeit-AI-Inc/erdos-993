# r7 Rooted-Signature Countercertificate Package

Candidate `C6-U1-04` proves `C6U104.C6_U1_04`: two explicit rooted `Fin 10`
trees have equal actual degree-five root signatures but different actual
numbers of independent six-sets, so no universal function of that signature
recovers `i_6`.

Build with `lake build C6U104`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

This is a finite auxiliary countercertificate for a recovery mechanism, not a
graph counterexample to Erdős #993.
