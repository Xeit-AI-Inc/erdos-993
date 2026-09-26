# C1-U4 — coefficient-operator audit

## Result

For each original leaf tag `v`, put `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, and `W_v=N_T(s_v)\\{v}`. Write `h_j=i_j(H_v)`, `r_j=i_j(R_v)`, and `q_j=h_j-r_j`. Since `T-v` is the disjoint union of `H_v` and the vertex `s_v` joined to `W_v`, an independent set of `T-v` either omits `s_v` (an independent set of `H_v`) or contains it (then its remaining vertices form an independent set of `R_v`). Therefore

`I(T-v,z)=I(H_v,z)+z I(R_v,z)`.

This gives two different finite-difference operators for the two parts of the problem:

`Delta_p(T-v) = q_{p+1}-q_p + r_{p+1}-r_{p-1}`

and

`Delta_{p-1}(H_v)-Delta_{p-1}(R_v)=q_p-q_{p-1}`.

Equivalently, the selector is the sign of `[z^p](z^{-1}-1)I(T-v,z)`, while the selected summand is `[z^p](1-z)(I(H_v,z)-I(R_v,z))`. Thus a selected term compares a first difference of `q` at `p-1` against a selector involving a different difference of `q` at `p` and a two-step difference of `r`. In particular, the selector alone does not give the sign of the summand. An operator proof would need a tree-wide inequality coupling these two coefficient functionals while retaining the original-leaf sign mask and all repeated-support tags.

The lower-region guard `3p<2a+1` gives positive slack `2a+1-3p` in the separately supplied tagged-incidence identity. It does not alter the operator mismatch above: it supplies no bound on the sign-selected sum of the `q_p-q_{p-1}` coefficients. Under the supplied identity, the remaining exact obligation is the stated global `D+C` budget; no generating-function, differential-operator, or spectral theorem found here proves it.

## Spectral-theorem hypothesis audit

Chudnovsky and Seymour prove that the independence polynomial of every claw-free graph has only real zeros (Theorem 1.1, *The Roots of the Independence Polynomial of a Clawfree Graph*, JCTB 97 (2007), 350–357; primary paper linked in `evidence/chudnovsky-seymour.md`). Their paper itself gives the claw `K_{1,3}` as a counterexample to real-rootedness outside that hypothesis, with polynomial `1+4z+3z^2+z^3` (Introduction, lines 19–30 in the linked source). The target ranges over arbitrary trees, which may contain induced claws, and the deletion forests `H_v` and `R_v` need not be claw-free either. Hence this theorem cannot be applied uniformly to the relevant independence polynomials. Even in a claw-free subcase, real-rootedness/log-concavity of individual coefficient sequences would not by itself compare the different finite differences above under the tree-dependent favorable selector. No interlacing or compatibility hypothesis for the required pair of coefficient functionals is established by Theorem 1.1.

This is an exact obstruction to a blanket real-rootedness route, not a refutation of the lower-region aggregate. The source theorem has a genuine claw-free graph hypothesis; the target has no such hypothesis. A separate argument establishing a restricted class or a selector-aware compatibility/budget result remains necessary.

## Scope and gaps

No eligible tree counterexample was sought or computed. This result is an algebraic decomposition and imported-hypothesis audit only. It does not prove either registered identity, does not use a positive local term as a refutation, and does not infer anything about the high-tail region. The supplied lower-region examples remain finite controls only. The graph/rank guards on any future witness or proof remain exactly those in `NEUTRAL-HANDOFF.md`, including the strict first-descent definition through the terminal zero-extended rank and distinct original-leaf tags.

## Input integrity

The SHA-256 pins for `SOLUTION-CONTRACT.md`, `NEUTRAL-HANDOFF.md`, `WORKER-PROTOCOL.md`, `EXECUTION-POLICY.md`, and `control/SEARCH-ALLOCATION.json` match the values in `packets/C1-COMMON.json`. The packet files themselves were read as assigned: `packets/C1-COMMON.json` (SHA-256 `6a051ebb960cad2ee6c9d6d6d2f0a89e155fa41220dc560f6a8051e26067497a`) and `packets/C1-U4.json` (SHA-256 `7bd618ec509bba1da3ed67090fd98837adf7dc78b323aba9e78268b5f3d75034`).
