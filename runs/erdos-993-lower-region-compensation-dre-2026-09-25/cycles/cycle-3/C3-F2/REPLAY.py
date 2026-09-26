"""Exact replay of C3-F2 CB(8,m) rows and the qualifying-branch switch flow."""
from pathlib import Path
import importlib.util, json, math, sys
B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
spec = importlib.util.spec_from_file_location('cb_switch_cut', B/'instruments/cb-switch-cut/run.py')
cb = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cb)
sys.path.insert(0, str(B/'inputs'))
import ordinary_tree_checked as O

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): out[i+j]+=x*y
    return out

def power(a,n):
    out=[1]
    for _ in range(n): out=mul(out,a)
    return out

def route_coefficient(d,m,p):
    # Local qualifying branch: exactly one support, ell>=ceil(d/2)
    # leaves among the other d-1 support-leaf pairs.
    A=[math.comb(d,j)*2**j for j in range(d+1)]
    Q=[0]*(d+2)
    for ell in range((d+1)//2,d): Q[ell+1]=d*math.comb(d-1,ell)
    noqual=[A[j]-(Q[j] if j<len(Q) else 0) for j in range(len(A))]
    return O.coefficient(power(A,m),p-1)-O.coefficient(power(noqual,m),p-1)

def hub_arm_family_arc_counts(d,m,p):
    A=[math.comb(d,j)*2**j for j in range(d+1)]
    # Exactly one support and any subset of the other d-1 leaves.
    Q1=[0]*(d+1)
    for ell in range(d): Q1[ell+1]=d*math.comb(d-1,ell)
    sets=O.coefficient(power(A,m),p-1)
    choke_arcs=O.coefficient(mul(Q1,power(A,m-1)),p-1)
    return sets, choke_arcs

def result(m,p):
    r=cb.calculate(8,m,p)
    supply=sum(row['multiplicity']*(row['H'][p]-row['R'][p]) for row in r['orbits'])
    capacity=sum(row['multiplicity']*(row['H'][p-1]-row['R'][p-1]) for row in r['orbits'])
    routed=route_coefficient(8,m,p)
    hub_arm_sets, choke_arcs=hub_arm_family_arc_counts(8,m,p)
    # Independent graph polynomial recurrence for a second check of order/alpha
    D=[math.comb(8,j)*2**j for j in range(9)]
    L=[math.comb(8,j) for j in range(9)]
    branch=[(D[j] if j<len(D) else 0)+(L[j-1] if j else 0) for j in range(10)]
    # The graph formula is (1+2z) branch^m + (z+z^2)D^m.
    first=mul([1,2],power(branch,m))
    second=mul([0,1,1],power(D,m))
    P=[0]*max(len(first),len(second))
    for j,x in enumerate(first):P[j]+=x
    for j,x in enumerate(second):P[j]+=x
    assert P==r['P']
    row_data=[]
    for q in r['orbits']:
        row_data.append({'representative_leaf':q['leaf'],'support_vertex':r['edges'][0][0] if False else cb.cb(8,m)[0].support(q['leaf']),
          'multiplicity':q['multiplicity'],'delta_p_after_leaf_deletion':O.delta(q['deleted_leaf'],p),
          'selected':O.delta(q['deleted_leaf'],p)<0,'summand':q['g']})
    return {'d':8,'m':m,'tree_recipe':'path h-s-v, with m branches at h; each branch is h-c_i and c_i-u_ij-l_ij for j=1..8','order':r['order'],'alpha':r['alpha'],'x':r['x'],'p':p,'guards':{'x_plus_2_le_p':r['x']+2<=p,'3p_lt_2alpha_plus_1':3*p<2*r['alpha']+1},'selector_orbits':row_data,'favorable_leaf_count':r['favorable_count'],'complete_S':r['aggregate'],'weighted_upper_supply':supply,'weighted_lower_capacity':capacity,'supply_minus_capacity':supply-capacity,'hub_arm_upper_sets':hub_arm_sets,'arm_support_switch_arcs':hub_arm_sets,'all_one_support_choke_switch_arcs':choke_arcs,'qualifying_branch_routed_supply':routed,'unrouted_upper_supply':supply-routed,'lower_capacity_remaining_after_routing_at_one_unit_per_source':capacity-routed,'qualifying_route_fraction_num_den':[routed,supply],'supplied_old_envelope':{k:r['test_cut'][k] for k in ('upper_weight','neighbor_weight_upper_bound','lower_bound_on_deficit','certificate_of_failure')}}

out={'source_pins':{'common_source_hash_audit':{'listed_common_sources':115,'mismatches':0},'cb_run_py_sha256':'94ced04667b1234844f13a681ec6a8a5cbd1ced813526fe856d4f9692b8a9d53','ordinary_tree_checked_py_sha256':'a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d'},'cases':[result(92,492),result(93,498)],'flow_statement':{'source_family':'independent upper sets B of size p+1 containing h and v, with at least one branch having exactly one occupied support and ell>=4 occupied leaves among the other seven pairs','local_branch_polynomial':'Q(z)=8*sum_{ell=4}^7 binom(7,ell) z^(ell+1)','all_branch_polynomial':'A(z)=(1+2z)^8','routed_supply_formula':'[z^(p-1)] (A(z)^m-(A(z)-Q(z))^m)','move':'for the canonically selected qualifying branch i, insert c_i and delete h and its unique occupied support u_i','legality':'c_i is absent and has exactly the two occupied neighbors h,u_i; resulting independent set has size p','capacity_proof':'each output has a unique inserted choke c_i; for fixed output with ell leaves in branch i, a preimage can restore the removed support only on one of 8-ell pairs whose leaf is absent, so incoming source count <=8-ell<=ell. The output has at least ell active selected leaf tags, hence weight capacity >=ell. A fixed branch order chooses a canonical qualifying branch; all other branch states are preserved.'}}
Path('EVIDENCE.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'cases':[{'m':x['m'],'order':x['order'],'alpha':x['alpha'],'x':x['x'],'p':x['p'],'eligible':all(x['guards'].values()),'favorable':x['favorable_leaf_count'],'S':x['complete_S'],'supply':x['weighted_upper_supply'],'capacity':x['weighted_lower_capacity'],'route':x['qualifying_branch_routed_supply'],'unrouted':x['unrouted_upper_supply'],'old_cut_deficit_lb':x['supplied_old_envelope']['lower_bound_on_deficit']} for x in out['cases']]},indent=2))
