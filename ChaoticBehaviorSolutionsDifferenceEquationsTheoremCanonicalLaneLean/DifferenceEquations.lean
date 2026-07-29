import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.NonlinearMaps

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure DifferenceEquationSystem where
  stateSpace : Type u
  timeDomain : Type v
  evolutionMap : stateSpace → stateSpace
  initialCondition : stateSpace
  orbit : ℕ → stateSpace
  orbitDefined : ∀ n, orbit (n+1) = evolutionMap (orbit n)
  orbitInitial : orbit 0 = initialCondition

structure DifferenceEquationEvidence (D : DifferenceEquationSystem) where
  orbitDefinedClosed : D.orbitDefined
  orbitInitialClosed : D.orbitInitial

def DifferenceEquationClosed (D : DifferenceEquationSystem) : Prop :=
  D.orbitDefined ∧ D.orbitInitial

theorem difference_equation_closed_from_evidence (D : DifferenceEquationSystem)
    (E : DifferenceEquationEvidence D) : DifferenceEquationClosed D := by
  exact And.intro E.orbitDefinedClosed E.orbitInitialClosed

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse