"""Exact replay of the order-24 marked/addability covariance witness."""
import json
N=24
EDGES=[[0,1],[3,2],[2,4],[4,17],[5,10],[6,19],[10,18],[12,7],[14,11],[11,13],[15,8],[17,9],[18,19],[19,13],[13,7],[20,8],[8,9],[9,1],[21,1],[22,1],[1,7],[7,16],[16,23]]
adj=[0]*N
for u,v in EDGES: adj[u]|=1<<v; adj[v]|=1<<u
memo={0:(1,)}
def poly(mask):
    if mask in memo:return memo[mask]
    bits=[u for u in range(N) if mask>>u&1]
    v=max(bits,key=lambda u:(adj[u]&mask).bit_count())
    a=poly(mask^(1<<v)); b=poly(mask&~(1<<v)&~adj[v])
    z=[0]*max(len(a),len(b)+1)
    for j,c in enumerate(a):z[j]+=c
    for j,c in enumerate(b):z[j+1]+=c
    while len(z)>1 and z[-1]==0:z.pop()
    memo[mask]=tuple(z);return memo[mask]
def at(a,j):return a[j] if 0<=j<len(a) else 0
full=(1<<N)-1
it=poly(full); alpha=len(it)-1
x=next(j for j in range(N+1) if at(it,j+1)-at(it,j)<0)
p=10;k=p-1
leaves=[v for v in range(N) if adj[v].bit_count()==1]
rows=[]
for v in leaves:
    tv=poly(full^(1<<v)); d=at(tv,p+1)-at(tv,p)
    s=(adj[v]&-adj[v]).bit_length()-1
    H=full&~(1<<v)&~(1<<s); W=adj[s]&~(1<<v); R=H&~W
    ih=poly(H); ir=poly(R)
    qk=at(ih,k)-at(ir,k); qk1=at(ih,k+1)-at(ir,k+1)
    selected=d<0
    row={"leaf":v,"support":s,"T_minus_v_counts":list(tv),"Delta_p_T_minus_v":d,"selected":selected}
    if selected:
        E=C=0
        # Enumerate rank-k independent subsets in H; E counts actual addable vertices.
        for A in range(1<<N):
            if A&~H or A.bit_count()!=k:continue
            if any((A>>u&1) and (A&adj[u]) for u in range(N)):continue
            if A&W:
                E+=sum(1 for z in range(N) if H>>z&1 and not (A>>z&1) and not (A&adj[z]))
        # C counts marked rank-(k+1) sets meeting W at least twice, once per set.
        for B in range(1<<N):
            if B&~H or B.bit_count()!=k+1:continue
            if any((B>>u&1) and (B&adj[u]) for u in range(N)):continue
            if (B&W).bit_count()>=2:C+=1
        cov=E*at(ih,k)-(k+1)*at(ih,k+1)*qk
        row.update({"W": [u for u in range(N) if W>>u&1],"iH_k":at(ih,k),"iH_k1":at(ih,k+1),"q_k":qk,"q_k1":qk1,"summand":qk1-qk,"E":E,"C":C,"identity_E_eq_kU_plus_C_rhs":k*qk1+C,"covariance_numerator":cov})
    rows.append(row)
F=[r["leaf"] for r in rows if r["selected"]]
selected=[r for r in rows if r["selected"]]
Q=sum(r["q_k"] for r in selected);U=sum(r["q_k1"] for r in selected);E=sum(r["E"] for r in selected);C=sum(r["C"] for r in selected)
result={"n":N,"edges":EDGES,"tree_counts":list(it),"alpha":alpha,"delta_0_through_alpha":[at(it,j+1)-at(it,j) for j in range(alpha+1)],"x":x,"p":p,"checks":{"x_plus_2_le_p":x+2<=p,"three_p_lt_two_alpha_plus_one":3*p<2*alpha+1,"zero_extended_terminal_delta":at(it,alpha+1)-at(it,alpha)},"original_leaves":leaves,"leaf_rows":rows,"F":F,"Q":Q,"U":U,"E":E,"C":C,"E_eq_kU_plus_C":E==k*U+C,"S":U-Q,"kS_eq_E_minus_C_minus_kQ":k*(U-Q)==E-C-k*Q,"CTx_left_minus_right":at(it,x)*E-(x+1)*at(it,x+1)*Q}
print(json.dumps(result,separators=(",",":")))
