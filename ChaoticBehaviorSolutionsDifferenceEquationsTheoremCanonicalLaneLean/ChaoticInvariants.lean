import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure ChaoticInvariantsPackage where
  mapFamily : Type u
  parameterSpace : Type v
  topologicalEntropy : Prop
  lyapunovSpectrum : Prop
  correlationDimension : Prop
  kneadingSequence : Prop
  symbolicDynamics : Prop

structure ChaoticInvariantsEvidence (C : ChaoticInvariantsPackage) where
  topologicalEntropyClosed : C.topologicalEntropy
  lyapunovSpectrumClosed : C.lyapunovSpectrum
  correlationDimensionClosed : C.correlationDimension
  kneadingSequenceClosed : C.kneadingSequence
  symbolicDynamicsClosed : C.symbolicDynamics

def ChaoticInvariantsClosed (C : ChaoticInvariantsPackage) : Prop :=
  C.topologicalEntropy ∧ C.lyapunovSpectrum ∧
  C.correlationDimension ∧ C.kneadingSequence ∧ C.symbolicDynamics

theorem chaotic_invariants_closed_from_evidence
    (C : ChaoticInvariantsPackage) (E : ChaoticInvariantsEvidence C) :
    ChaoticInvariantsClosed C := by
  exact And.intro E.topologicalEntropyClosed
    (And.intro E.lyapunovSpectrumClosed
      (And.intro E.correlationDimensionClosed
        (And.intro E.kneadingSequenceClosed E.symbolicDynamicsClosed)))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse