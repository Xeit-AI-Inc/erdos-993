# Root final-analysis simplification: orbit flow lift

This alternative proof is outside the frozen adjudication cases. It changes no scope and supplies no uniform quotient-feasibility result. The neutral DRE proof of record is the invariant-maximizer Hall argument in C6-T5 and its two critics; final identity review may independently check this simplification.

Let finite group Gamma preserve the bipartite relation and nonnegative integer supplies/capacities. For a source orbit A and target orbit B with at least one relation edge, the induced bipartite block R_AB is biregular: transitivity on A makes every source degree d_AB the same, and transitivity on B makes every target degree e_AB the same. In particular |R_AB|=|A| d_AB=|B| e_AB. The action need not be free and need not be transitive on the individual edges.

Given quotient flow f_AB, put the same rational flow f_AB/|R_AB| on every original edge in this block. At each u in A, this block supplies outgoing flow f_AB/|A|; at each v in B it supplies incoming flow f_AB/|B|. Summing over blocks, quotient source saturation and orbit-constant s give total outgoing flow s(u). Quotient capacity inequalities and orbit-constant c give incoming flow at most c(v). Thus the original finite network has a rational feasible saturating flow.

Replace every nominally unbounded relation edge capacity by total source supply (the zero-supply case is immediate). All capacities are then finite nonnegative integers. Max-flow integrality gives an integral flow of the same saturating value. This proves precisely the registered candidate lifting implication. It is an existence proof, not a practical algorithm for explicitly expanding enormous orbit layers, and it does not produce the required quotient flow for any new tree or parameter.
