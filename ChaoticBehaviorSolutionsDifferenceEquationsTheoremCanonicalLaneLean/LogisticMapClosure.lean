import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure LogisticMapPackage where
  r : ℝ
  seed : ℝ
  iterations : ℕ
  orbit : ℕ → ℝ
  sensitiveDependence : Prop
  denseOrbit : Prop
  topologicalTransitivity : Prop

def LogisticMapClosed (L : LogisticMapPackage) : Prop :=
  L.sensitiveDependence ∧ L.denseOrbit ∧ L.topologicalTransitivity

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse
