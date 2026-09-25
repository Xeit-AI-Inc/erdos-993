#!/usr/bin/env python3
"""Deterministic bounded corroboration for the C2 v2 informal audit.

Run: python3 REPLAY-BOUNDED-CHECKS.py > REPLAY-BOUNDED-CHECKS.json
This script uses only the Python standard library and writes no files itself.
Its finite checks are not used as a universal proof.
"""

import itertools
import json
from heapq import heapify, heappop, heappush


def edges_from_prufer(word, n):
    degrees = [1] * n
    for vertex in word:
        degrees[vertex] += 1
    leaves = [v for v, degree in enumerate(degrees) if degree == 1]
    heapify(leaves)
    edges = []
    for vertex in word:
        leaf = heappop(leaves)
        edges.append((leaf, vertex))
        degrees[vertex] -= 1
        if degrees[vertex] == 1:
            heappush(leaves, vertex)
    edges.append(tuple(leaves))
    return edges


def adjacency(edges, n):
    masks = [0] * n
    degrees = [0] * n
    for u, v in edges:
        masks[u] |= 1 << v
        masks[v] |= 1 << u
        degrees[u] += 1
        degrees[v] += 1
    return masks, degrees


def independent_counts(masks):
    n = len(masks)
    counts = [0] * (n + 1)
    for subset in range(1 << n):
        rest = subset
        independent = True
        while rest:
            bit = rest & -rest
            vertex = bit.bit_length() - 1
            rest -= bit
            if masks[vertex] & rest:
                independent = False
                break
        if independent:
            counts[subset.bit_count()] += 1
    return counts


def tree_results():
    smaller = []
    for n in (5, 6, 7):
        total = eligible = alpha_six = 0
        minimum_delta_two_alpha_six = None
        for word in itertools.product(range(n), repeat=n - 2):
            edges = edges_from_prufer(word, n)
            masks, _ = adjacency(edges, n)
            counts = independent_counts(masks)
            alpha = max(k for k, count in enumerate(counts) if count)
            differences = [counts[k + 1] - counts[k] for k in range(n)]
            crossing = next(k for k, difference in enumerate(differences) if difference < 0)
            total += 1
            eligible += crossing + 2 <= alpha - 2
            if alpha == 6:
                alpha_six += 1
                delta_two = differences[2]
                minimum_delta_two_alpha_six = (
                    delta_two if minimum_delta_two_alpha_six is None
                    else min(minimum_delta_two_alpha_six, delta_two)
                )
        smaller.append({
            "order": n,
            "labelled_prufer_trees": total,
            "eligible_trees": eligible,
            "alpha_six_trees": alpha_six,
            "minimum_delta_two_among_alpha_six": minimum_delta_two_alpha_six,
        })

    n = 8
    total = with_two_vertex_cover = alpha_six = alpha_seven = 0
    minimum_delta_two_with_cover = minimum_delta_two_alpha_six = None
    for word in itertools.product(range(n), repeat=n - 2):
        edges = edges_from_prufer(word, n)
        total += 1
        if not any(
            all(u in cover or v in cover for u, v in edges)
            for cover in itertools.combinations(range(n), 2)
        ):
            continue
        with_two_vertex_cover += 1
        _, degrees = adjacency(edges, n)
        degree_pairs = sum(degree * (degree - 1) // 2 for degree in degrees)
        delta_two = -7 + degree_pairs
        minimum_delta_two_with_cover = (
            delta_two if minimum_delta_two_with_cover is None
            else min(minimum_delta_two_with_cover, delta_two)
        )
        # For a tree on eight vertices, a one-vertex cover is exactly a star.
        if max(degrees) == 7:
            alpha_seven += 1
        else:
            alpha_six += 1
            minimum_delta_two_alpha_six = (
                delta_two if minimum_delta_two_alpha_six is None
                else min(minimum_delta_two_alpha_six, delta_two)
            )
    order_eight = {
        "order": n,
        "labelled_prufer_trees": total,
        "trees_admitting_vertex_cover_of_size_at_most_two": with_two_vertex_cover,
        "minimum_delta_two_among_those_trees": minimum_delta_two_with_cover,
        "alpha_six_trees_among_those": alpha_six,
        "minimum_delta_two_among_alpha_six": minimum_delta_two_alpha_six,
        "alpha_seven_stars_among_those": alpha_seven,
    }
    return smaller, order_eight


def tagged_shadow_results():
    checked = 0
    for edge_mask in range(1 << 9):
        masks = [0] * 6
        for left in range(3):
            for right in range(3):
                if edge_mask & (1 << (3 * left + right)):
                    u, v = left, 3 + right
                    masks[u] |= 1 << v
                    masks[v] |= 1 << u
        independent_subsets = []
        for subset in range(1 << 6):
            if all(not (masks[v] & subset) for v in range(6) if subset & (1 << v)):
                independent_subsets.append(subset)
        alpha = max(subset.bit_count() for subset in independent_subsets)
        for tag_mask in range(1 << 6):
            counts = [
                sum(subset.bit_count() == k and bool(subset & tag_mask)
                    for subset in independent_subsets)
                for k in range(8)
            ]
            for k in range(1, alpha + 1):
                if k * counts[k + 1] > 2 * (alpha - k) * counts[k]:
                    raise AssertionError((edge_mask, tag_mask, k, counts))
                checked += 1
    return {
        "bipartite_graphs_on_fixed_three_plus_three_coloring": 1 << 9,
        "tag_sets_per_graph": 1 << 6,
        "tagged_shadow_inequalities_checked": checked,
        "violations": 0,
    }


def main():
    smaller, order_eight = tree_results()
    shadow = tagged_shadow_results()
    assert [row["labelled_prufer_trees"] for row in smaller] == [125, 1296, 16807]
    assert [row["eligible_trees"] for row in smaller] == [0, 0, 0]
    assert smaller[-1]["alpha_six_trees"] == 7
    assert smaller[-1]["minimum_delta_two_among_alpha_six"] == 5
    assert order_eight["labelled_prufer_trees"] == 262144
    assert order_eight["trees_admitting_vertex_cover_of_size_at_most_two"] == 6784
    assert order_eight["minimum_delta_two_among_those_trees"] == 3
    assert shadow["tagged_shadow_inequalities_checked"] == 117504
    print(json.dumps({
        "status": "passed_bounded_corroboration",
        "scope_note": "Finite replay only; universal proof is in INFORMAL-AUDIT-CLARIFIED.md.",
        "tree_orders_five_to_seven": smaller,
        "tree_order_eight": order_eight,
        "tagged_shadow": shadow,
    }, sort_keys=True, indent=2))


if __name__ == "__main__":
    main()
