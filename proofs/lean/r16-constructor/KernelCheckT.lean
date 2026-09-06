-- T-side kernel check. The axiom-check role for this package is fulfilled by
-- the two vendored gated audit files `CheckT3.lean`/`CheckP3.lean`
-- (byte-identical originals; already-comprehensive `#print axioms`
-- transcripts covering the full T-side and P-side declaration lists,
-- including both of this package's headlines). This file and its P-side
-- twin `KernelCheckP.lean` add only the r12-pattern `#check` signatures,
-- split across the same T/P world boundary the source run itself enforces
-- ("no module may see both worlds" — R16C3T and R16C3P each import only
-- their own world's lineage plus the shared neutral `R16C3N`; combining them
-- in one file fails to elaborate for the same reason CheckT3/CheckP3 are two
-- files instead of one).
import R16C3T

open R16C3

#check @packGeneral_lawful
