import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.SensitiveDependence

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure TopologicalTransitivityPackage {L : LyapunovSpectrumPackage} {P : PeriodicOrbitClassificationPackage L}
    (S : SensitiveDependencePackage P) where
  transitiveOrbit : Prop
  denseOrbit : Prop
  transitivityClosed : Prop

structure TopologicalTransitivityEvidence {L : LyapunovSpectrumPackage} {P : PeriodicOrbitClassificationPackage L}
    {S : SensitiveDependencePackage P} (T : TopologicalTransitivityPackage S) where
  transitiveOrbitClosed : T.transitiveOrbit
  denseOrbitClosed : T.denseOrbit
  transitivityClosedClosed : T.transitivityClosed

def TopologicalTransitivityClosed {L : LyapunovSpectrumPackage} {P : PeriodicOrbitClassificationPackage L}
    {S : SensitiveDependencePackage P} (T : TopologicalTransitivityPackage S) : Prop :=
  T.transitiveOrbit ∧ T.denseOrbit ∧ T.transitivityClosed

theorem topological_transitivity_closed_from_evidence
    {L : LyapunovSpectrumPackage} {P : PeriodicOrbitClassificationPackage L}
    {S : SensitiveDependencePackage P} (T : TopologicalTransitivityPackage S)
    (E : TopologicalTransitivityEvidence T) : TopologicalTransitivityClosed T := by
  exact And.intro E.transitiveOrbitClosed
    (And.intro E.denseOrbitClosed E.transitivityClosedClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse