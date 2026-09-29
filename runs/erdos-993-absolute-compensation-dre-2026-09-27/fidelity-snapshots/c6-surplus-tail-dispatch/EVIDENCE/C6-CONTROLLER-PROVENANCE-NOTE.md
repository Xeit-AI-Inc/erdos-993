# Controller source-provenance check

The producer REPORT truncates the final hexadecimal character of the original Jensen source SHA. The actual SHA256, bound in the contract and independently rehashed, is `a0f07019b366cb194ddd031df0f9f963f2a051f548354349e016aceab6d23e3f`. This is a prose transcription error; no source or contract byte is changed.

All42reused declaration statements and proof bodies match the prior governed registered fragments, modulo outer whitespace and the authorized theorem-to-lemma keyword change for the reused terminal. The opening `open scoped BigOperators` moved from the old first definition to the new first definition e993TailB; it has identical global effect and is not a declaration-body change. An initial whole-fragment comparison correctly noticed this opening relocation; subsequent explicit comparison confirms every reused declaration. The original producer report remains sealed unchanged.
