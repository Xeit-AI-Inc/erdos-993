# Additional T_m coefficient identity for post-C3 work

Controller algebra, unawarded. Write L=1+z, B=1+4z+3z^2+z^3, P=(1+2z)B^m+z L^(3m+1), and the all-leaf marked polynomial Q=(3m+1)zL^(3m)+3m z(2+z)(1+2z)B^(m-1), m>=1. Direct differentiation and B'=4+3z(2+z) give

Q = P' - 2B^m - 4m(1+2z)B^(m-1) - L^(3m+1).

This is an exact coefficient identity, not a sign proof. Q is the selected polynomial only when BOTH original leaf orbits are favorable at the fixed rank. The large claw component z(2+z)(1+2z)B^(m-1) is a product of log-concave coefficient sequences; each factor can be checked directly. Neither the full P nor a sum with the arm component inherits log-concavity automatically.

Possible concrete route: prove a relative mode/adjacent-coefficient comparison between the claw component and P at p>=x(P)+2, then quantitatively absorb the arm component while preserving its actual selector. At z=1, the claw component mean degree is 13m/9+5/9, whereas (1+2z)B^m has mean13m/9+2/3; this small mean gap is NOT a mode theorem. Avoid assuming Darroch-type results for real-rooted factors, since B has discriminant-31 and is not real-rooted. All claims about infinite m, selector agreement and complete-sum sign remain open. A proof can use exact likelihood-ratio/total-positivity comparisons only after establishing their hypotheses, or explicit coefficient bounds plus a finite rigorously closed parameter range.
