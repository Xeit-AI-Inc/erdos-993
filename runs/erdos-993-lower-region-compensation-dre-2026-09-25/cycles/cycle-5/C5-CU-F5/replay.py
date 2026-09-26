import json
from pathlib import Path

src = Path(__file__).with_name('t22-order91.json')
d = json.loads(src.read_text())
r = d['complete_row']
ss = r['summands']
k = r['rank'] - 1
checks = {
    'outer_row_fields_agree': all(d[x] == r[x] for x in ('order', 'alpha', 'first_strict_descent', 'rank', 'aggregate', 'favorable_count')),
    'summand_count_matches_favorable_count': len(ss) == r['favorable_count'] == len(r['favorable_leaves']),
    'summand_leaf_multiset_matches_favorable_leaves': sorted(s['leaf'] for s in ss) == sorted(r['favorable_leaves']),
    'each_reported_g_is_c_rank_minus_c_previous': all(s['g'] == s['c_rank'] - s['c_previous'] for s in ss),
    'each_reported_selector_delta_is_negative': all(s['pointwise_delta'] < 0 for s in ss),
    'all_summand_aggregates_sum_to_row_aggregate': sum(s['g'] for s in ss) == r['aggregate'],
    'outer_aggregate_matches_row': d['aggregate'] == r['aggregate'],
    'alpha_and_x_plus_2_le_p': d['first_strict_descent'] + 2 <= d['rank'],
    'strict_lower_region': 3*d['rank'] < 2*d['alpha'] + 1,
}
from collections import Counter
hist = Counter(s['g'] for s in ss)
positive = [s for s in ss if s['g'] > 0]
negative = [s for s in ss if s['g'] < 0]
checks.update({
    'one_positive_tag': len(positive) == 1,
    'sixty_six_equal_negative_tags': len(negative) == 66 and len({s['g'] for s in negative}) == 1,
    'positive_marked_tag_is_leaf_2': len(positive) == 1 and positive[0]['leaf'] == d['marked_leaf'] == 2,
    'outer_tag_summaries_match_rows': d['marked_g'] == positive[0]['g'] and d['star_g_values'] == [negative[0]['g']] and d['star_leaf_count'] == len(negative),
})
assert all(checks.values()), checks
out = {
    'source_copy': 't22-order91.json',
    'source_sha256_expected_and_verified': '2198f01fa5de1c192da190ac242f5af8a914b0b03bd5e6df979590d20c6a18ed',
    'independent_arithmetic_replay': {
        'n': d['order'], 'alpha': d['alpha'], 'x': d['first_strict_descent'], 'p': d['rank'], 'k': k,
        'eligibility_checks': {'x+2<=p': checks['alpha_and_x_plus_2_le_p'], '3p<2a+1': checks['strict_lower_region']},
        'favorable_leaf_count': len(ss), 'distinct_favorable_leaves': len(set(s['leaf'] for s in ss)),
        'positive_tag': {'leaf': positive[0]['leaf'], 'g': positive[0]['g'], 'k_times_g': k*positive[0]['g']},
        'negative_tag_count': len(negative), 'common_negative_g': negative[0]['g'], 'k_times_common_negative_g': k*negative[0]['g'],
        'full_sum': sum(s['g'] for s in ss),
        'expanded_sum': f"{positive[0]['g']} + {len(negative)}*({negative[0]['g']}) = {sum(s['g'] for s in ss)}",
        'k_times_full_sum': k*sum(s['g'] for s in ss),
        'distribution': {str(g): c for g,c in sorted(hist.items())},
    },
    'checks': checks,
    'limitations': [
        'The replay verifies arithmetic and consistency of the pinned row only.',
        'The pinned JSON has no explicit graph edge list or independence-count vectors; its polynomial_formula_matches_dp flag is not independently replayable from this file.',
        'Thus ordinary-tree realizability, the first-descent value, and completeness of the favorable selector are not independently established here.',
        'No global unsigned cross-tag network bases, incidence, or capacities are specified, so this is not a Hall-cut or kernel audit.'
    ]
}
Path(__file__).with_name('ARITHMETIC-REPLAY.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'checks': checks, 'full_sum': out['independent_arithmetic_replay']['full_sum']}, indent=2))
