# Replaying the C6 finite certificate

Run these commands from the published experiment directory `runs/erdos-993-absolute-compensation-dre-2026-09-27`, using Python3.11 on a POSIX system. The instruments use only the standard library. They test a finite restriction of the guarded tip surplus, not Erdős993 or an arbitrary-tree statement.

## Inspect retained evidence

The accepted-certificate candidates are corrected A in `control-proposals/C6-A-PROTOCOL-REPAIR1/run-full/` and independent B in `cycles/cycle-6/C6-U2/final-run-1-99/`. Each has the frozen source, transport receipt, result and99 durable per-m checkpoints. Their result schemas differ; compare mathematical fields, not raw JSON bytes. Their timings and platform metadata are deliberately retained and will differ on a replay.

A's original invocation omitted embedded controls. Its original evidence remains preserved in the C6-T2 case. Corrected A reruns the whole range with the same mathematical algorithm and embedded controls. This repair is still implementation A, not a third independent method. The full source diff and cumulative runtime accounting are retained beside it.

The public `SOURCE-HASHES.json` records hashes of the bundled evidence. From this directory, the following checks only the recorded bytes:

```sh
python3 - <<'PY'
from pathlib import Path
import hashlib,json
root=Path.cwd()
manifest=json.loads((root/'SOURCE-HASHES.json').read_text())
for item in manifest['members']:
    p=root/item['path']
    assert hashlib.sha256(p.read_bytes()).hexdigest()==item['sha256'],item['path']
print('All bundled source hashes match')
PY
```

A hash match confirms provenance, not mathematical correctness. Read the scripts, exact coverage formula, controls, tail proof and independent reviews as well. In particular, the producer B validator checks nonnegative row minima and trusts some receipt fields; the independent controller comparison additionally rehashes actual files, checks exact distinct m-indices and requires every matched minimum to be strictly positive.

## Full independent reruns

Use fresh output directories. The frozen runner refuses to overwrite an existing run and enforces its1800second invocation limit. Do not rerun inside a retained certificate directory.

```sh
mkdir -p replay
python3 sources/cycle6/C6-PREFIX-RUNNER.py \
  control-proposals/C6-A-PROTOCOL-REPAIR1/prefix_A_protocol_repair1.py \
  replay/array-a --min-m 1 --max-m 99
python3 sources/cycle6/C6-PREFIX-RUNNER.py \
  cycles/cycle-6/C6-U2/census_b.py \
  replay/kronecker-b --min-m 1 --max-m 99
```

For each successful full run, require99 unique layers m1..99,171699 profiles,56245000 represented-type/rank rows, no failures, and minimum98. Every layer's minimum must be strictly positive. Check each layer's counts against `sources/cycle6/C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json`, controls against the frozen protocol, the attaining profile/arity/rank and exact coefficients, the executed-source hash against the supplied source, and the original/frozen pre/post source hashes against one another. Exit0 is transport success only.

A uses explicit monomial coefficient arrays and exact cofactor division. B evaluates positive polynomials at a rigorously sufficient power-of-two radix, directly decrements the marked exponent and extracts carry-free digits. Both enumerate all count profiles, represented arities and guarded ranks without eligibility filtering. Equal-arity branches and permutations have the same marked polynomial, so type/profile enumeration covers the literal predicate.

The complete prefix still ends at m99. The separately reviewed analytic tail, corrected downstream comparison lemmas and exact domain matching are necessary for any all-m conclusion. Neither these finite reruns nor a tail-only Lean theorem constitute a formal proof of the entire all-m comparison or the original conjecture.
