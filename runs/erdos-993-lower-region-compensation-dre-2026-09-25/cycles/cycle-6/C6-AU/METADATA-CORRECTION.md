# C6-AU return metadata correction

`RETURN-ORIGINAL-ORIENTATION-U.json` preserves the first completed return. Its `orientation` value was `U`, identifying the origin of the six reviewed routes. The case packet and `WORKER-PROTOCOL.md` require `N` for an adjudicator's return metadata. `RETURN.json` now has `orientation: "N"`. No claim statement, scope, status, reason, evidence path, coverage ID, limitation, or mathematical disposition was changed.
