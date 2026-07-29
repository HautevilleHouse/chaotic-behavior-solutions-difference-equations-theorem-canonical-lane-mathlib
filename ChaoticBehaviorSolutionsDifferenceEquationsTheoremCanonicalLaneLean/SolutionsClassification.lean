import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.ChaoticBehavior

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure SolutionsClassificationPackage where
  chaoticSolutionsCharacterized : Prop
  boundedUnboundedClassified : Prop
  periodicStrangeAttractorsSeparated : Prop

structure SolutionsClassificationEvidence (C : SolutionsClassificationPackage) where
  chaoticSolutionsCharacterizedClosed : C.chaoticSolutionsCharacterized
  boundedUnboundedClassifiedClosed : C.boundedUnboundedClassified
  periodicStrangeAttractorsSeparatedClosed : C.periodicStrangeAttractorsSeparated

def SolutionsClassificationClosed (C : SolutionsClassificationPackage) : Prop :=
  C.chaoticSolutionsCharacterized ∧ C.boundedUnboundedClassified ∧
  C.periodicStrangeAttractorsSeparated

theorem solutions_classification_closed_from_evidence (C : SolutionsClassificationPackage)
    (E : SolutionsClassificationEvidence C) : SolutionsClassificationClosed C := by
  exact And.intro E.chaoticSolutionsCharacterizedClosed
    (And.intro E.boundedUnboundedClassifiedClosed E.periodicStrangeAttractorsSeparatedClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse