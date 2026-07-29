import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.factorizationClosed ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
