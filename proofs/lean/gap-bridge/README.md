# Gap-Bridge Lean Package

This is a publication copy of the verified Lean project for the large-order
rank-four result and its imported dependencies.

## Main Declarations

- `Erdos993GapBridge.tree_e3_large_order`
- `Erdos993GapBridge.five_ind_five_le`
- `Erdos993GapBridge.three_twoSets_union_four_has_two_intersections`
- `Erdos993GapBridge.tree_plc4_of_card_ge_27`

## Build

From this directory:

```bash
lake build Erdos993GapBridge
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean
```

The project pins Lean `v4.32.2` and Mathlib revision
`905b95818eb32af7874a58b427f50c1711a5e96c`.

## Scope

The theorem proves strict log-concavity at rank four for finite nonempty simple
trees with at least 27 vertices. It does not establish all-rank log-concavity,
tree unimodality, forest unimodality, or Erdős #993.
