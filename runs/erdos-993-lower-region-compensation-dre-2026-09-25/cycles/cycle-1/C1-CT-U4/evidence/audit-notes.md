# Audit notes for C1-U4-1

## Exact coefficient check

For each original leaf tag, partition independent sets of `T-v` by whether they contain `s_v`:

`I(T-v,z)=I(H_v,z)+zI(R_v,z)`.

Set `q_j=i_j(H_v)-i_j(R_v)` and `r_j=i_j(R_v)`. Then the rank-`j` coefficient of `I(T-v,z)` is `i_j(H_v)+r_(j-1)=q_j+r_j+r_(j-1)`. Hence

`Delta_p(T-v)=(q_(p+1)+r_(p+1)+r_p)-(q_p+r_p+r_(p-1))`
`=q_(p+1)-q_p+r_(p+1)-r_(p-1)`.

Also

`Delta_(p-1)(H_v)-Delta_(p-1)(R_v)`
`=(i_p(H_v)-i_(p-1)(H_v))-(r_p-r_(p-1))`
`=q_p-q_(p-1)`.

These are different coefficient functionals. Strict negativity of the first selects the tag but does not impose a sign on the second; summing over the fixed set `F(T,p)` still requires a separate argument. Each leaf tag remains an individual summand when supports repeat.

## Imported theorem

Chudnovsky–Seymour, “The Roots of the Independence Polynomial of a Clawfree Graph,” Theorem 1.1: claw-free `G` implies every root of `I(G,z)` is real. The paper's introduction gives `K_(1,3)` as a non-real-rooted example. The target imposes no claw-free hypothesis. The theorem does not imply the selected aggregate sign even where its hypothesis holds.

## Control fence

The provided `T_22` and `T_60` controls each have a positive marked term and negative complete aggregate. This is consistent with the claim's warning that local signs do not settle the global sum. These are inspected supplied rows, not replayed calculations.
