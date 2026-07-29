import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquations

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure ChaoticBehavior where
  system : DifferenceEquationSystem
  sensitiveDependence : Prop
  topologicalTransitivity : Prop
  densePeriodicOrbits : Prop
  lyapunovExponentPositive : Prop
  sensitiveDependenceClosed : sensitiveDependence
  topologicalTransitivityClosed : topologicalTransitivity
  densePeriodicOrbitsClosed : densePeriodicOrbits
  lyapunovExponentPositiveClosed : lyapunovExponentPositive

structure ChaoticBehaviorEvidence (C : ChaoticBehavior) where
  sensitiveDependenceClosed : C.sensitiveDependence
  topologicalTransitivityClosed : C.topologicalTransitivity
  densePeriodicOrbitsClosed : C.densePeriodicOrbits
  lyapunovExponentPositiveClosed : C.lyapunovExponentPositive

def ChaoticBehaviorClosed (C : ChaoticBehavior) : Prop :=
  C.sensitiveDependence ∧ C.topologicalTransitivity ∧
  C.densePeriodicOrbits ∧ C.lyapunovExponentPositive

theorem chaotic_behavior_closed_from_evidence (C : ChaoticBehavior)
    (E : ChaoticBehaviorEvidence C) : ChaoticBehaviorClosed C := by
  exact And.intro E.sensitiveDependenceClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.densePeriodicOrbitsClosed E.lyapunovExponentPositiveClosed))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse