#!/usr/bin/env python3
"""Compare independent arithmetic with selected admitted data, without executing it."""
import json
from pathlib import Path
from independent_audit import graph_row, family

BASE=Path(__file__).resolve().parent
SRC=BASE.parents[1]/'cycles/cycle-1/C1-F2'
random=json.loads((SRC/'random-search-summary.json').read_text())
first_five=[]
for row in random['eligible_examples']:
    got=graph_row(row['n'],row['edges'])
    assert (got['alpha'],got['x'],got['p'],got['S'])==(row['alpha'],row['x'],row['p'],row['S'])
    assert [t['leaf'] for t in got['terms']]==row['selector']
    assert [t['g'] for t in got['terms']]==[t['g'] for t in row['summands']]
    first_five.append({'n':row['n'],'S':got['S'],'selector':row['selector'],'matches':True})

factor=json.loads((SRC/'factorized-family-sweep.json').read_text())
assert len(factor)==60
for admitted in factor:
    got=family(admitted['m'])
    assert (got['alpha'],got['p'],got['x'],got['eligible'],got['marked_selector_delta'],
            got['branch_selector_delta'],got['marked_g'],got['branch_g'],got['favorable_count'],got['S'])==(
            admitted['alpha'],admitted['p'],admitted['x'],admitted['eligible'],
            admitted['marked_leaf_selector_delta'],admitted['branch_leaf_selector_delta'],
            admitted['marked_g'],admitted['branch_leaf_g'],admitted['favorable_count'],admitted['complete_sum'])

family_sweep=json.loads((SRC/'family-sweep.json').read_text())
assert len(family_sweep)==100
for m,row in enumerate(family_sweep[:60],start=1):
    got=family(m)
    assert (row['order'],row['rank'],row['alpha'],row['x_contract'],row['eligible'],
            row['favorable_count'],row['aggregate'])==(
            got['order'],got['p'],got['alpha'],got['x'],got['eligible'],got['favorable_count'],got['S'])

prose_edges=[[0,8],[1,2],[2,5],[3,7],[3,8],[4,8],[5,8],[6,8],[7,9]]
assert prose_edges==random['eligible_examples'][0]['edges']
out={'first_five_random_examples':first_five,'independent_factorized_family_rows_checked':60,
     'independent_dp_family_rows_checked':60,'family_sweep_source_rows':100,
     'prose_edges_equal_first_random_example':True,
     'random_replay_counts':random['counts']}
(BASE/'crosscheck.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
