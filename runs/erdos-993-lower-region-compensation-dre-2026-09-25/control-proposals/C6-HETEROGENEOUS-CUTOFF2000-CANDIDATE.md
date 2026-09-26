# Supplemental controller candidate: heterogeneous cutoff2000

Unawarded; depends on the graph, curvature, mixed-minor and selector argument in C6-HETEROGENEOUS-LARGE-BRANCH-CANDIDATE.md. This only replaces the coefficient perturbation bound. It is not yet part of a worker packet.

Choose h=29. For each omitted branch i, H_i >=coeff choose(m-1,h) z^h L^(N-4h-4), since every arity is at most4. For s in{0,1}, the quotient against choose(N,j-s) equals

(j-s)_(h-s) (N-j+s)_(3h+4+s) / (N)_(4h+4).

On integer j>=N/4 with factors positive it decreases in j. The ratio at successive j is (j-s+1)/(j-h+1) times (N-j-3h-4)/(N-j+s). Denominator minus numerator, after multiplication, is (4h+4)j-(h-s)N+(3h+4+s)(1-s)-(h-s)s. At j>=N/4 this is >=N+3h+4 for s0, and >=2N-h+1 for s1, both positive.

Therefore its minimum on j<=2N/3+3 is at J=floor(2N/3+3). The smallest first factor is >=2N/3+3-h, and the smallest second factor is >=N/3-3h-6. Since N>=2m, the weaker bounds are N A(m) and N B(m), where
A(m)=2/3-h/(2m), B(m)=1/3-(3h+8)/(2m).
Both positive for m>=2000, and A>B. The s0/1 quotients are bounded below by A^(h-1) B^(3h+5). Also choose(m-1,h)>=(m-h)^h/h!. Hence both binomial perturbations/H_i are <=epsilon(m)=h!/[(m-h)^h A(m)^(h-1) B(m)^(3h+5)].

All the original neighbor and mixed constants remain unchanged at m>=2000 (N>=4000). The same sufficient scalar inequality is 80328*m*epsilon(m)<1. At m2000 its exact rational has value about0.0000329996464<1; exact numerator/denominator are in the accompanying arithmetic JSON. For larger m, m/(m-h)^h strictly decreases, while A,B increase, proving the inequality uniformly. Thus, IF the original independent structural audit passes and this sharper bound is independently verified, the same heterogeneous theorem holds for all m>=2000. No claim for m<2000 or arbitrary trees follows. The finite prefix is still substantial and should not be called a small census.
