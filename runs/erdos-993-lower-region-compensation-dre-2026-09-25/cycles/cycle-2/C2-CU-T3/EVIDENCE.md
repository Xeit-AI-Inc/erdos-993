# C2-CU-T3 evidence

Independent audit of source claim `C2-T3-shell-root-shadow`:

- Shell order is \(|H_v|=2p=2k+2\), with \(k=p-1\). Every component of the leaf deletion forest contains exactly one original mark in \(W_v\), including singleton branches from same-support leaves.
- Subtracting the unmarked remainder gives \(q_v(j)=i_j(H_v)-i_j(R_v)\), and the selected summand is exactly \(q_v(k+1)-q_v(k)\). The fixed selector is unchanged; tags are not merged.
- The first-mark partition is exact. If a marked root has degree at least two and there are no isolates, place it first. Each (J_i) loses at least three vertices, leaving order at most (2k-1). The elementary deletion shadow (k i_k(J_i)\le (|J_i|-k+1)i_{k-1}(J_i)) then proves every part nonpositive, including (k=1).
- The strict eligibility guard gives \(a-p\ge\lceil p/2\rceil\), so the stated cover bound is correct. It is only a coordinate, not a compensation proof.
- Selected edgeless (H_v) is impossible under (x+2\le p), because it forces a star with (x=p+1). Remaining isolate and degree-one-root configurations can have order-(2k) partition parts; their possible excess is not paid for by the argument.

Disposition: `retained` for the exact subclass claim. No global shell or lower-region conclusion, finite census, or controller status is inferred.
