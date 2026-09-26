# T_m coefficient-mixture direction for a later search

Controller algebra to check independently, not an award. Let T_m have distinguished path 0-1-2 and m root-adjacent three-leaf claws. Put L=1+z and B=1+4z+3z^2+z^3=L^3+z. The two original leaf orbits have multiplicities1 and3m. Exact root splitting gives

    P=I(T_m)=(1+2z)B^m+z L^(3m+1),
    D_arm=I(T_m-2)=(1+z)B^m+z L^(3m),
    D_claw=(1+2z)(1+3z+z^2)B^(m-1)+z L^(3m).

For m>=1 their marked polynomials are

    q_arm=z L^(3m),
    q_claw=z(2+z)(1+2z)B^(m-1)+z L^(3m).

Therefore the ALL-leaf marked sum, only equal to the selected sum when both orbit types pass the original strict selector, is

    Q_all=(3m+1)z L^(3m)+3m z(2+z)(1+2z)B^(m-1).

Further exact identities:

    P' - Q_all = 2B^m + L^(3m+1) + 4m(1+2z)B^(m-1),
    D_arm-D_claw = z^3(2+z)B^(m-1).

Expand B^(m-1)=sum_t choose(m-1,t) z^t L^(3(m-1-t)). Each component of the second term of Q_all is proportional to z^(t+1)(2+5z+2z^2)L^(3(m-1-t)), a symmetric unimodal polynomial with center (3m+1-t)/2. The first term has center3m/2+1. The mixture therefore has components with different centers. This observation does not prove unimodality of the mixture, the selected-sum sign, or a comparison to x(T_m). Do not import the refuted universal tree log-concavity statement.

A useful concrete task is to control the mixture's conditional distribution of t and use the actual first strict descent of P to bound the difference at p. Monotone likelihood ratios, exact binomial identities or coefficient inequalities may help, but every needed assertion must be proved for these explicit polynomials. Treat the selector orbit cases separately; the known controls have both orbit types selected, but that has not been established uniformly here. A proof on this infinite positive-local-summand family would demonstrate actual compensation and be stronger evidence for a mechanism than another finite negative complete sum.
