# r18 Export Assembly Receipts (2026-09-06)

Two packages exported from the terminally sealed r18 run
(`erdos-993-hg2-dre-2026-09-06`, TERMINAL-SEAL `be5cb06f…`): the C3
GATE-1 award (`r18-hg2-faithful`) and the C4 GATE-2 partial award
(`r18-exchange-lemma-seq`). Source modules are byte-identical to the
sealed seats' gated artifacts; the r12/r14 chain modules are the same
vendored sources those seats built against. Both packages rebuilt clean
at export (Lean 4.32.2 f3b06c70 / Mathlib 905b9581, shared store bound
read-only by symlink, `audit_copied_packages` exit 0, zero copied
trees): `lake build R18C3T3` / `R18C4T3` and `lake build Check` all
exit 0. Award scope and refusal legs are stated in each package README
and bind consumers.

| package | module | sha256 (first 32) |
|---|---|---|
| r18-hg2-faithful | Check.lean | `26b277f1e7e017ea065181951c2d5edf` |
| r18-hg2-faithful | R12C6T.lean | `cd9ac7537a458c7006df11c49b7661bf` |
| r18-hg2-faithful | R14C1F.lean | `620c022d5fe66b198e2853c5934b6e4b` |
| r18-hg2-faithful | R14C2T.lean | `2771bf7e30fa0b2693f499487caf30e8` |
| r18-hg2-faithful | R14C3T.lean | `733e5919c720674d8906b86056bb27ee` |
| r18-hg2-faithful | R14C4T.lean | `5860d997d4da97961e4bb7ad166a91f9` |
| r18-hg2-faithful | R18C3T3.lean | `11c0b300fa0b8ca697240dfa17e1cdab` |
| r18-hg2-faithful | R14C1F/AmbientStrata.lean | `3689d59d7ceebce7ba160e2015ad4eba` |
| r18-hg2-faithful | R14C2T/StratumG.lean | `846d11e1dfac138885dbcdf111d5bf89` |
| r18-hg2-faithful | R12C6T/AdjCorr.lean | `694ab54547006092cba3be850537ee29` |
| r18-hg2-faithful | R12C6T/CorridorIngredients.lean | `d846b17d32252c447b09197cf2b051b2` |
| r18-hg2-faithful | R12C6T/CorridorReduction.lean | `46d0605c1c4813fcf81646ec01456f41` |
| r18-hg2-faithful | R12C6T/Deg2Reduction.lean | `6c03350085324a85e7d580abf3714963` |
| r18-hg2-faithful | R12C6T/Targets.lean | `2e30f2114d62a7963fdb69836ab8117c` |
| r18-hg2-faithful | R18C3T3/GateOne.lean | `7f7c61af45bbb340f0c4be907f90f404` |
| r18-hg2-faithful | R14C4T/ShadowBand.lean | `86ed073fce05ac699efc62923ac4b868` |
| r18-hg2-faithful | R14C3T/G2Slack.lean | `a90445f076600bf2b42961ab9837168e` |
| r18-hg2-faithful | Check/Axioms.lean | `60a5bb109a45825655f4f27c6c9db7c7` |
| r18-exchange-lemma-seq | Check.lean | `26b277f1e7e017ea065181951c2d5edf` |
| r18-exchange-lemma-seq | R12C6T.lean | `cd9ac7537a458c7006df11c49b7661bf` |
| r18-exchange-lemma-seq | R14C1F.lean | `620c022d5fe66b198e2853c5934b6e4b` |
| r18-exchange-lemma-seq | R14C2T.lean | `2771bf7e30fa0b2693f499487caf30e8` |
| r18-exchange-lemma-seq | R14C3T.lean | `733e5919c720674d8906b86056bb27ee` |
| r18-exchange-lemma-seq | R14C4T.lean | `5860d997d4da97961e4bb7ad166a91f9` |
| r18-exchange-lemma-seq | R18C4T3.lean | `436ac05defd98d762e8680c68c950c20` |
| r18-exchange-lemma-seq | R14C1F/AmbientStrata.lean | `3689d59d7ceebce7ba160e2015ad4eba` |
| r18-exchange-lemma-seq | R14C2T/StratumG.lean | `846d11e1dfac138885dbcdf111d5bf89` |
| r18-exchange-lemma-seq | R12C6T/AdjCorr.lean | `694ab54547006092cba3be850537ee29` |
| r18-exchange-lemma-seq | R12C6T/CorridorIngredients.lean | `d846b17d32252c447b09197cf2b051b2` |
| r18-exchange-lemma-seq | R12C6T/CorridorReduction.lean | `46d0605c1c4813fcf81646ec01456f41` |
| r18-exchange-lemma-seq | R12C6T/Deg2Reduction.lean | `6c03350085324a85e7d580abf3714963` |
| r18-exchange-lemma-seq | R12C6T/Targets.lean | `2e30f2114d62a7963fdb69836ab8117c` |
| r18-exchange-lemma-seq | R14C4T/ShadowBand.lean | `86ed073fce05ac699efc62923ac4b868` |
| r18-exchange-lemma-seq | R18C4T3/ClosedForms.lean | `447e92286eec6ed2d22449ee982cf883` |
| r18-exchange-lemma-seq | R18C4T3/ExchangeLemma.lean | `2d8b36cacb986c529f9a5fbb88e9fedf` |
| r18-exchange-lemma-seq | R18C4T3/GovernedCore.lean | `41ff04f27dd236e37b353f49a69b0351` |
| r18-exchange-lemma-seq | R14C3T/G2Slack.lean | `a90445f076600bf2b42961ab9837168e` |
| r18-exchange-lemma-seq | Check/Axioms.lean | `c5f19489673c24fadb05ac967240649f` |
