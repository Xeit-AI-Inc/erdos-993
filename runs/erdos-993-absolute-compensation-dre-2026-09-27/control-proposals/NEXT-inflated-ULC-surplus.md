# Private enlarged-order ULC curvature and surplus lead

IMPORTANT IDENTITY RECONCILIATION: the enlarged-order ULC factors2/4/7 and Gurvits convolution theorem are ALREADY used in the admitted sources/predecessor/hybrid-family-proof.md, Uniform lower-half tail section, together with a Cauchy–Binet main-minor bound. They are not new discoveries or new unregistered mathematical claims. Reuse the existing source. The prospective contribution here is only the sharper explicitly arranged compensation condition and investigation of whether it works throughout the guarded range without the old finite prefix. Compare it against the existing quantitative217(j+1)epsilon<1 tail certificate, not just against a generic LC bound. The fresh reviewer must not duplicate an existing ULC/helper identity or call re-derivation new progress.

Not a current C4 premise, new canonical claim or formal award. Independent identity/proof review is required before later dispatch. Keep this distinct from REFUTED E993-PATH-STAR-FULL-BRACKET-DEGREE-ULC: that concerns a different full bracket R normalized by its actual degree. Here the object is C=G product B_r, and the binomial normalization order is deliberately larger than its degree.

The local coefficient vectors B2=(1,3,1), B3=(1,4,3,1), B4=(1,5,6,4,1) are ultra-log-concave of orders2,4,7 respectively. Dividing by binomial coefficients of those orders gives (1,3/2,1), (1,1,1/2,1/4,0), and (1,5/7,2/7,4/35,1/35,0,0,0); all adjacent LC gaps are exactly nonnegative. G=(1,2) is ULC of order1. The exact finite checks of these local hypotheses are in the companion script/JSON, including padded zeros and interval support.

Primary source inspected: Leonid Gurvits, A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences, https://arxiv.org/pdf/0804.1181 . Definition and Theorem1.1 state that convolution adds finite ULC orders; Remark1.2 treats the nonnegative case by approximation. Its proof uses mixed volumes and the Alexandrov-Fenchel inequality. Applied here, it yields ULC order h=1+2a2+4a3+7a4 for C, not order N+1. This use is an informal source-dependent derivation, not a Lean-imported theorem. The normalized sequence has no internal zeros. The source must not be used to assert real-rootedness or ULC of the full parent or full bracket.

Consequently, for interior positive ranks,
C[k-1] C[k+1]/C[k]^2 <= k(h-k)/((k+1)(h-k+1)).
Combining this with the separately derived main-product LR relation U_i[k+1]/C[k+1]<=U_i[k]/C[k] gives
U_i[k]C[k]-U_i[k+1]C[k-1] >= lambda_k U_i[k]C[k],
where lambda_k=(h+1)/((k+1)(h-k+1)). Here U_i=G B_(r_i-1)H_i and the actual deletion A_i=U_i+E, E=zL^N. Every divisor is positive in the registered guarded rank band.

Thus a sufficient, still UNPROVED all-profile condition for the tip shifted comparison is
(h+1)U_i[k]C[k] + (k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1]) >=0.
This retains the actual C ratio and quantifies the needed compensation. It does not address the endpoint A0 automatically. The companion exact diagnostic tests109175 represented-tip/rank instances in1770 profiles through m20 with no failure of this sufficient condition. That is bounded evidence only, not a universal proof, and no minimum-margin theorem is asserted.

A tempting further simplification FAILS. The existing C2 coefficient operator gives C[k]/C[k-1] >= 2(N+2-k)/(3k). Substituting this lower bound reduces sufficiency to
2(N+2-k)(h+1)U_i[k] >= E[k](N-k-1)(k+1)(h-k+1).
The substitute is in the correct inequality direction but too weak: allr4,m4,N16,h29,k8 has U_i[k]=26280,E[k]=11440 and signed margin -87840. This does not refute the exact-ratio sufficient condition or the actual shifted comparison. Preserve this failed simplification rather than feeding a worker a falsely asserted general bound.

Next investigation: prove the sharper surplus using a profile-sensitive ratio bound, coefficient identities or paired center layers; or refute it exactly and keep the underlying curvature lemma. It may provide a substantive quantitative entry for the C5 main-minor route, but not a reason to reopen the accepted computer-assisted primary. Existing alias/key checks and a fresh proof review must determine whether the ULC helper or its stronger surplus mechanism needs a distinct registered identity. No novelty claimed.

For the weaker weighted target, set U=sum_i r_i U_i and W=U+N E. The common-C main-minor bounds sum directly with the positive r_i, yielding the same lambda bound for U. It suffices to prove (h+1)U[k]C[k]+(k+1)(h-k+1)N(E[k]C[k]-E[k+1]C[k-1])>=0. This is weaker than requiring every tip surplus separately, requires no endpoint inequality, and better matches the selector route. It is still unproved universally. The individual bounded successes imply weighted bounded successes on those same represented profiles by exact summation, not arbitrary LR sum closure.

For independent review the downloaded primary PDF and extracted text are retained locally as NEXT-Gurvits-0804.1181.pdf/.txt with source metadata/hash. These are reference material only. Public publication should link to the primary paper and publish our derivation, not redistribute the full PDF/text by default.

Larger deterministic controls in NEXT-inflated-ULC-surplus-controls.py/.json cover49specifiedprofiles through300branches and15024represented-tip/guarded-rankinstances, with no exact-ratio surplus failure. This is not an exhaustive larger range. The crude C2-ratio simplification fails at6actualeligible tip/rankinstances in these controls, so its weakness is not confined to ranks with no eligibility. All controls retain actual first descent and original coefficients; no universal award follows.
