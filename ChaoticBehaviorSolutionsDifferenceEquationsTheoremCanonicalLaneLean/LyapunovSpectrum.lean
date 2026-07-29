import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquationSystem

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean

structure LyapunovSpectrum {D : DifferenceEquationSystem} where
  lyapunovExponents : List ℝ
  numberOfExponents : ℕ
  positiveExponentCount : ℕ
  zeroExponentCount : ℕ
  negativeExponentCount : ℕ
  sumOfExponents : ℝ
  spectrumComputed : Prop
  spectrumComputedTerm : spectrumComputed
  positiveExponentCountEqualsNumberOfPositive : positiveExponentCount = (lyapunovExponents.filter (λ x => x > 0)).length

structure LyapunovSpectrumEvidence {D : DifferenceEquationSystem} (L : LyapunovSpectrum D) where
  spectrumComputedClosed : L.spectrumComputed
  positiveCountMatches : L.positiveExponentCount = (L.lyapunovExponents.filter (λ x => x > 0)).length

def LyapunovSpectrumClosed {D : DifferenceEquationSystem} (L : LyapunovSpectrum D) : Prop :=
  L.spectrumComputed ∧ (L.positiveExponentCount = (L.lyapunovExponents.filter (λ x => x > 0)).length)

theorem lyapunov_spectrum_closed_from_evidence {D : DifferenceEquationSystem}
    (L : LyapunovSpectrum D) (E : LyapunovSpectrumEvidence L) : LyapunovSpectrumClosed L := by
  exact And.intro E.spectrumComputedClosed E.positiveCountMatches

end ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean
end HautevilleHouse