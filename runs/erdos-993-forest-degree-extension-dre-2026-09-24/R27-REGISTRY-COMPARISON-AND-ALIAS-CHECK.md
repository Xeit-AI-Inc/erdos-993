# r27 record — registry comparison and alias check (2026-09-24)

As confirmed by SR-REC (verdict RE-4 confirmed_with_repairs). The controller re-runs the alias check on every key actually registered at the close (`control/register_c1_close.py` asserts no key/alias collision against the 370 prior identities).

### `RE-4` — register

```
record:     Registry comparison table and alias-check result (r27 Cycle 1).
alias check, replayed independently by the isolated second read against control/CLAIM-IDENTITY.run-local.json
            (sha256 47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2; 370 claims, 214
            VERIFIED / 89 REFUTED / 41 OPEN / 26 CONDITIONAL; 452 aliases entries; 132 alias_patterns):
            ZERO exact claim_key collisions, ZERO exact alias matches and ZERO alias_pattern matches, both
            for every E993-R27-* candidate name occurring anywhere in the capsule and for plain-language
            renderings of every statement proposed for registration this cycle. The result is
            name-independent and therefore stronger than a per-name sweep: NO registered claim_key contains
            "R27" at all, so no key in the E993-R27-* namespace can collide, however many are coined. No
            registered statement field asserts a degree lemma, an extension inequality, a double-counting
            identity, an incident-degree bound, a linear 4k order bound, a rank-5 ceiling of 20, or a 4r-4
            descent restriction. Every E993-R27-* candidate is a genuinely new identity.
            [The synthesis's literal "eleven candidate key names" is unbacked by the capsule, which holds ten
            distinct E993-R27-* names, one of them a next-cycle target. Drop the count; the namespace-wide
            result above replaces it.]
comparison (each row read at the exact key, each arithmetic comparison checked):
  E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP  VERIFIED, Delta_k < 0 => n <= (k+1)^2 for k >= 1.
      (k+1)^2 - 4k = (k-1)^2 >= 0, zero iff k = 1: (LB) at least as strong at every k, strictly stronger for
      k != 1, and additionally covers k = 0, which this award's scope excludes.
  E993-R25-FOREST-ORDER-BOUND-SHARPENED      VERIFIED, Delta_k < 0 => n <= k^2+k+3 for k >= 2.
      k^2+k+3 - 4k = k^2-3k+3 > 0 for every k (discriminant -3): (LB) strictly dominates at every k >= 2.
  E993-R25-SECOND-ORDER-TWO-SIDED-CEILING    VERIFIED, Delta_4 < 0 => n <= 19 and Delta_5 < 0 => n <= 29.
      (LB) gives 16 and 20: strictly stronger at both ranks.
  E993-R25-RANK5-CEILING-SHARPENED-TO-25     VERIFIED, Delta_5 < 0 => n <= 25. (R5) gives 20; the residue
      stated on this claim's own scope field is empty (see the rank-5 residue closeout record).
  E993-R25-KADDITION-CLOSURE-X-LE-4          VERIFIED, x <= 4, no order bound in the hypothesis; extended to
      x <= 5 by E993-R27-KADDITION-CLOSURE-X-LE-5.
  E993-R25-UNR-FOREST-WIDE                   OPEN. Untouched; no truth value asserted; no status transferred.
  E993-G1WIDE-NO-SIZE-CAP                    OPEN. Untouched.
  E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER  REFUTED. The key carries NO R25- segment (erratum R27-E-c
      sustained). Premise nowhere.
  E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY  REFUTED, at its own statement; its stored
      certificate re-derived independently (K_{1,3} and P_4, both with x = 1, union with x = 3). Its stored
      scope field contains NO K1 carve-out; the K1 instance is untouched by the refutation for the logical
      reason that a universal refuted by one witness pair says nothing about a proper sub-family.
grade:      record. Every one of the compared claims STAYS REGISTERED at its own statement; this is a
            comparison, never a supersession, and the formal grade of the (k+1)^2 award is untouched.
attribution: Stage 6 synthesis (the table); isolated second read SR-REC (independent replay of the alias
            check and of every exact-key read and arithmetic comparison above).
```

---

