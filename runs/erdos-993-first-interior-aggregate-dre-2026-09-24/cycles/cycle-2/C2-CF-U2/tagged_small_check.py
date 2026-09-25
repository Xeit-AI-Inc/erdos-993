#!/usr/bin/env python3
"""Bounded exact falsification of the proposed bipartite tagged-shadow bound."""
import json

counts = {}
for n in range(1, 8):
    graphs = 0
    cases = 0
    for l in range(n//2 + 1):
        r = n-l
        for bits in range(1 << (l*r)):
            adj = [0]*n
            for i in range(l):
                for j in range(r):
                    if (bits >> (i*r+j)) & 1:
                        adj[i] |= 1 << (l+j)
                        adj[l+j] |= 1 << i
            independent = []
            for S in range(1 << n):
                if all(not ((S >> v)&1 and (adj[v]&S)) for v in range(n)):
                    independent.append(S)
            a = max(S.bit_count() for S in independent)
            for W in range(1 << n):
                q = [0]*(a+2)
                for S in independent:
                    if S & W:
                        q[S.bit_count()] += 1
                for k in range(1,a+1):
                    cases += 1
                    if k*q[k+1] > 2*(a-k)*q[k]:
                        print(json.dumps({"counterexample":{"n":n,"left_size":l,"edge_bits":bits,
                           "W_mask":W,"alpha":a,"k":k,"q_k":q[k],"q_kplus1":q[k+1]}}))
                        raise SystemExit(1)
            graphs += 1
    counts[str(n)] = {"graph_encodings":graphs,"tagged_rank_cases":cases}
print(json.dumps({"max_order":7,"partition_convention":"left size 0..floor(n/2)",
                  "counts":counts,"counterexamples":0},indent=2))
