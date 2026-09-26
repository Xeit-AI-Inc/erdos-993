#!/usr/bin/env python3
"""Exact census of six-arm rooted trees for the C5-F6 small-rank probe."""
from itertools import combinations_with_replacement
from math import comb
import json


def trim(a):
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a

def add(a, b):
    c = [0] * max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    return trim(c)

def mul(a, b):
    c = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): c[i + j] += x * y
    return trim(c)

def delta(poly, j):
    def coeff(k): return poly[k] if 0 <= k < len(poly) else 0
    return coeff(j + 1) - coeff(j)

def binomial_poly(d): return [comb(d, j) for j in range(d + 1)]
def star_poly(d): return add(binomial_poly(d), [0, 1])
def disconnected_arms(ds):
    q = [1]
    for d in ds: q = mul(q, star_poly(d))
    return q

def tree_poly(ds):
    # Root 0 either excluded (product of branch polynomials) or included
    # (z times the product of the pendant-leaf polynomials).
    q = disconnected_arms(ds)
    r = [1]
    for d in ds: r = mul(r, binomial_poly(d))
    return add(q, [0] + r)

def first_descent(poly):
    alpha = len(poly) - 1
    for j in range(alpha + 1):
        if delta(poly, j) < 0: return j
    raise AssertionError('terminal zero extension must descend')

def arm_data(ds, i, p):
    d = ds[i]
    others = ds[:i] + ds[i+1:]
    if d:
        # One pendant leaf v is deleted with its support/center. Its d-1
        # sibling leaves become isolated, and root 0 with the other arms remains.
        deleted_leaf_poly = tree_poly(ds[:i] + (d-1,) + ds[i+1:])
        H = mul(binomial_poly(d-1), tree_poly(others))
        R = disconnected_arms(others)
        return delta(deleted_leaf_poly, p), delta(H, p-1), delta(R, p-1), d
    # If d=0, the arm center itself is an original leaf supported at root 0.
    deleted_leaf_poly = tree_poly(others)
    H = disconnected_arms(others)
    R = binomial_poly(sum(others))
    return delta(deleted_leaf_poly, p), delta(H, p-1), delta(R, p-1), 1

def compositions6(total):
    return combinations_with_replacement(range(total + 1), 6) if total == 0 else _partitions(total)

def _partitions(total):
    def rec(left, slots, least, prefix):
        if slots == 1:
            if left >= least: yield tuple(prefix + [left])
            return
        for x in range(least, left // slots + 1):
            yield from rec(left-x, slots-1, x, prefix+[x])
    yield from rec(total, 6, 0, [])

def analyze(ds, p):
    P = tree_poly(ds)
    a, x = len(P)-1, first_descent(P)
    if not (x+2 <= p and 3*p < 2*a+1): return None
    arms=[]; S=0; favorable_leaf_count=0
    for i,d in enumerate(ds):
        dp,hdelta,rdelta,multiplicity=arm_data(ds,i,p)
        favorable=dp < 0
        term=hdelta-rdelta
        arms.append({'arm':i+1,'pendant_leaf_count':d,'Delta_p_after_one_pendant_leaf_deletion':dp if d else None,
                     'Delta_p_after_center_leaf_deletion':dp if not d else None,
                     'favorable_original_leaf_count':multiplicity if favorable else 0,
                     'Delta_p_minus_1_of_T_minus_v_and_support':hdelta if favorable else None,
                     'Delta_p_minus_1_of_T_minus_closed_neighborhood':rdelta if favorable else None,
                     'pointwise_term':term if favorable else None})
        if favorable:
            S += multiplicity*term
            favorable_leaf_count += multiplicity
    return {'independence_counts':P,'alpha':a,'x':x,'arms':arms,'favorable_leaf_count':favorable_leaf_count,'S':S}

def witness_graph(ds):
    edges=[]; labels={'root':0,'centers':[],'pendant_leaves_by_center':[]}; nextv=1
    for i,d in enumerate(ds):
        center=nextv; nextv+=1
        labels['centers'].append(center); edges.append([0,center]); leaves=[]
        for _ in range(d):
            leaves.append(nextv); edges.append([center,nextv]); nextv+=1
        labels['pendant_leaves_by_center'].append(leaves)
    return labels,edges

summary=[]; witness=None
for p in range(10,14):
    total=2*p-3; rows=0; eligible=[]; positive=[]; selected_terms=[]
    for ds in _partitions(total):
        rows += 1
        result=analyze(ds,p)
        if result is None: continue
        eligible.append((ds,result))
        for arm in result['arms']:
            if arm['favorable_original_leaf_count']:
                selected_terms.append(arm['pointwise_term'])
                if arm['pointwise_term'] > 0: positive.append([ds,arm])
    summary.append({'p':p,'n':2*p+4,'six_arm_multisets_enumerated':rows,
                    'eligible_multisets':len(eligible),'positive_selected_arm_types':len(positive),
                    'min_selected_pointwise_term':min(selected_terms) if selected_terms else None,
                    'max_selected_pointwise_term':max(selected_terms) if selected_terms else None})
    if p==10 and eligible:
        ds,result=eligible[0]
        labels,edges=witness_graph(ds)
        witness={'family_parameters_sorted':list(ds),'graph_labels':labels,'edges':edges,
                 'tau':6,'cover_centers':labels['centers'],
                 'matching_edges':[[labels['centers'][i],labels['pendant_leaves_by_center'][i][0]] for i,d in enumerate(ds)],
                 'eligibility':{'x_plus_2_le_p':result['x']+2<=p,'3p_lt_2alpha_plus_1':3*p<2*result['alpha']+1},
                 **result}

out={'method':'integer-exact polynomial dynamic products and exhaustive sorted six-part nonnegative leaf-count partitions for each n=2p+4, p=10..13; no graph-isomorphism claim outside this family',
     'independence_polynomial_recipe':'P_T(z)=product_i((1+z)^d_i+z)+z*product_i(1+z)^d_i for root joined to six centers, center i joined to d_i pendant leaves',
     'pointwise_term_recipe':'For pendant leaf v at center i, H=T-{v,center_i} has polynomial (1+z)^(d_i-1) P_root,others; R=T-N[center_i] is the disjoint union of the five other center-stars. Selector uses Delta_p(T-v)<0. For d_i=0, center_i is the original leaf supported at root.',
     'summary':summary,'eligible_witness':witness}
print(json.dumps(out,indent=2))
