#!/usr/bin/env python3
"""Read-only arithmetic and source-integrity audit for the sealed C1-AF case."""
import collections
import hashlib
import json
from pathlib import Path

B = Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-lower-region-compensation-dre-2026-09-25')
OUT = Path(__file__).with_name('AUDIT.json')

def read(path):
    return json.loads((B / path).read_text())

pin_counts = {}
for packet in ('C1-COMMON', 'C1-AF'):
    items = read(f'packets/{packet}.json')['allowed_source_files']
    bad = [entry['path'] for entry in items
           if hashlib.sha256((B / entry['path']).read_bytes()).hexdigest() != entry['sha256']]
    assert not bad, (packet, bad)
    pin_counts[packet] = len(items)

f1 = read('cycles/cycle-1/C1-F1/evidence/search_results.json')
f1_rows = f1['tested_rows']
assert len(f1_rows) == f1['rows_tested'] == 582
assert f1['candidates'] == 30 and f1['positive_count'] == 0
assert all(r['x'] + 2 <= r['p'] and 3*r['p'] < 2*r['alpha']+1 and int(r['S']) <= 0 for r in f1_rows)
f1_orders = dict(collections.Counter(r['recipe']['order'] for r in f1_rows))

f2 = read('cycles/cycle-1/C1-F2/evidence/search_results.json')
f2_counts = f2['counts']
assert len(f2['cases']) == f2_counts['trees'] == 1200
assert sum(c['eligible_row_count'] for c in f2['cases']) == f2_counts['eligible_tree_rank_rows'] == 878
assert f2_counts['rows_with_at_least_one_positive_leaf_term'] == 0
assert f2_counts['positive_complete_aggregates'] == 0
best2 = f2['best_tree_full_check']
assert best2['alpha'] == 9 and best2['x'] == 4 and best2['p'] == 6
assert all(x['delta_p_after_delete'] < 0 for x in best2['selector_by_original_leaf'])
assert sum(x['g'] for x in best2['tagged_summands']) == best2['full_aggregate'] == -253
f2_script = (B / 'cycles/cycle-1/C1-F2/evidence/search.py').read_text()
assert '1 + (3*d if i == 0 else 2*d + 1)' in f2_script

f3 = read('cycles/cycle-1/C1-F3/evidence/graft_pair.json')
f3_summary = {}
for name in ('base', 'grafted'):
    item = f3[name]
    assert len(item['independence_vector_i_0_through_alpha']) == item['alpha'] + 1
    assert item['x'] == next(j for j, delta in enumerate(item['delta_0_through_alpha']) if delta < 0)
    assert item['guard_x_plus_2_le_p'] and item['guard_3p_lt_2alpha_plus_1']
    assert set(map(int, item['all_original_leaf_Delta_p_T_minus_v'])) == set(item['original_leaves'])
    assert item['favorable_leaves'] == [int(v) for v, delta in item['all_original_leaf_Delta_p_T_minus_v'].items() if delta < 0]
    assert sum(term['g'] for term in item['summands']) == item['S']
    assert len(item['summands']) == len(item['favorable_leaves']) == 67
    f3_summary[name] = {'order':item['order'],'alpha':item['alpha'],'x':item['x'],
                        'p':item['p'],'favorable_count':67,'S':str(item['S']),
                        'positive_terms':sum(term['g'] > 0 for term in item['summands']),
                        'leaf_2_term':str(next(term['g'] for term in item['summands'] if term['leaf'] == 2))}

f4 = read('cycles/cycle-1/C1-F4/evidence/census.json')
assert f4['configuration_count'] == 80
assert f4['eligible_row_count'] == f4['negative_row_count'] == 151
assert f4['positive_row_count'] == f4['zero_row_count'] == 0
assert len(f4['positive_rows']) == 0

f6 = read('cycles/cycle-1/C1-F6/evidence/search-results.json')
for name, trees, rows in (('spiders',456,53),('prufer',1760,2022)):
    item = f6[name]
    assert item['counts']['trees'] == trees and item['counts']['eligible_rows'] == rows
    assert item['counts']['positive_rows'] == 0
    best = item['max_aggregate_row']
    assert best['x'] + 2 <= best['p'] and 3*best['p'] < 2*best['alpha']+1
    assert sum(term['g'] for term in best['summands']) == best['S']
    assert all(term['delta_p_after_leaf'] < 0 for term in best['summands'])

result = {
  'source_integrity': {'hashes_match': True, 'listed_file_counts': pin_counts},
  'C1-F1-1': {'rows_by_order':f1_orders,'max_S':str(max(int(r['S']) for r in f1_rows)),
              'all_stored_guards_and_signs_check':True},
  'C1-F2-1': {'counts':f2_counts,'best_S':-253,'best_selected_terms_sum_checks':True,
              'mode_1_nonroot_parent_weight_in_code':'2*d+2',
              'mode_1_nonroot_parent_weight_in_report':'2*d+1'},
  'C1-F3-1': f3_summary,
  'C1-F4-1': {'configurations':80,'eligible_rows':151,'negative_rows':151,'zero_rows':0,'positive_rows':0},
  'C1-F5-1': {'correct_selector_identity':'Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1)',
              'C1-CU-F5_selector_identity_error':'C1-CU-F5/evidence/AUDIT.json writes r_p-r_(p-1) in place of r_(p+1)-r_(p-1)',
              'scalar_point':{'h':5,'k':2,'q_k':1,'q_k_plus_1':3,'D':0,'C':0,'left':6,'right':6,'g':2}},
  'C1-F6-1': {'spider_parameter_multisets':456,'spider_eligible_rows':53,'spider_max_S':-230,
              'prufer_draws':1760,'prufer_eligible_rows':2022,'prufer_max_S':-2562}
}
OUT.write_text(json.dumps(result, indent=2, sort_keys=True) + '\n')
print(OUT)
