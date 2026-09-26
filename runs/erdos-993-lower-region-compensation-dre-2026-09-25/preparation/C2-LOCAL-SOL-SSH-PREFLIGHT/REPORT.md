# C2-LOCAL-SOL-SSH-PREFLIGHT — proposed transport result

The two source files listed in the brief matched their pinned SHA256 hashes. I executed the pinned `probe.py` once, unchanged. It exited with status 255. The SSH subprocess returned no remote stdout. The probe printed its captured SSH stderr as:

```text
dial tcp: lookup ssh.xeit.ai: no such host
Connection closed by UNKNOWN port 65535
```

The pinned local contract identifies `e993-c2-order-band-pair-v2`, terminal declaration `E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand`, and SHA256 `007997997fb2c2aebf976cac6fcf5f1a25960a3f5776c798d517f79e045b4bc7`. The probe returned no remote contract fields, so none of those three values can be compared with the remote file. The observed DNS lookup failure blocked the authorized SSH read.

This is a transport result only. It gives no evidence about the remote contract's contents, theorem validity, or Lean verification. No mathematical conclusion follows from the failed read. This report is a proposal to the controller.
