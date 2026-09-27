# Exact finite prefix and analytic scalar

These are byte-identical accepted source and numerical output files, curated from the internal Cycle 3 record. No failed replay, private worker report or private transcript is included. The corrected independent replay contains B1=(1,2). The proof and exhaustive rank partition are in the accompanying hybrid-family-proof.md.

With a C++17 compiler and GMP development libraries available, compile separately:

```sh
c++ -O3 -std=c++17 census.cpp -lgmpxx -lgmp -o census
c++ -O3 -std=c++17 replay.cpp -lgmpxx -lgmp -o replay
```

Run `./census 1 41 all` for the early all-eligible prefix; `./census 42 265 lower` for the lower-half production base; `./replay 42 265` for the independent second implementation. These are substantial exhaustive jobs, not quick tests. Saved successful full outputs are included. The producer terminal record contains elapsed time, so a new run need not be byte-identical; all mathematical fields must agree. Both programs abort on a positive S or failed exact arithmetic assertion. Compare all 224 layer rows, profile counts, eligible counts, selector counts and greatest exact S. The producer uses a differential recurrence; the replay uses exact factor replacement. A matching sample or truncated output is not completeness.

`python3 scalar_audit.py` and `python3 local_audit.py` are small exact-arithmetic checks for the analytic tail. They do not replace the uniform algebraic proof. Full recorded totals: 3,172,315 finite profiles; 21,510,525 explicitly checked rows. The m42..265 component alone is 3,159,072 profiles and 21,300,150 lower-half rows. Additional high-half ranks are covered by a theorem. No formal source-to-binary certificate is claimed.
