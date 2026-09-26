#!/usr/bin/env python3
"""Bounded seeded exact search in root multi-hub trees; uses pinned checked evaluator."""
from __future__ import annotations
import importlib.util, json, random, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
spec = importlib.util.spec_from_file_location("checked", ROOT / "inputs/ordinary_tree_checked.py")
checked = importlib.util.module_from_spec(spec); sys.modules[spec.name]=checked; spec.loader.exec_module(checked)
Graph = checked.Graph

def make_tree(ds, subdivided, direct):
    # IDs: root 0; hub, then d pendant leaves per hub; then subdivided 2-vertex arms;
    # finally direct leaves. Return graph and exact recipe metadata.
    edges=[]; n=1; root=0
    for d in ds:
        hub=n; n+=1; edges.append((root,hub))
        for _ in range(d):
            edges.append((hub,n)); n+=1
    marked=[]
    for _ in range(subdivided):
        support=n; leaf=n+1; n+=2
        edges.extend(((root,support),(support,leaf))); marked.append(leaf)
    for _ in range(direct):
        edges.append((root,n)); n+=1
    return Graph.from_edges(range(n),edges), {"hub_leaf_counts":list(ds),"subdivided_arms":subdivided,"direct_root_leaves":direct,"order":n}

def analyze(ds, subdivided, direct):
    tree, recipe = make_tree(ds,subdivided,direct)
    poly=tree.forest_independence_polynomial()
    a=len(poly)-1
    x=next(j for j in range(a+1) if checked.delta(poly,j)<0)
    leafdata={}
    for v in tree.leaves():
        s=tree.support(v)
        pv=tree.remove({v}).forest_independence_polynomial()
        h=tree.remove({v,s}).forest_independence_polynomial()
        r=tree.remove(tree.closed_neighborhood({s})).forest_independence_polynomial()
        leafdata[v]=(pv,h,r,s)
    results=[]
    for p in range(x+2,(2*a)//3+1):
        favorable=[]; terms=[]
        for v,(pv,h,r,s) in leafdata.items():
            sel=checked.delta(pv,p)
            if sel<0:
                term=checked.delta(h,p-1)-checked.delta(r,p-1)
                favorable.append(v); terms.append((v,term,sel,s))
        S=sum(t[1] for t in terms)
        results.append({"p":p,"eligible_guard":3*p<2*a+1,"favorable_count":len(favorable),"favorable_leaves":favorable,"terms":terms,"S":S})
    return {"recipe":recipe,"alpha":a,"x":x,"tree_polynomial":poly,"rows":results}

def gen(rng, m, order, trials):
    out=[]
    for _ in range(trials):
        sub=rng.randint(1,4); direct=rng.randint(0,3)
        # vary number of hubs near base while preserving fixed target order
        hubs=m+rng.choice([-2,-1,0,1,2])
        total=order-1-hubs-2*sub-direct
        # Generate a balanced multiset of hub leaf counts in [1,6] with exact total.
        avg, rem=divmod(total,hubs)
        if avg<1 or avg>6: continue
        ds=[avg]*hubs
        for i in range(rem): ds[i]+=1
        # bounded random unit transfers preserve exact order and keep all degrees viable
        for __ in range(rng.randint(10,80)):
            i,j=rng.sample(range(hubs),2)
            if ds[i]>1 and ds[j]<6:
                ds[i]-=1; ds[j]+=1
        rng.shuffle(ds)
        out.append((ds,sub,direct))
    return out

def main():
    rng=random.Random(99320260925)
    candidates=[]
    candidates += gen(rng,22,91,14)
    candidates += gen(rng,60,243,14)
    # Include unperturbed anchor configurations.
    candidates += [([3]*22,1,0),([3]*60,1,0)]
    rows_total=0; positives=[]; best=[]; tested_rows=[]
    for idx,(ds,sub,direct) in enumerate(candidates):
        result=analyze(ds,sub,direct)
        for row in result["rows"]:
            rows_total+=1
            tested_rows.append({"candidate":idx,"recipe":result["recipe"],"alpha":result["alpha"],"x":result["x"],"p":row["p"],"favorable_count":row["favorable_count"],"S":str(row["S"])})
            if row["S"]>0:
                positives.append({"candidate":idx,**result,"positive_row":row})
        for row in result["rows"]:
            best.append((row["S"],idx,result,row))
    best.sort(key=lambda z:z[0],reverse=True)
    summary={
      "seed":99320260925,"candidates":len(candidates),"candidate_order_targets":[91,243],
      "generation":"14 seeded balanced hub multisets per target order. Hub count m_target-2..m_target+2; subdivided arms 1..4; direct root leaves 0..3; d_i in [1,6], with sum d_i chosen to preserve exact target order; 10..80 random unit transfers; two original anchors.",
      "rows_tested":rows_total,"positive_count":len(positives),"tested_rows":tested_rows,
      "best_nonpositive_rows":[{"S":str(s),"candidate":i,"recipe":r["recipe"],"alpha":r["alpha"],"x":r["x"],"p":row["p"],"favorable_count":row["favorable_count"],"favorable_leaf_ids":row["favorable_leaves"],"terms":[[v,str(term),str(sel),supp] for v,term,sel,supp in row["terms"]]} for s,i,r,row in best[:10]],
      "positive_witnesses":[{"candidate":w["candidate"],"recipe":w["recipe"],"alpha":w["alpha"],"x":w["x"],"tree_polynomial":[str(x) for x in w["tree_polynomial"]],"positive_row":{"p":w["positive_row"]["p"],"favorable_count":w["positive_row"]["favorable_count"],"favorable_leaf_ids":w["positive_row"]["favorable_leaves"],"terms":[[v,str(term),str(sel),supp] for v,term,sel,supp in w["positive_row"]["terms"]],"S":str(w["positive_row"]["S"])}} for w in positives[:5]]
    }
    (Path(__file__).parent/"search_results.json").write_text(json.dumps(summary,indent=2)+"\n")
    print(json.dumps({k:summary[k] for k in ("seed","candidates","rows_tested","positive_count","best_nonpositive_rows")},indent=2))
if __name__=="__main__": main()
