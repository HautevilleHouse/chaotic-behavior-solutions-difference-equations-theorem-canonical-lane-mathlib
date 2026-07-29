import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure DifferenceEquation (X : Type u) where
  stateSpace : Type u
  timeStep : ℕ
  evolution : X → X
  initialCondition : X

structure ChaoticBehaviorPackage (X : Type u) (D : DifferenceEquation X) where
  sensitivityToInitialConditions : Prop
  topologicalTransitivity : Prop
  densePeriodicPoints : Prop
  lyapunovExponentPositive : Prop
  chaoticityDegree : Prop

structure ChaoticBehaviorEvidence (X : Type u) (D : DifferenceEquation X) (C : ChaoticBehaviorPackage X D) where
  sensitivityClosed : C.sensitivityToInitialConditions
  topologicalTransitivityClosed : C.topologicalTransitivity
  densePeriodicPointsClosed : C.densePeriodicPoints
  lyapunovExponentPositiveClosed : C.lyapunovExponentPositive
  chaoticityDegreeClosed : C.chaoticityDegree

def ChaoticBehaviorClosed (X : Type u) (D : DifferenceEquation X) (C : ChaoticBehaviorPackage X D) : Prop :=
  C.sensitivityToInitialConditions ∧ C.topologicalTransitivity ∧
  C.densePeriodicPoints ∧ C.lyapunovExponentPositive ∧ C.chaoticityDegree

theorem chaotic_behavior_closed_from_evidence (X : Type u) (D : DifferenceEquation X) (C : ChaoticBehaviorPackage X D) (E : ChaoticBehaviorEvidence X D C) : ChaoticBehaviorClosed X D C := by
  exact And.intro E.sensitivityClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.densePeriodicPointsClosed
        (And.intro E.lyapunovExponentPositiveClosed E.chaoticityDegreeClosed)))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse
