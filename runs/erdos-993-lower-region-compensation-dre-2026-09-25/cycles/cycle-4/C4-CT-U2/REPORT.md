# C4-CT-U2 independent critique

## Disposition

**C4-U2-MARKED-SHELL-REDUCTION — retained_narrowed; proposed_open.** The first-mark partition and cover-loss reduction are sound under their stated forest and marked-set hypotheses. The leaf specialization is conditional on the parent cover threshold, and its residual matching applications require both the stated matching-size and rank hypotheses. The report does not establish those premises for every eligible tree or resolve the registered favorable-leaf aggregate.

## Independent audit

I checked all 179 source members listed in the common packet and all three files listed in the case packet against their SHA-256 pins; there were no mismatches. I read the common read-first files, the allowed critic brief, and only the exact case files and listed common sources relevant to this reduction.

For the marked identity, assign each independent set meeting W to its first mark in the chosen ordering. Earlier marks cannot occur in the set, and removing the closed neighborhood of the assigned mark prevents a conflict with that mark. This gives a bijection from the block for mark w_i to independent (j-1)-sets in J_i. The blocks partition the counted sets, proving q_j=sum_i i_(j-1)(J_i). Since q_j=i_j(H)-i_j(H-W), subtracting consecutive ranks gives q_(k+1)-q_k=Delta_k(H)-Delta_k(H-W), the exact pointwise quantity at issue. For cover loss, an optimal cover of J_i together with all vertices of D_i except w_i covers H: no edge from w_i reaches J_i, and every other edge omitted from J_i has an endpoint in D_i minus {w_i}. Thus tau(J_i)>=tau(H)-(ell_i-1). Nonisolated-first ordering makes ell_i>=2 in each block, provided a nonisolated mark exists.

In the tree specialization, removing an original leaf v and its support u leaves H with alpha(H)=alpha(T)-1 and tau(H)=tau(T)-1. Every component of H attaches to u at a vertex in W=N_T(u)\\{v}; if H has an edge, at least one such marked vertex is nonisolated. The assumed cover threshold gives tau(H)>=c=ceil(3s/2). With d=s+2-ell, the arithmetic ell-1+m(d)<=c holds for m(d)=ceil(3d/2)-1 and d>=2. Since J_i is a forest, tau(J_i)=nu(J_i), supplying the required matching size. For d>=3, however, the independent rank gate r=p-2>=K(d) remains a separate premise. For d<=1, |J_i|=2r+d<=2r+1 and incidence double counting yields i_(r+1)(J_i)<=i_r(J_i). The d=2 exception depends on the cited first-wide result when the generic rank gate does not apply; I retain it only as an inherited theorem application, not as a newly proved result here.

At s=5, c=8 and q=p-2 give outside size N=2p-3=2q+1. The empty-cover binomial difference is zero by symmetry, while the first nonempty-cover floor is -8 Cat_(q-1), strictly negative for q>=1. Therefore this particular cover-Catalan lower bound cannot prove the needed positive prehistory. This verifies a method cutoff only.

## Limits

The conditional argument can establish a pointwise sign, and hence a nonpositive sum over any fixed leaf subset, only in cases satisfying its cover, rank, and inherited residual-sign premises. No evidence here proves these conditions for every eligible tree, classifies the s=4 low-cover window, resolves the s>=5 cases, refutes the pointwise shell assertion, or proves/refutes the primary aggregate. The exact favorable selector is consequently not independently re-evaluated on a witness; no witness is asserted.
