#!/usr/bin/env python3
"""Exact ordinary-tree evaluator for the r23 Delete/Retag pilot.

The implementation deliberately keeps dynamic-programming coefficient counts
separate from literal subset enumeration.  Relation objects are represented in
both coefficient and activated-set coordinates.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations, product
from math import comb
from typing import Dict, Iterable, Iterator, List, Mapping, Sequence, Set, Tuple


Vertex = int
Edge = Tuple[Vertex, Vertex]
TaggedSet = Tuple[Vertex, frozenset[Vertex]]


def add_poly(a: Sequence[int], b: Sequence[int]) -> List[int]:
    out = [0] * max(len(a), len(b))
    for i, value in enumerate(a):
        out[i] += value
    for i, value in enumerate(b):
        out[i] += value
    return trim(out)


def mul_poly(a: Sequence[int], b: Sequence[int]) -> List[int]:
    out = [0] * (len(a) + len(b) - 1)
    for i, left in enumerate(a):
        for j, right in enumerate(b):
            out[i + j] += left * right
    return trim(out)


def trim(poly: List[int]) -> List[int]:
    while len(poly) > 1 and poly[-1] == 0:
        poly.pop()
    return poly


def coefficient(poly: Sequence[int], rank: int) -> int:
    return poly[rank] if 0 <= rank < len(poly) else 0


def delta(poly: Sequence[int], rank: int) -> int:
    return coefficient(poly, rank + 1) - coefficient(poly, rank)


def first_strict_descent(poly: Sequence[int]) -> int | None:
    for rank in range(len(poly)):
        if delta(poly, rank) < 0:
            return rank
    return None


@dataclass(frozen=True)
class Graph:
    vertices: frozenset[Vertex]
    adjacency: Mapping[Vertex, frozenset[Vertex]]

    @staticmethod
    def from_edges(vertices: Iterable[Vertex], edges: Iterable[Edge]) -> "Graph":
        vertices = frozenset(vertices)
        adjacency: Dict[Vertex, Set[Vertex]] = {v: set() for v in vertices}
        for raw_u, raw_v in edges:
            u, v = int(raw_u), int(raw_v)
            if u == v or u not in vertices or v not in vertices:
                raise ValueError(f"invalid edge {(u, v)}")
            adjacency[u].add(v)
            adjacency[v].add(u)
        return Graph(vertices, {v: frozenset(ns) for v, ns in adjacency.items()})

    def remove(self, removed: Iterable[Vertex]) -> "Graph":
        removed = frozenset(removed)
        kept = self.vertices - removed
        return Graph(
            kept,
            {v: frozenset(self.adjacency[v] & kept) for v in kept},
        )

    def closed_neighborhood(self, vertices: Iterable[Vertex]) -> frozenset[Vertex]:
        out: Set[Vertex] = set(vertices)
        for v in tuple(out):
            out.update(self.adjacency[v])
        return frozenset(out)

    def leaves(self) -> List[Vertex]:
        return sorted(v for v in self.vertices if len(self.adjacency[v]) == 1)

    def support(self, leaf: Vertex) -> Vertex:
        if len(self.adjacency[leaf]) != 1:
            raise ValueError(f"{leaf} is not a leaf")
        return next(iter(self.adjacency[leaf]))

    def is_independent(self, subset: Iterable[Vertex]) -> bool:
        subset = frozenset(subset)
        return all(not (self.adjacency[v] & subset) for v in subset)

    def independent_sets(self, rank: int) -> List[frozenset[Vertex]]:
        if rank < 0 or rank > len(self.vertices):
            return []
        vertices = sorted(self.vertices)
        return [
            frozenset(values)
            for values in combinations(vertices, rank)
            if self.is_independent(values)
        ]

    def brute_independence_polynomial(self) -> List[int]:
        out = [0] * (len(self.vertices) + 1)
        vertices = sorted(self.vertices)
        for mask in range(1 << len(vertices)):
            subset = [vertices[i] for i in range(len(vertices)) if mask & (1 << i)]
            if self.is_independent(subset):
                out[len(subset)] += 1
        return trim(out)

    def forest_independence_polynomial(self) -> List[int]:
        """Tree-DP polynomial. Raises if the graph contains a cycle."""

        seen: Set[Vertex] = set()

        def visit(v: Vertex, parent: Vertex | None) -> Tuple[List[int], List[int]]:
            if v in seen:
                raise ValueError("graph is not a forest")
            seen.add(v)
            excluded = [1]
            included = [0, 1]
            for child in sorted(self.adjacency[v]):
                if child == parent:
                    continue
                child_excluded, child_included = visit(child, v)
                excluded = mul_poly(excluded, add_poly(child_excluded, child_included))
                included = mul_poly(included, child_excluded)
            return excluded, included

        out = [1]
        for root in sorted(self.vertices):
            if root not in seen:
                excluded, included = visit(root, None)
                out = mul_poly(out, add_poly(excluded, included))
        return out


def path_graph(order: int) -> Graph:
    return Graph.from_edges(range(order), ((v, v + 1) for v in range(order - 1)))


def star_graph(leaves: int) -> Graph:
    return Graph.from_edges(range(leaves + 1), ((0, v) for v in range(1, leaves + 1)))


def prufer_tree(sequence: Sequence[int]) -> Graph:
    n = len(sequence) + 2
    degree = [1] * n
    for v in sequence:
        degree[v] += 1
    edges: List[Edge] = []
    for v in sequence:
        leaf = next(i for i, d in enumerate(degree) if d == 1)
        edges.append((leaf, v))
        degree[leaf] -= 1
        degree[v] -= 1
    last = [i for i, d in enumerate(degree) if d == 1]
    edges.append((last[0], last[1]))
    return Graph.from_edges(range(n), edges)


def all_labeled_trees(min_order: int, max_order: int) -> Iterator[Tuple[int, int, Graph]]:
    for n in range(min_order, max_order + 1):
        for index, sequence in enumerate(product(range(n), repeat=max(0, n - 2))):
            yield n, index, prufer_tree(sequence)


def t_family(branches: int) -> Tuple[Graph, Vertex]:
    """The r19 T_m family: one marked arm and m root-adjacent K_1,3 arms."""

    root = 0
    marked_support = 1
    marked_leaf = 2
    vertices = list(range(4 * branches + 3))
    edges: List[Edge] = [(root, marked_support), (marked_support, marked_leaf)]
    cursor = 3
    for _ in range(branches):
        center = cursor
        leaves = (cursor + 1, cursor + 2, cursor + 3)
        edges.append((root, center))
        edges.extend((center, leaf) for leaf in leaves)
        cursor += 4
    return Graph.from_edges(vertices, edges), marked_leaf


def t_family_formula(branches: int) -> List[int]:
    one_plus_x = [1, 1]
    branch = [1, 4, 3, 1]
    product_branch = [1]
    independent_leaves = [1]
    for _ in range(branches):
        product_branch = mul_poly(product_branch, branch)
    for _ in range(3 * branches):
        independent_leaves = mul_poly(independent_leaves, one_plus_x)
    return add_poly(
        mul_poly([1, 2], product_branch),
        mul_poly([0, 1, 1], independent_leaves),
    )


def kl_spider(arms: Sequence[int]) -> Graph:
    """Kadrawi-Levit fixture T(k_1,...,k_r) used in the inherited controls."""

    edges: List[Edge] = []
    cursor = 1
    for arm_count in arms:
        support = cursor
        cursor += 1
        edges.append((0, support))
        for _ in range(arm_count):
            middle, leaf = cursor, cursor + 1
            cursor += 2
            edges.extend(((support, middle), (middle, leaf)))
    return Graph.from_edges(range(cursor), edges)


def log_concavity_failures(poly: Sequence[int]) -> List[int]:
    return [
        rank
        for rank in range(1, len(poly) - 1)
        if poly[rank] * poly[rank] < poly[rank - 1] * poly[rank + 1]
    ]


def favorable_leaves(tree: Graph, rank: int) -> List[Vertex]:
    return [
        v
        for v in tree.leaves()
        if delta(tree.remove({v}).forest_independence_polynomial(), rank) < 0
    ]


def leaf_data(tree: Graph, leaf: Vertex, rank: int) -> dict:
    support = tree.support(leaf)
    h_graph = tree.remove({leaf, support})
    r_graph = tree.remove(tree.closed_neighborhood({support}))
    witness_vertices = frozenset(tree.adjacency[support] - {leaf})
    h_poly = h_graph.forest_independence_polynomial()
    r_poly = r_graph.forest_independence_polynomial()
    c_rank = coefficient(h_poly, rank) - coefficient(r_poly, rank)
    c_previous = coefficient(h_poly, rank - 1) - coefficient(r_poly, rank - 1)
    return {
        "leaf": leaf,
        "support": support,
        "witness_vertices": sorted(witness_vertices),
        "h_order": len(h_graph.vertices),
        "r_order": len(r_graph.vertices),
        "c_rank": c_rank,
        "c_previous": c_previous,
        "g": c_rank - c_previous,
        "pointwise_delta": delta(tree.remove({leaf}).forest_independence_polynomial(), rank),
    }


def aggregate_row(tree: Graph, rank: int) -> dict:
    tree_poly = tree.forest_independence_polynomial()
    favored = favorable_leaves(tree, rank)
    entries = [leaf_data(tree, v, rank) for v in favored]
    return {
        "order": len(tree.vertices),
        "rank": rank,
        "alpha": len(tree_poly) - 1,
        "first_strict_descent": first_strict_descent(tree_poly),
        "favorable_leaves": favored,
        "favorable_count": len(favored),
        "summands": entries,
        "aggregate": sum(entry["g"] for entry in entries),
    }


def relation_row(tree: Graph, rank: int) -> dict:
    favored = favorable_leaves(tree, rank)
    leaf_context: Dict[Vertex, Tuple[Graph, frozenset[Vertex]]] = {}
    source: List[TaggedSet] = []
    target: List[TaggedSet] = []

    for leaf in favored:
        support = tree.support(leaf)
        h_graph = tree.remove({leaf, support})
        witness = frozenset(tree.adjacency[support] - {leaf})
        leaf_context[leaf] = (h_graph, witness)
        source.extend(
            (leaf, values)
            for values in h_graph.independent_sets(rank)
            if values & witness
        )
        target.extend(
            (leaf, values)
            for values in h_graph.independent_sets(rank - 1)
            if values & witness
        )

    source = sorted(set(source), key=lambda item: (item[0], sorted(item[1])))
    target = sorted(set(target), key=lambda item: (item[0], sorted(item[1])))
    target_set = set(target)
    edges: Dict[TaggedSet, Set[TaggedSet]] = {item: set() for item in source}

    for leaf, values in source:
        _, witness = leaf_context[leaf]
        for removed in values:
            lower = values - {removed}
            same_tag = (leaf, lower)
            if lower & witness and same_tag in target_set:
                edges[(leaf, values)].add(same_tag)
        for new_tag in favored:
            if new_tag not in values:
                continue
            _, new_witness = leaf_context[new_tag]
            lower = values - {new_tag}
            candidate = (new_tag, lower)
            if lower & new_witness and candidate in target_set:
                edges[(leaf, values)].add(candidate)

    activated_source = {
        (leaf, values | {leaf}): (leaf, values) for leaf, values in source
    }
    activated_target = {
        (leaf, values | {leaf}): (leaf, values) for leaf, values in target
    }
    activated_edges: Dict[TaggedSet, Set[TaggedSet]] = {
        item: set() for item in source
    }

    def active_tags(values: frozenset[Vertex]) -> Set[Vertex]:
        active: Set[Vertex] = set()
        for candidate in favored:
            if candidate not in values:
                continue
            _, witness = leaf_context[candidate]
            if (values - {candidate}) & witness:
                active.add(candidate)
        return active

    for activated_top, coefficient_top in activated_source.items():
        old_tag, values = activated_top
        for removed in values:
            lower = values - {removed}
            if removed != old_tag:
                candidate = (old_tag, lower)
                coefficient_target = activated_target.get(candidate)
                if coefficient_target is not None:
                    activated_edges[coefficient_top].add(coefficient_target)
            else:
                for new_tag in active_tags(lower):
                    candidate = (new_tag, lower)
                    coefficient_target = activated_target.get(candidate)
                    if coefficient_target is not None:
                        activated_edges[coefficient_top].add(coefficient_target)

    edge_mismatch = {
        top: {
            "coefficient_only": sorted(edges[top] - activated_edges[top], key=str),
            "activated_only": sorted(activated_edges[top] - edges[top], key=str),
        }
        for top in source
        if edges[top] != activated_edges[top]
    }

    matching, right_match = maximum_matching(source, edges)
    deficient_cut = alternating_deficient_cut(source, edges, matching, right_match)
    exact_cut = exhaustive_deficient_cut(source, edges) if len(source) <= 12 else None
    aggregate = aggregate_row(tree, rank)["aggregate"]

    return {
        "favorable_count": len(favored),
        "source_count": len(source),
        "target_count": len(target),
        "source_minus_target": len(source) - len(target),
        "aggregate": aggregate,
        "coefficient_identity": len(source) - len(target) == aggregate,
        "edge_count": sum(len(values) for values in edges.values()),
        "activated_edge_mismatch_count": len(edge_mismatch),
        "matching_size": len(matching),
        "hall_holds": len(matching) == len(source),
        "alternating_deficient_cut": serialize_cut(deficient_cut),
        "exhaustive_deficient_cut": serialize_cut(exact_cut),
    }


def maximum_matching(
    left: Sequence[TaggedSet], edges: Mapping[TaggedSet, Set[TaggedSet]]
) -> Tuple[Dict[TaggedSet, TaggedSet], Dict[TaggedSet, TaggedSet]]:
    left_match: Dict[TaggedSet, TaggedSet] = {}
    right_match: Dict[TaggedSet, TaggedSet] = {}

    def augment(node: TaggedSet, seen: Set[TaggedSet]) -> bool:
        for neighbor in sorted(edges[node], key=str):
            if neighbor in seen:
                continue
            seen.add(neighbor)
            previous = right_match.get(neighbor)
            if previous is None or augment(previous, seen):
                left_match[node] = neighbor
                right_match[neighbor] = node
                return True
        return False

    for node in left:
        augment(node, set())
    return left_match, right_match


def alternating_deficient_cut(
    left: Sequence[TaggedSet],
    edges: Mapping[TaggedSet, Set[TaggedSet]],
    left_match: Mapping[TaggedSet, TaggedSet],
    right_match: Mapping[TaggedSet, TaggedSet],
) -> Tuple[Set[TaggedSet], Set[TaggedSet]] | None:
    if len(left_match) == len(left):
        return None
    reached_left = {node for node in left if node not in left_match}
    reached_right: Set[TaggedSet] = set()
    frontier = list(reached_left)
    while frontier:
        node = frontier.pop()
        for neighbor in edges[node]:
            if left_match.get(node) == neighbor or neighbor in reached_right:
                continue
            reached_right.add(neighbor)
            previous = right_match.get(neighbor)
            if previous is not None and previous not in reached_left:
                reached_left.add(previous)
                frontier.append(previous)
    return reached_left, reached_right


def exhaustive_deficient_cut(
    left: Sequence[TaggedSet], edges: Mapping[TaggedSet, Set[TaggedSet]]
) -> Tuple[Set[TaggedSet], Set[TaggedSet]] | None:
    for size in range(1, len(left) + 1):
        for subset in combinations(left, size):
            neighborhood: Set[TaggedSet] = set()
            for node in subset:
                neighborhood.update(edges[node])
            if len(neighborhood) < size:
                return set(subset), neighborhood
    return None


def serialize_tagged(item: TaggedSet) -> dict:
    return {"tag": item[0], "vertices": sorted(item[1])}


def serialize_cut(
    cut: Tuple[Set[TaggedSet], Set[TaggedSet]] | None,
) -> dict | None:
    if cut is None:
        return None
    left, right = cut
    return {
        "left": [serialize_tagged(item) for item in sorted(left, key=str)],
        "neighborhood": [serialize_tagged(item) for item in sorted(right, key=str)],
        "deficiency": len(left) - len(right),
    }


def path_formula(order: int) -> List[int]:
    return [comb(order - rank + 1, rank) for rank in range(order // 2 + 1)]


def corrected_g2_formula(order: int, support_degree: int) -> int:
    return comb(order - 3, 2) + support_degree - 2
