import sys,json
B='/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25';sys.path.insert(0,B+'/inputs');import ordinary_tree_checked as o

def mk(d0,d1,s0=0,s1=0):
 E=[(0,1)];v=2
 for h,d,s in [(0,d0,s0),(1,d1,s1)]:
  for _ in range(d):E.append((h,v));v+=1
  for _ in range(s):E.extend([(h,v),(v,v+1)]);v+=2
 return o.Graph.from_edges(range(v),E)
profiles=[]; elig=0; proper=[]
for d0 in range(0,15):
 for d1 in range(0,15):
  for s0 in range(0,5):
   for s1 in range(0,5):
    n=2+d0+d1+2*s0+2*s1
    if n<8 or n>18:continue
    t=mk(d0,d1,s0,s1);poly=t.forest_independence_polynomial();a=len(poly)-1;x=o.first_strict_descent(poly)
    if x is None:continue
    for p in range(x+2,(2*a)//3+1):
     if 3*p>=2*a+1:continue
     F=o.favorable_leaves(t,p)
     if not F:continue
     elig+=1
     if len(F)<len(t.leaves()):
      proper.append({'profile':[d0,d1,s0,s1],'n':n,'a':a,'x':x,'p':p,'leaves':t.leaves(),'F':F,'edges':[[u,v] for u in sorted(t.vertices) for v in sorted(t.adjacency[u]) if u<v]})
print(json.dumps({'double_hub_profiles_order_8_18':elig,'proper_selector_pairs':len(proper),'proper_examples':proper[:5]},indent=2))
