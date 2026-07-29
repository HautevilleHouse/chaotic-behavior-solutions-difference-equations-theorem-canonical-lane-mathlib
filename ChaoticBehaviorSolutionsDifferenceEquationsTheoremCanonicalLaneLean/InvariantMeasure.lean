import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquationSystem

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure InvariantMeasure {D : DifferenceEquationSystem} where
  measureSpace : Type u
  sigmaAlgebra : Set (Set D.stateSpace)
  measure : Set D.stateSpace → ℝ
  invariantUnderEvolution : Prop
  ergodicProperty : Prop
  absolutelyContinuousWithRespectToLebesgue : Prop
  supportContainsAttractor : Prop
  invariantUnderEvolutionTerm : invariantUnderEvolution
  ergodicPropertyTerm : ergodicProperty
  absolutelyContinuousWithRespectToLebesgueTerm : absolutelyContinuousWithRespectToLebesgue
  supportContainsAttractorTerm : supportContainsAttractor

structure InvariantMeasureEvidence {D : DifferenceEquationSystem} (M : InvariantMeasure D) where
  invariantUnderEvolutionClosed : M.invariantUnderEvolution
  ergodicPropertyClosed : M.ergodicProperty
  supportContainsAttractorClosed : M.supportContainsAttractor

def InvariantMeasureClosed {D : DifferenceEquationSystem} (M : InvariantMeasure D) : Prop :=
  M.invariantUnderEvolution ∧ M.ergodicProperty ∧ M.supportContainsAttractor

theorem invariant_measure_closed_from_evidence {D : DifferenceEquationSystem}
    (M : InvariantMeasure D) (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro E.invariantUnderEvolutionClosed
    (And.intro E.ergodicPropertyClosed E.supportContainsAttractorClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse