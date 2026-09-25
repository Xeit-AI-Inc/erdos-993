# Corollary B equality wording: independent check

The proposed conservative replacement is correct:

> Equality holds at `k=0` and whenever `i_k=0`; for `k=1` and `n>0`, equality holds exactly when the forest is a tree. No complete equality classification for positive supported `k>=2` is asserted by this corrected face.

For any finite forest, Corollary B is `n D_k + 2k i_k ≤ 2k i_k n` (`sources/verity/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/second-reads/SR-RC/SECOND-READ.md:190-192,363-364`). At `k=0`, the only independent set is empty and `D_0=0`; both sides are zero. When `i_k=0`, there are no independent `k`-sets, hence `D_k=0`; both sides are zero, including all out-of-support ranks. These arguments include the empty forest.

At `k=1`, every vertex is an independent singleton, so `i_1=n` and the degree handshake gives `D_1=2|E|`. A finite forest with `c` components has `|E|=n-c` (also recorded in `SR-RC/SECOND-READ.md:187-189`). Substitution makes the two sides `2n(n-c+1)` and `2n²`. If `n>0`, equality holds exactly when `c=1`, equivalently when the forest is a tree. For `n=0`, both sides are zero and the tree classification would be wrong. This verifies the proposed wording without claiming a classification at positive supported `k>=2`, and without changing a sealed source or making a new award.

The targeted six-vertex witness in `review/scratch/check_transfer_example.py` has edges `01,12,23,14,45` and leaves `0,3,5`. Direct enumeration gives `i(T)=(1,6,10,5,0,...)`, so `α(T)=3`; its first strict descent is `x(T)=2` since `Δ_0=5`, `Δ_1=4`, `Δ_2=-5`. The first-interior rank is therefore `p=α-2=1`, and `x+2=4≤1` is false. In fact the favorable selector at `p=1` is empty: each of the three original leaves has `Δ_1(T-v)=+1`.

At the illustrative rank `p=2`, the same original leaves have `Δ_2(T-0)=-5` and `Δ_2(T-3)=Δ_2(T-5)=-4`, so the selector is exactly `{0,3,5}`. The `v=0` marked term is `q_2-q_1=3-2=+1`; the other two terms are zero, giving selected sum `+1`. This reinforces that the example tests a direct marked-family transfer **outside** the eligibility window. It is neither a counterexample to the verified first-interior theorem nor to an eligible all-rank aggregate. The target and eligibility are stated in `work/erdos-993-first-interior-aggregate-dre-2026-09-24/FINAL-ANALYSIS.md:13-25`.

Only the pinned local sources and the small direct enumeration were used for this check. I did not inspect the optional `RE-1` remote certificate, run Lean, edit previous review files, or alter a master record.
