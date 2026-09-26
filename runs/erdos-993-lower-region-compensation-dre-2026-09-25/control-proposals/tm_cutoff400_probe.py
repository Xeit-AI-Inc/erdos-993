from pathlib import Path
import importlib.util,hashlib,json
from fractions import Fraction as F
from math import factorial
B=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('tm_independent',B/'preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/REPLAY.py');a=importlib.util.module_from_spec(spec);spec.loader.exec_module(a)
M=400;eps=F(factorial(17)*(3*M)**54,(M-17)**17*(2*M-14)**16*(M-39)**38)
ratios={name:c*(2*M+3)*eps for name,c in [('LC',F(24)),('A0',F(47)),('Astar',F(431)),('R',F(14688,21))]}
assert all(0<v<1 for v in ratios.values())
shaLC=hashlib.sha256();shaLR=hashlib.sha256();count=0;smallestLC=None;smallestLR=None
for m in range(3,M):
 P,zs=a.polys(m)
 for name,z in zs.items():
  for j in range(m,2*m+3):
   lc=z[j]**2-z[j-1]*z[j+1];lr=z[j]*P[j+1]-z[j+1]*P[j]
   assert lc>0 and lr>0,(m,name,j)
   shaLC.update(f'{m}:{name}:{j}:{lc}\n'.encode());shaLR.update(f'{m}:{name}:{j}:{lr}\n'.encode());count+=1
   if smallestLC is None or lc<smallestLC[0]:smallestLC=(lc,m,name,j)
   if smallestLR is None or lr<smallestLR[0]:smallestLR=(lr,m,name,j)
result={'status':'controller candidate only; not independently reviewed or Lean checked','finite_m_range':[3,399],'central_j_range':'m..2m+2 inclusive','each_margin_count':count,'lc_sha256':shaLC.hexdigest(),'lr_sha256':shaLR.hexdigest(),'min_lc':smallestLC,'min_lr':smallestLR,'cutoff':M,'chosen_h':17,'cutoff_ratios':{k:{'numerator':str(v.numerator),'denominator':str(v.denominator),'decimal_display_only':float(v)} for k,v in ratios.items()},'source':'preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/REPLAY.py','source_sha256':hashlib.sha256((B/'preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/REPLAY.py').read_bytes()).hexdigest()}
p=Path(__file__).with_name('C6-TM-CUTOFF400-PROBE.json');p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'checks_each':count,'cutoff_ratio_max':float(max(ratios.values())),'lc_sha256':shaLC.hexdigest(),'lr_sha256':shaLR.hexdigest()}))
