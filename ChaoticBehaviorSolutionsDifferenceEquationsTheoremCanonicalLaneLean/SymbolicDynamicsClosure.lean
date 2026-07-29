import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure SymbolicDynamicsPackage where
  alphabet : Type
  shiftMap : (ℕ → alphabet) → (ℕ → alphabet)
  periodicPoints : Prop
  mixingProperty : Prop
  entropyPositive : Prop

def SymbolicDynamicsClosed (S : SymbolicDynamicsPackage) : Prop :=
  S.periodicPoints ∧ S.mixingProperty ∧ S.entropyPositive

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse
