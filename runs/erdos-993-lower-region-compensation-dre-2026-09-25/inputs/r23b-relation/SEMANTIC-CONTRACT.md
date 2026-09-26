# SEMANTIC CONTRACT — r23 (v0.1, controller seed; routes extend, gates amend)

Status: LIVING DOCUMENT. v0.1 pins the controller-recovered definitions
and their source bytes; C1 (OB-R23-RECOVER) completes the
source-to-definition map and the definitions/proved/assumed partition.
Every amendment is gate-recorded; superseded text is struck, never
deleted.

## 1. Source pins

- Public snapshot: `github.com/Xeit-AI-Inc/erdos-993` commit
  `79a55e5aa04c32baaec5c49a8b08cc261292653f`
  (local clone `/Users/ashtonsperry/Projects/XeitAI/erdos-993`).
- Master registry: `../erdos-993-master-ledger-2026-09-04/CLAIM-IDENTITY.json`,
  sha256 `d09bd77dd75fa5006d618e2106186c421e8ed30a3debd172d6460844c95c8091`.
- Master ledger: `../erdos-993-master-ledger-2026-09-04/LEDGER.md`,
  sha256 `f11532b0675e9ae87fdc0d36df4425b9c48e29382c46bd89d6fd84cb963c7976`.
- Revised audit (2026-09-13): `sources/erdos-993-revised-program-audit.md`,
  sha256 `97724ea296121150723eb6f71d6297ff906cc8cc82dfae8bd408e14b1ff205ad`,
  with companions `sources/revised-claim-graph.json`,
  `sources/revised-audit-checks.json`, `sources/revised-experiment-inventory.csv`.
- r19 terminal records: `../erdos-993-beta-aggregate-dre-2026-09-07/`
  (READ-ONLY). The authoritative fixed-relation text: r19
  `cycles/cycle-7/stage3/routes/T1/RETURN.md` §2 ("Exact Fixed
  Relation"), worker c7r2-t1. Related: r19 C1 order-91 canonical replay;
  C2/C6/C9 T-portfolio returns; C9 CARTOGRAPHY.
- r21/r22 terminal records: `../erdos-993-o14-multibase-hall-dre-2026-09-10/`
  and `../erdos-993-o14-multibase-hall-dre-continuation-2026-09-11/`
  (READ-ONLY): generic collision identities, minimal-deficiency
  theorems, the Möbius weight uniqueness — NONE supply the actual-tree
  instance (audit §5, binding).

## 2. Ordinary-tree definitions (the evaluation contract)

On a finite tree T (simple, undirected):

    i_k(G): number of independent k-subsets of V(G); i_0 = 1; zero
            outside supported ranks.
    Delta_k(G) = i_{k+1}(G) - i_k(G).
    x(T) = min{k >= 0 : Delta_k(T) < 0}   (first strict descent).

For each ORIGINAL degree-one vertex (leaf) v of T with unique neighbor
(support) s_v, and each rank p >= x(T)+2:

    a_v      = Delta_p(T - v)
    b_v      = Delta_{p-1}(T - {v, s_v})
    B_{s_v}  = Delta_{p-1}(T - N[s_v])          (closed neighborhood)
    g_v      = b_v - B_{s_v}
    F_p(T)   = {original leaves v : a_v < 0}    (the favorable set)
    S(T,p)   = sum_{v in F_p(T)} g_v            (the complete aggregate)

Leaves are counted separately even when supports coincide. F empty =>
S = 0. O14 (`E993-BETA-AGG`, OPEN): S(T,p) <= 0 for every governed T
and every p >= x(T)+2. **RTree-interface reconciliation is an open C1
obligation**: the registered claim states B as `Bgen_{s_v}(p-1)` on the
governed RTree model; any divergence from the ordinary-tree B above
must be recorded as a finding, not silently normalized.

## 3. The literal fixed Delete/Retag relation (r19 C7-T1 §2, verbatim semantics)

Fix a governed tuple (T, p, F) with F = F_p(T). For v in F:

    H_v    = T - {v, s_v}
    W_v    = N_T(s_v) \ {v}
    C_r(v) = {A in Ind_r(H_v) : A ∩ W_v ≠ ∅}      ("active" sets)

    P = ⊔_{v in F} {v} × C_p(v)        (source/top nodes)
    N = ⊔_{v in F} {v} × C_{p-1}(v)    (target/bottom nodes)

Edges:

    Delete(q): (v, A) -> (v, A \ {q}),  q in A,  when A\{q} in C_{p-1}(v)
    Retag(w):  (v, A) -> (w, A \ {w}),  when w in F ∩ A and
               A\{w} in C_{p-1}(w)

`E993-R19-FIXED-GAMMA-HALL` (OPEN): Hall's subset inequality
|X| <= |Γ(X)| for every X ⊆ P. Excluded by fence: the residual-token
capacity cap(y) = D - d_minus(y).

**Known partial (r19 C7-T1 Thm 3.1, informal, retained at exact
scope):** on the face 2p >= |V(T)|, Delete edges alone satisfy Hall
(within-tag double counting; (p-1)|X_v| <= (|V(T)|-p-1)|D_v(X_v)|).

## 4. The bridge (controller-verified numerically; correspondence proof = OB-R23-CORRESPOND)

Since N_T(s_v) = {v} ∪ W_v, we have T - N[s_v] = H_v - W_v, hence for
every r:

    |C_r(v)| = i_r(H_v) - i_r(T - N[s_v])                     (BRIDGE-1)

and therefore

    |P| - |N| = sum_{v in F} (b_v - B_{s_v}) = S(T,p).        (BRIDGE-2)

Stage-0 numerical verification: 280 instances, orders 8–12, literal
active-set enumeration vs coefficient DP
(`control/STAGE0-AUDIT-VERIFICATION-RESULTS.json`, check E). Status:
**computation, not proof**; the Lean correspondence package must prove
BRIDGE-1/2 on the actual-tree domain with totality, multiplicities, and
boundary cases, assuming no Identification and no Hall inequality.

Consequently:

- All-cut Hall on (P, N, Delete ∪ Retag) => a perfect matching of P
  into N => |P| <= |N| => S(T,p) <= 0. (Hall is SUFFICIENT for the
  row's aggregate nonpositivity; not necessary.)
- A deficient Hall cut refutes the MECHANISM claim
  `E993-R19-FIXED-GAMMA-HALL` only; S(T,p) may remain <= 0.
- A positive S(T,p) on any governed row refutes O14 itself. Both values
  are always reported on the same row.

## 5. Intended theorem statements (exact targets for OB-R23-CORRESPOND)

- **THM-R23-A (row construction):** for every finite tree T and rank
  p >= x(T)+2, the data of §3 is well-defined; Delete and Retag are
  total on their stated domains; every edge lands in N; multiplicity
  statements exact.
- **THM-R23-B (coefficient correspondence = BRIDGE-1/2):** the exact
  cardinality identities above, universally quantified over the
  actual-tree domain.
- **THM-R23-C (conditional bridge):** Hall on the actual relation =>
  S(T,p) <= 0, via the matching/injection argument, with the all-cut vs
  complete-demand distinction explicit.

## 6. Known defects carried as controls (from the revised audit; Stage-0 confirmed)

- `E993-PAIR-RANK2-EXACT` (VERIFIED row): g_2 = C(g_1-1, 2) FAILS
  unguarded (K_{1,3}: g=(1,2,1), g_2=1 vs 0; 535,900 violations in
  999,736 labeled leaf pairs, orders 3–8). Corrected tree formula
  g_2 = C(n-3,2) + deg_T(s_v) - 2: 999,736/999,736. Controller algebra:
  the registered form holds iff deg(s_v)=2 iff T-{v,s_v} is connected
  (n >= 4) — so the row's truth turns on which object its
  connectedness guard binds; determining the registered reading and the
  r20 filter usage is C1/C2 work (proposal-only output).
- r16 global `hKSCOPE` (component order <= 25): refuted by P30
  (residual P26; all displayed G1 guards satisfied at p=10; Stage-0
  check B). Never assumed anywhere in this run.
- Mode conventions: first global mode, last global mode, and first
  strict descent are three different objects; x = m_+ fails without
  unimodality ((1,4,3,5,1)). Every face names its convention.

## AMENDMENT A1 (C1 gate, 2026-09-13; ADJ-T CR-4 / synthesis RC-05, RC-06)

**A1.1 (RTree provenance note on §3).** The pinned relation's literal r19
provenance is on governed RTrees (the phrase "governed RTree" appears in
r19 c1-T1 only; later r19 cycles say "governed tree" without a recorded
transfer). Its use on ORDINARY finite trees in this run is an r23
CONVENTION, not a proved transfer: `RTree.semanticAdequacyTarget` is
stated, unproved, and source-annotated unattempted (per-instance
adequacy IS decide-dischargeable — r8 precedent; the UNIVERSAL statement
is the gap; D9 anchor: CLAIM-IDENTITY.json:217). Every r23 "actual tree"
result carries this premise until the transfer is proved or the r23
statements are accepted as the definitions of record on ordinary trees.

**A1.2 (registry letters, correcting the §6 alias narrative).** r20's
registry convention (RUL-R20-C4-1; r20 trees.py full_leaf_quadruple):
h = i(F), f = i(F−v), g = i(F−{v,s_v}), r = i(F−N[s_v]) — so registry r
IS r23's B_{s_v} object and registry g IS r23's b_v object. Adjudicated
bare-equality counts over all labeled trees orders 2–8 (999,738 leaf
instances): on f 999,738/999,738; on g 463,838 (535,900 failures — the
§6 figure, correctly attributed to g); on r 383,112. The §6 controller
algebra is CONFIRMED (ADJ-F R-1): the registered form on g holds iff
deg(s_v) = 2 iff T−{v,s_v} is connected; general forest law
i_2(S) = C(i_1(S)−1, 2) + c(S) − 1. C1-F4's contrary letter-binding
ruling is REJECTED and must not be cited.

**A1.3 (closed questions).** The Retag domain reading is CLOSED
(Lemma L1: s_w ∈ A impossible; the two readings are extensionally
identical — proved, not sampled) and the relation is SIMPLE (no
multi-edges — proved). No C2+ seat re-opens either.

## AMENDMENT A2 (C2 gate, 2026-09-14)

**A2.1 (registry re-pin).** Master registry now 80 claims, sha256
`b57e79908202edd19cfb165b9f9da00d6f3767dc729126cfce5c9747556c1a94`
(the authorized Codex closeout, public commit `3061f289`); LEDGER.md
live sha `e812fdba…`. The prior pins (79 / `d09bd77d…`) remain the
record of what C1–C2 faces read.

**A2.2 (the dead branch, binding fence).** `E993-R23-LITERAL-ACTUAL-
TREE-FIXED-GAMMA-HALL` is REFUTED (order-91 T22, p=34, NO-BRANCH-CENTER
cut; controller-verified digit-exact, receipts in control/). The
literal all-cut Hall mechanism AND Delete-only universal Hall at
literal ordinary-tree scope are a DEAD BRANCH: no r23 seat re-opens
them, re-scans orders ≤ 16 for Delete-only failures, or hands either
onward as a live mechanism. NOT part of the branch (retained at exact
scopes): r19 Thm 3.1 (2p ≥ n), F1-EXT-1 (2p ≥ n−1, all-multi-witness),
THM-R23-C as a conditional, and the per-row demand |P| ≤ |N| (which is
the O14 row itself via BRIDGE-2).

**A2.3 (erratum to A1.1's parenthetical, ADJ-sustained).** The phrase
"appears in r19 c1-T1 only" is corrected: "governed RTree" appears
across the r19 corpus (canonical claim-ledger rows verbatim; T6b's
count of citing CLAIMS.csv rows is 7 per the adjudicated correction),
while the ROUTE PROSE drifts (RTree → tree → RTree → sidestepped) and
the pinned c7-T1 §2 text itself says "governed tree". A1.1's premise —
the transfer is unproved and every actual-tree sentence carries it —
is UNTOUCHED and remains binding.

**A2.4 (row tags).** New registered rows from C3 use `R23B-*`
(collision avoidance with the Codex closeout's published `R23-*`
rows). Sealed `R23-C1-*` / `R23-C2-*` ids are unchanged; the terminal
reconciliation will publish the mapping.
