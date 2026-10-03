# Verification Record: Stable-Release Semantic Cycle

Publication date: 3 October 2026. Original run: 1 October local, with terminal
receipts dated 2 October UTC. This is a curated projection of sealed records,
not a reissued native receipt or a new theorem-search cycle.

The public [provenance file](stable-cycle-2026-10-01/provenance.json) binds all
eight accepted stage manifests, the four OPEN terminal obligations, source
record hashes and the exact auxiliary package. Original closeout snapshot:
`d3f1b634ce8f24a7db075149b36015b39c30a9324fb20d25ea1ba01c1495f95b`.
Publication readback matched **483/483** snapshotted files, with no drift.
The installed source guard separately matched all **112/112** pinned files.
The original terminal Stage 7 manifest was freshly verified by the unchanged
installed verifier; no producer/gate/close command was rerun at frozen paths.

| Evidence | SHA-256 |
|---|---|
| Original terminal Stage 7 manifest | `a371f0a156717af7e43a29e1d74ded2cb27ee58ea175891073b2dddaf16d2c05` |
| Original native workflow report | `4a6bd762a476678648c2c53cd8d09c5b2b914ac63c3dd816e890f4cc8795d0ee` |
| Exact awarded `LeanProof/Main.lean` | `f57f3407e12084861bd740e7bce3b893e547690cad848c23e46e91144e4f0241` |
| Original theorem contract | `4e6bfa7b749834811870c897275baaf0f6ed2c1f8b6d0246cc866118ee27fc28` |
| Original native kernel receipt | `0b2c7bff1650294a1129c0f6d0a4b5a176324646639978bf5b2a211b37540f3a` |
| Original native fidelity receipt | `be705a89d25c56421a0ee084aee34357b6f9591a70afea7b9bf7baca3e3cd72e` |
| Original terminal ledger | `24ffb252b902af3c65671194708ba5b40cded87070fe2dab2936b277afd0c209` |

All seven native receipt hashes referenced by the workflow report were checked
against the originals during export. The original kernel receipt records five
successful commands: Lean/Lake version checks, project build, single-file check
and axiom probe. Its source hashes agree before/after. The native workflow
status is `formally_verified`, failures empty. The actual reported axioms are
`propext`, `Classical.choice`, `Quot.sound`.

Exact scope: `StableTrial.weighted_adjacent_identity` is a scalar equality at
`k=n+1`, not `D>0`, a graph theorem, an occupation-selector theorem, recursive
state preservation, NoRecovery or forest unimodality. The four unification
claims remain OPEN. No headline or existing registry grade is upgraded.

The [source package](../proofs/lean/stable-cycle-weighted-adjacent/README.md)
provides reproduction commands and explains the public projection boundary.
On 3 October the exported `LeanProof/Main.lean` also passed a fresh single-file
Lean check using the same pinned read-only shared Mathlib project, with exit 0
and only the already disclosed linter warning. This checks the relocated source,
not the full public-project build or a new governed theorem/fidelity award.
No raw model returns, private host paths or dependency package trees are
published. The completed cycle does not certify automatic transitions, M-13,
frictionless operation or improved discovery efficiency.
