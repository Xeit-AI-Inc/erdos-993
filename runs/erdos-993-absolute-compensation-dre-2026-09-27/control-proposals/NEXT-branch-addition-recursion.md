# Private branch-addition recursion for a later structural search

This is a controller algebraic reformulation, not a proof of the guarded comparison and not current C4 worker input. Use only after normal source review/freeze.

For a profile let C=GQ, E=zL^N, U=sum_i r_i G B_(r_i-1) H_i, so W=U+N E. On adding one branch of arity r in{2,3,4}, exact multiplication gives

C_new=B_r C,
U_new=B_r U+r B_(r-1) C,
E_new=L^r E,
N_new=N+r.

Start with empty profile C=G,U=0,E=z,N=0; the registered target remains nonempty profiles. The three polynomial recurrences are positive, although recombining W gives
W_new=B_r W+r B_(r-1) C+(rL^r-Nz)E.
The negative displayed Nz term is real and cannot be discarded in a lower-bound argument. Each old tip deletion becomes B_r A_i-zE, while the new tip deletion is B_(r-1)C+L^r E. Original multiplicities are encoded by N and the explicit r factor.

A possible next route is an invariant cone of coefficient minors for the positive state(C,U,E), strong enough to imply W[k+1]C[k-1]<=W[k]C[k] only when2k<=N+2. The full U comparison and the E comparison cannot be proved separately and simply added, because C4-T1 proposes a genuine E-only negative minor. Cross compensation is necessary. Adding r changes the guard and imports shifted indices outside the old guarded range under convolution; any induction must prove its boundary strips instead of applying an all-rank closure theorem. No invariant cone or preservation theorem has been found here.
