---
title: Theorem Contract
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 1.0
last_updated: 2026-08-01
machine: Mac Mini
owner: Ashton T. Sperry
---

# Theorem Contract

## Purpose

Use this skill before Lean formalization to freeze what is being proved. It
turns an informal theorem target into a precise, source-bound contract without
claiming that the theorem is true or Lean-verified.

The contract records definitions, domains, quantifiers, hypotheses, conclusion,
dependency structure, permitted axioms, constructivity policy, success criteria,
and an exact planned Lean declaration binding. The deterministic validator then
emits a canonical JSON receipt and a Markdown view.

This skill complements `skills/proof-integrity-audit/skill.md`. The existing
proof-integrity audit remains the informal mathematical critic; structural
contract validation is not a substitute for that audit or for Lean's kernel.

## Authority Boundary

- The human-authored contract is the theorem-intent authority.
- The `.lean` declaration becomes proof authority only after kernel verification.
- The validator owns path, hash, shape, graph, and policy checks.
- A model may draft contract content, but it may not assign authoritative hashes
  or promote a structural receipt into a mathematical verification claim.
- A `valid_for_formalization` receipt means only that the contract is internally
  coherent and source-bound enough to enter the next stage.

## Contract Format

Use `templates/THEOREM-CONTRACT.yaml`. The file deliberately uses JSON object
syntax, which is valid YAML 1.2. This conservative subset is parsed with the
Python standard library. Block-style YAML, anchors, tags, implicit timestamps,
and duplicate-key ambiguity are unsupported and fail closed with
`blocked_unsupported_yaml_subset`.

Required content:

- theorem title and informal statement;
- formulation status and any known counterexample evidence;
- definitions and domains with dependency lists;
- quantified binders;
- hypotheses and conclusion;
- an exact dependency DAG;
- permitted axioms and constructivity policy;
- all success gates;
- a planned Lean project path, source path, declaration name, declaration kind,
  exact statement text, and exact statement SHA-256;
- every source material's repository-relative path, role, and byte SHA-256.

All source paths are resolved beneath the supplied workspace root. Absolute
paths, `..`, symlink escapes, missing files, and hash mismatches fail closed.

## Procedure

1. Run the existing proof-integrity audit over the informal theorem and its
   sources. Keep that audit evidence in the approved experiment run.
2. Copy `templates/THEOREM-CONTRACT.yaml` into the run root as
   `THEOREM-CONTRACT.yaml`.
3. Fill the contract before formalization. Do not silently repair a false or
   ambiguous formulation to make it pass.
4. Compute source and statement hashes from exact bytes/text.
5. Validate and render:

   ```bash
   PYTHONDONTWRITEBYTECODE=1 python3 \
     skills/theorem-contract/scripts/validate_theorem_contract.py \
     --workspace-root experiments/<theorem>/runs/lean-YYYY-MM-DD \
     --contract THEOREM-CONTRACT.yaml \
     --receipt RECEIPTS/theorem-contract.json \
     --rendered EVIDENCE/THEOREM-CONTRACT.md
   ```

6. Proceed only when the receipt verdict is `valid_for_formalization` and the
   independent informal audit has separately passed or recorded an explicit
   bounded uncertainty accepted by Ashton.
7. Preserve the contract and receipt. Later formalization and fidelity checks
   must cite their SHA-256 values rather than rewriting theorem intent.

## Typed Verdicts

- `valid_for_formalization` — structural, graph, source, policy, and exact Lean
  statement binding checks passed; no proof claim is made.
- `rejected_false_or_unprovable_formulation` — the contract itself declares a
  known counterexample or inconsistent formulation.
- `blocked_source_evidence` — a required source is missing, unsafe, unreadable,
  or does not match its declared hash.
- `rejected_contract` — required fields, graph, constructivity, success gates,
  or exact binding checks failed.
- `blocked_unsupported_yaml_subset` — the file is not valid JSON-compatible
  YAML and was not interpreted.

## Guardrails

- Never equate contract validity with theorem truth.
- Never equate an informal proof audit with Lean kernel verification.
- Never infer that an open formulation is true; the validator does not solve it.
- Never weaken a conclusion, strengthen a hypothesis, narrow a domain, or alter
  a definition without issuing a new contract identifier and review.
- Never permit `sorry`, `admit`, or unapproved axioms through this contract;
  downstream kernel verification must enforce those prohibitions independently.
- Do not rewrite or normalize source materials while hashing them.
- Do not follow symlinks outside the authorized workspace.

## Outputs

- canonical human-owned `THEOREM-CONTRACT.yaml`;
- canonical machine receipt conforming to
  `schemas/theorem-contract-receipt.schema.json`;
- deterministic Markdown view generated from the contract and receipt.

The Markdown view is a convenience rendering, not competing truth.
