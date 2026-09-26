from math import comb
import json

m = 8 * 92
r = 491
s = r - 1
source = comb(m, r) * (2 ** r)
target = comb(m, s) * (2 ** s)
source_degree = r
target_max_degree = 2 * (m - s)
shortfall = source - target
out = {
    "m_colors": m,
    "source_rank": r,
    "target_rank": s,
    "source_level_size": str(source),
    "target_level_size": str(target),
    "source_degree": source_degree,
    "target_max_extension_degree": target_max_degree,
    "source_to_target_ratio_num_den": [target_max_degree, source_degree],
    "exact_level_ratio_check": source * source_degree == target * target_max_degree,
    "whole_level_shortfall": str(shortfall),
    "shortfall_equals_source_over_492": shortfall * target_max_degree == source,
    "source_divisible_by_492": source % target_max_degree == 0,
    "edge_count_check": source * source_degree == target * target_max_degree,
}
print(json.dumps(out, indent=2))
