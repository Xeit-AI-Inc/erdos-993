# Correction to T3's local tip pair

T3 correctly defines U_i=G B_(r_i-1)H_i, but its displayed proof and finite local script use the pair(F_r,B_r). That pair pertains to T_i=G F_r H_i, not U_i. Therefore those local checks do not establish the stated U_i main-product LR step. Retain this genuine proof mismatch and the original sealed report; do not quietly relabel the checked polynomial.

The required corrected pair is(B_(r-1),B_r). For r>=2 the supported coefficient ratios, in increasing rank, are

    1, r/(r+1), (r-2)/r, (r-3)/r, ..., 1/r, 0.

At rank0 both coefficients are1. At rank1 the coefficients are r and r+1 because each B factor includes+z. At ranks j>=2 the binomial ratio is(r-j)/r, including0 at j=r. The displayed list is nonincreasing:1>=r/(r+1)>=(r-2)/r, and the later terms decrease. All denominators are positive on the denominator's interval support. Hence every ordered local minor B_(r-1)[u]B_r[v]-B_(r-1)[v]B_r[u] is nonnegative. Outside support, zero extension creates no adverse minor. For r2 the list is simply1,2/3,0.

The common cofactor is G H_i, a positive-interval log-concave product in the actual arity2/3/4 family. The existing same-kernel likelihood-ratio convolution lemma then gives the required U_i/C order. The rest of the curvature-plus-surplus proof uses the correct U_i and is unaffected after this explicit repair. Independently, the endpoint adjacent comparison follows from the exact determinant identity in C6-ENDPOINT-ADJACENT-IDENTITY.md, and the positive same-C weighted sum uses original r_i.

This establishes a corrected informal implication, not the all-m surplus premise or a formal award. The C6 tail proof itself never uses main-product LR or ULC, so this T3 error does not affect its independent coefficient argument. No new registry identity is needed for correcting the proof of an existing implication.
