import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquationSystem

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure SensitiveDependence {D : DifferenceEquationSystem} where
  sensitivityConstant : ℝ
  separationConstant : ℝ
  iterationBound : ℕ
  sensitiveOnOpenSet : Prop
  denseOrbitExists : Prop
  topologicalTransitivity : Prop
  sensitiveOnOpenSetTerm : sensitiveOnOpenSet
  denseOrbitExistsTerm : denseOrbitExists
  topologicalTransitivityTerm : topologicalTransitivity
  sensitivityPositive : sensitivityConstant > 0
  separationPositive : separationConstant > 0

structure SensitiveDependenceEvidence {D : DifferenceEquationSystem} (S : SensitiveDependence D) where
  sensitiveOnOpenSetClosed : S.sensitiveOnOpenSet
  denseOrbitExistsClosed : S.denseOrbitExists
  topologicalTransitivityClosed : S.topologicalTransitivity

def SensitiveDependenceClosed {D : DifferenceEquationSystem} (S : SensitiveDependence D) : Prop :=
  S.sensitiveOnOpenSet ∧ S.denseOrbitExists ∧ S.topologicalTransitivity

theorem sensitive_dependence_closed_from_evidence {D : DifferenceEquationSystem}
    (S : SensitiveDependence D) (E : SensitiveDependenceEvidence S) : SensitiveDependenceClosed S := by
  exact And.intro E.sensitiveOnOpenSetClosed
    (And.intro E.denseOrbitExistsClosed E.topologicalTransitivityClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse