import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure DifferenceEquationSystem where
  stateSpace : Type u
  timeStep : ℕ → ℕ
  evolutionMap : stateSpace → stateSpace
  initialCondition : stateSpace
  recurrenceOrder : ℕ
  linearPart : stateSpace → stateSpace
  nonlinearPerturbation : stateSpace → stateSpace
  boundednessCondition : Prop
  boundednessConditionTerm : boundednessCondition

structure DifferenceEquationSystemEvidence (D : DifferenceEquationSystem) where
  boundednessConditionClosed : D.boundednessCondition
  recurrenceOrderPositive : D.recurrenceOrder ≥ 1
  evolutionMapDecomposed : ∀ x : D.stateSpace, D.evolutionMap x = D.linearPart x + D.nonlinearPerturbation x

def DifferenceEquationSystemClosed (D : DifferenceEquationSystem) : Prop :=
  D.boundednessCondition ∧ D.recurrenceOrder ≥ 1

theorem difference_equation_system_closed_from_evidence (D : DifferenceEquationSystem)
    (E : DifferenceEquationSystemEvidence D) : DifferenceEquationSystemClosed D := by
  exact And.intro E.boundednessConditionClosed E.recurrenceOrderPositive

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse