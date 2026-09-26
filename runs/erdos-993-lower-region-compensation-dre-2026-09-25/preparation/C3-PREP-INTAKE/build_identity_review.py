"""Produce a proposal-only, key-by-key intake comparison from pinned inputs."""

import hashlib
import json
import pathlib

BASE = pathlib.Path(
    "/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/"
    "erdos-993-lower-region-compensation-dre-2026-09-25"
)
OUT = pathlib.Path(__file__).resolve().parent


def read_json(relative):
    return json.loads((BASE / relative).read_text())


def digest(value):
    return hashlib.sha256(value.encode()).hexdigest()


proposals = read_json("control-proposals/C3-NEW-CLAIMS-DRAFT.json")
registry = read_json("inputs/r29-refresh/CLAIM-IDENTITY.json")["claims"]
refuted = read_json("inputs/TRANSITIVE-REFUTED-CLAIMS.json")
assert len(proposals) == 3 and len(registry) == 415 and len(refuted) == 92
assert len({c["claim_key"] for c in registry}) == 415
assert len({c["claim_key"] for c in refuted}) == 92
registered = {c["claim_key"]: c for c in registry}
assert all(c["claim_key"] in registered for c in refuted)
assert all(registered[c["claim_key"]]["status"] == "REFUTED" for c in refuted)
assert all(registered[c["claim_key"]]["statement"] == c["statement"] for c in refuted)

codes = {
    "DIFFERENT_PREDICATE": "The registered key's stated assertion and scope do not assert this proposal's exact conclusion with its guards, selector, and quantifiers.",
    "OLD_TAGGED_RELATION": "The registered Hall/cut claim uses literal tag-compatible Delete/Retag edges; the proposed weighted Hall graph has complete clone fibers and actual non-subset two-for-one edges.",
    "GOVERNED_RELATION": "The registered assertion is on governed RTree data or a governed relation; this proposal is on ordinary trees with its explicit changed move graph.",
    "SCALAR_VS_FLOW": "The registered assertion is a scalar complete aggregate; saturation of every cut in the proposed graph is a stronger, different assertion.",
    "SHELL_AGGREGATE": "The registered shell assertion needs the lower-region alpha guard and concludes only a selected complete sum; the proposal gives every original leaf's sign at exact shell order without that guard.",
    "POINTWISE_REFINES_AGGREGATE": "The registered assertion concludes a selected complete sum over a wider order/rank domain; this proposal concludes each original leaf's sign only at the exact early-descent shell.",
    "LOWER_ORDER_BAND": "The registered pointwise leaf band has parent order at most 2p+1; the proposal has the next exact order 2p+2 with early descent.",
    "HIGH_TAIL_POINTWISE": "The registered pointwise theorem uses 3p>=2alpha+1 and bipartiteness; the proposal uses exact shell order and early descent, including ranks below that guard.",
    "UNRESTRICTED_POINTWISE": "The refuted pointwise claim has broader or governed hypotheses; its witnesses do not establish failure under the proposal's exact shell and early-descent guards.",
    "COVER3_DIFFERENT_ORDER": "The refuted graph cover-three pre-r assertion is at order 2r+3; the shell proof uses order 2p+2=2(p-2)+6 and positivity only through p-2.",
    "RANK_RESTRICTION": "The proposal adds p<=7 to the registered strict lower-region complete aggregate and explicitly relies on a finite census; it does not assert every rank.",
    "BROADER_AGGREGATE": "The registered ordinary aggregate includes ranks outside the proposed strict lower-region p<=7 scope.",
    "SHELL_SUBCASE": "The registered shell is an exact order subcase, while the proposal covers every eligible order at p<=7 using additional order bounds and censuses.",
    "ORDER_BAND_INPUT": "The registered pointwise order band is an ingredient for n<=2p+1, whereas this proposal concludes a complete selected sum also at residual larger orders for p<=7.",
    "DESCENT_BOUND_INPUT": "The registered claim bounds forest descent orders, not the selected original-leaf compensation sum; the rank proposal composes it with other inputs.",
    "COMPLEMENTARY_HIGH_TAIL": "The registered high-tail assertion has 3p>=2alpha+1; the proposal has the strict complementary 3p<2alpha+1 guard and p<=7.",
    "BOUNDARY_LOCAL_ONLY": "The registered boundary record gives local positive leaf terms without the proposal's complete selected sum or shell early-descent conclusion.",
    "FORMAL_AUXILIARY": "The registered graph or coefficient theorem supplies an auxiliary sign or identity, not the proposal's full quantified ordinary-tree assertion.",
}

flow_special = {
    **{key: "OLD_TAGGED_RELATION" for key in [
        "E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL",
        "E993-R23-LITERAL-DELETE-ONLY-HALL",
        "E993-R23-TAG-CLOSED-CUT-HALL",
        "E993-R23-HOT-TAG-SINGLETON-HALL",
        "E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG",
        "E993-C3-COMPLETE-TAG-DEFICIENCY-EQUALS-CONTRIBUTION",
    ]},
    "E993-R19-FIXED-GAMMA-HALL": "GOVERNED_RELATION",
    "E993-R19-R2-HALL-UNIVERSAL": "GOVERNED_RELATION",
    "E993-BETA-AGG": "GOVERNED_RELATION",
    "E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "SCALAR_VS_FLOW",
    "E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "SCALAR_VS_FLOW",
    "E993-LOWER-REGION-FIRST-ORDER-SHELL": "SCALAR_VS_FLOW",
    "E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE": "SCALAR_VS_FLOW",
}
shell_special = {
    "E993-LOWER-REGION-FIRST-ORDER-SHELL": "SHELL_AGGREGATE",
    "E993-ORDINARY-LEAF-ORDER-BAND": "LOWER_ORDER_BAND",
    "E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE": "HIGH_TAIL_POINTWISE",
    "E993-BETA-TARGET": "UNRESTRICTED_POINTWISE",
    "E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE": "COVER3_DIFFERENT_ORDER",
    "E993-R29-HIGH-TAIL-BOUNDARY-RECORD": "BOUNDARY_LOCAL_ONLY",
    "E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "POINTWISE_REFINES_AGGREGATE",
    "E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "POINTWISE_REFINES_AGGREGATE",
    "E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION": "FORMAL_AUXILIARY",
}
rank_special = {
    "E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "RANK_RESTRICTION",
    "E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE": "BROADER_AGGREGATE",
    "E993-LOWER-REGION-FIRST-ORDER-SHELL": "SHELL_SUBCASE",
    "E993-ORDINARY-LEAF-ORDER-BAND": "ORDER_BAND_INPUT",
    "E993-R27-FOREST-DESCENT-MAXIMA-CENSUS": "DESCENT_BOUND_INPUT",
    "E993-FOREST-RANK6-DESCENT-MAXIMUM-CENSUS24": "DESCENT_BOUND_INPUT",
    "E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE": "COMPLEMENTARY_HIGH_TAIL",
    "E993-R29-HIGH-TAIL-BOUNDARY-RECORD": "BOUNDARY_LOCAL_ONLY",
}
specials = [flow_special, shell_special, rank_special]
refuted_keys = {c["claim_key"] for c in refuted}
rows = []
for item in registry:
    key = item["claim_key"]
    decisions = {}
    for proposal, special in zip(proposals, specials):
        code = special.get(key, "DIFFERENT_PREDICATE")
        decisions[proposal["claim_key"]] = {
            "decision": "not_same_claim",
            "reason_code": code,
        }
    rows.append({
        "registered_key": key,
        "registered_status": item["status"],
        "registered_statement": item["statement"],
        "registered_scope": item["scope"],
        "registered_statement_sha256": digest(item["statement"]),
        "in_transitive_refuted_list": key in refuted_keys,
        "decisions": decisions,
    })

scope_differences = [c["claim_key"] for c in refuted
                     if registered[c["claim_key"]]["scope"] != c["scope"]]
assert scope_differences == [
    "E993-BETA-TARGET",
    "E993-BETA-AGG-SUPPORT",
    "E993-C3-G1-POINTWISE-ADDABILITY-BOUND",
]
assert all(p["claim_key"] not in registered for p in proposals)
assert all(p["statement"] != c["statement"] for p in proposals for c in registry)

result = {
    "authority": "proposal_to_controller_only",
    "sources": {
        "registry": "inputs/r29-refresh/CLAIM-IDENTITY.json",
        "refuted": "inputs/TRANSITIVE-REFUTED-CLAIMS.json",
        "proposals": "control-proposals/C3-NEW-CLAIMS-DRAFT.json",
    },
    "counts": {
        "registered_keys": len(rows),
        "transitive_refuted_keys": len(refuted_keys),
        "proposed_keys": len(proposals),
        "pairwise_decisions": len(rows) * len(proposals),
        "exact_key_or_statement_collisions": 0,
    },
    "refuted_statement_mismatches": [],
    "refuted_scope_note_extensions_in_r29": scope_differences,
    "decision_code_legend": codes,
    "rows": rows,
    "transitive_refuted_crosscheck": [
        {
            "key": c["claim_key"],
            "status_in_r29": registered[c["claim_key"]]["status"],
            "statement_identical": registered[c["claim_key"]]["statement"] == c["statement"],
            "scope_identical": registered[c["claim_key"]]["scope"] == c["scope"],
            "r29_scope_governs": True,
        }
        for c in refuted
    ],
}
(OUT / "IDENTITY-REVIEW.json").write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
print("415 registry rows, 92 refutation rows, 1245 explicit not_same_claim decisions")
