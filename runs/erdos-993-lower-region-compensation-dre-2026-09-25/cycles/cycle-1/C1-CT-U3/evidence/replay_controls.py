import json
from pathlib import Path

base = Path(__file__).parent
checks = []
for filename, a, x, p, expected_count, expected_total in [
    ("t22-order91.json", 68, 32, 34, 67, -498754180547001418536),
    ("t60-order243.json", 182, 87, 90, 181, -1058142362147652597702654588268394677176033202323316960380),
]:
    d = json.loads((base / filename).read_text())
    row = d["complete_row"]
    terms = row["summands"]
    total = sum(int(t["g"]) for t in terms)
    positives = [t for t in terms if int(t["g"]) > 0]
    selected_values_negative = all(int(t["pointwise_delta"]) < 0 for t in terms)
    checks.append({
        "file": filename,
        "order": row["order"],
        "a": row["alpha"],
        "x": row["first_strict_descent"],
        "p": row["rank"],
        "guard_x_plus_2_le_p": x + 2 <= p,
        "guard_3p_lt_2a_plus_1": 3 * p < 2 * a + 1,
        "favorable_count": row["favorable_count"],
        "summand_records": len(terms),
        "g_sum_from_rows": str(total),
        "stored_aggregate": str(row["aggregate"]),
        "positive_row_count": len(positives),
        "largest_positive_row": str(max((int(t["g"]) for t in terms), default=0)),
        "positive_row_leaf": positives[0]["leaf"] if positives else None,
        "all_selector_values_strictly_negative": selected_values_negative,
        "checks_pass": (
            a == row["alpha"] and x == row["first_strict_descent"] and p == row["rank"]
            and x + 2 <= p and 3 * p < 2 * a + 1
            and row["favorable_count"] == expected_count
            and total == expected_total == row["aggregate"]
            and len(positives) >= 1 and selected_values_negative
        ),
    })
print(json.dumps(checks, indent=2))
