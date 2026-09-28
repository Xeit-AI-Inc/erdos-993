# Controller-private proposed scalar certificate, before execution

Purpose: check the unreviewed balanced Jensen exponent bound on every relaxed state m=70..119, 2m<=N<=4m, r in {2,3,4} with 2(m-1)<=N-r<=4(m-1), 5j>2N-1 and 2j<=N-2. This is NOT a tree census and does not determine actual first descents or selectors. It may supply a finite scalar bridge between a future finite small-profile proof and the independently reviewable m>=120 local coefficient argument.

Use exact integer arithmetic. For each shift s in GF_r, set M=N-r, k=j-s; require M>=10 and 3k>=M. Compute the adjacent-arity minimum of E=sum a_u (2u/(2u+1))*choose(M-u,k-1)/choose(M,k), subject to cofactor branch count m-1 and tip count M. Replace E by floor(1000E)/1000, a rigorous lower bound. Evaluate the degree-12 positive Taylor polynomial exactly with common denominator 1000^12*12!. Sum GF_r coefficients times the exact binomial ratio choose(N-r,j-s)/choose(N,j). Test that the sum exceeds 3(N+1-j)(N-2j-1)/(2(j+1)).

Retain deterministic evaluator, per-m counts and exact minimum rational margin, and any excluded state or first failed state. Any exclusion/failure defeats the proposed full finite certificate. No mathematical or formal award until independent review of balancing, occupancy, Taylor, convolution, rank bridge and evaluator. No C2 worker may receive this controller-private exploration.
