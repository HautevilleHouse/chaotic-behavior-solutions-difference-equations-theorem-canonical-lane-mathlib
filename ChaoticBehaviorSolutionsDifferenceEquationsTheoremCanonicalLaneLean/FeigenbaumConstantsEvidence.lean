import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure FeigenbaumConstantsPackage where
  delta : ℝ
  alpha : ℝ
  universality : Prop
  scalingLaws : Prop
  convergenceRate : Prop

def FeigenbaumConstantsClosed (F : FeigenbaumConstantsPackage) : Prop :=
  F.universality ∧ F.scalingLaws ∧ F.convergenceRate

structure FeigenbaumConstantsEvidence (F : FeigenbaumConstantsPackage) where
  universalityClosed : F.universality
  scalingLawsClosed : F.scalingLaws
  convergenceRateClosed : F.convergenceRate

theorem feigenbaum_constants_closed_from_evidence (F : FeigenbaumConstantsPackage) (E : FeigenbaumConstantsEvidence F) : FeigenbaumConstantsClosed F := by
  exact And.intro E.universalityClosed (And.intro E.scalingLawsClosed E.convergenceRateClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse
