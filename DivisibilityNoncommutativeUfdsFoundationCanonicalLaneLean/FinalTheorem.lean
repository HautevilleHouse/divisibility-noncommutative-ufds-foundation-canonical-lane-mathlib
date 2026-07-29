import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

def ConstrainedNoncommutativeUFDClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_noncommutative_ufd_endgame (A : AdmissibleClass) :
    ConstrainedNoncommutativeUFDClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
