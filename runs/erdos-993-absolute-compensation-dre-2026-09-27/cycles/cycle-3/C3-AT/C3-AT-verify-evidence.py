"""Check sealed inputs and exact output comparisons. Run with the run root argument."""
import hashlib
import json
import sys
from fractions import Fraction
from pathlib import Path

ROOT = Path(sys.argv[1]).resolve()
HERE = Path(__file__).resolve().parent

def sealed(members):
    bad=[]
    for item in members:
        file=ROOT/item['path']
        if not file.is_file() or hashlib.sha256(file.read_bytes()).hexdigest()!=item['sha256']:
            bad.append(item['path'])
    return {'members':len(members),'mismatches':bad}

out={}
for name in ('C3-COMMON-DISPATCH','C3-TRANSPORT-CLARIFICATION','C3-CRITIQUE-TRANSPORT'):
    data=json.loads((ROOT/'manifests'/f'{name}.json').read_text())
    out[name]=sealed(data['members'])
packet=json.loads((ROOT/'packets/C3-AT.json').read_text())
out['C3-AT-packet']=sealed(packet['allowed_source_files'])

prefix_source=json.loads((ROOT/'sources/cycle3/C3-small-prefix-check.json').read_text())
prefix_copy=json.loads((HERE/'C3-AT-prefix-producer.json').read_text())
prefix_ind=json.loads((HERE/'C3-AT-independent-prefix.json').read_text())
assert prefix_source==prefix_copy
errs=[]
for source,ind in zip(prefix_source['layers'],prefix_ind['layers']):
    for a,b in [('profiles','profiles'),('eligible_rows','eligible_rows'),
                ('MASS_failures','mass_failures'),('primary_failures','payment_failures'),
                ('local_failures','local_failures'),('not_all_selected_rows','nonfull_rows')]:
        if source[a]!=ind[b]:errs.append([source['m'],a])
    for a,b in [('min_MASS_ratio','minimum_mass'),('min_primary_ratio','minimum_payment'),
                ('min_local_ratio','minimum_local')]:
        if (source[a] is None)!=(ind[b] is None):errs.append([source['m'],a])
        elif source[a] is not None and Fraction(int(source[a]['numerator']),int(source[a]['denominator']))!=Fraction(ind[b][0],ind[b][1]):
            errs.append([source['m'],a])
out['prefix']={'profiles':prefix_ind['profiles'],'eligible_rows':prefix_ind['eligible_rows'],
               'MASS_failures':prefix_ind['mass_failures'],'payment_failures':prefix_ind['payment_failures'],
               'local_failures':prefix_ind['local_failures'],'nonfull_rows':prefix_ind['nonfull_rows'],
               'source_equals_copied_replay':prefix_source==prefix_copy,
               'independent_layer_mismatches':errs}

scalar_source=json.loads((ROOT/'sources/cycle3/C3-balanced-finite-check.json').read_text())
scalar_copy=json.loads((HERE/'C3-AT-scalar-producer.json').read_text())
scalar_ind=json.loads((HERE/'C3-AT-scalar-independent-copy.json').read_text())
assert scalar_source==scalar_copy
serrs=[]
for a,b in zip(scalar_copy['rows'],scalar_ind['rows']):
    if (a['tested_states']!=b['states'] or a['excluded_states']!=b['excluded'] or
        tuple(a['minimizer'][x] for x in ('N','r','j'))!=tuple(b['minimizer']) or
        Fraction(int(a['minimum_ratio']['numerator']),int(a['minimum_ratio']['denominator']))!=Fraction(b['min_ratio'])):
        serrs.append(a['m'])
out['scalar']={'states':scalar_ind['states'],'excluded':scalar_ind['excluded'],
               'source_equals_copied_replay':scalar_source==scalar_copy,
               'independent_layer_mismatches':serrs}
assert not any(v['mismatches'] for k,v in out.items() if 'members' in v)
assert not errs and not serrs
(HERE/'C3-AT-evidence-audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
