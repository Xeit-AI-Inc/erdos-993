import json
from pathlib import Path
s=Path(__file__).resolve().parent
prefix='cycles/cycle-6/C6-AF/'
def ev(*names):return [prefix+x for x in names]
claims=[
{'claim_id':'C6-F1.Tm-cutoff400-audit',
 'statement':'For the path-plus-three-tip T_m family, the exact central LC and mixed-minor recurrence checks pass for 3<=m<=399, all four cutoff-400 rational endpoint quantities are <1, and literal T_m graph polynomial identities agree for m=1,2,3.',
 'scope':'Finite coefficient ranks m<=j<=2m+2, 3<=m<=399; cutoff arithmetic at m=400; three tiny graph checks. No new all-m family or arbitrary-tree proof is awarded by this audit.',
 'status':'proposed_bounded_computation','evidence_paths':ev('F1-REPLAY-output.json','REPORT.md'),
 'reason':'retained_narrowed: exact scratch replay agrees with source and two critics; unperformed inherited analytic and selector checks do not refute the candidate, but limit this source audit.'},
{'claim_id':'C6-F2-HETEROGENEOUS-CUTOFF2000-SCALAR-AUDIT',
 'statement':'For A=2/3-29/(2m), B=1/3-95/(2m), epsilon=29!/((m-29)^29 A^28 B^92), one has 80328 m epsilon<1 for every integer m>=2000.',
 'scope':'Scalar perturbation lemma for path-plus-private-star arities 2..4; rank placement is conditional on n=N+m+3, alpha=N+2 and the forest descent bound. It does not by itself prove the family aggregate.',
 'status':'proposed_verified','evidence_paths':ev('REPORT.md'),
 'reason':'retained_narrowed: falling-factorial quotient is decreasing over the central interval, exact endpoint fraction is below one, and the scalar decreases for m>=2000. Both critics independently recomputed the arithmetic; graph and mixed-minor bridges were not completed in F2.'},
{'claim_id':'E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE',
 'statement':'For every path 0-1-2 with m>=100000000 centers adjacent to 0 and 2<=r_i<=12 private leaves at center i, at every p with x+2<=p and 3p<2alpha+1, every original leaf is strictly favorable and the complete distinct-tag sum S is <0.',
 'scope':'Exactly this ordinary-tree restricted family and its strict lower-region ranks; depends on the checked exact 121 grouped-factor finite-ULC certificate and Gurvits finite-ULC convolution theorem. No m<100000000, arbitrary tree, or Lean/kernel certificate.',
 'status':'proposed_verified','evidence_paths':ev('ARITY12-VERIFICATION.json','verify_arity12.py','REPORT.md'),
 'reason':'retained: the adjudicator independently audited the case-listed post-critique envelopes, graph and tag formulas, all 121 factors and exact cutoff, uniform monotonicity, mixed minors, LC and selector propagation. The critics had left these estimates unchecked; no mathematical defect was found. The producer’s individual-tip=zZ_i phrase is corrected to the pooled identity only.'},
{'claim_id':'C6-F4.MATCHING-SUPPORT-INJECTION',
 'statement':'The rule matching each active selected leaf tag of every independent (p+1)-set to a distinct own-support vertex fails on the eligible T_22 tree at p=34: one rank-35 set has 33 active tags on 11 own supports.',
 'scope':'One explicit ordinary tree and one independent set; only unit-capacity leaf-to-own-support injection. Its complete 67-term S is negative.',
 'status':'proposed_refuted','evidence_paths':ev('F4-REPLAY-output.json','REPORT.md'),
 'reason':'retained: scratch replay matches the sealed witness, selector and guards; pigeonhole proves failure of this exact mechanism. It is not a counterexample to the aggregate.'},
{'claim_id':'C6-F5-HETEROGENEOUS-DIRECT-FLOW',
 'statement':'On profiles (2,3,4) at p=7 and (2,2,4,3) at p=8, the producer’s deletion-plus-two-for-one networks with weight w_old(I)=|F intersect I| saturate supplies 1563 and 8751; independently computed complete sums are -1218 and -5434.',
 'scope':'Two listed labeled ordinary trees and their unique eligible ranks; the producer flow uses w_old, not the active-tag target weight. No target-weight Hall inference follows from the original flow.',
 'status':'proposed_bounded_computation','evidence_paths':ev('FLOW-VERIFICATION.json','verify_corrected_flow.py','REPORT.md'),
 'reason':'retained_narrowed: both critics replayed the original finite flows but missed the weight defect. Independent adjudicator enumeration finds old supply-minus-capacity -1406 and -6717, unequal to S. The negative full sums remain valid; target-specific original flow claim is rejected.'},
{'claim_id':'C6-F6.SPIDER-SELECTOR-BOUNDED',
 'statement':'For equal-length-three rooted spiders r-a_i-b_i-c_i with 2<=m<=40, alpha=2m, x=m; every one of 222 eligible (m,p) rows selects all m original endpoint leaves and has a strictly negative complete sum.',
 'scope':'Exactly 39 finite spiders and all eligible ranks in that boundary. No unbounded selector theorem or arbitrary-tree conclusion.',
 'status':'proposed_bounded_computation','evidence_paths':ev('evidence.json','F6-replay-copy.py','REPORT.md'),
 'reason':'retained: scratch replay is byte-identical to sealed evidence and the root-conditioned polynomial formulas preserve every original tag and support.'},
{'claim_id':'C6-AF.F5-ACTIVE-WEIGHT-CORRECTED-FLOWS',
 'statement':'For profiles (2,3,4),p=7 and (2,2,4,3),p=8, the target active-tag weighted literal deletion-plus-two-for-one networks have complete flow/supply 1483/1483 and 8033/8033, with capacities 2701 and 13467 and complete S=-1218 and -5434.',
 'scope':'Two finite labeled ordinary trees at their only eligible ranks, based on the separately attributed post-critique correction and independently checked literal arcs, guards, selectors and weights; no orbit lifting or universal Hall theorem.',
 'status':'proposed_bounded_computation','evidence_paths':ev('FLOW-VERIFICATION.json','verify_corrected_flow.py','REPORT.md'),
 'reason':'derived adjudicator claim: every positive corrected arc was checked against actual graph adjacency and rank, source/sink capacities and total saturation; active-weight supply minus capacity equals the separately recomputed S in both cases.'}
]
covered=['C6-F1.Tm-cutoff400-audit','C6-F2-HETEROGENEOUS-CUTOFF2000-SCALAR-AUDIT','E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE','C6-F4.MATCHING-SUPPORT-INJECTION','C6-F5-HETEROGENEOUS-DIRECT-FLOW','C6-F6.SPIDER-SELECTOR-BOUNDED']
d={'worker_id':'C6-AF','cycle':6,'stage':'adjudication','orientation':'N','claims':claims,'report_path':prefix+'REPORT.md','limitations':['The arbitrary ordinary-tree lower-region aggregate remains OPEN: no global selected marked-deficit budget or exact full counterexample is supplied.','The F3 restricted theorem is an informal, non-Lean proof dependent on Gurvits finite-ULC convolution and an exact finite factor certificate; its arity-12 finite prefix below m=100000000 is uncovered.','F1 and F2 audits alone do not establish their corresponding full family theorems; F4 rejects only a specific matching rule; F5 and F6 conclusions are finite.'],'status_authority':'proposed_worker_only','covered_claim_ids':covered}
(s/'RETURN.json').write_text(json.dumps(d,indent=2)+'\n')
print('written',len(claims),'claims',len(covered),'covered')
