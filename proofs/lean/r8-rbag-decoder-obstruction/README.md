# r8 R-Bag Decoder-Obstruction Package

Candidate `C2-F1` proves
`C2F1.no_universal_endpoint_decoder_exact_rBag`: the exact five-label
`R_bag` state cannot support a universal decoder for the specified rank-two
and rank-three endpoint marker.

Build with `lake build C2F1`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

The result concerns this exact encoded state only. It does not rule out
stronger leaf-addressed states, and it does not prove TREE, FOREST, TRANSFER,
a counterexample, or Erdos #993.
