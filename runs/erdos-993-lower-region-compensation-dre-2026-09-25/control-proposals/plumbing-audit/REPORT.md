# Stage 1 plumbing audit

Proposed scripts: `worker_ops.py` and `controller_ops.py` in this directory. These are inactive copies for controller review. The preparation manifest's 14 members matched their SHA-256 pins when checked.

## Dependency isolation

- Worker IDs are limited to C1 through C6. Each cycle has 18 search routes (six each for T, F, U), 36 critics (two different-orientation critics per route), three origin adjudicators, and one synthesis.
- A critic has exactly one source route in its own cycle, with a different orientation. An origin adjudicator has exactly six routes of its origin plus their twelve critics. Synthesis has exactly the three adjudicator returns, and only top-level files in each adjudicator output directory.
- Source return paths must be `cycles/cycle-N/WORKER/RETURN.json`. Every named source file is inside that worker directory and matches a pinned SHA-256. Review returns must explicitly dispose of every upstream claim ID. Worker statuses remain `proposed_*` with `status_authority: proposed_worker_only`; controller registry and ledger decisions are outside these scripts.
- Search and critique packets specify `gpt-6-luna` with `high` reasoning effort; adjudication and synthesis specify `gpt-6-sol` with `high`. The controller selects C1 authority files at the base paths and C2–C6 authority files from their cycle snapshots. The gate commands use the flat `governance/` script paths.

## Admission safety

Inventory excludes any copied worker directory until its controller admission manifest exists. `admit` removes its newly copied worker directory and any newly written receipts or manifest if validation, a gate, or sealing fails. It checks that the return's report and evidence all belong to the admitted worker directory. `case` also removes its fresh packet, inventory, receipts, scratch directory, and dispatch manifest if dispatch preparation fails. The controller must serialize operations for the same worker ID and separately confirm worker completion before admission.

## Verification and limits

`python3 scratchpad/plumbing-audit/test_plumbing.py` passes four fixture tests. They cover the full 18/36/3/1 dependency sets; exact critic, adjudicator, and synthesis inputs; Luna/Sol packet roles; complete dispositions; unsafe and cross-cycle paths; nested synthesis inputs; hash drift; provisional inventory exclusion; and failed then successful admission. Tests use stub gate responses, so they do not exercise live governance gates or attest to the actual model used by a worker. The scripts use only Python's standard library and require Python 3.9 or later (`Path.is_relative_to`); fixture verification used Python 3.11.2.
