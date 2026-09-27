# Reviewed finite arithmetic controls

These exact-integer programs support bounded statements only. They are not a census-free proof of an unbounded assertion. Run copies in a separate directory: the programs write their JSON outputs beside the script.

- `mass_profile_scan.py`: all 91,880 arity-count profiles through 80 branches; 70,926 eligible profiles and 133,194 eligible lower-half rows. Its curated version repairs per-layer row telemetry only; `mass_profile_scan_correction.json` preserves the original and corrected hashes and comparison result.
- `spread_sweep.py`: first-descent and pre-descent increment tests for fixed-(m,N) spreads `(3,3)->(2,4)`; the reviewed m100 output covers 166,650 spreads.
- `shared_S_sweep.py`: both graphs use their own first descents and current strict selectors; the reviewed m35 output covers 7,140 spreads and 97,889 common eligible rows.

Read each script's arguments/default horizon before running. The finite outcomes leave the corresponding universal mass and spread mechanisms open. The original narrative `(2,4)` parent vector had a typo: its degree-four coefficient is 108, not 116. The scripts use the correct factors.
