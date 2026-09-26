# C2-CF-U2 critique (orientation F)

## Reviewed claim

`E993-MARKED-ISOLATE-ORDER-BAND` is retained at exactly the generic graph scope in the source return: for a finite simple graph (G) of order (m), a set (W) containing all isolates, and integer (k\ge2) with (m\le2k+1), the marked independent-set counts satisfy (q_{k+1}\le q_k). No tree, bipartite, selector, alpha, or first-descent hypothesis is part of this claim. The registered identity and obligation ledger both leave it OPEN; this critique is a proposed disposition only.

## Independent audit

For each marked independent (k)-set (A), define (N(A)) as the union of its open neighborhoods and (b(A)=|N(A)|). Since (A) is independent, (N(A)\cap A=\varnothing), so exactly (m-k-b(A)) vertices extend (A) to an independent ((k+1))-set. Sum (b(A)) over the (q_k) marked lower sets and call the result (B). Let (C) count each marked independent ((k+1))-set with at least two vertices in (W), once.

Count lower-to-upper extension incidences. An upper set with exactly one mark has exactly one deletion that leaves a marked lower set, hence contributes one incidence. An upper set with at least two marks has all (k+1) deletions marked, hence contributes (k+1). Thus

\[
 kq_{k+1}+C=(m-k)q_k-B,
 \qquad k(q_{k+1}-q_k)=(m-2k)q_k-B-C.
\]

This also handles empty layers: every count and incidence sum over an empty family is zero. If (m\le2k), the right side is nonpositive because (q_k,B,C\ge0).

At (m=2k+1), partition the marked (k)-sets into those with (b(A)>0) and those with (b(A)=0). Every first-type set contributes at least one to (B). A set of the second type consists only of isolates, and is marked because (W) contains every isolate. If there is a non-isolated vertex (y), fix it and send each second-type set (A) to (A\cup\{y\}). This is independent; (y\notin A); and it has at least (k\ge2) marked vertices already in (A). It is therefore counted by (C). The map is injective because deleting the fixed (y) recovers (A). Consequently (C) covers all second-type sets, so (B+C\ge q_k), and the identity gives the result. If there is no non-isolated vertex, (G) is edgeless and (W=V(G)); complementation on the (2k+1) vertices bijects (k)-sets with ((k+1))-sets, giving equality. These cases also include an empty bad or good class.

The boundary proof genuinely uses (k\ge2): it needs the image (A\cup\{y\}) to have at least two marked vertices even when (y\notin W). No defect was found in the statement or proof.

## Exact boundary and relevance to the primary

The order cutoff cannot be raised to (m=2k+2) under only the generic hypotheses. For (G=K_{1,,2k+1}) with (W) one pendant vertex, (G) has no isolates, so the isolate condition holds. For (j\ge1), (q_j=\binom{2k}{j-1}). Hence

\[
q_{k+1}=\binom{2k}{k}>\binom{2k}{k-1}=q_k \quad(k\ge2).
\]

The registered `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` concerns the unmarked difference of the full graph's independence sequence at its exact order; it does not compare these marked counts and supplies no extension of this claim.

There is a useful but guarded tree application. For an ordinary tree (T), original leaf (v), and original support (s), put (H=T-\{v,s\}), (R=T-N_T[s]), and (W=N_T(s)\setminus\{v\}). An isolate of (H) must have had its sole original neighbor at (s): connectivity puts its neighbor in the removed pair, and it cannot be adjacent to the original leaf (v). Thus every isolate of (H) lies in (W). For (p\ge3), set (k=p-1\ge2). If (|T|\le2p+1), then (|H|=|T|-2\le2p-1=2k+1), so the generic claim gives

\[
q_p(H,W)\le q_{p-1}(H,W),
\]

which is exactly the nonpositive ordinary-leaf term \(\Delta_{p-1}(H)-\Delta_{p-1}(R)\). Therefore every such term, and any selected sum of them, is nonpositive in this order band, with multiplicity unchanged. This is a valid pointwise corollary, stronger in its lack of favorable/alpha/x guards but restricted by the order cutoff.

It does not prove the full primary lower-region assertion. At the next shell (|T|=2p+2), the graph (H) has order (2p=2k+2), just outside the generic theorem; nor does the generic result itself establish selector eligibility or settle larger orders. It yields no claim about a full sum there. The route itself did not claim that transfer, consistent with the critic brief.

## Disposition and limitations

Disposition: **retained**. The incidence count, odd-boundary injection, edgeless equality, exact (k\ge2) guard, and generic scope all hold. The order-((2k+2)) star example shows why a broader generic statement would be false. The order-((2k+2)) unmarked classification in the registry is a different statistic and does not close the marked boundary.

This is an informal proof audit; no Lean proof or finite code replay was needed or performed. No status award is made. The ordinary-leaf consequence above is a derived, exact subregion consequence only; the primary outside that band remains unproved by this claim.
