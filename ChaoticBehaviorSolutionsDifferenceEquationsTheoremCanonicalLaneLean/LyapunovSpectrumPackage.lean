import ChaoticBehaviorSolutionsDifferenceEquationsTheoremCanonicalLaneLean.DifferenceEquationsAdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDifferenceEquationsTheorem

structure LyapunovSpectrumPackage where
  lyapunovExponents : List ℝ
  lyapunovExponentProperties : Prop
  spectrumClosed : Prop

structure LyapunovSpectrumEvidence (L : LyapunovSpectrumPackage) where
  lyapunovExponentsClosed : L.lyapunovExponentProperties
  spectrumClosedClosed : L.spectrumClosed

def LyapunovSpectrumClosed (L : LyapunovSpectrumPackage) : Prop :=
  L.lyapunovExponentProperties ∧ L.spectrumClosed

theorem lyapunov_spectrum_closed_from_evidence (L : LyapunovSpectrumPackage) (E : LyapunovSpectrumEvidence L) :
    LyapunovSpectrumClosed L := by
  exact And.intro E.lyapunovExponentsClosed E.spectrumClosedClosed

end ChaoticBehaviorSolutionsDifferenceEquationsTheorem
end HautevilleHouse