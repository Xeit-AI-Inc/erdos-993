# C6 controller clarification: computational telemetry

F2 correctly identifies a wording conflict: the older generic worker protocol broadly forbids wall-clock fields in artifacts, while the later frozen C6 instrument protocol explicitly requires per-layer elapsed times and the shared runner's source/interpreter/timing receipts.

Controller ruling: the specific C6 instrument requirements are the authorized exception for the two finite-prefix implementations. Preserve the unmodified transport receipts and required checkpoint telemetry. They are execution evidence only, with no mathematical status authority. The exact RETURN.json schema remains unchanged and must not acquire extra timestamp or authoritative-hash fields. Source checksums in instrument transport evidence record bytes; they do not certify claim status. The shared runner is controller-authored and its receipts remain distinguishable from proposed mathematical returns.

This clarifies the already frozen specific requirement; it changes no mathematical predicate, horizon, independence rule, time cap, source hash, return schema or completed result. Old manifests and worker sources remain unchanged. The controller and final independent reviewer must check cumulative3600second compliance, same source/protocol across shards, exact full coverage, and source immutability themselves, because the transport runner enforces only each invocation's1800second cap.

This clarification is controller closeout evidence, not a mid-search amendment to the275-member source packet. The final independent review will receive it explicitly. Any missing required telemetry or incomplete coverage still needs an honest disposition; the wording conflict alone is not a mathematical counterexample or a new claim-registry identity.
