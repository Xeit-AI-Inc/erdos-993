"""File-backed request to a controller-owned, constrained Lean compiler service."""
from pathlib import Path
import sys,json,time,re
S=Path.cwd();q=S/'bridge-requests';a=S/'bridge-replies';q.mkdir(exist_ok=True);a.mkdir(exist_ok=True)
if len(sys.argv)<4:raise SystemExit('client ID read_mathlib PATH | ID search_mathlib PREFIX TEXT | ID compile SOURCE')
ident,op,arg=sys.argv[1:4]
assert re.fullmatch(r'[a-zA-Z0-9_-]+',ident)
d={'id':ident,'op':op,'argument':arg}
if op=='search_mathlib':d['text']=sys.argv[4]
p=q/(ident+'.json');assert not p.exists();tmp=q/(ident+'.pending');tmp.write_text(json.dumps(d));tmp.rename(p)
for _ in range(1200):
 r=a/(ident+'.json')
 if r.exists():print(r.read_text());raise SystemExit(0)
 time.sleep(1)
raise SystemExit('Controller response pending; do not repeat the same request or alter service.')
