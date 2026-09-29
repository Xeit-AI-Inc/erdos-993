"""Independent integrity and exact scalar checks for the C6-U3 critique."""
import hashlib
import json
from fractions import Fraction
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
OUT = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27/scratchpad/C6-CT-U3')
manifest = json.loads((B/'manifests/C6-COMMON-DISPATCH.json').read_text())
packet_path = B/'packets/C6-CT-U3.json'
packet = json.loads(packet_path.read_text())
checks=[]
for row in manifest['members']:
    path=B/row['path']
    actual=hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else 'MISSING'
    checks.append({'path':row['path'],'actual':actual,'expected':row['sha256']})
for row in packet['allowed_source_files']:
    path=B/row['path']
    actual=hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else 'MISSING'
    checks.append({'path':row['path'],'actual':actual,'expected':row['sha256']})
bad=[row for row in checks if row['actual']!=row['expected']]

# Exact rational checks of the two inequality substitutions. The symbolic
# arguments and scope restrictions are recorded in REPORT.md.
scalar=[]
# kappa*delta = 1+(delta-1)(1-t) >= 1; equality boundary delta=1.
for delta in (1,2,5):
    for t in (Fraction(0),Fraction(1,3),Fraction(2,3),Fraction(1)):
        kappa=1-t+t/Fraction(delta)
        value=delta*kappa
        assert value == 1+Fraction(delta-1)*(1-t) and value >= 1
        scalar.append({'check':'kappa_delta','delta':delta,'t':str(t),'value':str(value)})
# From (delta-1)T_j C[j+1] >= delta T[j+1]C[j], with positive C[j],
# divide in the correct direction and attain the resulting bound exactly.
for delta,t,Tj in ((1,Fraction(2,3),9),(4,Fraction(1,3),12),(5,Fraction(2,3),30)):
    cden, cnum=t.denominator,t.numerator
    bound=Fraction(delta-1,delta)*t*Tj
    Tnext=bound
    lhs=(delta-1)*Tj*cnum
    rhs=delta*Tnext*cden
    assert lhs==rhs and Tnext<=bound
    kappa=1-t+t/Fraction(delta)
    assert Tnext-Tj == -kappa*Tj
    scalar.append({'check':'relative_margin_substitution_equality','delta':delta,'t':str(t),'Tj':Tj,'Tnext':str(Tnext),'kappa_Tj':str(kappa*Tj)})
# The 3/2 local payment covers B tip multiplicity plus optional endpoint
# debt for every represented B>=2, including the sharp smallest B=2 case.
for Btips in (2,3,4,8):
    for endpoint in (0,1):
        assert Fraction(3,2)*Btips >= Btips+endpoint
        scalar.append({'check':'branch_payment','B':Btips,'e0':endpoint,'lhs':str(Fraction(3,2)*Btips),'rhs':Btips+endpoint})

result={
 'manifest_member_count':len(manifest['members']),
 'packet_allowed_source_count':len(packet['allowed_source_files']),
 'checked_file_count':len(checks),
 'mismatch_count':len(bad),
 'mismatches':bad,
 'packet_sha256':hashlib.sha256(packet_path.read_bytes()).hexdigest(),
 'exact_scalar_checks':scalar,
 'all_assertions_pass':not bad,
}
(OUT/'audit-evidence.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'manifest_member_count':len(manifest['members']),'checked_file_count':len(checks),'mismatch_count':len(bad),'scalar_checks':len(scalar),'all_assertions_pass':not bad},indent=2))
