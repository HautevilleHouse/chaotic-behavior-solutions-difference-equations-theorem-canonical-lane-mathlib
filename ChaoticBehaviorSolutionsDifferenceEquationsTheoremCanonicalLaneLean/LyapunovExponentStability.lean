import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure LyapunovExponentPackage (X : Type u) (D : DifferenceEquation X) where
  lyapunovSpectrum : Type v
  largestLyapunovExponent : ℝ
  exponentSign : Prop  -- positive for chaos
  exponentialDivergenceRate : Prop
  stabilityCriterion : Prop

structure LyapunovExponentEvidence (X : Type u) (D : DifferenceEquation X) (L : LyapunovExponentPackage X D) where
  largestLyapunovExponentClosed : L.largestLyapunovExponent > 0
  exponentSignClosed : L.exponentSign
  exponentialDivergenceRateClosed : L.exponentialDivergenceRate
  stabilityCriterionClosed : L.stabilityCriterion

def LyapunovExponentClosed (X : Type u) (D : DifferenceEquation X) (L : LyapunovExponentPackage X D) : Prop :=
  (L.largestLyapunovExponent > 0) ∧ L.exponentSign ∧
  L.exponentialDivergenceRate ∧ L.stabilityCriterion

theorem lyapunov_exponent_closed_from_evidence (X : Type u) (D : DifferenceEquation X) (L : LyapunovExponentPackage X D) (E : LyapunovExponentEvidence X D L) : LyapunovExponentClosed X D L := by
  exact And.intro E.largestLyapunovExponentClosed
    (And.intro E.exponentSignClosed
      (And.intro E.exponentialDivergenceRateClosed E.stabilityCriterionClosed))

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse
