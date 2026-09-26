# C6-CT-F2 independent critique (orientation T)

## Reviewed claim and disposition

Reviewed the only case-listed claim, `C6-F2-HETEROGENEOUS-CUTOFF2000-SCALAR-AUDIT`.

**Disposition: retained_narrowed.** The exact h=29 scalar cutoff calculation is correct: the displayed perturbation bound gives `80328 m epsilon(m) < 1` for every integer `m >= 2000`. The evidence supports this scalar subclaim only. It does not prove the heterogeneous tree theorem or the primary arbitrary-tree aggregate. The source route itself leaves the graph identities, full coefficient and mixed-minor estimates, and their application to the fixed selector unresolved.

## Independent arithmetic check

I recomputed the cutoff with exact `Fraction` arithmetic in `scalar_replay.py`; its output is `scalar_replay.json`. At `m=2000`,

- `A=7913/12000` and `B=743/2400`;
- `epsilon = 29!/((2000-29)^29 A^28 B^92)`;
- `80328*2000*epsilon = 3.299964639786117e-05 < 1` (the exact numerator and denominator are recorded in the replay JSON).

For the proposed lower bound, the quotient against `binom(N,j-s)` is

`(j-s)_(29-s) (N-j+s)_(91+s) / (N)_120`, for `s=0,1`.

The consecutive quotient is

`(j-s+1)/(j-28) * (N-j-91)/(N-j+s)`.

After cross multiplication, denominator minus numerator is affine increasing in `j`; at `j=N/4` it is `N+91` for `s=0` and `2N-28` for `s=1`, so it is positive for `N>=4000`. Thus the quotient decreases across the proposed interval. At `J=floor(2N/3+3)`, the smallest numerator factors are at least `2N/3-26` and `N/3-93`. Since `N>=2m`, these dominate `N A(m)` and `N B(m)` with the candidate's `A(m)=2/3-29/(2m)` and `B(m)=1/3-95/(2m)`. This gives `epsilon(m)=29!/((m-29)^29 A(m)^28 B(m)^92)`.

Finally, `m/(m-29)^29` strictly decreases for `m>=2000`, while `A(m)` and `B(m)` strictly increase. The stated scalar therefore decreases after the exact endpoint check. This justifies the infinite scalar tail, rather than extrapolating from sampled values.

## Scope, rank bridge, and usefulness

The simple rank inequalities in the route are consistent, conditional on the candidate's stated graph parameters and the cited forest descent bound. With `alpha=N+2`, the strict guard gives `p <= floor((2N+4)/3)`. Eligibility gives `x<=p-2`. The source map points to `inputs/C4-r27-linear-bound-intake/Main.lean`, declaration `Erdos993G1.forest_descent_linear_bound`; under that bound, `N+m+3<=4x`, hence `x>N/4`. These place `x`, `p`, and `p-2` within the candidate's broad central interval `[N/4, 2N/3+3]` for `N>=4000`. This verifies only the interval arithmetic. Descent propagation still depends on the candidate's unverified positivity, curvature, mixed-minor, and polynomial-to-deletion bridges.

The scalar estimate is useful as a replacement for the candidate's perturbation bound at the stated cutoff. It leaves the large-branch candidate's substantive structural obligations intact, and gives no coverage of `m<2000`, arities outside `{2,3,4}`, or arbitrary trees. No realizable counterexample is offered or implied. No standing fence or prior refutation is displaced. I found no mathematical defect in the scalar calculation; the broader theorem review is expressly limited by the structural steps not independently established here.

## Reproducibility and limitations

Run `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 scalar_replay.py` from this worker directory. The replay uses exact integers and rationals. Common pins, including the cited source-map paths, matched the packet hashes. The source route's own evidence was read only; the replay is authored and stored in this seat's scratch directory. No Lean build, family census, or graph enumeration was performed.
