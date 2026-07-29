import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure StabilityBifurcationPackage where
  mapFamily : Type u
  parameterSpace : Type v
  fixedPoints : Prop
  bifurcationDiagram : Prop
  periodDoublingRoute : Prop
  stabilityRegions : Prop
  liapunovExponents : Prop

structure StabilityBifurcationEvidence (S : StabilityBifurcationPackage) where
  fixedPointsClosed : S.fixedPoints
  bifurcationDiagramClosed : S.bifurcationDiagram
  periodDoublingRouteClosed : S.periodDoublingRoute
  stabilityRegionsClosed : S.stabilityRegions
  liapunovExponentsClosed : S.liapunovExponents

def StabilityBifurcationClosed (S : StabilityBifurcationPackage) : Prop :=
  S.fixedPoints ∧ S.bifurcationDiagram ∧ S.periodDoublingRoute ∧
  S.stabilityRegions ∧ S.liapunovExponents

theorem stability_bifurcation_closed_from_evidence
    (S : StabilityBifurcationPackage) (E : StabilityBifurcationEvidence S) :
    StabilityBifurcationClosed S := by
  exact And.intro E.fixedPointsClosed
    (And.intro E.bifurcationDiagramClosed
      (And.intro E.periodDoublingRouteClosed
        (And.intro E.stabilityRegionsClosed E.liapunovExponentsClosed)))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse