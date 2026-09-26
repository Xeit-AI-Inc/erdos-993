# C4-U3 correction proposal: core polynomial and composition arithmetic

The six-cover skeleton lemma, converse, edge budget, and exhaustive *recipe* survive. For a designated cover `C` of six vertices, outside connectors `D`, and outside pendant multiplicities `m_c`, deleting the pendant vertices leaves a tree `K` with `t=|D|<=5` and

`e_C + sum_(u in D)(deg_K(u)-1) = 5`.

This follows from `n=6+t+L` and `n-1=e_C+sum_D deg_K(u)+L`. Padding a smaller cover and reconstructing original leaves by full-graph degree are valid. No sign census has been executed.

The printed core-state polynomial in C4-U3 and both C4-CT-U3 and C4-CF-U3 is false. If an independent set has core intersection `I`, a pendant leaf at `c` is excluded exactly when **`c` itself lies in `I`**. A selected connector neighboring `c` excludes the core vertex `c`, but leaves attached to `c` remain available. The correct identity is

`P_T(z) = sum_(I independent in K) z^|I| product_(c in C\I) (1+z)^(m_c)`.

It also follows by conditioning on cover vertices: for each independent cover state `A`, every connector whose cover neighbors avoid `A` contributes `1+z`, and every pendant bundle with `c not in A` contributes `(1+z)^(m_c)`. This can be used as an exact evaluator after correcting the source formula; the at-most-64 cover-state outer loop and finite skeleton representation remain sound.

The replay's in-scope witness has one outside connector root `0`, six cover centers `1..6` adjacent to it, and pendant multiplicities `(2,3,3,3,3,3)`. It has `n=24`, `p=10`, `alpha=18`, `x=8`, satisfies both eligibility guards, and all 17 original leaves are favorable. Its exact polynomial is

`product_(i=1)^6 ((1+z)^(m_i)+z) + z(1+z)^17`.

The submitted formula gives the same product plus `z`, since for `I={0}` every center lies in `N_K[I]`. It omits `z((1+z)^17-1)`, including 17 independent pairs at rank 2. A separate rooted-tree polynomial DP matches the corrected polynomial coefficient by coefficient. The witness's full selected sum is `-122805`; the formula defect does not supply a counterexample to the sign assertion.

For fixed `n,t`, the number of weak compositions of `n-6-t` into six parts is `binom(n-t-1,5)`. At `(n,t)=(24,0)` it is `33649`, versus the printed `binom(22,5)=26334`; at `(30,0)` it is `binom(29,5)=118755`, which matches the numerical maximum already stated in C4-U3. Both critics corrected this count but endorsed the erroneous polynomial. A future census must correct its evaluator before any finite sign claim is promoted.

These are independent review proposals. The four-order six-cover sign and the complete lower-region selected aggregate remain open in this record; trees of cover number at least seven are outside this skeleton route.
