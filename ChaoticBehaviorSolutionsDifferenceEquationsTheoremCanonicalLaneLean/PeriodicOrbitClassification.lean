import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure PeriodicOrbit (X : Type u) (D : DifferenceEquation X) where
  period : ℕ
  orbit : ℕ → X
  periodicityCondition : Prop

structure PeriodicOrbitClassificationPackage (X : Type u) (D : DifferenceEquation X) where
  periodicOrbitsSet : Type v
  densePeriodicOrbits : Prop
  orbitStabilityTypes : Prop
  bifurcationPeriods : Prop
  shadowingProperty : Prop

structure PeriodicOrbitClassificationEvidence (X : Type u) (D : DifferenceEquation X) (P : PeriodicOrbitClassificationPackage X D) where
  densePeriodicOrbitsClosed : P.densePeriodicOrbits
  orbitStabilityTypesClosed : P.orbitStabilityTypes
  bifurcationPeriodsClosed : P.bifurcationPeriods
  shadowingPropertyClosed : P.shadowingProperty

def PeriodicOrbitClassificationClosed (X : Type u) (D : DifferenceEquation X) (P : PeriodicOrbitClassificationPackage X D) : Prop :=
  P.densePeriodicOrbits ∧ P.orbitStabilityTypes ∧
  P.bifurcationPeriods ∧ P.shadowingProperty

theorem periodic_orbit_classification_closed_from_evidence (X : Type u) (D : DifferenceEquation X) (P : PeriodicOrbitClassificationPackage X D) (E : PeriodicOrbitClassificationEvidence X D P) : PeriodicOrbitClassificationClosed X D P := by
  exact And.intro E.densePeriodicOrbitsClosed
    (And.intro E.orbitStabilityTypesClosed
      (And.intro E.bifurcationPeriodsClosed E.shadowingPropertyClosed))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse
