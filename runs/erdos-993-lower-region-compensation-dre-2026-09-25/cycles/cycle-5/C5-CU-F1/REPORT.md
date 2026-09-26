# C5-CU-F1 critique of C5-F1

## Disposition

**C5-F1-TM-CENTRAL-SURVIVAL: retained_narrowed.** The exact finite portion is independently reproduced for the stated uniform family through `m=999`. I did not find a finite arithmetic failure. I narrow the all-`m` consequence to a conditional candidate: the `m>=1000` proof sketch depends on the registered descent bound and on perturbation estimates whose detailed index-by-index derivation is not present in the allowed route files. This disposition does not refute the family theorem or decide the primary claim.

## Independent exact replay

I copied the pinned source `CHECK.py` to this worker directory as `REPLAY.py` and ran that copy. `REPLAY-OUTPUT.txt` records exact agreement with the source evidence: 1,507,464 strict LC checks, 1,507,464 strict mixed-minor checks, matching digests and minima, and 276,938 eligible rows with no selector or full-sum failures. The script evaluates both original-leaf orbits and uses the multiplicity-weighted full sum `R[p-1]-R[p-2]`; its row predicate checks both strict leaf selectors and that full sum. This supports only `1<=m<=999`.

## Analytical audit

The polynomial bridge is internally consistent. For the path `a-b-r`, `alpha(T_m)=3m+2`; the path choice when `r` is occupied contributes the extra factor `L`. Deleting `a` gives `A0`; deleting a private leaf changes its claw factor to `1+3z+z^2` and retains `zL^(3m)` in the `r`-occupied branch, giving `Astar`. There are `3m` private leaves. The aggregate of the per-leaf `q_v` polynomials is `zR`, so the reported coefficient difference for the complete selected sum has the correct rank shift.

The finite-order ULC uses are valid for the displayed factors and their stated degrees. In particular `B=(1,4,3,1)` is ULC(4), not ULC(3); the factor-by-factor convolution conclusion uses ULC order 4 for each `B`. Gurvits Theorem 1.1 has the needed finite nonnegative sequence hypotheses and says convolution adds the ULC orders. The Poisson margin then yields the ordinary LC lower margin stated in the route. The Cauchy-Binet minor has the correct orientation: its `(r,s)=(0,1)` term is the positive LC bracket `H_j^2-H_(j-1)H_(j+1)` multiplied by the positively oriented factor minor.

The selector transfer has the right rank logic if the registered forest bound `n<=4x` is available for this tree: `n=4m+3` yields `x>=m+1`; eligibility yields `p<=2m+1` and `x<=2m-1`. Thus the crossing and propagated ranks lie in the checked central window. A positive mixed minor at `x`, together with `P_(x+1)<P_x`, starts strict descent in each deletion polynomial; LC propagates that descent to `p`, and for `R` to the required difference at `p-2`. This does not invoke log-concavity of `P` or a no-recovery claim.

I checked the theorem statement against Gurvits's primary paper, [arXiv:0804.1181, Theorem 1.1](https://arxiv.org/abs/0804.1181). Its definition normalizes by `binom(d,i)`, and the theorem is exactly the finite-order convolution assertion used here.

## Remaining audit gap and scope

The all-parameter perturbation section is compact rather than fully checkable from the permitted materials. It cites a lower-coefficient estimate from the `h=8` term and reports constants and cutoff ratios, but does not show the exact falling-factorial comparisons for all 27 indices or derive the error constants `24`, `47`, `431`, and `14688`. I therefore cannot independently certify the `m>=1000` cutoff from this case packet alone. In addition, the `n<=4x` forest descent theorem is referenced as registered, but its proof was not among this case's permitted files; the transfer is conditional on that theorem.

The exact retained result is the bounded family replay for `1<=m<=999`. The route's larger all-`m` statement remains a plausible conditional family candidate, not an independently verified theorem on this review. Nothing here applies to arbitrary ordinary trees, and no primary status is awarded.
