#!/usr/bin/env python3
"""Independent exact replay for the assigned C1-U3 claim."""
import json
from itertools import combinations


def plus(a, b):
    out = [0] * max(len(a), len(b))
    for i, x in enumerate(a): out[i] += x
    for i, x in enumerate(b): out[i] += x
    return out


def times(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): out[i+j] += x*y
    return out


def polyn(adj, excluded=()):
    keep = set(adj) - set(excluded)
    def visit(v, parent):
        absent, present = [1], [0, 1]
        for w in sorted(adj[v] & keep):
            if w == parent: continue
            a, b = visit(w, v)
            absent = times(absent, plus(a, b))
            present = times(present, a)
        return absent, present
    total = [1]
    unseen = set(keep)
    while unseen:
        root = min(unseen)
        stack = [root]
        unseen.remove(root)
        while stack:
            v = stack.pop()
            for w in adj[v] & unseen:
                unseen.remove(w)
                stack.append(w)
        total = times(total, plus(*visit(root, None)))
    while len(total) > 1 and total[-1] == 0: total.pop()
    return total


def c(a, k):
    return a[k] if 0 <= k < len(a) else 0


def d(a, k):
    return c(a, k+1)-c(a, k)


def first(a):
    return next(k for k in range(len(a)) if d(a, k) < 0)


def family(m):
    adj = {i:set() for i in range(4*m+3)}
    def edge(u, v): adj[u].add(v); adj[v].add(u)
    edge(0, 1); edge(1, 2)
    for j in range(m):
        s = 3+4*j
        edge(0, s)
        for q in (1, 2, 3): edge(s, s+q)
    return adj


def leaf_entry(adj, v, p):
    s = next(iter(adj[v]))
    H = polyn(adj, (v, s))
    R = polyn(adj, adj[s] | {s})
    Tv = polyn(adj, (v,))
    selector = d(Tv, p)
    summand = d(H, p-1)-d(R, p-1)
    return {"selector":selector,"summand":summand,
            "decomposition_ok":all(c(Tv,k)==c(H,k)+c(R,k-1) for k in range(len(Tv)+1))}


def brute_count(adj, removed, k, witness):
    vs = sorted(set(adj)-set(removed))
    count = 0
    for tup in combinations(vs, k):
        J = set(tup)
        if J & witness and all(not (adj[v] & J) for v in J): count += 1
    return count


def small_check():
    # Path on seven vertices, checking every original leaf at every rank.
    adj = {i:set() for i in range(7)}
    for i in range(6): adj[i].add(i+1); adj[i+1].add(i)
    for v in (0,6):
        s=next(iter(adj[v])); W=adj[s]-{v}; H=polyn(adj,(v,s)); R=polyn(adj,adj[s]|{s})
        for k in range(8):
            assert c(H,k)-c(R,k)==brute_count(adj,(v,s),k,W)
    return True


def main():
    assert small_check()
    rows=[]
    for m in (75,100,150):
        adj=family(m); T=polyn(adj); alpha=len(T)-1; p=alpha-2; x=first(T)
        marked=leaf_entry(adj,2,p); ordinary=leaf_entry(adj,4,p)
        assert marked["decomposition_ok"] and ordinary["decomposition_ok"]
        favored=(int(marked["selector"]<0)+3*m*int(ordinary["selector"]<0))
        S=(int(marked["selector"]<0)*marked["summand"]
           +3*m*int(ordinary["selector"]<0)*ordinary["summand"])
        rows.append({"m":m,"order":len(adj),"alpha":alpha,"p":p,"x":x,"eligible":x+2<=p,
                     "marked":marked,"ordinary":ordinary,"favorable_leaves":favored,"S":S})
    print(json.dumps({"small_path_identity":True,"family_rows":rows},indent=2))


if __name__ == "__main__": main()
