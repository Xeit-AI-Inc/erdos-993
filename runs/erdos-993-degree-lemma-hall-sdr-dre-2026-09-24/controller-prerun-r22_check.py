# Controller check of C-F1-T's order-22 counterexample R(3,2) with pendant paths of length 3.
import sys
n=4; adj={i:set() for i in range(4)}
for c in (1,2,3):
    adj[0].add(c); adj[c].add(0)
    for _ in range(2):
        prev=c
        for _ in range(3):
            v=n; n+=1; adj[v]=set(); adj[prev].add(v); adj[v].add(prev); prev=v
assert n==22
nb=[0]*n
for v in range(n):
    for w in adj[v]: nb[v]|=1<<w
count_k=[0]*(n+2); c=[[0]*(n+2) for _ in range(n)]
def rec(i, mask, size):
    if i==n:
        count_k[size]+=1; m=mask
        while m:
            b=m&-m; v=b.bit_length()-1; c[v][size]+=1; m^=b
        return
    rec(i+1, mask, size)
    if not (nb[i] & mask): rec(i+1, mask|(1<<i), size+1)
sys.setrecursionlimit(10000); rec(0,0,0)
print("independent sets", sum(count_k), "i_12 =", count_k[12], "alpha =", max(k for k in range(n+1) if count_k[k]))
deg=[len(adj[v]) for v in range(n)]; L=[v for v in range(n) if deg[v]==1]; B=[v for v in range(n) if deg[v]>=3]
k=12
print("c_root", c[0][k], "c_children", [c[v][k] for v in (1,2,3)], "c_leaves", sorted(c[l][k] for l in L))
for t in sorted(set(c[v][k] for v in B)):
    slots=sum(deg[v]-2 for v in B if c[v][k]>=t); leaves=sum(1 for l in L if c[l][k]>=t)
    print(f"t={t}: slots={slots} leaves={leaves} {'FAIL' if slots>leaves else 'ok'}")
for kk in (11,12):
    D=sum(deg[v]*c[v][kk] for v in range(n)); print(f"k={kk}: D_k={D} 2k*i_k={2*kk*count_k[kk]}", "ok" if D<=2*kk*count_k[kk] else "VIOLATION")
# acyclic + connected check
assert sum(deg)//2 == n-1
seen={0}; st=[0]
while st:
    v=st.pop()
    for w in adj[v]:
        if w not in seen: seen.add(w); st.append(w)
assert len(seen)==n; print("tree: connected, n-1 edges")
