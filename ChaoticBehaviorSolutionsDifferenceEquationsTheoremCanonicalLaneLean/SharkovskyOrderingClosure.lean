import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure SharkovskyOrderingPackage where
  intervalMap : ℝ → ℝ
  periodicPoints : ℕ → Set ℝ
  orderingRespected : Prop
  periodThreeImpliesChaos : Prop
  liYorkeChaos : Prop

def SharkovskyOrderingClosed (S : SharkovskyOrderingPackage) : Prop :=
  S.orderingRespected ∧ S.periodThreeImpliesChaos ∧ S.liYorkeChaos

structure SharkovskyOrderingEvidence (S : SharkovskyOrderingPackage) where
  orderingRespectedClosed : S.orderingRespected
  periodThreeImpliesChaosClosed : S.periodThreeImpliesChaos
  liYorkeChaosClosed : S.liYorkeChaos

theorem sharkovsky_ordering_closed_from_evidence (S : SharkovskyOrderingPackage) (E : SharkovskyOrderingEvidence S) : SharkovskyOrderingClosed S := by
  exact And.intro E.orderingRespectedClosed (And.intro E.periodThreeImpliesChaosClosed E.liYorkeChaosClosed)

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse
