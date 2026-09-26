from pathlib import Path
from math import factorial
import hashlib, json, sys

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
P = B / 'instruments/orbit-flow-twoforone'
sys.path.insert(0, str(B / 'inputs'))
import ordinary_tree_checked as O


def layer(m, rank):
    """Enumerate all S3 wr S_m orbit types in independent sets of given rank."""
    out = {}
    fac = [factorial(j) for j in range(m + 1)]
    for root in (0, 1):
        # special: 0 empty, 1 support, 2 marked leaf
        for special in (0, 1, 2):
            if root and special == 1:
                continue
            rem = rank - root - (special != 0)
            if rem < 0:
                continue
            for triples in range(m + 1):
                for pairs in range(m - triples + 1):
                    for singles in range(m - triples - pairs + 1):
                        for centers in range(m - triples - pairs - singles + 1):
                            empty = m-triples-pairs-singles-centers
                            if root and centers:
                                continue
                            if centers + singles + 2*pairs + 3*triples != rem:
                                continue
                            counts=(empty,centers,singles,pairs,triples)
                            denom=1
                            for c in counts: denom *= fac[c]
                            mult=fac[m]//denom * 3**(singles+pairs)
                            out[(root,special,*counts)]=mult
    return out


def neighbors(s):
    root, special, *counts = s
    result=set()
    # Delete any one selected vertex.
    if root: result.add((0,special,*counts))
    if special: result.add((root,0,*counts))
    for before,after in ((1,0),(2,0),(3,2),(4,3)):
        if counts[before]:
            q=counts.copy(); q[before]-=1; q[after]+=1
            result.add((root,special,*q))
    # Insert a claw center, removing exactly its two occupied neighbors.
    if not root and counts[3]:
        q=counts.copy();q[3]-=1;q[1]+=1
        result.add((0,special,*q))
    if root and counts[2]:
        q=counts.copy();q[2]-=1;q[1]+=1
        result.add((0,special,*q))
    # Insert the distinguished support, removing root and its marked leaf.
    if root and special==2:
        result.add((0,1,*counts))
    # Insert root, removing exactly two among the centers and distinguished support.
    if not root and counts[1]+(special==1)==2:
        q=counts.copy();q[0]+=q[1];q[1]=0
        result.add((1,0 if special==1 else special,*q))
    return result


def weight(s):
    root,special,empty,centers,singles,pairs,triples=s
    # At these three ranks, every original leaf is favorable.
    if root:
        return int(special==2)+(singles+2*pairs+3*triples)
    return 2*pairs+3*triples


def check(m,p):
    T,_=O.t_family(m)
    poly=T.forest_independence_polynomial()
    row=O.aggregate_row(T,p)
    alpha=len(poly)-1; x=O.first_strict_descent(poly)
    assert x+2<=p and 3*p<2*alpha+1
    arm=set(T.leaves())-{2}
    F=set(row['favorable_leaves'])
    assert len(arm)==3*m and arm<=F and 2 in F and len(F)==3*m+1
    assert all(entry['pointwise_delta'] < 0 for entry in row['summands'])
    special_terms=[entry['g'] for entry in row['summands'] if entry['leaf']==2]
    arm_terms=[entry['g'] for entry in row['summands'] if entry['leaf'] in arm]
    assert len(special_terms)==1 and len(arm_terms)==3*m and len(set(arm_terms))==1
    assert special_terms[0]+sum(arm_terms)==row['aggregate']
    upper=layer(m,p+1); lower=layer(m,p)
    assert sum(upper.values())==O.coefficient(poly,p+1)
    assert sum(lower.values())==O.coefficient(poly,p)
    supply=sum(mult*weight(s) for s,mult in upper.items())
    capacity=sum(mult*weight(s) for s,mult in lower.items())
    assert supply-capacity==row['aggregate']
    d=json.loads((P/f'm{m}-p{p}.json').read_text())
    assert d['upper_states']==len(upper) and d['lower_states']==len(lower)
    assert d['upper_supply']==supply and d['lower_capacity']==capacity
    assert d['graph_row']['aggregate']==row['aggregate']
    assert d['graph_row']['alpha']==alpha and d['graph_row']['first_strict_descent']==x
    out={s:0 for s in upper}; inc={s:0 for s in lower}; arc_count=0
    for u,v,amount in d['positive_flow_arcs']:
        u=tuple(u);v=tuple(v);amount=int(amount)
        assert amount>0 and u in upper and v in lower and v in neighbors(u)
        out[u]+=amount;inc[v]+=amount;arc_count+=1
    assert sum(out.values())==sum(inc.values())==supply==d['flow']
    assert all(out[s] <= mult*weight(s) for s,mult in upper.items())
    assert all(inc[s] <= mult*weight(s) for s,mult in lower.items())
    assert d['saturates'] and d['cut_deficit']==0
    return {
      'm':m,'p':p,'order':len(T.vertices),'alpha':alpha,'first_descent':x,
      'guards':{'x_plus_2_le_p':True,'3p_lt_2alpha_plus_1':True},
      'favorable_leaves':len(F),'all_selected_pointwise_deltas_strictly_negative':True,
      'special_leaf_summand':special_terms[0],
      'each_arm_leaf_summand':arm_terms[0],'arm_leaf_summand_count':len(arm_terms),
      'orbit_group_order':factorial(m)*6**m,
      'upper_orbits':len(upper),'lower_orbits':len(lower),
      'upper_actual_sets':sum(upper.values()),'lower_actual_sets':sum(lower.values()),
      'upper_tag_supply':supply,'lower_tag_capacity':capacity,'full_aggregate':row['aggregate'],
      'listed_positive_arcs':arc_count,'flow':d['flow'],'all_arcs_are_literal_neighbors':True,
      'all_weighted_node_capacities_respected':True,'flow_saturates_upper_supply':True
    }

results=[check(22,34),check(60,90),check(66,98)]
common=json.loads((B/'packets/C6-COMMON.json').read_text())
verified=0; mismatches=[]
for pin in common['allowed_source_files']:
    actual=hashlib.sha256((B/pin['path']).read_bytes()).hexdigest()
    if actual != pin['sha256']:
        mismatches.append({'path':pin['path'],'expected':pin['sha256'],'actual':actual})
    else:
        verified += 1
assert not mismatches
focus=['control/C6-SEARCH-ALLOCATION.json','control/C6-SOURCE-MAP.md',
       'instruments/orbit-flow-twoforone/PROTOCOL.md',
       'instruments/orbit-flow-twoforone/run.py',
       'instruments/orbit-flow-twoforone/RESULTS.json',
       'instruments/orbit-flow-twoforone/m22-p34.json',
       'instruments/orbit-flow-twoforone/m60-p90.json',
       'instruments/orbit-flow-twoforone/m66-p98.json','inputs/ordinary_tree_checked.py']
pins={x['path']:x['sha256'] for x in common['allowed_source_files']}
assert all(path in pins for path in focus)
print(json.dumps({'scope':'three specified T_m cases only',
                  'common_source_hash_check':{'verified':verified,'total':len(common['allowed_source_files']),'mismatches':mismatches},
                  'relevant_source_pins':{path:pins[path] for path in focus},
                  'checks':results},indent=2))
