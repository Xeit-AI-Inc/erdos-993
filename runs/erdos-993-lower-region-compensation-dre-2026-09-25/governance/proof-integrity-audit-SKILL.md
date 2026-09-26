---
title: Proof Integrity Audit
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 0.4
last_updated: 2026-07-01
machine: Mac Mini
owner: Ashton T. Sperry
---

# Proof Integrity Audit

## Purpose

Use this skill when Ashton asks VerityOS to audit mathematical proofs,
derivations, appendices, theorem statements, proof steps, source-dependent
mathematical claims, or solver-backed claims until each claim has an
evidence-grounded verdict.

The skill is designed for adversarial proof-integrity loops where the product is
not a rewritten proof, but a durable ledger of claims, evidence, escalations, and
stop reasons.

It is scalable. Use it for a single problem, a section or appendix, a full paper,
or a book-length mathematical audit by changing the run scale, ledger
granularity, and stop condition without changing the core verification
discipline.

## Load First

Before running this skill, boot VerityOS and load only the needed supporting
context:

- `modules/project-regimes/mathematical-reasoning.md`
- `modules/integrity/evidence-integrity.md`
- `modules/integrity/provenance.md`
- `modules/integrity/validation-checks.md`
- `operations/` records when the work is routed to a persistent thread
- `experiments/` instructions when the run has a bounded asset and stop rule

## Template Resources

Use the bundled templates when a run needs durable state or a handoff-ready
artifact:

- `templates/kickoff-prompt.md` - task package for Codex, Code, or another
  engine to run the loop to completion.
- `templates/ledger-schema.csv` - canonical claim-ledger header and example row.
- `templates/loop-state.md` - resumable state, counts, budget, and stop reason.
- `templates/escalations.md` - precise defects, author decisions, and blocked
  sources/tools.
- `templates/reconciliation-report.md` - cross-engine or cross-family ledger
  comparison.
- `templates/postpatch-check.md` - verification after any mathematical repair.
- `templates/domain-map.md` - domain-to-method routing map for unfamiliar
  mathematics.

Copy templates into the run workspace before filling them. Do not edit the
canonical templates for one-off run state.

## Required Inputs

A proof-integrity run should identify:

- the target mathematical document;
- companion audit or domain-map documents, if any;
- the run workspace;
- the iteration budget or stop condition;
- the claim-ledger schema;
- acceptable evidence methods;
- forbidden actions.

If required inputs are missing, stop and report the missing items. Do not
invent target files or source support.

## Scale Modes

Choose the smallest scale that covers the request:

### Single Problem

Use for one theorem, exercise, equation, proof sketch, or numerical claim.
Create a compact ledger with one row per meaningful claim or inference. Evidence
may live directly in `EVIDENCE/` as a short derivation, script, transcript, or
source excerpt. A single prover/critic cycle is enough unless the result will be
published, propagated, or used as a premise elsewhere.

### Paper or Appendix

Use for a bounded article, chapter appendix, technical memo, or proof section.
Create one ledger row per definition, lemma, theorem, proposition, corollary,
remark that carries mathematical force, numbered equation, table claim, solver
claim, or nontrivial inferential step. Track dependencies and run a
cross-consistency pass across companion sections, figures, tables,
bibliography, and author-facing claims.

### Book or Large Manuscript

Use for book-length or multi-chapter audits. Split the work into scoped run
folders by chapter, appendix, theorem family, or dependency component. Maintain
a top-level manifest that maps each sub-run to its target files and terminal
state. Do not let a clean local proof close the book audit until dependent
chapters, appendices, summaries, examples, glossary entries, and bibliography
references are checked for propagation.

Book-scale audits should finish in resumable milestones, not by holding the
entire manuscript in one context window.

## Workspace Rule

For bounded proof audits, use an experiment workspace under:

```text
experiments/<experiment-name>/
```

Keep each model-family pass in its own run folder, for example:

```text
runs/codex-YYYY-MM-DD/
runs/claude-code-YYYY-MM-DD/
```

Each run folder should contain:

- `LEDGER.csv`
- `EVIDENCE/`
- `ESCALATIONS.md`
- `LOOP-STATE.md`

Reports and reconciliation outputs belong under the experiment's `reports/`
folder unless Ashton directs a different output path.

## Autonomy Contract

When Ashton authorizes this skill as a workflow, the executing engine may run the
loop to completion within the stated boundaries:

- create or update run-state files inside the approved experiment/output
  workspace;
- run local computations, scripts, symbolic checks, source inspections, and
  read-only verification commands needed for evidence;
- produce ledgers, evidence files, escalations, reconciliation reports, and
  postpatch reports;
- continue through all claims until a terminal stop condition is reached.

The engine must pause for approval before:

- changing the author's target manuscript, source document, or canonical proof;
- promoting experiment findings into durable VerityOS records;
- treating an author-choice escalation as resolved;
- replacing missing source evidence with an inferred substitute;
- broadening scope beyond the approved target set.

## Procedure

1. Confirm the target and all required companion inputs exist.
2. Select the scale mode and initialize the run folder from the templates.
3. Read the companion loop, audit/remediation record, and domain map before
   touching the target proof when those files exist.
4. Create or refresh resumable run state.
5. Build the claim ledger read-only before assigning verdicts.
6. Enumerate definitions, lemmas, propositions, theorems, corollaries, remarks,
   and individual inference steps at statement-level granularity.
7. Record dependencies between claims so downstream claims can be reopened when
   support changes.
8. Verify one highest-severity open claim per round.
9. Use the strongest available evidence:
   - finite or algebraic claim: executable computation or CAS script;
   - analytic claim: explicit derivation;
   - literature-dependent claim: source check against the cited theorem's exact
     hypotheses and conclusion.
10. Run a separate critic pass over the unchanged claim before closing it.
11. Close a claim only when prover and critic verdicts agree with independent
    evidence.
12. Escalate precise defects, missing sources, unsupported steps, imprecision,
    or author-only choices.
13. After any repair that changes a proof, model, matrix, assumption, or
    companion document, run an independent second-family verification pass when
    another model family or engine is available. Keep the second-family run in
    its own run folder with reproduced evidence, then reconcile the two passes
    before treating the repair as stable.
14. Perform an explicit cross-consistency check after repair: confirm that the
    changed model, matrix, assumption, or theorem statement has propagated to
    dependent lemmas, proofs, remarks, examples, appendices, domain maps, audit
    records, chapters, and other companion documents. Treat "true in an
    idealized model but false in the canonical instance" as a first-class defect
    class, even when headline results remain intact. Also verify statement-presence
    and numbering integrity: every numbered result cited in prose, in figure or
    table captions, or through a dependency chain must have a matching *statement*
    in the body, and the numbering must have no gaps (a cited or implied
    Proposition N.2 requires an N.1). After any migration that externalizes tables
    or figures into separate files with insertion placeholders, confirm each
    externalized file holds only its artifact—table or figure, source, caption,
    note—with no theorem, proposition, lemma, or proof prose swept in; that each
    placeholder maps to exactly one file; and that the body still holds each
    numbered statement together with its full proof. (Observed 2026-07-01: a table
    migration swept a Theorem statement into `Table 13.3.md`, leaving a dangling
    caption reference and a 13.1/13.2 numbering gap while the proof body remained.)
15. Stop only when all claims are terminal, the budget is exhausted, a two-round
    stall occurs, or a required source/tool is blocked.

## Verdict Discipline

Use the run's configured verdict taxonomy. At minimum, preserve these
distinctions:

- verified with reproduced evidence;
- false by counterexample or contradiction;
- unsupported gap;
- citation mismatch;
- hallucination risk or untraceable assertion;
- imprecise but plausibly true under a charitable reading;
- needs author decision;
- disputed between prover and critic;
- blocked by unavailable source or tool.

Budget exhaustion, stalls, and blocked sources are not success states.

## Guardrails

- Verify; do not revise the author's mathematics.
- Recompute; do not rely on prose agreement.
- Do not silently repair a claim to make it pass.
- Do not relax acceptance criteria after seeing difficult claims.
- Do not mix scratch state between model-family runs.
- Do not accept a repair solely because the repairing family passes its own
  checks; require second-family verification or record why it is unavailable.
- Do not update only the headline claim when a model/matrix/assumption changes;
  verify dependent statements and companion documents for cross-consistency.
- Treat a numbered result that is cited (or implied by numbering) but missing its
  body statement as a first-class defect; content displaced into an externalized
  table or figure file during migration is a common cause. Verify externalized
  artifact files hold no orphaned mathematical statements, and that no proof was
  truncated in the move.
- Do not promote experiment results into memory, decisions, skills, modules,
  projects, identity, writing resources, or approved reports without explicit
  Ashton approval.

## Final Report

At stop, report:

- stop reason;
- verified versus escalated counts;
- ledger path;
- escalation report path;
- loop-state path;
- key evidence paths;
- blocked sources or author decisions;
- whether a second independent family run or reconciliation pass remains;
- whether the cross-consistency check found dependent statements or companion
  documents that still need repair.
