import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure LyapunovExponentPackage where
  map : ℝ → ℝ
  orbit : ℕ → ℝ
  exponent : ℝ
  positiveExponent : Prop
  exponentialDivergence : Prop
  chaoticIndicator : Prop

def LyapunovExponentClosed (L : LyapunovExponentPackage) : Prop :=
  L.positiveExponent ∧ L.exponentialDivergence ∧ L.chaoticIndicator

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse
