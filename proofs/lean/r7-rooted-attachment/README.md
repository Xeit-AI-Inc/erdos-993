# r7 Rooted Attachment Package

Candidate `C4-U1-01-C4-U1-02` proves
`C4U1Attachment.rootedTree_attachment_transition` and
`C4U1Attachment.rootedTree_attachment_coefficients`: explicit root-edge
attachment preserves the exact root-in/root-out transition and coefficient
convolutions through degree five.

Build with `lake build C4U1Attachment`, then run
`lake env lean C4U1Attachment/KernelCheck.lean` and
`lake env lean C4U1Attachment/AxiomCheck.lean`.

It does not supply B4 quotient coverage, a recovering carrier, or any
headline result.
