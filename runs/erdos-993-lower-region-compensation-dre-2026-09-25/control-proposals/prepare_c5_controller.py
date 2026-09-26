from pathlib import Path
import sys,json,importlib.util,collections
B=Path(__file__).resolve().parents[1];sys.path.insert(0,str(B/'scripts'));import controller_ops_v2 as C
W=C.W
reg=W.load_json(B/'control/C5-REGISTERED-CLAIM-IDENTITY.json');claims=reg['claims'];lookup={c['claim_key']:c for c in claims}
assert len(claims)==428
for key in ['E993-ORDINARY-TM-LOWER-REGION-AGGREGATE','E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE']:assert lookup[key]['status']=='OPEN'
assert all((B/'manifests'/f'C4-{w}.json').is_file() for w in ['AT','AF','AU','SYNTHESIS'])
assert (B/'cycles/cycle-4/CONTROLLER-CLOSEOUT.md').is_file()
counts=collections.Counter(c['status'] for c in claims)
W.fresh_json(B,'inputs/C5-TRANSITIVE-REFUTED-CLAIMS.json',{'source':'control/C5-REGISTERED-CLAIM-IDENTITY.json','source_sha256':W.digest(B/'control/C5-REGISTERED-CLAIM-IDENTITY.json'),'claims':[c for c in claims if c['status']=='REFUTED']})
a=W.load_json(B/'control-proposals/C5-SEARCH-ALLOCATION-DRAFT.json');a['status']='controller approved C5 allocation after completed C4 and independent intake review';a['common_rule']+=' Current registry428,96 exact refutation fences. First-shell formally verified; T_m all-m candidate remains OPEN pending this cycle.'
W.fresh_json(B,'control/C5-SEARCH-ALLOCATION.json',a)
handoff='''# Cycle5 neutral handoff and current authority

The fixed primary remains the complete ordinary-tree lower-region favorable-leaf aggregate in SOLUTION-CONTRACT.md. Keep original leaves/supports, strict selector and alpha guard, every tag, integer zero extension and terminal first descent. Current428-claim snapshot:255 VERIFIED,96 REFUTED,26 CONDITIONAL,51 OPEN, mixed grades. Exact current keys live in C5 registry/ledger; use targeted lookup rather than reading every historical record. Historical packets keep their original scopes/counts and are not current authority. All worker/candidate outputs remain challengeable evidence, never self-awards.

Cycles1..4 each completed18 searches/36 critics/3 adjudicators/1 synthesis. Formal awards already retained: marked-isolate and ordinary-leaf order bands, plus first-shell pointwise and aggregate at n=2p+2 with early descent. The pointwise first-shell theorem needs no alpha or selector. Full lower-region and all-rank ordinary aggregate, governed beta aggregate, TREE/FOREST/Erdos993 stay OPEN. Code r29 high-tail and top-rank results are preserved. No new ordinary/governed bridge is assumed.

Cycle4 separately refuted the specified signed alternating deletion/least-eligible retagging operator and local marked-indicator/addability nonpositive covariance in H_v. K1,12,p8 signed kernel has fullS=-1980; order24,p10,v0 covariance1773113/13677^2>0 has fullS=-51095. These do not refute the primary, CT_x, or the expanded unsigned two-for-one Hall relation. Current96 refutations are explicitly pinned in inputs/C5-TRANSITIVE-REFUTED-CLAIMS.json. Same-current-rank global covariance and local covariance are different identities.

Exact coordinates k=p-1,Q=sum q_v(k),U=sum q_v(k+1),E=actual addability,C=number of multiply marked upper sets once per tag: E=kU+C,kS=E-C-kQ. M_H uses open neighborhoods inside H_v and kS=(n-2p)Q-M_H-C. In T variables B=A union{v}, the coefficient is n-2p+1 with M_T=M_H+Q. CT_x implies flat E<=(x+1)Q, implies current E<=kQ, implies E-C<=kQ; flat=current only whenp=x+2. Equivalent rewrites alone are not progress on the missing budget.

New C5 input: independently audited COMPUTER-ASSISTED candidate for every exact T_m (path0-1-2 plus m three-tip claws at0), m>=1, every eligible rank. Central LC and mixed minors for A0,Astar,R=Q_all/z, j=m..2m+2: exact finite base m3..999 and analytic bounds m>=1000. Independent recurrence replay checked1,507,464 margins of each type,276,938 eligible rows, no failures. Both strict original leaf-orbit selectors and fullS<0 are derived. This is held OPEN for C5 adversarial review. No Lean certificate exists. B=(1,4,3,1) is finite-order ULC4, NOT ULC3; imported Liggett/Gurvits convolution hypotheses and exact finite endpoints require challenge. R27 n<=4x places crossing in central range. No P logconcavity or no-recovery is assumed. The new normalized-binomial ratio observation and heterogeneous extension are unawarded leads, not extra premises.

Broader five axes: bounded heterogeneous star factors with distributed marked terms; selected matching-slack charging; strict selector/closure and proper-selector witnesses; concrete unsigned cross-tag/mixed-boundary certificates; marked-shell/low-cover arguments. At most three shell searches. Read your allocated lens. Seek a proved new step or a precise realizable obstruction, not only repeated negative samples. The matching-slack identity by itself is another exact rewrite and needs an across-tag weighted bound.

Corrections: first-mark differences use Delta_(j-2), deleting earlier mark vertices only; six-cover polynomial product is over centers c not in I, not outside N[I]; include original leaves among cover vertices; T_m claw selector needs factor(1+2z). C4F3 correctC108945,E1648440; incorrect paired E/C can cancel in the identity and conceal a counting bug. C4AF RETURN permutes F5/F6/E993-Tm statements: use its explicit erratum and C4synthesis corrected mapping. F5 finite boxes, F6 finite sorted-arm census, E993-Tm all-m OPEN in historical C4. Rooted graphs require complete leaf inventory. CB graph recipe and selector evaluator are available; missing mixed capacity is mathematical, not unavailable input.

Use checked evaluator and exact graph/rank guards. No agent spawning, Lean runs/builds, background jobs, registry edits or awards from a route. Search/critics Luna high, other stages Sol high, max3 active seats plus controller. Public primary research permitted with precise hypotheses and bridges. Full18/36/3/1 stages required; controller owns evidence-grade decisions. Cycle6 and final Astra analysis remain authorized and required.
'''
with (B/'control/C5-NEUTRAL-HANDOFF.md').open('x') as f:f.write(handoff)
brief='''# Cycle5 independent criticism

Independently audit every case claim, exact claim-ID/statement assignment, domain and evidence grade; do not merely repeat a producer algorithm. Retained/retained_narrowed/rejected with every covered ID. A finite computation is not an all-parameter result. Verify all original leaves, supports, selectors, terminal first descent and full sum. C must be counted inside H_v and once per upper marked set per tag; wrong E/C may cancel. No statuses from votes.

The T_m root proof and earlier Sol audit are challengeable: check finite-order ULC4 for B, exact cited convolution hypotheses, Poisson margin, mixed-minor orientation, falling-factorial ranges, rational cutoff, finite base and original-graph bridge. Smaller certificates need independent exact verification. Positive mixtures of LC sequences are not automatically LC. No P no-recovery assumption is allowed. Formal versus computer-assisted versus conditional evidence must stay separate.

Preserve current96 exact refutation fences. Signed boundary cancellation refutes the specified map, not unsigned Hall; local/global/current/early covariance statements are different. Source corrections and neutral handoff are binding scope information, not mathematical premises beyond their evidence. Copy producer replays into own scratch before execution; no sealed-source writes, agents, registry changes or Lean builds.
'''
with (B/'control/C5-CRITIC-BRIEF.md').open('x') as f:f.write(brief)
review='''# C5 controller intake reconciliation

C4 synthesis and all58 seats are admitted, and controller closeout read. The independent preparation review's four conditions are discharged: inherited C4 allowed files are directly pinned; final fence statements/replays/evidence are directly pinned; compact current neutral handoff replaces mandatory full registry reads; current snapshot is the guarded post-C4 canonical registration, preserving all426 earlier claim objects and adding only2 exact finite refutations. Its status/statement/scope ledger is linted. T_m and primary remain OPEN. Historical first-shell informal words are reconciled with its later official formal award, not silently rewritten.

The draft builder remains an unrun proposal. This controller installer supplies the corrected final packet. C4AF identity permutation is corrected append-only and by synthesis. All root candidates remain challengeable. No new formal award at intake. Current models/counts follow user authorization.
'''
with (B/'control/C5-INTAKE-RECONCILIATION.md').open('x') as f:f.write(review)
paths={p['path'] for p in W.load_json(B/'packets/C4-COMMON.json')['allowed_source_files']}
spec=importlib.util.spec_from_file_location('draft_builder',B/'preparation/C5-PREP-PACKET-BUILDER/build_intake.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
for group in mod.fixed_sources().values():paths.update(group)
for w in ['C4-AT','C4-AF','C4-AU','C4-SYNTHESIS']:
 paths.update(str(p.relative_to(B)) for p in (B/'cycles/cycle-4'/w).iterdir() if p.is_file())
for w in ['C4-PREP-FINAL-FENCE-IDENTITIES','C5-PREP-INTAKE-REVIEW']:
 paths.update(str(p.relative_to(B)) for p in (B/'preparation'/w).iterdir() if p.is_file())
paths.update(['control/C5-REGISTERED-CLAIM-IDENTITY.json','ledgers/C5-OBLIGATIONS.csv','inputs/C5-TRANSITIVE-REFUTED-CLAIMS.json','control/C5-SEARCH-ALLOCATION.json','control/C5-NEUTRAL-HANDOFF.md','control/C5-INTAKE-RECONCILIATION.md','control/C5-CRITIC-BRIEF.md','cycles/cycle-4/CONTROLLER-CLOSEOUT.md','control/C3-FIRST-SHELL-FORMAL-AWARD.md','control-proposals/tm_central_lc_base.py','control-proposals/tm_central_lr_base.py','receipts/C4-FINAL-REGISTRATION.json','receipts/C4-FINAL-REGISTRATION-LINT.json'])
for rel in paths:W.member(B,rel)
common={'schema':'e993.lower.common.v1','cycle':5,'authority':'controller-owned current C5 snapshot; worker returns and root candidates proposed only','read_first':['SOLUTION-CONTRACT.md','WORKER-PROTOCOL.md','EXECUTION-POLICY.md','control/C5-NEUTRAL-HANDOFF.md','control/C5-INTAKE-RECONCILIATION.md','control/C5-SEARCH-ALLOCATION.json'],'source_access':'Exact common and stage-case pins only. Older allowed evidence retains historical scope. Current-cycle synthesis reads only its three adjudicator outputs plus necessary common scope controls. No current raw routes/critics or private transcripts. Root candidates are explicitly challengeable.','allowed_source_files':[{'path':r,'sha256':W.digest(B/r)} for r in sorted(paths)]}
W.fresh_json(B,'packets/C5-COMMON.json',common)
C.gates('C5-INTAKE');W.seal(B,sorted(paths)+['packets/C5-COMMON.json','receipts/C5-INTAKE-lint.json','receipts/C5-INTAKE-paths.json'],'manifests/C5-INTAKE.json')
for o in 'TFU':
 for n in range(1,7):C.case(f'C5-{o}{n}',f'C5-{o}{n}-CASE')
print(json.dumps({'cycle':5,'sources':len(paths),'claims':len(claims),'counts':dict(counts),'search_cases':18}))
