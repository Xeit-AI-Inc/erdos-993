# A concrete local export direction for choked brooms

Controller derivation to audit in a successor; no universal result. Consider CB(d,m) and, for this paragraph only, assume the fixed original selector contains the distinguished arm leaf v and ALL md branch leaves. This is checked on CB(8,92), but is not assumed for all parameters without proof.

An upper independent set B containing the hub h and v has weight1: no choke is occupied, so no branch leaf is active. In a given branch suppose exactly one support u is occupied and ell branch leaves are occupied. Inserting its choke c and removing h,u is an allowed two-for-one move. The resulting lower D still contains v, contains exactly one choke c, and has weight ell (the ell leaves in that branch); v is now inactive. Each such D has at most d-ell preimages of this shape, because the removed support u can lie only on a pair whose leaf is absent.

Consequently, if ell>=ceil(d/2), the lower weight ell pays every possible source preimage d-ell. Assigning each upper B with at least one such branch to ONE chosen qualifying branch gives a capacity-respecting injection/flow for that upper subfamily: every output identifies its unique choke, so the preceding fiber bound applies. This only handles upper sets containing h,v and a qualifying branch. It does NOT show that unused lower capacities can handle the remaining upper layers, the other hub/selector cases, or the aggregate. Full matching requires those demands to be accounted for jointly.

The qualifying local states have polynomial

    d*z*sum_{ell=ceil(d/2)}^(d-1) choose(d-1,ell)*z^ell

inside the matching-pair polynomial (1+2z)^d. Thus the unhandled root+v source subfamily is counted by the (m)-th power of the difference. A deletion may move into a qualifying pattern (by reducing support count2 to1), so this is NOT a downward-closed product family; do not drop its boundary or apply a shadow theorem without checking hypotheses. The matching-pair independence poset is a product of two-point rank-one choices (cross-polytope face poset), which suggests investigating sharp shadow/isoperimetric bounds, rank-normal posets, or a probabilistic routing certificate. Those suggestions import no theorem. A successful result must respect the fixed original selector and competing lower capacities.
