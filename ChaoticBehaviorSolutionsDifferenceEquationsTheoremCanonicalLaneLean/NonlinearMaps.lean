import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure NonlinearMap where
  domain : Type u
  codomain : Type v
  map : domain → codomain
  continuity : Prop
  differentiability : Prop

structure NonlinearMapEvidence (F : NonlinearMap) where
  continuityClosed : F.continuity
  differentiabilityClosed : F.differentiability

def NonlinearMapClosed (F : NonlinearMap) : Prop :=
  F.continuity ∧ F.differentiability

theorem nonlinear_map_closed_from_evidence (F : NonlinearMap)
    (E : NonlinearMapEvidence F) : NonlinearMapClosed F := by
  exact And.intro E.continuityClosed E.differentiabilityClosed

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse