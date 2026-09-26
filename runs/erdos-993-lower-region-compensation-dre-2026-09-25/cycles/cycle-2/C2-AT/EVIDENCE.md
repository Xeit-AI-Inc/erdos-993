# C2-AT evidence and replay record

## Sealed source inventory check

The two authorized packets were read before any source. A foreground SHA-256 pass read exactly their listed files: `C2-COMMON.json` listed 27 files and `C2-AT.json` listed 49 files; all 76 digests matched and no listed file was missing. The case source returns contain seven unique IDs, exactly:

1. `C2-T1-SHELL-ORDERED-ROOT-SUBCLASS`
2. `C2-T3-shell-root-shadow`
3. `C2-T4-PATH-OCCUPANCY`
4. `C2-T5-PENDANT-P2-RECURRENCE`
5. `C2-T6.relative-chain-rank-reduction`
6. `E993-LOWER-REGION-FIRST-ORDER-SHELL`
7. `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`

The six route returns and twelve critic returns were read. The route reports and their listed evidence files were read; each critic report was inspected. The two packets' files, the listed common sources, and exact case files are the only local premises. The relevant case dependence is route/critic pairs `C2-T1` with `C2-CF-T1`,`C2-CU-T1`; analogously T2 through T6. The accepted graph classification is the exact registered claim in `control/C2-REGISTERED-CLAIM-IDENTITY.json`, at order (2r+2), rank (r\ge1), and is applied only with (r=k-1) to an order-(2k) residual.

## Independent bounded path replay

The following exact-integer, deterministic loop was run in the foreground. Its generation boundary is paths on (4\le n\le150), with every integer (p) satisfying both displayed guards for each path. There is no random seed. The zero-extended `i` function includes the terminal descent in `x`.

```python
from math import comb
def i(m,j):
    return comb(m-j+1,j) if 0 <= j <= (m+1)//2 else 0
def x(n):
    return next(j for j in range(n+1) if i(n,j+1)-i(n,j)<0)
rows=[]
for n in range(4,151):
    a=(n+1)//2
    for p in range(x(n)+2,a+1):
        if 3*p < 2*a+1:
            rows.append((n,p,2*(i(n-4,p-1)-i(n-4,p-2))))
print(len(rows),len({n for n,p,s in rows}),min(s for n,p,s in rows),
      max(s for n,p,s in rows),sum(s>0 for n,p,s in rows))
```

Output: `449 117 -140598451215242502192647212080 -38896 0`. This replays the path formula, not an exhaustive tree census. The universal path conclusion comes from the ratio proof in `REPORT.md`.

## Specific critic disagreement and rank-domain repair

`C2-CF-T3` considered the registered first-wide classification only with (G=H_v), (r=k), then stated it did not apply to order-(2k) boundary parts. Those parts satisfy (|J|=2k=2(k-1)+2), and their disputed difference is (i_k(J)-i_{k-1}(J)=\Delta_{k-1}(J)). Because eligibility gives (p\ge3), (k-1\ge1). The registered theorem therefore applies exactly with (r=k-1), as `C2-CF-T1` and `C2-CU-T1` observed. It says a positive boundary part has at most one edge; it says nothing about the *sum* of boundary parts and negative parts. This corrects the local applicability claim without upgrading the full shell.

`C2-T1` stated (k i_k(J)\le(N-k+1)i_{k-1}(J)) without an explicit out-of-range qualification. The deletion incidence proof applies when (k\le N); when (k>N), (i_k(J)=0) and the target comparison follows directly. This repairs the proof at zero-extended ranks and leaves both T1/T3 sufficient conclusions intact.
