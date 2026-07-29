import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquationSystem

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure BifurcationParameter where
  paramSpace : Type u
  criticalValues : Set paramSpace
  description : String

default paramSpace := ℝ

structure BifurcationAnalysis {D : DifferenceEquationSystem} (P : BifurcationParameter) where
  parametericFamily : D.stateSpace → D.stateSpace
  bifurcationsDetected : Prop
  periodDoublingRoute : Prop
  intermittencyRoute : Prop
  crisisRoute : Prop
  bifurcationDiagramComputed : Prop
  bifurcationsDetectedTerm : bifurcationsDetected
  periodDoublingRouteTerm : periodDoublingRoute
  intermittencyRouteTerm : intermittencyRoute
  crisisRouteTerm : crisisRoute
  bifurcationDiagramComputedTerm : bifurcationDiagramComputed
  criticalValuesIdentified : ∀ p : P.paramSpace, p ∈ P.criticalValues → bifurcationsDetected

structure BifurcationAnalysisEvidence {D : DifferenceEquationSystem} {P : BifurcationParameter}
    (B : BifurcationAnalysis D P) where
  bifurcationsDetectedClosed : B.bifurcationsDetected
  bifurcationDiagramComputedClosed : B.bifurcationDiagramComputed

def BifurcationAnalysisClosed {D : DifferenceEquationSystem} {P : BifurcationParameter}
    (B : BifurcationAnalysis D P) : Prop :=
  B.bifurcationsDetected ∧ B.bifurcationDiagramComputed

theorem bifurcation_analysis_closed_from_evidence {D : DifferenceEquationSystem} {P : BifurcationParameter}
    (B : BifurcationAnalysis D P) (E : BifurcationAnalysisEvidence B) : BifurcationAnalysisClosed B := by
  exact And.intro E.bifurcationsDetectedClosed E.bifurcationDiagramComputedClosed

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse