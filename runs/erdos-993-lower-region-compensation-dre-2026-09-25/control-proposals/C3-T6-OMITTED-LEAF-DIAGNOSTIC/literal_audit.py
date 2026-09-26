from pathlib import Path
import json
out=[]
for graft in [False,True]:
 n=20 if graft else 19
 edges=[(0,1),(1,2)]+[(0,3+4*i)for i in range(4)]+[(3+4*i,4+4*i+j)for i in range(4)for j in range(3)]
 if graft:edges.append((0,19))
 adj=[0]*n
 for a,b in edges:adj[a]|=1<<b;adj[b]|=1<<a
 leaves=[v for v in range(n)if adj[v].bit_count()==1]
 delmask={v:{'D':1<<v,'H':(1<<v)|adj[v],'R':adj[(adj[v]&-adj[v]).bit_length()-1]|adj[v]}for v in leaves}
 arrays={v:{t:[0]*(n+1)for t in ['D','H','R']}for v in leaves};P=[0]*(n+1);valid=bytearray(1<<n);valid[0]=1
 for mask in range(1<<n):
  if mask:
   bit=mask&-mask;v=bit.bit_length()-1;rest=mask^bit;valid[mask]=bool(valid[rest] and not(adj[v]&rest))
  if not valid[mask]:continue
  rank=mask.bit_count();P[rank]+=1
  for v in leaves:
   for t,d in delmask[v].items():
    if not(mask&d):arrays[v][t][rank]+=1
 a=max(j for j,c in enumerate(P)if c);P.append(0);x=next(j for j in range(a+1)if P[j+1]<P[j]);p=9;k=p-1
 F=[v for v in leaves if arrays[v]['D'][p+1]<arrays[v]['D'][p]]
 rows=[{'v':v,'selector':arrays[v]['D'][p+1]-arrays[v]['D'][p],'q_p':arrays[v]['H'][p]-arrays[v]['R'][p],'q_k':arrays[v]['H'][k]-arrays[v]['R'][k]}for v in F]
 S=sum(r['q_p']-r['q_k']for r in rows)
 assert (a,x,len(F),S)==((14,7,14,-17280)if graft else(14,7,13,-10089))
 out.append({'graft':graft,'n':n,'edges':edges,'leaves':leaves,'F':F,'alpha':a,'x':x,'p':p,'S':S,'rows':rows,'P':P[:a+1],'enumerated_vertex_subsets':1<<n})
 print(n,len(F),S,flush=True)
D=Path(__file__).parent
with (D/'LITERAL-AUDIT.json').open('x')as f:json.dump({'grade':'independent literal vertex-subset enumeration of the two exact diagnostic trees','rows':out},f,indent=2);f.write('\n')
