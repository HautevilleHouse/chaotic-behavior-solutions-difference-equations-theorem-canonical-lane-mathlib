import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure DifferenceAdmittedObject where
  stateSpace : Type
  dynamics : stateSpace → stateSpace
  initialCondition : stateSpace
  orbitStability : Prop
  lyapunovExponentFinite : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : DifferenceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChaoticWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse