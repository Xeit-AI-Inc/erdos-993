import R16C3P

/-!
Axiom audit, P-world side (this module may not see the T-world; `CheckT4`
audits the other side). The integration consumes the constructor ONLY as the
composed object of FC-R16-5 §(b) — L1–L7 + LAW IV′ on the closed data triple
— so the sealed IV′ half is re-audited at this build even though the T-side
wiring cannot import it (the clash of record). Raw `#print axioms`
transcripts are the receipts of record.
-/

#print axioms R16C3.lawIVPrime_components
