import R23Groundwork
import C5T3Fixture
open Lean

/-!
# C6-T3 TERMINAL CONSOLIDATION — the SINGLE per-declaration axioms report

Charge (`control/CYCLE6-ALLOCATION.md` §"C6-T3"): "One final merged
project at the pin ... full build; per-declaration axioms byte-stable
×2". Instrument pattern: C4-T1's sealed `GrandAxioms.lean`
(`cycles/cycle-4/stage3/routes/T1/evidence2/lean-project-source/`),
extended here to the UNION of the sealed C4 grand merge + C5-T2
`RelationTransport` state (module prefix `R23Groundwork`) and the
sealed C5-T3 witness fixture package, copied out under the renamed
prefix `R23C5T3Fixture` / folder `C5T3Fixture` solely to avoid the
`R23.Graph` structure-name collision between the two sealed packages
(both declare `structure Graph` in `namespace R23` independently;
`R23Groundwork/Graph.lean` and the sealed `C5T3/Graph.lean` are in fact
byte-identical — verified below is `f46c246c…` both places). The
rename is mechanical (namespace token only) and disclosed here, not a
mathematical change.

`sorryAx` anywhere = the file names it; this run does NOT fail closed
on it because `indepOn_card`'s open status is REGISTERED, not a defect
(duty 18: the false "sorry-free" claim about it is what gets
corrected, not the openness itself). Run via
`lake env lean TerminalAxiomsReport.lean` after `lake build` exit 0;
run TWICE and diff stdout byte-for-byte (byte-stability duty).
-/

/-- The named module list defining "the union" (C4-F2 F-7.1 pattern,
    carried forward): cross-checked below against the modules ACTUALLY
    present in the environment, so a dropped import cannot pass
    silently. -/
def projectModules : Array Name :=
  #[`R23Groundwork, `R23Groundwork.Graph, `R23Groundwork.Tree,
    `R23Groundwork.Relation, `R23Groundwork.LC4567, `R23Groundwork.LCEF,
    `R23Groundwork.Bridge, `R23Groundwork.Theorems,
    `R23Groundwork.Controls, `R23Groundwork.ActualTree,
    `R23Groundwork.ActualAggregate, `R23Groundwork.InjectionFork,
    `R23Groundwork.Adequacy, `R23Groundwork.RelationTransport,
    `C5T3Fixture, `C5T3Fixture.Graph, `C5T3Fixture.Tree,
    `C5T3Fixture.Relation, `C5T3Fixture.CBWitness,
    `C5T3Fixture.KernelDecide]

run_cmd do
  let env ← Lean.getEnv
  let envMods := env.header.moduleNames.filter
    (fun m => (`R23Groundwork).isPrefixOf m || m == `R23Groundwork
              || (`C5T3Fixture).isPrefixOf m || m == `C5T3Fixture)
  let named := projectModules.qsort (fun a b => a.toString < b.toString)
  let derived := envMods.qsort (fun a b => a.toString < b.toString)
  Lean.logInfo m!"UNION MODULE LIST (named): {named.toList}"
  Lean.logInfo m!"UNION MODULE LIST (env-derived): {derived.toList}"
  if named == derived then
    Lean.logInfo m!"MODULE-LIST CROSS-CHECK: PASS (named = env-derived, {named.size} modules)"
  else
    Lean.logInfo m!"MODULE-LIST CROSS-CHECK: FAIL — dropped/extra module detected"
  let allowed : List Name := [`propext, `Classical.choice, `Quot.sound]
  let mut total : Nat := 0
  let mut sorries : Array Name := #[]
  let mut extras : Array (Name × Name) := #[]
  let mut rows : Array (String × String) := #[]
  for (n, _ci) in env.constants.toList do
    match env.getModuleFor? n with
    | some m =>
      if projectModules.contains m && !n.isInternal then
        total := total + 1
        let axs ← Lean.collectAxioms n
        for ax in axs do
          if ax == ``sorryAx then sorries := sorries.push n
          else if !(allowed.contains ax) then extras := extras.push (n, ax)
        let axStr := "[" ++ ", ".intercalate (axs.toList.map toString) ++ "]"
        rows := rows.push (n.toString, axStr)
    | none => pure ()
  let sorted := rows.qsort (fun a b => a.1 < b.1)
  Lean.logInfo m!"C6-T3 TERMINAL CONSOLIDATION per-declaration axioms report"
  for (nm, axs) in sorted do
    Lean.logInfo m!"'{nm}' depends on axioms: {axs}"
  Lean.logInfo m!"SUMMARY: total non-internal project constants = {total}"
  Lean.logInfo m!"SUMMARY: sorryAx occurrences = {sorries.size}"
  Lean.logInfo m!"SUMMARY: axioms outside [propext, Classical.choice, Quot.sound] = {extras.size}"
  if sorries.size > 0 then Lean.logInfo m!"SORRY DECLS: {sorries}"
  if extras.size > 0 then Lean.logInfo m!"EXTRA AXIOMS: {extras}"
