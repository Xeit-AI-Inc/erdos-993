# C5-T3 independent search report

## Scope and disposition

I reviewed the registered claim **E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS** at its exact scope: for every nonempty ordinary arity-2/3/4 path-star, every represented original tip branch (i), and every integer (1\le k\) with (2k\le N+2),
\[
(h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E)\ge0,
\qquad M_k(E)=E[k]C[k]-E[k+1]C[k-1],
\]
where (h=1+2a_2+4a_3+7a_4), (E=z(1+z)^N), and coefficients are zero-extended. The claim has no actual-eligibility premise. I found no universal proof or guarded counterexample. Its status remains **proposed_open**; all computation below is bounded evidence.

## Proof route checked

Let (U_i=G B_{r_i-1}H_i), so (A_i=U_i+E). The admitted enlarged-order ULC bound for (C), together with the elementary main-product ratio inequality (U_i[k+1]/C[k+1]\le U_i[k]/C[k]), gives, on the positive guarded support,
\[
M_k(U_i):=U_i[k]C[k]-U_i[k+1]C[k-1]
\ge \frac{h+1}{(k+1)(h-k+1)}U_i[k]C[k].
\]
Indeed ULC gives (C[k]^2-C[k-1]C[k+1]\ge\frac{h+1}{(k+1)(h-k+1)}C[k]^2), and the ratio inequality replaces (U_i[k+1]) by (U_i[k]C[k+1]/C[k]). Since (M_k(A_i)=M_k(U_i)+M_k(E)), the registered surplus condition is sufficient for (M_k(A_i)\ge0). This verifies the conditional reduction, not its all-profile premise. The positive denominators are valid on the exact band: (h\ge N+1), (k\ge1), and (2k\le N+2).

The local ULC orders 2/4/7, convolution result, and Cauchy–Binet technology are already in the predecessor proof. They are dependencies, not new findings here. The older large-(m) condition (217(j+1)\epsilon<1) bounds perturbation errors after local mixed-minor estimates; no implication from it to this pointwise (M_k(E))-versus-(U_i[k]C[k]) threshold is established. It also leaves a finite prefix to handle. The exact-ratio condition would be a useful route past that prefix if proved, but current evidence does not do so. The endpoint (A_0) remains separate.

## Independent exact checks

I copied the two authorized producer scripts into this scratch and reran them with bytecode disabled. They reproduce the declared horizons: 1,770 profiles and 109,175 tip/rank checks through (m=20), with no exact-surplus failures; and 49 designated larger profiles with 15,024 checks, again with no exact-surplus failures. These are finite diagnostics, not a proof.

I also wrote and ran [independent_audit.py](cycles/cycle-5/C5-T3/independent_audit.py), using direct integer polynomial convolution and zero-extended coefficient access. It confirms:

- For ((a_2,a_3,a_4)=(0,0,4)), (N=16,h=29,k=8,r_i=4), the exact surplus is (45{,}380{,}234{,}160>0), and the full tip minor is (403{,}556{,}560>0). The proposed coarse substitution has signed margin (-87{,}840). This rank is in the surplus band but is not actually eligible: the actual first strict descent is (x=9), so (x+2\le k) fails.
- For ((0,0,24)), (N=96,h=169,k=49,r_i=4), (x=47), and (n=123). All actual rank guards hold: (x+2=49), (3k=147<197=2\alpha+1), and (2k=98=\alpha). The coarse substitute fails with margin (-1134884788104385426929377214036680), while the exact surplus is (416966184785614418980331915462512401919889476953795417377960>0) and the full tip minor is (166911134911797534926692741290712108134697953494130307258>0). This refutes the coarse estimate at an actually eligible rank, not the exact condition or the shifted comparison.
- For ((0,22,0)), (N=66,h=89,k=27), the E-only minor is negative, (M_k(E)=-518620474811633289768751398606375936), while the exact surplus and full tip minor are positive. Here too (x=32), so (x+2\le k) fails; this is a guarded mechanism control rather than an actual eligible rank.

The last two exact values in each bullet use the registered zero-extension convention. The raw independent output is [independent_audit.json](cycles/cycle-5/C5-T3/independent_audit.json). The copied producer files are [producer_surplus.py](cycles/cycle-5/C5-T3/producer_surplus.py) and [producer_controls.py](cycles/cycle-5/C5-T3/producer_controls.py); replay from this directory with `PYTHONDONTWRITEBYTECODE=1 python3 producer_surplus.py`, `PYTHONDONTWRITEBYTECODE=1 python3 producer_controls.py`, and `PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py > independent_audit.json`.

## Evidence boundaries and source integrity

The common dispatch manifest has 237 members; all 237 actual files match their manifest SHA-256 values. The packet has no additional source files or per-file hashes (`allowed_source_files=[])); I used the common neutral sources authorized by dispatch. The copied producer scripts retain the source hashes.

The relative main-mark margin is formally verified only at its stated coefficient scope. The exact-ratio surplus remains an informal proposed sufficient condition with bounded checks. The already accepted all-parameter selected aggregate is computer-assisted/nonformal and does not prove this structural surplus. No primary payment or formal-stop conclusion follows here. Original tag multiplicities, strict current-(p) selectors, actual first descent, and the distinct ranks (1\le k,2k\le N+2) versus actual eligibility are unchanged.
